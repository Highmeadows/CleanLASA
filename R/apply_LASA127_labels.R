# Apply LASA 127 (end-of-life decisions) SPSS labels
#
# Source: LASA127_varinfo.pdf (31-Jan-2024)

#' Apply LASA127 (End-of-life decisions) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the five end-of-life
#' decision variables documented in LASA127 for waves I, J, and K.
#'
#' The items cover lifetime thoughts about death, lifetime wishes for death,
#' wishes to live and to die during the past week, and the balance between
#' reasons for living and dying. The PDF notes that these are a subset of
#' medical-interview items asked in wave F under the separate LASA195 file;
#' those LASA195 variables are not combined here.
#'
#' All five LASA127 variables are categorical. `to_numeric` is accepted for
#' interface consistency but does not convert them. `to_factor = TRUE`
#' converts matched items using their documented value labels.
#'
#' Matching tries `name_corrections`, an exact case-sensitive match, and then
#' a case-insensitive exact match. Original SPSS coding is preserved;
#' standardized naming removes the wave prefix and can add `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA127 `.sav` file.
#'   Expected names run from `iqeol07`--`iqeol11`, with corresponding `j` or
#'   `k` prefixes in later waves.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector mapping suffixes
#'   without the wave prefix (for example `qeol07` or `qeol11`) to actual
#'   names in `data`.
#' @param to_factor Logical. If `TRUE`, matched variables are converted to
#'   factors using the documented labels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA127 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. If `TRUE`, matched names and `respnr` are
#'   standardized and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched names lose the wave prefix
#'   and a `LASA_wave` column is inserted after `respnr`.
#'
#' @return `data`, with LASA127 labels, requested conversion or renaming,
#'   preserved original coding, `LASA_wave` provenance, and a `label_report`.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(iqeol07 = c(1, 2), iqeol09 = c(1, 3))
#' dat <- apply_lasa127_labels(dat, wave = "I", to_factor = TRUE)
#' attr(dat$iqeol07, "labels")
apply_lasa127_labels <- function(data,
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
      "Unknown LASA 127 wave: ", wave, ". Use one of: I, J, K.",
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
    fn_name = "apply_lasa127_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  thoughts <- c(
    "na, asked" = -1, "yes" = 1, "no" = 2, "R does not know" = 3
  )
  engine$label_variable("qeol07", "ever death thoughts", thoughts)
  engine$label_variable("qeol08", "ever death wishes", thoughts)
  engine$label_variable(
    "qeol09", "feelings towards living past week",
    c(
      "na, asked" = -1, "a moderate to strong wish to live" = 1,
      "a weak wish to live" = 2, "no wish to live" = 3
    )
  )
  engine$label_variable(
    "qeol10", "feelings towards dying past week",
    c(
      "na, asked" = -1, "no wish to die" = 1,
      "a weak wish to die" = 2,
      "a moderate to strong wish to die" = 3
    )
  )
  engine$label_variable(
    "qeol11", "feelings towards reasons for living/dying",
    c(
      "na, asked" = -1, "for living outweigh those for dying" = 1,
      "about equal" = 2, "for dying outweigh those for living" = 3
    )
  )

  engine$finalize()
}
