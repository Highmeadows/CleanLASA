# Apply LASA 146 (last wishes) SPSS labels
#
# Source: LASA146_varinfo.pdf (09-Aug-2017)

#' Apply LASA146 (Last wishes) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the eleven last-wishes items documented for
#' LASA146. The items concern dependence, treatment decisions, support,
#' companionship, the moment of dying, preferred place of death, and an
#' other-wish indicator.
#'
#' LASA146 is documented only for wave F. Items 1 through 10 use a five-point
#' agreement scale with `-1` for no answer. Item 11 records whether another
#' wish was mentioned, using 0/1 plus the same `-1` no-answer code.
#'
#' Column matching tries, in order: an explicit `name_corrections` override,
#' an exact case-sensitive match, and a case-insensitive exact match.
#' `to_factor = TRUE` converts matched categorical items to factors while
#' retaining observed unlabelled codes as numeric-text levels. LASA146 has no
#' numeric variables eligible for `to_numeric` conversion. Original values
#' and labels are preserved in `original_values` and `original_labels`.
#'
#' @param data A data frame or tibble imported from a LASA146 `.sav` file,
#'   for example via [haven::read_sav()].
#' @param wave Character scalar identifying LASA wave `"F"`; matching is
#'   case-insensitive.
#' @param name_corrections Optional named character vector. Names are
#'   canonical suffixes without the wave prefix (for example `qdecf01`) and
#'   values are actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors
#'   using their documented value labels.
#' @param to_numeric Logical. Accepted for the shared interface; LASA146 has
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
#'   FQDECF01 = c(-1, 1, 5),
#'   fqdecf11 = c(-1, 0, 1)
#' )
#' dat <- apply_lasa146_labels(dat, wave = "F")
#' attr(dat$FQDECF01, "labels")
apply_lasa146_labels <- function(data,
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
  if (wave != "F") {
    stop("Unknown LASA 146 wave: ", wave, ". Use: F.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = "f",
    fn_name = "apply_lasa146_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  agreement_labels <- c(
    "no answer" = -1,
    "strongly disagree" = 1,
    "disagree" = 2,
    "no agreement/disagreement" = 3,
    "agree" = 4,
    "strongly agree" = 5
  )

  item_labels <- c(
    "if I die, I hope: not to be dependent upon others",
    "if I die, I hope: to self decide about treatment",
    "if I die, I hope: to receive help from family",
    "if I die, I hope: to receive help from volunteers or caretakers",
    "if I die, I hope: not to be alone",
    "if I die, I hope: to self decide about moment of dying",
    "if I die, I hope: to be at home",
    "if I die, I hope: to be in a hospice",
    "if I die, I hope: to be in a nursing home",
    "if I die, I hope: to be in a hospital"
  )

  for (i in seq_along(item_labels)) {
    engine$label_variable(
      sprintf("qdecf%02d", i), item_labels[[i]], agreement_labels,
      force_numeric = FALSE
    )
  }

  engine$label_variable(
    "qdecf11",
    "if I die, I hope: something else",
    c("no answer" = -1, "not mentioned" = 0, "mentioned" = 1),
    force_numeric = FALSE
  )

  engine$finalize()
}
