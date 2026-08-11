# Generic LASA SPSS reader, label-function dispatcher, and label audit tools
#
# This file is data-file independent. File-specific metadata implementations
# live in functions such as `apply_lasa046_labels()`, `apply_lasa011_labels()`,
# `apply_lasaz004_labels()`, `apply_lasazoa_labels()`, and
# `apply_lasaFI_labels()`.
#
# Shared parameter contract
# --------------------------------------------------------------------------
# Every `apply_*_labels()` function in this package is expected to accept the
# same four "reshaping" arguments, in addition to `data` and a wave/file-code
# identifying argument (see apply_lasa046_labels() for the canonical
# implementation):
#
#   * name_corrections  - named character vector overriding automatic column
#                          matching for specific variables.
#   * to_factor         - convert categorical (value-labelled) variables to
#                          factors instead of leaving them numeric.
#   * to_numeric        - restore count/continuous variables to plain
#                          numeric (dropping their missing-code value
#                          labels), converting negative codes to NA.
#   * standardize_names - rename matched columns to their canonical
#                          lowercase LASA documentation name.
#
# read_lasa_sav() below declares these four arguments explicitly (rather
# than leaving them implicit inside `...`) so they are documented and
# discoverable in one place, and forwards them automatically to whichever
# file-specific function it dispatches to.

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
#' [read_lasa_sav()] and by every `apply_*_labels()` function in this
#' package family (see [apply_lasa046_labels()] for the canonical example).
#' A valid `name_corrections` is either `NULL`, or a named character vector
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
#' @return A named list with `wave`, `file_code`, `file_name`, and
#'   `apply_function`.
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

  apply_function <- .lasa_apply_function_name(file_code)

  list(
    wave = wave,
    file_code = file_code,
    file_name = file_name,
    apply_function = apply_function
  )
}

#' Determine the label function for a LASA file code
#'
#' Internal dispatcher implementing the package naming convention for
#' file-specific label functions.
#'
#' @param file_code LASA file code, such as `"046"`, `"004"`, `"FI"`, or
#'   `"oa1"`.
#'
#' @return Character scalar containing the expected function name.
#' @keywords internal
.lasa_apply_function_name <- function(file_code) {
  code <- tolower(file_code)

  # The three osteoarthritis algorithm files are one logical data-file family
  # and deliberately share a single label implementation.
  if (code %in% c("oa1", "oa2", "oa3")) {
    return("apply_lasa_oa_labels")
  }

  # File codes beginning with a number have no underscore after `lasa`.
  # Letter-leading file codes use an underscore for readability.
  if (grepl("^[0-9]", code)) {
    paste0("apply_lasa", code, "_labels")
  } else {
    paste0("apply_lasa_", code, "_labels")
  }
}

