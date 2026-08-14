# Apply LASA 033 (Receiving care) SPSS variable and value labels
#
# Source: LASA033_varinfo.pdf (30-Jun-2023)

#' Apply LASA033 (Receiving care) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the receiving-care variables documented in
#' LASA033. All 13 main-interview waves are supported. The exact inventory is
#' selected by `wave`; it ranges from 80 variables in wave E to 955 variables
#' in wave H.
#'
#' The codebook changes substantially over time. Early waves distinguish help
#' with personal and domestic care and, except in wave E, who provided care
#' during illness. Later waves add total weekly hours, nursing, guidance and
#' administrative help, unmet needs, and control over caregiving. Waves I/J/K
#' split neighbours from friends; J/K additionally split children from
#' children-in-law. Wave H contains 660 person-level variables described as
#' ranges in the PDF. Those ranges are expanded here in the same documented
#' order: sex and weekly hours for up to five people in each provider group.
#'
#' Variables that represent years, counts, or hours are marked as numeric.
#' With `to_numeric = TRUE`, their negative missing/routing codes become `NA`
#' and non-negative values are retained. All other variables remain
#' categorical. Numeric conversion takes precedence over factor conversion.
#' Wave-H person-level hour variables and helper-count variables have no value
#' labels in the source; their variable labels or value-label sets are left
#' correspondingly empty while they remain available for numeric conversion.
#'
#' The source PDF also documents LASAH233 constructed scale-score variables.
#' They belong to filecode 233 and are intentionally not changed by this
#' LASA033 function.
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
#' every matched column keeps its original SPSS coding in
#' `attr(x, "original_labels")` and `attr(x, "original_values")`. The
#' `"respnr"` column is matched in any capitalization and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA033 `.sav` file,
#'   for example via [haven::read_sav()]. Depending on `wave`, names include
#'   `bhealth1`, `hrhour201`, `iphelp06A`, and `krhelp02B`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA033 suffixes without the wave
#'   prefix (for example `rhelpyn`, `phlp01y`, or `rhelp02b`), and values are
#'   actual column names in `data`, for example
#'   `c(rhelpyn = "receives_personal_care")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their documented labels. An observed
#'   value without a label remains a numeric-text factor level. Numeric
#'   variables are also factored unless `to_numeric = TRUE`.
#' @param to_numeric Logical. If `FALSE` (default), documented numeric
#'   variables retain their SPSS-style missing/routing labels. If `TRUE`,
#'   years, counts, and hours become ordinary numeric, negative codes become
#'   `NA`, and non-negative values are retained. Other variables remain
#'   categorical. This takes precedence over `to_factor` for numeric fields.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA033 columns are renamed to their canonical lowercase
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
#'   matched LASA033 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa032_labels()], [apply_lasa034_labels()],
#'   [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   irhelpyn = c(-5, 1, 2),
#'   irhour01 = c(-4, 4, 12),
#'   iphelp06A = c(-2, 0, 1)
#' )
#' dat <- apply_lasa033_labels(dat, wave = "I")
#' attr(dat$irhelpyn, "labels")
apply_lasa033_labels <- function(data,
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
      "Unknown LASA 033 wave: ", wave,
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
    fn_name = "apply_lasa033_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  specs <- list()
  add <- function(suffix, variable_label, value_label_map = NULL,
                  force_numeric = FALSE) {
    specs[[length(specs) + 1L]] <<- list(
      suffix = tolower(suffix),
      variable_label = variable_label,
      value_label_map = value_label_map,
      force_numeric = force_numeric
    )
  }
  route <- function(reference) paste0("na, see ", reference)
  routed <- function(reference, code = -2) setNames(code, route(reference))

  health1_map <- function(initial) {
    c(
      initial,
      "na, asked" = -1,
      "yes, severely" = 1,
      "yes, slightly" = 2,
      "no" = 3,
      "do not know" = 4,
      "refused to answer" = 5
    )
  }
  health2_map <- function(reference, b_wave = FALSE) {
    c(
      "na, wrong skip" = -3,
      routed(reference),
      "na, asked" = -1,
      "> 3 months" = 1,
      "< 3 months" = 2,
      "do not know" = if (b_wave) 4 else 3,
      if (!b_wave) c("refused to answer" = 4) else numeric(0)
    )
  }
  health_days_map <- function(reference = NULL) {
    c(
      "na, wrong skip" = -3,
      if (!is.null(reference)) routed(reference) else numeric(0),
      "na, asked" = -1,
      "0 days" = 1,
      "1-3 days" = 2,
      "4-7 days" = 3,
      "> 1 week but < 1 month" = 4,
      "all the time" = 5,
      "do not know" = 6,
      "refused to answer" = 7
    )
  }
  yes_no_map <- function(initial = NULL, reference = NULL,
                         wrong = FALSE) {
    c(
      if (!is.null(initial)) initial else numeric(0),
      if (wrong) c("na, wrong skip" = -3) else numeric(0),
      if (!is.null(reference)) routed(reference) else numeric(0),
      "na, asked" = -1,
      "no" = 1,
      "yes" = 2,
      "do not know" = 3,
      "refused to answer" = 4
    )
  }
  mention_map <- function(reference = NULL, wrong = TRUE, asked = TRUE,
                          short = FALSE) {
    c(
      if (short) c("na, short interview" = -4) else numeric(0),
      if (wrong) c("na, wrong skip" = -3) else numeric(0),
      if (!is.null(reference)) routed(reference) else numeric(0),
      if (asked) c("na, asked" = -1) else numeric(0),
      "not mentioned" = 0,
      "mentioned" = 1
    )
  }
  hours_map <- function(reference, maximum, short = FALSE,
                        missing4 = "na, refused", wrong = TRUE,
                        asked = "na, asked", include_zero = TRUE) {
    c(
      if (short || !is.null(missing4)) {
        setNames(-4, if (short) "na, short interview" else missing4)
      } else numeric(0),
      if (wrong) c("na, wrong skip" = -3) else numeric(0),
      if (!is.null(reference)) routed(reference) else numeric(0),
      if (!is.null(asked)) setNames(-1, asked) else numeric(0),
      if (include_zero) c("<30 minutes" = 0) else numeric(0),
      setNames(maximum, "continuously day and night")
    )
  }
  partner_help_map <- function(initial, health_reference = NULL) {
    c(
      "na, P outside HH" = -7,
      "na, no Partner" = -6,
      initial,
      "na, wrong skip" = -3,
      if (!is.null(health_reference)) routed(health_reference) else numeric(0),
      "na, asked" = -1,
      "no" = 1,
      "yes" = 2,
      "do not know" = 3,
      "refused to answer" = 4
    )
  }
  sufficient_map <- function(initial = NULL, reference = NULL,
                             include_wrong = TRUE,
                             do_not_know = "do not know") {
    c(
      if (!is.null(initial)) initial else numeric(0),
      if (include_wrong) c("na, wrong skip" = -3) else numeric(0),
      if (!is.null(reference)) routed(reference) else numeric(0),
      "na, asked" = -1,
      "insufficient" = 1,
      "in between sufficient/insufficient" = 2,
      "sufficient" = 3,
      setNames(4, do_not_know),
      "refused to answer" = 5
    )
  }

  provider_early <- c(
    `01` = "partner", `02` = "resident child", `03` = "resident other",
    `04` = "non-resident child", `05` = "non-resident other family",
    `06` = "neighbours/friends/acquaintances", `07` = "volunteers",
    `08` = "district nurse", `09` = "elderly/home/alpha help",
    `10` = "private", `11` = "personnel home/hospital", `12` = "other"
  )
  provider_i <- c(
    `01` = "partner", `02` = "resident child", `03` = "resident other",
    `04` = "non-resident child", `05` = "non-resident other family",
    `06a` = "neighbours", `06b` = "friends/acquaintances",
    `07` = "volunteers", `08` = "district nurse",
    `09` = "elderly/home/alpha help", `10` = "private",
    `11` = "personnel home/hospital", `12` = "other"
  )
  provider_jk <- c(
    `01` = "partner", `02a` = "resident child",
    `02b` = "resident child-in-law", `03` = "resident other",
    `04a` = "non-resident child", `04b` = "non-resident child-in-law",
    `05` = "non-resident other family", `06a` = "neighbours",
    `06b` = "friends/acquaintances", `07` = "volunteers",
    `08` = "district nurse", `09` = "elderly/home/alpha",
    `10` = "private", `11` = "personnel home/hospital", `12` = "other"
  )

  add_sources <- function(stem, providers, label_prefix, value_map,
                          first_label = NULL, first_suffix = NULL) {
    ids <- names(providers)
    for (i in seq_along(ids)) {
      id <- ids[[i]]
      suffix_id <- if (i == 1L && !is.null(first_suffix)) first_suffix else id
      label <- if (i == 1L && !is.null(first_label)) {
        first_label
      } else {
        paste0(label_prefix, providers[[i]])
      }
      add(paste0(stem, "help", suffix_id), label, value_map)
    }
  }
  add_hours <- function(stem, providers, label_prefix, map_for,
                        include_total = FALSE, total_map = NULL) {
    if (include_total) {
      add(
        paste0(stem, "hourtot"), paste0(label_prefix, "total"),
        total_map, force_numeric = TRUE
      )
    }
    ids <- names(providers)
    for (i in seq_along(ids)) {
      add(
        paste0(stem, "hour", ids[[i]]),
        paste0(label_prefix, providers[[i]]),
        map_for(ids[[i]], i),
        force_numeric = TRUE
      )
    }
  }
  add_sick <- function(ids, descriptions, first_number, map_for) {
    for (i in seq_along(ids)) {
      number <- first_number + i - 1L
      suffix <- if (grepl("^[0-9]+$", ids[[i]])) {
        sprintf("%02d", number)
      } else {
        ids[[i]]
      }
      add(
        paste0("rsick", suffix), descriptions[[i]], map_for(i, suffix)
      )
    }
  }
  add_partner_details <- function(reference) {
    add(
      "phlp01y", "Help P: respondent, start year",
      c("na, wrong skip" = -3, routed(reference), "na, asked" = -1),
      force_numeric = TRUE
    )
    add(
      "phlp01m", "Help P: respondent, start month",
      c(
        "na, wrong skip" = -3, routed(reference), "na, asked" = -1,
        setNames(seq_along(month.name), month.name)
      )
    )
    add(
      "phlp01b", "Help P: burden for respondent",
      c(
        "na, wrong skip" = -3, routed(reference), "na, asked" = -1,
        "not at all or hardly a burden" = 1,
        "somewhat a burden" = 2,
        "rather heavy burden" = 3,
        "very heavy burden" = 4,
        "overburdened" = 5
      )
    )
  }

  personal_sick_early <- c(
    "Sick: pers care by respondent", "Sick: pers care by partner",
    "Sick: pers care by resident child", "Sick: pers care by resident other",
    "Sick: pers care by non-resident child",
    "Sick: pers care by non-resident other family",
    "Sick: pers care by neighbours/friends/acquaintances",
    "Sick: pers care by volunteers", "Sick: pers care by district nurse",
    "Sick: pers care by elderly/home/alpha help",
    "Sick: pers care by private help",
    "Sick: pers care by personnel home/hospital",
    "Sick: pers care by nobody", "Sick: pers care by other"
  )
  domestic_sick_early <- sub(
    "pers care", "domestic care", personal_sick_early, fixed = TRUE
  )

  if (wave %in% c("B", "C", "D", "E", "2B", "F", "G")) {
    doc_prefix <- if (wave %in% c("D", "2B")) "D/B" else wave
    initial_health <- if (wave == "B") {
      c(
        "na, technical missing" = -6,
        "interview terminated" = -5,
        "na, short interview" = -4
      )
    } else {
      setNames(-5, if (wave == "C") "na, interv broken off" else "na, terminated interview")
    }
    add("health1", "Health problems limit normal activities", health1_map(initial_health))
    add("health2", "How long limitations", health2_map(paste0(doc_prefix, "HEALTH1"), wave == "B"))
    add(
      "health3", "Past month: days sick in bed",
      health_days_map(paste0(doc_prefix, "HEALTH1"))
    )
    add("health4", "Past month: #days limited in activities", specs[[3L]]$value_label_map)

    r_initial <- if (wave == "B") NULL else setNames(
      -5, if (wave == "C") "na, interv broken off" else "na, terminated interview"
    )
    r_yes <- if (wave == "B") {
      yes_no_map(reference = paste0(doc_prefix, "HEALTH1"), wrong = TRUE)
    } else {
      yes_no_map(initial = r_initial)
    }
    add("rhelpyn", "Help R with personal care Y/N", r_yes)
    source_map <- mention_map(
      paste0(doc_prefix, "RHELPYN"),
      asked = wave != "B"
    )
    add_sources("r", provider_early, "Help R: ", source_map)

    early_hour_map <- function(stem, id, index) {
      ref <- paste0(doc_prefix, toupper(stem), "HELP", toupper(id))
      if (wave == "B") {
        hours_map(
          ref, 168, short = TRUE, missing4 = NULL,
          asked = "no (valid) answer", include_zero = FALSE
        )
      } else if (wave %in% c("C", "D", "E", "2B", "F") &&
                 stem == "r" && index > 1L) {
        hours_map(ref, 168, short = TRUE, missing4 = NULL,
                  asked = "no (valid) answer")
      } else {
        hours_map(
          ref, 168, missing4 = if (wave == "G") "na, refused" else NULL
        )
      }
    }
    add_hours(
      "r", provider_early, "Hours help R: ",
      function(id, i) early_hour_map("r", id, i)
    )

    p_initial <- c(
      if (wave == "B") c("na, short interview" = -4) else numeric(0),
      if (wave != "B") setNames(
        -5, if (wave == "C") "na, interv broken off" else "na, terminated interview"
      ) else numeric(0)
    )
    add(
      "phelpyn", "Help partner with personal care",
      partner_help_map(
        p_initial,
        health_reference = if (wave == "B") paste0(doc_prefix, "HEALTH1") else NULL
      )
    )
    p_source_map <- mention_map(
      paste0(doc_prefix, "PHELPYN"),
      asked = wave != "B"
    )
    add(
      "phelp01", "Helpp: respondent", p_source_map
    )
    if (wave == "G") add_partner_details(paste0(doc_prefix, "PHELP01"))
    for (id in names(provider_early)[-1L]) {
      add(
        paste0("phelp", id),
        paste0("Helpp: ", provider_early[[id]]),
        p_source_map
      )
    }
    provider_p <- provider_early
    provider_p[["01"]] <- "respondent"
    add_hours(
      "p", provider_p, "Hours helpp: ",
      function(id, i) early_hour_map("p", id, i)
    )

    if (wave != "E") {
      add_sick(
        sprintf("%02d", 1:14), personal_sick_early, 1L,
        function(i, suffix) {
          if (wave == "B" && i == 1L) {
            mention_map("BPHELPYN", wrong = FALSE, short = TRUE)
          } else if (wave == "B") {
            mention_map("BRSICK01", wrong = FALSE)
          } else {
            mention_map(paste0(doc_prefix, "RHELPYN"))
          }
        }
      )
    }

    d_initial <- if (wave == "B") NULL else setNames(
      -5, if (wave == "C") "na, interv broken off" else "na, terminated interview"
    )
    d_yes <- if (wave == "B") {
      yes_no_map(reference = "BHEALTH1")
    } else {
      yes_no_map(initial = d_initial)
    }
    add("dhelpyn", "Help with domestic tasks Yes/No", d_yes)
    d_source_map <- mention_map(
      paste0(doc_prefix, "DHELPYN"),
      wrong = wave != "B", asked = wave != "B"
    )
    add_sources("d", provider_early, "Help: ", d_source_map)
    add_hours(
      "d", provider_early, "Hours help: ",
      function(id, i) early_hour_map("d", id, i)
    )

    if (wave != "E") {
      add_sick(
        sprintf("%02d", 15:28), domestic_sick_early, 15L,
        function(i, suffix) {
          if (wave == "B" && i == 1L) {
            mention_map("BDHELPYN", short = TRUE)
          } else if (wave == "B") {
            mention_map("BRSICK15", wrong = FALSE)
          } else {
            mention_map(paste0(doc_prefix, "DHELPYN"))
          }
        }
      )
    }

    suff_reference <- if (wave == "B") {
      "BHEALTH1"
    } else {
      paste0(doc_prefix, "R- ", doc_prefix, "P- & ", doc_prefix, "DHELPYN")
    }
    suff_initial <- switch(
      wave,
      B = c("na, R not need help" = -6, "na, short interview" = -4),
      D = c("na, terminated interview" = -5),
      `2B` = c("na, terminated interview" = -5),
      E = c("na, terminated interview" = -5),
      F = c("na, terminated interview" = -5),
      G = c("na, terminated interview" = -5),
      NULL
    )
    add(
      "suffic", "Respondent gets sufficient help",
      sufficient_map(
        initial = suff_initial,
        reference = suff_reference,
        include_wrong = wave != "B"
      )
    )

    if (wave == "B") {
      add(
        "hmunici", "Sufficient help facilities in municipality",
        c(
          "na, short interview" = -4, routed("BHEALTH"), "na, asked" = -1,
          "no" = 1, "yes" = 2, "do not know" = 3,
          "refused to answer" = 4
        )
      )
    } else if (wave == "2B") {
      add(
        "hmunici", "Sufficient help facilities in municipality",
        c(
          "na, terminated interview" = -5, "na, wrong skip" = -3,
          "na, asked" = -1, "no" = 1, "yes" = 2,
          "do not know" = 3, "refused to answer" = 4
        )
      )
    } else if (wave == "F") {
      add(
        "homec1", "Need (more) homecare",
        c("na, terminated interview" = -5, "na, asked" = -1, "no" = 1, "yes" = 2)
      )
      add(
        "homec2", "Applied for homecare",
        c(routed("FHOMEC1"), "applied and received" = 1,
          "applied and not received" = 2, "not applied" = 3)
      )
      add(
        "homec3", "Reason for not receiving homecare",
        c(
          routed("FHOMEC2"), "na, asked" = -1,
          "on waiting list/waiting for indication" = 1,
          "CIZ: use informal network" = 2,
          "CIZ: need for care not severe enough" = 3,
          "I do not know" = 4, "other reason" = 5
        )
      )
      add(
        "homec3s", "Other reason not receiving homecare (specified)",
        c(routed("FHOMEC3"), "to be coded" = 0)
      )
      add(
        "homec4", "Reason for not applying for homecare",
        c(
          routed("FHOMEC2"), "na, asked" = -1,
          "do not know how" = 1, "I do not qualify" = 2,
          "I can not pay for it" = 3,
          "no sense because of waiting list" = 4,
          "do not want strangers in home" = 5, "other reason" = 6
        )
      )
      add(
        "homec4s", "Other reason not applying for homecare (specified)",
        c(routed("FHOMEC4"), "to be coded" = 0)
      )
    } else if (wave == "G") {
      add(
        "homec1", "Need (more) homecare",
        c("na, terminated interview" = -5, "na, asked" = -1, "no" = 1, "yes" = 2)
      )
    }
  }

  later_wave <- wave %in% c("H", "3B", "MB", "I", "J", "K")
  if (later_wave) {
    doc_prefix <- switch(wave, H = "H", `3B` = "B", MB = "B", I = "I", J = "J/K", K = "J/K")
    if (wave != "MB") {
      add(
        "health1", "Health problems limit normal activities",
        health1_map(c("na, terminated interview" = -5))
      )
      add("health2", "How long limitations", health2_map(paste0(doc_prefix, "HEALTH1")))
      add("health3", "Past month: days sick in bed", health_days_map())
      add("health4", "Past month: #days limited in activities", specs[[3L]]$value_label_map)
    }

    providers <- if (wave == "I") provider_i else if (wave %in% c("J", "K")) provider_jk else provider_early
    help_initial <- c("na, terminated interview" = -5)
    standard_yes <- yes_no_map(initial = help_initial)
    later_hours_total <- function(reference) {
      hours_map(
        reference, 112, missing4 = "na, refused",
        wrong = wave != "I"
      )
    }
    later_hours_one <- function(reference) {
      hours_map(reference, 112, missing4 = "na, refused")
    }
    source_label <- function(kind, provider, partner = FALSE) {
      switch(
        kind,
        r = paste0("Help R: ", provider),
        p = paste0("Help P: ", if (partner) "respondent" else provider),
        d = paste0("domestic help R: ", provider),
        n = paste0("nursing help R: ", provider),
        g = paste0("guidance help R: ", provider),
        a = paste0("administrative help R: ", provider)
      )
    }
    hour_label <- function(kind, provider, total = FALSE) {
      base <- switch(
        kind,
        r = "Hours help R: ", p = "Hours help P: ",
        d = "Hours domestic help R: ", n = "Hours nursing help R: ",
        g = "Hours guidance help R: ", a = "Hours administrative help R: "
      )
      paste0(base, if (total) "total" else provider)
    }
    add_later_block <- function(kind, yes_label, include_partner_details = FALSE,
                                h_person_details = FALSE) {
      helpyn <- paste0(kind, "helpyn")
      if (kind == "p") {
        add(
          helpyn, yes_label,
          partner_help_map(c("na, terminated interview" = -5))
        )
      } else {
        add(helpyn, yes_label, standard_yes)
      }

      ids <- names(providers)
      for (i in seq_along(ids)) {
        id <- ids[[i]]
        suffix_id <- id
        if (wave %in% c("J", "K") && kind == "r" && id %in% c("06a", "06b")) {
          suffix_id <- sub("^0", "", id)
        }
        provider <- providers[[i]]
        if (kind == "p" && i == 1L) provider <- "respondent"
        add(
          paste0(kind, "help", suffix_id),
          source_label(kind, provider, partner = kind == "p" && i == 1L),
          mention_map(paste0(doc_prefix, toupper(kind), "HELPYN"))
        )
        if (kind == "p" && i == 1L && include_partner_details) {
          add_partner_details(paste0(doc_prefix, "PHELP01"))
        }
      }

      total_reference <- paste0(doc_prefix, toupper(kind), "HELPYN")
      add(
        paste0(kind, "hourtot"), hour_label(kind, "", total = TRUE),
        later_hours_total(total_reference), force_numeric = TRUE
      )
      for (i in seq_along(ids)) {
        id <- ids[[i]]
        provider <- providers[[i]]
        if (kind == "p" && i == 1L) provider <- "respondent"
        hour_reference <- paste0(doc_prefix, toupper(kind), "HELP", toupper(id))
        hour_map <- if (wave %in% c("H", "3B", "MB")) {
          later_hours_total(total_reference)
        } else {
          later_hours_one(hour_reference)
        }
        if (wave == "H" && kind == "r") {
          hour_map <- later_hours_total(total_reference)
        }
        if (h_person_details && i > 1L) {
          add(
            paste0(kind, "x", id),
            paste0(
              "number of persons ",
              sub("^Help", "help", source_label(kind, provider))
            ),
            force_numeric = TRUE
          )
        }
        add(
          paste0(kind, "hour", id), hour_label(kind, provider),
          hour_map, force_numeric = TRUE
        )
      }

      if (h_person_details) {
        sex_map <- c("man" = 1, "woman" = 2)
        for (id in ids[-1L]) {
          provider_number <- as.integer(id)
          for (person in 1:5) {
            detail_id <- paste0(provider_number, sprintf("%02d", person))
            add(paste0(kind, "sex", detail_id), "", sex_map)
          }
          for (person in 1:5) {
            detail_id <- paste0(provider_number, sprintf("%02d", person))
            add(
              paste0(kind, "hour", detail_id), "", NULL,
              force_numeric = TRUE
            )
          }
        }
      }
    }

    add_later_block(
      "r", "Help R with personal care Y/N",
      h_person_details = wave == "H"
    )
    add_later_block(
      "p", "Help partner with personal care",
      include_partner_details = wave %in% c("H", "3B", "I", "J", "K"),
      h_person_details = wave == "H"
    )

    if (wave != "MB") {
      personal_ids <- if (wave == "I") {
        c(sprintf("%02d", 1:6), "07a", "07b", sprintf("%02d", 8:13), "14a", "14b")
      } else if (wave %in% c("J", "K")) {
        c("01", "02", "03a", "03b", "04", "05a", "05b", "06",
          "07a", "07b", sprintf("%02d", 8:13), "14a", "14b")
      } else {
        sprintf("%02d", 1:14)
      }
      personal_desc <- if (wave == "I") {
        c(
          personal_sick_early[1:6],
          "Sick: pers care by neighbours",
          "Sick: pers care by friends/acquaintances",
          personal_sick_early[8:13],
          "Sick: pers care by other", "Sick: does not know by whom"
        )
      } else if (wave %in% c("J", "K")) {
        c(
          "Sick: pers care by respondent", "Sick: pers care by partner",
          "Sick: pers care by resident child",
          "Sick: pers care by resident child-in-law",
          "Sick: pers care by resident other",
          "Sick: pers care by non-resident child",
          "Sick: pers care by non-resident child-in-law",
          "Sick: pers care by non-resident other family",
          "Sick: pers care by neighbours",
          "Sick: pers care by friends/acquaintances",
          personal_sick_early[8:13],
          "Sick: pers care by other", "Sick: does not know by whom"
        )
      } else {
        personal_sick_early
      }
      for (i in seq_along(personal_ids)) {
        add(
          paste0("rsick", personal_ids[[i]]), personal_desc[[i]],
          mention_map(NULL)
        )
      }
    }

    add_later_block(
      "d", "Help R with domestic tasks Y/N",
      h_person_details = wave == "H"
    )

    if (wave != "MB") {
      domestic_ids <- if (wave == "I") {
        c(sprintf("%02d", 15:20), "21a", "21b", sprintf("%02d", 22:27), "28a", "28b")
      } else if (wave %in% c("J", "K")) {
        c("15", "16", "17a", "17b", "18", "19a", "19b", "20",
          "21a", "21b", sprintf("%02d", 22:27), "28a", "28b")
      } else {
        sprintf("%02d", 15:28)
      }
      domestic_desc <- sub("pers care", "domestic care", personal_desc, fixed = TRUE)
      for (i in seq_along(domestic_ids)) {
        add(
          paste0("rsick", domestic_ids[[i]]), domestic_desc[[i]],
          mention_map(paste0(doc_prefix, "DHELPYN"))
        )
      }
    }

    add_later_block(
      "n", "Help R with nursing tasks Y/N",
      h_person_details = wave == "H"
    )
    if (wave %in% c("H", "I", "J", "K")) {
      add_later_block(
        "g", "Help R with guidance tasks Y/N",
        h_person_details = wave == "H"
      )
      add_later_block(
        "a", "Help R with administration Y/N",
        h_person_details = wave == "H"
      )
    }

    if (wave == "H") {
      pgb_reference <- "HR-, HD-, HN-, HG- & HAHELPYN"
      add(
        "pgbyn", "R pays for care from PGB (personal budget) Y/N",
        c(
          "na, terminated interview" = -5, "na, wrong skip" = -3,
          routed(pgb_reference, code = 2), "na, asked" = -1,
          "no" = 1, "yes" = 2, "do not know" = 3,
          "refused to answer" = 4
        )
      )
      for (id in names(provider_early)) {
        add(
          paste0("pgb", id),
          paste0("R pays from PGB: ", provider_early[[id]]),
          mention_map("HPGBYN")
        )
      }
      cooperation <- c(
        "na, wrong skip" = -3, routed(pgb_reference), "na, asked" = -1,
        "strongly disagree" = 1, "disagree" = 2,
        "no disagreement/agreement" = 3, "agree" = 4,
        "strongly agree" = 5
      )
      add("coop1", "the caregivers cooperate well", cooperation)
      add(
        "coop2", "when things dont go well, the caregivers discuss with me",
        cooperation
      )
    }

    if (wave %in% c("H", "3B", "MB")) {
      suff_ref <- switch(
        wave,
        H = "HR-, HD-, HN-, HG- & HAHELPYN",
        `3B` = "BR-, BD-, & BNHELPYN",
        MB = NULL
      )
      add(
        "suffic", "Respondent gets sufficient help",
        sufficient_map(
          initial = if (wave == "MB") c("na, terminated interview" = -5) else NULL,
          reference = suff_ref,
          do_not_know = if (wave == "MB") "do not know/not applicable" else "do not know"
        )
      )
      problem_map <- c(
        "na, wrong skip" = -3, routed(paste0(doc_prefix, "SUFFIC")),
        "na, asked" = -1, "no" = 1, "yes" = 2
      )
      problem_labels <- c(
        "insufficient help problem: too little help",
        "insufficient help problem: wrong kind of help",
        "insufficient help problem: help is not given properly",
        "insufficient help problem: preferably from someone else, namely.."
      )
      for (i in seq_along(problem_labels)) {
        add(paste0("suffic", i), problem_labels[[i]], problem_map)
      }
      preferred <- c(provider_early, `13` = "nobody")
      preferred_map <- c(
        routed(paste0(doc_prefix, "SUFFIC4")), "na, asked" = -1,
        "not mentioned" = 0, "mentioned" = 1
      )
      for (id in names(preferred)) {
        add(
          paste0("suff4", id),
          paste0("preferably help from: ", preferred[[id]]),
          preferred_map
        )
      }
      if (wave != "MB") {
        add("suffoth", "insufficient help problem: other", problem_map)
      }
    }

    if (wave %in% c("I", "J", "K")) {
      helpr_ref <- if (wave == "I") NULL else paste0(doc_prefix, "HELPR")
      if (wave %in% c("J", "K")) {
        add(
          "helpr", "(constructed) R gets help (personal, domestic, nursing, guidance or administrative)",
          c(
            "R gets no help" = 0,
            "R gets any help (personal, domestic, nursing, guidance or administrative)" = 1
          )
        )
      }
      count_map <- c(
        "na, wrong skip" = -3,
        if (!is.null(helpr_ref)) routed(helpr_ref) else routed("IAHELP12"),
        "na, asked" = -1
      )
      add(
        "hhnic", "Number of different persons help at home: informal carers",
        count_map, force_numeric = TRUE
      )
      count_other_map <- if (wave == "I") {
        count_map
      } else {
        c(
          "na, not living independently" = -4,
          "na, wrong skip" = -3, routed(helpr_ref), "na, asked" = -1
        )
      }
      add(
        "hhnvol", "Number of different persons help at home: volunteers",
        count_other_map, force_numeric = TRUE
      )
      add(
        "hhnprof", "Number of different persons help at home: professionals",
        count_other_map, force_numeric = TRUE
      )
      suff_ref <- if (wave == "I") "IR-, ID-, IN-, IG-, IAHELPYN" else helpr_ref
      add(
        "suffic", "Respondent gets sufficient help",
        sufficient_map(reference = suff_ref)
      )
      need_map <- c(
        "na, wrong skip" = -3,
        if (wave %in% c("J", "K")) routed(paste0(doc_prefix, "HELPR & ", doc_prefix, "SUFFIC")) else numeric(0),
        "na, asked" = -1,
        "no, I do not need help with this" = 1,
        "no, I get enough hours of help with this" = 2,
        "yes, I would like to have more hours of help with this" = 3
      )
      needs <- c(
        "domestic tasks", "personal care", "nursing", "guidance",
        "with mental complaints", "with physical complaints"
      )
      for (i in seq_along(needs)) {
        add(paste0("hn", i), paste0("Help needs: ", needs[[i]]), need_map)
      }
    }

    control_reference <- switch(
      wave,
      H = "HR-, HD-, HN-, HG- & HAHELPYN",
      `3B` = "BR-, BD-, & BNHELPYN",
      MB = "BR-, BD-, & BNHELPYN",
      I = "IR-, ID-, IG-, IG & IAHELPYN",
      J = "J/KHELPR",
      K = "J/KHELPR"
    )
    control_map <- c(
      "na, wrong skip" = -3,
      if (!is.null(control_reference)) routed(control_reference) else numeric(0),
      "na, asked" = -1,
      "leave it all to others" = 1,
      "determine it somewhat by myself" = 2,
      "determine it all by myself" = 3
    )
    add(
      "regie1", "control: to what extent can R determine who gives help",
      control_map
    )
    add(
      "regie2", "control: to what extent can R determine which help is given",
      control_map
    )
    add(
      "regie3", "control: to what extent can R determine when help is given",
      control_map
    )
    add(
      "regie4", "control: to what extent does R find it important to determine the caregiving",
      c(
        "na, wrong skip" = -3,
        if (!is.null(control_reference)) routed(control_reference) else numeric(0),
        "na, asked" = -1,
        "very unimportant" = 1, "unimportant" = 2,
        "not important / not unimportant" = 3,
        "important" = 4, "very important" = 5
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
