# Apply LASA 606 ([PROXY] depressive affect) SPSS labels
#
# Source: LASA606_varinfo.pdf (16-Mar-2022)

#' Apply LASA606 ([PROXY] depressive affect) SPSS labels
#'
#' Attaches the variable and value labels documented for LASA606 proxy
#' telephone-interview data in waves C, D, and E. Each wave contains four
#' depressive-affect items scored from rarely or never (0) to mostly or
#' always (3), followed by the depressive-affect total score.
#'
#' Matching uses an explicit `name_corrections` entry, an exact match, then a
#' case-insensitive exact match. `to_factor = TRUE` converts the four
#' categorical items to factors while retaining observed undocumented codes.
#' `to_numeric = TRUE` restores the total score to plain numeric and replaces
#' its documented negative missing code with `NA`. Original values and labels
#' remain available in `original_values` and `original_labels` attributes.
#'
#' @param data A data frame or tibble imported from a LASA606 `.sav` file.
#' @param wave Character scalar: `"C"`, `"D"`, or `"E"`; matching is
#'   case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix to actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors.
#' @param to_numeric Logical. Convert the eligible depressive-affect score to
#'   plain numeric and replace its negative missing code with `NA`.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove the wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes from matched names and
#'   add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA606 metadata, optional conversions and renaming, a
#'   `LASA_wave` attribute, and a `label_report` matching audit.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, ctpces01 = c(0, 2), ctpcedep = c(-1, 5))
#' apply_lasa606_labels(dat, wave = "C")
apply_lasa606_labels <- function(data,
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
  waves <- c("C", "D", "E")
  if (!wave %in% waves) {
    stop(
      "Unknown LASA 606 wave: ", wave, ". Use one of: ",
      paste(waves, collapse = ", "), ".",
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
    fn_name = "apply_lasa606_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  item_labels <- c(
    "asked, no answer" = -1,
    "rarely or never" = 0,
    "some of the time" = 1,
    "occasionally" = 2,
    "mostly or always" = 3
  )
  label_variable("tpces01", "Last week: bothered", item_labels, FALSE)
  label_variable("tpces06", "Last week: depressive", item_labels, FALSE)
  label_variable("tpces14", "Last week: lonely", item_labels, FALSE)
  label_variable("tpces10", "Last week: fearful", item_labels, FALSE)
  label_variable(
    "tpcedep", "Telephone interview: depressive affect low-high",
    c("missing values" = -1), TRUE
  )

  engine$finalize()
}
