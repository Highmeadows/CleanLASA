# Apply LASA 046 (LAPAQ / Physical activity) SPSS variable and value labels
#
# Source: LASA046_varinfo_PhysicalActivity.pdf (19-Jan-2024)
#
# This is the reference implementation of the package's shared parameter
# contract described at the top of lasa_io.R: every apply_*_labels()
# function is expected to accept `data`, a wave/file-code identifying
# argument, and the same five reshaping arguments implemented here
# (name_corrections, to_factor, to_numeric, standardize_names,
# split_wavecode). Because read_lasa_sav() forwards those five arguments
# automatically to whichever label function it dispatches to, keeping their
# names, defaults, and behaviour consistent across files (e.g. a future
# apply_lasa011_labels() or
# apply_lasaz004_labels()) is what lets users pass them through
# read_lasa_sav() without needing to know which file-specific function will
# ultimately handle them.
#
# By default this script keeps variables numeric and stores labels in the
# same attributes used by haven/labelled:
#   attr(x, "label")  = SPSS variable label
#   attr(x, "labels") = named numeric vector of SPSS value labels
#
# The original SPSS value coding (the "labels" codebook and the raw imported
# values) is always kept available as reference attributes on every matched
# column -- attr(x, "original_labels") and attr(x, "original_values") --
# regardless of whether to_factor/to_numeric reshape that column, so R
# output can always be cross-checked against another program's (e.g. SPSS)
# original coding.
#
# The five reshaping arguments let you get a different shape of output:
#   * name_corrections  - manually point a LASA046 suffix at a differently
#                          named column, for a known typo/renaming in `data`.
#   * to_factor         - convert categorical (value-labelled) variables to
#                          factors, using the value labels as factor levels.
#   * to_numeric        - convert count/continuous variables (whose codebook
#                          labels are *only* negative missing-reason codes)
#                          back to plain numeric, with negative codes -> NA.
#   * standardize_names - rename matched columns to their canonical
#                          lowercase LASA documentation name, minus the wave
#                          code (e.g. "lphya01"), also standardizes "respnr",
#                          and always implies split_wavecode = TRUE (below).
#   * split_wavecode    - move the wave-letter prefix out of variable names
#                          and into its own "LASA_wave" column, inserted
#                          right after the "respnr" column (e.g. "blphya01"
#                          becomes "lphya01", with wave "B" recorded in the
#                          new "LASA_wave" column). Always in effect when
#                          standardize_names = TRUE.
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
#   # plain numeric, and use standardized (canonical) column names -- this
#   # also splits the wave code into its own "LASA_wave" column:
#   dat_b <- apply_lasa046_labels(
#     dat_b, wave = "B",
#     to_factor = TRUE, to_numeric = TRUE, standardize_names = TRUE
#   )
#
#   # Split the wave code out of variable names without fully standardizing:
#   dat_b <- apply_lasa046_labels(dat_b, wave = "B", split_wavecode = TRUE)
#
#   # Point a mistyped column at its correct LASA046 variable:
#   dat_b <- apply_lasa046_labels(
#     dat_b, wave = "B",
#     name_corrections = c(lphya08 = "BLPYA08")
#   )
#
#   # The same five arguments also work through read_lasa_sav(), which
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
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` are part of a parameter contract shared by every
#' `apply_*_labels()` function in this package (see the header comment in
#' `lasa_io.R`). Because [read_lasa_sav()] forwards these same five
#' arguments automatically when dispatching to this function, they can be
#' supplied either directly to `apply_lasa046_labels()` or through
#' `read_lasa_sav()` -- both forms behave identically.
#'
#' Regardless of `to_factor`/`to_numeric`, every matched column also keeps
#' its original SPSS value coding available as reference attributes --
#' `attr(x, "original_labels")` (the codebook: value labels keyed by their
#' numeric code) and `attr(x, "original_values")` (the raw numeric values as
#' imported, before any `to_factor`/`to_numeric` reshaping) -- so R output
#' can be cross-checked against another program's (e.g. SPSS) coding no
#' matter which shape the column was converted to.
#'
#' The `"respnr"` (respondent number) column, present in essentially every
#' LASA data file under inconsistent capitalization (e.g. `"RespNr"`), is
#' also matched and, when `standardize_names = TRUE`, renamed to `"respnr"`.
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
#'   names in `data` are left unchanged (except for any renaming triggered
#'   by `split_wavecode`, see below). If `TRUE`, every successfully matched
#'   LASA046 column is renamed to its canonical lowercase documentation name
#'   with the wave code removed, such as `lphya01`, `lphya26`, or `lphya50`,
#'   the `"respnr"` column (in any capitalization) is renamed to `"respnr"`,
#'   and `split_wavecode` is always treated as `TRUE` as well (see below),
#'   regardless of what was passed for `split_wavecode`. Renaming happens
#'   only after all variables have been matched, so it cannot affect
#'   matching decisions; the function stops with an informative error if
#'   renaming would create duplicate column names.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   every successfully matched LASA046 column is renamed to its canonical
#'   name with the wave-letter prefix removed (e.g. `blphya01` becomes
#'   `lphya01`), and a new `"LASA_wave"` column, filled with `wave`, is
#'   inserted right after the `"respnr"` column (matched but not renamed
#'   unless `standardize_names = TRUE`; inserted at the front of `data` if
#'   no `"respnr"`-like column is found). Always treated as `TRUE` when
#'   `standardize_names = TRUE`, even if `split_wavecode` itself was left at
#'   its default.
#'
#' @return `data`, with `label` and `labels` attributes added to every
#'   matched LASA046 column (transformed to a factor or plain numeric where
#'   `to_factor`/`to_numeric` apply), plus reference `original_labels` /
#'   `original_values` attributes preserving the original SPSS value coding
#'   regardless of that reshaping. Columns are optionally renamed when
#'   `standardize_names = TRUE`, and a new `"LASA_wave"` column is added
#'   after `"respnr"` when `standardize_names = TRUE` or `split_wavecode =
#'   TRUE`. A variable-name matching audit is attached as the generic
#'   `"label_report"` attribute; retrieve it with [lasa_label_report()].
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
#' # plain numeric, and use canonical column names (this also splits the
#' # wave code into its own "LASA_wave" column):
#' dat_h <- apply_lasa046_labels(
#'   dat_h, wave = "H",
#'   to_factor = TRUE, to_numeric = TRUE, standardize_names = TRUE
#' )
#'
#' # Split the wave code into "LASA_wave" without fully standardizing names:
#' dat_2b <- apply_lasa046_labels(dat_2b, wave = "2B", split_wavecode = TRUE)
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
                                 standardize_names = FALSE,
                                 split_wavecode = FALSE) {

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

  # ---- Validate the shared reshaping arguments and build the shared ---------
  # ---- matching/labelling/reshaping engine -----------------------------
  # .lasa_assert_scalar_logical(), .lasa_assert_name_corrections(), and
  # .lasa_label_engine() are defined once in lasa_io.R and shared by every
  # apply_*_labels() function in this package, so all of them validate these
  # arguments and match/label/reshape/rename columns identically.
  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa046_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable
  finalize_labelled_data <- engine$finalize

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
# attr(dat$lphya09, "original_labels")  # original codebook, unaffected
# attr(dat$lphya09, "original_values")  # raw imported values, unaffected
#
# With standardize_names = TRUE (always implies split_wavecode = TRUE):
# dat <- apply_lasa046_labels(dat, wave = "B", standardize_names = TRUE)
# names(dat)
# Matched activity variables are renamed to their canonical lowercase LASA
# documentation names with the wave code removed, e.g. "lphya01", "lphya02",
# etc.; "respnr" (in any capitalization) is renamed to "respnr"; and a new
# "LASA_wave" column, filled with "B", is inserted right after "respnr".
#
# With split_wavecode = TRUE (and standardize_names left FALSE):
# dat <- apply_lasa046_labels(dat, wave = "B", split_wavecode = TRUE)
# Same wave-code splitting and "LASA_wave" column as above, but "respnr"
# itself is matched (to position the new column) without being renamed.
#
# To inspect which variables could not be matched:
# lasa_label_report(dat, problems_only = TRUE)
