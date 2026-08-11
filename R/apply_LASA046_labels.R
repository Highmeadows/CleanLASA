# Apply LASA 046 (LAPAQ / Physical activity) SPSS variable and value labels
#
# Source: LASA046_varinfo_PhysicalActivity.pdf (19-Jan-2024)
#
# This is the reference implementation of the package's shared parameter
# contract described at the top of lasa_io.R: every apply_*_labels()
# function is expected to accept `data`, a wave/file-code identifying
# argument, and the same four reshaping arguments implemented here
# (name_corrections, to_factor, to_numeric, standardize_names). Because
# read_lasa_sav() forwards those four arguments automatically to whichever
# label function it dispatches to, keeping their names, defaults, and
# behaviour consistent across files (e.g. a future apply_lasa011_labels() or
# apply_lasaz004_labels()) is what lets users pass them through
# read_lasa_sav() without needing to know which file-specific function will
# ultimately handle them.
#
# By default this script keeps variables numeric and stores labels in the
# same attributes used by haven/labelled:
#   attr(x, "label")  = SPSS variable label
#   attr(x, "labels") = named numeric vector of SPSS value labels
#
# The four reshaping arguments let you get a different shape of output:
#   * name_corrections  - manually point a LASA046 suffix at a differently
#                          named column, for a known typo/renaming in `data`.
#   * to_factor         - convert categorical (value-labelled) variables to
#                          factors, using the value labels as factor levels.
#   * to_numeric        - convert count/continuous variables (whose codebook
#                          labels are *only* negative missing-reason codes)
#                          back to plain numeric, with negative codes -> NA.
#   * standardize_names - rename matched columns to their canonical
#                          lowercase LASA documentation name (e.g. "blphya01").
#
# `to_numeric` takes precedence over `to_factor`: a variable that qualifies
# as numeric (all its codebook value labels are negative) is always restored
# to plain numeric, never converted to a factor, even if both flags are TRUE.
#
# A matching/labelling audit is attached to the returned object as the
# generic `"label_report"` attribute (see lasa_label_report() in lasa_io.R).
#
# Usage:
#   dat_b  <- apply_lasa046_labels(dat_b,  wave = "B")
#   dat_2b <- apply_lasa046_labels(dat_2b, wave = "2B")
#   dat_h  <- apply_lasa046_labels(dat_h,  wave = "H")
#   dat_3b <- apply_lasa046_labels(dat_3b, wave = "3B")
#   dat_k  <- apply_lasa046_labels(dat_k,  wave = "K")
#
#   # Convert categorical variables to factors, restore count variables to
#   # plain numeric, and use standardized (canonical) column names:
#   dat_b <- apply_lasa046_labels(
#     dat_b, wave = "B",
#     to_factor = TRUE, to_numeric = TRUE, standardize_names = TRUE
#   )
#
#   # Point a mistyped column at its correct LASA046 variable:
#   dat_b <- apply_lasa046_labels(
#     dat_b, wave = "B",
#     name_corrections = c(lphya08 = "BLPYA08")
#   )
#
#   # The same four arguments also work through read_lasa_sav(), which
#   # dispatches to this function automatically for LASA046 files:
#   dat_b <- read_lasa_sav("LASAB046.SAV", to_factor = TRUE)
#
# Wave must be supplied because B, 2B, 3B and MB all use variable names
# beginning with "b", while some labels/codings differ between those waves.

