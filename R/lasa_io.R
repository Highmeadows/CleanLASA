# Generic LASA SPSS reader and label audit tools.
#
# This file is data-file independent: `read_lasa_sav()` reads a LASA `.sav`
# file, identifies its wave and file code from the file name
# (`.lasa_parse_filename()`), and labels it via the database-driven engine
# in `.lasa_apply_labels()` (R/lasa_apply_labels.R), which looks up
# variable/value-label metadata from `lasa_label_db()` instead of a
# hand-written, file-specific function. The reshaping helpers below
# (`.lasa_convert_to_labelled_factor()`, `.lasa_restore_plain_numeric()`,
# `.lasa_standardize_respnr()`, `.lasa_insert_wave_column()`,
# `.lasa_is_codebook_numeric()`) are shared by that engine.
#
# Shared parameter contract
# --------------------------------------------------------------------------
# `read_lasa_sav()` and `apply_lasa_labels()` both accept the same five
# "reshaping" arguments, in addition to `data` and a wave/file-code
# identifying argument:
#
#   * name_corrections  - named character vector overriding automatic column
#                          matching for specific variables.
#   * to_factor         - convert categorical (value-labelled) variables to
#                          factors instead of leaving them numeric.
#   * to_numeric        - restore count/continuous variables to plain
#                          numeric (dropping their missing-code value
#                          labels), converting negative codes to NA.
#   * standardize_names - rename matched columns to their canonical
#                          lowercase LASA documentation name. Always implies
#                          `split_wavecode = TRUE` (see below), regardless of
#                          the `split_wavecode` argument the caller supplied.
#   * split_wavecode    - move the wave-letter prefix out of variable names
#                          and into its own "LASA_wave" column, inserted
#                          right after the (also standardized) "respnr"
#                          column.
#
# Regardless of these arguments, matched variables always keep their
# original SPSS value coding available as reference attributes ("labels" /
# an "_original" variant), so R output can be cross-checked against another
# program's (e.g. SPSS) coding even after to_numeric/to_factor reshaping.

#' Assert that a value is a single, non-missing TRUE/FALSE
#'
#' Small internal validator shared by the argument-checking code in this
#' file and by every `apply_*_labels()` function in the package, so the same
#' error message format is used everywhere a scalar logical argument (such
#' as `to_factor`, `to_numeric`, or `standardize_names`) is required.
#'
#' @param x The value to check.
#' @param name Character scalar: the argument name to use in the error
#'   message.
#'
#' @return Invisibly `NULL`. Called for its side effect of raising an error
#'   when `x` is not a scalar logical.
#' @keywords internal
.lasa_assert_scalar_logical <- function(x, name) {
  if (length(x) != 1L || is.na(x) || !is.logical(x)) {
    stop("'", name, "' must be TRUE or FALSE.", call. = FALSE)
  }
  invisible(NULL)
}

#' Assert that a value is a valid `name_corrections` argument
#'
#' Shared validator for the `name_corrections` argument used by
#' [read_lasa_sav()] and [apply_lasa_labels()]. A valid `name_corrections`
#' is either `NULL`, or a named character vector
#' mapping canonical LASA variable suffixes to the actual column names found
#' in a user's data, for example `c(lphya08 = "BLPYA08")`.
#'
#' @param x The value to check.
#'
#' @return Invisibly `NULL`. Called for its side effect of raising an error
#'   when `x` is neither `NULL` nor a validly named character vector.
#' @keywords internal
.lasa_assert_name_corrections <- function(x) {
  if (is.null(x)) {
    return(invisible(NULL))
  }

  if (!is.character(x) || is.null(names(x)) || any(names(x) == "")) {
    stop(
      "'name_corrections' must be NULL or a named character vector, e.g. ",
      "c(lphya08 = 'BLPYA08').",
      call. = FALSE
    )
  }

  invisible(NULL)
}

