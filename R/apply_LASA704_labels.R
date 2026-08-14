# Apply LASA 704 ([RESP] vision and hearing) SPSS labels
#
# Source: LASA704_varinfo.pdf (21-Mar-2024)

#' Apply LASA704 ([RESP] vision and hearing) SPSS labels
#'
#' Attaches the variable and value labels documented for LASA704 respondent
#' telephone-interview data in waves C through K. Wave C contains two
#' questions about change in vision and hearing during the previous three
#' years. Waves D through I contain six questions about glasses, hearing aids,
#' reading small print, and following a conversation. Waves J and K replace
#' the earlier hearing-aid block with six more detailed questions about aid
#' possession, use, current wearing, and conversation.
#'
#' All documented LASA704 variables are categorical. Consequently,
#' `to_factor = TRUE` converts them to factors while retaining observed
#' undocumented codes, whereas `to_numeric` does not alter them. Original
#' values and value labels remain available in `original_values` and
#' `original_labels` attributes.
#'
#' Matching tries an explicit `name_corrections` entry, an exact match, and a
#' case-insensitive exact match, in that order. Standardized naming removes
#' the wave prefix; `standardize_names` and `split_wavecode` add `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA704 `.sav` file.
#' @param wave Character scalar: `"C"`, `"D"`, `"E"`, `"F"`, `"G"`, `"H"`,
#'   `"I"`, `"J"`, or `"K"`; matching is case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix to actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors.
#' @param to_numeric Logical. Convert eligible codebook-numeric variables to
#'   plain numeric; LASA704 contains no such variables.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes from matched names and
#'   add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA704 metadata, optional conversion and reshaping,
#'   an `LASA_wave` attribute, and a `label_report` matching audit.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, ctrsight = c(3, 4), ctrhear = c(3, 5))
#' apply_lasa704_labels(dat, wave = "C")
apply_lasa704_labels <- function(data,
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
  valid_waves <- LETTERS[3:11]
  if (!wave %in% valid_waves) {
    stop(
      "Unknown LASA 704 wave: ", wave, ". Use one of: ",
      paste(valid_waves, collapse = ", "), ".",
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
    fn_name = "apply_lasa704_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  change <- c(
    "much better" = 1, "better" = 2, "the same" = 3,
    "worse" = 4, "much worse" = 5
  )
  yes_no <- c("na, asked" = -1, "no" = 1, "yes" = 2)
  difficulty <- c(
    "na, asked" = -1,
    "yes, without difficulty" = 1,
    "yes, with some difficulty" = 2,
    "yes, with much difficulty" = 3,
    "no, R cannot" = 4
  )

  if (wave == "C") {
    label_variable(
      "trsight", "Senses: change visus last 3 years",
      c("asked, no answer" = -1, change), FALSE
    )
    label_variable(
      "trhear", "Senses: change hearing last 3 years",
      c("does not know" = -1, change), FALSE
    )
  } else {
    label_variable(
      "trsen01", "R usually wears glasses or contactlenses", yes_no, FALSE
    )
    label_variable(
      "trsen03", "Small print in paper without glasses or contactlenses",
      difficulty, FALSE
    )
    sight_route <- if (wave %in% c("D", "E")) {
      "na, see D/ETRSEN03"
    } else if (wave %in% LETTERS[6:9]) {
      "na, see F/G/H/ITRSEN03"
    } else {
      "na, see J/KTRSEN03"
    }
    sight_with_aid <- c(stats::setNames(-2, sight_route), difficulty)
    if (wave %in% c("J", "K")) {
      sight_with_aid <- c(sight_with_aid, "R does not use aid" = 5)
    }
    label_variable(
      "trsen04", "Small print in paper with glasses or other aid",
      sight_with_aid, FALSE
    )
  }

  if (wave %in% LETTERS[4:9]) {
    label_variable("trsen07", "R usually wears hearing aid", yes_no, FALSE)
    label_variable(
      "trsen09", "Follow conversation 3 or 4 persons: without hearing aid",
      difficulty, FALSE
    )
    hearing_route <- if (wave %in% c("D", "E")) {
      "na, see D/ETRSEN09"
    } else {
      "na, see F/G/H/ITRSEN09"
    }
    label_variable(
      "trsen10", "Follow conversation 3 or 4 persons: with hearing aid",
      c(stats::setNames(-2, hearing_route), difficulty), FALSE
    )
  }

  if (wave %in% c("J", "K")) {
    aid_possession <- c(
      "na, asked" = -1,
      "no, never had hearing aid" = 1,
      "yes, possesses 1 hearing aid, but does not (no longer) use it" = 2,
      "yes, possesses 2 hearing aids, but does not (no longer) use it" = 3,
      "yes, possesses 1 hearing aid and uses it" = 4,
      "yes, possesses 2 hearing aids, but uses 1" = 5,
      "yes, possesses 2 hearing aids and uses both" = 6
    )
    aid_route <- c("na, see J/KTRSEN7A" = -2)
    label_variable(
      "trsen7a", "R possesses hearing aid(s)", aid_possession, FALSE
    )
    label_variable(
      "trsen7b", "Using 1 or 2 hearing aids: hours per day",
      c(
        aid_route,
        "< 1 hour per day" = 1,
        "1-4 hours per day" = 2,
        "4-8 hours per day" = 3,
        "whole day" = 4
      ),
      FALSE
    )
    label_variable(
      "trsen7c", "Using 1 or 2 hearing aids: R is wearing right now",
      c(
        aid_route,
        "R does not wear a hearing aid right now" = 1,
        "R wears hearing aid left" = 2,
        "R wears hearing aid right" = 3,
        "R wears 2 hearing aids" = 4
      ),
      FALSE
    )
    without_aid <- c(aid_route, difficulty)
    label_variable(
      "trsen09c",
      "Using 1 or 2 hearing aids: follow conversation 3 or 4 persons without hearing aid",
      without_aid, FALSE
    )
    label_variable(
      "trsen10c",
      "Using 1 or 2 hearing aids: follow conversation 3 or 4 persons with hearing aid",
      c(
        aid_route,
        difficulty,
        "R does not wear a hearing aid in this specific situation" = 5
      ),
      FALSE
    )
    label_variable(
      "trsen09",
      "No hearing aid/not using hearing aid: follow conversation 3 or 4 persons",
      without_aid, FALSE
    )
  }

  engine$finalize()
}
