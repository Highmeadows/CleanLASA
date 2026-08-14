# Apply LASA 604 ([PROXY] vision and hearing) SPSS labels
#
# Source: LASA604_varinfo.pdf (21-Mar-2024)

#' Apply LASA604 ([PROXY] vision and hearing) SPSS labels
#'
#' Attaches the variable and value labels documented for LASA604 proxy
#' telephone-interview data. Waves C, D, and E contain two questions about
#' change in vision and hearing during the previous three years. Waves F
#' through K contain six questions about glasses, hearing aids, reading small
#' print, and following a conversation. Codes 5 for not using an aid are
#' documented only in waves H through K.
#'
#' Matching uses an explicit `name_corrections` entry, an exact match, then a
#' case-insensitive exact match. `to_factor = TRUE` converts labelled
#' categorical variables to factors while retaining observed undocumented
#' codes. LASA604 contains no codebook-numeric variables, so `to_numeric`
#' does not alter its documented categorical variables. Original values and
#' labels remain available in `original_values` and `original_labels`
#' attributes.
#'
#' @param data A data frame or tibble imported from a LASA604 `.sav` file.
#' @param wave Character scalar: `"C"`, `"D"`, `"E"`, `"F"`, `"G"`, `"H"`,
#'   `"I"`, `"J"`, or `"K"`; matching is case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix to actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors.
#' @param to_numeric Logical. Convert eligible codebook-numeric variables to
#'   plain numeric; LASA604 has no such variables.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove the wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes from matched names and
#'   add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA604 metadata, optional conversions and renaming, a
#'   `LASA_wave` attribute, and a `label_report` matching audit.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, ctpsight = c(3, 4), ctphear = c(3, 5))
#' apply_lasa604_labels(dat, wave = "C")
apply_lasa604_labels <- function(data,
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
      "Unknown LASA 604 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa604_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  if (wave %in% c("C", "D", "E")) {
    change_labels <- c(
      "much better" = 1,
      "better" = 2,
      "the same" = 3,
      "worse" = 4,
      "much worse" = 5
    )
    label_variable(
      "tpsight", "Senses: change visus last 3 years",
      c("asked, no answer" = -1, change_labels), FALSE
    )
    label_variable(
      "tphear", "Senses: change hearing last 3 years",
      c("does not know" = -1, change_labels), FALSE
    )
  } else {
    yes_no <- c("na, asked" = -1, "no" = 1, "yes" = 2)
    difficulty <- c(
      "na, asked" = -1,
      "yes, without difficulty" = 1,
      "yes, with some difficulty" = 2,
      "yes, with much difficulty" = 3,
      "no, R cannot" = 4
    )

    label_variable(
      "tpsen01", "R usually wears glasses or contactlenses", yes_no, FALSE
    )
    label_variable(
      "tpsen03", "Small print in paper without glasses (or contactlenses)",
      difficulty, FALSE
    )
    sight_with_aid <- c("na, see F/G/H/I/J/KTPSEN03" = -2, difficulty)
    if (wave %in% c("H", "I", "J", "K")) {
      sight_with_aid <- c(sight_with_aid, "R does not use aid" = 5)
    }
    label_variable(
      "tpsen04", "Small print in paper with glasses or other aid",
      sight_with_aid, FALSE
    )
    label_variable("tpsen07", "R usually wears hearing aid", yes_no, FALSE)
    label_variable(
      "tpsen09", "Follow conversation 3 or 4 persons: without hearing aid",
      difficulty, FALSE
    )
    hearing_with_aid <- c("na, see F/G/H/I/J/KTPSEN09" = -2, difficulty)
    if (wave %in% c("H", "I", "J", "K")) {
      hearing_with_aid <- c(
        hearing_with_aid,
        "R does not have a hearing aid" = 5
      )
    }
    label_variable(
      "tpsen10", "Follow conversation 3 or 4 persons: with hearing aid",
      hearing_with_aid, FALSE
    )
  }

  engine$finalize()
}
