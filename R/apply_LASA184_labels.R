# Apply LASA 184 (diet) SPSS labels
#
# Source: LASA184_varinfo.pdf (09-Apr-2024)

#' Apply LASA184 (Diet) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the diet and milk-product
#' variables documented for LASA184. The file is documented for waves C and
#' D. Both waves contain the diet indicator and five diet-type indicators;
#' wave C additionally contains high-calorie and other-diet indicators, five
#' weekly milk-product frequencies, and milk-consumption histories for three
#' age periods.
#'
#' Weekly milk-product frequencies are numeric counts. With
#' `to_numeric = TRUE`, their negative missing codes become `NA`; the other
#' variables remain categorical. With `to_factor = TRUE`, labelled variables
#' become factors and observed unlabelled values are retained as numeric-text
#' levels. Original values and labels remain available in `original_values`
#' and `original_labels`.
#'
#' Matching tries an explicit `name_corrections` override, an exact match,
#' then a case-insensitive exact match. Optional standardized naming removes
#' the wave prefix, standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA184 `.sav` file.
#' @param wave Character scalar identifying wave `"C"` or `"D"`; matching is
#'   case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (for example `mdiet`) to actual columns.
#' @param to_factor Logical. Convert labelled variables to factors.
#' @param to_numeric Logical. Convert weekly milk-product counts to plain
#'   numeric and replace negative missing codes with `NA`.
#' @param standardize_names Logical. Standardize matched names and respondent
#'   number, remove wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA184 metadata, optional conversion and renaming, a
#'   `LASA_wave` attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(cmdiet = c(-1, 1, 2), cmmilkmlk = c(-1, 0, 7))
#' apply_lasa184_labels(dat, wave = "C", to_numeric = TRUE)
apply_lasa184_labels <- function(data,
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
  wave_prefix <- c(C = "c", D = "d")
  if (!wave %in% names(wave_prefix)) {
    stop("Unknown LASA 184 wave: ", wave, ". Use one of: C, D.", call. = FALSE)
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
    fn_name = "apply_lasa184_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  diet_yes_no <- c(
    "na, interview terminated" = -5,
    "no valid data" = -1,
    "no" = 1,
    "yes" = 2
  )
  diet_type <- c(
    "na, see C/DMDIET" = -2,
    "not mentioned" = 0,
    "mentioned" = 1
  )

  specs <- list(
    list("mdiet", "Diet: yes/no", diet_yes_no, FALSE),
    list("mdietlcal", "Diet: low-calorie", diet_type, FALSE),
    list("mdietlchol", "Diet: low-cholesterol", diet_type, FALSE),
    list("mdietlsalt", "Diet: low-salt", diet_type, FALSE),
    list("mdietsugf", "Diet: sugar free", diet_type, FALSE),
    list("mdietveg", "Diet: vegetarian", diet_type, FALSE)
  )

  if (wave == "C") {
    c_diet_type <- c(
      "na, see CMDIET" = -2,
      "not mentioned" = 0,
      "mentioned" = 1
    )
    milk_days <- c(
      "na, interview terminated" = -5,
      "no valid data" = -1,
      "none" = 0
    )
    milk_history <- c(
      "na, interview terminated" = -5,
      "no valid data" = -1,
      "about every meal" = 1,
      "every day but not every meal" = 2,
      "every week but not every day" = 3,
      "< once a week" = 4
    )
    specs <- c(specs, list(
      list("mdiethcal", "Diet: high-calorie", c_diet_type, FALSE),
      list("mdietoth", "Diet: other", c_diet_type, FALSE),
      list("mmilkhchs", "Milk products: number of days hard cheese", milk_days, TRUE),
      list("mmilkschs", "Milk products: number of days soft cheese", milk_days, TRUE),
      list("mmilkyght", "Milk products: number of days yoghurt", milk_days, TRUE),
      list("mmilkmlk", "Milk products: number of days milk", milk_days, TRUE),
      list("mmilkvar", "Milk products: number of days various", milk_days, TRUE),
      list("mmilkb25y", "Milk consumption: up to 25 years", milk_history, FALSE),
      list("mmilkb50y", "Milk consumption: between 25 and 50 yr", milk_history, FALSE),
      list("mmilka50y", "Milk consumption: from age 50 on", milk_history, FALSE)
    ))
  }

  for (item in specs) {
    engine$label_variable(item[[1L]], item[[2L]], item[[3L]], force_numeric = item[[4L]])
  }

  engine$finalize()
}
