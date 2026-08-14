# Apply LASA 158 (peak flow test) SPSS labels
#
# Source: LASA158_varinfo.pdf (05-Apr-2024)

#' Apply LASA158 (Peak flow test) SPSS labels
#'
#' Applies the variable labels, response labels, and wave-specific
#' missing-value codes documented for the LASA158 peak-flow test. LASA158 is
#' available in waves B, C, D, E, G, and H. The trial, completion, reason,
#' understanding, cooperation, position, and maximum-score inventories differ
#' across the B, C, and later-wave forms.
#'
#' Matching tries `name_corrections`, an exact match, then a case-insensitive
#' exact match. `to_factor` converts categorical variables to factors and
#' retains observed undocumented values. `to_numeric` restores trial and
#' score variables to plain numeric and replaces documented negative missing
#' codes with `NA`. Original values and labels are preserved as attributes.
#'
#' @param data A data frame or tibble imported from a LASA158 `.sav` file.
#' @param wave Character scalar: `"B"`, `"C"`, `"D"`, `"E"`, `"G"`, or
#'   `"H"`; matching is case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes to actual column names.
#' @param to_factor Logical. Convert labelled categorical variables to factors.
#' @param to_numeric Logical. Convert eligible peak-flow trials and scores to
#'   plain numeric and replace negative missing codes with `NA`.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA158 metadata, optional reshaping, the `LASA_wave`
#'   attribute, and a `label_report` audit.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(bmpeakf1 = c(-2, 250), bmpeakfp = c(-1, 1))
#' apply_lasa158_labels(dat, wave = "B")
apply_lasa158_labels <- function(data,
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
  supported_waves <- c("B", "C", "D", "E", "G", "H")
  if (!wave %in% supported_waves) {
    stop(
      "Unknown LASA 158 wave: ", wave, ". Use one of: ",
      paste(supported_waves, collapse = ", "), ".",
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
    fn_name = "apply_lasa158_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  if (wave == "B") {
    trial_labels <- c("R refused" = -2, "no valid data" = -1)
    for (i in seq_len(3L)) {
      label_variable(paste0("mpeakf", i), paste0("Peakflow ", i), trial_labels, TRUE)
    }
    label_variable(
      "mpeakfu", "understanding of peakflow test",
      c("no answer, skipped" = -2, "no answer, asked" = -1,
        "excellent" = 1, "good" = 2, "fair" = 3, "bad" = 4,
        "refused" = 5),
      FALSE
    )
    label_variable(
      "mpeakfc", "participation in peakflow test",
      c("no answer, skipped" = -2, "no answer, asked" = -1,
        "excellent" = 1, "good" = 2, "fair" = 3, "bad" = 4,
        "refused" = 5, "other reason" = 6),
      FALSE
    )
    label_variable(
      "mpeakfp", "position of peakflow test",
      c("no answer, asked" = -1, "standing" = 1, "sitting" = 2,
        "lying down" = 3, "other" = 4),
      FALSE
    )
    label_variable(
      "mpeamax", "peakflow: maximum score 3 trials",
      c("R refused" = -2, "no valid data" = -1),
      TRUE
    )
  } else if (wave == "C") {
    label_variable(
      "mpeakfl", "Peakflow done: constructed",
      c("na, interview terminated" = -1, "done" = 1, "not done" = 2,
        "terminated" = 3, "not able (physical)" = 4),
      FALSE
    )
    label_variable(
      "mrmpf", "reason peakflow not done",
      c("valid data" = -2, "refused" = 4, "not able (cognitive)" = 5,
        "not able (physical)" = 6, "technical problem" = 7, "unknown" = 8),
      FALSE
    )
    trial_labels <- c(
      "na, wrong skip" = -3,
      "na, see CMPEAKFL" = -2,
      "na, asked" = -1
    )
    for (i in seq_len(3L)) {
      label_variable(paste0("mpeakf", i), paste0("Peakflow ", i), trial_labels, TRUE)
    }
    test_quality <- c(
      trial_labels,
      "excellent" = 1, "good" = 2, "fair" = 3, "bad" = 4,
      "refused" = 5, "other: not done" = 10,
      "other : not able to: physical" = 20,
      "other: not able to: cognitive" = 30,
      "other: not done: technical" = 40
    )
    label_variable("mpeakfu", "Understanding of peakflow test", test_quality, FALSE)
    label_variable("mpeakfc", "Participation with peakflow test", test_quality, FALSE)
    label_variable(
      "mpeakfp", "position of peakflow test",
      c(trial_labels, "standing" = 1, "sitting" = 2, "lying down" = 3,
        "other: not done" = 10, "other : not able to: physical" = 20,
        "other: not able to: cognitive" = 30,
        "other: not done: technical" = 40),
      FALSE
    )
    label_variable(
      "mpeamax", "peakflow: maximum score three trials",
      c("na, see CMPEAKFL" = -2),
      TRUE
    )
  } else {
    trial_labels <- if (wave == "D") {
      c("R. refused" = -2, "no valid measurement" = -1)
    } else {
      c("test not done" = -2, "no valid measurement" = -1)
    }
    for (i in seq_len(3L)) {
      label_variable(paste0("mpeakf", i), paste0("Peakflow ", i), trial_labels, TRUE)
    }
    if (wave %in% c("E", "G", "H")) {
      label_variable(
        "mpeakfm", "Peakflow: maximum score three trials",
        c("no valid measurement" = -1, "attempted score < 60" = 30),
        TRUE
      )
    }
    quality_labels <- c(
      "no valid measurement" = -2, "na, asked" = -1,
      "excellent" = 1, "good" = 2, "fair" = 3, "bad" = 4,
      "refused" = 5, "other" = 6
    )
    label_variable("mpeakfu", "Peakflow: understanding of test", quality_labels, FALSE)
    # The PDF literally documents d/e/g/hpeakfc (without the medical `m`).
    label_variable("peakfc", "Peakflow: cooperation with test", quality_labels, FALSE)
    position_labels <- c(
      if (wave == "H") c("no valid measurement" = -2) else numeric(0),
      "na, asked" = -1, "standing" = 1, "sitting" = 2, "lying" = 3
    )
    label_variable("mpeakfp", "Peakflow: position during test", position_labels, FALSE)
  }

  engine$finalize()
}
