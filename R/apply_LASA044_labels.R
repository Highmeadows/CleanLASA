# Apply LASA 044 (contact with health/social services) SPSS labels
#
# Source: LASA044_varinfo.pdf (13-Jul-2020)

#' Apply LASA044 (Contact with health/social services) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the health- and social-service variables
#' documented in LASA044. The implementation covers waves B, C, D, E, 2B,
#' F, G, H, 3B, MB, I, and J.
#'
#' LASA044 changes substantially across waves. Wave B distinguishes knowing
#' about a service from contacting it and contains 68 variables. Waves C
#' through G retain the contact series, with a family-physician contact count
#' added at G. Waves H and 3B use reduced service lists and revised
#' termination codes. Wave MB adds four accessibility-facility variables,
#' and waves I and J introduce social-alarm and group-daycare items. The
#' documented inventories, ordering, routing references, missing codes, and
#' wording differences are retained for each wave.
#'
#' Family-physician contact-count fields are numeric measures with documented
#' negative missing codes and a labelled upper category at 98. With
#' `to_numeric = TRUE`, these fields are restored to plain numeric and all
#' observed negative values become `NA`; the value 98 remains 98. Other
#' LASA044 variables are categorical and are unaffected by `to_numeric`.
#' With `to_factor = TRUE`, categorical variables become factors and observed
#' unlabelled codes remain numeric-text levels. For contact counts,
#' `to_numeric` takes precedence when both conversion options are requested.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive exact match. Variables documented for the selected wave
#' but absent from `data` are left untouched and recorded as `"not found"` in
#' the generic matching audit.
#'
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` follow the parameter contract shared by the package's
#' other `apply_*_labels()` functions. Regardless of conversion, every
#' matched column keeps its original SPSS coding in
#' `attr(x, "original_labels")` and `attr(x, "original_values")`. The
#' `"respnr"` column is matched in any capitalization and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA044 `.sav` file,
#'   for example via [haven::read_sav()]. Depending on `wave`, names include
#'   `blst1k01`, `glst1c1n`, `bfacil`, and `ilst2c20`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, or `"J"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA044 suffixes without the wave
#'   prefix (for example `lst1c01`, `lst1c1n`, `lst2k09`, or `facil`), and
#'   values are actual column names in `data`.
#' @param to_factor Logical. If `FALSE` (default), variables retain their
#'   numeric representation with SPSS-style value-label attributes. If
#'   `TRUE`, categorical variables are converted to factors using the
#'   documented labels. Observed unlabelled codes remain numeric-text levels.
#' @param to_numeric Logical. If `TRUE`, family-physician contact-count fields
#'   are restored to plain numeric and negative values are replaced by `NA`.
#'   Other LASA044 variables remain categorical. This conversion takes
#'   precedence over `to_factor` for eligible count variables.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA044 columns are renamed to their canonical lowercase
#'   suffixes with the wave prefix removed; `"respnr"` is standardized; and
#'   `split_wavecode` is always treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with their wave prefix removed and a new
#'   `"LASA_wave"` column filled with `wave` is inserted immediately after
#'   the respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA044 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa039_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   glst1c01 = c(-5, 0, 1),
#'   glst1c1n = c(-2, 3, 98),
#'   glst2c01 = c(-3, 0, 1)
#' )
#' dat <- apply_lasa044_labels(dat, wave = "G", to_numeric = TRUE)
#' attr(dat$glst1c01, "labels")
apply_lasa044_labels <- function(data,
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
    G = "g", H = "h", `3B` = "b", MB = "b", I = "i", J = "j"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 044 wave: ", wave,
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
    fn_name = "apply_lasa044_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_labels <- function(labels, values) {
    stats::setNames(as.numeric(values), labels)
  }
  mentioned <- value_labels(c("not mentioned", "mentioned"), 0:1)
  upper_ref <- function(suffix) toupper(paste0(prefix, suffix))

  first_contact_labels <- c(
    "Cont. p 6 mo. Family physician",
    "Cont. p 6 mo. Dentist",
    "Cont. p 6 mo. Physiotherapist",
    "Cont. p 6 mo. Dietician",
    "Cont. p 6 mo. Home nurs serv/distr. nurs",
    "Cont. p 6 mo. Home help",
    "Cont. p 6 mo. Alpha help",
    "Cont. p 6 mo. Social work",
    "Cont. p 6 mo. Coordinated senior service",
    "Cont. p 6 mo. Telephonic help service",
    "Cont. p 6 mo. Telephone circle",
    "Cont. p 6 mo. Meals on wheels",
    "Cont. p 6 mo. Open table (food)",
    "Cont. p 6 mo. Volunteers UVV",
    "Cont. p 6 mo. Volunteers Zonnebloem",
    "Cont. p 6 mo. Transportation service",
    "Cont. p 6 mo. Chores service",
    "Cont. p 6 mo. Red Cross",
    "Cont. p 6 mo. Memorytraining"
  )
  second_contact_labels <- c(
    "Cont. p 6 mo. Consultation office alcohol&drugs",
    "Cont. p 6 mo. Common mental health care",
    "Cont. p 6 mo. Socio-psychogeriatric service (SPGD)",
    "Cont. p 6 mo. Rehabilitation center",
    "Cont. p 6 mo. Indication commission",
    "Cont. p 6 mo. Alternative practitioner",
    "Cont. p 6 mo. Nursing home-admission",
    "Cont. p 6 mo. Nursing home-observation",
    "Cont. p 6 mo. Nursing home-overnight stay",
    "Cont. p 6 mo. Nursing home-day care",
    "Cont. p 6 mo. Res home - day care",
    "Cont. p 6 mo. Res home - temporary admission",
    "Cont. p 6 mo. Res home - overnight stay",
    "Cont. p 6 mo. Res home - meals",
    "Cont. p 6 mo. Res home - social/creative activities"
  )

  if (wave == "B") {
    known_first_labels <- c(
      "Know. Family physican",
      "Know. Dentist",
      "Know. Physiotherapist",
      "Know. Dietician",
      "Know. Home nursing services/district nur",
      "Know. Home help",
      "Know. Alpha help",
      "Know. Social work",
      "Know. Coordinated senior services",
      "Know. Telephonic help service",
      "Know. Telephone circel",
      "Know. Meals on wheels",
      "Know. Open eettafel",
      "Know. Volunteers UVV",
      "Know. volunteers Zonnebloem",
      "Know. Transportation service",
      "Know. Chores Service",
      "Know. Red Cross",
      "Know. Memory training"
    )
    first_contact_labels_b <- first_contact_labels
    first_contact_labels_b[[9L]] <- "Cont. p 6 mo. Coordinated senior serv."
    first_contact_labels_b[[11L]] <- "Cont. p 6 mo. Telephone circel"

    known_first <- c(
      value_labels(c("na, interview terminated", "na, short interview"),
                   c(-5, -4)),
      mentioned
    )
    for (i in seq_along(known_first_labels)) {
      suffix <- sprintf("lst1k%02d", i)
      engine$label_variable(suffix, known_first_labels[[i]], known_first)

      contact <- c(
        value_labels("na, wrong skip", -3),
        value_labels(paste0("na, see BLST1C", sprintf("%02d", i)), -2),
        value_labels("na, asked", -1),
        mentioned
      )
      engine$label_variable(
        sprintf("lst1c%02d", i), first_contact_labels_b[[i]], contact
      )
    }

    known_second_labels <- c(
      "Know. Cons. Office for alcohol and drugs",
      "Know. Comm Mental Health Care",
      "Know. Socio-Psychiatric service (SPGD)",
      "Know. Rehabilitation center",
      "Know. Admission team residental care",
      "Know. Alternative practitioner",
      "Know. Nursing home - admission",
      "Know. Nursing home - observation",
      "Know. Nursing home - overnight stay",
      "Know. Nursing home - day care",
      "Know. Residential home - day care",
      "Know. Residential home - temporary admis",
      "Know. Residential home - overnight stay",
      "Know. Residential home - meals",
      "Know. Residential home - social or creative"
    )
    second_contact_labels_b <- c(
      "Cont. p 6 mo. Cons offi. alcohol&drugs",
      "Cont. p 6 mo. Comm mental health care",
      "Cont. p 6 mo. Socio-psychiat. serv.(SPGD",
      "Cont. p 6 mo. Rehabilitation center",
      "Cont. p 6 mo. Indication commission",
      "Cont. p 6 mo. Alternative practitioner",
      "Cont. p 6 mo. Nursing home-admission",
      "Cont. p 6 mo. Nursing home-observation",
      "Cont. p 6 mo. Nursing home-overnight stay",
      "Cont. p 6 mo. Nursing home-day care",
      "Cont. p 6 mo. Res home - day care",
      "Cont. p 6 mo. Res home - temp. admission",
      "Cont. p 6 mo. Res home - overnight stay",
      "Cont. p 6 mo. Res home - meals",
      "Cont. p 6 mo. Res home - soci./creative"
    )
    known_second <- c(
      value_labels(c("na, interview terminated", "na, short interview",
                     "na, see BHINDEP"), c(-5, -4, -2)),
      mentioned
    )
    for (i in seq_along(known_second_labels)) {
      engine$label_variable(
        sprintf("lst2k%02d", i), known_second_labels[[i]], known_second
      )

      contact <- c(
        if (i <= 3L) value_labels("na, short interview", -4) else numeric(0),
        value_labels("na, wrong skip", -3),
        value_labels(paste0("na, see BLST2K", sprintf("%02d", i)), -2),
        value_labels("na, asked", -1),
        mentioned
      )
      engine$label_variable(
        sprintf("lst2c%02d", i), second_contact_labels_b[[i]], contact
      )
    }
  }

  if (wave %in% c("C", "D", "E", "2B", "F", "G")) {
    first_contact <- c(
      value_labels(c("na, interview terminated", "na, asked"), c(-5, -1)),
      mentioned
    )
    engine$label_variable("lst1c01", first_contact_labels[[1L]], first_contact)
    if (wave == "G") {
      engine$label_variable(
        "lst1c1n", "Cont. family physician: number of times",
        value_labels(
          c("na wrong skip", "na, see GLST1C01",
            "na, asked: R does not know", "98 times or more"),
          c(-3, -2, -1, 98)
        ),
        force_numeric = TRUE
      )
    }
    for (i in 2:19) {
      engine$label_variable(
        sprintf("lst1c%02d", i), first_contact_labels[[i]], first_contact
      )
    }

    second_contact <- c(
      value_labels(
        c("na, interview terminated", "na, wrong skip",
          paste0("na, see ", upper_ref("hindep")), "na, asked"),
        c(-5, -3, -2, -1)
      ),
      mentioned
    )
    for (i in 1:8) {
      engine$label_variable(
        sprintf("lst2c%02d", i), second_contact_labels[[i]], second_contact
      )
    }
    engine$label_variable(
      "lst2k09", "Know. Nursing home - overnight stay", second_contact
    )
    for (i in 9:15) {
      engine$label_variable(
        sprintf("lst2c%02d", i), second_contact_labels[[i]], second_contact
      )
    }
  }

  if (wave %in% c("H", "3B")) {
    late_first_labels <- first_contact_labels
    late_first_labels[[5L]] <- "Cont. p 6 mo. Home nurse /district nurse"
    late_first_labels[[14L]] <- "Cont. p 6 mo. Volunteers organisation, namely ..."
    first_contact <- c(
      value_labels(c("na, short/terminated interview", "na, asked"),
                   c(-4, -1)),
      mentioned
    )
    first_indices <- c(1:14, 16, 17, 19)
    engine$label_variable("lst1c01", late_first_labels[[1L]], first_contact)
    engine$label_variable(
      "lst1c1n", "Cont. family physician: number of times",
      value_labels(
        c(paste0("na, see ", upper_ref("lst1c01")),
          "na, asked: R does not know", "98 times or more"),
        c(-2, -1, 98)
      ),
      force_numeric = TRUE
    )
    for (i in first_indices[first_indices != 1L]) {
      engine$label_variable(
        sprintf("lst1c%02d", i), late_first_labels[[i]], first_contact
      )
    }

    second_contact <- c(
      value_labels(
        c("na, short/terminated interview", "na, wrong skip",
          paste0("na, see ", upper_ref("hindep")), "na, asked"),
        c(-4, -3, -2, -1)
      ),
      mentioned
    )
    for (i in seq_along(second_contact_labels)) {
      engine$label_variable(
        sprintf("lst2c%02d", i), second_contact_labels[[i]], second_contact
      )
    }
  }

  if (wave == "MB") {
    mb_contact <- c(
      value_labels("na, short/terminated interview", -4), mentioned
    )
    mb_first_indices <- c(1, 2, 3, 4, 12, 14, 16, 17)
    mb_first_labels <- first_contact_labels
    mb_first_labels[[14L]] <- "Cont. p 6 mo. Volunteers organisation"
    mb_first_labels[[16L]] <- "Cont. p 6 mo Transport services"

    engine$label_variable("lst1c01", mb_first_labels[[1L]], mb_contact)
    engine$label_variable(
      "lst1c1n", "Cont. family physician: number of times",
      value_labels(
        c("na, see BLST1C01", "na, asked; R does not know",
          "98 times or more"),
        c(-2, -1, 98)
      ),
      force_numeric = TRUE
    )
    for (i in mb_first_indices[mb_first_indices != 1L]) {
      engine$label_variable(
        sprintf("lst1c%02d", i), mb_first_labels[[i]], mb_contact
      )
    }
    for (i in c(1, 2, 6)) {
      engine$label_variable(
        sprintf("lst2c%02d", i), second_contact_labels[[i]], mb_contact
      )
    }

    engine$label_variable(
      "facil", "Having facilities for disabled persons",
      value_labels(c("na, short/terminated interview", "no", "yes"),
                   c(-4, 1, 2))
    )
    facility <- c(
      value_labels("na, see BFACIL", -2), mentioned
    )
    engine$label_variable(
      "fac1", "Facility 1: walker or a walking frame", facility
    )
    engine$label_variable("fac2", "Facility 2: (sports) wheelchair", facility)
    engine$label_variable("fac3", "Facility 3: mobility scooter", facility)
  }

  if (wave == "I") {
    late_first_labels <- first_contact_labels
    late_first_labels[[14L]] <- "Cont. p 6 mo. Volunteers organisation, namely ..."
    first_indices <- c(1:4, 8:14, 16:19)
    first_contact <- c(
      value_labels(c("na, short/terminated interview", "na, asked"),
                   c(-4, -1)),
      mentioned
    )
    engine$label_variable("lst1c01", late_first_labels[[1L]], first_contact)
    engine$label_variable(
      "lst1c1n", "Cont. family physician: number of times",
      value_labels(
        c("na, see ILST1C01", "na, asked: R does not know",
          "98 times or more"),
        c(-2, -1, 98)
      ),
      force_numeric = TRUE
    )
    for (i in first_indices[first_indices != 1L]) {
      engine$label_variable(
        sprintf("lst1c%02d", i), late_first_labels[[i]], first_contact
      )
    }

    second_contact_i <- c(
      value_labels(
        c("na, short/terminated interview", "na, wrong skip",
          "na, see IHINDEP", "na, asked"),
        c(-4, -3, -2, -1)
      ),
      mentioned
    )
    engine$label_variable(
      "lst2c20", "Cont. p 6 mo. Social alarm", second_contact_i
    )
    engine$label_variable(
      "lst2c21", "Cont. p 6 mo. Daycare: social/creative activities in group",
      second_contact_i
    )
    for (i in c(1, 2, 3, 4, 6)) {
      engine$label_variable(
        sprintf("lst2c%02d", i), second_contact_labels[[i]], second_contact_i
      )
    }
  }

  if (wave == "J") {
    late_first_labels <- first_contact_labels
    late_first_labels[[14L]] <- "Cont. p 6 mo. Volunteers organisation, namely ..."
    first_indices <- c(1:4, 8:14, 16:19)
    j_contact <- c(
      value_labels(c("na, terminated interview", "na, asked"), c(-4, -1)),
      mentioned
    )
    engine$label_variable("lst1c01", late_first_labels[[1L]], j_contact)
    engine$label_variable(
      "lst1c1n", "Cont. family physician: number of times",
      value_labels(
        c("na, see JLST1C01", "na, asked; R does not know",
          "98 times or more"),
        c(-2, -1, 98)
      ),
      force_numeric = TRUE
    )
    for (i in first_indices[first_indices != 1L]) {
      engine$label_variable(
        sprintf("lst1c%02d", i), late_first_labels[[i]], j_contact
      )
    }
    engine$label_variable("lst2c20", "Cont. p 6 mo. Social alarm", j_contact)
    for (i in c(1, 2, 3, 4, 6)) {
      engine$label_variable(
        sprintf("lst2c%02d", i), second_contact_labels[[i]], j_contact
      )
    }
  }

  engine$finalize()
}
