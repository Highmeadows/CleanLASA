# Apply LASA 074 (vignettes about help) SPSS labels
#
# Source: LASA074_varinfo.pdf (09-Okt-2017)

#' Apply LASA074 (Vignettes about help) SPSS labels
#'
#' Attaches the variable and value labels documented for the 52 LASAD074
#' vignettes-about-help variables. The D-wave file contains vignette sequence
#' variables; original and condensed responses about Mary, Sophia, Emily, and
#' John; and variables describing equality across the four vignette children.
#'
#' The original response maps preserve vignette-specific structural-missing
#' codes, including the documented `corrected2yes`, equal-to-other-children,
#' and `no@dvig*1` labels. Sequence permutations and decimal-comma equality
#' codes are reproduced as numeric SPSS values. The routing variable `dvigeqr`
#' is documented as having no value-label map and is left unlabelled by value.
#'
#' All LASA074 variables are treated as categorical; `to_numeric` is accepted
#' for interface consistency but does not convert them. The total-score
#' variable in LASAD274, documented in the same PDF, is intentionally excluded
#' and belongs to `apply_lasa274_labels()`.
#'
#' Matching tries `name_corrections`, exact names, then case-insensitive exact
#' names. Factor conversion and standardized-name/wave splitting preserve the
#' original coding and use the shared `label_report` audit.
#'
#' @param data A data frame or tibble imported from LASAD074.
#' @param wave Character scalar identifying wave `"D"`; matching is
#'   case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the `d` prefix (for example `vigseq`, `vigm1`, or
#'   `vigeqc`) to actual column names in `data`.
#' @param to_factor Logical. Convert matched value-labelled variables to
#'   factors; observed undocumented codes remain numeric-text levels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA074 has
#'   no eligible numeric variables.
#' @param standardize_names Logical. Rename matched columns to canonical
#'   lowercase suffixes, standardize `respnr`, and imply wave splitting.
#' @param split_wavecode Logical. Remove the `d` prefix from matched names and
#'   add `LASA_wave` after the respondent-number column.
#'
#' @return The labelled data, with requested factor conversion and canonical
#'   names, preserved original coding, `LASA_wave`, and `label_report`.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(dvigseq1 = c(1, 4), dvigm1 = c(-2, 2))
#' dat <- apply_lasa074_labels(dat, wave = "D")
#' attr(dat$dvigm1, "labels")
apply_lasa074_labels <- function(data,
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
  if (wave != "D") {
    stop("Unknown LASA 074 wave: ", wave, ". Use: D.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = "d",
    fn_name = "apply_lasa074_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  engine$label_variable(
    "vigseq", "sequence Mary Sophia Emily John",
    c(
      "MSEJ (not random)" = 0, "MSEJ (random)" = 1234,
      "MSJE" = 1243, "MESJ" = 1324, "MEJS" = 1342,
      "MJSE" = 1423, "MJES" = 1432, "SMEJ" = 2134,
      "SMJE" = 2143, "SEMJ" = 2314, "SEJM" = 2341,
      "SJME" = 2413, "SJEM" = 2431, "EMSJ" = 3124,
      "EMJS" = 3142, "ESMJ" = 3214, "ESJM" = 3241,
      "EJMS" = 3412, "EJSM" = 3421, "JMSE" = 4123,
      "JMES" = 4132, "JSME" = 4213, "JSEM" = 4231,
      "JEMS" = 4312, "JESM" = 4321
    ),
    force_numeric = FALSE
  )

  vignette_order <- c("Mary" = 1, "Sophia" = 2, "Emily" = 3, "John" = 4)
  for (i in seq_len(4L)) {
    engine$label_variable(
      paste0("vigseq", i), paste0(i, c("st", "nd", "rd", "th")[[i]],
                                  " vignette on M-S-E-J"),
      vignette_order, force_numeric = FALSE
    )
  }

  base_map <- c(
    "do not know" = -2, "no answer" = -1, "no" = 1, "yes" = 2,
    "equal to oth children" = 3
  )
  follow_up_map <- c(
    "NA:equal to oth ch'n" = -4,
    base_map
  )
  corrected_map <- function(initial) {
    c(
      stats::setNames(-5, paste0("NA:", initial, "1 corrected2yes")),
      "NA:equal to oth ch'n" = -4,
      stats::setNames(-3, paste0("NA:no@dvig", initial, "1")),
      base_map
    )
  }

  people <- list(
    m = list(name = "Mary", items = 1:5),
    s = list(name = "Sophia", items = c(1, 2, 4, 5)),
    e = list(name = "Emily", items = 1:5),
    j = list(name = "John", items = 1:5)
  )
  item_labels <- c(
    "care", "change home situation", "change employment situation",
    "improve frequency visits", "disappointed"
  )

  for (person_code in names(people)) {
    person <- people[[person_code]]
    initial <- toupper(person_code)
    for (item in person$items) {
      value_map <- if (item == 1L) {
        base_map
      } else if (item %in% c(2L, 3L)) {
        corrected_map(initial)
      } else {
        follow_up_map
      }
      engine$label_variable(
        paste0("vig", person_code, item),
        paste0(person$name, ": ", item_labels[[item]]),
        value_map, force_numeric = FALSE
      )
    }
  }

  condensed_map <- c("no answer" = -1, "no" = 1, "yes" = 2)
  condensed_labels <- c(
    "care (condensed)", "change home situation (condensed)",
    "change employment sit (condensed)",
    "improve freq visits (condensed)", "disappointed (condensed)"
  )
  for (person_code in names(people)) {
    person <- people[[person_code]]
    for (item in person$items) {
      engine$label_variable(
        paste0("vig", person_code, item, "b"),
        paste0(person$name, ": ", condensed_labels[[item]]),
        condensed_map, force_numeric = FALSE
      )
    }
  }

  equality_pairs <- c(
    vig_eqms = "Mary & Sophia equal",
    vig_eqme = "Mary & Emily equal",
    vig_eqmj = "Mary & John equal",
    vig_eqse = "Sophia & Emily equal",
    vig_eqsj = "Sophia & John equal",
    vig_eqej = "Emily & John equal"
  )
  for (key in names(equality_pairs)) {
    engine$label_variable(
      sub("_", "", key), equality_pairs[[key]],
      c("not equal" = 0, "equal" = 1), force_numeric = FALSE
    )
  }

  engine$label_variable(
    "vigeqp", "number of equal pairs (out of 6)",
    c(
      "none equal" = 0, "1pair=2child equal" = 1,
      "3pairs=3child equal" = 3, "all equal" = 6
    ),
    force_numeric = FALSE
  )
  engine$label_variable(
    "vigeqc", "number of equal children (out of 4)",
    c(
      "none equal" = 0.0, "2 children equal" = 2.0,
      "estimate (2 pairs equal)" = 2.8, "3 children equal" = 3.0,
      "estimate (4 pairs equal)" = 3.3, "all children equal" = 4.0
    ),
    force_numeric = FALSE
  )
  engine$label_variable(
    "vigeqr", "equality vignettes: routing Q's", NULL,
    force_numeric = FALSE
  )

  engine$finalize()
}