#' Standardize the "respnr" (respondent number) column name
#'
#' Internal helper shared by every `apply_*_labels()` function in this
#' package. The LASA respondent-number identifier column is present in
#' essentially every LASA data file but is spelled inconsistently across
#' files/waves (e.g. `"RespNr"`, `"RESPNR"`, `"respnr"`). This helper finds
#' it by an exact, then case-insensitive, name match and -- only when
#' `standardize_names = TRUE` -- renames it to the canonical lowercase
#' spelling `"respnr"`.
#'
#' @param data A data frame or tibble that may contain a respondent-number
#'   column.
#' @param standardize_names Logical. If `TRUE`, a matched respnr column is
#'   renamed to `"respnr"`.
#'
#' @return A list with `data` (possibly renamed), `matched_name` (the
#'   original column name found, or `NA_character_` if none was found),
#'   `method` (`"exact"`, `"case-insensitive exact"`, or `"not found"`), and
#'   `respnr_name` (the column's name in the returned `data`: `"respnr"`
#'   when it was renamed, otherwise `matched_name`).
#' @keywords internal
.lasa_standardize_respnr <- function(data, standardize_names = FALSE) {
  idx <- match("respnr", names(data))
  method <- "exact"

  if (is.na(idx)) {
    idx <- match("respnr", tolower(names(data)))
    method <- "case-insensitive exact"
  }

  if (is.na(idx)) {
    return(list(
      data = data,
      matched_name = NA_character_,
      method = "not found",
      respnr_name = NA_character_
    ))
  }

  matched_name <- names(data)[idx]
  respnr_name <- matched_name

  if (isTRUE(standardize_names) && !identical(matched_name, "respnr")) {
    names(data)[idx] <- "respnr"
    respnr_name <- "respnr"
  }

  list(
    data = data,
    matched_name = matched_name,
    method = method,
    respnr_name = respnr_name
  )
}

#' Insert the generic "LASA_wave" column
#'
#' Internal helper shared by every `apply_*_labels()` function in this
#' package. Used when `split_wavecode = TRUE` (which is always the effective
#' setting when `standardize_names = TRUE`, per the shared parameter
#' contract -- see the header comment of this file). Adds a `"LASA_wave"`
#' column filled with `wave`, positioned immediately after the
#' respondent-number column identified by [.lasa_standardize_respnr()]. If
#' that column could not be found, `"LASA_wave"` is inserted at the very
#' front of `data` instead.
#'
#' @param data A data frame or tibble.
#' @param wave Character scalar: the LASA wave code to fill the new column
#'   with, e.g. `"B"`, `"2B"`, `"3B"`.
#' @param respnr_name The name of the respondent-number column in `data`, as
#'   returned by [.lasa_standardize_respnr()], or `NA_character_` if none was
#'   found.
#'
#' @return `data` with a new `"LASA_wave"` column inserted.
#' @keywords internal
.lasa_insert_wave_column <- function(data, wave, respnr_name = NA_character_) {
  respnr_idx <- if (!is.na(respnr_name)) match(respnr_name, names(data)) else NA_integer_
  target_position <- if (!is.na(respnr_idx)) respnr_idx + 1L else 1L

  data[["LASA_wave"]] <- wave
  new_order <- append(
    setdiff(names(data), "LASA_wave"),
    "LASA_wave",
    after = target_position - 1L
  )

  data[, new_order, drop = FALSE]
}

#' Is a codebook's value-label map made up only of missing-reason codes?
#'
#' A variable qualifies for `to_numeric` restoration when every one of its
#' codebook value labels is a negative code (e.g. -1, -2, -3), which is how
#' this package's LASA codebooks mark count/continuous variables whose only
#' labelled values are missing-reason codes. Used by
#' `data-raw/build_lasa_label_db.R`'s `var_type` classification
#' (`"numeric"` vs. `"categorical"`), stored in [lasa_label_db()] rather
#' than re-derived at label-application time.
#'
#' @param value_label_map A named numeric vector of SPSS value labels
#'   (names = label text, values = numeric codes), or `NULL`.
#'
#' @return `TRUE` if `value_label_map` is non-empty and every code in it is
#'   negative; `FALSE` otherwise.
#' @keywords internal
.lasa_is_codebook_numeric <- function(value_label_map) {
  if (is.null(value_label_map) || length(value_label_map) == 0L) {
    return(FALSE)
  }
  codes <- as.numeric(unname(value_label_map))
  all(!is.na(codes) & is.finite(codes) & codes < 0)
}

