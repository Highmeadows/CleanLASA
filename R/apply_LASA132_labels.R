# Apply LASA 132 (filial obligations expectation) SPSS labels
#
# Source: LASA132_varinfo.pdf (14-Jun-2022)

#' Apply LASA132 (Filial obligations expectation) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the 16 filial-obligation
#' expectation items documented in LASA132 for waves D, E, and J.
#'
#' The items address expectations that children live nearby, help during
#' illness or financially, maintain contact, accept responsibility, spend
#' time together, provide personal support and advice, check in, help, and
#' care. All use the same strongly-disagree--strongly-agree scale. The
#' aggregate score in the separate LASA332 file is outside this function's
#' scope.
#'
#' All LASA132 variables are categorical. `to_numeric` is accepted for
#' interface consistency but does not convert them. `to_factor = TRUE`
#' converts matched variables using the documented value labels.
#'
#' Matching tries `name_corrections`, an exact case-sensitive match, and then
#' a case-insensitive exact match. Original SPSS coding is preserved;
#' standardized naming removes the wave prefix and can add `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA132 `.sav` file.
#'   Expected names are wave-prefixed forms of `qfioe01`--`qfioe16`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"D"`, `"E"`, or `"J"`.
#' @param name_corrections Optional named character vector mapping suffixes
#'   without the wave prefix (for example `qfioe01`) to actual names in
#'   `data`.
#' @param to_factor Logical. If `TRUE`, matched variables are converted to
#'   factors using the documented labels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA132 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. If `TRUE`, matched names and `respnr` are
#'   standardized and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched names lose the wave prefix
#'   and a `LASA_wave` column is inserted after `respnr`.
#'
#' @return `data`, with LASA132 labels, requested conversion or renaming,
#'   preserved original coding, `LASA_wave` provenance, and a `label_report`.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(dqfioe01 = c(1, 5), dqfioe16 = c(2, 4))
#' dat <- apply_lasa132_labels(dat, wave = "D", to_factor = TRUE)
#' attr(dat$dqfioe01, "labels")
apply_lasa132_labels <- function(data,
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
  if (!wave %in% c("D", "E", "J")) {
    stop(
      "Unknown LASA 132 wave: ", wave, ". Use one of: D, E, J.",
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
    fn_name = "apply_lasa132_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  response <- c(
    "no answer" = -1, "strongly disagree" = 1, "disagree" = 2,
    "no agreement/disagreement" = 3, "agree" = 4,
    "strongly agree" = 5
  )
  item_text <- c(
    "live", "sick", "financial", "visit", "phone", "responsible",
    "together", "personal", "support", "time", "need", "advise", "work",
    "check", "help", "care"
  )
  for (i in seq_along(item_text)) {
    engine$label_variable(
      sprintf("qfioe%02d", i),
      paste0("Fil Obl Exp ", sprintf("%02d", i), ": ", item_text[[i]]),
      response
    )
  }

  engine$finalize()
}
