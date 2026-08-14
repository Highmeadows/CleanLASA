# Apply LASA 221 (MMSE maximum score) SPSS labels
#
# Source: LASA021_varinfo.pdf (08-Jun-2023), LAS(A)*221 sections

#' Apply LASA221 (MMSE maximum score) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the constructed MMSE
#' scores in LASA221. For the regular cohorts, the score uses the maximum of
#' spelling backwards and serial subtraction. The Migrant Baseline file has
#' both the maximum score and an illiterate score based on spelling.
#'
#' LASA221 is documented for waves B, C, D, E, 2B, F, G, H, 3B, MB, I, J,
#' and K. B has a minimum labelled score of 2; C has a minimum of 1; D onward
#' additionally document `-3` for interview termination. MB additionally uses
#' `-5` and `-4` missing codes and contains two scores. All scores are numeric:
#' `to_numeric = TRUE` restores plain numeric values and replaces negative
#' codes with `NA`. Matching and standardized naming follow the shared LASA
#' label-engine conventions, including `respnr`, `LASA_wave`, preserved
#' original coding, and a final `label_report`.
#'
#' @param data A data frame or tibble imported from a LASA221 `.sav` file.
#' @param wave Character scalar identifying B, C, D, E, 2B, F, G, H, 3B, MB,
#'   I, J, or K; matching is case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes (`mmsesc`, or MB's `msesc1` and `msesc2`) to actual columns.
#' @param to_factor Logical. Convert variables carrying labels to factors
#'   unless numeric restoration takes precedence.
#' @param to_numeric Logical. Restore score variables to plain numeric and
#'   replace negative missing codes with `NA`.
#' @param standardize_names Logical. Standardize names and `respnr`, remove
#'   wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA221 metadata, optional conversion and renaming, the
#'   `LASA_wave` attribute, and a `label_report` audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, dmmsesc = c(-3, 27))
#' apply_lasa221_labels(dat, wave = "D", to_numeric = TRUE)
apply_lasa221_labels <- function(data,
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
    G = "g", H = "h", `3B` = "b", MB = "bm", I = "i", J = "j", K = "k"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 221 wave: ", wave, ". Use one of: ",
      paste(names(wave_prefix), collapse = ", "), ".", call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = unname(wave_prefix[[wave]]),
    fn_name = "apply_lasa221_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  if (wave == "B") {
    value_labels <- c(
      "no scale (too many missing)" = -2,
      "low" = 2,
      "high" = 30
    )
  } else if (wave == "C") {
    value_labels <- c(
      "no scale (too many missing)" = -2,
      "low" = 1,
      "high" = 30
    )
  } else if (wave == "MB") {
    value_labels <- c(
      "na, see BMMSEVRS" = -5,
      "na, no valid data" = -4,
      "interview terminated" = -3,
      "no scale (too many missing)" = -2,
      "low" = 1,
      "high" = 30
    )
  } else {
    value_labels <- c(
      "interview terminated" = -3,
      "no scale (too many missing)" = -2,
      "low" = 1,
      "high" = 30
    )
  }

  if (wave == "MB") {
    engine$label_variable(
      "msesc1", "MMSE-score based on maximum spel/num",
      value_labels, force_numeric = TRUE
    )
    engine$label_variable(
      "msesc2", "Illiterate MMSE-score based on spelling",
      value_labels, force_numeric = TRUE
    )
  } else {
    engine$label_variable(
      "mmsesc", "MMSE-score based on maximum spel/num",
      value_labels, force_numeric = TRUE
    )
  }
  engine$finalize()
}
