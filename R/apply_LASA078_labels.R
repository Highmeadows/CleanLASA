# Apply LASA 078 (need for affiliation) SPSS labels
#
# Source: LASA078_varinfo.pdf (29-Sep-2017)

#' Apply LASA078 (Need for affiliation) SPSS labels
#'
#' Attaches the variable and value labels documented for the six need-for-
#' affiliation questionnaire items in LASAB078 and LASAE078. The items cover
#' talking about feelings, seeking support, coping alone, going to others,
#' keeping feelings private, and leaning on someone during difficulties.
#'
#' Both waves use no/more-or-less/yes responses but have different documented
#' missing-reason labels. All six variables are categorical; `to_numeric` is
#' accepted for the shared interface but does not convert them. Constructed
#' scale filecode LASA278, documented in the same PDF, is intentionally
#' excluded and belongs to `apply_lasa278_labels()`.
#'
#' Matching tries `name_corrections`, exact names, then case-insensitive exact
#' names. Factor conversion and canonical renaming/wave splitting preserve the
#' original SPSS coding and use the shared `label_report` audit.
#'
#' @param data A data frame or tibble imported from LASAB078 or LASAE078.
#' @param wave Character scalar identifying wave `"B"` or `"E"`; matching is
#'   case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes (`an1`, `an4`, `an6`, `an8`, `an9`, or `an10`) to actual names.
#' @param to_factor Logical. Convert matched items to factors with documented
#'   value labels; observed undocumented codes remain numeric-text levels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA078 has
#'   no eligible numeric variables.
#' @param standardize_names Logical. Rename matched variables to lowercase
#'   canonical suffixes, standardize `respnr`, and imply wave splitting.
#' @param split_wavecode Logical. Remove the wave prefix from matched names and
#'   insert `LASA_wave` after the respondent-number column.
#'
#' @return The labelled data, with requested factor conversion and canonical
#'   names, preserved original coding, `LASA_wave`, and `label_report`.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(ban1 = c(-4, 1, 3), ban4 = c(1, 2, 3))
#' dat <- apply_lasa078_labels(dat, wave = "B")
#' attr(dat$ban1, "labels")
apply_lasa078_labels <- function(data,
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
  if (!wave %in% c("B", "E")) {
    stop("Unknown LASA 078 wave: ", wave, ". Use: B, E.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = tolower(wave),
    fn_name = "apply_lasa078_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_map <- if (wave == "B") {
    c(
      "short version Q" = -4, "interview broken off" = -3,
      "no valid data" = -2, "no answer" = -1, "no" = 1,
      "more-or-less" = 2, "yes" = 3
    )
  } else {
    c(
      "refusal/skip by I" = -4, "terminated interview" = -3,
      "no valid data" = -2, "no answer" = -1, "no" = 1,
      "more-or-less" = 2, "yes" = 3
    )
  }
  item_labels <- c(
    an1 = "want to talk about feelings",
    an4 = "when in trouble, I need support",
    an6 = "cope with sorrows on my own",
    an8 = "go to others when something bothers me",
    an9 = "my feelings are my own business",
    an10 = "when difficulties, like to lean on someone"
  )

  for (suffix in names(item_labels)) {
    engine$label_variable(
      suffix, unname(item_labels[[suffix]]), value_map,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