#' Read and label a LASA SPSS data file
#'
#' Reads a LASA `.sav` file, identifies its wave and file code from the file
#' name, finds the corresponding file-specific `apply_*_labels()` function,
#' and applies that function to the imported data.
#'
#' @param path Path to a LASA SPSS `.sav` file. LASA file names are parsed
#'   case-insensitively.
#' @param user_na Logical passed to [haven::read_sav()]. The default is `TRUE`
#'   so SPSS user-defined missing codes remain available to the file-specific
#'   labelling function before any requested conversion to `NA`.
#' @param read_sav_args Optional named list of additional arguments passed to
#'   [haven::read_sav()], for example `list(encoding = "UTF-8")`. Do not
#'   include `file` or `user_na`; those are controlled by `path` and
#'   `user_na`.
#' @param name_corrections Optional named character vector of manual column
#'   overrides, forwarded to the selected file-specific label function when
#'   it declares a `name_corrections` argument (every `apply_*_labels()`
#'   function in this package does; see [apply_lasa046_labels()] for
#'   details). Names are canonical variable suffixes (without the wave
#'   prefix); values are the actual column names found in the imported data,
#'   for example `c(lphya08 = "BLPYA08")`. Use this when a column in the
#'   `.sav` file does not exactly or case-insensitively match its documented
#'   LASA name.
#' @param to_factor Logical, default `FALSE`. Forwarded to the selected
#'   file-specific label function. When `TRUE`, categorical variables are
#'   converted to factors using their SPSS value labels as level text,
#'   instead of being left numeric with value-label attributes attached.
#' @param to_numeric Logical, default `FALSE`. Forwarded to the selected
#'   file-specific label function. When `TRUE`, count/continuous variables
#'   (those whose only codebook value labels are negative missing-reason
#'   codes) are restored to plain numeric, with negative codes converted to
#'   `NA`. Takes precedence over `to_factor` for those variables.
#' @param standardize_names Logical, default `FALSE`. Forwarded to the
#'   selected file-specific label function. When `TRUE`, every successfully
#'   matched column is renamed to its canonical lowercase LASA documentation
#'   name (e.g. `blphya01`).
#' @param ... Additional named arguments forwarded to the selected
#'   file-specific label function, for file-specific parameters that fall
#'   outside the four shared reshaping arguments listed above.
#'
#' @details
#' The dispatcher follows the LASA filename convention:
#'
#' * regular single-letter waves: `LASA[wave][file_code].SAV`, e.g.
#'   `LASAE046.SAV`;
#' * waves 2B, 3B, 4B, and MB: `LAS[wave][file_code].SAV`, e.g.
#'   `LAS3B046.SAV`;
#' * information stored across waves: wave code `Z`, e.g. `LASAZ004.SAV`;
#' * file codes contain 2 or 3 alphanumeric characters and are interpreted
#'   case-insensitively.
#'
#' File-specific label functions are selected by convention. If the file code
#' starts with a number, the expected function is
#' `apply_lasa[file_code]_labels()`; for example, file 046 maps to
#' `apply_lasa046_labels()` and file 004 maps to `apply_lasa004_labels()`.
#' If the file code starts with a letter, the expected function is
#' `apply_lasa_[file_code]_labels()`; for example, FI maps to
#' `apply_lasa_fi_labels()`. The OA files `oa1`, `oa2`, and `oa3` are a
#' hard-coded family and all map to `apply_lasa_oa_labels()`.
#'
#' Every `apply_*_labels()` function in this package shares the same
#' parameter contract: `data`, a wave- and/or file-code-identifying
#' argument, and the four reshaping arguments documented above
#' (`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`; see
#' [apply_lasa046_labels()] for the canonical implementation).
#' `read_lasa_sav()` declares those four reshaping arguments explicitly, with
#' the defaults shown above, so callers can discover and use them without
#' needing to know which file-specific function is ultimately dispatched to.
#' The selected function must already be available in the package namespace
#' or current R session. `read_lasa_sav()` inspects that function's formal
#' arguments (via `formals()`) and:
#'
#' * always supplies `data`;
#' * supplies `wave` and/or `file_code` when the function declares them;
#' * supplies `name_corrections`, `to_factor`, `to_numeric`, and
#'   `standardize_names` when the function declares them, and otherwise
#'   warns -- rather than silently ignoring the request -- if the caller
#'   supplied a non-default value for one of these;
#' * forwards any further named arguments from `...` unchanged, for
#'   file-specific parameters that fall outside the shared contract.
#'
#' This permits shared implementations such as a future
#' `apply_lasa_oa_labels(data, file_code, name_corrections, to_factor,
#' to_numeric, standardize_names, ...)` to coexist with wave-aware ones such
#' as `apply_lasa046_labels(data, wave, name_corrections, to_factor,
#' to_numeric, standardize_names)`.
#'
#' After labelling, generic provenance attributes are attached:
#' `"LASA_wave"`, `"LASA_file_code"`, `"LASA_source_file"`, and
#' `"LASA_label_function"`. File-specific functions should attach their
#' variable-name matching audit under the generic `"label_report"`
#' attribute; retrieve it with [lasa_label_report()].
#'
#' @return The object returned by the selected file-specific label function,
#'   with generic LASA provenance attributes attached.
#'
#' @seealso [lasa_label_report()], [apply_lasa046_labels()]
#' @export
#'
#' @examples
#' \dontrun{
#' # Automatically dispatches to apply_lasa046_labels()
#' dat_e <- read_lasa_sav("LASAE046.SAV")
#'
#' # Also dispatches to apply_lasa046_labels(), with wave = "3B"
#' dat_3b <- read_lasa_sav("LAS3B046.SAV")
#'
#' # The four shared reshaping arguments are available directly on
#' # read_lasa_sav(), without needing to know they live on
#' # apply_lasa046_labels() specifically:
#' dat_h <- read_lasa_sav(
#'   "LASAH046.SAV",
#'   to_factor = TRUE,
#'   to_numeric = TRUE,
#'   standardize_names = TRUE
#' )
#'
#' # Manually correct a mistyped column name:
#' dat_b <- read_lasa_sav(
#'   "LASAB046.SAV",
#'   name_corrections = c(lphya08 = "BLPYA08")
#' )
#'
#' # Dispatches to apply_lasa004_labels() once that function exists
#' dat_z004 <- read_lasa_sav("LASAZ004.SAV")
#'
#' # Both dispatch to apply_lasa_oa_labels() once that function exists
#' oa1 <- read_lasa_sav("LASAzoa1.sav")
#' oa2 <- read_lasa_sav("LASAzoa2.sav")
#' }
read_lasa_sav <- function(path,
                          user_na = TRUE,
                          read_sav_args = list(),
                          name_corrections = NULL,
                          to_factor = FALSE,
                          to_numeric = FALSE,
                          standardize_names = FALSE,
                          ...) {
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

  label_fun <- get0(
    info$apply_function,
    mode = "function",
    inherits = TRUE
  )

  if (is.null(label_fun)) {
    stop(
      "No LASA label function is available for file '", info$file_name,
      "' (wave ", info$wave, ", file code ", info$file_code, "). ",
      "Expected function `", info$apply_function, "()`. ",
      "Create/source that file-specific label function before calling ",
      "read_lasa_sav().",
      call. = FALSE
    )
  }

  read_call <- c(
    list(file = path, user_na = user_na),
    read_sav_args
  )
  data <- do.call(haven::read_sav, read_call)

  # Arguments left over in `...` are, by construction, anything the caller
  # supplied that isn't one of read_lasa_sav()'s own named parameters (which
  # now include the four shared reshaping arguments) -- i.e. genuinely
  # file-specific extras meant for the dispatched label function.
  user_label_args <- list(...)
  if (length(user_label_args) > 0L) {
    dot_names <- names(user_label_args)
    if (!is.null(dot_names)) {
      reserved_label_args <- intersect(dot_names, c("data", "wave", "file_code"))
      if (length(reserved_label_args) > 0L) {
        stop(
          "Do not supply ", paste(reserved_label_args, collapse = ", "),
          " through `...`; these arguments are derived by read_lasa_sav().",
          call. = FALSE
        )
      }
    }
  }

  # Only pass `wave` / `file_code` through to the label function if it
  # actually declares that argument. This lets wave-aware implementations
  # (e.g. apply_lasa046_labels(data, wave, ...)) and shared, file-code-aware
  # implementations (e.g. a future apply_lasa_oa_labels(data, file_code, ...))
  # coexist behind the same read_lasa_sav() entry point.
  formal_names <- names(formals(label_fun))
  label_call <- list(data = data)

  if ("wave" %in% formal_names) {
    label_call$wave <- info$wave
  }
  if ("file_code" %in% formal_names) {
    label_call$file_code <- info$file_code
  }

  # The four reshaping arguments shared by every apply_*_labels() function in
  # this package (see the "Shared parameter contract" note at the top of
  # this file, and apply_lasa046_labels() for the canonical implementation).
  # As with wave/file_code above, an argument is only forwarded if the
  # selected function declares it. If the caller asked for a non-default
  # value that the function does not support, warn rather than silently
  # dropping the request, since that combination is most likely a mistake.
  common_reshaping_args <- list(
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names
  )
  common_reshaping_defaults <- list(
    name_corrections = NULL,
    to_factor = FALSE,
    to_numeric = FALSE,
    standardize_names = FALSE
  )

  for (arg_name in names(common_reshaping_args)) {
    if (arg_name %in% formal_names) {
      label_call[[arg_name]] <- common_reshaping_args[[arg_name]]
    } else if (!identical(common_reshaping_args[[arg_name]], common_reshaping_defaults[[arg_name]])) {
      warning(
        "'", arg_name, "' was supplied but ", info$apply_function,
        "() does not declare that argument, so it is ignored for '",
        info$file_name, "'.",
        call. = FALSE
      )
    }
  }

  label_call <- c(label_call, user_label_args)
  out <- do.call(label_fun, label_call)

  # Attach provenance attributes so the object "remembers" which file and
  # label function produced it, independent of any file-specific attributes
  # the label function itself may have set (e.g. "label_report").
  attr(out, "LASA_wave") <- info$wave
  attr(out, "LASA_file_code") <- info$file_code
  attr(out, "LASA_source_file") <- info$file_name
  attr(out, "LASA_label_function") <- info$apply_function

  out
}

