# Apply LASA 115 (subjective pain) SPSS labels
#
# Source: LASA115_varinfo.pdf (25-Jan-2024)

#' Apply LASA115 (Subjective pain) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the six subjective-pain
#' items documented for LASA115. The items concern pain while standing,
#' changing position, sitting, and walking, and whether pain is unbearable or
#' constant.
#'
#' The self-administered questionnaire variables are documented for waves B,
#' C, D, E, 2B, F, G, H, 3B, I, J, and K with suffixes `qpain1` through
#' `qpain6`. Wave MB contains the same six items in the medical interview,
#' using suffixes `mpain1` through `mpain6`. Every item uses `-1` for no
#' answer, `1` for yes, and `2` for no. The pain scale score documented in
#' the same PDF belongs to LASA315 and is not included here.
#'
#' Matching tries an explicit `name_corrections` override, an exact match,
#' and a case-insensitive exact match, in that order. `to_factor = TRUE`
#' converts matched items using the documented value map and retains observed
#' unlabelled codes. No LASA115 variable is eligible for `to_numeric`.
#' Original labels and values remain available through `original_labels` and
#' `original_values` attributes.
#'
#' @param data A data frame or tibble imported from a LASA115 `.sav` file.
#' @param wave Character scalar identifying wave `"B"`, `"C"`, `"D"`, `"E"`,
#'   `"2B"`, `"F"`, `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#'   Matching is case-insensitive.
#' @param name_corrections Optional named character vector whose names are
#'   canonical suffixes without the wave prefix, such as `qpain1` or
#'   `mpain1`, and whose values are actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to
#'   factors using the documented coding.
#' @param to_numeric Logical. Accepted for interface consistency; LASA115 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. Standardize matched names and respondent
#'   number, remove the wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes from matched names and
#'   add `LASA_wave`; always enabled by `standardize_names = TRUE`.
#'
#' @return `data` with LASA115 metadata, optional conversion and renaming,
#'   original-coding attributes, `LASA_wave`, and a `label_report` audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:3, BQPAIN1 = c(-1, 1, 2))
#' dat <- apply_lasa115_labels(dat, wave = "B")
#' attr(dat$BQPAIN1, "labels")
apply_lasa115_labels <- function(data,
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
      "Unknown LASA 115 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa115_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  suffix_stem <- if (wave == "MB") "mpain" else "qpain"
  variable_labels <- c(
    "Pain 1: standing",
    "Pain 2: change position",
    "Pain 3: sitting",
    "Pain 4: walking",
    "Pain 5: unbearable",
    "Pain 6: constant"
  )
  value_labels <- c("no answer" = -1, "yes" = 1, "no" = 2)

  for (i in seq_along(variable_labels)) {
    engine$label_variable(
      paste0(suffix_stem, i),
      variable_labels[[i]],
      value_labels,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
