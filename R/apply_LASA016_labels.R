# Apply LASA 016 (Employment status) SPSS variable and value labels
#
# Source: LASA016_varinfo.pdf (24-Aug-2023)

#' Apply LASA016 (Employment Status) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to a LASA016 employment-status data frame. The
#' function includes all wave-specific variables and all six classification
#' tables printed in `LASA016_varinfo.pdf`: SBC92 occupational class, month,
#' skill type, job regularity, job type, and skill/work level.
#'
#' LASA016 changes substantially across waves. Early waves use SBC92 source
#' variables and retirement modules, 2B adds respondent/father/partner job
#' histories, H introduces SBC2010 source variables, 3B and MB add last-job
#' histories, and J/K add job-change, work-ability, absence, and expanded
#' retirement modules. `wave` is required because B, 2B, 3B, and MB all use
#' variable names beginning with `"b"` while documenting different schemas.
#'
#' By default, matched variables retain their imported numeric coding. With
#' `to_factor = TRUE`, categorical variables use their codebook labels as
#' factor levels. With `to_numeric = TRUE`, counts, hours, years, percentages,
#' ages, occupation/prestige scores, and other numeric measures are restored
#' to plain numeric and negative missing-reason codes become `NA`.
#'
#' Two source anomalies are handled transparently. First, the K-wave table
#' prints the paid-job variable as `kkob1`, although all routing references
#' call it `KJOB1`. The function treats `kjob1` as canonical and automatically
#' accepts `kkob1` when that printed spelling is present. Second, the J/K
#' `tasks` rows assign -1 and -2 both to missing reasons and to substantive
#' task categories. Their `labels` and `original_labels` attributes preserve
#' all published entries in order. Because a factor cannot have two meanings
#' for one numeric code, factor conversion uses the first published meaning
#' for each duplicated code; the full ambiguous mapping remains available in
#' `original_labels` for auditing.
#'
#' Several other routing labels that appear to contain typographical errors
#' (for example `"na, see G/JOBC"` and selected 3B cross-references) are also
#' preserved verbatim. This keeps the metadata directly comparable with the
#' published PDF instead of silently rewriting its wording.
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
#' @param data A data frame or tibble imported from a LASA016 `.sav` file,
#'   for example via [haven::read_sav()]. Expected names include `bjob1`,
#'   `gcjclass`, `hpcjsbc`, `ijobs`, `jrjobchange01`, and `kretyr01`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA016 suffixes without the wave
#'   prefix (for example `job1`, `cjclass`, or `pjob6`), and values are actual
#'   column names in `data`, for example `c(cjclass = "B_CJCLASS")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their value labels. Observed values
#'   without a codebook label remain numeric-text levels. For the documented
#'   duplicate J/K `tasks` codes, the first published label is used as the
#'   factor level and the full mapping remains in `original_labels`.
#' @param to_numeric Logical. If `FALSE` (default), numeric measures retain
#'   their SPSS-style missing-reason labels. If `TRUE`, numeric measures such
#'   as hours, years, counts, percentages, ages, source occupation codes, and
#'   prestige/productivity scores are restored to ordinary numeric vectors;
#'   negative missing codes become `NA`. This takes precedence over
#'   `to_factor` for those variables.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA016 columns are renamed to their canonical lowercase
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
#'   matched LASA016 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa015_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   IJOB1 = c(-4, 1, 2),
#'   IJOBSTAM = c(-3, 1, 12),
#'   IJOB6 = c(-2, 20, 40)
#' )
#' dat <- apply_lasa016_labels(dat, wave = "I")
#' attr(dat$IJOBSTAM, "labels")
#'
#' dat <- apply_lasa016_labels(
#'   dat,
#'   wave = "I",
#'   to_factor = TRUE,
#'   to_numeric = TRUE,
#'   standardize_names = TRUE
#' )
#' lasa_label_report(dat, problems_only = TRUE)
apply_lasa016_labels <- function(data,
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
      "Unknown LASA 016 wave: ", wave,
      ". Use one of: ", paste(names(wave_prefix), collapse = ", "), ".",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  # K's variable-name cell says KKOB1, while every routing reference and the
  # cross-wave naming pattern say KJOB1. Prefer KJOB1, but accept the printed
  # spelling automatically when it is the only one present.
  correction_keys <- if (is.null(name_corrections)) {
    character(0)
  } else {
    tolower(names(name_corrections))
  }
  if (
    wave == "K" &&
      !"job1" %in% correction_keys &&
      !any(tolower(names(data)) == "kjob1") &&
      any(tolower(names(data)) == "kkob1")
  ) {
    name_corrections <- c(name_corrections, job1 = "kkob1")
  }

  prefix <- unname(wave_prefix[[wave]])
  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa016_labels",
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
  specs <- list()
  add <- function(suffix, variable_label, value_label_map,
                  force_numeric = FALSE) {
    specs[[length(specs) + 1L]] <<- spec(
      suffix, variable_label, value_label_map, force_numeric
    )
    invisible(NULL)
  }

  sbc92_labels <- c(
    "elementary occupations" = 11,
    "lower non-specialized occupations" = 21,
    "lower teaching & instruction occupations" = 22,
    "lower agricultural occupations" = 24,
    "lower natural science occupations" = 25,
    "lower technical occupations" = 26,
    "lower transport occupations" = 28,
    "lower (para)medical occupations" = 29,
    "lower administrative & commercial occupations" = 31,
    "lower security occupations" = 33,
    "lower service & care occupations" = 37,
    "medium teaching & instruction occupations" = 42,
    "medium agricultural occupations" = 44,
    "medium natural science occupations" = 45,
    "medium technical occupations" = 46,
    "medium transport occupations" = 48,
    "medium (para)medical occupations" = 49,
    "medium administrative & commercial occupations" = 51,
    "medium juridical & security occupations" = 53,
    "medium linguistic & cultural occupations" = 55,
    "medium social occupations" = 56,
    "medium service & care occupations" = 57,
    "higher pedagogical occupations" = 62,
    "higher agricultural occupations" = 64,
    "higher natural science occupations" = 65,
    "higher technical occupations" = 66,
    "higher transport occupations" = 68,
    "higher (para)medical occupations" = 69,
    "higher administrative & commercial occupations" = 71,
    "higher juridical & security occupations" = 73,
    "higher linguistic & cultural occupations" = 75,
    "higher social occupations" = 76,
    "higher service & care occupations" = 77,
    "higher managers" = 78,
    "scientific pedagogical occupations" = 82,
    "scientific agricultural occupations" = 84,
    "scientific natural science occupations" = 85,
    "scientific technical occupations" = 86,
    "scientific (para)medical occupations" = 89,
    "scientific administrative & economic occupations" = 91,
    "scientific juridical & policy occupations" = 93,
    "scientific social occupations" = 96,
    "scientific managers" = 98
  )
  month_labels <- c(
    "January" = 1, "February" = 2, "March" = 3, "April" = 4,
    "May" = 5, "June" = 6, "July" = 7, "August" = 8,
    "September" = 9, "October" = 10, "November" = 11,
    "December" = 12
  )
  skill_type_labels <- c(
    "general" = 1, "pedagogical" = 2, "agricultural" = 4,
    "natural science" = 5, "technical" = 6, "transport" = 8,
    "(para)medical" = 9, "administrative/commercial" = 11,
    "juridical/security" = 13, "cultural/linguistic" = 15,
    "social science" = 16, "care & services" = 17, "management" = 18
  )
  job_regularity_labels <- c(
    "regular hours (9 to 5)" = 1,
    "regular hours, including night/weekend shifts" = 2,
    "shift work, no weekend shifts" = 3,
    "shift work, including weekend shifts" = 4,
    "irregular hours, no weekend shifts" = 5,
    "irregular hours, including weekend shifts" = 6
  )
  job_type_labels <- c(
    "steady job" = 1,
    "temporary job with contract" = 2,
    "temporary job via employment agency" = 3,
    "self-employed" = 4,
    "free-lance basis" = 5,
    "family company" = 6,
    "other" = 7
  )
  if (wave == "K") {
    job_type_labels <- c(job_type_labels, "0-hours/stand-by contract" = 8)
  }
  skill_level_labels <- c(
    "elementary" = 1,
    "low" = 2,
    "medium" = 3,
    "high" = 4,
    "scientific" = 5
  )

  missing_map <- function(ref = NULL, wrong = TRUE, asked = "na, asked",
                          extra = numeric(0)) {
    c(
      extra,
      if (wrong) c("na, wrong skip" = -3) else numeric(0),
      if (!is.null(ref)) setNames(-2, paste0("na, see ", ref)) else numeric(0),
      if (!is.null(asked)) setNames(-1, asked) else numeric(0)
    )
  }
  paid_job_labels <- function(extra = c("na, short version" = -4)) {
    c(extra, "na, asked" = -1, "no" = 1, "yes" = 2)
  }
  changed_job_labels <- function(ref, include_unknown = TRUE) {
    c(
      setNames(-2, paste0("na, see ", ref)),
      "never had job, unknown before" = -1,
      if (include_unknown) c("unknown" = 0) else numeric(0),
      "no job, not changed" = 1,
      "no job, changed" = 2,
      "no job, unknown before" = 3,
      "job, not changed" = 4,
      "job, changed" = 5,
      "job, unknown before" = 6
    )
  }
  same_job_labels <- function(job1_ref, jobc_ref, wrong = FALSE) {
    c(
      if (wrong) c("na, wrong skip" = -3) else numeric(0),
      setNames(-2, paste0("na, see ", job1_ref)),
      setNames(-1, paste0("na, see ", jobc_ref)),
      "no" = 1,
      "not sure" = 2,
      "yes" = 3
    )
  }
  binary_labels <- function(ref, wrong = TRUE, codes = c(no = 1, yes = 2),
                            extra = numeric(0), asked = "na, asked") {
    c(missing_map(ref, wrong = wrong, asked = asked, extra = extra), codes)
  }
  month_map <- function(ref, wrong = TRUE, extra = numeric(0),
                        asked = "na, asked") {
    c(missing_map(ref, wrong = wrong, asked = asked, extra = extra), month_labels)
  }
  table_map <- function(ref, table, wrong = FALSE, asked = NULL,
                        extra = numeric(0)) {
    c(missing_map(ref, wrong = wrong, asked = asked, extra = extra), table)
  }
  management_count_map <- function(ref, include_98 = FALSE) {
    c(
      missing_map(ref),
      if (include_98) c("98 or more" = 98) else numeric(0)
    )
  }
  retired_labels <- function(ref, age_label = NULL, wrong = TRUE,
                             asked = "na, asked") {
    c(
      if (!is.null(age_label)) setNames(-5, age_label) else numeric(0),
      missing_map(ref, wrong = wrong, asked = asked),
      "no" = 1,
      "yes, partly" = 2,
      "yes, completely" = 3
    )
  }
  voluntary_labels <- function(ref, age_label = NULL, wrong = TRUE) {
    c(
      if (!is.null(age_label)) setNames(-5, age_label) else numeric(0),
      missing_map(ref, wrong = wrong),
      "no, not retired" = 1,
      "yes, retired entirely voluntarily" = 2,
      "yes, retired but not entirely voluntarily" = 3
    )
  }
  future_reason_labels <- c(
    "stress and pressure of work too high" = 1,
    "physically too heavy" = 2,
    "health complaints too hampering" = 3,
    "not motivated anymore" = 4,
    "nicer to spend more time on private life" = 5,
    "not possible anymore in the future" = 6,
    "other reason" = 7
  )
  work_until_labels <- c(
    "no, I do not think so" = 1,
    "I am sometimes not sure about this" = 2,
    "yes, I do think so" = 3
  )

  if (wave == "B") {
    current_missing <- missing_map("BJOB1")
    longest_missing <- c(
      "na, wrong skip" = -3,
      "na, see BJOB8 & BJOBLO1" = -2,
      "na, asked" = -1
    )

    add("job1", "paid job at present?", paid_job_labels())
    add(
      "cjsbc92", "cur. job: standard classification occupation",
      current_missing, force_numeric = TRUE
    )
    add(
      "cjclass", "cur. job: occupational class SBC92",
      c(current_missing, sbc92_labels)
    )
    add(
      "cjlevel", "cur. job: occupational skill-level SBC92",
      c(current_missing, skill_level_labels)
    )
    add(
      "cjtype", "cur. job: main type of skills in occupation",
      c(current_missing, skill_type_labels)
    )
    add(
      "cjpresi", "cur. job: occup prestige (Sixma & Ultee)",
      c(current_missing, "low prestige" = 13, "high prestige" = 87),
      force_numeric = TRUE
    )
    add("job3", "Present job: type", c(current_missing, job_type_labels))
    add(
      "job4", "Present job: management Yes/No",
      c(
        "na, short version" = -4, current_missing,
        "no" = 0, "yes" = 1
      )
    )
    add(
      "job5", "Present job: management # of people",
      c(current_missing, "98 or more" = 98), force_numeric = TRUE
    )
    add("job6", "Present job: hours", current_missing, force_numeric = TRUE)
    add(
      "job7", "Present job: regularity",
      c(current_missing, job_regularity_labels)
    )
    add(
      "job8", "Is present job longest job?",
      c(
        "no answer, short version" = -4, current_missing,
        "no" = 0, "yes" = 1
      )
    )
    add(
      "joblo1", "Paid Job before? (longest)",
      c(
        "no answer, short version" = -4,
        "no answer, wrong skip" = -3,
        "no answer, routing" = -2,
        "no answer, asked" = -1,
        "no" = 0,
        "yes" = 1
      )
    )
    add(
      "ljsbc92", "long. job: standard classification occupation",
      c(
        "na, wrong skip" = -3,
        "na, BJOB8 & BJOBLO1" = -2,
        "na, asked" = -1
      ),
      force_numeric = TRUE
    )
    add(
      "ljclass", "long. job: occupational class SBC92",
      c(longest_missing, sbc92_labels)
    )
    add(
      "ljlevel", "long. job: occupational skill-level SBC92",
      c(
        "na, wrong skip" = -3,
        "na, BJOB8 & BJOBLO1" = -2,
        "na, asked" = -1,
        skill_level_labels
      )
    )
    add(
      "ljtype", "long. job: main type of skills in occupation",
      c(longest_missing, skill_type_labels)
    )
    add(
      "ljpresi", "long. job: occup prestige (Sixma & Ultee)",
      c(longest_missing, "low prestige" = 13, "high prestige" = 87),
      force_numeric = TRUE
    )
    add("joblo3", "Longest job: type", c(longest_missing, job_type_labels))
    add(
      "joblo4", "Longest job: management Yes/No",
      c(
        "no answer, short version" = -4,
        "na, wrong skip" = -3,
        "na, BJOB8 & BJOBLO1" = -2,
        "na, asked" = -1,
        "no" = 0,
        "yes" = 1
      )
    )
    add(
      "joblo5", "Longest job: management # of people",
      c(longest_missing, "98 or more" = 98), force_numeric = TRUE
    )
    add(
      "joblo6", "Longest job: hours",
      longest_missing, force_numeric = TRUE
    )
    add(
      "joblo7", "Longest job: regularity",
      c(longest_missing, job_regularity_labels)
    )
    add(
      "jobmon", "Stopped working: month",
      c(
        "no answer, info NESTOR" = -5,
        "no answer, wrong skip" = -3,
        "no answer, routing" = -2,
        "do not know" = -1,
        month_labels
      )
    )
    add(
      "jobyear", "Stopped working: year",
      c(
        "no answer, info NESTOR" = -5,
        "no answer, wrong skip" = -3,
        "no answer, routing" = -2,
        "no answer, asked" = -1,
        "do not know" = 0
      ),
      force_numeric = TRUE
    )
    old_binary <- c(
      "no answer, short version" = -4,
      "no answer, wrong skip" = -3,
      "no answer, routing" = -2,
      "no answer, asked" = -1,
      "no" = 0,
      "yes" = 1
    )
    add("employ", "Employment office: registered", old_binary)
    add("disabl", "Disability Insurance Act", old_binary)
    add(
      "disablp", "Disability Insurance Act: percentage",
      c(
        "no answer, wrong skip" = -3,
        "no answer, routing" = -2,
        "do not know" = -1
      ),
      force_numeric = TRUE
    )
    add(
      "retired", "(Partial) early retirement",
      c(
        "na, Age >= 65" = -5,
        "na, wrong skip" = -3,
        "na, see BJOB1" = -2,
        "na, asked" = -1,
        "no" = 0,
        "yes, partly" = 1,
        "yes, completely" = 2
      )
    )
    add(
      "retifut", "Future retirement: anticipation",
      c(
        "no answer, short version" = -4,
        "na, wrong skip" = -3,
        "na, see BRETIRED" = -2,
        "na, asked" = -1,
        "no" = 0,
        "yes" = 1
      )
    )
    retirement_future <- c(
      "no answer, short version" = -4,
      "na, wrong skip" = -3,
      "na, see BRETIFUT" = -2,
      "na, asked" = -1,
      "not mentioned" = 0,
      "mentioned" = 1
    )
    retirement_future_labels <- c(
      "Fut. retirement: now less working hours",
      "Fut. retirement: now more hobbies",
      "Fut. retirement: now volunteering work",
      "Fut. retirement: now administrative work",
      "Fut. retirement: now more holidays",
      "Fut. retirement: other"
    )
    for (i in seq_along(retirement_future_labels)) {
      add(paste0("retirf", i), retirement_future_labels[[i]], retirement_future)
    }
  } else if (wave %in% c("C", "D", "E", "F", "G")) {
    p <- toupper(prefix)
    job1_ref <- paste0(p, "JOB1")
    jobc_ref <- paste0(p, "JOBC")
    job4_ref <- paste0(p, "JOB4")
    disabl_ref <- paste0(p, "DISABL")
    retired_ref <- paste0(p, "RETIRED")
    retifut_ref <- paste0(p, "RETIFUT")

    add(
      "job1", "Paid job at present",
      c("na, short version" = -4, "no" = 1, "yes" = 2)
    )
    add(
      "jobc", "Paid job, changed (constructed)",
      changed_job_labels(job1_ref, include_unknown = FALSE)
    )
    add(
      "jobstam", "Start working: month",
      month_map(jobc_ref, wrong = wave %in% c("F", "G"))
    )
    add(
      "jobstay", "Start working: year",
      missing_map(jobc_ref, wrong = wave %in% c("E", "F", "G")),
      force_numeric = TRUE
    )

    classification_extra <- if (wave %in% c("D", "F", "G")) {
      c("- to be coded -" = 0)
    } else {
      numeric(0)
    }
    classification_asked <- if (wave %in% c("D", "E")) {
      "na, asked / not classified"
    } else {
      "na, asked"
    }
    classification_missing <- c(
      "na, wrong skip" = -3,
      setNames(-2, paste0("na, see ", job1_ref)),
      setNames(-1, classification_asked),
      classification_extra
    )
    add(
      "cjsbc92", "cur. job: standard classification occupation",
      classification_missing, force_numeric = TRUE
    )

    derived_missing <- classification_missing
    class_missing <- if (wave == "E") {
      c(
        "na, wrong skip" = -3,
        setNames(-2, paste0("na, see ", job1_ref)),
        "na asked, not classified" = -1
      )
    } else {
      derived_missing
    }
    add(
      "cjclass", "cur. job: occupational class SBC92",
      c(class_missing, sbc92_labels)
    )
    add(
      "cjlevel", "cur. job: occupational skill-level SBC92",
      c(derived_missing, skill_level_labels)
    )
    add(
      "cjtype", "cur. job: main type of skills in occupation",
      c(derived_missing, skill_type_labels)
    )
    add(
      "cjpresi", "cur. job: occup prestige (Sixma & Ultee)",
      c(derived_missing, "low prestige" = 13, "high prestige" = 87),
      force_numeric = TRUE
    )
    add(
      "job3", "Present job: type",
      c(missing_map(jobc_ref), job_type_labels)
    )
    add(
      "job4", "present job: management Yes/No (constructed)",
      c(missing_map(jobc_ref), "no" = 0, "yes" = 1)
    )
    add(
      "job5", "Management # people",
      management_count_map(job4_ref, include_98 = wave %in% c("F", "G")),
      force_numeric = TRUE
    )
    add(
      "job6", "Present job: hours/week",
      missing_map(jobc_ref), force_numeric = TRUE
    )
    add(
      "job7", "Present job: regularity",
      c(missing_map(jobc_ref), job_regularity_labels)
    )
    add("jobstom", "Stopped working: month", month_map(jobc_ref))
    add(
      "jobstoy", "Stopped working: year",
      missing_map(jobc_ref), force_numeric = TRUE
    )
    age65 <- c("na, age >= 65" = -5)
    employment_map <- binary_labels(jobc_ref, extra = age65)
    add("employ", "Employment office: registered", employment_map)
    add("disabl", "Disability Insurance Act", employment_map)
    add(
      "disablp", "Disability Insurance Act: percentage",
      missing_map(disabl_ref, wrong = FALSE), force_numeric = TRUE
    )
    add(
      "retired", "(Partial) early retirement",
      retired_labels(jobc_ref, age_label = "na, age >= 65")
    )
    add(
      "retifut", "Future retirement: anticipation",
      binary_labels(retired_ref, wrong = FALSE)
    )
    retirement_future <- c(
      missing_map(retifut_ref, wrong = FALSE),
      "not mentioned" = 0,
      "mentioned" = 1
    )
    retirement_future_labels <- c(
      "Fut. retirement: now less working hours",
      "Fut. retirement: now more hobbies",
      "Fut. retirement: now volunteering work",
      "Fut. retirement: now administrative work",
      "Fut. retirement: now more holidays",
      "Fut. retirement: other specification"
    )
    for (i in seq_along(retirement_future_labels)) {
      add(paste0("retirf", i), retirement_future_labels[[i]], retirement_future)
    }
    if (wave == "G") {
      add(
        "retivol", "(partial) early retirement voluntarily",
        c(
          "na, wrong skip" = -3,
          "na, see G/JOBC" = -2,
          "na, asked" = -1,
          "no, not retired" = 1,
          "yes, retired entirely voluntarily" = 2,
          "yes, retired but not entirely voluntarily" = 3
        )
      )
    }
  } else if (wave == "2B") {
    coded_occupation <- function(ref, extra = numeric(0)) {
      c(
        extra,
        "na, wrong skip" = -3,
        setNames(-2, paste0("na, see ", ref)),
        "na, asked" = -1,
        "- to be coded -" = 0
      )
    }
    derived_occupation <- function(ref, table) {
      c(
        "na, wrong skip" = -3,
        setNames(-2, paste0("na, see ", ref)),
        "unknown" = -1,
        "- to be coded -" = 0,
        table
      )
    }
    no_retirement_reason <- c(
      "enough challenges at work" = 1,
      "maintain social contacts" = 2,
      "other pastime less pleasant" = 3,
      "financially more favourable" = 4,
      "other reason" = 5
    )

    add(
      "job1", "paid job at present",
      c(
        "na, interview terminated" = -5,
        "na, asked" = -1,
        "no" = 1,
        "yes" = 2
      )
    )
    add(
      "cjsbc92", "cur. job: standard classification occupation",
      coded_occupation("BJOB1"), force_numeric = TRUE
    )
    add(
      "cjclass", "cur. job: occupational class SBC92",
      derived_occupation("BCJSBC92", sbc92_labels)
    )
    add(
      "cjlevel", "cur. job: occupational skill-level SBC92",
      derived_occupation("BCJSBC92", skill_level_labels)
    )
    add(
      "cjtype", "cur. job: main type of skills in occupation",
      derived_occupation("BCJSBC92", skill_type_labels)
    )
    add(
      "cjpresi", "cur. job: occup prestige (Sixma & Ultee)",
      derived_occupation(
        "BCJSBC92", c("low prestige" = 13, "high prestige" = 87)
      ),
      force_numeric = TRUE
    )
    add(
      "job6", "current job: hours/week",
      missing_map("BJOB1"), force_numeric = TRUE
    )
    add(
      "jobl1", "paid job before (last)",
      binary_labels("BJOB1")
    )
    add("jobstom", "stopped working: month", month_map("BJOBL1"))
    add(
      "jobstoy", "stopped working: year",
      missing_map("BJOBL1"), force_numeric = TRUE
    )
    add(
      "rlsbc92", "last job: standard classification occupation",
      coded_occupation("BJOB1"), force_numeric = TRUE
    )
    add(
      "rlclass", "last job: occupational class SBC92",
      derived_occupation("BRLSBC92", sbc92_labels)
    )
    add(
      "rllevel", "last job: occupational skill-level SBC92",
      derived_occupation("BRLSBC92", skill_level_labels)
    )
    add(
      "rltype", "last job: main type of skills in occupation",
      derived_occupation("BRLSBC92", skill_type_labels)
    )
    add(
      "rlpresi", "last job: occup. prestige (Sixma & Ultee)",
      derived_occupation(
        "BRLSBC92", c("low prestige" = 13, "high prestige" = 87)
      ),
      force_numeric = TRUE
    )
    add(
      "jobl6", "last job: hours/week",
      missing_map("BJOBL1"), force_numeric = TRUE
    )
    add(
      "employ", "employment office: registered",
      binary_labels("BJOB1", extra = c("na, age >= 65" = -5))
    )
    add(
      "disabl", "disability insurance act",
      binary_labels(
        "BJOB1 & BJOBL1", extra = c("na, age >= 65" = -5)
      )
    )
    add(
      "disablp", "disability insurance act: percentage",
      missing_map("BDISABL", wrong = FALSE), force_numeric = TRUE
    )
    add(
      "retired", "(partial) early retirement",
      retired_labels(
        "BJOB1 & BJOBL1", age_label = "na, age >= 65"
      )
    )
    add(
      "retifut", "future retirement: anticipation",
      binary_labels("BRETIRED")
    )
    add(
      "work65", "cur. job: practise until 65",
      c(missing_map("BRETIRED & BJOB6"), work_until_labels)
    )
    add(
      "retfin", "cur. job: consider retirement (financial possible)",
      binary_labels("BRETIRED & BJOB6")
    )
    add(
      "retyr", "cur. job: reason (partial) early retirement",
      c(missing_map("BRETFIN"), future_reason_labels)
    )
    add(
      "retnfr", "cur. job: reason no full early retirement",
      c(missing_map("BRETFIN"), no_retirement_reason)
    )
    add(
      "nretr", "cur. job: reason no early retirement",
      c(missing_map("BRETFIN"), no_retirement_reason)
    )
    add(
      "retreas", "stopped working: reason (partial) early retirement",
      c(missing_map("BRETIRED"), future_reason_labels)
    )

    add(
      "flsbc92", "father: last job: standard class. occup.",
      c(
        "na, interview terminated" = -5,
        "na, wrong skip" = -3,
        "na, asked" = -1,
        "- to be coded -" = 0
      ),
      force_numeric = TRUE
    )
    add(
      "flclass", "father: last job: occup. class SBC92",
      derived_occupation("BFLSBC92", sbc92_labels)
    )
    add(
      "fllevel", "father: last job: occup. skill-level SBC92",
      derived_occupation("BFLSBC92", skill_level_labels)
    )
    add(
      "fltype", "father: last job: main type of skills",
      derived_occupation("BFLSBC92", skill_type_labels)
    )
    add(
      "flpresi", "father: last job: occup. prestige (Sixma & Ultee)",
      derived_occupation(
        "BFLSBC92", c("low prestige" = 13, "high prestige" = 87)
      ),
      force_numeric = TRUE
    )

    add(
      "pjob1", "partner: paid job at present",
      c(
        "na, interview terminated" = -5,
        "na, no household partner" = -4,
        "na, asked" = -1,
        "no" = 1,
        "yes" = 2
      )
    )
    add(
      "pcsbc92", "partner: cur. job: standard class. occup.",
      coded_occupation("BPJOB1"), force_numeric = TRUE
    )
    add(
      "pcclass", "partner: cur. job: occup. class SBC92",
      derived_occupation("BPCSBC92", sbc92_labels)
    )
    add(
      "pclevel", "partner: cur. job: occup. skill-level SBC92",
      derived_occupation("BPCSBC92", skill_level_labels)
    )
    add(
      "pctype", "partner: cur. job: main type of skills",
      derived_occupation("BPCSBC92", skill_type_labels)
    )
    add(
      "pcpresi", "partner: cur. job: occup. prestige (Sixma & Ultee)",
      derived_occupation(
        "BPCSBC92", c("low prestige" = 13, "high prestige" = 87)
      ),
      force_numeric = TRUE
    )
    add(
      "pjob6", "partner: current job: hours/week",
      missing_map("BPJOB1"), force_numeric = TRUE
    )
    add(
      "pjobl1", "partner: paid job before (last)",
      binary_labels("BPJOB1")
    )
    add("pjobstm", "partner: stopped working: month", month_map("BPJOBL1"))
    add(
      "pjobsty", "partner: stopped working: year",
      missing_map("BPJOBL1"), force_numeric = TRUE
    )
    add(
      "plsbc92", "partner: last job: standard class. occup.",
      coded_occupation("BPJOB1"), force_numeric = TRUE
    )
    add(
      "plclass", "partner: last job: occup. class SBC92",
      derived_occupation("BPLSBC92", sbc92_labels)
    )
    add(
      "pllevel", "partner: last job: occup. skill-level SBC92",
      derived_occupation("BPLSBC92", skill_level_labels)
    )
    add(
      "pltype", "partner: last job: main type of skills",
      derived_occupation("BPLSBC92", skill_type_labels)
    )
    add(
      "plpresi", "partner: last job: occup. prestige (Sixma & Ultee)",
      derived_occupation(
        "BPLSBC92", c("low prestige" = 13, "high prestige" = 87)
      ),
      force_numeric = TRUE
    )
    add(
      "pjobl6", "partner: last job: hours/week",
      missing_map("BPJOBL1"), force_numeric = TRUE
    )
    add(
      "pemploy", "partner: employment office: registered",
      binary_labels("BPJOB1")
    )
    add(
      "pdisabl", "partner: disability insurance act",
      binary_labels("BPJOB1 & BPJOBL1")
    )
    add(
      "pdisabp", "partner: disability insurance act: percentage",
      missing_map("BPDISABL", wrong = FALSE), force_numeric = TRUE
    )
    add(
      "pretire", "partner: (partial) early retirement",
      retired_labels("BPJOB1 & BPJOBL1")
    )
    add(
      "pretifu", "partner: future retirement: anticipation",
      binary_labels("BRETIRE")
    )
  } else if (wave == "H") {
    add("job1", "Paid job at present", paid_job_labels())
    add("jobc", "Paid job, changed (constructed)", changed_job_labels("HJOB1"))
    add("jobstam", "Present job: start working: month", month_map("HJOBC"))
    add(
      "jobstay", "Present job: start working: year",
      missing_map("HJOBC"), force_numeric = TRUE
    )
    add(
      "cjsbc", "current job: standard classification occupation (SBC 2010)",
      missing_map("HJOBC"), force_numeric = TRUE
    )
    add(
      "cjclass", "current job: occupational class SBC 92",
      table_map("HCJSBC", sbc92_labels)
    )
    add(
      "cjlevel", "current job: occupational skill-level SBC 92",
      table_map("HCJSBC", skill_level_labels)
    )
    add(
      "cjtype", "current job: occupational skill-level SBC 92",
      table_map("HCJSBC", skill_type_labels)
    )
    add("job3", "Present job: type", c(missing_map("HJOBC"), job_type_labels))
    add(
      "job3a", "Present job: level work activities",
      c(missing_map("HJOBC"), skill_level_labels)
    )
    add("job4", "present job: management", binary_labels("HJOBC"))
    add(
      "job5", "Present job: management # people",
      management_count_map("HJOB4", include_98 = TRUE), force_numeric = TRUE
    )
    add(
      "job5a", "Present job: management: more than half of the time",
      binary_labels("HJOB4")
    )
    add(
      "job5b", "Present job: management: financial responsibility",
      binary_labels("HJOB4")
    )
    add(
      "job6", "Present job: hours/week",
      missing_map("HJOBC"), force_numeric = TRUE
    )
    add(
      "job7", "Present job: regularity",
      c(missing_map("HJOBC"), job_regularity_labels)
    )
    add("jobstom", "Stopped working: month", month_map("HJOBC"))
    add(
      "jobstoy", "Stopped working: year",
      missing_map("HJOBC"), force_numeric = TRUE
    )
    employment_map <- binary_labels(
      "HJOBC", extra = c("na, age >= 65" = -5)
    )
    add("employ", "Employment office: registered", employment_map)
    add("disabl", "Disability Insurance Act", employment_map)
    add(
      "disablp", "Disability Insurance Act: percentage",
      missing_map("HDISABL", wrong = FALSE), force_numeric = TRUE
    )
    add(
      "retired", "(Partial) early retirement",
      retired_labels("HJOBC", age_label = "na, age >= 65")
    )
    add(
      "retifut", "Future retirement: anticipation",
      binary_labels("HRETIRED", wrong = FALSE)
    )
    retirement_future <- c(
      missing_map("HRETIFUT", wrong = FALSE),
      "not mentioned" = 0,
      "mentioned" = 1
    )
    retirement_future_labels <- c(
      "Future retirement: now less working hours",
      "Future retirement: now more hobbies",
      "Future retirement: now volunteering work",
      "Future retirement: now administrative work",
      "Future retirement: now more holidays",
      "Future retirement: other specification"
    )
    for (i in seq_along(retirement_future_labels)) {
      add(paste0("retirf", i), retirement_future_labels[[i]], retirement_future)
    }
    add(
      "retivol", "(partial) Early retirement voluntarily",
      voluntary_labels("HJOBC", age_label = "na, age >=65")
    )

    add(
      "pjob1", "Partner: paid job at present",
      c(
        "na, short version" = -4,
        "na, wrong skip" = -3,
        "no (household) partner" = -2,
        "na, asked" = -1,
        "no" = 1,
        "yes" = 2
      )
    )
    add(
      "pcjsbc", "Partner: current job: standard classification occupation (SBC 2010)",
      missing_map("HPJOB1"), force_numeric = TRUE
    )
    add(
      "pcjclass", "Partner: current job: occupational class SBC 92",
      table_map("HPCJSBC", sbc92_labels)
    )
    add(
      "pcjlevel", "Partner: current job: occupational skill-level SBC 92",
      table_map("HPCJSBC", skill_level_labels)
    )
    add(
      "pcjtype", "Partner: current job: main type of skills in occupation",
      table_map("HPCJSBC", skill_type_labels)
    )
    add(
      "pjob3a", "Partner: present job: level work activities",
      c(missing_map("HPJOB1"), skill_level_labels)
    )
    add("pjob4", "Partner: present job: management", binary_labels("HPJOB1"))
    add(
      "pjob5", "Partner: present job: management # people",
      management_count_map("HPJOB4"), force_numeric = TRUE
    )
    add(
      "pjob5a", "Partner: present job: management: more than half of the time",
      binary_labels("HPJOB4")
    )
    add(
      "pjob5b", "Partner: present job: management: financial responsibility",
      binary_labels("HPJOB4")
    )
    add(
      "pjob6", "Partner: present job: hours/week",
      missing_map("HPJOB1"), force_numeric = TRUE
    )
  } else if (wave == "3B") {
    add("job1", "Paid job at present", paid_job_labels())
    add(
      "cjsbc", "current job: standard classification occupation (SBC 2010)",
      missing_map("BJOB1"), force_numeric = TRUE
    )
    add(
      "cjclass", "current job: occupational class SBC92",
      table_map("BCJSBC", sbc92_labels)
    )
    add(
      "cjlevel", "current job: occupational skill-level SBC92",
      table_map("BCJSBC", skill_level_labels)
    )
    add(
      "cjtype", "current job: main type of skills in occupation",
      table_map("BCJSBC", skill_type_labels)
    )
    add("jobstam", "present job: start working: month", month_map("BJOB1"))
    add(
      "jobstay", "present job: start working: year",
      missing_map("BJOB1"), force_numeric = TRUE
    )
    add("job3", "present job: type", c(missing_map("BJOB1"), job_type_labels))
    add(
      "job3a", "present job: level work activities",
      c(missing_map("BJOB1"), skill_level_labels)
    )
    add("job4", "present job: management", binary_labels("BJOB1"))
    add(
      "job5", "present job: management: number of people",
      management_count_map("BJOB4"), force_numeric = TRUE
    )
    add(
      "job5a", "present job: management: more than half of the time",
      binary_labels("BJOB4")
    )
    add(
      "job5b", "present job: management: financial responsibility",
      binary_labels("BJOB4")
    )
    add(
      "job6", "present job: hours/week",
      missing_map("BJOB1"), force_numeric = TRUE
    )
    add(
      "job7", "present job: regularity",
      c(missing_map("BJOB1"), job_regularity_labels)
    )
    add("jobl1", "paid job before (last)", binary_labels("BJOB1"))
    add(
      "rlsbc", "last job: standard classification occupation (SBC 2010)",
      missing_map("BJOBL1"), force_numeric = TRUE
    )
    add(
      "rlclass", "last job: occupational class SBC92",
      table_map("BRLSBC", sbc92_labels)
    )
    add(
      "rllevel", "last job: occupational skill-level SBC92",
      table_map("BRLSBC", skill_level_labels)
    )
    add(
      "rltype", "last job: main type of skills in occupation",
      table_map("BRLSBC", skill_type_labels)
    )
    add("jlstam", "last job: start working: month", month_map("BJOBL1"))
    add(
      "jlstay", "last job: start working year",
      missing_map("BJOBL1"), force_numeric = TRUE
    )
    add("jobl3", "last job: type", c(missing_map("BJOBL1"), job_type_labels))
    add(
      "jobl3a", "last job: level work activities",
      c(missing_map("BJOBL1"), skill_level_labels)
    )
    add("jobl4", "last job: management", binary_labels("BJOBL1"))
    add(
      "jobl5", "last job: management: number of people",
      management_count_map("BJOBL4"), force_numeric = TRUE
    )
    add(
      "jobl5a", "last job: management: more than half of the time",
      binary_labels("BJOB4")
    )
    add(
      "jobl5b", "last job: management: financial responsibility",
      binary_labels("BJOB4")
    )
    add(
      "jobl6", "last job: hours/week",
      missing_map("BJOBL1"), force_numeric = TRUE
    )
    add(
      "jobl7", "last job: regularity",
      c(missing_map("BJOBL1"), job_regularity_labels)
    )
    add("jobstom", "last job: stopped working: month", month_map("BJOBL1"))
    add(
      "jobstoy", "last job: stopped working: year",
      missing_map("BJOBL1"), force_numeric = TRUE
    )
    add("employ", "employment office: registered", binary_labels("BJOB1"))
    add(
      "disabl", "disability insurance act",
      binary_labels("BJOB1 & BJOBL1")
    )
    add(
      "disablp", "disability insurance act: percentage",
      missing_map("BDISABL", wrong = FALSE), force_numeric = TRUE
    )
    add(
      "retired", "(partial) early retirement",
      retired_labels("BJOB1 & BJOBL1")
    )

    retirement_reason_missing <- c(
      "na, wrong skip" = -3,
      "see BRETIRED" = -2,
      "na, asked" = -1
    )
    add(
      "retreas", "stopped working: reason (partial) early retirement",
      c(retirement_reason_missing, future_reason_labels)
    )
    add(
      "retyr", "future: reason (partial) early retirement",
      c(retirement_reason_missing, future_reason_labels)
    )
    add(
      "retivol", "(partial) early retirement voluntarily",
      c(
        retirement_reason_missing,
        "no, not retired" = 1,
        "yes, retired entirely voluntarily" = 2,
        "yes, retired but not entirely voluntarily" = 3
      )
    )
    no_retirement_reason <- c(
      "enough challenges at work" = 1,
      "maintain social contacts" = 2,
      "other pastime less pleasant" = 3,
      "no possibility for early retirement" = 4,
      "financially more favourable" = 5,
      "should work on to have adequate pension" = 6,
      "other reason" = 7
    )
    add(
      "nretr", "reason no early retirement",
      c(retirement_reason_missing, no_retirement_reason)
    )
    add(
      "retnfr", "reason no full early retirement",
      c(retirement_reason_missing, no_retirement_reason)
    )
    add(
      "retnfr2", "would be reason no full early retirement",
      c(retirement_reason_missing, no_retirement_reason)
    )
    add(
      "work65", "present job: practise until 65",
      c(missing_map("BJOB1 & BRETIRED"), work_until_labels)
    )

    add(
      "pjdata", "job data partner about current or former partner",
      c("no partner" = 0, "current partner" = 1, "former partner" = 2)
    )
    add(
      "pjob1", "partner: paid job at present",
      binary_labels("BPJDATA", wrong = FALSE)
    )
    add(
      "pcsbc", "partner: current job: standard classification occupation (SBC 2010)",
      missing_map("BPJOB1"), force_numeric = TRUE
    )
    add(
      "pcclass", "partner: current job: occupational class SBC92",
      table_map("BPCSBC", sbc92_labels)
    )
    add(
      "pclevel", "partner: current job: occupational skill-level SBC92",
      table_map("BPCSBC", skill_level_labels)
    )
    add(
      "pctype", "partner: current job: main type of skills in occupation",
      table_map("BPCSBC", skill_type_labels)
    )
    add("pjstam", "partner: present job: start working: month", month_map("BPJOB1"))
    add(
      "pjstay", "partner: present job: start working: year",
      missing_map("BPJOB1"), force_numeric = TRUE
    )
    add(
      "pjob3", "partner: present job: type",
      c(missing_map("BPJOB1"), job_type_labels)
    )
    add(
      "pjob3a", "partner: present job: level work activities",
      c(missing_map("BPJOB1"), skill_level_labels)
    )
    add("pjob4", "partner: present job: management", binary_labels("BPJOB1"))
    add(
      "pjob5", "partner: present job: management: number of people",
      management_count_map("BPJOB4"), force_numeric = TRUE
    )
    add(
      "pjob5a", "partner: present job: management: more than half of the time",
      binary_labels("BPJOB4")
    )
    add(
      "pjob5b", "partner: present job: management: financial responsibility",
      binary_labels("BPJOB4")
    )
    add(
      "pjob6", "partner: present job: hours/week",
      missing_map("BPJOB1"), force_numeric = TRUE
    )
    add(
      "pjob7", "partner: present job: regularity",
      c(missing_map("BPJOB1"), job_regularity_labels)
    )
    add(
      "pjobl1", "partner: paid job before (last)",
      binary_labels("BPJOB1")
    )
    add(
      "plsbc", "partner: last job: standard classification occupation (SBC 2010)",
      missing_map("BPJOBL1"), force_numeric = TRUE
    )
    add(
      "plclass", "partner: last job: occupational class SBC92",
      table_map("BPLSBC", sbc92_labels)
    )
    add(
      "pllevel", "partner: last job: occupational skill-level SBC92",
      table_map("BPLSBC", skill_level_labels)
    )
    add(
      "pltype", "partner: last job: main type of skills in occupation",
      table_map("BPLSBC", skill_type_labels)
    )
    add(
      "pjlstam", "partner: last job: start working: month",
      month_map("BJOBL1")
    )
    add(
      "pjlstay", "partner: last job: start working year",
      missing_map("BJOBL1"), force_numeric = TRUE
    )
    add(
      "pjobl3", "partner: last job: type",
      c(missing_map("BPJOBL1"), job_type_labels)
    )
    add(
      "pjobl3a", "partner: last job: level work activities",
      c(missing_map("BPJOBL1"), skill_level_labels)
    )
    add(
      "pjobl4", "partner: last job: management",
      binary_labels("BPJOBL1")
    )
    add(
      "pjobl5", "partner: last job: management: number of people",
      management_count_map("BPJOBL4"), force_numeric = TRUE
    )
    add(
      "pjobl5a", "partner: last job: management: more than half of the time",
      binary_labels("BPJOBL4")
    )
    add(
      "pjobl5b", "partner: last job: management: financial responsibility",
      binary_labels("BPJOBL4")
    )
    add(
      "pjobl6", "partner: last job: hours/week",
      missing_map("BPJOBL1"), force_numeric = TRUE
    )
    add(
      "pjobl7", "partner: last job: regularity",
      c(missing_map("BPJOBL1"), job_regularity_labels)
    )
    add(
      "pjobstm", "last job: stopped working: month",
      month_map("BPJOBL1")
    )
    add(
      "pjobsty", "partner: last job: stopped working: year",
      missing_map("BPJOBL1"), force_numeric = TRUE
    )
    add(
      "pemploy", "partner: employment office: registered",
      binary_labels("BPJOB1")
    )
    add(
      "pdisabl", "partner: disability insurance act",
      binary_labels("BPJOB1 & BPJOBL1")
    )
    add(
      "pdisabp", "partner: disability insurance act: percentage",
      missing_map("BPDISABL", wrong = FALSE), force_numeric = TRUE
    )
    add(
      "pretire", "partner: (partial) early retirement",
      retired_labels("BPJOB1 & BPJOBL1")
    )
  } else if (wave == "MB") {
    add("job1", "paid job at present", paid_job_labels())
    add("jobstam", "present job: start working: month", month_map("BJOB1"))
    add(
      "jobstay", "present job: start working: year",
      missing_map("BJOB1"), force_numeric = TRUE
    )
    add("job3", "present job: type", c(missing_map("BJOB1"), job_type_labels))
    add(
      "job3a", "present job: level work activities",
      c(missing_map("BJOB1"), skill_level_labels)
    )
    add("job4", "present job: management", binary_labels("BJOB1"))
    add(
      "job5", "present job: management: number of people",
      management_count_map("BJOB4"), force_numeric = TRUE
    )
    add(
      "job5a", "present job: management: more than half of the time",
      binary_labels("BJOB4")
    )
    add(
      "job6", "present job: hours/week",
      missing_map("BJOB1"), force_numeric = TRUE
    )
    add(
      "job7", "present job: regularity",
      c(missing_map("BJOB1"), job_regularity_labels)
    )
    add("jobl1", "paid job before (last)", binary_labels("BJOB1"))
    add("jlstam", "last job: start working: month", month_map("BJOBL1"))
    add(
      "jlstay", "last job: start working year",
      missing_map("BJOBL1"), force_numeric = TRUE
    )
    add("jobl3", "last job: type", c(missing_map("BJOBL1"), job_type_labels))
    add(
      "jobl3a", "last job: level work activities",
      c(missing_map("BJOBL1"), skill_level_labels)
    )
    add("jobl4", "last job: management", binary_labels("BJOBL1"))
    add(
      "jobl5", "last job: management: number of people",
      management_count_map("BJOBL4"), force_numeric = TRUE
    )
    add(
      "jobl5a", "last job: management: more than half of the time",
      binary_labels("BJOBL4")
    )
    add(
      "jobl6", "last job: hours/week",
      missing_map("BJOBL1"), force_numeric = TRUE
    )
    add(
      "jobl7", "last job: regularity",
      c(missing_map("BJOBL1"), job_regularity_labels)
    )
    add("jobstom", "last job: stopped working: month", month_map("BJOBL1"))
    add(
      "jobstoy", "last job: stopped working: year",
      missing_map("BJOBL1"), force_numeric = TRUE
    )
    add("employ", "employment office: registered", binary_labels("BJOB1"))
    add(
      "disabl", "disability insurance act",
      binary_labels("BJOB1/BJOBL1")
    )
    add(
      "disablp", "disability insurance act: percentage",
      c(
        "na, refused" = -3,
        "na, see BDISABL" = -2,
        "na, asked" = -1
      ),
      force_numeric = TRUE
    )
    add(
      "retired", "(partial) early retirement",
      retired_labels("BJOB1/BJOBL1")
    )
    add(
      "retivol", "(partial) early retirement voluntarily",
      c(
        "na, wrong skip" = -3,
        "see BRETIRED" = -2,
        "na, asked" = -1,
        "no, not retired" = 1,
        "yes, retired entirely voluntarily" = 2,
        "yes, retired but not entirely voluntarily" = 3
      )
    )
    add(
      "workret", "present job: practise until retirement age",
      c(missing_map("BJOB1/BRETIRED"), work_until_labels)
    )

    add(
      "pjob1", "partner: paid job at present",
      binary_labels("BPJDATA")
    )
    add("pjstam", "partner: present job: start working: month", month_map("BPJOB1"))
    add(
      "pjstay", "partner: present job: start working: year",
      missing_map("BPJOB1"), force_numeric = TRUE
    )
    add(
      "pjob3", "partner: present job: type",
      c(missing_map("BPJOB1"), job_type_labels)
    )
    add(
      "pjob3a", "partner: present job: level work activities",
      c(missing_map("BPJOB1"), skill_level_labels)
    )
    add("pjob4", "partner: present job: management", binary_labels("BPJOB1"))
    add(
      "pjob5", "partner: present job: management: number of people",
      management_count_map("BPJOB4"), force_numeric = TRUE
    )
    add(
      "pjob5a", "partner: present job: management: more than half of the time",
      binary_labels("BPJOB4")
    )
    add(
      "pjob6", "partner: present job: hours/week",
      missing_map("BPJOB1"), force_numeric = TRUE
    )
    add(
      "pjob7", "partner: present job: regularity",
      c(missing_map("BPJOB1"), job_regularity_labels)
    )
    add(
      "pjobl1", "partner: paid job before (last)",
      binary_labels("BPJOB1")
    )
    add(
      "pjobl3", "partner: last job: type",
      c(missing_map("BPJOBL1"), job_type_labels)
    )
    add(
      "pjobl3a", "partner: last job: level work activities",
      c(missing_map("BPJOBL1"), skill_level_labels)
    )
    add("pjobl4", "partner: last job: management", binary_labels("BPJOBL1"))
    add(
      "pjobl5", "partner: last job: management: number of people",
      management_count_map("BPJOBL4"), force_numeric = TRUE
    )
    add(
      "pjobl5a", "partner: last job: management: more than half of the time",
      binary_labels("BPJOBL4")
    )
    add(
      "pjobl6", "partner: last job: hours/week",
      missing_map("BPJOBL1"), force_numeric = TRUE
    )
    add(
      "pjobl7", "partner: last job: regularity",
      c(missing_map("BPJOBL1"), job_regularity_labels)
    )
    add(
      "pjobstm", "last job: stopped working: month",
      month_map("BPJOBL1")
    )
    add(
      "pjobsty", "partner: last job: stopped working: year",
      missing_map("BPJOBL1"), force_numeric = TRUE
    )
    add(
      "pemploy", "partner: employment office: registered",
      binary_labels("BPJOB1")
    )
    add(
      "pdisabl", "partner: disability insurance act",
      binary_labels("BPJOB1/BPJOBL1")
    )
    add(
      "pdisabp", "partner: disability insurance act: percentage",
      c(
        "na, refused" = -3,
        "na, see BPDISABL" = -2,
        "na, asked" = -1
      ),
      force_numeric = TRUE
    )
  } else if (wave == "I") {
    add("job1", "paid job at present", paid_job_labels())
    add("jobc", "paid job, changed", changed_job_labels("IJOB1"))
    add(
      "jobs", "present job: same job as in last interview",
      same_job_labels("IJOB1", "IJOBC")
    )
    add("jobstam", "present job: start working: month", month_map("IJOBC/S"))
    add(
      "jobstay", "present job: start working: year",
      missing_map("IJOBC/S"), force_numeric = TRUE
    )
    add(
      "cjsbc", "current job: standard classification occupation (SBC 2010)",
      missing_map("IJOBC/S"), force_numeric = TRUE
    )
    add(
      "cjclass", "current job: occupational class SBC92",
      table_map("ICJSBC", sbc92_labels)
    )
    add(
      "cjlevel", "current job: occupational skill-level SBC92",
      table_map("ICJSBC", skill_level_labels)
    )
    add(
      "cjtype", "current job: main type of skills in occupation",
      table_map("ICJSBC", skill_type_labels)
    )
    add("job3", "present job: type", c(missing_map("IJOBC/S"), job_type_labels))
    add(
      "job3a", "present job: level work activities",
      c(missing_map("IJOBC/S"), skill_level_labels)
    )
    add("job4", "present job: management", binary_labels("IJOBC/S"))
    add(
      "job5", "present job: management: number of people",
      management_count_map("IJOB4", include_98 = TRUE), force_numeric = TRUE
    )
    add(
      "job5a", "present job: management: more than half of the time",
      binary_labels("IJOB4")
    )
    add(
      "job5b", "present job: management: financial responsibility",
      binary_labels("IJOB4")
    )
    add(
      "job6", "present job: hours/week",
      missing_map("IJOBC/S"), force_numeric = TRUE
    )
    add(
      "job7", "present job: regularity",
      c(missing_map("IJOBC/S"), job_regularity_labels)
    )
    add("jobstom", "stopped working: month", month_map("IJOBC"))
    add(
      "jobstoy", "stopped working: year",
      missing_map("IJOBC"), force_numeric = TRUE
    )
    employment_map <- binary_labels(
      "IJOBC", extra = c("na, age >= 66" = -5)
    )
    add("employ", "employment office: registered", employment_map)
    add("disabl", "disability insurance act", employment_map)
    add(
      "disablp", "disability insurance act: percentage",
      missing_map("IDISABL", wrong = FALSE), force_numeric = TRUE
    )
    add(
      "retired", "(partial) early retirement",
      retired_labels("IJOBC", age_label = "na, age >= 66")
    )
    add(
      "retivol", "(partial) early retirement voluntarily",
      voluntary_labels("IJOBC", age_label = "na, age >=66")
    )
    add(
      "workret", "present job: practise until retirement age (66y)",
      c(
        missing_map("IJOB1/IRETIRED"),
        "no, I do not think so" = 1,
        "I am not sure about this" = 2,
        "yes, I do think so" = 3
      )
    )

    add(
      "pjob1", "partner: paid job at present",
      c(
        "na, short version" = -4,
        "na, wrong skip" = -3,
        "no (household) partner" = -2,
        "na, asked" = -1,
        "no" = 1,
        "yes" = 2
      )
    )
    add("pjobc", "partner: paid job, changed", changed_job_labels("IPJOB1"))
    add(
      "pjobs", "partner: present job: same job as in last interview",
      same_job_labels("IPJOB1", "IPJOBC")
    )
    add(
      "pjstam", "partner: present job: start working: month",
      month_map("IPJOBC/S")
    )
    add(
      "pjstay", "partner: present job: start working: year",
      missing_map("IPJOBC/S"), force_numeric = TRUE
    )
    add(
      "pcjsbc", "partner: current job: standard classification occupation (SBC 2010)",
      missing_map("IPJOBC"), force_numeric = TRUE
    )
    add(
      "pcjclass", "partner: current job: occupational class SBC 92",
      table_map("IPCJSBC", sbc92_labels)
    )
    add(
      "pcjlevel", "partner: current job: occupational skill-level SBC 92",
      table_map("IPCJSBC", skill_level_labels)
    )
    add(
      "pcjtype", "partner: current job: main type of skills in occupation",
      table_map("IPCJSBC", skill_type_labels)
    )
    add(
      "pjob3", "partner: present job: type",
      c(missing_map("IPJOBC/S"), job_type_labels)
    )
    add(
      "pjob3a", "partner: present job: level work activities",
      c(missing_map("IPJOBC/S"), skill_level_labels)
    )
    add("pjob4", "partner: present job: management", binary_labels("IPJOBC/S"))
    add(
      "pjob5", "partner: present job: management: number of people",
      management_count_map("IPJOB4"), force_numeric = TRUE
    )
    add(
      "pjob5a", "partner: present job: management: more than half of the time",
      binary_labels("IPJOB4")
    )
    add(
      "pjob5b", "partner: present job: management: financial responsibility",
      binary_labels("IPJOB4")
    )
    add(
      "pjob6", "partner: present job: hours/week",
      missing_map("IPJOB1"), force_numeric = TRUE
    )
    add(
      "pjob7", "partner: present job: regularity",
      c(missing_map("IPJOB1"), job_regularity_labels)
    )
  } else if (wave %in% c("J", "K")) {
    p <- wave
    job1_ref <- paste0(p, "JOB1")
    jobc_ref <- paste0(p, "JOBC")
    jobs_ref <- paste0(p, "JOBS")
    jobcs_ref <- paste0(p, "JOBC/S")
    job4_ref <- paste0(p, "JOB4")
    cjsbc_ref <- paste0(p, "CJSBC")
    retired_ref <- paste0(p, "RETIRED")

    add("job1", "paid job at present", paid_job_labels())
    add("jobc", "paid job, changed", changed_job_labels(job1_ref))
    add(
      "jobs", "present job: same job as in last interview",
      same_job_labels(job1_ref, jobc_ref)
    )
    add(
      "wjobchange", "who initiated the change in job/tasks",
      c(
        setNames(-2, paste0("na, see ", jobs_ref)),
        "na, asked" = -1,
        "me" = 1,
        "my employer" = 2,
        "I switched employers" = 3
      )
    )

    change_reason_labels <- c(
      "reason change job/tasks: better working hours",
      "reason change job/tasks: better salary",
      "reason change job/tasks: better employment conditions",
      "reason change job/tasks: professional development/growth",
      "reason change job/tasks: work related accident",
      "reason change job/tasks: other health reasons",
      "reason change job/tasks: better combination work and family tasks",
      "reason change job/tasks: avoiding unemployment",
      "reason change job/tasks: different occupation after retirement",
      "reason change job/tasks: other reason",
      "reason change job/tasks: other work related factors",
      "reason change job/tasks: on request",
      "reason change job/tasks: preparing for retirement"
    )
    change_reason_map <- c(
      setNames(-2, paste0("na, see ", jobs_ref)),
      "not mentioned" = 0,
      "mentioned" = 1
    )
    for (i in seq_along(change_reason_labels)) {
      add(
        sprintf("rjobchange%02d", i),
        change_reason_labels[[i]],
        change_reason_map
      )
    }

    add("jobstam", "present job: start working: month", month_map(jobcs_ref))
    add(
      "jobstay", "present job: start working: year",
      missing_map(jobcs_ref), force_numeric = TRUE
    )
    start_reason_labels <- c(
      "reason start new job: I need the income",
      "reason start new job: I enjoy this job",
      "reason start new job: I value contact with other people",
      "reason start new job: I want something to do",
      "reason start new job: other reason",
      "reason start new job: to stay active",
      "reason start new job: on request",
      "reason start new job: family related factors",
      "reason start new job: other work related factors"
    )
    start_reason_map <- c(
      setNames(-2, paste0("na, see ", jobs_ref)),
      "not mentioned" = 0,
      "mentioned" = 1
    )
    for (i in seq_along(start_reason_labels)) {
      add(sprintf("jobstar%02d", i), start_reason_labels[[i]], start_reason_map)
    }

    add(
      "cjsbc", "current job: standard classification occupation (SBC 2010)",
      missing_map(jobcs_ref), force_numeric = TRUE
    )
    if (wave == "J") {
      add(
        "cjclass", "current job: occupational class SBC92",
        table_map(cjsbc_ref, sbc92_labels)
      )
      add(
        "cjlevel", "current job: occupational skill-level SBC92",
        table_map(cjsbc_ref, skill_level_labels)
      )
      add(
        "cjtype", "current job: main type of skills in occupation (SBC 92)",
        table_map(cjsbc_ref, skill_type_labels)
      )
    }
    add("job3", "present job: type", c(missing_map(jobcs_ref), job_type_labels))
    add(
      "job3a", "present job: level work activities",
      c(missing_map(jobcs_ref), skill_level_labels)
    )
    add("job4", "present job: management", binary_labels(jobcs_ref))
    add(
      "job5", "present job: management: number of people",
      management_count_map(job4_ref, include_98 = TRUE), force_numeric = TRUE
    )
    add(
      "job5a", "present job: management: more than half of the time",
      binary_labels(job4_ref)
    )
    add(
      "job5b", "present job: management: financial responsibility",
      binary_labels(job4_ref)
    )
    add(
      "job6c", "present job: hours/week on contract",
      missing_map(jobcs_ref), force_numeric = TRUE
    )
    add(
      "job6r", "present job: hours/week in reality",
      missing_map(jobcs_ref), force_numeric = TRUE
    )
    add(
      "job7", "present job: regularity",
      c(missing_map(jobcs_ref), job_regularity_labels)
    )

    tasks_map <- c(
      "na, wrong skip" = -3,
      setNames(-2, paste0("na, see ", jobcs_ref)),
      "na, asked" = -1,
      "mainly mentally demanding tasks" = -1,
      "mainly physically demanding tasks" = -2,
      "both mentally and physically demanding tasks" = 3
    )
    add("tasks", "present job: kind of tasks", tasks_map)
    ability_map <- c(
      missing_map(jobcs_ref),
      "very good" = 1,
      "good" = 2,
      "moderate" = 3,
      "bad" = 4,
      "very bad" = 5
    )
    add("pability", "present job: ability to meet physical demands", ability_map)
    add(
      "mability",
      if (wave == "J") {
        "present job: ability to meet mental/pshychological demands"
      } else {
        "present job: ability to meet mental/psychological demands"
      },
      ability_map
    )
    add(
      "healthp", "present job: productivity influenced by health problem(s) past 7 days",
      c(
        missing_map(jobcs_ref),
        "no health problems/productivity not influenced by health problems" = 0,
        "not productive due to health problems" = 10
      ),
      force_numeric = TRUE
    )
    add(
      "abstot", "absence: total number of times in past 12 months",
      missing_map(jobcs_ref), force_numeric = TRUE
    )
    add(
      "abswd", "absence: on working days in past 12 months",
      missing_map(jobcs_ref), force_numeric = TRUE
    )
    add("jobstom", "stopped working: month", month_map(jobc_ref))
    add(
      "jobstoy", "stopped working: year",
      missing_map(jobc_ref), force_numeric = TRUE
    )
    employment_map <- binary_labels(
      jobc_ref, extra = c("na, age >= 67" = -5)
    )
    add("employ", "employment office: registered", employment_map)
    add("disabl", "disability insurance act", employment_map)
    add(
      "disablp", "disability insurance act: percentage",
      c(
        "refused" = -3,
        setNames(-2, paste0("na, see ", p, "DISABL")),
        "na, asked" = -1
      ),
      force_numeric = TRUE
    )
    add(
      "workret", "present job: practice until retirement age (67y)",
      c(
        missing_map(paste0(job1_ref, "/", retired_ref)),
        "no, I do not think so" = 1,
        "I am not sure about this" = 2,
        "yes, I do think so" = 3
      )
    )
    add(
      "retired", "(partial) retirement",
      c(
        "na, age >= 71" = -5,
        "na, wrong skip" = -3,
        setNames(-2, paste0("na, see ", jobc_ref)),
        "na, not applicable" = -1,
        "no" = 1,
        "yes, partly" = 2,
        "yes, completely" = 3
      )
    )
    partial_voluntary <- c(
      "na, age >=67" = -5,
      "na, wrong skip" = -3,
      setNames(-2, paste0("na, see ", jobc_ref)),
      "na, asked" = -1,
      "yes" = 1,
      "no, not (entirely) voluntarily" = 2
    )
    add("pretivol", "partial retirement voluntarily", partial_voluntary)
    add("retivol", "retirement voluntarily", partial_voluntary)
    add(
      "prefret", "preference for partial or full retirement",
      c(
        "na, age >= 71" = -5,
        "na, wrong skip" = -3,
        setNames(-2, paste0("na, see ", jobc_ref)),
        "na, asked" = -1,
        "partial retirement first" = 1,
        "full retirement right away" = 2,
        "dont know yet" = 3
      )
    )
    retirement_age_map <- missing_map(retired_ref)
    add(
      "retage", "preferred retirement age",
      retirement_age_map, force_numeric = TRUE
    )
    add(
      "pretage", "preferred age at partial retirement",
      retirement_age_map, force_numeric = TRUE
    )
    add(
      "fretage", "preferred age at full retirement",
      retirement_age_map, force_numeric = TRUE
    )
    financial_retirement <- binary_labels(retired_ref)
    add(
      "peretfin", "partial early retirement if made financially possible",
      financial_retirement
    )
    add(
      "eretfin", "early retirement if made financially possible",
      financial_retirement
    )

    if (wave == "J") {
      add(
        "retyr", "future: reason (partial) early retirement",
        c(
          missing_map("JRETIRED"),
          "stress and pressure of work too high" = 1,
          "other work related factors (organisational changes/conflicts)" = 2,
          "physically too demanding" = 3,
          "health complaints too limiting" = 4,
          "afraid of deterioration of health" = 5,
          "not motivated anymore/lost interest" = 6,
          "more enjoyable to spend more time on private life" = 7,
          "enjoy life as long as health permits" = 8,
          "not possible anymore in the future" = 9,
          "other reason" = 10,
          "more freedom, less obligations" = 11,
          "family related factors" = 12,
          "partner is retired/is going to retire" = 13,
          "commute is burdensome" = 14
        )
      )
      add(
        "nretr", "future: reason no early (full) retirement",
        c(
          missing_map("JRETIRED"),
          "enough challenges at work" = 1,
          "maintain social contacts at work" = 2,
          "other pastimes less pleasant than work" = 3,
          "financially more favourable" = 4,
          "continue working after retirement age in same job" = 5,
          "continue working after retirement age in new job" = 6,
          "other reason" = 7,
          "partner is still working" = 8,
          "loyalty towards employer/colleagues" = 9
        )
      )
      stopped_reason_map <- c(
        missing_map("JRETIRED"),
        "stress and pressure of work too high" = 1,
        "other work related factors (organisational changes/conflicts)" = 2,
        "physically too heavy" = 3,
        "health complaints too hampering" = 4,
        "afraid of deterioration of health" = 5,
        "not motivated anymore/lost interest" = 6,
        "more enjoyable to spend more time on private life" = 7,
        "enjoy life as long as health permits" = 8,
        "not possible anymore in the future" = 9,
        "other reason" = 10,
        "reached official retirement age" = 11,
        "financial benefit" = 12,
        "more time needed for activities outside work" = 13
      )
      add(
        "pretreas", "stopped working: reason partial early retirement",
        stopped_reason_map
      )
      add(
        "retreas", "stopped working: reason early retirement",
        stopped_reason_map
      )
    } else {
      checklist_map <- c(
        missing_map("KRETIRED"),
        "not mentioned" = 0,
        "mentioned" = 1
      )
      retyr_labels <- c(
        "future: reason (partial) early retirement: stress/work pressure too high",
        "future: reason (partial) early retirement: physically too heavy",
        "future: reason (partial) early retirement: health problems too hindering",
        "future: reason (partial) early retirement: no longer motivated",
        "future: reason (partial) early retirement: more fun spend time private life",
        "future: reason (partial) early retirement: future no longer possible",
        "future: reason (partial) early retirement: more freedom/less obligations",
        "future: reason (partial) early retirement: family circumstances",
        "future: reason (partial) early retirement: partner is/will retiring",
        "future: reason (partial) early retirement: traveling to/from work difficult"
      )
      nretr_labels <- c(
        "reason no early (full) retirement: sufficient challenges/fun in work",
        "reason no early (full) retirement: maintain social contacts at work",
        "reason no early (full) retirement: other pasttimes less pleasant than work",
        "reason no early (full) retirement: work till retirement age (67y) financially favorable",
        "reason no early (full) retirement: partner works as well",
        "reason no early (full) retirement: loyalty towards employer/colleague"
      )
      pretreas_labels <- c(
        "stopped working: reason partial early retirement: reached AOW age (67y)",
        "stopped working: reason partial early retirement: stress/work pressure too high",
        "stopped working: reason partial early retirement: physically too heavy",
        "stopped working: reason partial early retirement: health problems too hindering",
        "stopped working: reason partial early retirement: no longer motivated",
        "stopped working: reason partial ealry retirement: more fun spend time private life",
        "stopped working: reason partial early retirement: provide informal care",
        "stopped working: reason partial early retirement: partner had retired",
        "stopped working: reason partial early retirement: financially no longer necessary",
        "stopped working: reason partial early retirement: future no longer possible",
        "stopped working: reason partial early retirement: reached retirement age",
        "stopped working: reason partial early retirement: financially favorable",
        "stopped working: reason partial early retirement: more time for activities outside of work"
      )
      retreas_labels <- sub(
        "reason partial early", "reason early", pretreas_labels, fixed = TRUE
      )
      retreas_labels[[1L]] <-
        "stopped working: reason early retirement: reached AOW age (67y)"
      retreas_labels[[6L]] <-
        "stopped working: reason early retirement: more fun spend time private life"

      for (i in seq_along(retyr_labels)) {
        add(sprintf("retyr%02d", i), retyr_labels[[i]], checklist_map)
      }
      for (i in seq_along(nretr_labels)) {
        add(sprintf("nretr%02d", i), nretr_labels[[i]], checklist_map)
      }
      for (i in seq_along(pretreas_labels)) {
        add(sprintf("pretreas%02d", i), pretreas_labels[[i]], checklist_map)
      }
      for (i in seq_along(retreas_labels)) {
        add(sprintf("retreas%02d", i), retreas_labels[[i]], checklist_map)
      }
    }

    pjob1_ref <- paste0(p, "PJOB1")
    pjobc_ref <- paste0(p, "PJOBC")
    pjobcs_ref <- paste0(p, "PJOBC/S")
    pjob4_ref <- paste0(p, "PJOB4")
    pcjsbc_ref <- paste0(p, "PCJSBC")
    add(
      "pjob1", "partner: paid job at present",
      c(
        "na, short version" = -4,
        "na, wrong skip" = -3,
        "no (household) partner" = -2,
        "na, asked" = -1,
        "no" = 1,
        "yes" = 2
      )
    )
    add("pjobc", "partner: paid job, changed", changed_job_labels(pjob1_ref))
    add(
      "pjobs", "partner: present job: same job as in last interview",
      same_job_labels(pjob1_ref, pjobc_ref, wrong = TRUE)
    )
    add(
      "pjstam", "partner: present job: start working: month",
      month_map(pjobcs_ref)
    )
    add(
      "pjstay", "partner: present job: start working: year",
      missing_map(pjobcs_ref), force_numeric = TRUE
    )
    add(
      "pcjsbc", "partner: current job: standard classification occupation (SBC 2010)",
      missing_map(pjobc_ref), force_numeric = TRUE
    )
    if (wave == "J") {
      add(
        "pcjclass", "partner: current job: occupational class (SBC 92)",
        table_map(pcjsbc_ref, sbc92_labels)
      )
      add(
        "pcjlevel", "partner: current job: occupational skill-level (SBC 92)",
        table_map(pcjsbc_ref, skill_level_labels)
      )
      add(
        "pcjtype", "partner: current job: main type of skills in occupation (SBC 92)",
        table_map(pcjsbc_ref, skill_type_labels)
      )
    }
    add(
      "pjob3", "partner: present job: type",
      c(missing_map(pjobcs_ref), job_type_labels)
    )
    add(
      "pjob3a", "partner: present job: level work activities",
      c(missing_map(pjobcs_ref), skill_level_labels)
    )
    add("pjob4", "partner: present job: management", binary_labels(pjobcs_ref))
    add(
      "pjob5", "partner: present job: management: number of people",
      management_count_map(pjob4_ref), force_numeric = TRUE
    )
    add(
      "pjob5a", "partner: present job: management: more than half of the time",
      binary_labels(pjob4_ref)
    )
    add(
      "pjob5b", "partner: present job: management: financial responsibility",
      binary_labels(pjob4_ref)
    )
    add(
      "pjob6c", "partner: present job: hours/week on contract",
      missing_map(pjob1_ref), force_numeric = TRUE
    )
    add(
      "pjob6r", "partner: present job: hours/week in reality",
      missing_map(pjob1_ref), force_numeric = TRUE
    )
    add(
      "pjob7", "partner: present job: regularity",
      c(missing_map(pjob1_ref), job_regularity_labels)
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
