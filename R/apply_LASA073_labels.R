# Apply LASA 073 (loneliness) SPSS labels
#
# Source: LASA073_varinfo.pdf (21-Feb-2020)

#' Apply LASA073 (Loneliness) SPSS labels
#'
#' Attaches the bilingual variable labels and SPSS-style value labels for the
#' De Jong Gierveld loneliness items documented in LASA073. Waves B, C, D, and
#' E contain the eleven scale items; B additionally documents interview mode.
#' Waves F, G, H, 3B, MB, I, and J add a direct loneliness item and loneliness
#' self-rating. Although LAS2B073 is named in the codebook header, the PDF does
#' not document any LAS2B073 raw variables; wave `"2B"` is therefore accepted
#' with an empty file-specific inventory rather than inferred metadata.
#'
#' All documented LASA073 variables are categorical. `to_numeric` is accepted
#' for the shared interface but does not convert them. Matching tries explicit
#' corrections, exact names, and case-insensitive exact names. Factor
#' conversion, standardized names, respondent-number handling, wave splitting,
#' preserved original coding, and `label_report` use the shared engine.
#'
#' The same PDF also documents derived scale filecode LASA273. Those variables
#' are intentionally excluded here and belong to `apply_lasa273_labels()`.
#'
#' @param data A data frame or tibble imported from a LASA073 `.sav` file.
#' @param wave Character scalar identifying `"B"`, `"C"`, `"D"`, `"E"`,
#'   `"2B"`, `"F"`, `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, or `"J"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes such as `lo1`, `lo11`, `losom`, `lorat`, or `lo_mode` to actual
#'   names in `data`.
#' @param to_factor Logical. Convert matched categorical variables to factors
#'   using the documented labels; undocumented observed codes remain levels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA073 has
#'   no eligible numeric variables.
#' @param standardize_names Logical. Rename matched columns to lowercase
#'   canonical suffixes, standardize `respnr`, and imply wave splitting.
#' @param split_wavecode Logical. Remove the wave prefix from matched names and
#'   insert `LASA_wave` immediately after the respondent-number column.
#'
#' @return The labelled data, with requested factor conversion and canonical
#'   names, preserved original coding, a `LASA_wave` attribute, and
#'   `label_report`.
#'
#' @seealso [apply_lasa272_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(blo1 = c(-4, 1, 3), blo2 = c(1, 2, 3))
#' dat <- apply_lasa073_labels(dat, wave = "B")
#' attr(dat$blo1, "labels")
apply_lasa073_labels <- function(data,
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
      "Unknown LASA 073 wave: ", wave, ". Use: ",
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
  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = prefix,
    fn_name = "apply_lasa073_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  item_map <- c(
    "refusal/skip by interviewer" = -4,
    "not asked (interview terminated/skip)" = -3,
    "no answer" = -1,
    "no" = 1,
    "more-or-less" = 2,
    "yes" = 3
  )
  item_labels <- c(
    paste0(
      "There is always someone I can talk to about my day-to-day problems / ",
      "Er is altijd wel iemand in mijn omgeving bij wie ik met mijn dagelijkse ",
      "probleempjes terecht kan"
    ),
    paste0(
      "I miss having a really close friend / Ik mis een echt goede vriend of ",
      "vriendin"
    ),
    paste0(
      "I experience a general sense of emptiness / Ik ervaar een leegte om me ",
      "heen"
    ),
    paste0(
      "There are plenty of people I can lean on when I have problems / Er zijn ",
      "genoeg mensen op wie ik in geval van narigheid kan terugvallen"
    ),
    paste0(
      "I miss the pleasure of the company of others / Ik mis gezelligheid om ",
      "me heen"
    ),
    paste0(
      "I find my circle of friends and acquaintances too limited / Ik vind ",
      "mijn kring van kennissen te beperkt"
    ),
    paste0(
      "There are many people I can trust completely / Ik heb veel mensen op ",
      "wie ik volledig kan vertrouwen"
    ),
    paste0(
      "There are enough people I feel close to / Er zijn voldoende mensen met ",
      "wie ik me nauw verbonden voel"
    ),
    "I miss having people around me / Ik mis mensen om me heen",
    "I often feel rejected / Vaak voel ik me in de steek gelaten",
    paste0(
      "I can call on my friends whenever I need them / Wanneer ik daar behoefte ",
      "aan heb kan ik altijd bij mijn vrienden terecht"
    )
  )

  if (wave != "2B") {
    for (i in seq_along(item_labels)) {
      engine$label_variable(
        paste0("lo", i), item_labels[[i]], item_map,
        force_numeric = FALSE
      )
    }
  }

  if (wave == "B") {
    engine$label_variable(
      "lo_mode", "computer or paper-and-pencil",
      c(
        "short version" = -5, "refusal/skip by Interviewer" = -4,
        "terminated interview" = -3, "computer" = 1,
        "paper-and-pencil" = 2
      ),
      force_numeric = FALSE
    )
  }

  if (wave %in% c("F", "G", "H", "3B", "MB", "I", "J")) {
    engine$label_variable(
      "losom", "I sometimes feel lonely / Ik voel me soms wel eens eenzaam",
      item_map, force_numeric = FALSE
    )
    engine$label_variable(
      "lorat",
      paste0(
        "I am among the not-moderate-severe-extreme lonely people / Als we de ",
        "mensen zouden indelen in: niet eenzaam, matig eenzaam, sterk eenzaam, ",
        "zeer sterk eenzaam, waar zou u zich dan nu toe rekenen?"
      ),
      c(
        "refusal/skip by interviewer" = -4,
        "not asked (interview terminated)" = -3,
        "no answer" = -1,
        "not lonely/niet eenzaam" = 1,
        "moderately lonely/sterk eenzaam" = 2,
        "severely lonely/sterk eenzaam" = 3,
        "extremely lonely/zeer sterk eenzaam" = 4
      ),
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