#' Apply LASA046 (LAPAQ / Physical Activity) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to a LASA046 (LAPAQ physical activity questionnaire)
#' data frame, using the coding scheme documented for the requested wave.
#' By default variables are left numeric; optional arguments allow converting
#' categorical variables to factors, restoring count/continuous variables to
#' plain numeric, correcting mismatched column names, and standardizing
#' column names to the canonical LASA documentation spelling.
#'
#' LASA046 variable names, wording, and value codings change across waves
#' (for example, the sport-type coding scheme was redesigned starting at
#' wave H, and several items only exist in a subset of waves). `wave` must be
#' supplied explicitly because several waves share the same variable-name
#' prefix (`"b"` for B, 2B, 3B, and MB) but use different labels/codings.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact (case-sensitive) name match, (3) a
#' case-insensitive name match. A LASA046 variable that cannot be matched by
#' any of these is left unlabelled and recorded as `"not found"` in the
#' matching audit rather than raising an error, since not every wave's file
#' contains every variable.
#'
#' `name_corrections`, `to_factor`, `to_numeric`, and `standardize_names` are
#' part of a parameter contract shared by every `apply_*_labels()` function
#' in this package (see the header comment in `lasa_io.R`). Because
#' [read_lasa_sav()] forwards these same four arguments automatically when
#' dispatching to this function, they can be supplied either directly to
#' `apply_lasa046_labels()` or through `read_lasa_sav()` -- both forms behave
#' identically.
#'
#' @param data A data frame or tibble imported from a LASA046 `.sav` file
#'   (for example via `haven::read_sav()`), containing wave-prefixed
#'   variables such as `blphya01`, `clphya01`, etc.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit name
#'   overrides, used when a column in `data` does not exactly or
#'   case-insensitively match its expected LASA046 name (e.g. a typo
#'   introduced during data entry or export). Names are canonical LASA046
#'   suffixes (without the wave prefix), and values are the actual column
#'   names found in `data`, for example `c(lphya08 = "BLPYA08")`. A
#'   correction that points to a column not present in `data` is recorded as
#'   `"manual_not_found"` in the matching audit rather than raising an error.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, every
#'   categorical variable's value labels are used as factor levels; any
#'   observed value that has no codebook label is retained as its own level
#'   (labelled with the numeric code) rather than being converted to `NA`.
#'   Ignored for a given variable when `to_numeric` applies to it instead
#'   (see below).
#' @param to_numeric Logical. If `FALSE` (default), count/continuous
#'   variables keep their SPSS-style missing-reason value-label attributes.
#'   If `TRUE`, every variable whose codebook value labels consist
#'   exclusively of negative missing-reason codes (e.g. -1, -2, -3) is
#'   restored to an ordinary numeric vector: all negative values become `NA`
#'   and all remaining values are kept as numeric. This takes precedence
#'   over `to_factor` for these variables.
#' @param standardize_names Logical. If `FALSE` (default), original column
#'   names in `data` are left unchanged. If `TRUE`, every successfully
#'   matched LASA046 column is renamed to its canonical lowercase
#'   documentation name, such as `blphya01`, `clphya26`, or `klphya50`.
#'   Renaming happens only after all variables have been matched, so it
#'   cannot affect matching decisions; the function stops with an
#'   informative error if renaming would create duplicate column names.
#'
#' @return `data`, with `label` and `labels` attributes added to every
#'   matched LASA046 column (transformed to a factor or plain numeric where
#'   `to_factor`/`to_numeric` apply), and optionally renamed when
#'   `standardize_names = TRUE`. A variable-name matching audit is attached
#'   as the generic `"label_report"` attribute; retrieve it with
#'   [lasa_label_report()].
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' \dontrun{
#' dat_b  <- apply_lasa046_labels(dat_b, wave = "B")
#' dat_2b <- apply_lasa046_labels(dat_2b, wave = "2B")
#'
#' # Convert categorical variables to factors, restore count variables to
#' # plain numeric, and use canonical column names:
#' dat_h <- apply_lasa046_labels(
#'   dat_h, wave = "H",
#'   to_factor = TRUE, to_numeric = TRUE, standardize_names = TRUE
#' )
#'
#' # Manually correct a mistyped column name:
#' dat_3b <- apply_lasa046_labels(
#'   dat_3b, wave = "3B",
#'   name_corrections = c(lphya08 = "BLPYA08")
#' )
#'
#' # Equivalently, via read_lasa_sav():
#' dat_h <- read_lasa_sav(
#'   "LASAH046.SAV",
#'   to_factor = TRUE, to_numeric = TRUE, standardize_names = TRUE
#' )
#'
#' lasa_label_report(dat_h, problems_only = TRUE)
#' }
apply_lasa046_labels <- function(data,
                                 wave,
                                 name_corrections = NULL,
                                 to_factor = FALSE,
                                 to_numeric = FALSE,
                                 standardize_names = FALSE) {

  wave <- toupper(wave)

  # Maps each LASA wave to the lower-case letter prefix used in its variable
  # names (e.g. wave "E" -> variables named e...). Waves B, 2B, 3B, and MB
  # all share prefix "b", even though they are distinct waves with their own
  # (sometimes differing) value-label schemes handled further below.
  wave_prefix <- c(
    B = "b", C = "c", D = "d", E = "e", `2B` = "b",
    F = "f", G = "g", H = "h", `3B` = "b", MB = "b",
    I = "i", J = "j", K = "k"
  )

  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 046 wave: ", wave,
      ". Use one of: ", paste(names(wave_prefix), collapse = ", "), "."
    )
  }

  prefix <- unname(wave_prefix[[wave]])

  # ---- Validate the shared reshaping arguments ------------------------------
  # .lasa_assert_scalar_logical() and .lasa_assert_name_corrections() are
  # defined once in lasa_io.R and shared by every apply_*_labels() function
  # in this package, so all of them validate these arguments identically.
  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_name_corrections(name_corrections)

  # Lower-cased lookup keys for name_corrections, e.g. c(lphya08 = "BLPYA08")
  # -> correction_keys = "lphya08". Empty when no corrections were supplied.
  correction_keys <- if (is.null(name_corrections)) {
    character(0)
  } else {
    tolower(names(name_corrections))
  }

  # ---- Helpers -------------------------------------------------------------

  # Named numeric vector: names = value labels, values = numeric codes.
  # Just a thin, self-documenting wrapper around c() used throughout this
  # file so that value-label definitions read as "value_labels(label = code)".
  value_labels <- function(...) {
    c(...)
  }

  # Builds the upper-case skip-reference variable name for this wave, e.g.
  # skip_reference_var("cara01") -> "BCARA01" when prefix is "b". Used when
  # a missing-value code refers back to another variable ("na, see BCARA01").
  skip_reference_var <- function(suffix) {
    toupper(paste0(prefix, suffix))
  }

  # Builds the common stack of SPSS missing-value codes shared by nearly
  # every LASA046 item:
  #   -5 interview terminated   (optional, `include_interview_terminated`)
  #   -4 short interview        (optional, `include_short_interview`)
  #   -3 wrong skip             (optional, `include_wrong_skip`)
  #   -2 "na, see <ref>"        (only added when `ref` is supplied)
  #   -1 asked (still missing)  (optional, `include_asked`)
  # Each LASA046 question only uses a subset of these codes, so every part
  # can be switched on/off individually via the arguments below.
  standard_missing_codes <- function(ref = NULL,
                                     include_wrong_skip = TRUE,
                                     wrong_skip_label = "na, wrong skip",
                                     include_asked = TRUE,
                                     include_interview_terminated = FALSE,
                                     include_short_interview = FALSE) {
    out <- numeric(0)

    if (include_interview_terminated) {
      out <- c(out, setNames(-5, "na, interview terminated"))
    }
    if (include_short_interview) {
      out <- c(out, setNames(-4, "na, short interview"))
    }
    if (include_wrong_skip) {
      out <- c(out, setNames(-3, wrong_skip_label))
    }
    if (!is.null(ref)) {
      out <- c(out, setNames(-2, paste0("na, see ", skip_reference_var(ref))))
    }
    if (include_asked) {
      out <- c(out, setNames(-1, "na, asked"))
    }

    out
  }

  # Standard missing codes + a plain no(1)/yes(2) substantive answer.
  yes_no_value_labels <- function(ref = NULL, ...) {
    c(
      standard_missing_codes(ref = ref, ...),
      value_labels("no" = 1, "yes" = 2)
    )
  }

  # Standard missing codes + "not mentioned(0)/mentioned(1)", used for the
  # multi-item checklist-style questions (e.g. reasons for not being active).
  mentioned_value_labels <- function(ref = "lphya39") {
    c(
      standard_missing_codes(ref = ref),
      value_labels("not mentioned" = 0, "mentioned" = 1)
    )
  }

  # Does this variable's codebook consist *only* of negative missing-reason
  # codes (e.g. -3 wrong skip, -2 routing, -1 asked)? LASA046 uses value
  # labels this way for continuous/count variables (minutes, # times, etc.),
  # where the substantive answer itself is an unlabelled non-negative number.
  # Such variables are candidates for `to_numeric = TRUE` restoration.
  is_codebook_numeric <- function(value_label_map) {
    if (is.null(value_label_map) || length(value_label_map) == 0L) {
      return(FALSE)
    }
    codes <- as.numeric(unname(value_label_map))
    all(!is.na(codes) & is.finite(codes) & codes < 0)
  }

  # Strips SPSS/haven value-label attributes and coerces a variable back to
  # an ordinary numeric vector, replacing every negative observed code with
  # NA. This also catches an unexpected negative code that the codebook did
  # not explicitly label. Used when to_numeric = TRUE.
  restore_plain_numeric <- function(x) {
    values <- as.numeric(x)
    values[!is.na(values) & values < 0] <- NA_real_
    values
  }

  # Converts a numeric variable to a factor using its value labels as level
  # text, while preserving every observed value: codes with a value label
  # use that label, and observed codes with no codebook label keep the
  # numeric code itself as their level text. Used when to_factor = TRUE.
  convert_to_labelled_factor <- function(x, value_label_map) {
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

    # factor() would silently merge two distinct codes if their text
    # happened to collide. Not expected in LASA046, but disambiguate
    # defensively so no numeric value is ever lost.
    if (anyDuplicated(level_text)) {
      collided <- unique(level_text[duplicated(level_text) | duplicated(level_text, fromLast = TRUE)])
      for (txt in collided) {
        i <- which(level_text == txt)
        level_text[i] <- paste0(txt, " [", level_codes[i], "]")
      }
    }

    factor(values, levels = level_codes, labels = level_text)
  }

  # Sport-type codes used in waves B-G, before the questionnaire's sport
  # list was redesigned. Waves 2B/F/G add "golf" as an extra category;
  # waves B-E do not have it.
  legacy_sports_common <- value_labels(
    "distance walking" = 1,
    "distance cycling" = 2,
    "gymnastics" = 3,
    "home trainer" = 4,
    "swimming" = 5,
    "(folk)dancing" = 6,
    "bowling" = 7,
    "tennis" = 8,
    "jogging/running/speed walking" = 9,
    "rowing" = 10,
    "sailing" = 11,
    "billiards" = 12,
    "fishing" = 13,
    "soccer/basketball/korfball" = 14,
    "volleybal/baseball" = 15,
    "winter sports" = 16
  )

  # Returns the legacy (pre-wave-H) sport-type value labels for the given
  # wave. Waves outside B-G have no legacy sport coding (they use
  # `new_sports_value_labels` instead, defined below).
  legacy_sports_value_labels <- function(wave) {
    if (wave %in% c("B", "C", "D", "E")) {
      c(legacy_sports_common, value_labels("other sports" = 17))
    } else if (wave %in% c("2B", "F", "G")) {
      c(legacy_sports_common, value_labels("golf" = 17, "other sports" = 18))
    } else {
      numeric(0)
    }
  }

  # Sport-type codes used from wave H onward, after the questionnaire's
  # sport list was redesigned into a two-level (category: sub-type) scheme.
  new_sports_value_labels <- value_labels(
    "walking / hiking: long distance hiking" = 11,
    "walking / hiking: nordic walking" = 12,
    "walking / hiking: speed walking" = 13,
    "cycling: long distance cycling" = 21,
    "cycling: cycle racing / spinning / mountain biking" = 22,
    "cycling: treadmill at home / cycle ergometer at home" = 23,
    "gymnastics and fitness: gymnastics / exercising at home" = 31,
    "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics" = 32,
    "gymnastics and fitness: yoga / tai chi / qi gong / healing tao" = 33,
    "gymnastics and fitness: endurance training" = 34,
    "swimming: swimming" = 41,
    "swimming: aqua gym / aqua jogging" = 42,
    "racket sports: tennis" = 51,
    "racket sports: table tennis" = 52,
    "racket sports: squash" = 53,
    "racket sports: badminton" = 54,
    "running: running / jogging" = 61,
    "water sports: rowing" = 71,
    "water sports: sailing" = 72,
    "water sports: canoeing" = 73,
    "ball sports: soccer" = 81,
    "ball sports: futsal" = 82,
    "ball sports: hockey" = 83,
    "ball sports: volleyball" = 84,
    "ball sports: basketball" = 85,
    "ball sports: baseball / softball" = 86,
    "ball sports: golf / ball throwing game" = 87,
    "ball sports: bowling / skittles / lawn bowling / kolf / bowls" = 88,
    "winter sports: skiing" = 91,
    "winter sports: cross country skiing" = 92,
    "winter sports: ice skating" = 93,
    "animal sports: horse riding" = 101,
    "animal sports: fishing / pigeon racing" = 102,
    "animal sports: dog training / horse carriage driving" = 103,
    "other sports: climbing" = 111,
    "other sports: billiards / darts" = 112,
    "other sports: (folk) dancing" = 113,
    "other sports: other" = 114
  )

  # ---- Matching / labelling audit bookkeeping -------------------------------

  # Every row logged here becomes one line of the "label_report" attribute
  # returned by lasa_label_report(). `rename_plan` collects the (old name ->
  # canonical name) pairs to apply at the very end when
  # standardize_names = TRUE, so renaming never interferes with matching.
  report_rows <- list()
  rename_plan <- character(0)

  record_match_result <- function(suffix, expected_name, matched_name, method) {
    report_rows[[length(report_rows) + 1L]] <<- data.frame(
      suffix = suffix,
      expected_name = expected_name,
      matched_name = if (is.na(matched_name)) NA_character_ else matched_name,
      method = method,
      stringsAsFactors = FALSE
    )
    invisible(NULL)
  }

  # Looks up a single LASA046 column, attaches its variable/value labels,
  # applies the to_factor / to_numeric transformation (if requested), and
  # queues it for renaming (if standardize_names = TRUE). Matching is tried,
  # in order: (1) an explicit name_corrections override, (2) an exact
  # (case-sensitive) name match, (3) a case-insensitive name match. A
  # variable that cannot be matched by any of these is left untouched and
  # recorded as "not found" -- this is expected behaviour, since not every
  # LASA046 wave contains every variable.
  label_variable <- function(suffix, variable_label, value_label_map = NULL) {
    expected_name <- paste0(prefix, suffix)

    if (tolower(suffix) %in% correction_keys) {
      # An explicit manual correction takes priority over automatic matching.
      actual_name <- name_corrections[[match(tolower(suffix), correction_keys)]]
      idx <- match(tolower(actual_name), tolower(names(data)))

      if (is.na(idx)) {
        record_match_result(suffix, expected_name, matched_name = actual_name, method = "manual_not_found")
        return(invisible(NULL))
      }
      method <- "manual correction"

    } else {
      idx <- match(expected_name, names(data))

      if (!is.na(idx)) {
        method <- "exact"
      } else {
        idx <- match(tolower(expected_name), tolower(names(data)))

        if (!is.na(idx)) {
          method <- "case-insensitive exact"
        } else {
          record_match_result(suffix, expected_name, matched_name = NA_character_, method = "not found")
          return(invisible(NULL))
        }
      }
    }

    matched_name <- names(data)[idx]
    x <- data[[idx]]
    attr(x, "label") <- variable_label

    if (!is.null(value_label_map)) {
      attr(x, "labels") <- value_label_map
    }

    # Reshape the variable if requested. to_numeric takes precedence: a
    # variable whose codebook consists only of negative missing codes is
    # always restored to plain numeric, never converted to a factor.
    if (isTRUE(to_numeric) && is_codebook_numeric(value_label_map)) {
      x <- restore_plain_numeric(x)
      attr(x, "label") <- variable_label
    } else if (isTRUE(to_factor) && !is.null(value_label_map) && length(value_label_map) > 0L) {
      x <- convert_to_labelled_factor(x, value_label_map)
      attr(x, "label") <- variable_label
    }

    data[[idx]] <<- x

    record_match_result(suffix, expected_name, matched_name = matched_name, method = method)

    if (isTRUE(standardize_names)) {
      rename_plan[[matched_name]] <<- tolower(expected_name)
    }

    invisible(NULL)
  }

  # Assembles the matching audit, applies the queued column renames (if
  # standardize_names = TRUE), attaches the audit as the generic
  # "label_report" attribute, and returns the finished data. Called once at
  # every exit point of this function (the wave == "MB" early return, and
  # the normal end-of-function return) so both paths get identical treatment.
  finalize_labelled_data <- function() {
    label_report <- if (length(report_rows) > 0L) {
      do.call(rbind, report_rows)
    } else {
      data.frame(
        suffix = character(0), expected_name = character(0),
        matched_name = character(0), method = character(0),
        stringsAsFactors = FALSE
      )
    }

    if (isTRUE(standardize_names) && length(rename_plan) > 0L) {
      old_names <- names(rename_plan)
      new_names <- unname(rename_plan)

      if (anyDuplicated(new_names)) {
        duplicated_names <- unique(new_names[duplicated(new_names)])
        stop(
          "standardize_names = TRUE would create duplicate column names: ",
          paste(duplicated_names, collapse = ", "),
          ". Resolve the conflict with 'name_corrections' or by renaming ",
          "the source column(s) before calling apply_lasa046_labels().",
          call. = FALSE
        )
      }

      idx <- match(old_names, names(data))
      names(data)[idx] <- new_names

      label_report$standardized_to <- new_names[match(label_report$matched_name, old_names)]
    } else {
      label_report$standardized_to <- NA_character_
    }

    rownames(label_report) <- NULL
    attr(data, "label_report") <- label_report
    data
  }

  # ---- LASMB046 has a small, wave-specific subset --------------------------
  # The replenishment-cohort "MB" file only contains a handful of the full
  # LASA046 items, so it is handled as an early return rather than folded
  # into the main variable list below.
  if (wave == "MB") {

    label_variable(
      "lphya07", "Walking outside:last two weeks",
      c(
        standard_missing_codes(
          ref = "lphya06",
          include_interview_terminated = TRUE,
          include_short_interview = TRUE
        ),
        value_labels("no" = 1, "yes" = 2)
      )
    )

    label_variable(
      "lphya08", "Walking outside: #times last two weeks",
      standard_missing_codes(ref = "lphya07")
    )

    label_variable(
      "lphya09", "Walking: time in minutes",
      standard_missing_codes(ref = "lphya07")
    )

    label_variable(
      "lphya11", "Bicycling: last two weeks",
      c(
        standard_missing_codes(
          ref = NULL,
          include_interview_terminated = TRUE,
          include_short_interview = TRUE
        ),
        value_labels("no" = 1, "yes" = 2)
      )
    )

    label_variable(
      "lphya12", "Bicycling: # times last two weeks",
      standard_missing_codes(ref = "lphya11")
    )

    label_variable(
      "lphya13", "Bicycling: time in minutes",
      standard_missing_codes(ref = "lphya11")
    )

    label_variable(
      "lphya21", "Sport 1: past two weeks yes/no",
      c(
        standard_missing_codes(
          ref = NULL,
          include_interview_terminated = TRUE,
          include_short_interview = TRUE
        ),
        value_labels("no" = 1, "yes" = 2)
      )
    )

    label_variable(
      "lphya22", "Sport 1: past two weeks",
      c(standard_missing_codes(ref = "lphya21"), new_sports_value_labels)
    )

    label_variable(
      "lphya23", "Sport 1: # times past two weeks",
      standard_missing_codes(ref = "lphya21")
    )

    label_variable(
      "lphya24", "Sport 1: time in minutes",
      standard_missing_codes(ref = "lphya23")
    )

    label_variable(
      "lphya37", "Heavy household: # days past two weeks",
      standard_missing_codes(
        ref = NULL,
        include_interview_terminated = TRUE,
        include_short_interview = TRUE
      )
    )

    label_variable(
      "lphya38", "Heavy household: time in minutes",
      standard_missing_codes(ref = "lphya36")
    )

    return(finalize_labelled_data())
  }

  # ---- Main LASA 046 variables, in numeric order ---------------------------

  # LPHYA01
  label_variable(
    "lphya01", "Physical condition respondent: observation",
    c(
      standard_missing_codes(
        ref = NULL,
        # From wave H onward the "wrong skip" value label text changes from
        # "na, wrong skip" to "not done, wrong skip" in the documentation.
        wrong_skip_label = if (wave %in% c("H", "3B", "I", "J", "K")) {
          "not done, wrong skip"
        } else {
          "na, wrong skip"
        },
        include_interview_terminated = TRUE,
        include_short_interview = TRUE
      ),
      value_labels(
        "respondent bedridden" = 1,
        "respondent in elec. wheelchair" = 2,
        "respondent in mech. wheelchair" = 3,
        "not 1, 2 or 3" = 4
      )
    )
  )

  # LPHYA02
  label_variable(
    "lphya02", "Wheelchair go outside",
    yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA03
  label_variable(
    "lphya03", "Wheelchair go outside: last two weeks",
    yes_no_value_labels(ref = "lphya02")
  )

  # LPHYA04
  label_variable(
    "lphya04", "Wheelchair go outside: #times last two weeks",
    standard_missing_codes(ref = "lphya03")
  )

  # LPHYA05
  label_variable(
    "lphya05", "Wheelchair: time in minutes",
    standard_missing_codes(ref = "lphya03")
  )

  # LPHYA06
  label_variable(
    "lphya06", "Walking outside",
    yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA07
  label_variable(
    "lphya07", "Walking outside:last two weeks",
    yes_no_value_labels(ref = "lphya06")
  )

  # LPHYA08
  label_variable(
    "lphya08", "Walking outside: #times last two weeks",
    standard_missing_codes(ref = "lphya07")
  )

  # LPHYA09
  label_variable(
    "lphya09", "Walking: time in minutes",
    standard_missing_codes(ref = "lphya07")
  )

  # LPHYA10
  label_variable(
    "lphya10", "Bicycling",
    yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA11
  label_variable(
    "lphya11", "Bicycling: last two weeks",
    yes_no_value_labels(ref = "lphya10")
  )

  # LPHYA12
  label_variable(
    "lphya12", "Bicycling: # times last two weeks",
    standard_missing_codes(ref = "lphya11")
  )

  # LPHYA13
  label_variable(
    "lphya13", "Bicycling: time in minutes",
    standard_missing_codes(ref = "lphya11")
  )

  # LPHYA14 (not in I/J/K)
  label_variable(
    "lphya14", "Have garden: yes/no",
    yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA15
  label_variable(
    "lphya15", "Gardening: yes/no",
    yes_no_value_labels(
      ref = if (wave %in% c("I", "J", "K")) "lphya01" else "lphya14"
    )
  )

  # LPHYA16 (not in I/J/K)
  label_variable(
    "lphya16", "Gardening: # months a year",
    standard_missing_codes(ref = "lphya15")
  )

  # LPHYA17
  label_variable(
    "lphya17", "Gardening: last two weeks",
    yes_no_value_labels(ref = "lphya15")
  )

  # LPHYA18
  label_variable(
    "lphya18", "Gardening: # last two weeks",
    standard_missing_codes(ref = "lphya17")
  )

  # LPHYA19
  label_variable(
    "lphya19", "Gardening: time in minutes",
    standard_missing_codes(ref = "lphya17")
  )

  # LPHYA20 (not in I/J/K)
  label_variable(
    "lphya20", "Gardening: digging last two weeks",
    yes_no_value_labels(ref = "lphya17")
  )

  # LPHYASP (H/3B/I/J/K only)
  label_variable(
    "lphyasp", "Sport: yes/no",
    yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA21
  label_variable(
    "lphya21", "Sport 1: past two weeks yes/no",
    yes_no_value_labels(
      ref = if (wave %in% c("H", "3B", "I", "J", "K")) {
        "lphyasp"
      } else {
        "lphya01"
      }
    )
  )

  # LPHYA22
  label_variable(
    "lphya22", "Sport 1: past two weeks",
    c(
      standard_missing_codes(ref = "lphya21"),
      if (wave %in% c("H", "3B", "I", "J", "K")) {
        new_sports_value_labels
      } else {
        legacy_sports_value_labels(wave)
      }
    )
  )

  # LPHYA23
  label_variable(
    "lphya23", "Sport 1: # times past two weeks",
    standard_missing_codes(ref = "lphya21")
  )

  # LPHYA24
  label_variable(
    "lphya24", "Sport 1: time in minutes",
    standard_missing_codes(ref = "lphya23")
  )

  # LPHYA25
  label_variable(
    "lphya25", "Sport 2: yes/no",
    yes_no_value_labels(ref = "lphya21")
  )

  # LPHYA26
  label_variable(
    "lphya26", "Sport 2: past two weeks",
    c(
      standard_missing_codes(ref = "lphya25"),
      if (wave %in% c("H", "3B", "I", "J", "K")) {
        new_sports_value_labels
      } else {
        legacy_sports_value_labels(wave)
      }
    )
  )

  # LPHYA27
  label_variable(
    "lphya27", "Sport 2: # times past two weeks",
    standard_missing_codes(ref = "lphya25")
  )

  # LPHYA28
  label_variable(
    "lphya28", "Sport 2 : time in minutes",
    standard_missing_codes(ref = "lphya27")
  )

  # LPHYA29 (B/C/D/E/2B/F/G only)
  label_variable(
    "lphya29", "Sport: sweating past two weeks yes/no",
    c(
      standard_missing_codes(ref = "lphya21"),
      value_labels("no" = 1, "yes" = 2, "do not know" = 3)
    )
  )

  # LPHYA30 (B/C/D/E/2B/F/G only)
  label_variable(
    "lphya30", "Sport: #times sweating past two weeks",
    standard_missing_codes(ref = "lphya29")
  )

  # LSPIN1 (3B only) - most intensive sport, introduced in wave 3B
  if (wave == "3B") {
    label_variable(
      "lspin1", "Sport: most intensive",
      c(
        value_labels("sport: most intensive" = -3),
        setNames(
          -2,
          paste0(
            "na, see ", skip_reference_var("lphya22"), " & ",
            skip_reference_var("lphya26")
          )
        ),
        value_labels("na, asked" = -1),
        new_sports_value_labels
      )
    )
  }

  # LSPIN2 (3B only)
  if (wave == "3B") {
    label_variable(
      "lspin2", "Most intensive sport: # times past two weeks",
      standard_missing_codes(ref = "lspin1")
    )
  }

  # LSPIN3 (3B only)
  if (wave == "3B") {
    label_variable(
      "lspin3", "Most intensive sport: time in minutes",
      standard_missing_codes(ref = "lspin2")
    )
  }

  # LPHYA31
  label_variable(
    "lphya31", "Light household: yes/no",
    yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA32
  label_variable(
    "lphya32", "Light household: past two weeks yes/no",
    c(
      standard_missing_codes(ref = "lphya31"),
      value_labels("no" = 1, "yes" = 2, "do not know" = 3, "refusal" = 4)
    )
  )

  # LPHYA33
  label_variable(
    "lphya33", "Light household: # days past two weeks",
    standard_missing_codes(ref = "lphya32")
  )

  # LPHYA34
  label_variable(
    "lphya34", "Light household: time in minutes",
    standard_missing_codes(ref = "lphya32")
  )

  # LPHYA35
  label_variable(
    "lphya35", "Heavy household: yes/no",
    yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA36
  label_variable(
    "lphya36", "Heavy household: past two weeks yes/no",
    c(
      standard_missing_codes(ref = "lphya35"),
      value_labels("no" = 1, "yes" = 2, "do not know" = 3, "refusal" = 4)
    )
  )

  # LPHYA37
  label_variable(
    "lphya37", "Heavy household: # days past two weeks",
    standard_missing_codes(ref = "lphya36")
  )

  # LPHYA38
  label_variable(
    "lphya38", "Heavy household: time in minutes",
    standard_missing_codes(ref = "lphya36")
  )

  # LPHYA39
  label_variable(
    "lphya39", "Past two weeks normal: yes/no",
    yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA40
  label_variable(
    "lphya40", "not normal: sick",
    mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA41
  label_variable(
    "lphya41", "not normal: depressed",
    mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA42
  label_variable(
    "lphya42", "not normal: bad weather",
    mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA43
  label_variable(
    "lphya43", "not normal: family affairs",
    mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA44
  label_variable(
    "lphya44", "not normal: vacation",
    mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA45: meaning changes from wave F onwards (free-text "other reason"
  # in waves B-2B; becomes "cleaning/repairs" checklist item from F onward).
  label_variable(
    "lphya45",
    if (wave %in% c("B", "C", "D", "E", "2B")) {
      "not normal: other reason"
    } else {
      "not normal: cleaning/repairs"
    },
    mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA46: meaning/coding changes from wave F onwards. In waves B-2B this
  # is a coded free-text "other reason" field; from wave F onward it becomes
  # a simple "good weather" checklist item (see LPHYA47-50 below).
  if (wave %in% c("B", "C", "D", "E", "2B")) {

    lphya46_legacy_value_labels <- c(
      setNames(-2, paste0("na, see ", skip_reference_var("lphya45"))),
      if (wave %in% c("D", "E", "2B")) value_labels("-to be coded-" = 0) else numeric(0),
      value_labels(
        "visit from friend/family" = 1,
        "positive activities" = 2,
        "illness partner" = 3,
        "good weather" = 4,
        "decease partner" = 5,
        "business-trip" = 6,
        "removal" = 7,
        "spring cleaning" = 8,
        "rebuilding" = 9,
        "other" = 10
      )
    )

    label_variable(
      "lphya46", "not normal: other reasons coded",
      lphya46_legacy_value_labels
    )

  } else {

    label_variable(
      "lphya46", "not normal: good weather",
      mentioned_value_labels(ref = "lphya39")
    )
  }

  # LPHYA47 (F/G/H/3B/I/J/K only)
  label_variable(
    "lphya47", "not normal: season break",
    mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA48 (F/G/H/3B/I/J/K only)
  label_variable(
    "lphya48", "not normal: sickness partner/others",
    mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA49 (F/G/H/3B/I/J/K only)
  label_variable(
    "lphya49", "not normal: other reason",
    mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA50 (F/G/H/3B/I/J/K only) - coded free-text "other reason", with a
  # COVID-19 category added starting wave K.
  lphya50_value_labels <- c(
    setNames(-2, paste0("na, see ", skip_reference_var("lphya49"))),
    value_labels(
      "visit from friend/family" = 1,
      "positive activities" = 2,
      "illness partner" = 3,
      "good weather" = 4,
      "death partner" = 5,
      "business-trip" = 6,
      "removal/moved" = 7,
      "spring cleaning" = 8,
      "rebuilding" = 9,
      "other" = 10
    ),
    if (wave == "K") value_labels("COVID19" = 11) else numeric(0)
  )

  label_variable(
    "lphya50", "not normal: other reasons coded",
    lphya50_value_labels
  )

  finalize_labelled_data()
}

# ---------------------------------------------------------------------------
# Optional quick checks after applying labels
# ---------------------------------------------------------------------------
# attr(dat$bphya01, "label")   # variable label
# attr(dat$bphya01, "labels")  # value labels
#
# If you use the labelled package:
# labelled::var_label(dat$bphya01)
# labelled::val_labels(dat$bphya01)
#
# With to_factor = TRUE (and to_numeric = FALSE for that variable):
# levels(dat$bphya01)
# Codes with codebook value labels appear under those labels; observed
# codes without a codebook label remain present, using the numeric code
# itself as the level text.
#
# With to_numeric = TRUE:
# dat <- apply_lasa046_labels(dat, wave = "B", to_numeric = TRUE)
# Count/continuous variables (identified because every codebook value label
# is a negative missing-reason code) become ordinary numeric vectors, all
# negative values become NA, and the variable label is retained.
#
# With standardize_names = TRUE:
# dat <- apply_lasa046_labels(dat, wave = "B", standardize_names = TRUE)
# names(dat)
# Matched activity variables are renamed to their canonical lowercase LASA
# documentation names, e.g. "blphya01", "blphya02", etc.
#
# To inspect which variables could not be matched:
# lasa_label_report(dat, problems_only = TRUE)