#' Restore a value-labelled variable to plain numeric
#'
#' Shared `to_numeric = TRUE` transformation used by every
#' `apply_*_labels()` function's `.lasa_label_engine()` instance. Strips any
#' value-label attributes and coerces `x` to an ordinary numeric vector,
#' replacing every negative observed value with `NA` -- including a
#' negative code the codebook did not explicitly label.
#'
#' @param x A (possibly value-labelled) vector.
#'
#' @return A plain numeric vector, the same length as `x`, with negative
#'   values replaced by `NA_real_`.
#' @keywords internal
.lasa_restore_plain_numeric <- function(x) {
  values <- as.numeric(x)
  values[!is.na(values) & values < 0] <- NA_real_
  values
}

#' Convert a value-labelled variable to a factor
#'
#' Shared `to_factor = TRUE` transformation used by every
#' `apply_*_labels()` function's `.lasa_label_engine()` instance. Converts
#' `x` to a factor using `value_label_map`'s names as level text for coded
#' values; an observed value with no codebook label keeps its own numeric
#' code (as text) as its level, rather than becoming `NA`. Colliding level
#' text (e.g. two different codes that happen to share a label) is
#' disambiguated by appending the numeric code in brackets.
#'
#' @param x A (possibly value-labelled) vector.
#' @param value_label_map A named numeric vector of SPSS value labels
#'   (names = label text, values = numeric codes).
#'
#' @return A factor the same length as `x`.
#' @keywords internal
.lasa_convert_to_labelled_factor <- function(x, value_label_map) {
  values <- as.numeric(x)
  label_codes <- as.numeric(unname(value_label_map))
  label_text <- names(value_label_map)

  # Guard against an (unexpected) repeated code in the value-label vector,
  # keeping only its first definition so factor() doesn't error out.
  keep <- !duplicated(label_codes)
  label_codes <- label_codes[keep]
  label_text <- label_text[keep]

  observed_codes <- unique(values[!is.na(values)])
  level_codes <- sort(unique(c(label_codes, observed_codes)))

  level_text <- vapply(
    level_codes,
    function(code) {
      i <- match(code, label_codes)
      if (!is.na(i)) label_text[[i]] else as.character(code)
    },
    character(1)
  )

  # factor() would silently merge two distinct codes if their text happened
  # to collide. Disambiguate defensively so no numeric value is ever lost.
  if (anyDuplicated(level_text)) {
    collided <- unique(level_text[duplicated(level_text) | duplicated(level_text, fromLast = TRUE)])
    for (txt in collided) {
      i <- which(level_text == txt)
      level_text[i] <- paste0(txt, " [", level_codes[i], "]")
    }
  }

  factor(values, levels = level_codes, labels = level_text)
}

