# Apply LASA 022 (Raven) SPSS variable and value labels
#
# Source: LASA022_varinfo.pdf (25-Mar-2022)

#' Apply LASA022 (Raven) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the raw Raven's Coloured Progressive Matrices
#' variables documented in LASA022. Every supported wave contains 12 Section
#' A items, 12 Section B items, and three missing-answer counts. Waves B
#' through D used the main interview; wave E onward used the medical
#' interview and added `m` to the variable suffixes.
#'
#' For each Raven item the codebook labels only the correct response code,
#' which differs by item. Other observed response codes are deliberately not
#' assigned inferred `"incorrect"` labels. With `to_factor = TRUE`, those
#' unlabelled responses remain numeric-text factor levels. Missing-answer
#' variables are counts; with `to_numeric = TRUE`, their documented negative
#' routing/missing codes become `NA` and non-negative counts are retained.
#' Numeric conversion takes precedence over factor conversion for the count
#' variables, while the individual Raven items remain categorical.
#'
#' The function preserves two irregularities printed in the source PDF:
#' Section B item 2 is labelled `"C. Raven Section A: item 2"` in every wave,
#' and the LAS2B022 value label for `bmrava9` refers to
#' `"C/DRMCRAV in LAS2B222"`. Neither wording is silently corrected.
#'
#' The source PDF also documents LASA222 constructed totals and
#' reason-missing variables. Those variables are intentionally outside
#' LASA022 and are not changed by this function.
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
#' `attr(x, "original_labels")` (when labels exist) and
#' `attr(x, "original_values")`. The `"respnr"` column is matched in any
#' capitalization and, when `standardize_names = TRUE`, renamed to
#' `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA022 `.sav` file,
#'   for example via [haven::read_sav()]. Expected names include `brava1`,
#'   `dravb12`, `bmravamis`, and `gmrabmis`, depending on `wave`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   or `"G"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA022 suffixes without the wave
#'   prefix (for example `rava1`, `mravb12`, or `mrabmis`), and values are
#'   actual column names in `data`, for example
#'   `c(mrava1 = "raven_a_item_1")`.
#' @param to_factor Logical. If `FALSE` (default), categorical Raven items
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors. Codes other than the documented correct
#'   response remain numeric-text levels. Missing-answer counts are also
#'   factored when they have labels unless `to_numeric = TRUE`.
#' @param to_numeric Logical. If `FALSE` (default), missing-answer counts
#'   retain their SPSS-style labels, where documented. If `TRUE`, those count
#'   variables become ordinary numeric, negative missing/routing codes become
#'   `NA`, and non-negative counts are retained. Raven item responses remain
#'   categorical. This takes precedence over `to_factor` for counts.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA022 columns are renamed to their canonical lowercase
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
#'   matched LASA022 column, optional factor/numeric conversion and canonical
#'   renaming, and attributes preserving the original SPSS coding. A
#'   `"LASA_wave"` column is added when requested. The generic name-matching
#'   audit is attached as `attr(data, "label_report")` and can be retrieved
#'   with [lasa_label_report()].
#'
#' @seealso [apply_lasa021_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:4,
#'   gmrava1 = c(-2, -1, 4, 6),
#'   gmravamis = c(-2, 0, 1, 3)
#' )
#' dat <- apply_lasa022_labels(dat, wave = "G")
#' attr(dat$gmrava1, "labels")
#'
#' numeric_dat <- apply_lasa022_labels(dat, wave = "G", to_numeric = TRUE)
#' numeric_dat$gmravamis
apply_lasa022_labels <- function(data,
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
  wave_prefix <- c(B = "b", C = "c", D = "d", E = "e", `2B` = "b", F = "f", G = "g")
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 022 wave: ", wave,
      ". Use one of: ", paste(names(wave_prefix), collapse = ", "), ".",
      call. = FALSE
    )
  }

  prefix <- unname(wave_prefix[[wave]])
  medical_names <- wave %in% c("E", "2B", "F", "G")
  stem <- if (medical_names) "mrav" else "rav"

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa022_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  score_file <- if (wave == "2B") paste0("LAS", wave, "222") else paste0("LASA", wave, "222")
  score_variable <- paste0(toupper(prefix), if (medical_names && wave != "2B") "MRMCRAV" else "RMCRAV")
  route_label <- paste0("na, see ", score_variable, " in ", score_file)

  section_a_correct <- c(4, 5, 1, 2, 6, 3, 6, 2, 1, 3, 4, 5)
  section_b_correct <- c(2, 6, 1, 2, 1, 3, 5, 6, 4, 3, 4, 5)

  item_labels <- function(correct_code, route) {
    c(
      if (wave == "B") {
        c(
          "no valid data" = -6,
          "interview broken off" = -5,
          "no answer, short version" = -4
        )
      } else {
        numeric(0)
      },
      setNames(-2, route),
      "na, asked" = -1,
      setNames(correct_code, "correct")
    )
  }

  spec <- function(suffix, variable_label, value_label_map,
                   force_numeric = FALSE) {
    list(
      suffix = suffix,
      variable_label = variable_label,
      value_label_map = value_label_map,
      force_numeric = force_numeric
    )
  }

  specs <- list()
  for (i in seq_len(12L)) {
    item_route <- if (wave == "2B" && i == 9L) {
      "na, see C/DRMCRAV in LAS2B222"
    } else {
      route_label
    }
    specs[[length(specs) + 1L]] <- spec(
      paste0(stem, "a", i),
      paste0("C. Raven Section A: item ", i),
      item_labels(section_a_correct[[i]], item_route)
    )
  }
  for (i in seq_len(12L)) {
    section <- if (i == 2L) "A" else "B"
    specs[[length(specs) + 1L]] <- spec(
      paste0(stem, "b", i),
      paste0("C. Raven Section ", section, ": item ", i),
      item_labels(section_b_correct[[i]], route_label)
    )
  }

  missing_suffixes <- if (medical_names) {
    c(paste0(stem, "amis"), paste0(stem, "bmis"), "mrabmis")
  } else {
    c("ravamis", "ravbmis", "raabmis")
  }
  if (wave == "2B") {
    missing_suffixes[[3L]] <- "mraabmis"
  }
  missing_variable_labels <- c(
    "#N of missing answers first (A) Raven test",
    "#N of missing answers second (B) Raven test",
    "#N of missing answers total test"
  )
  if (wave != "B") {
    missing_variable_labels[[1L]] <- "# of missing answers first Raven test (A)"
    missing_variable_labels[[2L]] <- "# of missing answers second Raven test (B)"
    missing_variable_labels[[3L]] <- "# of missing answers total test"
  }

  missing_value_labels <- if (wave == "B") {
    c(
      "no valid data" = -6,
      "interview broken off" = -5,
      "no answer, short version" = -4,
      setNames(-2, route_label),
      "na, asked" = -1
    )
  } else if (wave == "2B") {
    NULL
  } else {
    setNames(-2, route_label)
  }

  for (i in seq_along(missing_suffixes)) {
    specs[[length(specs) + 1L]] <- spec(
      missing_suffixes[[i]],
      missing_variable_labels[[i]],
      missing_value_labels,
      force_numeric = TRUE
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
