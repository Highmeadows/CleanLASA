# Apply LASA 607 ([PROXY] cognition, IQCODE) SPSS labels
#
# Source: LASA607_varinfo.pdf (26-Mar-2024)

#' Apply LASA607 ([PROXY] cognition, IQCODE) SPSS labels
#'
#' Attaches the variable and value labels documented for the six LASA607
#' Informant Questionnaire on Cognitive Decline (IQCODE) items and their total
#' score in waves C through K. Items range from much better (1) to much worse
#' (5). The score is documented as low at its minimum (nominally 6) and much
#' decline at its maximum (nominally 30), with endpoints depending on the
#' specific sample and wave; only its fixed missing code is attached as a
#' value label.
#'
#' Matching uses an explicit `name_corrections` entry, an exact match, then a
#' case-insensitive exact match. `to_factor = TRUE` converts the six
#' categorical items to factors while retaining observed undocumented codes.
#' `to_numeric = TRUE` restores the total score to plain numeric and replaces
#' its documented negative missing code with `NA`. Original values and labels
#' remain available in `original_values` and `original_labels` attributes.
#'
#' @param data A data frame or tibble imported from a LASA607 `.sav` file.
#' @param wave Character scalar from `"C"` through `"K"`; matching is
#'   case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix to actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors.
#' @param to_numeric Logical. Convert the eligible IQCODE total score to plain
#'   numeric and replace its negative missing code with `NA`.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove the wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes from matched names and
#'   add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA607 metadata, optional conversions and renaming, a
#'   `LASA_wave` attribute, and a `label_report` matching audit.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, ctpcogd1 = c(3, 4), ctpcogdc = c(-1, 18))
#' apply_lasa607_labels(dat, wave = "C")
apply_lasa607_labels <- function(data,
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
  waves <- LETTERS[3:11]
  if (!wave %in% waves) {
    stop(
      "Unknown LASA 607 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa607_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  change_labels <- c(
    "does not know" = -1,
    "much better" = 1,
    "a bit better" = 2,
    "not changed" = 3,
    "a bit worse" = 4,
    "much worse" = 5
  )
  item_labels <- c(
    "Cognition: talks",
    "Cognition: remembering addresses",
    "Cognition: familiar machines",
    "Cognition: decisions",
    "Cognition: handling money",
    "Cognition: financial affairs"
  )
  for (i in seq_along(item_labels)) {
    label_variable(paste0("tpcogd", i), item_labels[[i]], change_labels, FALSE)
  }
  label_variable(
    "tpcogdc", "Informant questionnaire of cognitive decline",
    c("missing values" = -1), TRUE
  )

  engine$finalize()
}
