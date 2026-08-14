# Apply LASA 175 (attitudes towards nursing home care) SPSS labels
#
# Source: LASA175_varinfo.pdf (28-Feb-2024)

#' Apply LASA175 (attitudes towards nursing home care) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the nine attitude items
#' documented in LASA175 for waves J and K. Items cover perceived quality,
#' privacy, time outside, social contact, autonomy, visitors, and respectful
#' treatment in nursing homes. All share a five-point agreement scale plus the
#' documented asked-missing code.
#'
#' All LASA175 variables are categorical and none is converted by
#' `to_numeric = TRUE`. With `to_factor = TRUE`, documented codes become
#' factor levels while observed unlabelled codes are retained. Matching tries
#' `name_corrections`, an exact match, then a case-insensitive exact match.
#' Original labels and values are preserved. Optional standardized naming
#' removes the wave prefix, standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA175 `.sav` file.
#'   Documented names are `jmnh01` through `jmnh09` in wave J and the
#'   corresponding `kmnh` names in wave K.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"J"` or `"K"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   LASA175 suffixes without the wave prefix (for example, `mnh01`) to actual
#'   column names in `data`.
#' @param to_factor Logical. If `TRUE`, variables with documented value labels
#'   are converted to factors.
#' @param to_numeric Logical. Accepted for the shared interface. LASA175 has
#'   no documented continuous numeric variables.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column is inserted after `respnr`.
#'
#' @return `data`, with LASA175 labels, optional factor conversion and
#'   standardized naming, preserved original SPSS coding, the `LASA_wave`
#'   provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, jmnh01 = c(1, 5), jmnh02 = c(2, 4))
#' apply_lasa175_labels(dat, wave = "J", to_factor = TRUE)
apply_lasa175_labels <- function(data,
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
  if (!wave %in% c("J", "K")) {
    stop("Unknown LASA 175 wave: ", wave, ". Use one of: J, K.", call. = FALSE)
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
    fn_name = "apply_lasa175_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  agreement_labels <- c(
    "na, asked" = -1,
    "completely disagree" = 1,
    "disagree" = 2,
    "do not agree/disagree" = 3,
    "agree" = 4,
    "completely agree" = 5
  )
  variables <- c(
    mnh01 = "Good quality nursing homes in Netherlands",
    mnh02 = "Enough privacy in nursing home",
    mnh03 = "Residents spend little to no time outside nursing home",
    mnh04 = "Fun being together with other residents of nursing home",
    mnh05 = "Control over toilet visits in nursing home",
    mnh06 = "Residents nursing home barely get visitors",
    mnh07 = "Treated with respect by staff nursing home",
    mnh08 = "Control over when to wake up in nursing home",
    mnh09 = "Good conversations with residents of nursing home"
  )
  for (suffix in names(variables)) {
    engine$label_variable(
      suffix, unname(variables[[suffix]]), agreement_labels,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
