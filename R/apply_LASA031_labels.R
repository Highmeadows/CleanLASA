# Apply LASA 031 (Senses) SPSS variable and value labels
#
# Source: LASA031_varinfo.pdf (07-May-2025)

#' Apply LASA031 (Senses) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the vision, hearing, tinnitus, and related sensory
#' variables documented in LASA031. The function covers all 13 waves and
#' selects the exact main- or medical-interview schema requested by `wave`.
#' Inventories range from nine variables in wave 2B to 29 in waves J/K.
#'
#' LASA031 changes substantially over time. Early waves use `sense` variables;
#' medical-interview waves use `msens`; wave MB contains a reduced combined
#' with/without-aid questionnaire; and waves J/K split several hearing items
#' by zero, one, or two hearing aids. The later schemas also add tinnitus,
#' party-conversation, current-hearing-aid, and 0--9 hearing-rating variables.
#' This function follows each PDF table independently rather than filling
#' gaps from another wave.
#'
#' Three conspicuous routing strings are preserved exactly as printed for
#' auditability: H `msens13` refers to `HMSENS7A1`, 3B `sense05` refers to
#' `BSENS01`, and J/K `msens04` refers to `J/KMSENS01OF 03????`. The function
#' does not silently repair those source strings.
#'
#' By default, matched variables remain numeric with their SPSS-style labels.
#' With `to_factor = TRUE`, categorical variables become factors and observed
#' unlabelled codes remain numeric-text levels. The J/K subjective hearing
#' ratings (`msens21`, `msens22a`, and `msens22b`) are numeric 0--9 scales:
#' with `to_numeric = TRUE`, their negative routing/missing codes become `NA`
#' and non-negative ratings are retained. Other LASA031 variables remain
#' categorical. Numeric conversion takes precedence over factor conversion
#' for those three ratings.
#'
#' The source PDF also documents LASA231 constructed vision/hearing variables.
#' Those variables are intentionally outside LASA031 and are not changed by
#' this function.
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
#' @param data A data frame or tibble imported from a LASA031 `.sav` file,
#'   for example via [haven::read_sav()]. Depending on `wave`, names include
#'   `bsense01`, `gmsens01`, `hmsens7a`, `bmsens20`, and `jmsens22b`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA031 suffixes without the wave
#'   prefix (for example `sense03`, `msens7a`, or `msens22b`), and values are
#'   actual column names in `data`, for example
#'   `c(msens01 = "wears_glasses")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their documented labels. An observed
#'   value without a label remains a numeric-text factor level. J/K hearing
#'   ratings are also factored unless `to_numeric = TRUE`.
#' @param to_numeric Logical. If `FALSE` (default), J/K `msens21`, `msens22a`,
#'   and `msens22b` retain their SPSS-style missing/routing labels. If `TRUE`,
#'   those 0--9 ratings become ordinary numeric, negative codes become `NA`,
#'   and non-negative ratings are retained. Other variables remain
#'   categorical. This takes precedence over `to_factor` for the ratings.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA031 columns are renamed to their canonical lowercase
#'   suffixes with the wave code removed; `"respnr"` is standardized; and
#'   `split_wavecode` is always treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with their wave prefix removed and a new
#'   `"LASA_wave"` column filled with `wave` is inserted immediately after
#'   the respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA031 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa030_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   hmsens01 = c(-5, 1, 2),
#'   hmsens7a = c(-5, 1, 6),
#'   hmsens18 = c(-2, 1, 2)
#' )
#' dat <- apply_lasa031_labels(dat, wave = "H")
#' attr(dat$hmsens7a, "labels")
apply_lasa031_labels <- function(data,
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
      "Unknown LASA 031 wave: ", wave,
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
    fn_name = "apply_lasa031_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  specs <- list()
  add <- function(suffix, variable_label, value_label_map,
                  force_numeric = FALSE) {
    specs[[length(specs) + 1L]] <<- list(
      suffix = suffix,
      variable_label = variable_label,
      value_label_map = value_label_map,
      force_numeric = force_numeric
    )
  }
  route <- function(variable) paste0("na, see ", variable)
  difficulty <- function(reference = NULL, short = FALSE, wrong = FALSE,
                         extra5 = NULL, cannot = "no, I cannot") {
    c(
      if (short) c("na, short version" = -4) else numeric(0),
      if (wrong) c("na, wrong skip" = -3) else numeric(0),
      if (!is.null(reference)) setNames(-2, route(reference)) else numeric(0),
      "na, asked" = -1,
      "yes, without difficulty" = 1,
      "yes, with some difficulty" = 2,
      "yes, with much difficulty" = 3,
      setNames(4, cannot),
      if (!is.null(extra5)) setNames(5, extra5) else numeric(0)
    )
  }
  yes_no <- function(reference = NULL, initial_missing = NULL) {
    c(
      if (!is.null(initial_missing)) initial_missing else numeric(0),
      if (!is.null(reference)) setNames(-2, route(reference)) else numeric(0),
      "na, asked" = -1,
      "no" = 1,
      "yes" = 2
    )
  }
  possession <- function(section_missing = TRUE, migrant = FALSE) {
    if (migrant) {
      c(
        "na, asked" = -1,
        "no, never had before" = 1,
        "yes, possess one or two without use" = 2,
        "yes, possess one or two with use" = 3
      )
    } else {
      c(
        if (section_missing) c("na, section not done" = -5) else numeric(0),
        "na, asked" = -1,
        "no, never had before" = 1,
        "yes, possess one without use" = 2,
        "yes, possess two without use" = 3,
        "yes, possess one with use" = 4,
        "yes, possess two with use of one" = 5,
        "yes, possess two with use" = 6
      )
    }
  }
  hours <- function(reference) {
    c(
      setNames(-2, route(reference)),
      "na, asked" = -1,
      "< 1 hr a day" = 1,
      "1-4 hrs a day" = 2,
      "4-8 hrs a day" = 3,
      "all day" = 4
    )
  }
  party <- function(reference, extra5 = NULL) {
    c(
      setNames(-2, route(reference)),
      "na, asked" = -1,
      "hardly ever" = 1,
      "sometimes" = 2,
      "often" = 3,
      "almost always" = 4,
      if (!is.null(extra5)) setNames(5, extra5) else numeric(0)
    )
  }
  tinnitus_now <- function(reference = NULL) {
    yes_no(reference = reference)
  }
  tinnitus_frequency <- function(reference) {
    c(
      setNames(-2, route(reference)),
      "na, asked" = -1,
      "some of the time" = 1,
      "most of the time" = 2,
      "all of the time" = 3
    )
  }
  tinnitus_annoyance <- function(reference) {
    c(
      setNames(-2, route(reference)),
      "na, asked" = -1,
      "not annoying at all" = 1,
      "a bit annoying" = 2,
      "rather annoying" = 3,
      "most annoying" = 4
    )
  }

  if (wave %in% c("B", "C")) {
    p <- toupper(prefix)
    b_wave <- wave == "B"
    add(
      "sense01", "Respondent wears glasses: observation",
      yes_no(initial_missing = c("na, interview terminated" = -5))
    )
    add(
      "sense02", "Subjective: see well enough",
      difficulty(paste0(p, "SENSE01"), short = b_wave)
    )
    add(
      "sense03", "Small print in paper without glasses etc",
      difficulty(paste0(p, "SENSE01"))
    )
    add(
      "sense04", "Small print in paper with glasses etc",
      difficulty(paste0(p, "SENSE03"), wrong = b_wave)
    )
    add(
      "sense05", "Recognize face 4 meter without glasses etc",
      difficulty(paste0(p, "SENSE01"), short = b_wave)
    )
    add(
      "sense06", "Recognize face 4 meter with glasses etc",
      difficulty(paste0(p, "SENSE05"), wrong = b_wave)
    )
    add(
      "sense07", "Respondent wears hearing aid (HA): observation",
      yes_no(paste0(p, "SENSE01"))
    )
    add(
      "sense08", "Subjective: hear well enough",
      difficulty(paste0(p, "SENSE01"), short = b_wave)
    )
    add(
      "sense09", "Follow conversation 4 persons: without HA",
      difficulty(
        paste0(p, "SENSE01"),
        cannot = if (b_wave) "no, I cannot" else "no I cannot"
      )
    )
    add(
      "sense10", "Follow conversation 4 persons: with HA",
      difficulty(paste0(p, "SENSE09"), wrong = b_wave)
    )
    add(
      "sense11", "Have conversation 1 person: without HA",
      difficulty(paste0(p, "SENSE01"), short = b_wave)
    )
    add(
      "sense12", "Have conversation 1 person: with HA",
      difficulty(paste0(p, "SENSE11"), wrong = b_wave)
    )
    add(
      "sense13", "Can use normal telephone",
      difficulty(paste0(p, "SENSE01"), short = b_wave)
    )
    add(
      "sense14", "Respondent has speech defect: observation",
      yes_no(paste0(p, "SENSE01"))
    )
  } else if (wave %in% c("D", "E")) {
    p <- toupper(prefix)
    add(
      "sense01",
      "R usually wears glasses or contact lenses (in D: observation)",
      yes_no(initial_missing = c("na, interview terminated" = -5))
    )
    add("sense02", "Subjective: see well enough", difficulty(paste0(p, "SENSE01")))
    add(
      "sense03", "Small print in paper without glasses etc",
      difficulty(paste0(p, "SENSE01"))
    )
    add(
      "sense04", "Small print in paper with glasses etc",
      difficulty(paste0(p, "SENSE03"), extra5 = "R does not use aid")
    )
    add(
      "sense05", "Recognize face 4 meter without glasses etc",
      difficulty(paste0(p, "SENSE01"))
    )
    add(
      "sense06", "Recognize face 4 meter with glasses etc",
      difficulty(
        paste0(p, "SENSE05"),
        extra5 = "R does not have glasses or contact lenses"
      )
    )
    add("sense07", "R usually wears hearing aid (HA)", yes_no(paste0(p, "SENSE01")))
    add("sense08", "Subjective: hear well enough", difficulty(paste0(p, "SENSE01")))
    add(
      "sense09", "Follow conversation 4 persons: without HA",
      difficulty(paste0(p, "SENSE01"), cannot = "no I cannot")
    )
    add(
      "sense10", "Follow conversation 4 persons: with HA",
      difficulty(
        paste0(p, "SENSE09"),
        extra5 = "R does not have a hearing aid"
      )
    )
    add(
      "sense11", "Have conversation 1 person: without HA",
      difficulty(paste0(p, "SENSE01"))
    )
    add(
      "sense12", "Have conversation 1 person: with HA",
      difficulty(
        paste0(p, "SENSE11"),
        extra5 = "R does not have a hearing aid"
      )
    )
    add("sense13", "Can use normal telephone", difficulty(paste0(p, "SENSE01")))
    add(
      "sense14", "Respondent has speech defect: observation",
      yes_no(paste0(p, "SENSE01"))
    )
  } else if (wave == "2B") {
    add(
      "sense03", "Small print in paper without glasses etc",
      c("na, interview terminated" = -5, difficulty())
    )
    add(
      "sense04", "Small print in paper with glasses etc",
      difficulty("BSENSE03", extra5 = "R does not use aid")
    )
    add(
      "sense05", "Recognize face 4 meter without glasses etc",
      difficulty("BSENSE03")
    )
    add(
      "sense06", "Recognize face 4 meter with glasses etc",
      difficulty(
        "BSENSE05",
        extra5 = "R does not have glasses or contact lenses"
      )
    )
    add(
      "sense09", "Follow conversation 4 persons: without HA",
      difficulty("BSENSE03", cannot = "no I cannot")
    )
    add(
      "sense10", "Follow conversation 4 persons: with HA",
      difficulty("BSENSE09", extra5 = "R does not have a hearing aid")
    )
    add(
      "sense11", "Have conversation 1 person: without HA",
      difficulty("BSENSE03")
    )
    add(
      "sense12", "Have conversation 1 person: with HA",
      difficulty("BSENSE11", extra5 = "R does not have a hearing aid")
    )
    add("sense13", "Can use normal telephone", difficulty("BSENSE03"))
  } else if (wave %in% c("F", "G")) {
    p <- toupper(prefix)
    add(
      "msens01", "R usually wears glasses or contact lenses",
      yes_no(
        initial_missing = if (wave == "G") {
          c("na, section not done" = -5)
        } else {
          NULL
        }
      )
    )
    add("msens02", "Subjective: see well enough", difficulty(paste0(p, "MSENS01")))
    add(
      "msens03", "Small print in paper without glasses etc",
      difficulty(paste0(p, "MSENS01"))
    )
    add(
      "msens04", "Small print in paper with glasses etc",
      difficulty(paste0(p, "MSENS03"), extra5 = "R does not use aid")
    )
    add(
      "msens05", "Recognize face 4 meter without glasses etc",
      difficulty(paste0(p, "MSENS01"))
    )
    add(
      "msens06", "Recognize face 4 meter with glasses etc",
      difficulty(paste0(p, "MSENS05"))
    )
    add("msens07", "R usually wears hearing aid (HA)", yes_no(paste0(p, "MSENS01")))
    add("msens08", "Subjective: hear well enough", difficulty(paste0(p, "MSENS01")))
    add(
      "msens09", "Follow conversation 4 persons: without HA",
      difficulty(paste0(p, "MSENS01"), cannot = "no I cannot")
    )
    add(
      "msens10", "Follow conversation 4 persons: with HA",
      difficulty(
        paste0(p, "MSENS09"),
        extra5 = "R does not have a hearing aid"
      )
    )
    add(
      "msens11", "Have conversation 1 person: without HA",
      difficulty(paste0(p, "MSENS01"))
    )
    add(
      "msens12", "Have conversation 1 person: with HA",
      difficulty(
        paste0(p, "MSENS11"),
        extra5 = "R does not have a hearing aid"
      )
    )
    add("msens13", "Can use normal telephone", difficulty(paste0(p, "MSENS01")))
    add("msens14", "R has speech defect: observation", yes_no(paste0(p, "MSENS01")))
    add(
      "msens15", "R has problems understanding written text (dyslexic)",
      yes_no(paste0(p, "MSENS01"))
    )
  } else if (wave == "H") {
    add(
      "msens01", "R usually wears glasses or contact lenses",
      yes_no(initial_missing = c("na, section not done" = -5))
    )
    add("msens02", "Subjective: see well enough", difficulty("HMSENS01"))
    add("msens03", "Small print in paper without glasses etc", difficulty("HMSENS01"))
    add(
      "msens04", "Small print in paper with glasses etc",
      difficulty(
        "HMSENS03",
        extra5 = "R does not have glasses or contact lenses"
      )
    )
    add("msens05", "Recognize face 4 meter without glasses etc", difficulty("HMSENS01"))
    add(
      "msens06", "Recognize face 4 meter with glasses etc",
      difficulty(
        "HMSENS05",
        extra5 = "R does not have glasses or contact lenses"
      )
    )
    add("msens7a", "R possesses hearing aid (HA)", possession())
    add("msens7b", "R wears hearing aid(s) (HA) how many hours", hours("HMSENS7A"))
    add("msens08", "Subjective: hear well enough", difficulty("HMSENS7A"))
    add(
      "msens09", "Follow conversation 4 persons: without HA",
      difficulty("HMSENS7A", cannot = "no I cannot")
    )
    add(
      "msens10", "Follow conversation 4 persons: with HA",
      difficulty("HMSENS09", extra5 = "R does not have a hearing aid")
    )
    add("msens11", "Have conversation 1 person: without HA", difficulty("HMSENS7A"))
    add(
      "msens12", "Have conversation 1 person: with HA",
      difficulty("HMSENS11", extra5 = "R does not have a hearing aid")
    )
    add(
      "msens16", "Can understand 1 person at party without HA",
      party("HMSENS7A", extra5 = "R does not have a hearing aid")
    )
    add(
      "msens17", "Can understand 1 person at party with HA",
      party("HMSENS16", extra5 = "R does not have a hearing aid")
    )
    add("msens13", "Can use normal telephone", difficulty("HMSENS7A1"))
    add("msens18", "R hears noises, beeping, etc: nowadays", tinnitus_now("HMSENS7A"))
    add(
      "msens19", "R hears noises, beeping, etc: frequency",
      tinnitus_frequency("HMSENS18")
    )
    add(
      "msens20", "R hears noises, beeping, etc: how annoying",
      tinnitus_annoyance("HMSENS18")
    )
  } else if (wave == "3B") {
    add(
      "sense01", "R usually wears glasses or contact lenses",
      yes_no(initial_missing = c("na, interview terminated" = -5))
    )
    add("sense02", "Subjective: see well enough", difficulty("BSENSE01"))
    add("sense03", "Small print in paper without glasses etc", difficulty("BSENSE01"))
    add(
      "sense04", "Small print in paper with glasses etc",
      difficulty(
        "BSENSE03",
        extra5 = "R does not have glasses or contact lenses"
      )
    )
    add("sense05", "Recognize face 4 meter without glasses etc", difficulty("BSENS01"))
    add(
      "sense06", "Recognize face 4 meter with glasses etc",
      difficulty(
        "BSENSE05",
        extra5 = "R does not have glasses or contact lenses"
      )
    )
    add("sense7a", "R possesses hearing aid (HA)", possession())
    add("sense7b", "R wears hearing aid(s) (HA) how many hours", hours("BSENSE7A"))
    add("sense08", "Subjective: hear well enough", difficulty("BSENSE7A"))
    add(
      "sense09", "Follow conversation 4 persons: without HA",
      difficulty("BSENSE7A", cannot = "no I cannot")
    )
    add(
      "sense10", "Follow conversation 4 persons: with HA",
      difficulty("BSENSE09", extra5 = "R does not have a hearing aid")
    )
    add("sense11", "Have conversation 1 person: without HA", difficulty("BSENSE7A"))
    add(
      "sense12", "Have conversation 1 person: with HA",
      difficulty("BSENSE11", extra5 = "R does not have a hearing aid")
    )
    add("sense13", "Can use normal telephone", difficulty("BSENSE7A"))
    add("sense18", "R hears noises, beeping, etc: nowadays", tinnitus_now("BSENSE7A"))
    add(
      "sense19", "R hears noises, beeping, etc: frequency",
      tinnitus_frequency("BSENSE18")
    )
    add(
      "sense20", "R hears noises, beeping, etc: how annoying",
      tinnitus_annoyance("BSENSE18")
    )
  } else if (wave == "MB") {
    add("sense03", "Small print in paper with or without glasses etc", difficulty())
    add("sense05", "Recognize face 4 meter with or without glasses etc", difficulty())
    add("sense7a", "R possesses hearing aid (HA)", possession(migrant = TRUE))
    add("sense7b", "R wears hearing aid(s) (HA) how many hours", hours("BSENSE7A"))
    add(
      "sense09", "Follow conversation 3/4 persons: with or without HA",
      difficulty(cannot = "no I cannot")
    )
    add("sense11", "Have conversation 1 person: with or without HA", difficulty())
    add("sense13", "Can use normal telephone", difficulty())
    add("sense18", "R hears noises, beeping, etc: nowadays", tinnitus_now())
    add(
      "sense19", "R hears noises, beeping, etc: frequency",
      tinnitus_frequency("BSENSE18")
    )
    add(
      "sense20", "R hears noises, beeping, etc: how annoying",
      tinnitus_annoyance("BSENSE18")
    )
  } else if (wave == "I") {
    add(
      "msens01", "R usually wears glasses or contact lenses",
      yes_no(initial_missing = c("na, section not done" = -5))
    )
    add(
      "msens03", "Small print in paper without glasses etc",
      difficulty("IMSENS01", wrong = TRUE)
    )
    add(
      "msens04", "Small print in paper with glasses etc",
      difficulty(
        "IMSENS03", wrong = TRUE,
        extra5 = "R does not have glasses or contact lenses"
      )
    )
    add(
      "msens05", "Recognize face 4 meter without glasses etc",
      difficulty("IMSENS01", wrong = TRUE)
    )
    add(
      "msens06", "Recognize face 4 meter with glasses etc",
      difficulty(
        "IMSENS05", wrong = TRUE,
        extra5 = "R does not have glasses or contact lenses"
      )
    )
    add("msens7a", "R possesses hearing aid (HA)", possession())
    add("msens7b", "R wears hearing aid(s) (HA) how many hours", hours("IMSENS7A"))
    add("msens08", "Subjective: hear well enough", difficulty("IMSENS7A"))
    add(
      "msens09", "Follow conversation 4 persons: without HA",
      difficulty("IMSENS7A", cannot = "no I cannot")
    )
    add(
      "msens10", "Follow conversation 4 persons: with HA",
      difficulty("IMSENS09", extra5 = "R does not have a hearing aid")
    )
    add("msens11", "Have conversation 1 person: without HA", difficulty("IMSENS7A"))
    add(
      "msens12", "Have conversation 1 person: with HA",
      difficulty("IMSENS11", extra5 = "R does not have a hearing aid")
    )
    add(
      "msens16", "Can understand 1 person at party without HA",
      party("IMSENS7A", extra5 = "R does not have a hearing aid")
    )
    add(
      "msens17", "Can understand 1 person at party with HA",
      party("IMSENS16", extra5 = "R does not have a hearing aid")
    )
    add("msens13", "Can use normal telephone", difficulty("IMSENS7A"))
    add("msens18", "R hears noises, beeping, etc: nowadays", tinnitus_now("IMSENS7A"))
    add(
      "msens19", "R hears noises, beeping, etc: frequency",
      tinnitus_frequency("IMSENS18")
    )
    add(
      "msens20", "R hears noises, beeping, etc: how annoying",
      tinnitus_annoyance("IMSENS18")
    )
  } else {
    p <- toupper(prefix)
    ref7a <- paste0(p, "MSENS7A")
    add("msens01", "R usually wears glasses or contact lenses", yes_no())
    add(
      "msens03", "Small print in paper without glasses etc",
      difficulty(paste0(p, "MSENS01"))
    )
    add(
      "msens04", "Small print in paper with glasses etc",
      difficulty(
        paste0(p, "MSENS01OF 03????"),
        extra5 = "R does not have glasses or contact lenses"
      )
    )
    add(
      "msens05", "Recognize face 4 meter without glasses etc",
      difficulty(paste0(p, "MSENS01"))
    )
    add(
      "msens06", "Recognize face 4 meter with glasses etc",
      difficulty(
        paste0(p, "MSENS05"),
        extra5 = "R does not have glasses or contact lenses"
      )
    )
    add("msens7a", "R possesses hearing aid(s) (HA)", possession(section_missing = FALSE))
    add("msens7b", "1 or 2 HA: R wears HA how many hours", hours(ref7a))
    add(
      "msens7c", "1 or 2 HA: R is wearing HA right now",
      c(
        setNames(-2, route(ref7a)),
        "na, asked" = -1,
        "no, R is not wearing HA" = 1,
        "yes, R is wearing 1 HA, left" = 2,
        "yes, R is wearing 1 HA, right" = 3,
        "yes, R is wearing 2 HA" = 4
      )
    )

    shared_without_aid <- difficulty(ref7a)
    add("msens08", "No HA/not using HA: hear well enough (subjective)", shared_without_aid)
    add("msens08a", "1 HA: hear well enough (subjective)", shared_without_aid)
    add("msens08b", "2HA: hear well enough (subjective)", shared_without_aid)
    add(
      "msens09", "No HA/not using HA: follow conversation 3/4 persons",
      shared_without_aid
    )
    add(
      "msens09a", "1 HA: follow conversation 3/4 persons without HA",
      shared_without_aid
    )
    add(
      "msens09b", "2 HA: follow conversation 3/4 persons without HA",
      shared_without_aid
    )

    shared_with_aid <- difficulty(
      ref7a,
      extra5 = "R does not wear a HA in this situation"
    )
    add(
      "msens10a", "1 HA: follow conversation 3/4 persons with HA",
      shared_with_aid
    )
    add(
      "msens10b", "2 HA: follow conversation 3/4 persons with HA",
      shared_with_aid
    )

    add(
      "msens11", "No HA/not using HA: have conversation 1 person",
      shared_without_aid
    )
    add(
      "msens11a", "1 HA: have conversation 1 person without HA",
      shared_without_aid
    )
    add(
      "msens11b", "2 HA: have conversation 1 person without HA",
      shared_without_aid
    )
    add(
      "msens12a", "1 HA: have conversation 1 person with HA",
      shared_with_aid
    )
    add(
      "msens12b", "2 HA: have conversation 1 person with HA",
      shared_with_aid
    )

    shared_party_without <- party(ref7a)
    shared_party_with <- party(
      ref7a,
      extra5 = "R does not wear a HA in this situation"
    )
    add(
      "msens16", "No HA/not using HA: can understand 1 person at party",
      shared_party_without
    )
    add(
      "msens16a", "1 HA: can understand 1 person at party without HA",
      shared_party_without
    )
    add(
      "msens16b", "2 HA: can understand 1 person at party without HA",
      shared_party_without
    )
    add(
      "msens17a", "1 HA: can understand 1 person at party with HA",
      shared_party_with
    )
    add(
      "msens17b", "2 HA: can understand 1 person at party with HA",
      shared_party_with
    )

    rating_labels <- c(setNames(-2, route(ref7a)), "na, asked" = -1)
    add(
      "msens21", "No HA/not using HA: subjective rating hearing (scale 0-9)",
      rating_labels, force_numeric = TRUE
    )
    add(
      "msens22a", "1 or 2 HA: subjective rating hearing without HA (scale 0-9)",
      rating_labels, force_numeric = TRUE
    )
    add(
      "msens22b", "1 or 2 HA: subjective rating hearing with HA (scale 0-9)",
      rating_labels, force_numeric = TRUE
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