#' Inspect a LASA variable-name labelling audit
#'
#' Returns the generic variable-name matching audit attached by a LASA
#' file-specific label function. The function is independent of the LASA file
#' code and therefore works for any `apply_*_labels()` implementation that
#' stores its audit in the `"label_report"` attribute.
#'
#' @param data A data object previously processed by a LASA file-specific label
#'   function or by [read_lasa_sav()].
#' @param problems_only Logical. If `FALSE` (default), return the full matching
#'   audit. If `TRUE`, retain rows requiring attention. If the report has a
#'   logical `problem` column, that column is used. Otherwise, when a `method`
#'   column is available, common non-exact/failure methods are used.
#'
#' @details
#' File-specific labelling functions should store their matching audit as
#' `attr(data, "label_report")` and the wave identifier as
#' `attr(data, "LASA_wave")`. This avoids embedding a particular LASA file code
#' in the attribute names and lets one reporting function serve all LASA files.
#'
#' For consistency across label implementations, reports should ideally
#' contain a `method` column using values such as `"exact"`,
#' `"case-insensitive exact"`, `"manual correction"`, `"manual_not_found"`,
#' `"not found"`, `"fuzzy"`, or `"ambiguous"`; alternatively they may provide
#' a logical `problem` column. When a report was produced with
#' `standardize_names = TRUE`, it may also contain a `standardized_to`
#' column recording each matched column's renamed (canonical) name.
#'
#' @return A data frame containing the variable-name matching audit. The
#'   returned report retains LASA context in the attributes `"LASA_wave"` and
#'   `"LASA_file_code"` when those are available on `data`.
#'
#' @seealso [read_lasa_sav()], [apply_lasa046_labels()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, BLPHYA07 = c(1, 2))
#' dat <- apply_lasa046_labels(dat, wave = "B")
#' lasa_label_report(dat, problems_only = TRUE)
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
