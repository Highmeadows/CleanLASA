# Apply LASA 605 ([PROXY] falling and fractures) SPSS labels
#
# Source: LASA605_varinfo.pdf (21-Mar-2024)

#' Apply LASA605 ([PROXY] falling and fractures) SPSS labels
#'
#' Attaches the variable and value labels documented for LASA605 proxy
#' telephone-interview data. Wave C records falls and up to three fractures
#' in a ten-variable inventory. Wave D adds a fracture count and separate
#' occurrence questions for each fracture. Waves E through K retain the
#' eleven fracture variables but omit the two fall questions.
#'
#' Fracture type uses the documented 13-code table, from pulse/wrist/Colles
#' fracture through unknown type. Matching uses an explicit
#' `name_corrections` entry, an exact match, then a case-insensitive exact
#' match. `to_factor = TRUE` converts categorical variables to factors while
#' retaining observed undocumented codes. `to_numeric = TRUE` restores the
#' fall and fracture counts to plain numeric and replaces their negative
#' missing codes with `NA`. Original values and labels remain available in
#' `original_values` and `original_labels` attributes.
#'
#' @param data A data frame or tibble imported from a LASA605 `.sav` file.
#' @param wave Character scalar: `"C"`, `"D"`, `"E"`, `"F"`, `"G"`, `"H"`,
#'   `"I"`, `"J"`, or `"K"`; matching is case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix to actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors.
#' @param to_numeric Logical. Convert eligible fall/fracture counts to plain
#'   numeric and replace documented negative missing codes with `NA`.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove the wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes from matched names and
#'   add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA605 metadata, optional conversions and renaming, a
#'   `LASA_wave` attribute, and a `label_report` matching audit.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, ctpfall = c(1, 2), ctpfalln = c(-2, 3))
#' apply_lasa605_labels(dat, wave = "C")
apply_lasa605_labels <- function(data,
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
      "Unknown LASA 605 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa605_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  yes_no_asked <- c("asked, no answer" = -1, "no" = 1, "yes" = 2)
  fall_count <- c(
    "not fallen" = -2,
    "asked no answer" = -1,
    "fallen, number unknown" = 0,
    "more than 8 falls" = 9
  )
  fracture_type <- c(
    "pulse / wrist, colles" = 1,
    "forearm / humerus" = 2,
    "hand, fingers" = 3,
    "other upper extremities" = 4,
    "rib" = 5,
    "cymbal / pelvis" = 6,
    "ankle" = 7,
    "feet, toes" = 8,
    "hip" = 9,
    "other lower extremities" = 10,
    "head, neck" = 11,
    "vertebra(e)" = 12,
    "unknown" = 13
  )
  cause <- c(
    "reason unknown" = 0,
    "fall from > standing height" = 1,
    "fall from standing height or <" = 2,
    "traffic accident" = 3,
    "other" = 4
  )

  if (wave == "C") {
    label_variable("tpfall", "Did R fall last year?", yes_no_asked, FALSE)
    label_variable("tpfalln", "Fall: how often past year", fall_count, TRUE)
    label_variable(
      "tpbot", "Fractures: since last interview",
      c("asked no answer" = -1, "no" = 1, "yes" = 2), FALSE
    )
    label_variable(
      "tpbot1a", "Fracture (1): type",
      c("nothing broken" = -2, "asked, no answer" = -1, fracture_type),
      FALSE
    )
    label_variable(
      "tpbot1b", "Fracture (1): cause",
      c("nothing broken" = -2, "asked, no answer" = -1, cause), FALSE
    )
    label_variable(
      "tpbot2a", "Fracture (2): type",
      c("no first fracture" = -2, "no second fracture" = -1,
        fracture_type),
      FALSE
    )
    label_variable(
      "tpbot2b", "Fracture (2): cause",
      c("no first fracture" = -2, "no second fracture" = -1, cause),
      FALSE
    )
    label_variable(
      "tpbot3a", "Fracture (3): type",
      c("no first/second fracture" = -2, "no third fracture" = -1,
        fracture_type),
      FALSE
    )
    label_variable(
      "tpbot3b", "Fracture (3): cause",
      c("no first or second fracture" = -2, "no third fracture" = -1,
        cause),
      FALSE
    )
    label_variable(
      "tpbotph", "Fracture: contacted doctor",
      c("no fracture" = -2, "asked, no answer" = -1, "no" = 0,
        "yes, family physician" = 1, "yes, specialist" = 2),
      FALSE
    )
  } else {
    if (wave == "D") {
      label_variable("tpfall", "Did R fall past year?", yes_no_asked, FALSE)
      label_variable("tpfalln", "Fall: how often past year", fall_count, TRUE)
    }

    label_variable(
      "tpfracn", "Number of fractures since last interview (max. 3)",
      c("no known fractures" = 0), TRUE
    )
    label_variable(
      "tpbot1", "Fracture (1): since last interview", yes_no_asked, FALSE
    )
    label_variable(
      "tpbot1a", "Fracture (1): type",
      c("nothing broken" = -2, "asked, no answer" = -1, fracture_type),
      FALSE
    )
    label_variable(
      "tpbot1b", "Fracture (1): cause",
      c("nothing broken" = -2, "asked, no answer" = -1, cause), FALSE
    )
    label_variable(
      "tpbot2", "Fracture (2): since last interview",
      c("no first fracture" = -2, yes_no_asked), FALSE
    )
    label_variable(
      "tpbot2a", "Fracture (2): type",
      c("no first fracture" = -2, "no second fracture" = -1,
        fracture_type),
      FALSE
    )
    label_variable(
      "tpbot2b", "Fracture (2): cause",
      c("no first fracture" = -2, "no second fracture" = -1, cause),
      FALSE
    )
    label_variable(
      "tpbot3", "Fracture (3): since last interview",
      c("no first or second fracture" = -2, yes_no_asked), FALSE
    )
    label_variable(
      "tpbot3a", "Fracture (3): type",
      c("no first/second fracture" = -2, "no third fracture" = -1,
        fracture_type),
      FALSE
    )
    label_variable(
      "tpbot3b", "Fracture (3): cause",
      c("no first or second fracture" = -2, "no third fracture" = -1,
        cause),
      FALSE
    )
    label_variable(
      "tpbotph", "Fracture: contacted doctor",
      c("no fracture(s)" = -2, "asked, no answer" = -1, "no" = 0,
        "yes, family physician" = 1, "yes, specialist" = 2),
      FALSE
    )
  }

  engine$finalize()
}
