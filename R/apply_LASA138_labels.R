# Apply LASA 138 (Religiousness) SPSS variable and value labels
#
# Source: LASA138_varinfo.pdf (04-Oct-2012)

#' Apply LASA138 (Religiousness) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the six religiousness items documented in
#' LASAE138: life after death, heaven, hell, the devil, Adam and Eve, and the
#' Bible as the word of God.
#'
#' Every item uses no answer (-1), yes (1), and no (2). The orthodoxy scale
#' score shown in the source PDF belongs to the separate LASA338 scale-score
#' file and is intentionally not labelled here.
#'
#' LASA138 is documented only for wave E and all six variables are
#' categorical. `to_factor = TRUE` converts them to factors; `to_numeric` is
#' retained for the shared parameter contract but does not change them.
#' Column matching tries an explicit `name_corrections` override, an exact
#' match, then a case-insensitive exact match. Standardized naming optionally
#' removes the wave prefix, standardizes `respnr`, and adds `LASA_wave` while
#' preserving original SPSS labels and values.
#'
#' @param data A data frame or tibble imported from a LASAE138 `.sav` file,
#'   for example via [haven::read_sav()], containing any of `eqreli02`
#'   through `eqreli07`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. LASA138 is documented only for `"E"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (`qreli02` through `qreli07`) to actual
#'   column names in `data`.
#' @param to_factor Logical. If `TRUE`, the categorical religiousness items
#'   are converted to factors using the documented response labels.
#' @param to_numeric Logical. Retained for the shared parameter contract.
#'   LASA138 contains no numeric count or continuous variables, so it does not
#'   change the documented items.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column containing `"E"` is inserted
#'   immediately after the respondent-number column.
#'
#' @return `data`, with LASA138 variable/value labels, optional factor
#'   conversion and standardized naming, preserved original SPSS coding, the
#'   `LASA_wave` provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, eqreli02 = c(1, 2), eqreli07 = c(-1, 1))
#' dat <- apply_lasa138_labels(dat, wave = "E", to_factor = TRUE)
#' attr(dat$eqreli02, "labels")
apply_lasa138_labels <- function(data,
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
  if (wave != "E") {
    stop("Unknown LASA 138 wave: ", wave, ". Use: E.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = "e",
    fn_name = "apply_lasa138_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  item_labels <- c(
    "Life after death", "Heaven", "Hell", "Devil", "Adam and Eve",
    "Bible as word God"
  )
  response_values <- c("no answer" = -1, "yes" = 1, "no" = 2)

  for (i in seq_along(item_labels)) {
    engine$label_variable(
      sprintf("qreli%02d", i + 1L),
      item_labels[[i]],
      response_values,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
