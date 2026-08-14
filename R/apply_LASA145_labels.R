# Apply LASA 145 (body shape) SPSS labels
#
# Source: LASA145_varinfo.pdf (08-Feb-2022)

#' Apply LASA145 (Body shape) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the perceived-body-shape variables documented for
#' LASA145. These cover current and ideal silhouettes, plus recalled body shape
#' at age 40 where that item was collected.
#'
#' LASA145 is documented for waves F, G, 3B, and MB. Waves F and G contain
#' current and ideal body shape; wave 3B additionally contains body shape at
#' age 40. The MB medical-interview file contains current body shape and body
#' shape at age 40, using the documented `bm` prefix. Every item uses silhouette
#' codes 1 through 9 and the `-1` no-valid-data code. The discrepancy score
#' shown in the same codebook belongs to filecode LASA345 and is not included.
#'
#' Column matching tries, in order: an explicit `name_corrections` override,
#' an exact case-sensitive match, and a case-insensitive exact match.
#' `to_factor = TRUE` converts matched silhouette variables to factors while
#' retaining observed unlabelled codes as numeric-text levels. LASA145 has no
#' numeric variables eligible for `to_numeric` conversion. Original values and
#' value labels are preserved in `original_values` and `original_labels`.
#'
#' @param data A data frame or tibble imported from a LASA145 `.sav` file,
#'   for example via [haven::read_sav()].
#' @param wave Character scalar identifying the LASA wave. One of `"F"`,
#'   `"G"`, `"3B"`, or `"MB"`; matching is case-insensitive.
#' @param name_corrections Optional named character vector. Names are
#'   canonical suffixes without a wave prefix (for example `qcshape`) and
#'   values are actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors
#'   using their documented value labels.
#' @param to_numeric Logical. Accepted for the shared interface; LASA145 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. Rename matched columns to lowercase
#'   suffixes without the wave prefix, standardize the respondent-number
#'   column to `respnr`, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove the wave prefix from matched column
#'   names and add `LASA_wave`. Always enabled by `standardize_names = TRUE`.
#'
#' @return `data` with documented metadata applied, optional conversion and
#'   renaming, a `LASA_wave` attribute, and a matching audit in the
#'   `label_report` attribute.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   FQCSHAPE = c(-1, 1, 9),
#'   fqishape = c(1, 5, 9)
#' )
#' dat <- apply_lasa145_labels(dat, wave = "F")
#' attr(dat$FQCSHAPE, "labels")
apply_lasa145_labels <- function(data,
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
  wave_prefix <- c(F = "f", G = "g", `3B` = "b", MB = "bm")
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 145 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa145_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  silhouette_labels <- c(
    "no valid data" = -1,
    "silhouette 1 (extremely thin)" = 1,
    "silhouette 2" = 2,
    "silhouette 3" = 3,
    "silhouette 4" = 4,
    "silhouette 5" = 5,
    "silhouette 6" = 6,
    "silhouette 7" = 7,
    "silhouette 8" = 8,
    "silhouette 9 (very large)" = 9
  )

  if (wave == "MB") {
    specs <- list(
      list("cshape", "current body shape"),
      list("shap40", "Body shape at 40")
    )
  } else {
    specs <- list(
      list("qcshape", "current body shape"),
      list("qishape", "ideal body shape")
    )
    if (wave == "3B") {
      specs[[length(specs) + 1L]] <- list("qshap40", "Body shape at 40")
    }
  }

  for (item in specs) {
    engine$label_variable(
      item[[1L]], item[[2L]], silhouette_labels, force_numeric = FALSE
    )
  }

  engine$finalize()
}
