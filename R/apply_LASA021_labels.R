# Apply LASA 021 (Memory complaints and MMSE) SPSS variable and value labels
#
# Source: LASA021_varinfo.pdf (08-Jun-2023)

#' Apply LASA021 (Memory complaints and MMSE) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the memory-complaint and Mini-Mental State
#' Examination variables documented in LASA021. The function covers all 13
#' documented waves. Standard waves contain two memory questions and 23 MMSE
#' items; wave MB additionally contains an MMSE-version variable and 22 items
#' from the illiterate MMSE, whose item 12 is not present in the codebook.
#'
#' The coding changes after waves B/C. From D onward, memory question 1 and
#' the primary MMSE items add a -2 routing code referring to the wave-specific
#' MMSE score in LASA221. MMSE orientation items 02 through 10 instead refer
#' to item 01. Wave MB uses `bmmsevrs` routing and has distinct item wording,
#' including subtraction of 3 and days in reverse order. These differences
#' are selected from `wave`; no labels are inferred across wave schemas.
#'
#' By default, matched variables remain numeric with their SPSS labels. With
#' `to_factor = TRUE`, they become factors using the documented label text;
#' observed unlabelled codes remain numeric-text levels. With
#' `to_numeric = TRUE`, the bounded right-answer counts are restored to plain
#' numeric, negative missing-reason codes become `NA`, and non-negative counts
#' are retained. Binary wrong/correct and no/yes items remain categorical.
#' Numeric conversion takes precedence over factor conversion for count items.
#'
#' The source PDF also documents LASA221 (the maximum spelling/subtraction
#' MMSE score) and LASA421 (separate subtraction and spelling scores). Those
#' filecodes are intentionally outside LASA021 and their variables are not
#' changed by this function.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive exact match. Variables documented for the selected wave
#' but absent from `data` are left untouched and recorded as `"not found"` in
#' the generic matching audit.
#'
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` are part of the parameter contract shared by every
#' `apply_*_labels()` function in this package. Regardless of conversion,
#' every matched column keeps its original SPSS value coding in
#' `attr(x, "original_labels")` and `attr(x, "original_values")`. The
#' `"respnr"` column is matched in any capitalization and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA021 `.sav` file,
#'   for example via [haven::read_sav()]. Standard-wave names include
#'   `bmemory1` and `bmmse01` through `bmmse23`; wave MB can additionally
#'   contain `bmmsevrs` and `bimmse01` through `bimmse23`, excluding
#'   `bimmse12`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA021 suffixes without the wave
#'   prefix (for example `memory1`, `mmse12`, or `immse23`), and values are
#'   actual column names in `data`, for example
#'   `c(memory1 = "memory_problem")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their documented labels. An observed
#'   value without a label remains a numeric-text factor level.
#' @param to_numeric Logical. If `FALSE` (default), bounded right-answer
#'   counts retain their SPSS-style value labels. If `TRUE`, those counts are
#'   restored to ordinary numeric, negative missing-reason codes become `NA`,
#'   and non-negative counts are retained. Binary items remain categorical.
#'   This takes precedence over `to_factor` for count items.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA021 columns are renamed to their canonical lowercase
#'   suffixes with the wave code removed; `"respnr"` is standardized; and
#'   `split_wavecode` is always treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with their wave prefix removed and a new
#'   `"LASA_wave"` column filled with `wave` is inserted immediately after
#'   the respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA021 column, optional factor conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa020_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   gmemory1 = c(-2, 1, 2),
#'   gmmse01 = c(-2, 1, 2),
#'   gmmse11 = c(-2, 1, 3)
#' )
#' dat <- apply_lasa021_labels(dat, wave = "G")
#' attr(dat$gmemory1, "labels")
#' attr(dat$gmmse11, "label")
#'
#' mb <- data.frame(bmmsevrs = c(-2, 1, 2), bimmse01 = c(-2, 1, 2))
#' mb <- apply_lasa021_labels(mb, wave = "MB", to_factor = TRUE)
#' levels(mb$bimmse01)
apply_lasa021_labels <- function(data,
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
  wave_prefix <- c(
    B = "b", C = "c", D = "d", E = "e", `2B` = "b", F = "f",
    G = "g", H = "h", `3B` = "b", MB = "b", I = "i", J = "j", K = "k"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 021 wave: ", wave,
      ". Use one of: ", paste(names(wave_prefix), collapse = ", "), ".",
      call. = FALSE
    )
  }

  prefix <- unname(wave_prefix[[wave]])

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa021_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  binary_labels <- function(route = NULL) {
    c(
      if (!is.null(route)) setNames(-2, route) else numeric(0),
      "na, asked" = -1,
      "wrong" = 1,
      "correct" = 2
    )
  }
  right_answer_labels <- function(maximum, route = NULL) {
    codes <- 0:maximum
    c(
      if (!is.null(route)) setNames(-2, route) else numeric(0),
      "na, asked" = -1,
      setNames(codes, paste(codes, "right"))
    )
  }
  memory1_labels <- function(route = NULL) {
    c(
      if (!is.null(route)) setNames(-2, route) else numeric(0),
      "na, asked" = -1,
      "no" = 1,
      "yes" = 2
    )
  }
  memory2_labels <- c(
    "na, wrong skip" = -3,
    setNames(-2, paste0("na, see ", toupper(prefix), "MEMORY1")),
    "na, asked" = -1,
    "no" = 1,
    "yes" = 2
  )

  spec <- function(suffix, variable_label, value_label_map,
                   force_numeric = FALSE) {
    list(
      suffix = suffix,
      variable_label = variable_label,
      value_label_map = value_label_map,
      force_numeric = force_numeric
    )
  }

  if (wave == "MB") {
    bmmsevrs_route <- "na, see BMMSEVRS"
    mb_binary <- binary_labels(bmmsevrs_route)
    mb_right3 <- right_answer_labels(3, bmmsevrs_route)
    mb_right5 <- right_answer_labels(5, bmmsevrs_route)

    mmse_labels <- c(
      "MMSE: Year",
      "MMSE: Season",
      "MMSE: Day of the month",
      "MMSE: Day of the week",
      "MMSE: Month",
      "MMSE: Country",
      "MMSE: City/Village",
      "MMSE: District/neighbourhood",
      "MMSE: Floor",
      "MMSE: Address",
      "MMSE: Three objects",
      "MMSE: Subtraction of 3",
      "MMSE: Days in reverse order/spelling backwards",
      "MMSE: Remembering three objects",
      "MMSE: Watch",
      "MMSE: Pencil",
      "MMSE: Remember sentence",
      "MMSE: Close eyes",
      "MMSE: Paper (1): Right hand",
      "MMSE: Paper (2): Folds",
      "MMSE: Paper (3): In lap",
      "MMSE: Write sentence",
      "MMSE: Drawing"
    )
    mmse_maps <- rep(list(mb_binary), 23L)
    mmse_maps[[11L]] <- mb_right3
    mmse_maps[[13L]] <- mb_right5
    mmse_maps[[14L]] <- mb_right3
    mmse_numeric <- seq_len(23L) %in% c(11L, 13L, 14L)

    immse_numbers <- c(1:11, 13:23)
    immse_labels <- c(
      "Illiterate MMSE: Part of the day",
      "Illiterate MMSE: Season",
      "Illiterate MMSE: Part of the month",
      "Illiterate MMSE: Day of the week",
      "Illiterate MMSE: Month",
      "Illiterate MMSE: Country",
      "Illiterate MMSE: City/Village",
      "Illiterate MMSE: District/neighbourhood",
      "Illiterate MMSE: Floor",
      "Illiterate MMSE: Address",
      "Illiterate MMSE: Three objects",
      "Illiterate MMSE: Days of the week in reverse order",
      "Illiterate MMSE: Remembering three objects",
      "Illiterate MMSE: Watch",
      "Illiterate MMSE: Pencil",
      "Illiterate MMSE: Remember sentence",
      "Illiterate MMSE: Close eyes",
      "Illiterate MMSE: Paper (1): Right hand",
      "Illiterate MMSE: Paper (2): Folds",
      "Illiterate MMSE: Paper (3): In lap",
      "Illiterate MMSE: Formulate question",
      "Illiterate MMSE: Drawing"
    )
    immse_maps <- rep(list(mb_binary), length(immse_numbers))
    immse_maps[[match(11, immse_numbers)]] <- mb_right3
    immse_maps[[match(13, immse_numbers)]] <- mb_right5
    immse_maps[[match(14, immse_numbers)]] <- mb_right3
    immse_numeric <- immse_numbers %in% c(11L, 13L, 14L)

    specs <- list(
      spec(
        "mmsevrs", "MMSE version",
        c(
          "MMSE version" = -2,
          "regular version MMSE" = 1,
          "regular version MMSE" = 2
        )
      ),
      spec(
        "memory1", "Problems with memory",
        memory1_labels("na, see BMMSESC in LASMB221")
      ),
      spec("memory2", "Consulted doctor for memory problems", memory2_labels)
    )

    specs <- c(
      specs,
      lapply(seq_len(23L), function(i) {
        spec(
          sprintf("mmse%02d", i), mmse_labels[[i]], mmse_maps[[i]],
          force_numeric = mmse_numeric[[i]]
        )
      }),
      lapply(seq_along(immse_numbers), function(i) {
        spec(
          sprintf("immse%02d", immse_numbers[[i]]),
          immse_labels[[i]],
          immse_maps[[i]],
          force_numeric = immse_numeric[[i]]
        )
      })
    )
  } else {
    early_wave <- wave %in% c("B", "C")
    score_file <- if (wave %in% c("2B", "3B")) {
      paste0("LAS", wave, "221")
    } else {
      paste0("LASA", wave, "221")
    }
    score_route <- if (early_wave) {
      NULL
    } else {
      paste0("na, see ", toupper(prefix), "MMSESC in ", score_file)
    }
    orientation_route <- if (early_wave) {
      NULL
    } else {
      paste0("na, see ", toupper(prefix), "MMSE01")
    }

    mmse_labels <- c(
      "MMSE item01: Year",
      "MMSE item02: Season",
      "MMSE item03: Date",
      "MMSE item04: Day of the week",
      "MMSE item05: Month",
      "MMSE item06: Province",
      "MMSE item07: Municipality",
      "MMSE item08: Two main streets",
      "MMSE item09: Floor",
      "MMSE item10: Address",
      "MMSE item11: Three objects",
      "MMSE item12: subtraction of 7",
      "MMSE item13: Spelling backwards",
      "MMSE item14: Remembering three objects",
      "MMSE item15: Watch",
      "MMSE item16: Pencil",
      "MMSE item17: Remember sentence",
      "MMSE item18: close eyes",
      "MMSE item19: paper (1): Right hand",
      "MMSE item20: paper (2): Folds",
      "MMSE item21: paper (3): In lap",
      "MMSE item22: Write sentence",
      "MMSE item23: Drawing"
    )

    mmse_maps <- rep(list(binary_labels(score_route)), 23L)
    for (i in 2:10) {
      mmse_maps[[i]] <- binary_labels(orientation_route)
    }
    mmse_maps[[11L]] <- right_answer_labels(3, score_route)
    mmse_maps[[12L]] <- right_answer_labels(5, score_route)
    mmse_maps[[13L]] <- right_answer_labels(5, score_route)
    mmse_maps[[14L]] <- right_answer_labels(3, score_route)
    mmse_numeric <- seq_len(23L) %in% c(11L, 12L, 13L, 14L)

    specs <- list(
      spec("memory1", "Problems with memory", memory1_labels(score_route)),
      spec("memory2", "Consulted doctor for memory problems", memory2_labels)
    )
    specs <- c(
      specs,
      lapply(seq_len(23L), function(i) {
        spec(
          sprintf("mmse%02d", i), mmse_labels[[i]], mmse_maps[[i]],
          force_numeric = mmse_numeric[[i]]
        )
      })
    )
  }

  for (item in specs) {
    engine$label_variable(
      suffix = item$suffix,
      variable_label = item$variable_label,
      value_label_map = item$value_label_map,
      force_numeric = item$force_numeric
    )
  }

  engine$finalize()
}
