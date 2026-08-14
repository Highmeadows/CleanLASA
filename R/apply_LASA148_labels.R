# Apply LASA 148 (medical decisions about life) SPSS labels
#
# Source: LASA148_varinfo.pdf (02-Feb-2015)

#' Apply LASA148 (Medical decisions about life) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the fifteen medical-decision variables documented
#' for LASA148. Five items identify who should decide about treatment at the
#' end of life, and ten items record treatment preferences in cancer and
#' dementia vignettes.
#'
#' LASA148 is documented only for wave G. The five decision-maker indicators
#' use the codebook's `-1`/0/`-1` map for no answer, not mentioned, and
#' mentioned, respectively. That duplicated `-1` is reproduced literally and
#' retained in `original_labels`; it is not silently corrected. The vignette
#' items use codes 1 through 4 from yes to no, plus `-1` for no answer.
#'
#' Column matching tries, in order: an explicit `name_corrections` override,
#' an exact case-sensitive match, and a case-insensitive exact match.
#' `to_factor = TRUE` converts matched categorical items to factors while
#' retaining observed unlabelled codes as numeric-text levels. Because the
#' decision-maker map assigns two texts to `-1`, factor conversion uses the
#' first documented text for that code; the full map remains available in
#' `original_labels`. LASA148 has no numeric variables eligible for
#' `to_numeric` conversion. Original values are preserved in
#' `original_values`.
#'
#' @param data A data frame or tibble imported from a LASA148 `.sav` file,
#'   for example via [haven::read_sav()].
#' @param wave Character scalar identifying LASA wave `"G"`; matching is
#'   case-insensitive.
#' @param name_corrections Optional named character vector. Names are
#'   canonical suffixes without the wave prefix (for example `qeoldt1`) and
#'   values are actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors
#'   using their documented value labels.
#' @param to_numeric Logical. Accepted for the shared interface; LASA148 has
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
#'   GQEOLDT1 = c(-1, 0, 1),
#'   gqvgcan1 = c(-1, 1, 4)
#' )
#' dat <- apply_lasa148_labels(dat, wave = "G")
#' attr(dat$GQEOLDT1, "labels")
apply_lasa148_labels <- function(data,
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
  if (wave != "G") {
    stop("Unknown LASA 148 wave: ", wave, ". Use: G.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = "g",
    fn_name = "apply_lasa148_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  decision_labels <- c(
    "EOL: dec. treatm.: R self",
    "EOL: dec. treatm.: R self after consulting GP",
    "EOL: dec. treatm.: R self and GP",
    "EOL: dec. treatm.: GP after consulting R self",
    "EOL: dec. treatm.: GP"
  )
  decision_values <- c(
    "no answer, asked" = -1,
    "not mentioned" = 0,
    "mentioned" = -1
  )
  for (i in seq_along(decision_labels)) {
    engine$label_variable(
      paste0("qeoldt", i), decision_labels[[i]], decision_values,
      force_numeric = FALSE
    )
  }

  vignette_values <- c(
    "no answer, asked" = -1,
    "yes" = 1,
    "probably yes" = 2,
    "probably not" = 3,
    "no" = 4
  )
  treatments <- c(
    "nasal gastric tube", "antibiotics", "resuscitation",
    "mechanical respiration", "euthanasia"
  )
  for (i in seq_along(treatments)) {
    engine$label_variable(
      paste0("qvgcan", i),
      paste0("vignet cancer: ", treatments[[i]]),
      vignette_values,
      force_numeric = FALSE
    )
  }
  for (i in seq_along(treatments)) {
    engine$label_variable(
      paste0("qvgdem", i),
      paste0("vignet dementia: ", treatments[[i]]),
      vignette_values,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
