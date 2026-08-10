# LASA 046 (LAPAQ / Physical activity) metadata
#
# File-specific implementation for applying SPSS variable labels and value
# labels to LASA 046 data. Generic file reading, dispatch, and audit inspection
# are implemented in `lasa_io.R` through `read_lasa_sav()` and
# `lasa_label_report()`.
#
# Metadata source:
#   LASA046_varinfo_PhysicalActivity.pdf, 19-Jan-2024.
#
# The implementation is intentionally wave-aware because B, 2B, 3B, and MB
# all use a `b` variable prefix while questionnaire content/coding differs
# between several of those waves.

#' Normalize a LASA 046 variable name for matching
#'
#' Internal helper used to compare LASA variable names case-insensitively and
#' while ignoring punctuation such as underscores. It does not rename columns;
#' canonical renaming is handled by [apply_lasa046_labels()] when
#' `standardize_names = TRUE`.
#'
#' @param x Character vector of variable names.
#'
#' @return Lowercase alphanumeric character vector.
#' @keywords internal
.lasa046_normalize_variable_name <- function(x) {
  tolower(gsub("[^[:alnum:]]", "", x))
}

#' Apply LASA 046 variable labels, value labels, and optional harmonisation
#'
#' Applies metadata documented for LASA file 046 (LAPAQ / Physical activity)
#' to a single LASA wave data set. The function is designed for data imported
#' from SPSS with [haven::read_sav()] but can be used on an equivalent data
#' frame or tibble already present in R.
#'
#' @param data A data frame or tibble containing one LASA 046 data file.
#' @param wave Character scalar identifying the LASA measurement wave. Supported
#'   values are `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`, `"G"`, `"H"`,
#'   `"3B"`, `"MB"`, `"I"`, `"J"`, and `"K"`. Matching is case-insensitive.
#'   The wave must be supplied explicitly because B, 2B, 3B, and MB all use a
#'   `b` variable-name prefix while some labels and coding rules differ.
#' @param fuzzy_match Logical scalar. If `TRUE` (default), permit conservative
#'   fuzzy matching for likely variable-name typing errors after exact,
#'   case-insensitive, and punctuation-insensitive matching have failed.
#' @param max_edit_distance Non-negative integer giving the maximum edit
#'   distance accepted for automatic fuzzy matching. Defaults to `1`.
#' @param name_corrections Optional named character vector for explicit
#'   variable-name corrections. Vector names are canonical LASA suffixes (or
#'   `"respnr"`) and values are the corresponding column names in `data`, for
#'   example `c(lphya08 = "BLPYA08", respnr = "RespNrr")`. Explicit
#'   corrections take precedence over automatic matching.
#' @param warn_unmatched Logical scalar. If `TRUE` (default), issue a warning
#'   when an expected variable cannot be matched confidently, a match is
#'   ambiguous, a manual correction fails, or the respondent identifier has to
#'   be inferred from first-column position. Successful fuzzy matches are
#'   reported by message and in the audit but do not by themselves trigger this
#'   warning.
#' @param to_factor Logical scalar. If `FALSE` (default), variables with
#'   substantive value labels remain numeric/haven-labelled and receive
#'   SPSS-style `"labels"` attributes. If `TRUE`, those variables are converted
#'   to factors using the LASA value labels as factor-level labels. Any observed
#'   value without a codebook value label is retained as its own factor level
#'   rather than being converted to `NA`.
#' @param to_numeric Logical scalar. If `FALSE` (default), count, duration, and
#'   other numeric variables retain their documented negative missing-reason
#'   value labels. If `TRUE`, a variable is treated as substantive numeric when
#'   every value label documented for it is a negative missing-reason code.
#'   Such variables are converted to ordinary numeric vectors, every observed
#'   value below zero is replaced by `NA`, and all non-negative values are
#'   retained. For these variables `to_numeric = TRUE` takes precedence over
#'   `to_factor = TRUE`.
#' @param standardize_names Logical scalar. If `FALSE` (default), the original
#'   source column names are retained. If `TRUE`, every successfully matched
#'   LASA 046 variable is renamed to the canonical lowercase LASA documentation
#'   name for the supplied wave (for example `blphya01`, `clphya26`, or
#'   `klphya50`) and the first-column respondent identifier is renamed
#'   `respnr`. Unmatched non-046 columns are left unchanged.
#'
#' @details
#' **Variable-name matching.** Matching proceeds in the following order:
#'
#' 1. explicit `name_corrections`;
#' 2. exact name;
#' 3. case-insensitive exact name;
#' 4. normalized exact name, ignoring punctuation/underscores;
#' 5. optionally, a unique fuzzy match within `max_edit_distance`.
#'
#' Fuzzy matching is deliberately conservative. Correctly formed LASA 046
#' names belonging to another questionnaire item are protected from being
#' selected merely because their edit distance is small.
#'
#' **Respondent number.** The first column is expected to contain the
#' respondent number. Capitalization and minor spelling variants of `respnr`
#' are handled by the same matching logic. Because first-column position is a
#' structural invariant of these files, the first column is used as a final
#' fallback when its name cannot be matched; this is flagged in the audit.
#'
#' **Numeric versus categorical conversion.** `to_numeric` does not simply
#' convert every labelled variable to numeric. A variable is identified as a
#' substantive numeric variable only when all of its codebook value labels are
#' negative missing-reason codes. This distinguishes variables such as numbers
#' of occasions and minutes from categorical variables whose substantive codes
#' have labels such as `"no"`, `"yes"`, or sport categories.
#'
#' When both `to_factor = TRUE` and `to_numeric = TRUE`, numeric/count/duration
#' variables become ordinary numeric vectors with negative codes set to `NA`,
#' while categorical variables become factors.
#'
#' **Name harmonisation.** Canonical renaming is performed only after all
#' matching is complete, so changing an earlier column name cannot alter later
#' matching decisions. The function stops rather than creating duplicate names
#' if a canonical name would collide with another column.
#'
#' **Audit and provenance.** The returned object contains a generic matching
#' audit in `attr(x, "label_report")`. It also receives `"LASA_wave"`,
#' `"LASA_file_code"`, and `"LASA_names_standardized"` attributes. These generic
#' names are shared with other future LASA label implementations and can be
#' inspected through [lasa_label_report()].
#'
#' @return `data` with LASA 046 variable metadata applied and, depending on the
#'   requested options, variables converted to factors/numeric vectors and/or
#'   names harmonised. The object carries the generic attributes
#'   `"label_report"`, `"LASA_wave"`, `"LASA_file_code"`, and
#'   `"LASA_names_standardized"`.
#'
#' @seealso [read_lasa_sav()], [lasa_label_report()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = c(101, 102, 103),
#'   BLPHYA07 = c(1, 2, -1),
#'   BLPYA08 = c(4, -1, 7)
#' )
#'
#' dat <- apply_lasa046_labels(
#'   dat,
#'   wave = "B",
#'   fuzzy_match = TRUE,
#'   to_factor = TRUE,
#'   to_numeric = TRUE,
#'   standardize_names = TRUE,
#'   warn_unmatched = FALSE
#' )
#'
#' names(dat)[1:3]
#' levels(dat$blphya07)
#' dat$blphya08
#' lasa_label_report(dat, problems_only = TRUE)

