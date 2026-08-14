# Apply LASA 017 (Income) SPSS variable and value labels
#
# Source: LASA017_varinfo.pdf (19-Sep-2023)
#
# LASAB217 is documented in the same PDF, but it is a separate file code.
# This function deliberately handles only LASA017 files.

#' Apply LASA017 (Income) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to a LASA017 income data frame, using the wording,
#' income-category thresholds, routing references, and missing-value codes
#' documented for the requested wave. By default, matched variables remain
#' numeric. Optional arguments allow converting the categorical variables to
#' factors, correcting mismatched column names, and standardizing names to
#' the canonical LASA documentation spelling.
#'
#' LASA017 changes across waves. Wave B uses 0/1 screening codes and Dutch
#' guilder categories; 2B contains respondent and partner income-source
#' checklists; F through I use progressively revised euro thresholds; J and K
#' introduce a new lowest category and shift the remaining category numbers;
#' and K adds response codes for an unreported partner amount and an unknown
#' combined amount. `wave` is therefore required, especially because B, 2B,
#' 3B, and MB all use variable names beginning with `"b"`.
#'
#' The shared C/D/E table prints substantive `inccat` category labels only
#' for wave C. For D and E, this function therefore attaches the documented
#' routing label but does not infer unprinted category labels. Observed
#' unlabelled codes are retained as numeric-text factor levels when
#' `to_factor = TRUE`.
#'
#' `LASA017_varinfo.pdf` also contains LASAB217, a separate specification-
#' income file with income-source amounts. Those variables are deliberately
#' excluded from this function and belong in `apply_lasa217_labels()`.
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
#' @param data A data frame or tibble imported from a LASA017 `.sav` file,
#'   for example via [haven::read_sav()]. Expected wave-prefixed names include
#'   `brespinc`, `brinc01`, `fincc5s`, `iincc8s`, and `kincc10s`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA017 suffixes without the wave
#'   prefix (for example `respinc`, `inccat`, or `incc8s`), and values are
#'   actual column names in `data`, for example
#'   `c(inccat = "B_INCOME_CATEGORY")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their documented value labels. Observed
#'   values without a codebook label remain numeric-text levels rather than
#'   becoming `NA`.
#' @param to_numeric Logical. Retained for the common apply-label parameter
#'   contract. LASA017 documents categorical screens, source checklists, and
#'   income bands rather than raw numeric income measures, so this argument
#'   does not change LASA017 columns. Raw amounts documented for the separate
#'   LASAB217 file are not processed here.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA017 columns are renamed to their canonical lowercase
#'   suffixes with the wave code removed; `"respnr"` is standardized; and
#'   `split_wavecode` is always treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with the wave prefix removed and a new
#'   `"LASA_wave"` column filled with `wave` is inserted immediately after
#'   the respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA017 column, optional factor conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa016_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   IRESPINC = c(-4, 1, 2),
#'   IINCCAT = c(-2, 1, 24),
#'   IINCC8S = c(-2, 1, 2)
#' )
#' dat <- apply_lasa017_labels(dat, wave = "I")
#' attr(dat$IINCCAT, "labels")
#'
#' dat <- apply_lasa017_labels(
#'   dat,
#'   wave = "I",
#'   to_factor = TRUE,
#'   standardize_names = TRUE
#' )
#' lasa_label_report(dat, problems_only = TRUE)
apply_lasa017_labels <- function(data,
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
      "Unknown LASA 017 wave: ", wave,
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
    fn_name = "apply_lasa017_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  spec <- function(suffix, variable_label, value_label_map) {
    list(
      suffix = suffix,
      variable_label = variable_label,
      value_label_map = value_label_map
    )
  }

  respondent_screen <- c(
    "na, short version" = -4,
    "na, asked" = -1,
    "no" = 1,
    "yes" = 2
  )
  partner_screen <- function(asked_label = "na, asked", extra = numeric(0)) {
    c(
      "na, partner out hh" = -5,
      "na, short version" = -4,
      "na, wrong skip" = -3,
      "na, no partner" = -2,
      setNames(-1, asked_label),
      "no" = 1,
      "yes" = 2,
      extra
    )
  }
  incf_labels <- function(extra = numeric(0)) {
    c(
      "na, refused" = -5,
      "na, short version" = -4,
      "na, asked" = -1,
      "no income" = 0,
      "R only" = 1,
      "P only" = 2,
      "R+P in hh" = 3,
      "R+P out hh" = 4,
      "R+other in hh" = 5,
      extra
    )
  }
  old_guilder_categories <- c(
    "less than ƒ 999" = 0,
    "ƒ 1.000 - 1.250" = 1,
    "ƒ 1.251 - 1.500" = 2,
    "ƒ 1.501 - 1.750" = 3,
    "ƒ 1.751 - 2.000" = 4,
    "ƒ 2.001 - 2.250" = 5,
    "ƒ 2.251 - 2.500" = 6,
    "ƒ 2.501 - 3.000" = 7,
    "ƒ 3.001 - 3.500" = 8,
    "ƒ 3.501 - 4.000" = 9,
    "ƒ 4.001 - 4.500" = 10,
    "ƒ 4.501 - 5.000" = 11,
    "ƒ 5.001 or more per month" = 12
  )
  euro_categories_12 <- c(
    "454-567 euro (1000-1250 fl)" = 1,
    "568-680 euro (1251-1500 fl)" = 2,
    "681-794 euro (1501-1750 fl)" = 3,
    "795-907 euro (1751-2000 fl)" = 4,
    "908-1021 euro (2001-2250 fl)" = 5,
    "1022-1134 euro (2251-2500 fl)" = 6,
    "1135-1361 euro (2501-3000 fl)" = 7,
    "1362-1588 euro (3001-3500 fl)" = 8,
    "1589-1815 euro (3501-4000 fl)" = 9,
    "1816-2042 euro (4001-4500 fl)" = 10,
    "2043-2269 euro (4501-5000 fl)" = 11,
    "2270 euro or more (5001 fl or more)" = 12
  )
  euro_categories_24 <- c(
    euro_categories_12[1:11],
    "2270-2495 euro (5001-5500 fl)" = 12,
    "2496-2722 euro (5501-6000 fl)" = 13,
    "2723-2949 euro (6001-6500 fl)" = 14,
    "2950-3176 euro (6501-7000 fl)" = 15,
    "3177-3403 euro (7001-7500 fl)" = 16,
    "3404-3630 euro (7501-8000 fl)" = 17,
    "3631-3857 euro (8001-8500 fl)" = 18,
    "3858-4084 euro (8501-9000 fl)" = 19,
    "4085-4311 euro (9001-9500 fl)" = 20,
    "4312-4537 euro (9501-10000 fl)" = 21,
    "4538-4991 euro (10001-11000 fl)" = 22,
    "4992-5445 euro (11001-12000 fl)" = 23,
    "5446 or more (12000 fl or more)" = 24
  )
  shifted_euro_categories <- c(
    "0 en 453 euro (0-1000 fl)" = 1,
    setNames(unname(euro_categories_24) + 1, names(euro_categories_24))
  )
  subdivision_labels <- function(ref, threshold, partner_label) {
    c(
      setNames(-4, partner_label),
      "na, wrong skip" = -3,
      setNames(-2, paste0("na, see ", ref)),
      "na, asked" = -1,
      setNames(1, paste0(threshold, " euro or lower")),
      setNames(2, paste0("more than ", threshold, " euro"))
    )
  }

  if (wave == "B") {
    old_screen <- c(
      "na, refused" = -5,
      "na, short version" = -4,
      "na, wrong skip" = -3,
      "na, routing" = -2,
      "na, asked" = -1,
      "no" = 0,
      "yes" = 1
    )
    specs <- list(
      spec("respinc", "R: Own income respondent: yes/no", old_screen),
      spec("partinc", "Own income partner: yes/no?", old_screen),
      spec(
        "incf", "Answers in BINCCAT & BAMOUNT for:",
        c(
          "na, refused" = -5,
          "na, short version" = -4,
          "na, asked" = -1,
          "no income" = 0,
          "R only" = 1,
          "P only" = 2,
          "R+P in hh" = 3,
          "R+P out hh" = 4
        )
      ),
      spec(
        "inccat", "Income categories : constructed",
        c("na, see BINCF" = -2, old_guilder_categories)
      )
    )
  } else if (wave %in% c("C", "D", "E")) {
    p <- toupper(prefix)
    category_labels <- if (wave == "C") old_guilder_categories else numeric(0)
    specs <- list(
      spec("respinc", "R: Own income respondent: yes/no", respondent_screen),
      spec(
        "partinc", "Own income partner: yes/no",
        c(
          "na, short version" = -4,
          "na, wrong skip" = -3,
          "na, no partner" = -2,
          "na, asked" = -1,
          "no" = 1,
          "yes" = 2
        )
      ),
      spec("incf", paste0("Answers in ", p, "INCCAT for:"), incf_labels()),
      spec(
        "inccat", "Income categories",
        c(setNames(-2, paste0("na, see ", p, "INCF")), category_labels)
      )
    )
  } else if (wave == "2B") {
    source_labels <- c(
      "R: income from employment",
      "R: income from savings, dividend, property",
      "R: profit from ventures",
      "R: pension, early retirement, annuity",
      "R: old age pension (AOW) or AWW",
      "R: social security (ABW), RWW, IOAW, IOAZ",
      "R: bonuslaw",
      "R: disability benefit: ABP, AAW/WAO",
      "R: unemployment benefit (WW)",
      "R: other social security",
      "R: maintenance allowance",
      "R: board and lodging",
      "R: other income source"
    )
    partner_source_labels <- sub("^R:", "P:", source_labels)
    respondent_source_map <- c(
      "na, refusal" = -5,
      "na, see BRESPINC" = -2,
      "na, asked" = -1,
      "no" = 0,
      "yes" = 1
    )
    partner_source_map <- c(
      "na, refusal" = -5,
      "na, see BPARTINC" = -2,
      "na, asked" = -1,
      "no" = 0,
      "yes" = 1
    )
    specs <- list(spec("respinc", "R: own income respondent: yes/no", respondent_screen))
    for (i in seq_along(source_labels)) {
      specs[[length(specs) + 1L]] <- spec(
        sprintf("rinc%02d", i), source_labels[[i]], respondent_source_map
      )
    }
    specs[[length(specs) + 1L]] <- spec(
      "partinc", "own income partner: yes/no", partner_screen()
    )
    for (i in seq_along(partner_source_labels)) {
      specs[[length(specs) + 1L]] <- spec(
        sprintf("pinc%02d", i), partner_source_labels[[i]], partner_source_map
      )
    }
    specs <- c(
      specs,
      list(
        spec("incf", "answers in BINCCAT for:", incf_labels()),
        spec(
          "inccat", "income categories",
          c(
            "na, wrong skip" = -3,
            "na, see BINCF" = -2,
            "454-567 euro" = 1,
            "568-680 euro" = 2,
            "681-794 euro" = 3,
            "795-907 euro" = 4,
            "908-1021 euro" = 5,
            "1022-1134 euro" = 6,
            "1135-1361 euro" = 7,
            "1362-1588 euro" = 8,
            "1589-1815 euro" = 9,
            "1816-2042 euro" = 10,
            "2043-2269 euro" = 11,
            "2270 euro or more" = 12
          )
        )
      )
    )
  } else {
    p <- toupper(prefix)
    part_label <- if (wave %in% c("F", "G")) {
      "r: own income respondent: yes/no"
    } else {
      "own income (hh)partner: yes/no"
    }
    part_asked <- if (wave == "I") "no answer, asked" else "na, asked"
    part_extra <- if (wave == "K") {
      c("partner has income but R does not report amount" = 3)
    } else {
      numeric(0)
    }
    incf_extra <- if (wave == "K") c("total income R+P unknown" = 6) else numeric(0)
    categories <- if (wave %in% c("F")) {
      euro_categories_12
    } else if (wave %in% c("G", "H", "3B", "MB", "I")) {
      euro_categories_24
    } else {
      shifted_euro_categories
    }
    specs <- list(
      spec(
        "respinc",
        if (wave %in% c("F", "G")) {
          "r: own income respondent: yes/no"
        } else {
          "own income respondent: yes/no"
        },
        respondent_screen
      ),
      spec(
        "partinc", part_label,
        partner_screen(asked_label = part_asked, extra = part_extra)
      ),
      spec(
        "incf", paste0("answers in ", p, "INCCAT for:"),
        incf_labels(extra = incf_extra)
      ),
      spec(
        "inccat", "income categories",
        c(setNames(-2, paste0("na, see ", p, "INCF")), categories)
      )
    )

    if (wave == "F") {
      specs <- c(
        specs,
        list(
          spec(
            "incc5s", "subdivision income category 5",
            subdivision_labels("FINCCAT", 935, "na, partner in hh")
          ),
          spec(
            "incc7s", "subdivision income category 7",
            subdivision_labels("FINCCAT", 1335, "na, no partner in hh")
          )
        )
      )
    } else if (wave == "G") {
      specs <- c(
        specs,
        list(
          spec(
            "incc5s", "subdivision income category 5",
            subdivision_labels("GINCCAT", 976, "na, partner in hh")
          ),
          spec(
            "incc7s", "subdivision income category 7",
            subdivision_labels("GINCCAT", 1340, "na, no partner in hh")
          )
        )
      )
    } else if (wave %in% c("H", "3B", "MB")) {
      specs <- c(
        specs,
        list(
          spec(
            "incc6s", "subdivision income category 6",
            subdivision_labels(
              paste0(p, "INCCAT"), 1040, "na, partner in hh"
            )
          ),
          spec(
            "incc8s", "subdivision income category 8",
            subdivision_labels(
              paste0(p, "INCCAT"), 1425, "na, no partner in hh"
            )
          )
        )
      )
    } else if (wave == "I") {
      specs <- c(
        specs,
        list(
          spec(
            "incc6s", "subdivision income category 6",
            subdivision_labels("IINCCAT", 1060, "na, partner in hh")
          ),
          spec(
            "incc8s", "subdivision income category 8",
            subdivision_labels("IINCCAT", 1450, "na, no partner in hh")
          )
        )
      )
    } else if (wave == "J") {
      specs[[length(specs) + 1L]] <- spec(
        "incc9s", "subdivision income category 9",
        subdivision_labels("JINCCAT", 1555, "na, no partner in hh")
      )
    } else if (wave == "K") {
      specs <- c(
        specs,
        list(
          spec(
            "incc8s", "subdivision income category 8",
            subdivision_labels("KINCCAT", 1201, "na, no partner in hh")
          ),
          spec(
            "incc10s", "subdivision income category 10",
            subdivision_labels("KINCCAT", 1645, "na, no partner in hh")
          )
        )
      )
    }
  }

  for (item in specs) {
    engine$label_variable(
      suffix = item$suffix,
      variable_label = item$variable_label,
      value_label_map = item$value_label_map,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