#' Parse a LASA data-file name
#'
#' Internal helper used by [read_lasa_sav()] to derive the LASA wave and file
#' code from the documented file naming convention.
#'
#' Standard wave files use `LASA[wave][file_code].SAV`, for example
#' `LASAB046.SAV` or `LASAZ004.SAV`. Files for the replenishment/migrant
#' cohort waves 2B, 3B, 4B, and MB omit the `A` after `LAS`, for example
#' `LAS2B046.SAV` or `LASMB004.SAV`.
#'
#' @param path Character string containing a LASA file path or file name.
#'
#' @return A named list with `wave`, `file_code`, and `file_name`.
#' @keywords internal
.lasa_parse_filename <- function(path) {
  if (length(path) != 1L || is.na(path) || !nzchar(path)) {
    stop("'path' must be a single non-empty file path.", call. = FALSE)
  }

  file_name <- basename(path)
  stem <- sub("\\.sav$", "", file_name, ignore.case = TRUE)

  # Regular single-character LASA waves, including Z for data that are stored
  # once because the information is constant or otherwise spans waves.
  # e.g. "LASAB046" -> wave "B", file code "046".
  regex_standard_wave <- regexec(
    "^LASA([BCDEFGHIJKLZ])([[:alnum:]]{2,3})$",
    stem,
    ignore.case = TRUE
  )
  match_standard_wave <- regmatches(stem, regex_standard_wave)[[1L]]

  # Replenishment/migrant-cohort wave codes are part of filenames beginning
  # with LAS rather than LASA: LAS2B..., LAS3B..., LAS4B..., LASMB....
  # e.g. "LAS3B046" -> wave "3B", file code "046".
  regex_replenishment_wave <- regexec(
    "^LAS(2B|3B|4B|MB)([[:alnum:]]{2,3})$",
    stem,
    ignore.case = TRUE
  )
  match_replenishment_wave <- regmatches(stem, regex_replenishment_wave)[[1L]]

  if (length(match_standard_wave) == 3L) {
    wave <- toupper(match_standard_wave[[2L]])
    file_code_raw <- match_standard_wave[[3L]]
  } else if (length(match_replenishment_wave) == 3L) {
    wave <- toupper(match_replenishment_wave[[2L]])
    file_code_raw <- match_replenishment_wave[[3L]]
  } else {
    stop(
      "Cannot identify a LASA wave and file code from file name '",
      file_name,
      "'. Expected LASA[wave][file_code].SAV for regular/Z waves or ",
      "LAS[wave][file_code].SAV for waves 2B, 3B, 4B, and MB. ",
      "The file code must contain 2 or 3 alphanumeric characters.",
      call. = FALSE
    )
  }

  # File codes are treated case-insensitively for dispatch. Preserve the
  # conventional uppercase spelling of FI; numeric codes keep leading zeroes;
  # other alphanumeric codes are standardized to lowercase (e.g. oa1).
  file_code_lower <- tolower(file_code_raw)
  file_code <- if (identical(file_code_lower, "fi")) {
    "FI"
  } else if (grepl("^[0-9]+$", file_code_raw)) {
    file_code_raw
  } else {
    file_code_lower
  }

  list(
    wave = wave,
    file_code = file_code,
    file_name = file_name
  )
}

