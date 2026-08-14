# Apply LASA 130 (social desirability) SPSS labels
#
# Source: LASA130_varinfo.pdf (03-Oct-2012)

#' Apply LASA130 (Social desirability) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the five social-
#' desirability items documented in LASA130 for waves C and F.
#'
#' The items address courteous behaviour, profiting from others, getting even,
#' annoyance, and listening well. All use the same certainly-true through
#' certainly-not-true response scale. The derived score stored in the separate
#' LASA330 file is intentionally outside this function's scope.
#'
#' All LASA130 variables are categorical. `to_numeric` is accepted for
#' interface consistency but does not convert them. With `to_factor = TRUE`,
#' matched variables become factors using the documented value labels.
#'
#' Matching tries `name_corrections`, an exact case-sensitive match, and then
#' a case-insensitive exact match. Original SPSS coding is preserved;
#' standardized naming removes the wave prefix and can add `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA130 `.sav` file.
#'   Expected names are `cqsocd1`--`cqsocd5` or `fqsocd1`--`fqsocd5`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"C"` or `"F"`.
#' @param name_corrections Optional named character vector mapping suffixes
#'   without the wave prefix (for example `qsocd1`) to actual names in `data`.
#' @param to_factor Logical. If `TRUE`, matched variables are converted to
#'   factors using the documented labels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA130 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. If `TRUE`, matched names and `respnr` are
#'   standardized and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched names lose the wave prefix
#'   and a `LASA_wave` column is inserted after `respnr`.
#'
#' @return `data`, with LASA130 labels, requested conversion or renaming,
#'   preserved original coding, `LASA_wave` provenance, and a `label_report`.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(cqsocd1 = c(1, 5), cqsocd2 = c(2, 4))
#' dat <- apply_lasa130_labels(dat, wave = "C", to_factor = TRUE)
#' attr(dat$cqsocd1, "labels")
apply_lasa130_labels <- function(data,
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
  if (!wave %in% c("C", "F")) {
    stop(
      "Unknown LASA 130 wave: ", wave, ". Use one of: C, F.",
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
    fn_name = "apply_lasa130_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  response <- c(
    "no valid data" = -1, "certainly true" = 1, "true" = 2,
    "do not know" = 3, "not true" = 4, "certainly not true" = 5
  )
  item_labels <- c(
    "social des. 1: always courteous", "social des. 2: profited",
    "social des. 3: get even", "social des. 4: annoyed",
    "social des. 5: listen good"
  )
  for (i in seq_along(item_labels)) {
    engine$label_variable(paste0("qsocd", i), item_labels[[i]], response)
  }

  engine$finalize()
}
