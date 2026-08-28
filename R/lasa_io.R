# Generic LASA SPSS reader and label audit tools.
#
# This file is data-file independent: `read_lasa_sav()` reads a LASA `.sav`
# file, identifies its wave and file code from the file name
# (`.lasa_parse_filename()`), and labels it via the database-driven engine
# in `apply_lasa_labels()`/`.lasa_apply_labels()` (R/lasa_apply_labels.R),
# which looks up variable/value-label metadata from `lasa_label_db()`
# instead of a hand-written, file-specific function. `read_lasa_sav()` is a
# thin wrapper: all matching, transforming, standardizing, and
# `add_wavecode` logic lives in `apply_lasa_labels()`. The reshaping
# helpers below (`.lasa_convert_to_labelled_factor()`,
# `.lasa_convert_to_labelled_text()`, `.lasa_restore_plain_numeric()`,
# `.lasa_insert_wave_column()`) are shared by that engine.
#
# Shared parameter contract
# --------------------------------------------------------------------------
# `read_lasa_sav()` and `apply_lasa_labels()` both accept the same set of
# "reshaping" arguments, in addition to `data`/`path` and a wave/file-code
# identifying argument:
#
#   * name_corrections        - named character vector overriding automatic
#                                column matching for specific variables.
#   * fuzzy_matching           - fall back to an edit-distance match when
#                                exact/canonical matching fails.
#   * standardize              - overarching switch for the three
#                                `.standardize_*` switches below.
#   * .standardize_names       - rename matched columns to their canonical
#                                lowercase LASA documentation name. Implies
#                                `add_wavecode = TRUE`.
#   * .standardize_var_labels  - use the harmonized (cross-wave) variable
#                                label as the active `"label"`.
#   * .standardize_val_labels  - use the harmonized (cross-wave) value
#                                labels as the active `"labels"`.
#   * add_wavecode             - insert a `"Wave"` column (the already-
#                                resolved wave) right after `"respnr"`.
#   * to_factor                - convert categorical (value-labelled)
#                                variables to factors instead of leaving
#                                them numeric/character. A variable whose
#                                value coding is inconsistent across waves
#                                (var_type == "text") is instead recoded to
#                                its wave-specific label text (character),
#                                never a factor, so it merges correctly
#                                across waves despite differing codes.
#   * to_numeric                - restore count/continuous variables to
#                                plain numeric (dropping their missing-code
#                                value labels), converting negative codes
#                                to NA.
#
# Regardless of these arguments, matched variables always keep their
# original SPSS value coding available as reference attributes
# (`"wave_label"`/`"labels_wave"`), so R output can be cross-checked
# against another program's (e.g. SPSS) coding even after
# `to_numeric`/`to_factor` reshaping.

#' Assert that a value is a single, non-missing TRUE/FALSE
#'
#' Small internal validator shared by the argument-checking code in this
#' file and by every `apply_*_labels()` function in the package, so the same
#' error message format is used everywhere a scalar logical argument (such
#' as `to_factor`, `to_numeric`, or `fuzzy_matching`) is required.
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

#' Insert the "Wave" column
#'
#' Internal helper used by [apply_lasa_labels()]'s engine when
#' `add_wavecode = TRUE` (always the effective setting when
#' `.standardize_names` is effectively `TRUE`). Adds a `"Wave"` column
#' filled with `wave`, positioned immediately after the respondent-number
#' column. If that column could not be matched, `"Wave"` is inserted at the
#' very front of `data` instead.
#'
#' @param data A data frame or tibble.
#' @param wave Character scalar: the LASA wave code to fill the new column
#'   with, e.g. `"B"`, `"2B"`, `"3B"`.
#' @param respnr_name The name of the respondent-number column in `data`
#'   (its *final*, post-rename name), or `NA_character_` if none was
#'   matched.
#'
#' @return `data` with a new `"Wave"` column inserted.
#' @keywords internal
.lasa_insert_wave_column <- function(data, wave, respnr_name = NA_character_) {
  respnr_idx <- if (!is.na(respnr_name)) match(respnr_name, names(data)) else NA_integer_
  target_position <- if (!is.na(respnr_idx)) respnr_idx + 1L else 1L

  data[["Wave"]] <- wave
  new_order <- append(
    setdiff(names(data), "Wave"),
    "Wave",
    after = target_position - 1L
  )

  data[, new_order, drop = FALSE]
}

#' Restore a value-labelled variable to plain numeric
#'
#' Shared `to_numeric = TRUE` transformation used by [apply_lasa_labels()]'s
#' engine. Strips any value-label attributes and coerces `x` to an ordinary
#' numeric vector, replacing every negative observed value with `NA` --
#' including a negative code the codebook did not explicitly label.
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
#' Shared `to_factor = TRUE` transformation used by [apply_lasa_labels()]'s
#' engine. Converts `x` to a factor using `value_label_map`'s names as
#' level text for coded values; an observed value with no codebook label
#' keeps its own numeric code (as text) as its level, rather than becoming
#' `NA`. Colliding level text (e.g. two different codes that happen to
#' share a label) is disambiguated by appending the numeric code in
#' brackets.
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

