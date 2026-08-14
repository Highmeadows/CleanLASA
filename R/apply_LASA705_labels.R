# Apply LASA 705 ([RESP] falling) SPSS labels
#
# Source: LASA705_varinfo.pdf (26-Mar-2024)

#' Apply LASA705 ([RESP] falling) SPSS labels
#'
#' Attaches the variable and value labels documented for LASA705 respondent
#' telephone-interview data in waves C through K. The file covers falls during
#' the previous year, the number of fractures since the previous interview,
#' and up to three fractures with their type, cause, and doctor contact.
#'
#' Wave C uses an earlier fracture inventory. Wave D retains two fall
#' questions that are absent from E through K. Waves D through K include a
#' fracture count and three separate indicators of whether each fracture
#' occurred. Doctor-contact code `0` means no in waves C through G, whereas
#' code `1` means no from wave H onward.
#'
#' Fall and fracture counts are codebook-numeric and are eligible for
#' `to_numeric`; negative values become `NA`. Other documented variables are
#' categorical and can be converted with `to_factor`. Original values and
#' labels are preserved in reference attributes.
#'
#' Matching tries `name_corrections`, an exact match, and a case-insensitive
#' exact match. Standardized naming removes the wave prefix;
#' `standardize_names` and `split_wavecode` add `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA705 `.sav` file.
#' @param wave Character scalar: `"C"`, `"D"`, `"E"`, `"F"`, `"G"`, `"H"`,
#'   `"I"`, `"J"`, or `"K"`; matching is case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix to actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors.
#' @param to_numeric Logical. Convert documented fall and fracture counts to
#'   plain numeric and replace negative values with `NA`.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes from matched names and
#'   add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA705 metadata, requested conversions and reshaping,
#'   an `LASA_wave` attribute, and a `label_report` matching audit.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, ctrfall = c(1, 2), ctrfalln = c(-2, 3))
#' apply_lasa705_labels(dat, wave = "C", to_numeric = TRUE)
apply_lasa705_labels <- function(data,
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
      "Unknown LASA 705 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa705_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  yes_no <- c("asked, no answer" = -1, "no" = 1, "yes" = 2)
  fall_count <- c(
    "not fallen" = -2,
    "asked no answer" = -1,
    "fallen, number unknown" = 0,
    "more than 8 falls" = 9
  )
  fracture_type <- c(
    "pulse/wrist, colles" = 1,
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
  fracture_cause <- c(
    "reason unknown" = 0,
    "fall from > standing height" = 1,
    "fall from standing height or <" = 2,
    "traffic accident" = 3,
    "other" = 4
  )

  label_fall_questions <- function(last_or_past) {
    label_variable(
      "trfall", paste0("Did you fall ", last_or_past, " year?"),
      yes_no, FALSE
    )
    label_variable(
      "trfalln", "Fall: how often past year", fall_count,
      force_numeric = TRUE
    )
  }

  if (wave == "C") {
    label_fall_questions("last")
    label_variable("trbot", "Fractures: since last interview", yes_no, FALSE)
    label_variable(
      "trbot1a", "Fracture (1): type",
      c("nothing broken" = -2, "asked, no answer" = -1, fracture_type),
      FALSE
    )
    label_variable(
      "trbot1b", "Fracture (1): cause",
      c(
        "nothing broken" = -2, "asked, no answer" = -1,
        fracture_cause
      ),
      FALSE
    )
    label_variable(
      "trbot2a", "Fracture (2): type",
      c("no first fracture" = -2, "no second fracture" = -1, fracture_type),
      FALSE
    )
    label_variable(
      "trbot2b", "Fracture (2): cause",
      c(
        "no first fracture" = -2, "no second fracture" = -1,
        fracture_cause
      ),
      FALSE
    )
    label_variable(
      "trbot3a", "Fracture (3): type",
      c(
        "no first/second fracture" = -2, "no third fracture" = -1,
        fracture_type
      ),
      FALSE
    )
    label_variable(
      "trbot3b", "Fracture (3): cause",
      c(
        "no first or second fracture" = -2, "no third fracture" = -1,
        fracture_cause
      ),
      FALSE
    )
    label_variable(
      "trbotph", "Fracture: contacted doctor",
      c(
        "no fracture" = -2, "asked, no answer" = -1, "no" = 0,
        "yes, family physician" = 1, "yes, specialist" = 2
      ),
      FALSE
    )
  } else {
    if (wave == "D") {
      label_fall_questions("past")
    }
    label_variable(
      "trfracn", "Number of fractures since last interview (max. 3)",
      c("no known fractures" = 0), force_numeric = TRUE
    )
    label_variable(
      "trbot1", "Fracture (1): since last interview", yes_no, FALSE
    )
    label_variable(
      "trbot1a", "Fracture (1): type",
      c("nothing broken" = -2, "asked, no answer" = -1, fracture_type),
      FALSE
    )
    label_variable(
      "trbot1b", "Fracture (1): cause",
      c(
        "nothing broken" = -2, "asked, no answer" = -1,
        fracture_cause
      ),
      FALSE
    )
    label_variable(
      "trbot2", "Fracture (2): since last interview",
      c("no first fracture" = -1, yes_no), FALSE
    )
    label_variable(
      "trbot2a", "Fracture (2): type",
      c("no first fracture" = -2, "no second fracture" = -1, fracture_type),
      FALSE
    )
    label_variable(
      "trbot2b", "Fracture (2): cause",
      c(
        "no first fracture" = -2, "no second fracture" = -1,
        fracture_cause
      ),
      FALSE
    )
    label_variable(
      "trbot3", "Fracture (3): since last interview",
      c("no first or second fracture" = -2, yes_no), FALSE
    )
    label_variable(
      "trbot3a", "Fracture (3): type",
      c(
        "no first/second fracture" = -2, "no third fracture" = -1,
        fracture_type
      ),
      FALSE
    )
    label_variable(
      "trbot3b", "Fracture (3): cause",
      c(
        "no first or second fracture" = -2, "no third fracture" = -1,
        fracture_cause
      ),
      FALSE
    )
    doctor_no <- if (wave %in% LETTERS[4:7]) 0 else 1
    label_variable(
      "trbotph", "Fracture: contacted doctor",
      c(
        "no fracture(s)" = -2, "asked, no answer" = -1,
        "yes, family physician" = 1, "yes, specialist" = 2,
        "no" = doctor_no
      ),
      FALSE
    )
  }

  engine$finalize()
}