#' Read and label a LASA SPSS data file
#'
#' Reads a LASA `.sav` file, identifies its wave and file code from the file
#' name, and labels it using [lasa_label_db()] -- the package's normalized,
#' database-driven variable/value-label metadata -- via the same engine
#' [apply_lasa_labels()] uses.
#'
#' @param path Path to a LASA SPSS `.sav` file. LASA file names are parsed
#'   case-insensitively.
#' @param user_na Logical passed to [haven::read_sav()]. The default is `TRUE`
#'   so SPSS user-defined missing codes remain available to the labelling
#'   step before any requested conversion to `NA`.
#' @param read_sav_args Optional named list of additional arguments passed to
#'   [haven::read_sav()], for example `list(encoding = "UTF-8")`. Do not
#'   include `file` or `user_na`; those are controlled by `path` and
#'   `user_na`.
#' @param name_corrections,to_factor,to_numeric,standardize_names,split_wavecode
#'   The five shared reshaping arguments used throughout this package -- see
#'   [apply_lasa_labels()] for the full description of each.
#'
#' @details
#' The file name is parsed against the LASA naming convention:
#'
#' * regular single-letter waves: `LASA[wave][file_code].SAV`, e.g.
#'   `LASAE046.SAV`;
#' * waves 2B, 3B, 4B, and MB: `LAS[wave][file_code].SAV`, e.g.
#'   `LAS3B046.SAV`;
#' * information stored across waves: wave code `Z`, e.g. `LASAZ004.SAV`;
#' * file codes contain 2 or 3 alphanumeric characters and are interpreted
#'   case-insensitively.
#'
#' Column matching, value/variable-label attachment, `to_factor`/`to_numeric`
#' reshaping, and `standardize_names`/`split_wavecode` renaming are all
#' performed by [apply_lasa_labels()]'s underlying engine, looking up
#' metadata for the parsed file code/wave in [lasa_label_db()]. A file code
#' with no database coverage yet is labelled as a no-op (every column left
#' untouched, `"not found"` recorded in the matching audit) rather than an
#' error -- refresh coverage with [update_lasa_labels()] or
#' [manual_update_lasa_labels()].
#'
#' After labelling, provenance attributes are attached: `"LASA_wave"`,
#' `"LASA_file_code"`, and `"LASA_source_file"`. This is what lets
#' [apply_lasa_labels()] re-label the same object later (e.g. after a
#' `dplyr::mutate()` strips attributes) without needing `filecode`/`wave`
#' supplied again. The variable-name matching audit is attached as the
#' generic `"label_report"` attribute; retrieve it with
#' [lasa_label_report()].
#'
#' @return `data` as imported by [haven::read_sav()], labelled (and
#'   optionally reshaped/renamed) with generic LASA provenance attributes
#'   attached.
#'
#' @seealso [lasa_label_report()], [apply_lasa_labels()], [lasa_label_db()]
#' @export
#'
#' @examples
#' \dontrun{
#' dat_e <- read_lasa_sav("LASAE046.SAV")
#' dat_3b <- read_lasa_sav("LAS3B046.SAV")
#'
#' dat_h <- read_lasa_sav(
#'   "LASAH046.SAV",
#'   to_factor = TRUE,
#'   to_numeric = TRUE,
#'   standardize_names = TRUE
#' )
#'
#' # split_wavecode = TRUE moves the wave code out of variable names and
#' # into its own "LASA_wave" column, without fully standardizing names:
#' dat_2b <- read_lasa_sav("LAS2B046.SAV", split_wavecode = TRUE)
#'
#' # Manually correct a mistyped column name:
#' dat_b <- read_lasa_sav(
#'   "LASAB046.SAV",
#'   name_corrections = c(lphya08 = "BLPYA08")
#' )
#'
#' dat_z004 <- read_lasa_sav("LASAZ004.SAV")
#' }
read_lasa_sav <- function(path,
                          user_na = TRUE,
                          read_sav_args = list(),
                          name_corrections = NULL,
                          to_factor = FALSE,
                          to_numeric = FALSE,
                          standardize_names = FALSE,
                          split_wavecode = FALSE) {
  if (!requireNamespace("haven", quietly = TRUE)) {
    stop(
      "Package 'haven' is required to read LASA .sav files. ",
      "Install it with install.packages('haven').",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(user_na, "user_na")
  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  if (!is.list(read_sav_args)) {
    stop("'read_sav_args' must be a list.", call. = FALSE)
  }

  if (length(read_sav_args) > 0L) {
    read_arg_names <- names(read_sav_args)
    if (is.null(read_arg_names) || any(!nzchar(read_arg_names))) {
      stop("All entries in 'read_sav_args' must be named.", call. = FALSE)
    }
    reserved_read_args <- intersect(read_arg_names, c("file", "user_na"))
    if (length(reserved_read_args) > 0L) {
      stop(
        "Do not supply ", paste(reserved_read_args, collapse = ", "),
        " in 'read_sav_args'; use the corresponding read_lasa_sav() ",
        "argument instead.",
        call. = FALSE
      )
    }
  }

  info <- .lasa_parse_filename(path)

  read_call <- c(
    list(file = path, user_na = user_na),
    read_sav_args
  )
  data <- do.call(haven::read_sav, read_call)

  out <- .lasa_apply_labels(
    data,
    filecode = info$file_code,
    wave = info$wave,
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  # .lasa_apply_labels() already sets "LASA_wave" and "LASA_file_code";
  # read_lasa_sav() additionally records the source file it read.
  attr(out, "LASA_source_file") <- info$file_name

  out
}

#' Inspect a LASA variable-name labelling audit
#'
#' Returns the generic variable-name matching audit attached by a LASA
#' file-specific label function. The function is independent of the LASA file
#' code and therefore works for any `apply_*_labels()` implementation that
#' stores its audit in the `"label_report"` attribute.
#'
#' @param data A data object previously labelled by [read_lasa_sav()] or
#'   [apply_lasa_labels()].
#' @param problems_only Logical. If `FALSE` (default), return the full matching
#'   audit. If `TRUE`, retain rows requiring attention. If the report has a
#'   logical `problem` column, that column is used. Otherwise, when a `method`
#'   column is available, common non-exact/failure methods are used.
#'
#' @details
#' [read_lasa_sav()] and [apply_lasa_labels()] store their matching audit as
#' `attr(data, "label_report")` and the wave identifier as
#' `attr(data, "LASA_wave")`, so one reporting function serves every LASA
#' file code.
#'
#' The report's `method` column uses values such as `"exact"`,
#' `"case-insensitive exact"`, `"exact canonical"`,
#' `"case-insensitive canonical"`, `"manual correction"`,
#' `"manual_not_found"`, or `"not found"` -- each optionally suffixed with
#' `" (manual override)"` when the match's label/value labels were patched
#' by [manual_update_lasa_labels()]. When produced with `standardize_names =
#' TRUE`, it also contains a `standardized_to` column recording each matched
#' column's renamed (canonical) name.
#'
#' @return A data frame containing the variable-name matching audit. The
#'   returned report retains LASA context in the attributes `"LASA_wave"` and
#'   `"LASA_file_code"` when those are available on `data`.
#'
#' @seealso [read_lasa_sav()], [apply_lasa_labels()]
#' @export
#'
#' @examples
#' \dontrun{
#' dat <- data.frame(RespNr = 1:2, BLPHYA07 = c(1, 2))
#' dat <- apply_lasa_labels(dat, filecode = "046", wave = "B")
#' lasa_label_report(dat, problems_only = TRUE)
#' }
lasa_label_report <- function(data, problems_only = FALSE) {
  .lasa_assert_scalar_logical(problems_only, "problems_only")

  report <- attr(data, "label_report", exact = TRUE)

  if (is.null(report)) {
    file_code <- attr(data, "LASA_file_code", exact = TRUE)
    context <- if (!is.null(file_code)) {
      paste0(" for LASA file code ", file_code)
    } else {
      ""
    }

    stop(
      "No generic 'label_report' attribute is attached to this object",
      context,
      ". Run the appropriate apply_lasa*_labels() function or read_lasa_sav() ",
      "first.",
      call. = FALSE
    )
  }

  if (!is.data.frame(report)) {
    stop(
      "The attached 'label_report' attribute is not a data frame.",
      call. = FALSE
    )
  }

  if (isTRUE(problems_only) && nrow(report) > 0L) {
    if ("problem" %in% names(report) && is.logical(report$problem)) {
      keep <- !is.na(report$problem) & report$problem
      report <- report[keep, , drop = FALSE]
    } else if ("method" %in% names(report)) {
      problem_methods <- c(
        "not found",
        "ambiguous",
        "ambiguous fuzzy",
        "manual_not_found",
        "manual_conflict",
        "fuzzy",
        "position assumed"
      )
      report <- report[report$method %in% problem_methods, , drop = FALSE]
    } else {
      warning(
        "'problems_only = TRUE' could not be applied because the attached ",
        "label report contains neither a logical 'problem' column nor a ",
        "'method' column. Returning the full report.",
        call. = FALSE
      )
    }
  }

  rownames(report) <- NULL
  attr(report, "LASA_wave") <- attr(data, "LASA_wave", exact = TRUE)
  attr(report, "LASA_file_code") <- attr(data, "LASA_file_code", exact = TRUE)
  report
}
