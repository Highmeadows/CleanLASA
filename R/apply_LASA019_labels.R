# Apply LASA 019 (Income Evaluation) SPSS variable and value labels
#
# Source: LASA019_varinfo.pdf (25-Aug-2023)

#' Apply LASA019 (Income Evaluation) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to a LASA019 income-evaluation data frame, using the
#' wording, currency bands, routing references, and missing-value codes
#' documented for the requested wave. By default, matched variables remain
#' numeric. Optional arguments allow converting categorical variables to
#' factors, restoring the year of a major income decline to plain numeric,
#' correcting mismatched column names, and standardizing names.
#'
#' LASA019 changes across waves. Wave B asks about the last five years and
#' uses guilder bands; C/D ask about the last three years and add month/year
#' follow-ups; E/F contain only satisfaction items; 2B uses detailed euro
#' bands; G through K use broader euro bands; 3B documents month/year
#' follow-ups but does not print month value labels; and MB again contains a
#' smaller item set. `wave` is required because B, 2B, 3B, and MB all use
#' variable names beginning with `"b"` while their schemas differ.
#'
#' In the shared G/H/I/J/K table, J and K replace the general routing label
#' for `incdecl` with `"na, see J/KINCCAT"`; the function applies that
#' wave-specific override. For 3B, only the printed negative labels are
#' attached to `incdclm`; unprinted month names are not inferred.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive exact match. Variables documented for the selected wave
#' but absent from `data` are left untouched and recorded as `"not found"` in
#' the generic matching audit.
#'
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` are part of the parameter contract shared by every
#' `apply_*_labels()` function in this package. Regardless of conversion,
#' every matched column keeps its original SPSS value coding in
#' `attr(x, "original_labels")` and `attr(x, "original_values")`. The
#' `"respnr"` column is matched in any capitalization and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA019 `.sav` file,
#'   for example via [haven::read_sav()]. Expected wave-prefixed names include
#'   `bincdecl`, `cincdclm`, `gincdcly`, and `kincsat1`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA019 suffixes without the wave
#'   prefix (for example `incdecl`, `incdcly`, or `incsat1`), and values are
#'   actual column names in `data`, for example
#'   `c(incdecl = "B_INCOME_DECLINE")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their documented value labels. Observed
#'   values without a label remain numeric-text factor levels.
#' @param to_numeric Logical. If `FALSE` (default), `incdcly` retains its
#'   SPSS-style missing-reason labels. If `TRUE`, it is restored to ordinary
#'   numeric, negative missing-reason codes become `NA`, and non-negative
#'   years are retained. This takes precedence over `to_factor` for
#'   `incdcly`; the month and evaluation variables remain categorical.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA019 columns are renamed to their canonical lowercase
#'   suffixes with the wave code removed; `"respnr"` is standardized; and
#'   `split_wavecode` is always treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with the wave prefix removed and a new
#'   `"LASA_wave"` column filled with `wave` is inserted immediately after
#'   the respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA019 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa018_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   GINCDECL = c(-5, 1, 7),
#'   GINCDCLM = c(-2, 1, 12),
#'   GINCDCLY = c(-2, 2018, 2022),
#'   GINCSAT1 = c(-5, 1, 5)
#' )
#' dat <- apply_lasa019_labels(dat, wave = "G")
#' attr(dat$GINCDECL, "labels")
apply_lasa019_labels <- function(data,
                                 wave,
                                 name_corrections = NULL,
                                 to_factor = FALSE,
                                 to_numeric = FALSE,
                                 standardize_names = FALSE,
                                 split_wavecode = FALSE) {
  if (length(wave) != 1L || is.na(wave) || !nzchar(wave)) {
    stop("'wave' must be a single non-empty character value.", call. = FALSE)
  }

  wave <- toupper(wave)
  wave_prefix <- c(
    B = "b", C = "c", D = "d", E = "e", `2B` = "b", F = "f",
    G = "g", H = "h", `3B` = "b", MB = "b", I = "i", J = "j", K = "k"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 019 wave: ", wave,
      ". Use one of: ", paste(names(wave_prefix), collapse = ", "), ".",
      call. = FALSE
    )
  }

  prefix <- unname(wave_prefix[[wave]])

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa019_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  spec <- function(suffix, variable_label, value_label_map,
                   force_numeric = FALSE) {
    list(
      suffix = suffix,
      variable_label = variable_label,
      value_label_map = value_label_map,
      force_numeric = force_numeric
    )
  }
  satisfaction_labels <- function(refused = TRUE, wrong_skip = FALSE,
                                  refused_code = -5) {
    c(
      if (refused) setNames(refused_code, "na, refused") else numeric(0),
      "na, short version" = -4,
      if (wrong_skip) c("na, wrong skip" = -3) else numeric(0),
      "na, asked" = -1,
      "dissatisfied" = 1,
      "a little dissatisfied" = 2,
      "not dissatisfied/satisfied" = 3,
      "a little satisfied" = 4,
      "satisfied" = 5
    )
  }
  month_labels <- c(
    "January" = 1, "February" = 2, "March" = 3, "April" = 4,
    "May" = 5, "June" = 6, "July" = 7, "August" = 8,
    "September" = 9, "October" = 10, "November" = 11,
    "December" = 12
  )
  euro_decline_labels <- c(
    "no" = 1,
    "yes, < 45 euro" = 2,
    "yes, 45 - 136 euro" = 3,
    "yes, 136 - 227 euro" = 4,
    "yes, 227 - 318 euro" = 5,
    "yes, 318 - 410 euro" = 6,
    "yes, > 410 euro" = 7
  )

  if (wave == "B") {
    satisfaction <- c(
      "na, refused" = -6,
      "na, short version" = -4,
      "na, do not know" = -1,
      "dissatisfied" = 1,
      "a little dissatisfied" = 2,
      "not dissatisfied/satisfied" = 3,
      "a little satisfied" = 4,
      "satisfied" = 5
    )
    specs <- list(
      spec(
        "incdecl", "Income decline last 5 years net/month (in Dutch Guilders)",
        c(
          "na, refused" = -6,
          "na, short version" = -4,
          "na, do not know" = -1,
          "no" = 1,
          "yes, < ƒ 100" = 2,
          "yes, ƒ 100 - 200" = 3,
          "yes, ƒ 200 - 300" = 4,
          "yes, ƒ 300 - 400" = 5,
          "yes, ƒ 400 - 500" = 6,
          "yes, > ƒ 500" = 7
        )
      ),
      spec("incsat1", "Satisfaction with income level", satisfaction),
      spec(
        "incsat2", "Satisfaction with income and living standard",
        satisfaction
      ),
      spec(
        "incfutu", "Next two years income: increase/decrease",
        c(
          "na, short version" = -4,
          "na, asked" = -1,
          "decrease" = 1,
          "same" = 2,
          "increase" = 3
        )
      )
    )
  } else if (wave %in% c("C", "D")) {
    p <- toupper(prefix)
    decline_ref <- paste0(p, "INCDECL")
    satisfaction <- satisfaction_labels(refused = FALSE)
    specs <- list(
      spec(
        "incdecl", "net monthly decline in income last 3 years (in Dutch Guilders)",
        c(
          "na, refused" = -5,
          "na, short version" = -4,
          "na, wrong skip" = -3,
          "no answer, routing" = -2,
          "na, asked" = -1,
          "no" = 1,
          "yes, < ƒ 100" = 2,
          "yes, ƒ 100 - 200" = 3,
          "yes, ƒ 200 - 300" = 4,
          "yes, ƒ 300 - 400" = 5,
          "yes, ƒ 400 - 500" = 6,
          "yes, ƒ 500 >" = 7,
          "yes, do not know how many" = 8
        )
      ),
      spec(
        "incdclm", "moment of (major) decline: month",
        c(
          "na, wrong skip" = -3,
          setNames(-2, paste0("na, see ", decline_ref)),
          "na, asked" = -1,
          month_labels
        )
      ),
      spec(
        "incdcly", "moment of (major) decline: year",
        c(
          "na, wrong skip" = -3,
          setNames(-2, paste0("na, see ", decline_ref)),
          "na, asked" = -1
        ),
        force_numeric = TRUE
      ),
      spec("incsat1", "satisfaction with income level", satisfaction),
      spec(
        "incsat2", "satisfaction with income and living standard",
        satisfaction
      ),
      spec(
        "incfutu", "Next two years income: increase/decrease",
        c(
          "na, short version" = -4,
          "na, asked" = -1,
          "decrease" = 1,
          "stays the same" = 2,
          "increase" = 3
        )
      )
    )
  } else if (wave %in% c("E", "F")) {
    satisfaction <- satisfaction_labels()
    specs <- list(
      spec("incsat1", "satisfaction with income level", satisfaction),
      spec(
        "incsat2", "satisfaction with income and living standard",
        satisfaction
      )
    )
  } else if (wave == "2B") {
    satisfaction <- satisfaction_labels(refused = FALSE, wrong_skip = TRUE)
    specs <- list(
      spec(
        "incdecl", "net monthly decline in income last 5 years",
        c(
          "na, refusal" = -5,
          "na, short version" = -4,
          "na, wrong skip" = -3,
          "no answer, routing" = -2,
          "no answer, asked" = -1,
          "no" = 1,
          "yes, < 45,45 euro" = 2,
          "yes, 45,45 - 90,90 euro" = 3,
          "yes, 90,90 - 136,36 euro" = 4,
          "yes, 136,36 - 181,81 euro" = 5,
          "yes, 181,81 - 227,27 euro" = 6,
          "yes, > 227,27 euro" = 7,
          "yes, do not know how many" = 8
        )
      ),
      spec("incsat1", "satisfaction with income level", satisfaction),
      spec(
        "incsat2", "satisfaction with income and living standard",
        satisfaction
      )
    )
  } else if (wave %in% c("G", "H", "I", "J", "K")) {
    p <- toupper(prefix)
    decline_ref <- paste0(p, "INCDECL")
    routing_label <- if (wave %in% c("J", "K")) {
      paste0("na, see ", p, "INCCAT")
    } else {
      "no answer, routing"
    }
    satisfaction <- satisfaction_labels()
    specs <- list(
      spec(
        "incdecl", "net monthly decline in income last 3 years",
        c(
          "na, refused" = -5,
          "na, short version" = -4,
          "na, wrong skip" = -3,
          setNames(-2, routing_label),
          "na, asked" = -1,
          euro_decline_labels
        )
      ),
      spec(
        "incdclm", "moment of (major) decline: month",
        c(
          "na, wrong skip" = -3,
          setNames(-2, paste0("na, see ", decline_ref)),
          "na, asked" = -1,
          month_labels
        )
      ),
      spec(
        "incdcly", "moment of (major) decline: year",
        c(
          "na, wrong skip" = -3,
          setNames(-2, paste0("na, see ", decline_ref)),
          "na, asked" = -1
        ),
        force_numeric = TRUE
      ),
      spec("incsat1", "satisfaction with income level", satisfaction),
      spec(
        "incsat2", "satisfaction with income and living standard",
        satisfaction
      )
    )
  } else if (wave == "3B") {
    satisfaction <- satisfaction_labels()
    followup_missing <- c(
      "na, wrong skip" = -3,
      "na, see BINCDECL" = -2,
      "na, asked" = -1
    )
    specs <- list(
      spec(
        "incdecl", "net monthly decline in income last 5 years",
        c(
          "na, refused" = -5,
          "na, short version" = -4,
          "na, wrong skip" = -3,
          "no answer, routing" = -2,
          "na, asked" = -1,
          euro_decline_labels
        )
      ),
      spec(
        "incdclm", "moment of (major) decline: month",
        followup_missing
      ),
      spec(
        "incdcly", "moment of (major) decline: year",
        followup_missing, force_numeric = TRUE
      ),
      spec("incsat1", "satisfaction with income level", satisfaction),
      spec(
        "incsat2", "satisfaction with income and living standard",
        satisfaction
      )
    )
  } else {
    satisfaction <- satisfaction_labels()
    specs <- list(
      spec(
        "incdecl", "net monthly decline in income last 5 years",
        c(
          "na, refused" = -5,
          "na, short version" = -4,
          "na, wrong skip" = -3,
          "na, routing" = -2,
          "na, asked" = -1,
          euro_decline_labels
        )
      ),
      spec("incsat1", "satisfaction with income level", satisfaction),
      spec(
        "incsat2", "satisfaction with income and living standard",
        satisfaction
      )
    )
  }

  for (item in specs) {
    engine$label_variable(
      suffix = item$suffix,
      variable_label = item$variable_label,
      value_label_map = item$value_label_map,
      force_numeric = item$force_numeric
    )
  }

  engine$finalize()
}
