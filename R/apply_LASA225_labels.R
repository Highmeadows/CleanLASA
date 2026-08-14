# Apply LASA 225 (CES-D scale scores) SPSS labels
#
# Source: LASA025_varinfo.pdf (31-May-2023), LAS(A)*225 sections

#' Apply LASA225 (CES-D scale scores) SPSS labels
#'
#' Attaches SPSS-style labels to the CES-D total score and reason-missing
#' variable documented in LASA225 for waves B, C, D, E, 2B, F, G, H, 3B, MB,
#' I, J, and K. The score ranges from 0 to 60 with the documented cut-off at
#' 16. Its `-2` missing code and the reason categories vary by wave group.
#'
#' The CES-D total is numeric: `to_numeric = TRUE` restores a plain numeric
#' vector and replaces negative values with `NA`. The reason field remains
#' categorical and can be converted with `to_factor = TRUE`. The function
#' reproduces the B, C/D/E, 2B, F-through-K, and MB branches, including MB's
#' code 4 for no valid data. Matching, original-label preservation,
#' standardized names, `respnr`, `LASA_wave`, and the matching audit use the
#' shared label engine.
#'
#' @param data A data frame or tibble imported from a LASA225 `.sav` file.
#' @param wave Character scalar identifying B, C, D, E, 2B, F, G, H, 3B, MB,
#'   I, J, or K.
#' @param name_corrections Optional named character vector mapping `cesdint`
#'   or `rmcesd` to actual columns.
#' @param to_factor Logical. Convert labelled categorical variables to factors
#'   unless numeric restoration takes precedence.
#' @param to_numeric Logical. Restore the CES-D score to plain numeric and
#'   replace negative values with `NA`.
#' @param standardize_names Logical. Standardize names and `respnr`, remove
#'   wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA225 metadata, optional conversion and renaming, the
#'   `LASA_wave` attribute, and a `label_report` audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, fcesdint = c(-2, 24), frmcesd = c(3, -2))
#' apply_lasa225_labels(dat, wave = "F", to_numeric = TRUE)
apply_lasa225_labels <- function(data,
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
      "Unknown LASA 225 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa225_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  if (wave == "B") {
    score_labels <- c(
      "na, see BRMCESD" = -2, "low" = 0,
      "cut off" = 16, "high (maximum 60)" = 60
    )
    reason_labels <- c(
      "valid score" = -2, "short interview" = 1,
      "interview terminated" = 2, "too many missings" = 3,
      "refused test" = 4
    )
    score_label <- "B CES-D SCALE TOTAL SCORE INTEGER"
  } else if (wave %in% c("C", "D", "E")) {
    score_labels <- c(
      "no valid data" = -2, "low" = 0,
      "cut off" = 16, "high (maximum 60)" = 60
    )
    reason_labels <- c(
      "valid score" = -2, "short interview" = 1,
      "interview terminated" = 2, "too many missings" = 3
    )
    score_label <- "C/D/E CES-D SCALE TOTAL SCORE INTEGER"
  } else if (wave == "2B") {
    score_labels <- c(
      "no valid data" = -2, "low" = 0,
      "cut off" = 16, "high (maximum 60)" = 60
    )
    reason_labels <- c(
      "valid score" = -2, "interview terminated" = 2,
      "too many missings" = 3
    )
    score_label <- "B CES-D SCALE TOTAL SCORE INTEGER"
  } else if (wave == "MB") {
    score_labels <- c(
      "no valid data" = -2, "low" = 0,
      "cut off" = 16, "high (maximum 60)" = 60
    )
    reason_labels <- c(
      "valid score" = -2, "short interview" = 1,
      "interview terminated" = 2, "too many missings" = 3,
      "no valid data" = 4
    )
    score_label <- "B CES-D SCALE TOTAL SCORE INTEGER"
  } else {
    score_labels <- c(
      "no valid data" = -2, "low (minimum)" = 0,
      "cut off" = 16, "high (maximum 60)" = 60
    )
    reason_labels <- c(
      "valid score" = -2, "short interview" = 1,
      "interview terminated" = 2, "too many missings" = 3
    )
    score_label <- "F/G/H/B/I/J/K CES-D SCALE TOTAL SCORE INTEGER"
  }

  engine$label_variable(
    "cesdint", score_label, score_labels, force_numeric = TRUE
  )
  engine$label_variable(
    "rmcesd", "reason missing ces-d score", reason_labels,
    force_numeric = FALSE
  )
  engine$finalize()
}
