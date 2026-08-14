# Apply LASA 091 (PTSD self-report items) SPSS labels
#
# Source: LASA091_varinfo.pdf (29-Mei-2012; PDF header says LASA 025)

#' Apply LASA091 (PTSD self-report items) SPSS labels
#'
#' Attaches the variable and value labels documented for the 23 SRIP/ZIL PTSD
#' self-report items in LASAD091 and LASAE091. Each item concerns experiences
#' during the preceding four weeks and uses not-at-all through very-much
#' response categories. The PDF's page heading says LASA 025, but its variable
#' information explicitly identifies filecode LASA091.
#'
#' All LASA091 items are categorical; `to_numeric` is accepted for the shared
#' interface but does not convert them. Constructed score filecode LASA291,
#' documented in the same PDF, is intentionally excluded and belongs to
#' `apply_lasa291_labels()`.
#'
#' Matching tries `name_corrections`, exact names, and case-insensitive exact
#' names. Factor conversion and canonical renaming/wave splitting preserve the
#' original SPSS coding and produce the generic `label_report` audit.
#'
#' @param data A data frame or tibble imported from LASAD091 or LASAE091.
#' @param wave Character scalar identifying wave `"D"` or `"E"`; matching is
#'   case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes `ptsd01` through `ptsd23` to actual column names in `data`.
#' @param to_factor Logical. Convert matched items to factors with documented
#'   value labels; observed undocumented codes remain numeric-text levels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA091 has
#'   no eligible numeric variables.
#' @param standardize_names Logical. Rename matched columns to lowercase
#'   canonical suffixes, standardize `respnr`, and imply wave splitting.
#' @param split_wavecode Logical. Remove the wave prefix from matched names and
#'   add `LASA_wave` after the respondent-number column.
#'
#' @return The labelled data, with requested factor conversion and canonical
#'   names, preserved original coding, `LASA_wave`, and `label_report`.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(dptsd01 = c(-2, 1, 4), dptsd12 = c(1, 2, 3))
#' dat <- apply_lasa091_labels(dat, wave = "D")
#' attr(dat$dptsd01, "labels")
apply_lasa091_labels <- function(data,
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
  if (!wave %in% c("D", "E")) {
    stop("Unknown LASA 091 wave: ", wave, ". Use: D, E.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = tolower(wave),
    fn_name = "apply_lasa091_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_map <- c(
    "na, see D/ERMPTSD in LASAD/E291" = -2,
    "na, asked" = -1,
    "not at all" = 1,
    "somewhat" = 2,
    "considerably" = 3,
    "very much" = 4
  )
  item_text <- c(
    "express", "avoid thoughts", "no recall", "irritable",
    "body sensations", "sleep through", "dreams", "decreased interest",
    "repetitive memories", "reoccurrences", "no future",
    "difficulty concentrating", "jumpy", "avoid feelings",
    "avoid memories", "anger", "sleep in", "past experiences",
    "estranged", "apprehensive", "nasty memories", "unconnected",
    "daily activities"
  )

  for (i in seq_along(item_text)) {
    engine$label_variable(
      sprintf("ptsd%02d", i),
      paste0(i, ". Last 4 weeks: ", item_text[[i]]),
      value_map, force_numeric = FALSE
    )
  }

  engine$finalize()
}