## Recodes a variable's numeric codes to their wave-specific label TEXT (a
## character vector), instead of building a factor -- used for variables
## whose value coding is inconsistent across waves (var_type == "text", see
## data-raw/build_lasa_label_db.R). Unlike .lasa_convert_to_labelled_factor(),
## colliding label text across different codes is exactly the point here
## (e.g. code 0 in one wave and code 1 in another both meaning "no"), so it
## is never disambiguated.
##
## Idempotent: a variable already converted by an earlier apply_lasa_labels()
## call (e.g. re-labelling read_lasa_sav()'s own output) is already label
## text, not a numeric code -- left untouched rather than coerced to NA.
.lasa_convert_to_labelled_text <- function(x, value_label_map) {
  if (is.character(x)) return(x)
  values <- as.numeric(x)
  label_codes <- as.numeric(unname(value_label_map))
  label_text <- names(value_label_map)

  # Same guard as .lasa_convert_to_labelled_factor(): keep only the first
  # definition of a repeated code.
  keep <- !duplicated(label_codes)
  label_codes <- label_codes[keep]
  label_text <- label_text[keep]

  vapply(
    values,
    function(v) {
      if (is.na(v)) return(NA_character_)
      i <- match(v, label_codes)
      if (!is.na(i)) label_text[[i]] else as.character(v)
    },
    character(1)
  )
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
#' database-driven variable/value-label metadata -- via [apply_lasa_labels()],
#' which does all of the actual matching/transforming/standardizing work.
#' `read_lasa_sav()` is a thin wrapper around it.
#'
#' @param path Path to a LASA SPSS `.sav` file. LASA file names are parsed
#'   case-insensitively.
#' @param filecode Optional manual override for the LASA file code, for a
#'   file name that doesn't follow the documented convention. If omitted,
#'   derived from `path`.
#' @param wave Optional manual override for the LASA wave code (e.g. useful
#'   for a nonstandard baseline wave). If omitted, derived from `path`.
#' @param name_corrections,fuzzy_matching,standardize,.standardize_names,.standardize_var_labels,.standardize_val_labels,add_wavecode,to_factor,to_numeric
#'   The shared reshaping arguments used throughout this package -- see
#'   [apply_lasa_labels()] for the full description of each.
#' @param user_na Logical passed to [haven::read_sav()]. The default is `TRUE`
#'   so SPSS user-defined missing codes remain available to the labelling
#'   step before any requested conversion to `NA`.
#' @param read_sav_args Optional named list of additional arguments passed to
#'   [haven::read_sav()], for example `list(encoding = "UTF-8")`. Do not
#'   include `file` or `user_na`; those are controlled by `path` and
#'   `user_na`.
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
#' `filecode`/`wave` override the parsed values when supplied -- the place
#' to correct a nonstandard file name or a baseline wave that doesn't
#' follow the usual convention.
#'
#' After identification, `read_lasa_sav()` reads the file with
#' [haven::read_sav()], lowercases every column name, and forwards
#' everything else to [apply_lasa_labels()], which performs all column
#' matching, value/variable-label attachment, `to_factor`/`to_numeric`
#' reshaping, standardization, and `add_wavecode`. A file code with no
#' database coverage yet is labelled as a no-op (every column left
#' untouched, `"not found"` recorded in the matching audit) rather than an
#' error -- add coverage with [manual_update_lasa_labels()], or wait for a
#' package update.
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
#' # to_factor/to_numeric/standardize default to TRUE.
#' dat_h <- read_lasa_sav("LASAH046.SAV")
#'
#' # add_wavecode = TRUE without full name standardization:
#' dat_2b <- read_lasa_sav(
#'   "LAS2B046.SAV",
#'   .standardize_names = FALSE,
#'   add_wavecode = TRUE
#' )
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
                          filecode = NULL,
                          wave = NULL,
                          name_corrections = NULL,
                          fuzzy_matching = TRUE,
                          standardize = TRUE,
                          .standardize_names = NULL,
                          .standardize_var_labels = NULL,
                          .standardize_val_labels = NULL,
                          add_wavecode = FALSE,
                          to_factor = TRUE,
                          to_numeric = TRUE,
                          user_na = TRUE,
                          read_sav_args = list()) {
  if (!requireNamespace("haven", quietly = TRUE)) {
    stop(
      "Package 'haven' is required to read LASA .sav files. ",
      "Install it with install.packages('haven').",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(user_na, "user_na")
  .lasa_assert_scalar_logical(fuzzy_matching, "fuzzy_matching")
  .lasa_assert_scalar_logical(standardize, "standardize")
  if (!is.null(.standardize_names)) .lasa_assert_scalar_logical(.standardize_names, ".standardize_names")
  if (!is.null(.standardize_var_labels)) .lasa_assert_scalar_logical(.standardize_var_labels, ".standardize_var_labels")
  if (!is.null(.standardize_val_labels)) .lasa_assert_scalar_logical(.standardize_val_labels, ".standardize_val_labels")
  .lasa_assert_scalar_logical(add_wavecode, "add_wavecode")
  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
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

  # Only require the file name to follow the LASA naming convention when
  # it's actually needed to resolve identity -- an explicit filecode/wave
  # (for a nonstandard file name) should never be blocked by a filename
  # .lasa_parse_filename() can't parse.
  info <- if (is.null(filecode) || is.null(wave)) {
    .lasa_parse_filename(path)
  } else {
    list(wave = NA_character_, file_code = NA_character_, file_name = basename(path))
  }
  resolved_filecode <- if (!is.null(filecode)) filecode else info$file_code
  resolved_wave <- if (!is.null(wave)) wave else info$wave

  read_call <- c(
    list(file = path, user_na = user_na),
    read_sav_args
  )
  data <- do.call(haven::read_sav, read_call)
  names(data) <- tolower(names(data))

  out <- .lasa_apply_labels(
    data,
    filecode = resolved_filecode,
    wave = resolved_wave,
    name_corrections = name_corrections,
    fuzzy_matching = fuzzy_matching,
    standardize = standardize,
    .standardize_names = .standardize_names,
    .standardize_var_labels = .standardize_var_labels,
    .standardize_val_labels = .standardize_val_labels,
    add_wavecode = add_wavecode,
    to_factor = to_factor,
    to_numeric = to_numeric
  )

  # .lasa_apply_labels() already sets "LASA_wave" and "LASA_file_code";
  # read_lasa_sav() additionally records the source file it read.
  attr(out, "LASA_source_file") <- info$file_name

  out
}

#' Inspect a LASA variable-name labelling audit
#'
#' Returns the generic variable-name matching audit attached by
#' [apply_lasa_labels()]/[read_lasa_sav()]. The audit is bidirectional: it
#' covers both documented variables not found in the data, and data
#' columns not documented in the label database.
#'
#' @param data A data object previously labelled by [read_lasa_sav()] or
#'   [apply_lasa_labels()].
#' @param problems_only Logical. If `FALSE` (default), return the full matching
#'   audit. If `TRUE`, retain rows requiring attention: unmatched in either
#'   direction, or matched only via a fuzzy/ambiguous method.
#'
#' @details
#' [read_lasa_sav()] and [apply_lasa_labels()] store their matching audit as
#' `attr(data, "label_report")` and the wave identifier as
#' `attr(data, "LASA_wave")`.
#'
#' The report's `direction` column is one of `"matched"`,
#' `"documented_not_in_data"` (a database variable wasn't found in `data`
#' -- possibly fixable with `name_corrections`), or `"data_not_documented"`
#' (a column in `data` didn't match anything in the database). Neither
#' direction is ever an error -- unmatched variables are always left
#' untouched.
#'
#' The `method` column records how a match was made: `"exact"`,
#' `"case-insensitive exact"`, `"exact canonical"`,
#' `"case-insensitive canonical"`, `"fuzzy"`, `"manual correction"`,
#' `"manual_not_found"`, `"ambiguous fuzzy"`, `"not found"`, or
#' `"undocumented column"` -- each optionally suffixed with `" (manual
#' override)"` when the match's label/value labels were patched by
#' [manual_update_lasa_labels()]. A `"fuzzy"`/`"ambiguous fuzzy"` row also
#' has a non-`NA` `edit_distance`. When produced with `.standardize_names`
#' effectively `TRUE`, matched rows also have a `standardized_to` column
#' recording the matched column's renamed (canonical) name.
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
      ". Run apply_lasa_labels() or read_lasa_sav() first.",
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
    if ("direction" %in% names(report)) {
      is_problem_direction <- report$direction %in% c("documented_not_in_data", "data_not_documented")
      is_problem_method <- "method" %in% names(report) &
        report$method %in% c("fuzzy", "ambiguous fuzzy")
      report <- report[is_problem_direction | is_problem_method, , drop = FALSE]
    } else if ("problem" %in% names(report) && is.logical(report$problem)) {
      keep <- !is.na(report$problem) & report$problem
      report <- report[keep, , drop = FALSE]
    } else if ("method" %in% names(report)) {
      problem_methods <- c("not found", "manual_not_found", "fuzzy", "ambiguous fuzzy", "undocumented column")
      report <- report[report$method %in% problem_methods, , drop = FALSE]
    } else {
      warning(
        "'problems_only = TRUE' could not be applied because the attached ",
        "label report contains neither a 'direction' column, a logical ",
        "'problem' column, nor a 'method' column. Returning the full report.",
        call. = FALSE
      )
    }
  }

  rownames(report) <- NULL
  attr(report, "LASA_wave") <- attr(data, "LASA_wave", exact = TRUE)
  attr(report, "LASA_file_code") <- attr(data, "LASA_file_code", exact = TRUE)
  report
}
