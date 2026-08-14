# Apply LASA 714 ([RESP] weight change) SPSS labels
#
# Source: LASA714_varinfo.pdf (28-Apr-2022)

#' Apply LASA714 ([RESP] Weight Change) SPSS Labels
#'
#' Attaches the variable and value labels documented for LASA714 respondent
#' telephone-interview data in waves I and J. The twelve-variable inventory
#' covers recent weight change, kilograms gained or lost, reported and
#' constructed reasons for change, appetite, estimated body weight, and
#' self-reported weight. The appetite reference period is six months in wave I
#' and seven days in wave J.
#'
#' The kilogram and self-reported-weight fields are codebook-numeric and are
#' eligible for `to_numeric`; their negative missing codes become `NA`.
#' Categorical fields can be converted with `to_factor`, while observed
#' undocumented codes are retained. Where the PDF prints a routing label
#' without a numeric code, no numeric value label is inferred.
#'
#' Matching uses an explicit `name_corrections` entry, an exact match, then a
#' case-insensitive exact match. Original values and labels are preserved.
#' Standardized naming removes the wave prefix, standardizes `respnr`, and
#' adds `LASA_wave`; `split_wavecode` removes the prefix without otherwise
#' standardizing respondent-number spelling.
#'
#' @param data A data frame or tibble imported from a LASA714 `.sav` file.
#' @param wave Character scalar identifying wave `"I"` or `"J"`, matched
#'   case-insensitively.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix to actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors.
#' @param to_numeric Logical. Restore eligible weight quantities to plain
#'   numeric and replace negative missing codes with `NA`.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA714 metadata, optional conversions and renaming,
#'   preserved original coding, a `LASA_wave` attribute, and a `label_report`.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, itrvar142 = c(1, 3),
#'                   itrvar143L = c(-1, 4.5))
#' apply_lasa714_labels(dat, wave = "I", to_numeric = TRUE)
apply_lasa714_labels <- function(data,
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
  valid_waves <- c("I", "J")
  if (!wave %in% valid_waves) {
    stop(
      "Unknown LASA 714 wave: ", wave, ". Use one of: I, J.",
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
    prefix = tolower(wave),
    fn_name = "apply_lasa714_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  asked <- c("na, asked" = -1)
  weight_change <- c(
    asked,
    "not changed" = 1,
    "gained weight" = 2,
    "lost weight" = 3
  )
  gain_reason <- c(
    asked,
    "sickness" = 1,
    "eating more or different" = 2,
    "less physical activity" = 3,
    "combination of eating more/different and physical inactive" = 4,
    "reason unknown" = 5,
    "other reason → I/JTRVAC144" = 6
  )
  loss_reason <- c(
    asked,
    "sickness (unintentional)" = 1,
    "diet (intentional)" = 2,
    "other diet (unintentional)" = 3,
    "more physical activity (intentional)" = 4,
    "reason unknown (unintentional)" = 5,
    "social factors (unintentional)" = 6,
    "other reason → I/JTRVAC144" = 8
  )
  coded_other_reason <- c(
    "na, see I/JTRVAR144L/G" = -2.0,
    "na, asked" = -1.0,
    "sickness (unintentional)" = 1.0,
    "medication (unintentional)" = 1.1,
    "physical inact due to sickness (unintentional)" = 1.2,
    "lost weight due to sickness now gained weight (unintentional)" = 1.3,
    "diet (intentional)" = 2.0,
    "eating less or different (unknown)" = 2.1,
    "eating more or different (unintentional)" = 2.2,
    "eating more and physical inact (unintentional)" = 2.3,
    "quit smoking (unknown)" = 2.4,
    "smoking (unknown)" = 2.5,
    "eating less and physical active (intentional)" = 2.6,
    "eating less or different (unintentional)" = 2.7,
    "social factors (unintentional)" = 3.0,
    "social factors recoded (unintentional)" = 3.1,
    "do not know (unintentional)" = 5.0,
    "other reason (implausible reason) (unknown)" = 5.1,
    "physical activities (intentional)" = 6.0,
    "physical activity (unknown)" = 6.1,
    "physical inactivity (unintentional)" = 6.2,
    "working harder (unintentional)" = 6.3,
    "physical activity (unintentional)" = 6.4,
    "older age (unintentional)" = 7.0,
    "loss of appetite (unintentional)" = 8.0,
    "diuretics or dehydration" = 9.0,
    "oedeme/ascites" = 9.1,
    "quit prednison" = 9.2
  )
  gain_constructed <- c(
    "na, see I/JTRVAR144G" = -2,
    asked,
    "sickness" = 1,
    "related to eating" = 2,
    "physical inactivity" = 3,
    "eating and physical inactivity" = 4,
    "reason unknown" = 5,
    "other reason" = 6,
    "aging" = 7,
    "social factors" = 8
  )
  loss_constructed <- c(
    "na, see I/JTRVAR144L" = -2,
    asked,
    "sickness (unintentional)" = 1,
    "diet (intentional)" = 2,
    "different diet (unintentional)" = 3,
    "physical activity (intentional)" = 4,
    "reason unknown (unintentional)" = 5,
    "social factors (unintentional)" = 6,
    "other reason" = 7,
    "eating less or different (unknown)" = 8,
    "eating less and physical active (intentional)" = 9,
    "physical activity (unintentional)" = 10,
    "physical activity (unknown)" = 11,
    "aging (unintentional)" = 12
  )
  appetite <- c(asked, "good" = 1, "moderate" = 2, "poor" = 3)
  estimated_weight <- c(
    "na, section not done" = -3,
    asked,
    "severe underweight" = 1,
    "underweight" = 2,
    "approx. normal weight" = 3,
    "overweight" = 4,
    "severe overweight" = 5,
    "do not know" = 6
  )

  label_variable("trvar142", "Weight change last 6 months", weight_change, FALSE)
  label_variable("trvar143g", "Weight gain kilogram", asked, TRUE)
  label_variable("trvar143l", "Weight loss kilogram", asked, TRUE)
  label_variable("trvar144g", "Weight gain reason", gain_reason, FALSE)
  label_variable("trvar144l", "Weight loss reason", loss_reason, FALSE)
  label_variable(
    "trvac144", "Weight change other reason: coded", coded_other_reason, FALSE
  )
  label_variable(
    "trvc144g", "Reason weight gain (constructed)", gain_constructed, FALSE
  )
  label_variable(
    "trvc144l", "Reason weight loss (constructed)", loss_constructed, FALSE
  )
  if (wave == "I") {
    label_variable("trapp6m", "Appetite last 6 months", appetite, FALSE)
  } else {
    label_variable("trapp7d", "Appetite last 7 days", appetite, FALSE)
  }
  label_variable("trestw", "Estimation body weight", estimated_weight, FALSE)
  label_variable("trmed155", "Weight: self-report", asked, TRUE)

  engine$finalize()
}
