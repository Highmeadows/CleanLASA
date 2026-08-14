# Apply LASA 197 (Awareness of Age-Related Change) SPSS labels
#
# Source: LASA197_varinfo.pdf (19-Mar-2024)

#' Apply LASA197 (Awareness of Age-Related Change) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the ten AARC-SF items
#' documented for LASA197 in wave K. The items cover age-related gains and
#' losses in relationships, cognition, health awareness, activities,
#' knowledge, energy, priorities, dependence, freedom, and motivation. All
#' use the documented five-level response scale plus the `-1` not-asked code.
#'
#' Matching tries `name_corrections`, an exact match, and a case-insensitive
#' exact match. `to_factor = TRUE` converts matched items to factors while
#' keeping observed undocumented codes. LASA197 has no variables eligible for
#' `to_numeric`. Original SPSS values and labels are preserved. Standardized
#' naming removes the wave prefix, standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA197 `.sav` file.
#' @param wave Character scalar identifying wave `"K"`, case-insensitively.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes such as `maarc1` to actual columns in `data`.
#' @param to_factor Logical. Convert labelled categorical items to factors.
#' @param to_numeric Logical. Accepted for the shared interface; LASA197 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. Standardize names and `respnr`, remove
#'   wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA197 metadata, optional conversion and renaming, the
#'   `LASA_wave` attribute, and a `label_report` audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, KMAARC1 = c(-1, 1), kmaarc10 = c(2, 5))
#' apply_lasa197_labels(dat, wave = "K")
apply_lasa197_labels <- function(data,
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
  if (wave != "K") {
    stop("Unknown LASA 197 wave: ", wave, ". Use K.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = "k",
    fn_name = "apply_lasa197_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  response_labels <- c(
    "na, asked" = -1,
    "not at all" = 1,
    "a little" = 2,
    "moderately" = 3,
    "quite a bit" = 4,
    "very much" = 5
  )
  item_labels <- c(
    "AARC: I appreciate relationships and people much more",
    "AARC: my mental capacity is declining",
    "AARC: I pay more attention to my health",
    "AARC: I have to limit my activities",
    "AARC: I have more experience and knowledge to evaluate things and people",
    "AARC: I have less energy",
    "AARC: I have a better sense of what is important to me",
    "AARC: I feel more dependent on the help of others",
    "AARC: I have more freedom to live my days the way I want",
    "AARC: I find it harder to motivate myself"
  )

  for (i in seq_along(item_labels)) {
    engine$label_variable(
      paste0("maarc", i), item_labels[[i]], response_labels,
      force_numeric = FALSE
    )
  }
  engine$finalize()
}
