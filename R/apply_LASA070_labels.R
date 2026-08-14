# Apply LASA 070 (social participation) SPSS labels
#
# Source: LASA070_varinfo.pdf (13-Jun-2022)

#' Apply LASA070 (Social participation) SPSS labels
#'
#' Attaches the variable labels and SPSS-style value-label maps documented for
#' LASA070 social-participation files. The codebook covers waves B, C, D, E,
#' 2B, F, G, H, 3B, MB, I, and J. Inventories differ substantially by wave:
#' earlier files emphasize organizational membership, visits, volunteering,
#' cultural activities, study, and age norms; later files add computer,
#' internet, mobile-phone, IT-support, and altruism items. The reduced MB file
#' contains migrant-cohort membership-composition and technology items.
#'
#' Labels, codes, routing-specific missing labels, variable order, and the
#' wave-specific omissions are reproduced from `LASA070_varinfo.pdf`. The
#' frequency codes used where the document refers to its Visit frequency table
#' are 1 (almost never) through 7 (every day). Minutes and age fields are the
#' numeric variables eligible for `to_numeric`; other documented variables are
#' categorical.
#'
#' Matching tries `name_corrections`, exact names, then case-insensitive exact
#' names. Missing documented columns are recorded in `label_report`. Conversion
#' preserves `original_labels` and `original_values`; standardized names drop
#' the wave prefix, standardize `respnr`, and optionally add `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA070 `.sav` file.
#' @param wave Character scalar identifying wave `"B"`, `"C"`, `"D"`, `"E"`,
#'   `"2B"`, `"F"`, `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, or `"J"`.
#'   Matching is case-insensitive.
#' @param name_corrections Optional named character vector. Names are canonical
#'   suffixes without a wave prefix (for example `socpyn`, `socp27`, or
#'   `sp95f1`); values are actual names in `data`.
#' @param to_factor Logical. Convert matched categorical variables to factors
#'   with documented labels; observed undocumented codes remain text levels.
#' @param to_numeric Logical. Restore matched minutes and age variables to
#'   plain numeric, replacing negative missing-reason codes with `NA`.
#' @param standardize_names Logical. Rename matched variables to lowercase
#'   canonical suffixes, standardize `respnr`, and imply wave splitting.
#' @param split_wavecode Logical. Remove matched variables' wave prefix and add
#'   a `LASA_wave` column immediately after the respondent-number column.
#'
#' @return The labelled data, with optional conversions and standardized names,
#'   preserved original coding, a `LASA_wave` attribute, and `label_report`.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, bsocpyn = c(1, 2), bsocp30 = c(-1, 60))
#' dat <- apply_lasa070_labels(dat, wave = "B")
#' attr(dat$bsocpyn, "labels")
apply_lasa070_labels <- function(data,
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
  valid_waves <- c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J")
  if (!wave %in% valid_waves) {
    stop(
      "Unknown LASA 070 wave: ", wave, ". Use: ",
      paste(valid_waves, collapse = ", "), ".",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  prefix <- switch(
    wave,
    B = "b", C = "c", D = "d", E = "e", `2B` = "b", F = "f",
    G = "g", H = "h", `3B` = "b", MB = "b", I = "i", J = "j"
  )
  branch <- switch(
    wave,
    B = "B", C = "CD", D = "CD", E = "E", `2B` = "BF", F = "BF",
    G = "G", H = "H3B", `3B` = "H3B", MB = "MB", I = "I", J = "J"
  )

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = prefix,
    fn_name = "apply_lasa070_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_maps <- list(
    c(
      "interview broken off" = -5, "no answer, short version" = -4, "no answer, wrong skip" = -3,
      "no answer, routing" = -2, "no answer, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "interview broken off" = -5, "no answer, short version" = -4, "no answer, wrong skip" = -3,
      "no answer, routing" = -2, "no answer, asked" = -1, "does not visit" = 0,
      "almost never" = 1, "a few times a year" = 2, "every month" = 3, "a few times a month" = 4,
      "every week" = 5, "a few times a week" = 6, "every day" = 7
    ),
    c(
      "interview broken off" = -5, "no answer, short version" = -4, "no answer, wrong skip" = -3,
      "no answer, routing" = -2, "no answer, asked" = -1, "does not visit" = 0, "no" = 1,
      "yes" = 2
    ),
    c(
      "interview broken off" = -5, "no answer, short version" = -4, "no answer, wrong skip" = -3,
      "no answer, routing" = -2, "no answer, asked" = -1
    ),
    c(
      "interview broken off" = -5, "no answer, short version" = -4, "no answer, wrong skip" = -3,
      "no answer, routing" = -2, "no answer, asked" = -1, "very applicable" = 1,
      "applicable" = 2, "a little applicable" = 3, "not applicable" = 4
    ),
    c(
      "interview broken off" = -5, "no answer, short version" = -4, "no answer, wrong skip" = -3,
      "no answer, routing" = -2, "no answer, asked" = -1, "agree" = 1, "disagree" = 2,
      "no opinion / do not know" = 3
    ),
    c(
      "interview broken off" = -5, "no answer, short version" = -4, "no answer, wrong skip" = -3,
      "no answer, routing" = -2, "no answer, asked" = -1, "dependent of person" = 0
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DRMSO" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCPYN" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP13" = -2, "na, asked" = -1, "- to be coded -" = 0,
      "garden & pets" = 1, "cult.hist. ass." = 2, "housing ass." = 3, "other" = 4
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP01" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP02" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP03" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP04" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP05" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP06" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP07" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP08" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP09" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP10" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP11" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP12" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP13" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP14 to 26" = -2, "na, asked" = -1,
      "does not visit" = 0, "almost never" = 1, "a few times a year" = 2, "every month" = 3,
      "a few times a month" = 4, "every week" = 5, "a few times a week" = 6, "every day" = 7
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP27" = -2, "na, asked" = -1, "does not visit" = 0,
      "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP28" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP27" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP31" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DRMSO" = -2, "na, asked" = -1, "almost never" = 1,
      "a few times a year" = 2, "every month" = 3, "a few times a month" = 4, "every week" = 5,
      "a few times a week" = 6, "every day" = 7
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DSOCP55" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see C/DRMSO" = -2, "na, asked" = -1, "agree" = 1,
      "disagree" = 2, "no opinion/don’t know" = 3
    ),
    c(
      "na, wrong skip" = 3, "na, see C/DSOCP66" = -2, "na, asked" = -1,
      "dependent on person" = 0
    ),
    c(
      "valid data" = -2, "short interview" = 1, "interview terminated" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ERMSO" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCPYN" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP13" = -2, "na, asked" = -1, "- to be coded -" = 0,
      "garden & pets" = 1, "cult.hist. ass." = 2, "housing ass." = 3, "other" = 4
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP01" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP02" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP03" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP04" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP05" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP06" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP07" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP08" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP09" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP10" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP11" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP12" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP13" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP14-26" = -2, "na, asked" = -1, "does not visit" = 0,
      "almost never" = 1, "a few times a year" = 2, "every month" = 3, "a few times a month" = 4,
      "every week" = 5, "a few times a week" = 6, "every day" = 7
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP27" = -2, "na, asked" = -1, "does not visit" = 0,
      "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP28" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP27" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP31" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see ERMSO" = -2, "na, asked" = -1, "almost never" = 1,
      "a few times a year" = 2, "every month" = 3, "a few times a month" = 4, "every week" = 5,
      "a few times a week" = 6, "every day" = 7
    ),
    c(
      "na, wrong skip" = -3, "na, see ERMSO" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP72" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP72" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP79" = -2, "na, asked" = -1, "- to be coded -" = 0
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP78" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP88" = -2, "na, asked" = -1, "- to be coded -" = 0
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP78" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see ESOCP78" = -2, "na, asked" = -1, "never" = 1, "rarely" = 2,
      "sometimes" = 3, "often" = 4
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FRMSO" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCPYN" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP13" = -2, "na, asked" = -1, "- to be coded -" = 0,
      "garden & pets" = 1, "cult.hist. ass." = 2, "housing ass." = 3, "other" = 4
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP01" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP02" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP03" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP04" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP05" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP06" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP07" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP08" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP09" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP10" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP11" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP12" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP13" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP14-26" = -2, "na, asked" = -1, "does not visit" = 0,
      "almost never" = 1, "a few times a year" = 2, "every month" = 3, "a few times a month" = 4,
      "every week" = 5, "a few times a week" = 6, "every day" = 7
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP27" = -2, "na, asked" = -1, "does not visit" = 0,
      "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP28" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP27" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP31" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP28 & 31" = -2, "na, asked" = -1,
      "very applicable" = 1, "applicable" = 2, "a little applicable" = 3, "not applicable" = 4
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCPYN,14-33" = -2, "na, asked" = -1,
      "very applicable" = 1, "applicable" = 2, "a little applicable" = 3, "not applicable" = 4
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FRMSO" = -2, "na, asked" = -1, "almost never" = 1,
      "a few times a year" = 2, "every month" = 3, "a few times a month" = 4, "every week" = 5,
      "a few times a week" = 6, "every day" = 7
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP55" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FRMSO" = -2, "na, asked" = -1, "agree" = 1,
      "disagree" = 2, "no opinion/don’t know" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP66" = -2, "na, asked" = -1,
      "dependent on person" = 0
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP72" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP72" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP79" = -2, "na, asked" = -1, "- to be coded -" = 0
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP78" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP88" = -2, "na, asked" = -1, "- to be coded -" = 0
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP78" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see B/FSOCP78" = -2, "na, asked" = -1, "never" = 1,
      "rarely" = 2, "sometimes" = 3, "often" = 4
    ),
    c(
      "na, wrong skip" = -3, "na, see GRMSO" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCPYN" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP01" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP02" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP03" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP04" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP05" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP06" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP07" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP08" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP09" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP10" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP11" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP12" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP13" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP14-26" = -2, "na, asked" = -1, "does not visit" = 0,
      "almost never" = 1, "a few times a year" = 2, "every month" = 3, "a few times a month" = 4,
      "every week" = 5, "a few times a week" = 6, "every day" = 7
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP27" = -2, "na, asked" = -1, "does not visit" = 0,
      "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP28" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP27" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP31" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP28 & 31" = -2, "na, asked" = -1,
      "very applicable" = 1, "applicable" = 2, "a little applicable" = 3, "not applicable" = 4
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCPYN,14-33" = -2, "na, asked" = -1,
      "very applicable" = 1, "applicable" = 2, "a little applicable" = 3, "not applicable" = 4
    ),
    c(
      "na, wrong skip" = -3, "na, see GRMSO" = -2, "na, asked" = -1, "almost never" = 1,
      "a few times a year" = 2, "every month" = 3, "a few times a month" = 4, "every week" = 5,
      "a few times a week" = 6, "every day" = 7
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP55" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see GRMSO" = -2, "na, asked" = -1, "agree" = 1, "disagree" = 2,
      "no opinion/don’t know" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP66" = -2, "na, asked" = -1, "dependent on person" = 0
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP72" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP72" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP79" = -2, "na, asked" = -1, "- to be coded -" = 0
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP78" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP88" = -2, "na, asked" = -1, "- to be coded -" = 0
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP78" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see GSOCP78" = -2, "na, asked" = -1, "never" = 1, "rarely" = 2,
      "sometimes" = 3, "often" = 4
    ),
    c(
      "na, wrong skip" = -3, "na, see GRMSO" = -2, "na, asked" = -1,
      "does not apply to me at all" = 1, "does not apply to me" = 2,
      "applies to me a little" = 3, "applies to me" = 4, "apllies to me entirely" = 5
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/IRMSO" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCPYN" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP01" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP02" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP03" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP04" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP05" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP06" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP07" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP08" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP09" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP10" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP11" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP12" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP13" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP14-26" = -2, "na, asked" = -1, "almost never" = 1,
      "a few times a year" = 2, "every month" = 3, "a few times a month" = 4, "every week" = 5,
      "a few times a week" = 6, "every day" = 7
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP27" = -2, "na, asked" = -1, "does not visit" = 0,
      "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP28" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP27" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP31" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/IRMSO" = -2, "na, asked" = -1, "almost never" = 1,
      "a few times a year" = 2, "every month" = 3, "a few times a month" = 4, "every week" = 5,
      "a few times a week" = 6, "every day" = 7
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP72" = -2, "not mentioned" = 0, "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP72" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP93" = -2, "not mentioned" = 0, "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP93" = -2, "na, asked" = -1, "daily" = 1,
      "a few times a week" = 2, "a few times a month" = 3, "a few times a year" = 4,
      "less than a few times a year" = 5
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP95" = -2, "not mentioned" = 0, "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISP95F6" = -2, "na, asked" = -1, "daily" = 1,
      "a few times a week" = 2, "a few times a month" = 3, "a few times a year" = 4,
      "less than a few times a year" = 5
    ),
    c(
      "na, see H/B/ISOCP72 & H/B/ISOCP93 & H/B/ISOCP95" = -2, "na, asked" = -1, "no" = 1,
      "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP97" = -2, "na, asked" = -1, "daily" = 1,
      "a few times a week" = 2, "a few times a month" = 3, "a few times a year" = 4,
      "less than a few times a year" = 5
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP97" = -2, "not mentioned" = 0, "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP55" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/IRMSO" = -2, "na, asked" = -1, "agree" = 1,
      "disagree" = 2, "no opinion/don’t know" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP66" = -2, "na, asked" = -1,
      "dependent on person" = 0
    ),
    c(
      "na, wrong skip" = -3, "na, see H/B/ISOCP68" = -2, "na, asked" = -1,
      "dependent on person" = 0
    ),
    c(
      "na, wrong skip" = -3, "na, see H/BRMSO" = -2, "na, asked" = -1, "no" = 1, "yes" = 2,
      "not allowed to vote" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see BRMSO" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see BSOCPYN" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see BSOCP01" = -2, "na, asked" = -1,
      "mainly Dutch members" = 1, "many Dutch members" = 2, "little to none Dutch members" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see BSOCP04" = -2, "na, asked" = -1,
      "mainly Dutch members" = 1, "many Dutch members" = 2, "little to none Dutch members" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see SOCP05" = -2, "na, asked" = -1, "mainly Dutch members" = 1,
      "many Dutch members" = 2, "little to none Dutch members" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see BSOCP06" = -2, "na, asked" = -1,
      "mainly Dutch members" = 1, "many Dutch members" = 2, "little to none Dutch members" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see BSOCP08" = -2, "na, asked" = -1,
      "mainly Dutch members" = 1, "many Dutch members" = 2, "little to none Dutch members" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see BSOCP09" = -2, "na, asked" = -1,
      "mainly Dutch members" = 1, "many Dutch members" = 2, "little to none Dutch members" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see BSOCP10" = -2, "na, asked" = -1,
      "mainly Dutch members" = 1, "many Dutch members" = 2, "little to none Dutch members" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see BSOCP11" = -2, "na, asked" = -1,
      "mainly Dutch members" = 1, "many Dutch members" = 2, "little to none Dutch members" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see BSOCP12" = -2, "na, asked" = -1,
      "mainly Dutch members" = 1, "many Dutch members" = 2, "little to none Dutch members" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see BSOCP13" = -2, "na, asked" = -1,
      "mainly Dutch members" = 1, "many Dutch members" = 2, "little to none Dutch members" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see JRMSO" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCPYN" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP01" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP02" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP03" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP04" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP05" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP06" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP07" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP08" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP09" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP10" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP11" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP12" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP13" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP14-26" = -2, "na, asked" = -1, "almost never" = 1,
      "a few times a year" = 2, "every month" = 3, "a few times a month" = 4, "every week" = 5,
      "a few times a week" = 6, "every day" = 7
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP27" = -2, "na, asked" = -1, "does not visit" = 0,
      "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP28" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP27" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP31" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see JRMSO" = -2, "na, asked" = -1, "almost never" = 1,
      "a few times a year" = 2, "every month" = 3, "a few times a month" = 4, "every week" = 5,
      "a few times a week" = 6, "every day" = 7
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP72" = -2, "not mentioned" = 0, "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP72" = -2, "na, asked" = -1
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP93" = -2, "not mentioned" = 0, "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP93" = -2, "na, asked" = -1, "daily" = 1,
      "a few times a week" = 2, "a few times a month" = 3, "a few times a year" = 4,
      "less than a few times a year" = 5
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP72" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP95" = -2, "not mentioned" = 0, "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see JSP95F6" = -2, "na, asked" = -1, "daily" = 1,
      "a few times a week" = 2, "a few times a month" = 3, "a few times a year" = 4,
      "less than a few times a year" = 5
    ),
    c(
      "na, see JSOCP72 & JSOCP93 & JSOCP95" = -2, "na, asked" = -1, "no" = 1, "yes" = 2
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP97" = -2, "na, asked" = -1, "daily" = 1,
      "a few times a week" = 2, "a few times a month" = 3, "a few times a year" = 4,
      "less than a few times a year" = 5
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP97" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP55" = -2, "na, asked" = -1, "not mentioned" = 0,
      "mentioned" = 1
    ),
    c(
      "na, wrong skip" = -3, "na, see JRMSO" = -2, "na, asked" = -1, "agree" = 1, "disagree" = 2,
      "no opinion/don’t know" = 3
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP66" = -2, "na, asked" = -1, "dependent on person" = 0
    ),
    c(
      "na, wrong skip" = -3, "na, see JSOCP68" = -2, "na, asked" = -1, "dependent on person" = 0
    )
  )

  specs <- switch(branch,
    B = data.frame(
      suffix = c(
        "socpyn", "socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08",
        "socp09", "socp10", "socp11", "socp12", "socp13", "socp14", "socp15", "socp16", "socp17",
        "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24", "socp25", "socp26",
        "socp27", "socp28", "socp30", "socp31", "socp33", "socp34", "socp35", "socp36", "socp37",
        "socp38", "socp39", "socp40", "socp41", "socp42", "socp43", "socp44", "socp45", "socp46",
        "socp47", "socp48", "socp49", "socpr50", "socp51", "socp52", "socp54", "socp55",
        "socp56", "socp57", "socp58", "socp59", "socp60", "socp61", "socp62", "socp63", "socp64",
        "socp65", "socp66", "socp67", "socp68", "socp69", "socp70", "socp71"
      ),
      variable_label = c(
        "Involved in association", "Association for the elderly",
        "Trade union, employers organisation", "Political party",
        "Church or religious organisation", "Neighbourhood organisation",
        "Organisation for women", "Organisation for helping the elderly",
        "Organisation with a social purpose", "Organisation for patient",
        "Organisation for singing, music or theatre", "Organisation for relaxation hobby",
        "Sportclub", "Other", "Visiting: Association for the elderly",
        "Visiting: Trade union, employers organisation", "Visiting: Political party",
        "Visiting: Church or religious organisation", "Visiting: Neighbourhood organisation",
        "Visiting: Organisation for women", "Visiting: Organisation for helping the elderly",
        "Visiting: Organisation with a social purpose", "Visiting: Organisation for patients",
        "Visiting: Organisation for singing, music or theatre",
        "Visiting: Organisation for relaxation hobby", "Visiting: Sportclub", "Visiting: Other",
        "Visiting: Organisations all", "Participation: administrative work",
        "Participation: administrative minutes (total)", "Participation: volunteers work",
        "Participation: volunteers work minutes (total)", "Reason: mentally fysically fit",
        "Reason: development own capability", "Reason: social contacts",
        "Reason: responsibility", "Reason: other", "Reason not: not interested",
        "Reason not: no time", "Reason not: not enjoyable", "Reason not: bad health",
        "Reason not: no transportation", "Reason not: fear to go on the street",
        "Reason not: other", "Cultural: museum", "Cultural: recreation", "Cultural: centrum",
        "Cultural: horeca", "Cultural: sport self", "Cultural: sport games",
        "Cultural: shopping", "Hobbies: minutes a day (total)", "Study: Yes/no",
        "Study: certified diploma", "Study: hobby", "Study: general knowledge",
        "Study: emancipation for woman", "Study: emancipation elderly", "Study: other",
        "Reason: mentally fysically fit", "Reason: development own capability",
        "Reason: social contacts", "Reason: responsibility", "Paid work: not over certain age",
        "Paid work: Age", "Volunteers work: not over certain age", "Volunteers work: Age",
        "Administrative work: not over certain age", "Administrative work: Age"
      ),
      map_id = c(
        1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
        1L, 1L, 1L, 1L, 1L, 2L, 3L, 4L, 1L, 4L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L,
        2L, 2L, 2L, 2L, 2L, 2L, 2L, 4L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 5L, 5L, 5L, 6L, 7L, 6L,
        7L, 6L, 7L
      ),
      numeric = c(
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE
      ),
      stringsAsFactors = FALSE
    ),
    CD = data.frame(
      suffix = c(
        "socpyn", "socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08",
        "socp09", "socp10", "socp11", "socp12", "socp13", "socp13x", "socp14", "socp15",
        "socp16", "socp17", "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24",
        "socp25", "socp26", "socp27", "socp28", "socp30", "socp31", "socp33", "socp46", "socp47",
        "socp48", "socp49", "socpr50", "socp51", "socp52", "socp54", "socp55", "socp56",
        "socp57", "socp58", "socp59", "socp60", "socp61", "socp66", "socp67", "rmso"
      ),
      variable_label = c(
        "Member or involved in organization", "Association/organization for the elderly",
        "Trade union, employers organisation", "Political party or organization",
        "Church or religious organisation", "Neighbourhood association",
        "Womens association, womens circle", "Organ. to assist elderly or disabled",
        "Action group or ass. with social aim", "Patients association",
        "Choir, musical society or drama club", "Hobby club or social club", "Sporting club",
        "Other", "Other: categorized", "Visiting: Org. for the elderly",
        "Visiting: Trade union, employers org.", "Visiting: Political party or org.",
        "Visiting: Church or religious org.", "Visiting: Neighbourhood association.",
        "Visiting: Womens ass. or womens circle", "Visiting: Org. to assist eld. and disabl.",
        "Visiting: Action group or ass. social aim", "Visiting: Patients association",
        "Visiting: Choir, mus.society or dramaclub", "Visiting: Hobby club or social club",
        "Visiting: Sporting club", "Visiting: Other", "Visiting: Organisations all",
        "Participation: administrative work", "Participation: adm.work in minutes/week",
        "Participation: volunteers work", "Participation: vol.work in minutes/week",
        "Cultural: cinema, museum, exhib., artgallery",
        "Cultural: trip, recreation, zoo, entertainmt", "Cultural: social cultural centrum",
        "Cultural: pub, restaurant, dancing salon", "Cultural: outdoor sporting",
        "Cultural: visiting sporting competition", "Cultural: shopping for pleasure",
        "Hobbies in and around the house min/day", "Study: Yes/no",
        "Study: qualifying education", "Study: creativity course",
        "Study: general knowledge or language", "Study: emancipation for woman",
        "Study: emancipation for elderly", "Study: other", "Paid work: not over certain age",
        "Paid work: Age", "Reason missing: Social participation"
      ),
      map_id = c(
        8L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 10L, 11L, 12L, 13L, 14L, 15L,
        16L, 17L, 18L, 19L, 20L, 21L, 22L, 23L, 24L, 25L, 26L, 27L, 28L, 29L, 29L, 29L, 29L, 29L,
        29L, 29L, 29L, 29L, 30L, 30L, 30L, 30L, 30L, 30L, 31L, 32L, 33L
      ),
      numeric = c(
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE,
        FALSE
      ),
      stringsAsFactors = FALSE
    ),
    E = data.frame(
      suffix = c(
        "socpyn", "socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08",
        "socp09", "socp10", "socp11", "socp12", "socp13", "socp13x", "socp14", "socp15",
        "socp16", "socp17", "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24",
        "socp25", "socp26", "socp27", "socp28", "socp30", "socp31", "socp33", "socp46", "socp47",
        "socp48", "socp49", "socpr50", "socp51", "socp52", "socp54", "socp55", "socp72",
        "socp73", "socp74", "socp75", "socp76", "socp77", "socp78", "socp79", "socp80", "socp81",
        "socp82", "socp83", "socp84", "socp85", "socp86", "socp87", "socp88", "socp89", "socp90",
        "socp91", "socp92", "rmso"
      ),
      variable_label = c(
        "Member or involved in organization", "Organization for the elderly",
        "Trade union, employers organization", "Political party or organization",
        "Church or religious organization", "Neighbourhood association",
        "Womens association, womens circle", "Organ. to assist elderly or disabled",
        "Action group or ass. with social aim", "Patients association",
        "Choir, musical society or drama club", "Hobby club or social club", "Sporting club",
        "Other", "Other: categorized", "Visiting: Org. for the elderly",
        "Visiting: Trade union, employers org.", "Visiting: Political party or org.",
        "Visiting: Church or religious org.", "Visiting: Neighbourhood association.",
        "Visiting: Womens ass. or womens circle", "Visiting: Org. to assist eld. and disabl.",
        "Visiting: Action group or ass. social aim", "Visiting: Patients association",
        "Visiting: Choir, mus.society or dramaclub", "Visiting: Hobby club or social club",
        "Visiting: Sporting club", "Visiting: Other", "Visiting: Organizations all",
        "Participation: administrative work", "Participation: adm.work in minutes/week",
        "Participation: volunteers work", "Participation: vol.work in minutes/week",
        "Cultural: cinema, museum, exhib., artgallery",
        "Cultural: trip, recreation, zoo, entertainmt", "Cultural: social cultural centrum",
        "Cultural: pub, restaurant, dancing salon", "Cultural: outdoor sporting",
        "Cultural: visiting sporting competition", "Cultural: shopping for pleasure",
        "Hobbies in and around the house min/day", "Study: Yes/no", "Personal computer: usage",
        "Personal computer: minutes/week", "Personal computer: wordprocessing",
        "Personal computer: administration", "Personal computer: hobbies",
        "Personal computer: games", "Personal computer: internet", "Personal computer: other",
        "Personal computer: other specified", "Internet: surfing", "Internet: email",
        "Internet: chat", "Internet: newsgroups", "Internet: discussion groups",
        "Internet: shopping", "Internet: telebanking", "Internet: other",
        "Internet: other specified", "Internet: minutes per week",
        "Internet: personal support received", "Internet: personal support given",
        "Reason missing: Social participation"
      ),
      map_id = c(
        34L, 35L, 35L, 35L, 35L, 35L, 35L, 35L, 35L, 35L, 35L, 35L, 35L, 35L, 36L, 37L, 38L, 39L,
        40L, 41L, 42L, 43L, 44L, 45L, 46L, 47L, 48L, 49L, 50L, 51L, 52L, 53L, 54L, 55L, 55L, 55L,
        55L, 55L, 55L, 55L, 56L, 34L, 34L, 57L, 58L, 58L, 58L, 58L, 58L, 58L, 59L, 60L, 60L, 60L,
        60L, 60L, 60L, 60L, 60L, 61L, 62L, 63L, 63L, 33L
      ),
      numeric = c(
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE,
        FALSE
      ),
      stringsAsFactors = FALSE
    ),
    BF = data.frame(
      suffix = c(
        "socpyn", "socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08",
        "socp09", "socp10", "socp11", "socp12", "socp13", "socp13x", "socp14", "socp15",
        "socp16", "socp17", "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24",
        "socp25", "socp26", "socp27", "socp28", "socp30", "socp31", "socp33", "socp34", "socp35",
        "socp36", "socp37", "socp38", "socp39", "socp40", "socp41", "socp42", "socp43", "socp44",
        "socp44b", "socp45", "socp46", "socp47", "socp48", "socp49", "socpr50", "socp51",
        "socp52", "socp54", "socp55", "socp56", "socp57", "socp58", "socp59", "socp60", "socp61",
        "socp66", "socp67", "socp72", "socp73", "socp74", "socp75", "socp76", "socp77", "socp78",
        "socp79", "socp80", "socp81", "socp82", "socp83", "socp84", "socp85", "socp86", "socp87",
        "socp88", "socp89", "socp90", "socp91", "socp92", "rmso"
      ),
      variable_label = c(
        "Member or involved in organization", "Organization for the elderly",
        "Trade union, employers organization", "Political party or organization",
        "Church or religious organization", "Neighbourhood association",
        "Womens association, womens circle", "Organ. to assist elderly or disabled",
        "Action group or ass. with social aim", "Patients association",
        "Choir, musical society or drama club", "Hobby club or social club", "Sporting club",
        "Other", "Other: categorized", "Visiting: Org. for the elderly",
        "Visiting: Trade union, employers org.", "Visiting: Political party or org.",
        "Visiting: Church or religious org.", "Visiting: Neighbourhood association.",
        "Visiting: Womens ass. or womens circle", "Visiting: Org. to assist eld. and disabl.",
        "Visiting: Action group or ass. social aim", "Visiting: Patients association",
        "Visiting: Choir, mus.society or dramaclub", "Visiting: Hobby club or social club",
        "Visiting: Sporting club", "Visiting: Other", "Visiting: Organizations all",
        "Participation: administrative work", "Participation: adm.work in minutes/week",
        "Participation: volunteers work", "Participation: vol.work in minutes/week",
        "Reason: mentally fysically fit", "Reason: development own capability",
        "Reason: social contacts", "Reason: responsibility", "Reason: other",
        "Reason not: not interested", "Reason not: no time", "Reason not: not enjoyable",
        "Reason not: bad health", "Reason not: no transportation",
        "Reason not: fear to go on the street", "Reason not: age too high or too old",
        "Reason not: other", "Cultural: cinema, museum, exhib., artgallery",
        "Cultural: trip, recreation, zoo, entertainmt", "Cultural: social cultural centrum",
        "Cultural: pub, restaurant, dancing salon", "Cultural: outdoor sporting",
        "Cultural: visiting sporting competition", "Cultural: shopping for pleasure",
        "Hobbies in and around the house min/day", "Study: Yes/no",
        "Study: qualifying education", "Study: creativity course",
        "Study: general knowledge or language", "Study: emancipation for woman",
        "Study: emancipation for elderly", "Study: other", "Paid work: not over certain age",
        "Paid work: age", "Personal computer: usage", "Personal computer: minutes/week",
        "Personal computer: wordprocessing", "Personal computer: administration",
        "Personal computer: hobbies", "Personal computer: games", "Personal computer: internet",
        "Personal computer: other", "Personal computer: other specified", "Internet: surfing",
        "Internet: email", "Internet: chat", "Internet: newsgroups",
        "Internet: discussion groups", "Internet: shopping", "Internet: telebanking",
        "Internet: other", "Internet: other specified", "Internet: minutes per week",
        "Internet: personal support received", "Internet: personal support given",
        "Reason missing: Social participation"
      ),
      map_id = c(
        64L, 65L, 65L, 65L, 65L, 65L, 65L, 65L, 65L, 65L, 65L, 65L, 65L, 65L, 66L, 67L, 68L, 69L,
        70L, 71L, 72L, 73L, 74L, 75L, 76L, 77L, 78L, 79L, 80L, 81L, 82L, 83L, 84L, 85L, 85L, 85L,
        85L, 85L, 86L, 86L, 86L, 86L, 86L, 86L, 86L, 86L, 87L, 87L, 87L, 87L, 87L, 87L, 87L, 87L,
        64L, 88L, 88L, 88L, 88L, 88L, 88L, 89L, 90L, 64L, 91L, 92L, 92L, 92L, 92L, 92L, 92L, 93L,
        94L, 94L, 94L, 94L, 94L, 94L, 94L, 94L, 95L, 96L, 97L, 97L, 33L
      ),
      numeric = c(
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE
      ),
      stringsAsFactors = FALSE
    ),
    G = data.frame(
      suffix = c(
        "socpyn", "socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08",
        "socp09", "socp10", "socp11", "socp12", "socp13", "socp14", "socp15", "socp16", "socp17",
        "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24", "socp25", "socp26",
        "socp27", "socp28", "socp30", "socp31", "socp33", "socp34", "socp35", "socp36", "socp37",
        "socp38", "socp39", "socp40", "socp41", "socp42", "socp43", "socp44", "socp44b",
        "socp45", "socp46", "socp47", "socp48", "socp49", "socpr50", "socp51", "socp52",
        "socp54", "socp55", "socp56", "socp57", "socp58", "socp59", "socp60", "socp61", "socp66",
        "socp67", "socp72", "socp73", "socp74", "socp75", "socp76", "socp77", "socp78", "socp79",
        "socp80", "socp81", "socp82", "socp83", "socp84", "socp85", "socp86", "socp87", "socp88",
        "socp89", "socp90", "socp91", "socp92", "altru1", "altru2", "altru3", "altru4", "altru5",
        "rmso"
      ),
      variable_label = c(
        "Member or involved in organization", "Organization for the elderly",
        "Trade union, employers organization", "Political party or organization",
        "Church or religious organization", "Neighbourhood association",
        "Womens association, womens circle", "Organ. to assist elderly or disabled",
        "Action group or ass. with social aim", "Patients association",
        "Choir, musical society or drama club", "Hobby club or social club", "Sporting club",
        "Other", "Visiting: Org. for the elderly", "Visiting: Trade union, employers org.",
        "Visiting: Political party or org.", "Visiting: Church or religious org.",
        "Visiting: Neighbourhood association.", "Visiting: Womens ass. or womens circle",
        "Visiting: Org. to assist eld. and disabl.", "Visiting: Action group or ass. social aim",
        "Visiting: Patients association", "Visiting: Choir, mus.society or dramaclub",
        "Visiting: Hobby club or social club", "Visiting: Sporting club", "Visiting: Other",
        "Visiting: Organizations all", "Participation: administrative work",
        "Participation: adm.work in minutes/week", "Participation: volunteers work",
        "Participation: vol.work in minutes/week", "Reason: mentally fysically fit",
        "Reason: development own capability", "Reason: social contacts",
        "Reason: responsibility", "Reason: other", "Reason not: not interested",
        "Reason not: no time", "Reason not: not enjoyable", "Reason not: bad health",
        "Reason not: no transportation", "Reason not: fear to go on the street",
        "Reason not: age too high or too old", "Reason not: other",
        "Cultural: cinema, museum, exhib., artgallery",
        "Cultural: trip, recreation, zoo, entertainmt", "Cultural: social cultural centrum",
        "Cultural: pub, restaurant, dancing salon", "Cultural: outdoor sporting",
        "Cultural: visiting sporting competition", "Cultural: shopping for pleasure",
        "Hobbies in and around the house min/day", "Study: Yes/no",
        "Study: qualifying education", "Study: creativity course",
        "Study: general knowledge or language", "Study: emancipation for woman",
        "Study: emancipation for elderly", "Study: other", "Paid work: not over certain age",
        "Paid work: age", "Personal computer: usage", "Personal computer: minutes/week",
        "Personal computer: wordprocessing", "Personal computer: administration",
        "Personal computer: hobbies", "Personal computer: games", "Personal computer: internet",
        "Personal computer: other", "Personal computer: other specified", "Internet: surfing",
        "Internet: email", "Internet: chat", "Internet: newsgroups",
        "Internet: discussion groups", "Internet: shopping", "Internet: telebanking",
        "Internet: other", "Internet: other specified", "Internet: minutes per week",
        "Internet: personal support received", "Internet: personal support given",
        "Altruism: working for own well-being", "Altruism: working for the common good",
        "Altruism: important making effort for others", "Altruism: important giving to the poor",
        "Altruism: generally people can be trusted", "Reason missing: Social participation"
      ),
      map_id = c(
        98L, 99L, 99L, 99L, 99L, 99L, 99L, 99L, 99L, 99L, 99L, 99L, 99L, 99L, 100L, 101L, 102L,
        103L, 104L, 105L, 106L, 107L, 108L, 109L, 110L, 111L, 112L, 113L, 114L, 115L, 116L, 117L,
        118L, 118L, 118L, 118L, 118L, 119L, 119L, 119L, 119L, 119L, 119L, 119L, 119L, 120L, 120L,
        120L, 120L, 120L, 120L, 120L, 120L, 120L, 121L, 121L, 121L, 121L, 121L, 121L, 122L, 123L,
        98L, 124L, 125L, 125L, 125L, 125L, 125L, 125L, 126L, 127L, 127L, 127L, 127L, 127L, 127L,
        127L, 127L, 128L, 129L, 130L, 130L, 131L, 131L, 131L, 131L, 131L, 33L
      ),
      numeric = c(
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE,
        FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE
      ),
      stringsAsFactors = FALSE
    ),
    H3B = data.frame(
      suffix = c(
        "socpyn", "socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08",
        "socp09", "socp10", "socp11", "socp12", "socp13", "socp14", "socp15", "socp16", "socp17",
        "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24", "socp25", "socp26",
        "socp27", "socp28", "socp30", "socp31", "socp33", "socp46", "socp47", "socp48", "socp49",
        "socp50", "socp51", "socp52", "socp72", "sp72n1", "sp72n2", "sp72n3", "sp72n4", "sp72n5",
        "sp72n6", "sp72n7", "sp72n8", "sp72n9", "sp72n10", "sp72n11", "sp72n12", "socp73",
        "socp93", "sp93n1", "sp93n2", "sp93n3", "sp93n4", "sp93n5", "sp93n6", "sp93n7", "sp93n8",
        "sp93n9", "sp93n11", "sp93n12", "socp94", "socp95", "sp95f1", "sp95f2", "sp95f3",
        "sp95f4", "sp95f5", "sp95f6", "sp95f7", "sp95f8", "sp95f9", "sp95f10", "sp95f11",
        "sp95f12", "sp95f13", "socp96", "socp97", "socp98", "sp97s1", "sp97s2", "sp97s3",
        "sp97s4", "sp97s5", "sp97s6", "sp97s7", "sp97s8", "socp55", "socp56", "socp57", "socp58",
        "socp59", "socp60", "socp61", "socp66", "socp67", "socp68", "socp69", "socp99", "rmso"
      ),
      variable_label = c(
        "Member or involved in organization", "Organization for the elderly",
        "Trade union, employers organization", "Political party or organization",
        "Church or religious organization", "Neighbourhood association",
        "Womens association, womens circle", "Organ. to assist elderly or disabled",
        "Action group or ass. with social aim", "Patients association",
        "Choir, musical society or drama club", "Hobby club or social club", "Sporting club",
        "Other", "Visiting: Org. for the elderly", "Visiting: Trade union, employers org.",
        "Visiting: Political party or org.", "Visiting: Church or religious org.",
        "Visiting: Neighbourhood association.", "Visiting: Womens ass. or womens circle",
        "Visiting: Org. to assist eld. and disabl.", "Visiting: Action group or ass. social aim",
        "Visiting: Patients association", "Visiting: Choir, mus.society or dramaclub",
        "Visiting: Hobby club or social club", "Visiting: Sporting club", "Visiting: Other",
        "Visiting: Organizations all", "Participation: administrative work",
        "Participation: adm.work in minutes/week", "Participation: volunteers work",
        "Participation: vol.work in minutes/week",
        "Cultural: cinema, museum, exhib., artgallery",
        "Cultural: trip, recreation, zoo, entertainmt", "Cultural: social cultural centrum",
        "Cultural: pub, restaurant, dancing salon", "Cultural: outdoor sporting",
        "Cultural: visiting sporting competition", "Cultural: shopping for pleasure",
        "Personal computer: usage", "Not using PC: not interested", "Not using PC: no help",
        "Not using PC: too old", "Not using PC: dont have PC", "Not using PC: health problem",
        "Not using PC: afraid of computers", "Not using PC: too expensive",
        "Not using PC: other reason", "Not using PC: no space", "Not using PC: no time",
        "Not using PC: too difficult", "Not using PC: maybe in the future",
        "Personal computer: minutes/week", "Mobile phone: usage",
        "Not using mobile: not interested", "Not using mobile: no help",
        "Not using mobile: too old", "Not using mobile: dont have mobile",
        "Not using mobile: health problem", "Not using mobile: afraid of mobiles",
        "Not using mobile: too expensive", "Not using mobile: other reason",
        "Not using mobile: only emergencies", "Not using mobile: too complicated",
        "Not using mobile: maybe in the future", "Mobile phone usage: how often",
        "Internet: usage", "Internet: surfing", "Internet: discussion/news groups",
        "Internet: order foodstuff", "Internet: order medication",
        "Internet: buy goods (travel, books, etc.)", "Internet: maintain contacts",
        "Internet: visiting medical websites", "Internet: telebanking",
        "Internet: other function", "Internet: administrative tasks", "Internet: games",
        "Internet: hobbies", "Internet: films/music", "Internet: contact with family, friends",
        "In need of IT support", "IT support: how often", "IT support: partner",
        "IT support: children", "IT support: other family members", "IT support: neighbours",
        "IT support: friends", "IT support: professionals", "IT support: nobody",
        "IT support: other", "Study: yes/no", "Study: qualifying education",
        "Study: creativity course", "Study: general knowledge or language",
        "Study: emancipation for woman", "Study: emancipation for elderly", "Study: other",
        "Paid work: not over certain age", "Paid work: age",
        "Volunteers work: not over certain age", "Volunteers work: age", "Voted last election",
        "Reason missing: Social participation"
      ),
      map_id = c(
        132L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 134L,
        135L, 136L, 137L, 138L, 139L, 140L, 141L, 142L, 143L, 144L, 145L, 146L, 147L, 148L, 149L,
        150L, 151L, 152L, 152L, 152L, 152L, 152L, 152L, 152L, 132L, 153L, 153L, 153L, 153L, 153L,
        153L, 153L, 153L, 153L, 153L, 153L, 153L, 154L, 132L, 155L, 155L, 155L, 155L, 155L, 155L,
        155L, 155L, 155L, 155L, 155L, 156L, 132L, 157L, 157L, 157L, 157L, 157L, 157L, 157L, 157L,
        157L, 157L, 157L, 157L, 157L, 158L, 159L, 160L, 161L, 161L, 161L, 161L, 161L, 161L, 161L,
        161L, 132L, 162L, 162L, 162L, 162L, 162L, 162L, 163L, 164L, 163L, 165L, 166L, 33L
      ),
      numeric = c(
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, TRUE, FALSE, TRUE, FALSE, FALSE
      ),
      stringsAsFactors = FALSE
    ),
    I = data.frame(
      suffix = c(
        "socpyn", "socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08",
        "socp09", "socp10", "socp11", "socp12", "socp13", "socp14", "socp15", "socp16", "socp17",
        "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24", "socp25", "socp26",
        "socp27", "socp28", "socp30", "socp31", "socp33", "socp46", "socp47", "socp48", "socp49",
        "socp50", "socp51", "socp52", "socp72", "sp72n1", "sp72n2", "sp72n3", "sp72n4", "sp72n5",
        "sp72n6", "sp72n7", "sp72n8", "sp72n9", "sp72n10", "sp72n11", "sp72n12", "socp73",
        "socp93", "sp93n1", "sp93n2", "sp93n3", "sp93n4", "sp93n5", "sp93n6", "sp93n7", "sp93n8",
        "sp93n9", "sp93n11", "sp93n12", "socp94", "socp95", "sp95f1", "sp95f2", "sp95f3",
        "sp95f4", "sp95f5", "sp95f6", "sp95f7", "sp95f8", "sp95f9", "sp95f10", "sp95f11",
        "sp95f12", "sp95f13", "socp96", "socp97", "socp98", "sp97s1", "sp97s2", "sp97s3",
        "sp97s4", "sp97s5", "sp97s6", "sp97s7", "sp97s8", "socp55", "socp56", "socp57", "socp58",
        "socp59", "socp60", "socp61", "socp66", "socp67", "socp68", "socp69", "rmso"
      ),
      variable_label = c(
        "Member or involved in organization", "Organization for the elderly",
        "Trade union, employers organization", "Political party or organization",
        "Church or religious organization", "Neighbourhood association",
        "Womens association, womens circle", "Organ. to assist elderly or disabled",
        "Action group or ass. with social aim", "Patients association",
        "Choir, musical society or drama club", "Hobby club or social club", "Sporting club",
        "Other", "Visiting: Org. for the elderly", "Visiting: Trade union, employers org.",
        "Visiting: Political party or org.", "Visiting: Church or religious org.",
        "Visiting: Neighbourhood association.", "Visiting: Womens ass. or womens circle",
        "Visiting: Org. to assist eld. and disabl.", "Visiting: Action group or ass. social aim",
        "Visiting: Patients association", "Visiting: Choir, mus.society or dramaclub",
        "Visiting: Hobby club or social club", "Visiting: Sporting club", "Visiting: Other",
        "Visiting: Organizations all", "Participation: administrative work",
        "Participation: adm.work in minutes/week", "Participation: volunteers work",
        "Participation: vol.work in minutes/week",
        "Cultural: cinema, museum, exhib., artgallery",
        "Cultural: trip, recreation, zoo, entertainmt", "Cultural: social cultural centrum",
        "Cultural: pub, restaurant, dancing salon", "Cultural: outdoor sporting",
        "Cultural: visiting sporting competition", "Cultural: shopping for pleasure",
        "Personal computer: usage", "Not using PC: not interested", "Not using PC: no help",
        "Not using PC: too old", "Not using PC: dont have PC", "Not using PC: health problem",
        "Not using PC: afraid of computers", "Not using PC: too expensive",
        "Not using PC: other reason", "Not using PC: no space", "Not using PC: no time",
        "Not using PC: too difficult", "Not using PC: maybe in the future",
        "Personal computer: minutes/week", "Mobile phone: usage",
        "Not using mobile: not interested", "Not using mobile: no help",
        "Not using mobile: too old", "Not using mobile: dont have mobile",
        "Not using mobile: health problem", "Not using mobile: afraid of mobiles",
        "Not using mobile: too expensive", "Not using mobile: other reason",
        "Not using mobile: only emergencies", "Not using mobile: too complicated",
        "Not using mobile: maybe in the future", "Mobile phone usage: how often",
        "Internet: usage", "Internet: surfing", "Internet: discussion/news groups",
        "Internet: order foodstuff", "Internet: order medication",
        "Internet: buy goods (travel, books, etc.)", "Internet: maintain contacts",
        "Internet: visiting medical websites", "Internet: telebanking",
        "Internet: other function", "Internet: administrative tasks", "Internet: games",
        "Internet: hobbies", "Internet: films/music", "Internet: contact with family, friends",
        "In need of IT support", "IT support: how often", "IT support: partner",
        "IT support: children", "IT support: other family members", "IT support: neighbours",
        "IT support: friends", "IT support: professionals", "IT support: nobody",
        "IT support: other", "Study: yes/no", "Study: qualifying education",
        "Study: creativity course", "Study: general knowledge or language",
        "Study: emancipation for woman", "Study: emancipation for elderly", "Study: other",
        "Paid work: not over certain age", "Paid work: age",
        "Volunteers work: not over certain age", "Volunteers work: age",
        "Reason missing: Social participation"
      ),
      map_id = c(
        132L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 133L, 134L,
        135L, 136L, 137L, 138L, 139L, 140L, 141L, 142L, 143L, 144L, 145L, 146L, 147L, 148L, 149L,
        150L, 151L, 152L, 152L, 152L, 152L, 152L, 152L, 152L, 132L, 153L, 153L, 153L, 153L, 153L,
        153L, 153L, 153L, 153L, 153L, 153L, 153L, 154L, 132L, 155L, 155L, 155L, 155L, 155L, 155L,
        155L, 155L, 155L, 155L, 155L, 156L, 132L, 157L, 157L, 157L, 157L, 157L, 157L, 157L, 157L,
        157L, 157L, 157L, 157L, 157L, 158L, 159L, 160L, 161L, 161L, 161L, 161L, 161L, 161L, 161L,
        161L, 132L, 162L, 162L, 162L, 162L, 162L, 162L, 163L, 164L, 163L, 165L, 33L
      ),
      numeric = c(
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, TRUE, FALSE, TRUE, FALSE
      ),
      stringsAsFactors = FALSE
    ),
    MB = data.frame(
      suffix = c(
        "socpyn", "socp01", "socp04", "socp05", "socp06", "socp08", "socp09", "socp10", "socp11",
        "socp12", "socp13", "socp01n", "socp04n", "socp05n", "socp06n", "socp08n", "socp09n",
        "socp10n", "socp11n", "socp12n", "socp13n", "socp72", "socp95", "rmso"
      ),
      variable_label = c(
        "Active member or involved in organization",
        "Organization for the elderly, employers organization",
        "Church, mosque or religious organization", "Neighbourhood association",
        "Womens association, womens circle", "Action group or association with social aim",
        "Patients association", "Cultural organization", "Recreation, music or hobby club",
        "Sporting club", "Other",
        "How many Dutch members: organization for the elderly, employers organization",
        "How many Dutch members: church, mosque or religious organization",
        "How many Dutch members: neighbourhood association",
        "How many Dutch members: womens association, womens circle",
        "How many Dutch members: action group or association with social aim",
        "How many Dutch members: patients association",
        "How many Dutch members: cultural organization",
        "How many Dutch members: recreation, music or hobby club",
        "How many Dutch members: sporting club", "How many Dutch members: other",
        "Personal computer: usage", "Internet: usage", "Reason missing: Social participation"
      ),
      map_id = c(
        167L, 168L, 168L, 168L, 168L, 168L, 168L, 168L, 168L, 168L, 168L, 169L, 170L, 171L, 172L,
        173L, 174L, 175L, 176L, 177L, 178L, 167L, 167L, 33L
      ),
      numeric = c(
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE
      ),
      stringsAsFactors = FALSE
    ),
    J = data.frame(
      suffix = c(
        "socpyn", "socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08",
        "socp09", "socp10", "socp11", "socp12", "socp13", "socp14", "socp15", "socp16", "socp17",
        "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24", "socp25", "socp26",
        "socp27", "socp28", "socp30", "socp31", "socp33", "socp46", "socp47", "socp48", "socp49",
        "socpr50", "socp51", "socp52", "socp72", "sp72n1", "sp72n2", "sp72n3", "sp72n4",
        "sp72n5", "sp72n6", "sp72n7", "sp72n8", "sp72n10", "sp72n11", "socp73", "socp93",
        "sp93n1", "sp93n2", "sp93n3", "sp93n4", "sp93n5", "sp93n6", "sp93n7", "sp93n8",
        "sp93n11", "sp93n13", "sp93n14", "socp94", "socp95", "sp95f1", "sp95f2", "sp95f3",
        "sp95f4", "sp95f5", "sp95f6", "sp95f7", "sp95f8", "sp95f9", "sp95f11", "sp95f13",
        "sp95f14", "sp95f15", "sp95f16", "sp95f17", "socp96", "socp97", "socp98", "sp97s1",
        "sp97s2", "sp97s3", "sp97s4", "sp97s5", "sp97s6", "sp97s7", "sp97s8", "socp55", "socp56",
        "socp57", "socp58", "socp59", "socp60", "socp61", "socp66", "socp67", "socp68", "socp69",
        "rmso"
      ),
      variable_label = c(
        "Member or involved in organization", "Organization for the elderly",
        "Trade union, employers organization", "Political party or organization",
        "Church or religious organization", "Neighbourhood association",
        "Womens association, womens circle", "Organ. to assist elderly or disabled",
        "Action group or ass. with social aim", "Patients association",
        "Choir, musical society or drama club", "Hobby club or social club", "Sporting club",
        "Other", "Visiting: Org. for the elderly", "Visiting: Trade union, employers org.",
        "Visiting: Political party or org.", "Visiting: Church or religious org.",
        "Visiting: Neighbourhood association.", "Visiting: Womens ass. or womens circle",
        "Visiting: Org. to assist eld. and disabl.", "Visiting: Action group or ass. social aim",
        "Visiting: Patients association", "Visiting: Choir, mus.society or dramaclub",
        "Visiting: Hobby club or social club", "Visiting: Sporting club", "Visiting: Other",
        "Visiting: Organizations all", "Participation: administrative work",
        "Participation: adm.work in minutes/week", "Participation: volunteers work",
        "Participation: vol.work in minutes/week",
        "Cultural: cinema, museum, exhib., artgallery",
        "Cultural: trip, recreation, zoo, entertainmt", "Cultural: social cultural centrum",
        "Cultural: pub, restaurant, dancing salon", "Cultural: outdoor sporting",
        "Cultural: visiting sporting competition", "Cultural: shopping for pleasure",
        "PC, laptop, tablet, smartphone: usage",
        "Not using PC, laptop, tablet, smartphone: not interested",
        "Not using PC, laptop, tablet, smartphone: no help",
        "Not using PC, laptop, tablet, smartphone: too old",
        "Not using PC, laptop, tablet, smartphone: dont have PC, laptop, tablet, smartphone",
        "Not using PC, laptop, tablet, smartphone: health problem",
        "Not using PC, laptop, tablet, smartphone: afraid of computers / smartphones",
        "Not using PC, laptop, tablet, smartphone: too expensive",
        "Not using PC, laptop, tablet, smartphone: other reason",
        "Not using PC, laptop, tablet, smartphone: no time",
        "Not using PC, laptop, tablet, smartphone: too difficult",
        "PC, laptop, tablet, smartphone: minutes/week",
        "Calling mobile or using messaging service", "Not calling mobile: not interested",
        "Not calling mobile: no help", "Not calling mobile: too old",
        "Not calling mobile: dont have mobile", "Not calling mobile: health problem",
        "Not calling mobile: afraid of mobiles", "Not calling mobile: too expensive",
        "Not calling mobile: other reason", "Not calling mobile: too complicated",
        "Not calling mobile: not necessary",
        "Not calling mobile: dont always want to be available",
        "Calling mobile or using messaging service: how often", "Internet: usage",
        "Internet: surfing", "Internet: discussion/news groups", "Internet: order foodstuff",
        "Internet: order medication", "Internet: buy goods (travel, books, etc.)",
        "Internet: maintain contacts", "Internet: visiting medical websites",
        "Internet: telebanking", "Internet: other function", "Internet: games",
        "Internet: films/music",
        "Internet: requesting and arranging facilities (prof. care, transport)",
        "Internet: making appointments with doctors",
        "Internet: arranging tax returns, health care benefits",
        "Internet: using governmental portal (MijnOverheid)",
        "Internet: contact with family, friends", "In need of IT support",
        "IT support: how often", "IT support: partner", "IT support: children",
        "IT support: other family members", "IT support: neighbours", "IT support: friends",
        "IT support: professionals", "IT support: nobody", "IT support: other", "Study: yes/no",
        "Study: qualifying education", "Study: creativity course",
        "Study: general knowledge or language", "Study: emancipation for woman",
        "Study: emancipation for elderly", "Study: other", "Paid work: not over certain age",
        "Paid work: age", "Volunteers work: not over certain age", "Volunteers work: age",
        "Reason missing: Social participation"
      ),
      map_id = c(
        179L, 180L, 180L, 180L, 180L, 180L, 180L, 180L, 180L, 180L, 180L, 180L, 180L, 180L, 181L,
        182L, 183L, 184L, 185L, 186L, 187L, 188L, 189L, 190L, 191L, 192L, 193L, 194L, 195L, 196L,
        197L, 198L, 199L, 199L, 199L, 199L, 199L, 199L, 199L, 179L, 200L, 200L, 200L, 200L, 200L,
        200L, 200L, 200L, 200L, 200L, 201L, 179L, 202L, 202L, 202L, 202L, 202L, 202L, 202L, 202L,
        202L, 202L, 202L, 203L, 204L, 205L, 205L, 205L, 205L, 205L, 205L, 205L, 205L, 205L, 205L,
        205L, 205L, 205L, 205L, 205L, 206L, 207L, 208L, 209L, 209L, 209L, 209L, 209L, 209L, 209L,
        209L, 179L, 210L, 210L, 210L, 210L, 210L, 210L, 211L, 212L, 211L, 213L, 33L
      ),
      numeric = c(
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, TRUE, FALSE, TRUE, FALSE
      ),
      stringsAsFactors = FALSE
    )
  )

  for (i in seq_len(nrow(specs))) {
    value_map <- if (specs$map_id[[i]] == 0L) {
      NULL
    } else {
      value_maps[[specs$map_id[[i]]]]
    }
    engine$label_variable(
      specs$suffix[[i]], specs$variable_label[[i]], value_map,
      force_numeric = specs$numeric[[i]]
    )
  }

  engine$finalize()
}
