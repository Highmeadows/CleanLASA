# Apply LASA 126 (oral health) SPSS labels
#
# Source: LASA126_varinfo.pdf (31-Jan-2024)

#' Apply LASA126 (Oral health) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the oral-health variables
#' documented in LASA126 for waves I, J, and K.
#'
#' Wave I contains 22 items covering self-rated oral health, own teeth,
#' dentures, oral hygiene, dental care, gingivitis, and nine recent oral-health
#' problems. Waves J and K use a shorter eight-item schema and introduce
#' frequency scales for poorly fitting dentures, toothache while chewing, and
#' dry mouth.
#'
#' The documented variables are categorical, including the grouped own-teeth
#' categories. `to_numeric` is therefore accepted for interface consistency
#' but does not convert them. `to_factor = TRUE` converts matched variables to
#' factors while retaining observed unlabelled codes as numeric-text levels.
#'
#' Matching tries `name_corrections`, an exact case-sensitive match, and then
#' a case-insensitive exact match. Original SPSS coding is preserved;
#' standardized naming removes the wave prefix and can add `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA126 `.sav` file.
#'   Names may include `iqorh3c`, `iqorh8a`, `jqorh3d`, or `kqorh8i`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (for example `qorh3c` or `qorh8i`) to
#'   actual names in `data`.
#' @param to_factor Logical. If `TRUE`, matched categorical variables are
#'   converted to factors using the documented labels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA126 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. If `TRUE`, matched names and `respnr` are
#'   standardized and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched names lose the wave prefix
#'   and a `LASA_wave` column is inserted after `respnr`.
#'
#' @return `data`, with LASA126 labels, requested conversion or renaming,
#'   preserved original coding, `LASA_wave` provenance, and a `label_report`.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(iqorh1 = c(1, 5), iqorh8a = c(1, 2))
#' dat <- apply_lasa126_labels(dat, wave = "I", to_factor = TRUE)
#' attr(dat$iqorh1, "labels")
apply_lasa126_labels <- function(data,
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
  if (!wave %in% c("I", "J", "K")) {
    stop(
      "Unknown LASA 126 wave: ", wave, ". Use one of: I, J, K.",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = tolower(wave),
    fn_name = "apply_lasa126_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  health <- c(
    "no answer" = -1, "very unhealthy" = 1, "unhealthy" = 2,
    "not unhealthy/healthy" = 3, "healthy" = 4, "very healthy" = 5
  )
  teeth <- c("no answer" = -1, "none" = 1, "1-7" = 2, "more than 7" = 3)
  yes_no <- c("no answer" = -1, "yes" = 1, "no" = 2)
  frequency <- c(
    "no answer" = -1, "never" = 1, "rarely" = 2, "occasionally" = 3,
    "rather often" = 4, "very often" = 5
  )

  engine$label_variable(
    "qorh1",
    if (wave == "I") {
      "Oral health 1: general self-evaluation"
    } else {
      "Oral health 1: general self evaluation"
    },
    health
  )
  engine$label_variable(
    "qorh2a", "Oral health 2A: number of own teeth and molars upper jaw", teeth
  )
  engine$label_variable(
    "qorh2b", "Oral health 2B: number of own teeth and molars lower jaw", teeth
  )

  if (wave == "I") {
    dentures <- c(
      "no answer" = -1, "yes, complete dentures" = 1,
      "yes, partial dentures" = 2, "no" = 3
    )
    engine$label_variable(
      "qorh3a", "Oral health 3A: wearing dentures upper jaw", dentures
    )
    engine$label_variable(
      "qorh3b", "Oral health 3B: wearing dentures lower jaw", dentures
    )
    engine$label_variable(
      "qorh3c", "Oral health 3C: when wearing dentures",
      c(
        "na, see IQORH3A & IQORH3B" = -2, "no answer" = -1,
        "day and night" = 1, "always during the day" = 2,
        "occasionally" = 3
      )
    )
    engine$label_variable(
      "qorh4", "Oral health 4: how often brushing teeth",
      c(
        "no answer" = -1, "never" = 1, "sometimes, not every day" = 2,
        "once a day" = 3, "twice a day" = 4,
        "more than twice a day" = 5
      )
    )
    hygiene <- c(
      "no answer" = -1, "never" = 1, "1-3 times a month" = 2,
      "1-3 times a week" = 3, "more than 3 times a week" = 4
    )
    engine$label_variable("qorh5a", "Oral health 5A: use of dental floss", hygiene)
    engine$label_variable("qorh5b", "Oral health 5B: use of dental sticks", hygiene)
    engine$label_variable(
      "qorh5c", "Oral health 5C: use of interdental brushes", hygiene
    )
    dental_visits <- c(
      "no answer" = -1, "never" = 1, "1-2 times" = 2,
      "3 times or more" = 3
    )
    engine$label_variable(
      "qorh6a", "Oral health 6A: past 2 years dental check", dental_visits
    )
    engine$label_variable(
      "qorh6b", "Oral health 6B: past 2 years dental cleaning", dental_visits
    )
  } else {
    engine$label_variable(
      "qorh3", "Oral health 3: wearing dentures", yes_no
    )
    engine$label_variable(
      "qorh3d", "Oral health 3D: past half year: dentures did not fit properly",
      c("na, see J/KQORH3" = -2, frequency)
    )
  }

  engine$label_variable(
    "qorh7", "Oral health 7: past 2 years gum inflammation (gingivitis)",
    yes_no
  )

  if (wave == "I") {
    problem_labels <- c(
      "Oral health 8A: past half year: cavities",
      "Oral health 8B: past half year: bleeding gums",
      "Oral health 8C: past half year: red or swollen gums",
      "Oral health 8D: past half year: blisters or sores in the mouth",
      "Oral health 8E: past half year: toothache caused by hot/cold drinks",
      "Oral health 8F: past half year: toothache when chewing",
      "Oral health 8G: past half year: loose, broken teeth",
      "Oral health 8H: past half year: bad breath (halitosis)",
      "Oral health 8I: past half year: dry mouth"
    )
    for (i in seq_along(problem_labels)) {
      engine$label_variable(
        paste0("qorh8", letters[[i]]), problem_labels[[i]], yes_no
      )
    }
  } else {
    engine$label_variable(
      "qorh8f", "Oral health 8F: past half year: toothache when chewing",
      frequency
    )
    engine$label_variable(
      "qorh8i", "Oral health 8I: past half year: dry mouth", frequency
    )
  }

  engine$finalize()
}
