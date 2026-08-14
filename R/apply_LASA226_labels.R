# Apply LASA 226 (anxiety scale scores) SPSS labels
#
# Source: LASA026_varinfo.pdf (13-Jul-2020), LAS(A)*226 sections

#' Apply LASA226 (Anxiety scale scores) SPSS labels
#'
#' Attaches SPSS-style labels to the anxiety total score and reason-missing
#' variable documented in LASA226 for waves B, C, D, E, F, G, H, 3B, MB, I,
#' and J. The score ranges from 0 to 21. B, the regular later waves, and MB
#' use materially different names, variable-label wording, and value maps.
#'
#' The total score is numeric: `to_numeric = TRUE` restores plain numeric
#' values and replaces negative codes with `NA`. The reason field remains
#' categorical and supports `to_factor = TRUE`. B includes code 4 for refused
#' test; later and MB reason maps end at code 3. Matching, original-code
#' preservation, standardized naming, `respnr`, `LASA_wave`, and the final
#' `label_report` follow the shared label engine.
#'
#' @param data A data frame or tibble imported from a LASA226 `.sav` file.
#' @param wave Character scalar identifying B, C, D, E, F, G, H, 3B, MB, I,
#'   or J.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes for the selected wave to actual columns.
#' @param to_factor Logical. Convert labelled categorical variables to factors
#'   unless numeric restoration takes precedence.
#' @param to_numeric Logical. Restore the anxiety score to plain numeric and
#'   replace negative values with `NA`.
#' @param standardize_names Logical. Standardize names and `respnr`, remove
#'   wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA226 metadata, optional conversion and renaming, the
#'   `LASA_wave` attribute, and a `label_report` audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, canxint = c(-2, 12), crmanx = c(3, -2))
#' apply_lasa226_labels(dat, wave = "C", to_numeric = TRUE)
apply_lasa226_labels <- function(data,
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
    B = "b", C = "c", D = "d", E = "e", F = "f", G = "g",
    H = "h", `3B` = "b", MB = "b", I = "i", J = "j"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 226 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa226_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  if (wave == "B") {
    score_suffix <- "anxint"
    reason_suffix <- "rmanx"
    score_label <- "BANXIETY SCALE TOTAL SCORE INTEGER"
    reason_label <- "Reason missing: Anxiety"
    score_labels <- c("na, see BRMANX" = -2, "low" = 0, "high" = 21)
    reason_labels <- c(
      "valid score" = -2, "short interview" = 1,
      "interview terminated" = 2, "too many missings" = 3,
      "refused test" = 4
    )
  } else if (wave == "MB") {
    score_suffix <- "manxint"
    reason_suffix <- "mrmanx"
    score_label <- "B anxiety scale total score integer"
    reason_label <- "Reason no anxiety scale score"
    score_labels <- c("no valid data" = -2, "low" = 0, "high" = 21)
    reason_labels <- c(
      "valid score" = -2, "short interview" = 1,
      "interview terminated" = 2, "too many missings" = 3
    )
  } else {
    score_suffix <- "anxint"
    reason_suffix <- "rmanx"
    score_label <- "C/D/E/F/G/H/B/I/J ANXIETY SCALE TOTAL SCORE INTEGER"
    reason_label <- "Reason no anxiety scale score"
    score_labels <- c(
      "no valid data" = -2, "low (minimum)" = 0, "high" = 21
    )
    reason_labels <- c(
      "valid score" = -2, "short interview" = 1,
      "interview terminated" = 2, "too many missings" = 3
    )
  }

  engine$label_variable(
    score_suffix, score_label, score_labels, force_numeric = TRUE
  )
  engine$label_variable(
    reason_suffix, reason_label, reason_labels, force_numeric = FALSE
  )
  engine$finalize()
}