apply_lasa046_labels <- function(data,
                                 wave,
                                 fuzzy_match = TRUE,
                                 max_edit_distance = 1L,
                                 name_corrections = NULL,
                                 warn_unmatched = TRUE,
                                 to_factor = FALSE,
                                 to_numeric = FALSE,
                                 standardize_names = FALSE) {

  if (length(wave) != 1L || is.na(wave) || !is.character(wave) || !nzchar(wave)) {
    stop("'wave' must be a single non-empty character value.", call. = FALSE)
  }
  wave <- toupper(wave)

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

  if (length(fuzzy_match) != 1L || is.na(fuzzy_match) || !is.logical(fuzzy_match)) {
    stop("'fuzzy_match' must be TRUE or FALSE.", call. = FALSE)
  }

  if (length(warn_unmatched) != 1L || is.na(warn_unmatched) ||
      !is.logical(warn_unmatched)) {
    stop("'warn_unmatched' must be TRUE or FALSE.", call. = FALSE)
  }

  if (!is.null(name_corrections) && !is.character(name_corrections)) {
    stop("'name_corrections' must be NULL or a named character vector.", call. = FALSE)
  }

  if (length(to_factor) != 1L || is.na(to_factor) || !is.logical(to_factor)) {
    stop("'to_factor' must be TRUE or FALSE.")
  }

  if (length(to_numeric) != 1L || is.na(to_numeric) || !is.logical(to_numeric)) {
    stop("'to_numeric' must be TRUE or FALSE.")
  }

  if (length(standardize_names) != 1L || is.na(standardize_names) ||
      !is.logical(standardize_names)) {
    stop("'standardize_names' must be TRUE or FALSE.")
  }

  if (length(max_edit_distance) != 1L || is.na(max_edit_distance) ||
      !is.numeric(max_edit_distance) || max_edit_distance < 0 ||
      max_edit_distance != as.integer(max_edit_distance)) {
    stop("'max_edit_distance' must be a single non-negative integer.")
  }
  max_edit_distance <- as.integer(max_edit_distance)

  # ---- Helpers -------------------------------------------------------------

  make_value_labels <- function(...) {
    # Named numeric vector: names = value labels, values = numeric codes.
    c(...)
  }

  make_reference_variable_name <- function(suffix) {
    toupper(paste0(prefix, suffix))
  }

  make_missing_value_labels <- function(ref = NULL,
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
      out <- c(out, setNames(-2, paste0("na, see ", make_reference_variable_name(ref))))
    }
    if (include_asked) {
      out <- c(out, setNames(-1, "na, asked"))
    }

    out
  }

  make_yes_no_value_labels <- function(ref = NULL, ...) {
    c(
      make_missing_value_labels(ref = ref, ...),
      make_value_labels("no" = 1, "yes" = 2)
    )
  }

  make_mentioned_value_labels <- function(ref = "lphya39") {
    c(
      make_missing_value_labels(ref = ref),
      make_value_labels("not mentioned" = 0, "mentioned" = 1)
    )
  }

  value_labels_indicate_numeric_variable <- function(value_labels) {
    # LASA046 uses value labels on continuous/count variables only to document
    # negative missing-reason codes (e.g. -3 wrong skip, -2 routing, -1 asked).
    # If every labelled code is negative, interpret the substantive values as
    # numeric rather than categorical when to_numeric = TRUE.
    if (is.null(value_labels) || length(value_labels) == 0L) {
      return(FALSE)
    }

    codes <- as.numeric(unname(value_labels))
    all(!is.na(codes) & is.finite(codes) & codes < 0)
  }

  convert_negative_codes_to_na_numeric <- function(x) {
    # Strip SPSS/haven value-label and user-missing attributes by coercing to an
    # ordinary numeric vector, then make every negative observed code missing.
    # This also catches an unexpected negative code that was not explicitly
    # labelled in the codebook.
    values <- as.numeric(x)
    values[!is.na(values) & values < 0] <- NA_real_
    values
  }

  convert_to_factor_with_value_labels <- function(x, value_labels) {
    # Convert a numeric SPSS/haven variable to a factor while preserving every
    # observed value. Codes with a value label use that label as their factor
    # level; observed codes without a value label use the numeric code itself.
    # Codebook-labelled values are retained as levels even when unobserved.

    if (!is.numeric(x) && !is.integer(x)) {
      stop(
        "Cannot apply LASA046 numeric value labels as factor levels to a ",
        "non-numeric variable (class: ", paste(class(x), collapse = "/"), ")."
      )
    }

    values <- as.numeric(x)
    label_codes <- as.numeric(unname(value_labels))
    label_text <- names(value_labels)

    # A value-label vector should have one label per numeric code. If a code is
    # accidentally repeated, retain the first definition rather than creating
    # duplicate factor specifications.
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

    # factor() would merge two distinct codes if their displayed labels happened
    # to be identical. This should not occur in LASA046, but disambiguate such a
    # case defensively so no numeric value is lost.
    if (anyDuplicated(level_text)) {
      duplicated_text <- unique(level_text[duplicated(level_text) | duplicated(level_text, fromLast = TRUE)])
      for (txt in duplicated_text) {
        ii <- which(level_text == txt)
        level_text[ii] <- paste0(txt, " [", level_codes[ii], "]")
      }
    }

    factor(
      values,
      levels = level_codes,
      labels = level_text
    )
  }

  sports_old_common <- make_value_labels(
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

  get_legacy_sport_value_labels <- function(wave) {
    if (wave %in% c("B", "C", "D", "E")) {
      c(sports_old_common, make_value_labels("other sports" = 17))
    } else if (wave %in% c("2B", "F", "G")) {
      c(sports_old_common, make_value_labels("golf" = 17, "other sports" = 18))
    } else {
      numeric(0)
    }
  }

  sports_new <- make_value_labels(
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

  # ---- Robust variable-name matching --------------------------------------

  # Every valid main-file suffix is protected from fuzzy matching to another
  # variable. This prevents, for example, a missing LPHYA01 from being matched
  # to a correctly named LPHYA02 merely because their edit distance is one.
  all_main_suffixes <- c(
    sprintf("lphya%02d", 1:50),
    "lphyasp", "lspin1", "lspin2", "lspin3"
  )

  mb_suffixes <- c(
    "lphya07", "lphya08", "lphya09",
    "lphya11", "lphya12", "lphya13",
    "lphya21", "lphya22", "lphya23", "lphya24",
    "lphya37", "lphya38"
  )

  protected_suffixes <- if (wave == "MB") mb_suffixes else all_main_suffixes
  protected_names <- .lasa046_normalize_variable_name(paste0(prefix, protected_suffixes))

  # name_corrections is a named character vector:
  #   c(lphya08 = "BLPYA08", lphya31 = "BPHY31")
  if (!is.null(name_corrections)) {
    if (is.null(names(name_corrections)) || any(names(name_corrections) == "")) {
      stop(
        "'name_corrections' must be a named character vector, e.g. ",
        "c(lphya08 = 'BLPYA08')."
      )
    }
    correction_keys <- tolower(names(name_corrections))
  } else {
    correction_keys <- character(0)
  }

  used_columns <- integer(0)
  report_rows <- list()
  rename_plan <- character(0)

  append_label_report_row <- function(suffix, expected, matched = NA_character_,
                         method, edit_distance = NA_integer_, note = NA_character_,
                         standardized_to = NA_character_) {
    report_rows[[length(report_rows) + 1L]] <<- data.frame(
      suffix = suffix,
      expected = expected,
      matched = matched,
      method = method,
      edit_distance = edit_distance,
      standardized_to = standardized_to,
      note = note,
      stringsAsFactors = FALSE
    )
  }

  queue_standardized_variable_name <- function(idx, expected) {
    if (isTRUE(standardize_names)) {
      rename_plan[as.character(idx)] <<- expected
    }
  }

  match_respondent_id_column <- function() {
    nms <- names(data)
    if (length(nms) == 0L) {
      return(list(
        idx = NA_integer_, expected = "respnr", method = "not found",
        distance = NA_integer_, note = "The data set has no columns."
      ))
    }

    expected <- "respnr"
    actual <- nms[[1L]]
    actual_norm <- .lasa046_normalize_variable_name(actual)
    expected_norm <- .lasa046_normalize_variable_name(expected)

    # Explicit correction for the respondent identifier. The respondent number
    # is structurally required to be the first column; a correction pointing to
    # another column is therefore rejected.
    key <- match("respnr", correction_keys)
    if (!is.na(key)) {
      requested <- unname(name_corrections[[key]])
      idx <- match(requested, nms)
      if (is.na(idx)) idx <- match(tolower(requested), tolower(nms))
      if (is.na(idx)) {
        return(list(
          idx = 1L, expected = expected, method = "position assumed",
          distance = as.integer(utils::adist(expected_norm, actual_norm)),
          note = paste0(
            "Manual correction '", requested,
            "' was not found; first column '", actual,
            "' retained as respondent identifier by position."
          )
        ))
      }
      if (idx != 1L) {
        stop(
          "The LASA respondent identifier must be the first column, but the ",
          "manual correction for 'respnr' points to column ", idx, " ('",
          nms[[idx]], "')."
        )
      }
      return(list(
        idx = 1L, expected = expected, method = "manual", distance = 0L,
        note = NA_character_
      ))
    }

    if (identical(actual, expected)) {
      return(list(idx = 1L, expected = expected, method = "exact",
                  distance = 0L, note = NA_character_))
    }
    if (tolower(actual) == expected) {
      return(list(idx = 1L, expected = expected,
                  method = "case-insensitive exact", distance = 0L,
                  note = NA_character_))
    }
    if (actual_norm == expected_norm) {
      return(list(idx = 1L, expected = expected, method = "normalized exact",
                  distance = 0L, note = NA_character_))
    }

    distance <- as.integer(utils::adist(expected_norm, actual_norm))
    if (isTRUE(fuzzy_match) && distance <= as.integer(max_edit_distance)) {
      return(list(
        idx = 1L, expected = expected, method = "fuzzy", distance = distance,
        note = paste0(
          "Unique fuzzy match: respnr -> ", actual,
          " (edit distance ", distance, "; first column)."
        )
      ))
    }

    # The file structure supplies an additional invariant: column 1 is the
    # respondent number. Use it as a final fallback even for a larger typo.
    list(
      idx = 1L, expected = expected, method = "position assumed",
      distance = distance,
      note = paste0(
        "First column '", actual,
        "' assumed to be respondent identifier by LASA file position."
      )
    )
  }

  # Process and reserve the respondent identifier before matching LAPAQ items.
  respnr_info <- match_respondent_id_column()
  if (!is.na(respnr_info$idx)) {
    original_respnr_name <- names(data)[respnr_info$idx]
    used_columns <- unique(c(used_columns, respnr_info$idx))
    queue_standardized_variable_name(respnr_info$idx, "respnr")
    append_label_report_row(
      suffix = "respnr", expected = "respnr",
      matched = original_respnr_name, method = respnr_info$method,
      edit_distance = respnr_info$distance, note = respnr_info$note,
      standardized_to = if (isTRUE(standardize_names)) "respnr" else NA_character_
    )
  }

  match_lasa046_variable_column <- function(suffix) {
    expected <- paste0(prefix, suffix)
    nms <- names(data)
    nms_lower <- tolower(nms)
    nms_norm <- .lasa046_normalize_variable_name(nms)
    expected_lower <- tolower(expected)
    expected_norm <- .lasa046_normalize_variable_name(expected)

    # 1. Explicit manual correction has highest priority.
    key <- match(tolower(suffix), correction_keys)
    if (!is.na(key)) {
      requested <- unname(name_corrections[[key]])
      idx <- match(requested, nms)
      if (is.na(idx)) idx <- match(tolower(requested), nms_lower)
      if (is.na(idx)) {
        return(list(
          idx = NA_integer_, expected = expected, method = "manual_not_found",
          distance = NA_integer_,
          note = paste0("Manual correction '", requested, "' is not in the dataset.")
        ))
      }
      if (idx %in% used_columns) {
        return(list(
          idx = NA_integer_, expected = expected, method = "manual_conflict",
          distance = NA_integer_,
          note = paste0("Manual correction '", requested, "' was already used.")
        ))
      }
      return(list(
        idx = idx, expected = expected, method = "manual", distance = 0L,
        note = NA_character_
      ))
    }

    # 2. Exact spelling/case.
    idx <- match(expected, nms)
    if (!is.na(idx) && !(idx %in% used_columns)) {
      return(list(
        idx = idx, expected = expected, method = "exact", distance = 0L,
        note = NA_character_
      ))
    }

    # 3. Case-insensitive exact match.
    hits <- which(nms_lower == expected_lower & !(seq_along(nms) %in% used_columns))
    if (length(hits) == 1L) {
      return(list(
        idx = hits, expected = expected, method = "case-insensitive exact",
        distance = 0L, note = NA_character_
      ))
    }
    if (length(hits) > 1L) {
      return(list(
        idx = NA_integer_, expected = expected, method = "ambiguous",
        distance = 0L,
        note = paste("Multiple case-insensitive matches:", paste(nms[hits], collapse = ", "))
      ))
    }

    # 4. Normalized exact match: ignores punctuation/underscores and case.
    hits <- which(nms_norm == expected_norm & !(seq_along(nms) %in% used_columns))
    if (length(hits) == 1L) {
      return(list(
        idx = hits, expected = expected, method = "normalized exact",
        distance = 0L, note = NA_character_
      ))
    }
    if (length(hits) > 1L) {
      return(list(
        idx = NA_integer_, expected = expected, method = "ambiguous",
        distance = 0L,
        note = paste("Multiple normalized matches:", paste(nms[hits], collapse = ", "))
      ))
    }

    # 5. Conservative fuzzy matching for likely typing errors.
    if (isTRUE(fuzzy_match)) {
      candidate_idx <- setdiff(seq_along(nms), used_columns)

      # Never fuzzy-match to a column that is itself a correctly formed LASA046
      # variable name for another suffix.
      is_protected_other <- nms_norm[candidate_idx] %in%
        protected_names[protected_names != expected_norm]
      candidate_idx <- candidate_idx[!is_protected_other]

      if (length(candidate_idx) > 0L) {
        d <- as.integer(utils::adist(expected_norm, nms_norm[candidate_idx]))
        min_d <- min(d)
        best <- candidate_idx[d == min_d]

        if (min_d <= as.integer(max_edit_distance) && length(best) == 1L) {
          return(list(
            idx = best, expected = expected, method = "fuzzy",
            distance = min_d,
            note = paste0(
              "Unique fuzzy match: ", expected, " -> ", nms[best],
              " (edit distance ", min_d, ")."
            )
          ))
        }

        if (min_d <= as.integer(max_edit_distance) && length(best) > 1L) {
          return(list(
            idx = NA_integer_, expected = expected, method = "ambiguous fuzzy",
            distance = min_d,
            note = paste(
              "Multiple equally close fuzzy matches:",
              paste(nms[best], collapse = ", ")
            )
          ))
        }
      }
    }

    list(
      idx = NA_integer_, expected = expected, method = "not found",
      distance = NA_integer_, note = NA_character_
    )
  }

  apply_metadata_to_variable <- function(suffix, variable_label, value_labels = NULL) {
    match_info <- match_lasa046_variable_column(suffix)

    if (is.na(match_info$idx)) {
      append_label_report_row(
        suffix = suffix, expected = match_info$expected,
        method = match_info$method, edit_distance = match_info$distance,
        note = match_info$note
      )
      return(invisible(NULL))
    }

    idx <- match_info$idx
    x <- data[[idx]]

    codebook_numeric <- value_labels_indicate_numeric_variable(value_labels)

    if (isTRUE(to_numeric) && codebook_numeric) {
      # to_numeric takes precedence over to_factor for variables whose only
      # codebook value labels are negative missing-reason codes.
      x <- convert_negative_codes_to_na_numeric(x)
      attr(x, "label") <- variable_label

    } else if (!is.null(value_labels) && isTRUE(to_factor)) {
      x <- convert_to_factor_with_value_labels(x, value_labels)
      # factor() removes the original SPSS/haven attributes, so re-apply the
      # variable label after conversion. Value labels are now the factor levels.
      attr(x, "label") <- variable_label

    } else {
      attr(x, "label") <- variable_label

      if (!is.null(value_labels)) {
        attr(x, "labels") <- value_labels
      }
    }

    data[[idx]] <<- x
    used_columns <<- c(used_columns, idx)
    original_name <- names(data)[idx]
    queue_standardized_variable_name(idx, match_info$expected)

    append_label_report_row(
      suffix = suffix, expected = match_info$expected, matched = original_name,
      method = match_info$method, edit_distance = match_info$distance,
      note = match_info$note,
      standardized_to = if (isTRUE(standardize_names)) match_info$expected else NA_character_
    )

    invisible(NULL)
  }

  finalize_label_application <- function() {
    report <- if (length(report_rows)) {
      do.call(rbind, report_rows)
    } else {
      data.frame(
        suffix = character(), expected = character(), matched = character(),
        method = character(), edit_distance = integer(),
        standardized_to = character(), note = character(),
        stringsAsFactors = FALSE
      )
    }

    # Mark rows that deserve review. Fuzzy matches are retained as successful
    # matches but are still flagged in the audit; failed/ambiguous matches and
    # position-based respondent-number assumptions are also flagged.
    review_methods <- c(
      "fuzzy", "not found", "ambiguous", "ambiguous fuzzy",
      "manual_not_found", "manual_conflict", "position assumed"
    )
    report$problem <- report$method %in% review_methods

    if (isTRUE(standardize_names) && length(rename_plan) > 0L) {
      new_names <- names(data)
      rename_idx <- as.integer(names(rename_plan))
      new_names[rename_idx] <- unname(rename_plan)

      duplicated_names <- unique(new_names[duplicated(new_names)])
      if (length(duplicated_names) > 0L) {
        stop(
          "standardize_names = TRUE would create duplicate column name(s): ",
          paste(duplicated_names, collapse = ", "),
          ". Resolve the conflicting source names before standardizing."
        )
      }

      names(data) <- new_names
    }

    attr(data, "label_report") <- report
    attr(data, "LASA_wave") <- wave
    attr(data, "LASA_names_standardized") <- isTRUE(standardize_names)
    attr(data, "LASA_file_code") <- "046"

    fuzzy_rows <- report$method == "fuzzy"
    if (any(fuzzy_rows)) {
      for (i in which(fuzzy_rows)) {
        message("LASA046: ", report$note[i])
      }
    }

    warning_methods <- c(
      "not found", "ambiguous", "ambiguous fuzzy",
      "manual_not_found", "manual_conflict", "position assumed"
    )
    warning_rows <- report$method %in% warning_methods

    if (isTRUE(warn_unmatched) && any(warning_rows)) {
      warning(
        sum(warning_rows),
        " LASA046 variable-name match(es) require attention. ",
        "Run lasa_label_report(data, problems_only = TRUE) for details.",
        call. = FALSE
      )
    }

    data
  }

  # ---- LASMB046 has a small, wave-specific subset --------------------------
  if (wave == "MB") {

    apply_metadata_to_variable(
      "lphya07", "Walking outside:last two weeks",
      c(
        make_missing_value_labels(
          ref = "lphya06",
          include_interview_terminated = TRUE,
          include_short_interview = TRUE
        ),
        make_value_labels("no" = 1, "yes" = 2)
      )
    )

    apply_metadata_to_variable(
      "lphya08", "Walking outside: #times last two weeks",
      make_missing_value_labels(ref = "lphya07")
    )

    apply_metadata_to_variable(
      "lphya09", "Walking: time in minutes",
      make_missing_value_labels(ref = "lphya07")
    )

    apply_metadata_to_variable(
      "lphya11", "Bicycling: last two weeks",
      c(
        make_missing_value_labels(
          ref = NULL,
          include_interview_terminated = TRUE,
          include_short_interview = TRUE
        ),
        make_value_labels("no" = 1, "yes" = 2)
      )
    )

    apply_metadata_to_variable(
      "lphya12", "Bicycling: # times last two weeks",
      make_missing_value_labels(ref = "lphya11")
    )

    apply_metadata_to_variable(
      "lphya13", "Bicycling: time in minutes",
      make_missing_value_labels(ref = "lphya11")
    )

    apply_metadata_to_variable(
      "lphya21", "Sport 1: past two weeks yes/no",
      c(
        make_missing_value_labels(
          ref = NULL,
          include_interview_terminated = TRUE,
          include_short_interview = TRUE
        ),
        make_value_labels("no" = 1, "yes" = 2)
      )
    )

    apply_metadata_to_variable(
      "lphya22", "Sport 1: past two weeks",
      c(make_missing_value_labels(ref = "lphya21"), sports_new)
    )

    apply_metadata_to_variable(
      "lphya23", "Sport 1: # times past two weeks",
      make_missing_value_labels(ref = "lphya21")
    )

    apply_metadata_to_variable(
      "lphya24", "Sport 1: time in minutes",
      make_missing_value_labels(ref = "lphya23")
    )

    apply_metadata_to_variable(
      "lphya37", "Heavy household: # days past two weeks",
      make_missing_value_labels(
        ref = NULL,
        include_interview_terminated = TRUE,
        include_short_interview = TRUE
      )
    )

    apply_metadata_to_variable(
      "lphya38", "Heavy household: time in minutes",
      make_missing_value_labels(ref = "lphya36")
    )

    return(finalize_label_application())
  }

  # ---- Main LASA 046 variables, in numeric order ---------------------------

  # LPHYA01
  apply_metadata_to_variable(
    "lphya01", "Physical condition respondent: observation",
    c(
      make_missing_value_labels(
        ref = NULL,
        wrong_skip_label = if (wave %in% c("H", "3B", "I", "J", "K")) {
          "not done, wrong skip"
        } else {
          "na, wrong skip"
        },
        include_interview_terminated = TRUE,
        include_short_interview = TRUE
      ),
      make_value_labels(
        "respondent bedridden" = 1,
        "respondent in elec. wheelchair" = 2,
        "respondent in mech. wheelchair" = 3,
        "not 1, 2 or 3" = 4
      )
    )
  )

  # LPHYA02
  apply_metadata_to_variable(
    "lphya02", "Wheelchair go outside",
    make_yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA03
  apply_metadata_to_variable(
    "lphya03", "Wheelchair go outside: last two weeks",
    make_yes_no_value_labels(ref = "lphya02")
  )

  # LPHYA04
  apply_metadata_to_variable(
    "lphya04", "Wheelchair go outside: #times last two weeks",
    make_missing_value_labels(ref = "lphya03")
  )

  # LPHYA05
  apply_metadata_to_variable(
    "lphya05", "Wheelchair: time in minutes",
    make_missing_value_labels(ref = "lphya03")
  )

  # LPHYA06
  apply_metadata_to_variable(
    "lphya06", "Walking outside",
    make_yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA07
  apply_metadata_to_variable(
    "lphya07", "Walking outside:last two weeks",
    make_yes_no_value_labels(ref = "lphya06")
  )

  # LPHYA08
  apply_metadata_to_variable(
    "lphya08", "Walking outside: #times last two weeks",
    make_missing_value_labels(ref = "lphya07")
  )

  # LPHYA09
  apply_metadata_to_variable(
    "lphya09", "Walking: time in minutes",
    make_missing_value_labels(ref = "lphya07")
  )

  # LPHYA10
  apply_metadata_to_variable(
    "lphya10", "Bicycling",
    make_yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA11
  apply_metadata_to_variable(
    "lphya11", "Bicycling: last two weeks",
    make_yes_no_value_labels(ref = "lphya10")
  )

  # LPHYA12
  apply_metadata_to_variable(
    "lphya12", "Bicycling: # times last two weeks",
    make_missing_value_labels(ref = "lphya11")
  )

  # LPHYA13
  apply_metadata_to_variable(
    "lphya13", "Bicycling: time in minutes",
    make_missing_value_labels(ref = "lphya11")
  )

  # LPHYA14 (not in I/J/K)
  if (wave %in% c("B", "C", "D", "E", "2B", "F", "G", "H", "3B")) {
    apply_metadata_to_variable(
      "lphya14", "Have garden: yes/no",
      make_yes_no_value_labels(ref = "lphya01")
    )
  }

  # LPHYA15
  apply_metadata_to_variable(
    "lphya15", "Gardening: yes/no",
    make_yes_no_value_labels(
      ref = if (wave %in% c("I", "J", "K")) "lphya01" else "lphya14"
    )
  )

  # LPHYA16 (not in I/J/K)
  if (wave %in% c("B", "C", "D", "E", "2B", "F", "G", "H", "3B")) {
    apply_metadata_to_variable(
      "lphya16", "Gardening: # months a year",
      make_missing_value_labels(ref = "lphya15")
    )
  }

  # LPHYA17
  apply_metadata_to_variable(
    "lphya17", "Gardening: last two weeks",
    make_yes_no_value_labels(ref = "lphya15")
  )

  # LPHYA18
  apply_metadata_to_variable(
    "lphya18", "Gardening: # last two weeks",
    make_missing_value_labels(ref = "lphya17")
  )

  # LPHYA19
  apply_metadata_to_variable(
    "lphya19", "Gardening: time in minutes",
    make_missing_value_labels(ref = "lphya17")
  )

  # LPHYA20 (not in I/J/K)
  if (wave %in% c("B", "C", "D", "E", "2B", "F", "G", "H", "3B")) {
    apply_metadata_to_variable(
      "lphya20", "Gardening: digging last two weeks",
      make_yes_no_value_labels(ref = "lphya17")
    )
  }

  # LPHYASP (H/3B/I/J/K only)
  if (wave %in% c("H", "3B", "I", "J", "K")) {
    apply_metadata_to_variable(
      "lphyasp", "Sport: yes/no",
      make_yes_no_value_labels(ref = "lphya01")
    )
  }

  # LPHYA21
  apply_metadata_to_variable(
    "lphya21", "Sport 1: past two weeks yes/no",
    make_yes_no_value_labels(
      ref = if (wave %in% c("H", "3B", "I", "J", "K")) {
        "lphyasp"
      } else {
        "lphya01"
      }
    )
  )

  # LPHYA22
  apply_metadata_to_variable(
    "lphya22", "Sport 1: past two weeks",
    c(
      make_missing_value_labels(ref = "lphya21"),
      if (wave %in% c("H", "3B", "I", "J", "K")) sports_new else get_legacy_sport_value_labels(wave)
    )
  )

  # LPHYA23
  apply_metadata_to_variable(
    "lphya23", "Sport 1: # times past two weeks",
    make_missing_value_labels(ref = "lphya21")
  )

  # LPHYA24
  apply_metadata_to_variable(
    "lphya24", "Sport 1: time in minutes",
    make_missing_value_labels(ref = "lphya23")
  )

  # LPHYA25
  apply_metadata_to_variable(
    "lphya25", "Sport 2: yes/no",
    make_yes_no_value_labels(ref = "lphya21")
  )

  # LPHYA26
  apply_metadata_to_variable(
    "lphya26", "Sport 2: past two weeks",
    c(
      make_missing_value_labels(ref = "lphya25"),
      if (wave %in% c("H", "3B", "I", "J", "K")) sports_new else get_legacy_sport_value_labels(wave)
    )
  )

  # LPHYA27
  apply_metadata_to_variable(
    "lphya27", "Sport 2: # times past two weeks",
    make_missing_value_labels(ref = "lphya25")
  )

  # LPHYA28
  apply_metadata_to_variable(
    "lphya28", "Sport 2 : time in minutes",
    make_missing_value_labels(ref = "lphya27")
  )

  # LPHYA29-LPHYA30 (B/C/D/E/2B/F/G only)
  if (wave %in% c("B", "C", "D", "E", "2B", "F", "G")) {
    apply_metadata_to_variable(
      "lphya29", "Sport: sweating past two weeks yes/no",
      c(
        make_missing_value_labels(ref = "lphya21"),
        make_value_labels("no" = 1, "yes" = 2, "do not know" = 3)
      )
    )

    apply_metadata_to_variable(
      "lphya30", "Sport: #times sweating past two weeks",
      make_missing_value_labels(ref = "lphya29")
    )
  }

  # LSPIN1 (3B only)
  if (wave == "3B") {
    apply_metadata_to_variable(
      "lspin1", "Sport: most intensive",
      c(
        make_value_labels("sport: most intensive" = -3),
        setNames(-2, paste0("na, see ", make_reference_variable_name("lphya22"), " & ", make_reference_variable_name("lphya26"))),
        make_value_labels("na, asked" = -1),
        sports_new
      )
    )
  }

  # LSPIN2 (3B only)
  if (wave == "3B") {
    apply_metadata_to_variable(
      "lspin2", "Most intensive sport: # times past two weeks",
      make_missing_value_labels(ref = "lspin1")
    )
  }

  # LSPIN3 (3B only)
  if (wave == "3B") {
    apply_metadata_to_variable(
      "lspin3", "Most intensive sport: time in minutes",
      make_missing_value_labels(ref = "lspin2")
    )
  }

  # LPHYA31
  apply_metadata_to_variable(
    "lphya31", "Light household: yes/no",
    make_yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA32
  apply_metadata_to_variable(
    "lphya32", "Light household: past two weeks yes/no",
    c(
      make_missing_value_labels(ref = "lphya31"),
      make_value_labels("no" = 1, "yes" = 2, "do not know" = 3, "refusal" = 4)
    )
  )

  # LPHYA33
  apply_metadata_to_variable(
    "lphya33", "Light household: # days past two weeks",
    make_missing_value_labels(ref = "lphya32")
  )

  # LPHYA34
  apply_metadata_to_variable(
    "lphya34", "Light household: time in minutes",
    make_missing_value_labels(ref = "lphya32")
  )

  # LPHYA35
  apply_metadata_to_variable(
    "lphya35", "Heavy household: yes/no",
    make_yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA36
  apply_metadata_to_variable(
    "lphya36", "Heavy household: past two weeks yes/no",
    c(
      make_missing_value_labels(ref = "lphya35"),
      make_value_labels("no" = 1, "yes" = 2, "do not know" = 3, "refusal" = 4)
    )
  )

  # LPHYA37
  apply_metadata_to_variable(
    "lphya37", "Heavy household: # days past two weeks",
    make_missing_value_labels(ref = "lphya36")
  )

  # LPHYA38
  apply_metadata_to_variable(
    "lphya38", "Heavy household: time in minutes",
    make_missing_value_labels(ref = "lphya36")
  )

  # LPHYA39
  apply_metadata_to_variable(
    "lphya39", "Past two weeks normal: yes/no",
    make_yes_no_value_labels(ref = "lphya01")
  )

  # LPHYA40
  apply_metadata_to_variable(
    "lphya40", "not normal: sick",
    make_mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA41
  apply_metadata_to_variable(
    "lphya41", "not normal: depressed",
    make_mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA42
  apply_metadata_to_variable(
    "lphya42", "not normal: bad weather",
    make_mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA43
  apply_metadata_to_variable(
    "lphya43", "not normal: family affairs",
    make_mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA44
  apply_metadata_to_variable(
    "lphya44", "not normal: vacation",
    make_mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA45: meaning changes from wave F onwards
  apply_metadata_to_variable(
    "lphya45",
    if (wave %in% c("B", "C", "D", "E", "2B")) {
      "not normal: other reason"
    } else {
      "not normal: cleaning/repairs"
    },
    make_mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA46: meaning/coding changes from wave F onwards
  if (wave %in% c("B", "C", "D", "E", "2B")) {

    lphya46_old <- c(
      setNames(-2, paste0("na, see ", make_reference_variable_name("lphya45"))),
      if (wave %in% c("D", "E", "2B")) make_value_labels("-to be coded-" = 0) else numeric(0),
      make_value_labels(
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

    apply_metadata_to_variable(
      "lphya46", "not normal: other reasons coded",
      lphya46_old
    )

  } else {

    apply_metadata_to_variable(
      "lphya46", "not normal: good weather",
      make_mentioned_value_labels(ref = "lphya39")
    )
  }

  # LPHYA47-LPHYA50 (F/G/H/3B/I/J/K only)
  if (wave %in% c("F", "G", "H", "3B", "I", "J", "K")) {
    apply_metadata_to_variable(
      "lphya47", "not normal: season break",
      make_mentioned_value_labels(ref = "lphya39")
    )

  # LPHYA48 (F/G/H/3B/I/J/K only)
  apply_metadata_to_variable(
    "lphya48", "not normal: sickness partner/others",
    make_mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA49 (F/G/H/3B/I/J/K only)
  apply_metadata_to_variable(
    "lphya49", "not normal: other reason",
    make_mentioned_value_labels(ref = "lphya39")
  )

  # LPHYA50 (F/G/H/3B/I/J/K only)
  lphya50_vl <- c(
    setNames(-2, paste0("na, see ", make_reference_variable_name("lphya49"))),
    make_value_labels(
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
    if (wave == "K") make_value_labels("COVID19" = 11) else numeric(0)
  )

  apply_metadata_to_variable(
    "lphya50", "not normal: other reasons coded",
    lphya50_vl
  )
  }

  finalize_label_application()
}
