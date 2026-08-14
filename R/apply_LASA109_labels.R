# Apply LASA 109 (care and contacts with caregivers) SPSS labels
#
# Source: LASA109_varinfo.pdf (24-Jan-2024)

#' Apply LASA109 (Care and contacts with caregivers) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the 13 perceived-control-in-health-care items
#' documented in LASA109 for waves I, J, and K.
#'
#' Items 05--15 cover recognizing care needs, finding and arranging care,
#' navigating organizations and appointments, and communicating with health
#' professionals. Items 17 and 18 cover managing medication and following
#' recommendations. All items use a five-point agreement scale; items 17 and
#' 18 additionally include code 6 for not applicable.
#'
#' All LASA109 variables are categorical. `to_numeric` is accepted for the
#' shared interface but does not convert them. With `to_factor = TRUE`,
#' matched variables become factors and observed unlabelled codes remain
#' numeric-text levels.
#'
#' Column matching tries an explicit `name_corrections` override, an exact
#' case-sensitive name, then a case-insensitive exact name. Matched fields
#' preserve their original SPSS coding in `original_labels` and
#' `original_values`. Requested standardization removes the wave prefix,
#' standardizes `respnr`, and inserts `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA109 `.sav` file.
#'   Names use the wave prefix followed by `qpchc05` through `qpchc15`,
#'   `qpchc17`, or `qpchc18`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (for example `qpchc05` or `qpchc18`) to
#'   actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, matched variables are converted to
#'   factors using the documented labels; observed unlabelled codes remain
#'   numeric-text levels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA109 has
#'   no variables eligible for numeric conversion.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes, `respnr` is standardized, and
#'   `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched names have their wave
#'   prefix removed and a `LASA_wave` column is inserted immediately after
#'   the respondent-number column.
#'
#' @return `data`, with LASA109 labels, optional factor conversion and name
#'   standardization, preserved original SPSS coding, the `LASA_wave`
#'   provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(iqpchc05 = c(1, 3, 5), iqpchc17 = c(1, 5, 6))
#' dat <- apply_lasa109_labels(dat, wave = "I")
#' attr(dat$iqpchc17, "labels")
apply_lasa109_labels <- function(data,
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
  if (!wave %in% c("I", "J", "K")) {
    stop(
      "Unknown LASA 109 wave: ", wave, ". Use one of: I, J, K.",
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
    fn_name = "apply_lasa109_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  agreement <- c(
    "no answer" = -1,
    "strongly disagree" = 1,
    "disagree" = 2,
    "no (dis)agreement" = 3,
    "agree" = 4,
    "strongly agree" = 5
  )
  agreement_na <- c(agreement, "not applicable" = 6)
  item_labels <- c(
    `05` = paste0(
      "Perceived control in health care: I know when it is time to call in care"
    ),
    `06` = paste0(
      "Perceived control in health care: I can find information about health ",
      "or care when I need it"
    ),
    `07` = paste0(
      "Perceived control in health care: I will find out if there are any ",
      "aids or services I could really use"
    ),
    `08` = paste0(
      "Perceived control in health care: I know where to apply for care, aids ",
      "or services"
    ),
    `09` = paste0(
      "Perceived control in health care: I am able to arrange any care, aids ",
      "or services I need"
    ),
    `10` = paste0(
      "Perceived control in health care: I understand the regulations of care ",
      "organisations that are relevant for me"
    ),
    `11` = paste0(
      "Perceived control in health care: I can manage to get to my healthcare ",
      "professional(s) when I need to"
    ),
    `12` = paste0(
      "Perceived control in health care: I can keep track of all appointments ",
      "with my healthcare professional(s)"
    ),
    `13` = paste0(
      "Perceived control in health care: I explain what is going on to my ",
      "healthcare professional(s)"
    ),
    `14` = paste0(
      "Perceived control in health care: I ask any questions I have about my ",
      "health or treatment"
    ),
    `15` = "Perceived control in health care: I indicate any wishes I have",
    `17` = paste0(
      "Perceived control in health care: I can deal with the medication I am ",
      "prescribed by my healthcare professional(s)"
    ),
    `18` = paste0(
      "Perceived control in health care: I am able to carry out the ",
      "recommendations I am prescribed by my healthcare professional(s)"
    )
  )

  for (item in names(item_labels)) {
    response <- if (item %in% c("17", "18")) agreement_na else agreement
    engine$label_variable(
      paste0("qpchc", item), unname(item_labels[[item]]), response,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
