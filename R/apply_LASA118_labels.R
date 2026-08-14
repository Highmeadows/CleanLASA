# Apply LASA 118 (diet/food quality) SPSS labels
#
# Source: LASA118_varinfo.pdf (31-Jan-2024)

#' Apply LASA118 (Diet/food quality) SPSS labels
#'
#' Attaches SPSS-style metadata to the diet, food-quality, and appetite
#' variables documented for LASA118. The inventory changes substantially by
#' wave: B contains 20 chewing, meal-frequency, diet, fruit, and vegetable
#' items; C and D contain one chewing item; H, I, and J contain seven eating-
#' risk items; and K contains those seven items plus four appetite items.
#'
#' Wave-B meal-frequency and fruit/vegetable frequency variables are numeric
#' with `-1` for no answer. With `to_numeric = TRUE`, these variables become
#' plain numeric and negative codes become `NA`. All remaining variables are
#' categorical and can be converted with `to_factor = TRUE`. Value labels,
#' variable labels, and spelling are reproduced from the codebook.
#'
#' Column matching tries `name_corrections`, an exact name, then a case-
#' insensitive exact name. Original labels and values are retained in
#' `original_labels` and `original_values` attributes.
#'
#' @param data A data frame or tibble imported from a LASA118 `.sav` file.
#' @param wave Character scalar identifying `"B"`, `"C"`, `"D"`, `"H"`,
#'   `"I"`, `"J"`, or `"K"`; matching is case-insensitive.
#' @param name_corrections Optional named character vector whose names are
#'   canonical suffixes without the wave prefix, such as `qfood01` or
#'   `qapp1`, and whose values are actual column names in `data`.
#' @param to_factor Logical. Convert matched categorical variables to factors
#'   using documented value labels.
#' @param to_numeric Logical. Restore eligible wave-B frequency variables to
#'   plain numeric and replace negative missing codes with `NA`.
#' @param standardize_names Logical. Standardize matched names and respondent
#'   number, remove wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes from matched names and
#'   add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA118 metadata, optional conversion and renaming,
#'   original-coding attributes, `LASA_wave`, and a `label_report` audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   BQFOOD01 = c(-1, 1, 4),
#'   bqfood02 = c(-1, 2, 4)
#' )
#' dat <- apply_lasa118_labels(dat, wave = "B", to_numeric = TRUE)
#' dat$bqfood02
apply_lasa118_labels <- function(data,
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
  wave_prefix <- c(B = "b", C = "c", D = "d", H = "h", I = "i", J = "j", K = "k")
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 118 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa118_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  no_answer <- c("no answer" = -1)

  if (wave == "B") {
    engine$label_variable(
      "qfood01", "bite and chew",
      c(
        "no answer" = -1,
        "almost never" = 1,
        "some of the day" = 2,
        "often" = 3,
        "most of the time" = 4
      ),
      force_numeric = FALSE
    )

    meal_labels <- c(
      "#times eaten: morning",
      "#times eaten: afternoon",
      "#times eaten: evening",
      "#times eaten: night"
    )
    for (i in seq_along(meal_labels)) {
      engine$label_variable(
        sprintf("qfood%02d", i + 1L), meal_labels[[i]], no_answer,
        force_numeric = TRUE
      )
    }

    diet_labels <- c(
      "diet: low-calorie-poor",
      "diet: low-cholesterol",
      "diet: low-salt",
      "diet: sugar-free",
      "diet: high-calorie",
      "diet: vegetarian",
      "diet: other"
    )
    diet_values <- c("no answer" = -1, "no" = 1, "yes" = 2)
    for (i in seq_along(diet_labels)) {
      engine$label_variable(
        sprintf("qfood%02d", i + 5L), diet_labels[[i]], diet_values,
        force_numeric = FALSE
      )
    }

    produce_labels <- c(
      "fruit spring summer:#days a week",
      "fruit spring summer:#times a day",
      "fruit autumn winter:#days a week",
      "fruit autumn winter:#times a day",
      "vegetables spring summer:#days a week",
      "vegetables spring summer:#times a day",
      "vegetables autums winter:#days a week",
      "vegetables autums winter:#times a day"
    )
    for (i in seq_along(produce_labels)) {
      engine$label_variable(
        sprintf("qfood%02d", i + 12L), produce_labels[[i]], no_answer,
        force_numeric = TRUE
      )
    }
  } else if (wave %in% c("C", "D")) {
    engine$label_variable(
      "qfood01", "bite and chew",
      c(
        "no value" = -1,
        "yes, without trouble" = 1,
        "yes, with some trouble" = 2,
        "yes, with much trouble" = 3,
        "no, I cannot" = 4
      ),
      force_numeric = FALSE
    )
  } else {
    risk_labels <- c(
      "eat less: disease",
      "less than 2 meals a day",
      "few vegetables, fruit, dairy",
      "eat less: bite and chew problems",
      "eat less: money problems",
      "eat alone mostly",
      "phys. cond. limit shopping and cooking"
    )
    risk_values <- c("no answer" = -1, "yes" = 1, "no" = 2)
    for (i in seq_along(risk_labels)) {
      engine$label_variable(
        sprintf("qfood%02d", i + 20L), risk_labels[[i]], risk_values,
        force_numeric = FALSE
      )
    }

    if (wave == "K") {
      engine$label_variable(
        "qapp1", "Appetite: eating a meal",
        c(
          "no answer" = -1,
          "satiated after a few bites" = 1,
          "satiated after 1/3 the meal" = 2,
          "satiated after 1/2 the meal" = 3,
          "satiated after most of the meal" = 4,
          "never satiated" = 5
        ),
        force_numeric = FALSE
      )
      appetite_values <- c(
        "no answer" = -1,
        "very bad" = 1,
        "bad" = 2,
        "moderate" = 3,
        "good" = 4,
        "very good" = 5
      )
      engine$label_variable(
        "qapp2", "Appetite: general appetite", appetite_values,
        force_numeric = FALSE
      )
      engine$label_variable(
        "qapp3", "Appetite: general liking of food", appetite_values,
        force_numeric = FALSE
      )
      engine$label_variable(
        "qapp4", "Appetite: number of meals per day",
        c(
          "no answer" = -1,
          "< 1 meal per day" = 1,
          "1 meals per day" = 2,
          "2 meals per day" = 3,
          "3 meals per day" = 4,
          "> 3 meals per day" = 5
        ),
        force_numeric = FALSE
      )
    }
  }

  engine$finalize()
}
