# Apply LASA 169 (daily experiences) SPSS variable and value labels
#
# Source: LASA169_varinfo.pdf (17-Mar-2023)

#' Apply LASA169 (daily experiences) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the 14 daily-experiences variables documented in
#' LASA169 for waves J and K. The source notes that the K-wave data file was
#' not yet available when the codebook was issued, but documents the same
#' `kmdexp` inventory and coding as wave J.
#'
#' The first five variables record how often unfair interpersonal treatment
#' occurred. Nine follow-up indicators record perceived reasons for those
#' experiences: gender, ethnicity, age, weight, disability, appearance,
#' sexual orientation, financial situation, and another reason. All variables
#' are categorical; none is converted by `to_numeric = TRUE`.
#'
#' Column matching tries an explicit `name_corrections` override, an exact
#' match, then a case-insensitive exact match. With `to_factor = TRUE`,
#' documented codes become factor levels while observed unlabelled codes are
#' retained. Original labels and values are preserved. Optional standardized
#' naming removes the wave prefix, standardizes `respnr`, and adds
#' `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA169 `.sav` file.
#'   Documented names are `jmdexp1` through `jmdexp69` in wave J and the
#'   corresponding `kmdexp` names in wave K.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"J"` or `"K"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   LASA169 suffixes without the wave prefix (for example, `mdexp1`) to
#'   actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, variables with documented value labels
#'   are converted to factors. Observed unlabelled codes remain numeric-text
#'   levels.
#' @param to_numeric Logical. Accepted for the shared interface. LASA169 has
#'   no documented continuous numeric variables, so its variables retain
#'   their labelled coding.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column containing the selected wave is
#'   inserted immediately after the respondent-number column.
#'
#' @return `data`, with LASA169 variable/value labels, optional factor
#'   conversion and standardized naming, preserved original SPSS coding, the
#'   `LASA_wave` provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, jmdexp1 = c(1, 6), jmdexp63 = c(0, 1))
#' dat <- apply_lasa169_labels(dat, wave = "J", to_factor = TRUE)
#' attr(dat$jmdexp1, "label")
apply_lasa169_labels <- function(data,
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
  valid_waves <- c("J", "K")
  if (!wave %in% valid_waves) {
    stop(
      "Unknown LASA 169 wave: ", wave, ". Use one of: J, K.",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  prefix <- tolower(wave)
  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa169_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  frequency_labels <- c(
    "na, asked" = -1,
    "almost daily" = 1,
    "at least once a week" = 2,
    "few times a month" = 3,
    "few times a year" = 4,
    "less than once a year" = 5,
    "never" = 6
  )
  frequency_variables <- c(
    mdexp1 = "daily experiences: treated with less respect",
    mdexp2 = "daily experiences: lower service level in restaurants/shops",
    mdexp3 = "daily experiences: people assuming I am not smart",
    mdexp4 = "daily experiences: being harassed",
    mdexp5 = "daily experiences: less good treatment from doctors or in hospitals"
  )
  for (suffix in names(frequency_variables)) {
    engine$label_variable(
      suffix, unname(frequency_variables[[suffix]]), frequency_labels,
      force_numeric = FALSE
    )
  }

  reason_labels <- c(
    "na, never experienced" = -2,
    "na, asked" = -1,
    "not mentioned" = 0,
    "mentioned" = 1
  )
  reason_variables <- c(
    mdexp61 = "perceived reason experience: your gender",
    mdexp62 = "perceived reason experience: your ethnicity",
    mdexp63 = "perceived reason experience: your age",
    mdexp64 = "perceived reason experience: your weight",
    mdexp65 = "perceived reason experience: a physical disability",
    mdexp66 = "perceived reason experience: an aspect of your physical appearance",
    mdexp67 = "perceived reason experience: your sexual orientation",
    mdexp68 = "perceived reason experience: your financial situation",
    mdexp69 = "perceived reason experience: other"
  )
  for (suffix in names(reason_variables)) {
    engine$label_variable(
      suffix, unname(reason_variables[[suffix]]), reason_labels,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
