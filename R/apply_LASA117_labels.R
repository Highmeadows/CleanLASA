# Apply LASA 117 (sleep habits) SPSS labels
#
# Source: LASA117_varinfo.pdf (25-Jan-2024)

#' Apply LASA117 (Sleep habits) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the sleep-habit variables
#' documented for LASA117. Waves B, C, D, E, 2B, and F contain four items:
#' hours slept and three sleep-problem frequency items. Waves G, H, 3B, I, J,
#' and K additionally contain bedtime hour and minute plus a fifth item on
#' sleep quality.
#'
#' Hours slept and bedtime hour/minute are numeric variables. Their documented
#' missing-value maps vary by wave: bedtime hour and minute have no value map
#' in G; hour has `-1` in H, 3B, I, J, and K; minute has `-1` in H, 3B, I,
#' and J, while the PDF documents no value for K. With `to_numeric = TRUE`,
#' these numeric variables become plain numeric and negative codes become
#' `NA`. Sleep-problem and sleep-quality items are categorical and can be
#' converted with `to_factor = TRUE`.
#'
#' Matching tries `name_corrections`, an exact match, then a case-insensitive
#' exact match. Original labels and values are retained in `original_labels`
#' and `original_values`. The sleeping-problems scale score belongs to
#' LASA317 and is not included here.
#'
#' @param data A data frame or tibble imported from a LASA117 `.sav` file.
#' @param wave Character scalar identifying `"B"`, `"C"`, `"D"`, `"E"`,
#'   `"2B"`, `"F"`, `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector whose names are
#'   canonical suffixes without a wave prefix, such as `qsleep1` or
#'   `qsleeph`, and whose values are actual column names.
#' @param to_factor Logical. Convert matched value-labelled variables to
#'   factors using documented labels.
#' @param to_numeric Logical. Restore documented numeric variables to plain
#'   numeric and replace negative missing-value codes with `NA`.
#' @param standardize_names Logical. Standardize matched names and respondent
#'   number, remove wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes from matched names and
#'   add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA117 metadata, optional conversion and renaming,
#'   original-coding attributes, `LASA_wave`, and a `label_report` audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   GQSLEEP1 = c(-1, 6, 8),
#'   gqsleep2 = c(1, 2, 4)
#' )
#' dat <- apply_lasa117_labels(dat, wave = "G", to_numeric = TRUE)
#' dat$GQSLEEP1
apply_lasa117_labels <- function(data,
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
    G = "g", H = "h", `3B` = "b", I = "i", J = "j", K = "k"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 117 wave: ", wave, ". Use one of: ",
      paste(names(wave_prefix), collapse = ", "), ".",
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
    prefix = unname(wave_prefix[[wave]]),
    fn_name = "apply_lasa117_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  no_answer <- c("no answer" = -1)
  frequency_labels <- c(
    "no answer" = -1,
    "almost never" = 1,
    "some of the time" = 2,
    "often" = 3,
    "most of the time" = 4
  )

  later_waves <- c("G", "H", "3B", "I", "J", "K")
  if (wave %in% later_waves) {
    hour_values <- if (wave == "G") NULL else no_answer
    minute_values <- if (wave %in% c("H", "3B", "I", "J")) no_answer else NULL

    engine$label_variable(
      "qsleeph", "going to sleep: hour of the day", hour_values,
      force_numeric = TRUE
    )
    engine$label_variable(
      "qsleepm", "going to sleep: minute", minute_values,
      force_numeric = TRUE
    )
  }

  engine$label_variable(
    "qsleep1", "Sleep 1: hours sleep in 24 hours", no_answer,
    force_numeric = TRUE
  )
  engine$label_variable(
    "qsleep2", "Sleep 2: falling a sleep", frequency_labels,
    force_numeric = FALSE
  )
  engine$label_variable(
    "qsleep3", "Sleep 3: continue sleeping", frequency_labels,
    force_numeric = FALSE
  )
  engine$label_variable(
    "qsleep4",
    if (wave %in% later_waves) "Sleep 4: awake too early" else "Sleep 4: awake to early",
    frequency_labels,
    force_numeric = FALSE
  )

  if (wave %in% later_waves) {
    engine$label_variable(
      "qsleep5",
      "sleep 5: sleep quality past month",
      c(
        "no answer" = -1,
        "very good" = 1,
        "somewhat good" = 2,
        "somewhat bad" = 3,
        "very bad" = 4
      ),
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
