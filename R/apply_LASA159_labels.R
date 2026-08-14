# Apply LASA 159 (decubitus) SPSS labels
#
# Source: LASA159_varinfo.pdf (03-Mrt-2016)

#' Apply LASA159 (Decubitus) SPSS labels
#'
#' Attaches the documented labels for the eight wave-B LASA159 decubitus
#' variables: reported presence and location, most severe location, observed
#' stage, home and nursing-home treatment, occurrence during the past year,
#' and frequency. All response and missing-value codes follow the codebook.
#'
#' Matching tries `name_corrections`, exact names, then case-insensitive exact
#' names. `to_factor = TRUE` converts labelled variables to factors while
#' retaining undocumented observed values. LASA159 has no variables eligible
#' for `to_numeric`. Original values and labels are preserved as attributes.
#'
#' @param data A data frame or tibble imported from a LASA159 `.sav` file.
#' @param wave Character scalar `"B"`; matching is case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes to actual column names.
#' @param to_factor Logical. Convert labelled variables to factors.
#' @param to_numeric Logical. Accepted for the shared interface; no LASA159
#'   variables are eligible for numeric restoration.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove the wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA159 metadata, optional reshaping, the `LASA_wave`
#'   attribute, and a `label_report` audit.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(bmdecu01 = c(-1, 1, 2), bmdecu04 = c(0, 1, 2))
#' apply_lasa159_labels(dat, wave = "B")
apply_lasa159_labels <- function(data,
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
  if (wave != "B") {
    stop("Unknown LASA 159 wave: ", wave, ". Use: B.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = "b",
    fn_name = "apply_lasa159_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  yes_no <- c("no valid data" = -3, "no answer, asked" = -1,
              "no" = 1, "yes" = 2)
  location <- c(
    "no valid data" = -3, "no answer, asked" = -1,
    "not reported" = 0, "heel" = 1, "ankle" = 2, "hip" = 3,
    "coccyx" = 4, "other place" = 5
  )

  label_variable("mdecu01", "Decubitus: reported No/Yes", yes_no, FALSE)
  label_variable("mdecu02", "reported decubitus medical interview", location, FALSE)
  label_variable("mdecu03", "Decubitus: most severe reported", location, FALSE)
  label_variable(
    "mdecu04", "Decubitus: stadium observed",
    c("no valid data" = -3, "not reported" = 0,
      "no decubitus" = 1, "phase 1" = 2),
    FALSE
  )
  label_variable(
    "mdecu05", "Decubitus: treatment at home by",
    c("no valid data" = -3, "in nursing home" = -2,
      "no answer, asked" = -1, "not reported" = 0, "oneself" = 1),
    FALSE
  )
  label_variable(
    "mdecu06", "Decubitus: treatment at nursing home by",
    c("no valid data" = -3, "living at home" = -2,
      "no answer, asked" = -1, "not reported" = 0,
      "nurse" = 4, "other: elderly care" = 7),
    FALSE
  )
  label_variable("mdecu07", "Decubitus: present past year", yes_no, FALSE)
  label_variable(
    "mdecu08", "Decubitus: past year how often",
    c("no valid data" = -3, "no answer, routing" = -2,
      "no answer, asked" = -1, "1 time" = 1),
    FALSE
  )

  engine$finalize()
}
