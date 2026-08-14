# Apply LASA 038 (religious beliefs and philosophy) SPSS labels
#
# Source: LASA038_varinfo.pdf (25-Aug-2023)

#' Apply LASA038 (Religious beliefs and philosophy) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the religious-belief variables documented in
#' LASA038. The function covers waves C, D, E, 2B, F, G, H, 3B, MB, I, J,
#' and K. LASA038 does not document wave A or B files.
#'
#' The wave schemas are not interchangeable. Wave C contains the original
#' belief, salience, and cosmic-transcendence item sets. Waves D, E, and 2B
#' add church attendance and prayer frequency, with church denomination
#' documented only at D. Later waves retain smaller subsets. Wave 3B has its
#' own interview-termination code, and wave MB uses a distinct church-
#' membership classification and an eight-category attendance scale. These
#' differences are preserved exactly as documented.
#'
#' This function labels only variables stored in the LASA038 files. The
#' longitudinal church-affiliation variables documented separately in
#' `LASAz038_varinfo.pdf` and the constructed scales in LASA238 are outside
#' its scope.
#'
#' All LASA038 variables are categorical. Consequently, `to_numeric` is
#' accepted for consistency with the shared apply-labels interface but does
#' not convert them. With `to_factor = TRUE`, matched variables become
#' factors and observed unlabelled codes remain numeric-text levels.
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
#' @param data A data frame or tibble imported from a LASA038 `.sav` file,
#'   for example via [haven::read_sav()]. Depending on `wave`, names include
#'   `crelig01`, `drelig1a`, `brelig08`, and `krelig8a`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`, `"G"`,
#'   `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA038 suffixes without the wave
#'   prefix (for example `relig01`, `relig1a`, `relig8a`, or `rmgl`), and
#'   values are actual column names in `data`.
#' @param to_factor Logical. If `FALSE` (default), variables remain numeric
#'   with SPSS-style value-label attributes. If `TRUE`, they are converted to
#'   factors using the documented labels. An observed value without a label
#'   remains a numeric-text factor level.
#' @param to_numeric Logical. Accepted for interface consistency. LASA038 has
#'   no numeric variables eligible for conversion, so this argument does not
#'   alter matched columns.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA038 columns are renamed to their canonical lowercase
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
#'   matched LASA038 column, optional factor conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa036_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   frelig1b = c(-2, 1, 6),
#'   frelig08 = c(-1, 1, 2),
#'   frelig8a = c(-1, 4, 8)
#' )
#' dat <- apply_lasa038_labels(dat, wave = "F")
#' attr(dat$frelig1b, "labels")
apply_lasa038_labels <- function(data,
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
    C = "c", D = "d", E = "e", `2B` = "b", F = "f", G = "g",
    H = "h", `3B` = "b", MB = "b", I = "i", J = "j", K = "k"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 038 wave: ", wave,
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
    fn_name = "apply_lasa038_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_labels <- function(labels, values) {
    stats::setNames(as.numeric(values), labels)
  }
  routed <- function(reference, labels, values) {
    c(
      value_labels(paste0("na, see ", toupper(paste0(prefix, reference))), -2),
      value_labels("na, asked", -1),
      value_labels(labels, values)
    )
  }
  asked <- function(labels, values) {
    c(value_labels("na, asked", -1), value_labels(labels, values))
  }

  belief_labels <- c(
    "Member of a church or a particular ideological group?",
    "Life after death",
    "Heaven",
    "Hell",
    "Devil",
    "Adam and Eve",
    "Bible as God",
    "Praying: meaningful"
  )
  salience_labels <- c(
    "Influences my daily life",
    "Role in important decisions",
    "Influences my political opinion",
    "Life would look different without",
    "Faith: very interesting"
  )
  transcendence_labels <- c(
    "Border life/death less striking",
    "Unimportance individual life",
    "Mutual connection universe",
    "Close presence persons",
    "Distance past/present disappears",
    "Belonging with earlier/coming generation"
  )
  agreement <- c(
    "strongly agree", "agree", "no agreement/no disagree", "disagree",
    "strongly disagree"
  )
  attendance <- c(
    "never", "once a year or less", "a few times a year",
    "approx. once a month", "2 or 3 times a month",
    "once a week or more"
  )
  prayer_frequency <- c(
    "never", "less than once a month", "once a month",
    "a few times a month", "once a week", "a few times a week",
    "once a day", "more than once a day"
  )

  if (wave == "C") {
    for (i in seq_along(belief_labels)) {
      engine$label_variable(
        sprintf("relig%02d", i), belief_labels[[i]],
        routed("rmgl", c("no", "yes"), 1:2)
      )
    }
    for (i in seq_along(salience_labels)) {
      engine$label_variable(
        sprintf("relig%02d", i + 8L), salience_labels[[i]],
        routed("rmgl", agreement, 1:5)
      )
    }
    for (i in seq_along(transcendence_labels)) {
      engine$label_variable(
        sprintf("relig%02d", i + 13L), transcendence_labels[[i]],
        routed(
          "rmgl", c("not recognizing content", "recognizing content"), 1:2
        )
      )
    }
  }

  if (wave %in% c("D", "E", "2B")) {
    engine$label_variable(
      "relig01", belief_labels[[1L]], routed("rmgl", c("no", "yes"), 1:2)
    )
    if (wave == "D") {
      engine$label_variable(
        "relig1a", "Which church or particular ideological group?",
        routed(
          "relig01",
          c(
            "Dutch Reformed (without Ger. Bond)",
            "Ger. Bond (Dutch Reformed)",
            "Reformed Calvinist",
            "small Reformed denomination",
            "Roman-Catholic",
            "other protestant denomination",
            "Humanistic Society",
            "Jewish",
            "Muslim",
            "Hinduism",
            "other"
          ),
          1:11
        )
      )
    }
    engine$label_variable(
      "relig1b", "Church attendance frequency",
      routed("relig01", attendance, 1:6)
    )
    engine$label_variable(
      "relig08", "Praying: meaningful", routed("rmgl", c("no", "yes"), 1:2)
    )
    engine$label_variable(
      "relig8a", "Praying: frequency", routed("rmgl", prayer_frequency, 1:8)
    )
    for (i in seq_along(salience_labels)) {
      engine$label_variable(
        sprintf("relig%02d", i + 8L), salience_labels[[i]],
        routed("rmgl", agreement, 1:5)
      )
    }
    for (i in seq_along(transcendence_labels)) {
      engine$label_variable(
        sprintf("relig%02d", i + 13L), transcendence_labels[[i]],
        routed(
          "rmgl", c("not recognizing content", "recognizing content"), 1:2
        )
      )
    }
  }

  if (wave == "F") {
    engine$label_variable(
      "relig1b", "Church attendance frequency",
      routed("rmgl", attendance, 1:6)
    )
    engine$label_variable(
      "relig08", "Praying: meaningful", routed("rmgl", c("no", "yes"), 1:2)
    )
    engine$label_variable(
      "relig8a", "Praying: frequency", routed("rmgl", prayer_frequency, 1:8)
    )
    for (i in seq_along(transcendence_labels)) {
      engine$label_variable(
        sprintf("relig%02d", i + 13L), transcendence_labels[[i]],
        routed(
          "rmgl", c("not recognizing content", "recognizing content"), 1:2
        )
      )
    }
  }

  if (wave %in% c("G", "H")) {
    engine$label_variable(
      "relig1b", "Church attendance frequency",
      routed("rmgl", attendance, 1:6)
    )
    engine$label_variable(
      "relig08", "Praying: meaningful", routed("rmgl", c("no", "yes"), 1:2)
    )
    engine$label_variable(
      "relig8a", "Praying: frequency", routed("rmgl", prayer_frequency, 1:8)
    )
  }

  if (wave == "3B") {
    engine$label_variable(
      "relig08", "Praying: meaningful",
      c(
        value_labels("interview terminated", -5),
        asked(c("no", "yes"), 1:2)
      )
    )
    engine$label_variable(
      "relig8a", "Praying: frequency",
      c(
        value_labels("interview terminated", -5),
        asked(prayer_frequency, 1:8)
      )
    )
  }

  if (wave == "MB") {
    engine$label_variable(
      "relig1a", "Member of a church or particular ideological group",
      asked(
        c(
          "no member (not religious)", "Islam", "Roman-Catholic",
          "Protestant", "Jewish", "Orthodox", "Alevism", "Bahai"
        ),
        c(0:4, 7:9)
      )
    )
    engine$label_variable(
      "relig1b", "Church attendance frequency", asked(prayer_frequency, 1:8)
    )
  }

  if (wave %in% c("I", "J", "K")) {
    engine$label_variable(
      "relig1b", "Church attendance frequency", asked(attendance, 1:6)
    )
    engine$label_variable(
      "relig08", "Praying: meaningful", asked(c("no", "yes"), 1:2)
    )
    engine$label_variable(
      "relig8a", "Praying: frequency", asked(prayer_frequency, 1:8)
    )
  }

  if (wave %in% c("C", "D", "E", "2B", "F", "G", "H")) {
    engine$label_variable(
      "rmgl", "Reason missing",
      value_labels(c("valid data", "short interview", "interview terminated"),
                   c(-2, 1, 2))
    )
  }

  engine$finalize()
}
