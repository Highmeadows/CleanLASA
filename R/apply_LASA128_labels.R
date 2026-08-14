# Apply LASA 128 (donorship) SPSS labels
#
# Source: LASA128_varinfo.pdf (14-Jun-2022)

#' Apply LASA128 (Donorship) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to donorship variables
#' documented in LASA128 for waves I and J.
#'
#' Wave I has eight variables on blood or plasma donor registration, former
#' registration years and reasons for stopping, recent donation frequency,
#' and organ-donation decisions. Wave J has five variables: current donor
#' registration and questions about decisions before and after the new donor
#' law.
#'
#' The two wave-I registration-year fields are numeric and eligible for
#' `to_numeric`; their negative routing/missing codes become `NA`. The other
#' fields are categorical and can be converted with `to_factor`.
#'
#' Matching tries `name_corrections`, an exact case-sensitive match, and then
#' a case-insensitive exact match. Original SPSS coding is preserved;
#' standardized naming removes the wave prefix and can add `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA128 `.sav` file.
#'   Names may include `iqdona3`, `iqdona8`, `jqdona1_2`, or `jqdona1_5`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"I"` or `"J"`.
#' @param name_corrections Optional named character vector mapping suffixes
#'   without the wave prefix (for example `qdona3` or `qdona1_5`) to actual
#'   names in `data`.
#' @param to_factor Logical. If `TRUE`, categorical variables are converted to
#'   factors using the documented value labels.
#' @param to_numeric Logical. If `TRUE`, the wave-I registration-year fields
#'   are restored to plain numeric and negative values become `NA`.
#' @param standardize_names Logical. If `TRUE`, matched names and `respnr` are
#'   standardized and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched names lose the wave prefix
#'   and a `LASA_wave` column is inserted after `respnr`.
#'
#' @return `data`, with LASA128 labels, requested conversion or renaming,
#'   preserved original coding, `LASA_wave` provenance, and a `label_report`.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(iqdona1 = c(1, 3), iqdona3 = c(-2, 1995))
#' dat <- apply_lasa128_labels(dat, wave = "I", to_numeric = TRUE)
#' attr(dat$iqdona1, "labels")
apply_lasa128_labels <- function(data,
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
  if (!wave %in% c("I", "J")) {
    stop(
      "Unknown LASA 128 wave: ", wave, ". Use one of: I, J.",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = tolower(wave),
    fn_name = "apply_lasa128_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  donor_status <- c(
    "na, asked" = -1, "yes, blood" = 1, "yes, plasma" = 2, "no" = 3
  )
  organ_decision <- c(
    "I do not make my organs available" = 1,
    "I make all my organs available" = 2,
    "I make some organs available" = 3,
    "I leave the choice to my next of kin" = 4,
    "I do not know / do not want to say it" = 5
  )

  engine$label_variable(
    "qdona1", "registered as a blood or plasma donor", donor_status
  )

  if (wave == "I") {
    engine$label_variable(
      "qdona2", "ever registered as a blood or plasma donor",
      c("na, see IQDONA1" = -2, donor_status[donor_status != -1])
    )
    year_missing <- c("na, see IQDONA2" = -2, "na, asked" = -1)
    engine$label_variable(
      "qdona3", "former blood or plasma donor: until which year registered",
      year_missing, force_numeric = TRUE
    )
    engine$label_variable(
      "qdona4", "former blood or plasma donor: reason stopped",
      c(
        year_missing,
        "disapproved based on age" = 1,
        "disapproved for health reasons" = 2,
        "no time anymore" = 3, "not interested anymore" = 4,
        "other reason" = 5
      )
    )
    engine$label_variable(
      "qdona5", "former blood or plasma donor: from which year first registration",
      year_missing, force_numeric = TRUE
    )
    engine$label_variable(
      "qdona6", "current blood or plasma donor: how often donation past 12 months",
      c(
        "na, see IQDONA1" = -2, "na, asked" = -1,
        "more than once a month" = 1, "once a month" = 2,
        "2-3 times" = 3, "once" = 4, "not at all" = 5,
        "R does not know" = 6
      )
    )
    engine$label_variable(
      "qdona7", "received form from ministry about organ donation",
      c(
        "na, asked" = -1, "yes" = 1, "no" = 2,
        "R does not know anymore" = 3
      )
    )
    engine$label_variable(
      "qdona8", "decision about organ donation",
      c("na, see IQDONA7" = -2, "na, asked" = -1, organ_decision)
    )
  } else {
    engine$label_variable(
      "qdona1_2", "New donor law: returned form about organ donation",
      c("na, asked" = -1, "yes" = 1, "no" = 2, "do not know" = 3)
    )
    engine$label_variable(
      "qdona1_3", "Previous decision about organ donation",
      c("na, see JQDONA1_2" = -2, "na, asked" = -1, organ_decision)
    )
    engine$label_variable(
      "qdona1_4", "Choice changed since the new donor law",
      c(
        "na, see JQDONA1_2" = -2, "na, asked" = -1,
        "yes" = 1, "no" = 2
      )
    )
    engine$label_variable(
      "qdona1_5", "Current decision about organ donation",
      c("na, see JQDONA1_4" = -2, "na, asked" = -1, organ_decision)
    )
  }

  engine$finalize()
}
