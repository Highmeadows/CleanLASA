# Apply LASA 174 (food supplements) SPSS variable and value labels
#
# Source: LASA174_varinfo.pdf (20-Jun-2022)

#' Apply LASA174 (food supplements) SPSS labels
#'
#' Attaches SPSS-style variable labels and value labels to the food-supplement
#' variables documented in LASA174 for waves I and J. Wave I records a general
#' supplement list. Wave J separates vitamin D and multivitamin supplements.
#' Both computer-assisted files allow a sample-dependent number of repeated
#' supplement records; this function labels every documented repeat index
#' present in `data` (and every repeat named in `name_corrections`).
#'
#' Supplement counts, quantities, and use frequencies are eligible for
#' `to_numeric = TRUE`; negative missing codes then become `NA`. Use,
#' measurement-unit, period, dosage-form, and seasonal-use variables remain
#' categorical. Text fields receive variable labels without invented value
#' labels. With `to_factor = TRUE`, documented categorical codes become factor
#' levels while observed unlabelled codes are retained.
#'
#' The source PDF also contains LASA374, which adds derived vitamin D content.
#' Those variables belong to a separate filecode and are intentionally not
#' labelled here. Matching tries `name_corrections`, an exact match, then a
#' case-insensitive exact match. Original labels and values are preserved;
#' optional standardized naming removes the wave prefix and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA174 `.sav` file.
#'   Wave-I names begin with `im`; wave-J names begin with `jmD` or `jmMV`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"I"` or `"J"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   LASA174 suffixes without the initial wave prefix (for example,
#'   `msupquant1` or `mDsupquant1`) to actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, variables with documented value labels
#'   are converted to factors unless converted to numeric.
#' @param to_numeric Logical. If `TRUE`, documented counts, quantities, and
#'   times-per-period variables are restored to plain numeric and negative
#'   values are replaced by `NA`.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column is inserted after `respnr`.
#'
#' @return `data`, with LASA174 labels, optional conversion and standardized
#'   naming, preserved original SPSS coding, the `LASA_wave` provenance
#'   attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, imsup = c(1, 2), `im#sup` = c(0, 1))
#' apply_lasa174_labels(dat, wave = "I", to_factor = TRUE)
apply_lasa174_labels <- function(data,
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
  if (!wave %in% c("I", "J")) {
    stop("Unknown LASA 174 wave: ", wave, ". Use one of: I, J.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  prefix <- tolower(wave)
  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa174_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  # Repeat counts were not capped in the computer-assisted interviews. Detect
  # every documented index present in the file or explicitly corrected, while
  # always retaining index 1 as the codebook's template inventory.
  repeat_indices <- function(pattern) {
    correction_suffixes <- if (is.null(name_corrections)) {
      character(0)
    } else {
      paste0(prefix, names(name_corrections))
    }
    candidates <- tolower(c(names(data), correction_suffixes))
    matches <- regmatches(candidates, regexec(pattern, candidates, perl = TRUE))
    found <- vapply(
      matches,
      function(x) if (length(x) == 2L) x[[2L]] else NA_character_,
      character(1)
    )
    sort(unique(c(1L, as.integer(found[!is.na(found)]))))
  }

  use_labels <- c("na, asked" = -1, "no" = 1, "yes" = 2)
  measurement_labels <- c(
    "na, see IM#SUP" = -2, "na, asked" = -1,
    "microgramme" = 1, "milligramme" = 2, "gramme" = 3,
    "milliliter" = 4, "unit per milliliter" = 5, "percentage" = 6
  )
  period_labels <- c(
    "na, see IM#SUP" = -2, "na, asked" = -1,
    "day" = 1, "week" = 2, "month" = 3
  )
  season_labels_i <- c(
    "na, see IM#SUP" = -2, "na asked" = -1,
    "year round" = 1, "only in winter" = 2, "only in spring" = 3,
    "only in summer" = 4, "only in fall" = 5, "irregular" = 6,
    "other, see imsupseasoth" = 7
  )

  if (wave == "I") {
    engine$label_variable("msup", "supplement use", use_labels, force_numeric = FALSE)
    engine$label_variable(
      "m#sup", "number of supplements",
      c("na, see IMSUP" = -2, "no supplements" = 0),
      force_numeric = TRUE
    )

    indices <- repeat_indices(
      "^imsup(?:name|desc|quant|meas|#tp|period|form|formoth|seas|seasoth)?([0-9]+)$"
    )
    for (i in indices) {
      engine$label_variable(
        paste0("msup", i), paste0("sup. ", i, ": type"),
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("msupname", i), paste0("sup. ", i, ": name"),
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("msupdesc", i),
        paste0("sup. ", i, ": description package (in Dutch)"),
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("msupquant", i), paste0("sup. ", i, ": quantity"),
        c("na, see IM#SUP" = -2, "na, asked" = -1),
        force_numeric = TRUE
      )
      engine$label_variable(
        paste0("msupmeas", i), paste0("sup. ", i, ": measurement"),
        measurement_labels,
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("msup#tp", i), paste0("sup. ", i, ": # times a period"),
        c("na, see IM#SUP" = -2, "na, asked" = -1),
        force_numeric = TRUE
      )
      engine$label_variable(
        paste0("msupperiod", i), paste0("sup. ", i, ": period"),
        period_labels,
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("msupform", i), paste0("sup. ", i, ": dosage form"),
        c(
          "na, see IM#SUP" = -2, "na, asked" = -1,
          "tablet" = 1, "capsule" = 2, "drops" = 3,
          "effervescent tablet" = 4, "injection" = 5, "inhaler" = 6,
          "powder" = 7, "ointment" = 8, "plaster" = 9,
          "suppository" = 10, "spray" = 11,
          "other form, see imsupformoth" = 12
        ),
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("msupformoth", i),
        paste0("sup. ", i, ": dosage form other (in Dutch)"),
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("msupseas", i), paste0("sup. ", i, ": use in season"),
        season_labels_i,
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("msupseasoth", i),
        paste0("sup. ", i, ": use in season other (in Dutch)"),
        force_numeric = FALSE
      )
    }
  } else {
    shared_see <- "na, see jmDsup/jmMVsup"
    measurement_labels_j <- c(
      setNames(c(-2, -1), c(shared_see, "na, asked")),
      "microgramme" = 1, "milligramme" = 2, "gramme" = 3,
      "milliliter" = 4, "unit per milliliter" = 5, "percentage" = 6
    )
    period_labels_j <- c(
      setNames(c(-2, -1), c(shared_see, "na, asked")),
      "day" = 1, "week" = 2, "month" = 3
    )
    season_labels_j <- c(
      setNames(c(-2, -1), c(shared_see, "na asked")),
      "year round" = 1, "only in winter" = 2, "only in spring" = 3,
      "only in summer" = 4, "only in fall" = 5, "irregular" = 6,
      "other, see jmDsupseasoth/jmMVsupseasoth" = 7
    )

    engine$label_variable(
      "mDsup", "vitamin D supplement use", use_labels,
      force_numeric = FALSE
    )
    engine$label_variable(
      "mDnsup", "number of vitamin D supplements",
      setNames(c(-2, 0), c(shared_see, "no supplements")),
      force_numeric = TRUE
    )
    d_indices <- repeat_indices(
      "^jmdsup(?:name|brand|desc|quant|meas|tp|period|seas|seasoth)([0-9]+)$"
    )
    for (i in d_indices) {
      engine$label_variable(
        paste0("mDsupname", i), paste0("vit D ", i, ": name"),
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("mDsupbrand", i), paste0("vit D ", i, ": brand"),
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("mDsupdesc", i),
        paste0("vit D ", i, ": description package (in Dutch)"),
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("mDsupquant", i), paste0("vit D ", i, ": quantity"),
        setNames(c(-2, -1), c(shared_see, "na, asked")),
        force_numeric = TRUE
      )
      engine$label_variable(
        paste0("mDsupmeas", i), paste0("vit D ", i, ": measurement"),
        measurement_labels_j,
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("mDsuptp", i), paste0("vit D ", i, ": times a period"),
        setNames(c(-2, -1), c(shared_see, "na, asked")),
        force_numeric = TRUE
      )
      engine$label_variable(
        paste0("mDsupperiod", i), paste0("vit D ", i, ": period"),
        period_labels_j,
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("mDsupseas", i), paste0("vit D ", i, ": use in season"),
        season_labels_j,
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("mDsupseasoth", i),
        paste0("vit D ", i, ": use in season other (in Dutch)"),
        force_numeric = FALSE
      )
    }

    engine$label_variable(
      "mMVsup", "multivitamin supplement use", use_labels,
      force_numeric = FALSE
    )
    engine$label_variable(
      "mMVnsup", "number of multivitamin use",
      setNames(c(-2, 0), c(shared_see, "no supplements")),
      force_numeric = TRUE
    )
    mv_indices <- repeat_indices(
      "^jmmvsup(?:name|brand|desc|quant|meas|tp|period|seas|seasoth)([0-9]+)$"
    )
    for (i in mv_indices) {
      engine$label_variable(
        paste0("mMVsupname", i), paste0("multiv ", i, ": name"),
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("mMVsupbrand", i), paste0("multiv ", i, ": brand"),
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("mMVsupdesc", i),
        paste0("multiv ", i, ": description package (in Dutch)"),
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("mMVsupquant", i), paste0("multiv ", i, ": quantity"),
        setNames(c(-2, -1), c(shared_see, "na, asked")),
        force_numeric = TRUE
      )
      engine$label_variable(
        paste0("mMVsupmeas", i), paste0("multiv ", i, ": measurement"),
        measurement_labels_j,
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("mMVsuptp", i), paste0("multiv ", i, ": times a period"),
        setNames(c(-2, -1), c(shared_see, "na, asked")),
        force_numeric = TRUE
      )
      engine$label_variable(
        paste0("mMVsupperiod", i), paste0("multiv ", i, ": period"),
        period_labels_j,
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("mMVsupseas", i), paste0("multiv ", i, ": use in season"),
        season_labels_j,
        force_numeric = FALSE
      )
      engine$label_variable(
        paste0("mMVsupseasoth", i),
        paste0("multivit ", i, ": use in season other (in Dutch)"),
        force_numeric = FALSE
      )
    }
  }

  engine$finalize()
}
