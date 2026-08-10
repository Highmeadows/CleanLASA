# Generic LASA SPSS reader, label-function dispatcher, and label audit tools
#
# This file is data-file independent. File-specific metadata implementations
# live in functions such as `apply_lasa046_labels()`, `apply_lasa004_labels()`,
# `apply_lasa_fi_labels()`, and `apply_lasa_oa_labels()`.

#' Assert that a value is a single, non-missing TRUE/FALSE
#'
#' Small internal validator shared by the argument-checking code in this
#' file, so the same error message format is used everywhere a scalar
#' logical argument is required.
#'
#' @param x The value to check.
#' @param name Character scalar: the argument name to use in the error
#'   message.
#'
#' @return Invisibly `NULL`. Called for its side effect of raising an error
#'   when `x` is not a scalar logical.
#' @keywords internal
.lasa_validate_scalar_logical <- function(x, name) {
  if (length(x) != 1L || is.na(x) || !is.logical(x)) {
    stop("'", name, "' must be TRUE or FALSE.", call. = FALSE)
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
.lasa_parse_datafile_name <- function(path) {
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

  apply_function <- .lasa_label_function_name_from_file_code(file_code)

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
.lasa_label_function_name_from_file_code <- function(file_code) {
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

#' Validate arguments forwarded to a LASA label function
#'
#' Internal helper used by [read_lasa_sav()] to make forwarding through `...`
#' explicit and predictable. All forwarded arguments must be named. When the
#' selected label function does not declare `...`, every forwarded argument is
#' checked against that function's formal arguments before `do.call()` is used.
#'
#' @param args Named list of user-supplied arguments from `...`.
#' @param label_fun The selected file-specific label function.
#' @param label_fun_name Character scalar naming `label_fun`, used in messages.
#'
#' @return Invisibly `NULL`; called for validation side effects.
#' @keywords internal
.lasa_validate_forwarded_label_arguments <- function(args,
                                                label_fun,
                                                label_fun_name) {
  if (length(args) == 0L) {
    return(invisible(NULL))
  }

  arg_names <- names(args)
  if (is.null(arg_names) || any(!nzchar(arg_names))) {
    stop(
      "All arguments supplied through `...` to read_lasa_sav() must be named.",
      call. = FALSE
    )
  }

  if (anyDuplicated(arg_names)) {
    duplicated_args <- unique(arg_names[duplicated(arg_names)])
    stop(
      "Argument(s) supplied more than once through `...`: ",
      paste(duplicated_args, collapse = ", "),
      ".",
      call. = FALSE
    )
  }

  reserved <- intersect(arg_names, c("data", "wave", "file_code"))
  if (length(reserved) > 0L) {
    stop(
      "Do not supply ",
      paste(reserved, collapse = ", "),
      " through `...`; these arguments are derived by read_lasa_sav().",
      call. = FALSE
    )
  }

  formal_names <- names(formals(label_fun))

  # A file-specific implementation that declares `...` explicitly accepts
  # additional named arguments and is responsible for validating them.
  if ("..." %in% formal_names) {
    return(invisible(NULL))
  }

  unsupported <- setdiff(arg_names, formal_names)
  if (length(unsupported) > 0L) {
    stop(
      "The selected label function `", label_fun_name, "()` does not support ",
      "the following argument(s) supplied through `...`: ",
      paste(unsupported, collapse = ", "),
      ". Supported file-specific arguments are: ",
      paste(setdiff(formal_names, c("data", "wave", "file_code")), collapse = ", "),
      ".",
      call. = FALSE
    )
  }

  invisible(NULL)
}

#' Read and label a LASA SPSS data file
#'
#' Reads a LASA `.sav` file, identifies its wave and file code from the file
#' name, finds the corresponding file-specific `apply_*_labels()` function, and
#' applies that function to the imported data.
#'
#' @param path Path to a LASA SPSS `.sav` file. LASA file names are parsed
#'   case-insensitively.
#' @param user_na Logical passed to [haven::read_sav()]. The default is `TRUE`
#'   so SPSS user-defined missing codes remain available to the file-specific
#'   labelling function before any requested conversion to `NA`.
#' @param read_sav_args Optional named list of additional arguments passed to
#'   [haven::read_sav()], for example `list(encoding = "UTF-8")`. Do not include
#'   `file` or `user_na`; those are controlled by `path` and `user_na`.
#' @param ... Named arguments forwarded unchanged to the selected
#'   file-specific label function. For LASA 046, supported options include
#'   `fuzzy_match`, `max_edit_distance`, `name_corrections`, `warn_unmatched`,
#'   `to_factor`, `to_numeric`, and `standardize_names`. Other file-specific
#'   implementations may expose a different set of options. Unsupported
#'   arguments are detected before the label function is called.
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
#' The selected function must already be available in the package namespace or
#' current R session. The wrapper always supplies `data`. It supplies `wave`
#' when that argument exists in the selected function's formal arguments
#' (checked via `formals()`), and supplies `file_code` when that argument
#' exists. This permits shared implementations such as a future
#' `apply_lasa_oa_labels(data, file_code, ...)` while retaining the standard
#' wave-aware interface used by `apply_lasa046_labels(data, wave, ...)`.
#'
#' Arguments supplied through `...` are reserved for the selected label
#' function, not for [haven::read_sav()]. They are validated against that
#' function's formal arguments and then passed through with `do.call()`. For
#' example, when file 046 is detected, `to_factor = TRUE`,
#' `to_numeric = TRUE`, `standardize_names = TRUE`, and `name_corrections =`
#' `...` are passed directly to [apply_lasa046_labels()]. Additional SPSS
#' import options belong in `read_sav_args`.
#'
#' After labelling, generic provenance attributes are attached:
#' `"LASA_wave"`, `"LASA_file_code"`, `"LASA_source_file"`, and
#' `"LASA_label_function"`. File-specific functions should attach their
#' variable-name audit under the generic `"label_report"` attribute.
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
#' dat_e <- read_lasa_sav(
#'   "LASAE046.SAV",
#'   to_factor = TRUE,
#'   to_numeric = TRUE,
#'   standardize_names = TRUE,
#'   name_corrections = c(lphya08 = "ELPYA08")
#' )
#'
#' # Also dispatches to apply_lasa046_labels(), with wave = "3B"
#' dat_3b <- read_lasa_sav("LAS3B046.SAV")
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
                          ...) {
  if (!requireNamespace("haven", quietly = TRUE)) {
    stop(
      "Package 'haven' is required to read LASA .sav files. ",
      "Install it with install.packages('haven').",
      call. = FALSE
    )
  }

  .lasa_validate_scalar_logical(user_na, "user_na")

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

  info <- .lasa_parse_datafile_name(path)

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

  # Validate file-specific options before reading the potentially large SPSS
  # file, so misspelled/unsupported `...` arguments fail early.
  user_label_args <- list(...)
  .lasa_validate_forwarded_label_arguments(
    args = user_label_args,
    label_fun = label_fun,
    label_fun_name = info$apply_function
  )

  read_call <- c(
    list(file = path, user_na = user_na),
    read_sav_args
  )
  data <- do.call(haven::read_sav, read_call)

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
#' code and therefore works for any future `apply_*_labels()` implementation
#' that stores its audit in the `"label_report"` attribute.
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
#' For consistency across future label implementations, reports should ideally
#' contain a `method` column using values such as `"exact"`,
#' `"case-insensitive exact"`, `"normalized exact"`, `"fuzzy"`,
#' `"not found"`, or `"ambiguous"`; alternatively they may provide a logical
#' `problem` column.
#'
#' @return A data frame containing the variable-name matching audit. The
#'   returned report retains LASA context in the attributes `"LASA_wave"`,
#'   `"LASA_file_code"`, `"LASA_source_file"`, and `"LASA_label_function"` when
#'   those are available on `data`.
#'
#' @seealso [read_lasa_sav()], [apply_lasa046_labels()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, BLPHYA07 = c(1, 2))
#' dat <- apply_lasa046_labels(dat, wave = "B", warn_unmatched = FALSE)
#' lasa_label_report(dat, problems_only = TRUE)
lasa_label_report <- function(data, problems_only = FALSE) {
  .lasa_validate_scalar_logical(problems_only, "problems_only")

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
  attr(report, "LASA_source_file") <- attr(data, "LASA_source_file", exact = TRUE)
  attr(report, "LASA_label_function") <- attr(data, "LASA_label_function", exact = TRUE)
  report
}
