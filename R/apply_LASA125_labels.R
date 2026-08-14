# Apply LASA 125 (social participation-2) SPSS labels
#
# Source: LASA125_varinfo.pdf (22-Sep-2017)

#' Apply LASA125 (Social participation-2) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the social-participation
#' variables documented in LASA125 for waves B, C, D, E, 2B, F, and G.
#'
#' The wave-specific inventories cover possession and use of a senior card,
#' hours spent listening to radio or watching television, radio and television
#' content, newspaper reading, and involvement with geographic communities.
#' Wave B has the broadest community-involvement block; later waves retain
#' selected media items. Wave G adds reality programmes, and the film item is
#' labelled "films/tv series" in F and G rather than "films/soaps".
#'
#' Radio- and television-hours variables are numeric and are eligible for
#' `to_numeric`; negative values become `NA`. Other variables are categorical
#' and can be converted with `to_factor`. `to_numeric` takes precedence for
#' eligible variables.
#'
#' Matching tries `name_corrections`, an exact case-sensitive name, and a
#' case-insensitive exact name. Original SPSS coding is preserved, standardized
#' naming removes the wave prefix, and `split_wavecode` inserts `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA125 `.sav` file.
#'   Names may include `bqsocp04`, `cqsocp07`, `fqsocp20`, or `gqsocp20b`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`,
#'   `"F"`, or `"G"`.
#' @param name_corrections Optional named character vector mapping suffixes
#'   without the wave prefix (for example `qsocp06` or `qsocp20b`) to actual
#'   names in `data`.
#' @param to_factor Logical. If `TRUE`, categorical variables with documented
#'   value labels are converted to factors.
#' @param to_numeric Logical. If `TRUE`, documented radio/television hour
#'   fields are restored to plain numeric and negative values become `NA`.
#' @param standardize_names Logical. If `TRUE`, matched names and `respnr` are
#'   standardized and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched names lose the wave prefix
#'   and a `LASA_wave` column is inserted after `respnr`.
#'
#' @return `data`, with LASA125 metadata, requested conversion or renaming,
#'   preserved original coding, `LASA_wave` provenance, and a `label_report`.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(bqsocp06 = c(-1, 2.5), bqsocp07 = c(1, 4))
#' dat <- apply_lasa125_labels(dat, wave = "B", to_numeric = TRUE)
#' attr(dat$bqsocp07, "labels")
apply_lasa125_labels <- function(data,
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
  valid_waves <- c("B", "C", "D", "E", "2B", "F", "G")
  if (!wave %in% valid_waves) {
    stop(
      "Unknown LASA 125 wave: ", wave,
      ". Use one of: B, C, D, E, 2B, F, G.", call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  prefix <- if (wave == "2B") "b" else tolower(wave)
  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = prefix,
    fn_name = "apply_lasa125_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  senior_card <- c(
    "no data, age" = -2, "no answer" = -1, "yes" = 1, "no" = 2,
    "R thinks not yet applicable" = 3
  )
  card_use <- c(
    "no answer, routing" = -2, "no answer" = -1,
    "almost never" = 1, "a few times a year" = 2, "once a month" = 3,
    "a few times a month" = 4, "once a week" = 5,
    "a few times a week" = 6, "every day" = 7
  )
  no_answer <- c("no answer" = -1)
  frequency <- c(
    "no answer" = -1, "very often" = 1, "often" = 2,
    "some of the time" = 3, "never" = 4
  )
  newspaper <- c(
    "no answer" = -1, "every day" = 1, "4-5 times a week" = 2,
    "2-3 times a week" = 3, "<2 times a week" = 4, "never" = 5
  )
  involvement <- c(
    "no answer" = -1, "not at all involved" = 1, "not involved" = 2,
    "involved" = 3, "greatly involved" = 4
  )

  label_media <- function(suffixes, film_label = "tv: films/soaps",
                          newspaper_map = newspaper) {
    labels <- c(
      qsocp07 = "radio: news", qsocp08 = "radio: commentaries",
      qsocp09 = "radio: religious services", qsocp10 = "radio: music",
      qsocp11 = "radio: sport", qsocp12 = "radio: quiz/games",
      qsocp14 = "tv: news", qsocp15 = "tv: commentaries",
      qsocp16 = "tv: religious services", qsocp17 = "tv: music",
      qsocp18 = "tv: sport", qsocp19 = "tv: quiz/games",
      qsocp20 = film_label, qsocp20b = "tv: reality programmes",
      qsocp21 = "reading newspapers"
    )
    for (suffix in suffixes) {
      engine$label_variable(
        suffix, labels[[suffix]],
        if (suffix == "qsocp21") newspaper_map else frequency
      )
    }
  }

  if (wave %in% c("B", "2B")) {
    engine$label_variable("qsocp04", "possession senior card (65+/60+)", senior_card)
    engine$label_variable("qsocp05", "usage senior card", card_use)
    engine$label_variable(
      "qsocp06", "listening to the radio: hours a day", no_answer,
      force_numeric = TRUE
    )
    label_media(paste0("qsocp", sprintf("%02d", 7:12)))
    engine$label_variable(
      "qsocp13", "watching television: hours a day", no_answer,
      force_numeric = TRUE
    )
    label_media(
      paste0("qsocp", sprintf("%02d", 14:21)),
      newspaper_map = if (wave == "2B") frequency else newspaper
    )
  }

  if (wave == "B") {
    involved_labels <- c(
      "involved: world", "involved: europe", "involved: dutch society",
      "involved: province", "involved: municipality",
      "involved: neighborhood"
    )
    for (i in seq_along(involved_labels)) {
      engine$label_variable(
        sprintf("qsocp%02d", i + 21L), involved_labels[[i]], involvement
      )
    }
  }

  if (wave == "C") {
    label_media(c(
      paste0("qsocp", sprintf("%02d", 7:12)),
      paste0("qsocp", sprintf("%02d", 14:19)), "qsocp21"
    ))
  }
  if (wave %in% c("D", "E", "F")) {
    label_media(
      c(
        paste0("qsocp", sprintf("%02d", 7:12)),
        paste0("qsocp", sprintf("%02d", 14:21))
      ),
      film_label = if (wave == "F") "tv: films/tv series" else "tv: films/soaps"
    )
  }
  if (wave == "G") {
    label_media(c(
      paste0("qsocp", sprintf("%02d", 7:12)),
      paste0("qsocp", sprintf("%02d", 14:20)), "qsocp20b", "qsocp21"
    ), film_label = "tv: films/tv series")
  }

  engine$finalize()
}
