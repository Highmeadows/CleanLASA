# Apply LASA 103 (singing and making music) SPSS labels
#
# Source: LASA103_varinfo.pdf (15-Jun-2021)

#' Apply LASA103 (Singing and making music) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the singing-and-music variables documented in
#' LASA103 for waves H, I, and J.
#'
#' Waves H and I share a 12-variable self-administered-questionnaire schema:
#' making music, instrument type, singing, frequency and duration, six music
#' genres, and an open specification for another genre. Wave J uses a
#' 29-variable schema covering music or singing lessons for up to six
#' instruments (including voice), current music-making, whether this is done
#' alone or with others, music listening, and concert attendance.
#'
#' Frequencies, durations, ages, years, counts, and variables whose only
#' documented codes are negative missing-reason codes are eligible for
#' `to_numeric`. With `to_numeric = TRUE`, these fields are restored to plain
#' numeric and observed negative values become `NA`. Free-text instrument and
#' genre-specification fields are not converted. With `to_factor = TRUE`,
#' categorical variables become factors and observed unlabelled codes remain
#' numeric-text levels. `to_numeric` takes precedence for eligible fields.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive match, and (3) a
#' case-insensitive exact match. Variables documented for the selected wave
#' but absent from `data` are recorded as `"not found"` in the matching
#' audit.
#'
#' The shared reshaping arguments preserve each matched column's original
#' SPSS coding in `original_labels` and `original_values`. When requested,
#' matched names are standardized by removing the wave prefix, `respnr` is
#' standardized, and a `LASA_wave` column is inserted.
#'
#' @param data A data frame or tibble imported from a LASA103 `.sav` file,
#'   for example via [haven::read_sav()]. Depending on `wave`, names include
#'   `hqmus1`, `iqsmus1`, `jqmussl`, `jqmussl_y1`, and `jqmuslc`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"H"`, `"I"`, or `"J"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   LASA103 suffixes without the wave prefix (for example `qmus1`, `qsmus1`,
#'   `qmussl`, or `qmussl_y1`) to actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, categorical variables with documented
#'   value labels are converted to factors. Observed unlabelled codes remain
#'   numeric-text levels.
#' @param to_numeric Logical. If `TRUE`, documented counts, frequencies,
#'   durations, ages, years, and other numeric fields are restored to plain
#'   numeric and negative values are replaced by `NA`.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column containing the selected wave is
#'   inserted immediately after the respondent-number column.
#'
#' @return `data`, with LASA103 variable/value labels, optional conversion and
#'   standardized naming, preserved original SPSS coding, the `LASA_wave`
#'   provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, hqmus1 = c(1, 2), hqmus4 = c(-2, 5))
#' dat <- apply_lasa103_labels(dat, wave = "H", to_numeric = TRUE)
#' attr(dat$hqmus1, "labels")
apply_lasa103_labels <- function(data,
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
  if (!wave %in% c("H", "I", "J")) {
    stop(
      "Unknown LASA 103 wave: ", wave, ". Use one of: H, I, J.",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = tolower(wave),
    fn_name = "apply_lasa103_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_labels <- function(labels, values) {
    stats::setNames(as.numeric(values), labels)
  }
  yes_no <- value_labels(c("no answer", "no", "yes"), c(-1, 1, 2))

  if (wave %in% c("H", "I")) {
    not_applicable_music <- value_labels(
      c("na, see H/IQMUS1 & H/IQMUS3", "no answer"),
      c(-2, -1)
    )
    music_kind <- c(
      not_applicable_music,
      value_labels(c("not mentioned", "mentioned"), c(0, 1))
    )

    engine$label_variable("qmus1", "make music", yes_no)
    engine$label_variable(
      "qmus2", "type of instrument", value_labels("no answer", -1),
      force_numeric = TRUE
    )
    engine$label_variable("qmus3", "singing as a hobby", yes_no)
    engine$label_variable(
      "qmus4", "number of times per 2 weeks making music or singing",
      not_applicable_music, force_numeric = TRUE
    )
    engine$label_variable(
      "qmus5", "minutes per time", not_applicable_music,
      force_numeric = TRUE
    )

    genre_labels <- c(
      "kind of music: classic", "kind of music: jazz",
      "kind of music: Dutch", "kind of music: pop",
      "kind of music: rock", "kind of music: other"
    )
    for (i in seq_along(genre_labels)) {
      engine$label_variable(paste0("qsmus", i), genre_labels[[i]], music_kind)
    }
    engine$label_variable(
      "qmusk6s", "kind of music: other, specified",
      force_numeric = FALSE
    )
  }

  if (wave == "J") {
    not_applicable_lessons <- value_labels("na, see JQMUSSLN", -2)
    lesson_numeric <- c(
      not_applicable_lessons,
      value_labels("no answer", -1)
    )

    engine$label_variable("qmussl", "music or singing lessons", yes_no)
    engine$label_variable(
      "qmussln", "lessons: number of instruments (including voice)",
      value_labels("na, see JQMUSSL", -2), force_numeric = TRUE
    )
    for (i in 1:6) {
      engine$label_variable(
        paste0("qmussl_i", i), paste0("lessons ", i, ": instrument"),
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("qmussl_y", i), paste0("lessons ", i, ": number of years"),
        lesson_numeric, force_numeric = TRUE
      )
      engine$label_variable(
        paste0("qmussl_a", i), paste0("lessons ", i, ": age at start"),
        lesson_numeric, force_numeric = TRUE
      )
    }

    current_music <- value_labels(c("na asked", "no", "yes"), c(-1, 1, 2))
    engine$label_variable(
      "qmus1", "making music or singing momentarily", current_music
    )
    engine$label_variable(
      "qmus2", "making music or singing: instrument",
      value_labels("no answer", -1), force_numeric = TRUE
    )
    engine$label_variable(
      "qmus4", "making music or singing: number of times per 2 weeks",
      value_labels(c("na, see JQMUS1", "no answer"), c(-2, -1)),
      force_numeric = TRUE
    )
    engine$label_variable(
      "qmus5", "making music or singing: minutes per time",
      value_labels(c("na, see JQMUS4", "no answer"), c(-2, -1)),
      force_numeric = TRUE
    )
    engine$label_variable(
      "qmusat", "making music or singing: alone or together",
      value_labels(
        c(
          "na, see JQMUS1", "no answer", "always alone", "mostly alone",
          "changes, as often alone as together", "mostly together with others",
          "always together with others"
        ),
        c(-2, -1, 1:5)
      )
    )
    engine$label_variable("qmusl", "listening to music", current_music)
    engine$label_variable(
      "qmuslnt", "listening to music: number of times per 2 weeks",
      value_labels(c("na, see JQMUSL", "no answer"), c(-2, -1)),
      force_numeric = TRUE
    )
    engine$label_variable(
      "qmuslm", "listening to music: minutes per time",
      value_labels(c("na, see JQMUSLNT", "no answer"), c(-2, -1)),
      force_numeric = TRUE
    )
    engine$label_variable(
      "qmuslc", "listening to music: number of concerts attending per year",
      value_labels(c("na, see JQMUSL", "no answer"), c(-2, -1)),
      force_numeric = TRUE
    )
  }

  engine$finalize()
}
