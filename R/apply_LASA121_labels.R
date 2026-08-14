# Apply LASA 121 (social participation: environmental influence) SPSS labels
#
# Source: LASA121_varinfo.pdf (22-Sep-2017)

#' Apply LASA121 (Social participation: environmental influence) labels
#'
#' Attaches SPSS-style variable and value labels to the three social-
#' participation variables documented for LASA121. The self-administered
#' items record how often respondents discuss magazines or newspapers,
#' discuss life, and make calculations.
#'
#' LASA121 is documented for waves B, C, and D. Each wave contains the same
#' three categorical items, coded `-1` no answer, `1` rarely or never, `2`
#' monthly, and `3` weekly or more often. `to_factor = TRUE` converts matched
#' items with this map and retains observed unlabelled codes. No variable is
#' eligible for `to_numeric`.
#'
#' Matching tries `name_corrections`, an exact name, then a case-insensitive
#' exact name. Original labels and values are retained in `original_labels`
#' and `original_values` attributes.
#'
#' @param data A data frame or tibble imported from a LASA121 `.sav` file.
#' @param wave Character scalar identifying `"B"`, `"C"`, or `"D"`; matching
#'   is case-insensitive.
#' @param name_corrections Optional named character vector whose names are
#'   canonical suffixes without the wave prefix, such as `qsocp01`, and whose
#'   values are actual column names in `data`.
#' @param to_factor Logical. Convert matched variables to factors using the
#'   documented value labels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA121 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. Standardize matched names and respondent
#'   number, remove wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes from matched names and
#'   add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA121 metadata, optional conversion and renaming,
#'   original-coding attributes, `LASA_wave`, and a `label_report` audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(BQSOCP01 = c(-1, 1, 3), bqsocp03 = c(1, 2, 3))
#' dat <- apply_lasa121_labels(dat, wave = "B")
#' attr(dat$BQSOCP01, "labels")
apply_lasa121_labels <- function(data,
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
  wave_prefix <- c(B = "b", C = "c", D = "d")
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 121 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa121_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_labels <- c(
    "no answer" = -1,
    "rarely or never" = 1,
    "monthly" = 2,
    "weekly or more often" = 3
  )
  variable_labels <- c(
    "conversation about magazine/paper",
    "conversation about life",
    "make calculations"
  )

  for (i in seq_along(variable_labels)) {
    engine$label_variable(
      sprintf("qsocp%02d", i), variable_labels[[i]], value_labels,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
