# Apply LASA 011 (Household composition) SPSS variable and value labels
#
# Source: LASA011_varinfo_HouseholdComposition.pdf (24-Aug-2023)
#
# LASAB211 is documented in the same PDF, but it is a separate LASA file
# code. This function deliberately handles only LASA011 files.

#' Apply LASA011 (Household Composition) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to a LASA011 household-composition data frame, using
#' the coding scheme documented for the requested wave. By default, variables
#' remain numeric. Optional arguments allow converting categorical variables
#' to factors, restoring count variables to plain numeric, correcting
#' mismatched column names, and standardizing names to the canonical LASA
#' documentation spelling.
#'
#' LASA011 changes across waves. Wave B records the total number of persons in
#' the household; later waves record other household members, excluding the
#' respondent's partner. From wave F onward, the file also distinguishes the
#' partner, children, stepchildren, siblings, other family members, and nonkin
#' household members. `wave` is therefore required, especially because B, 2B,
#' 3B, and MB all use the variable-name prefix `"b"`.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive name match. Unmatched documented variables are left
#' untouched and recorded as `"not found"` in the generic matching audit.
#'
#' The LASAB211 variables shown in the LASA011 codebook are not processed by
#' this function because LASAB211 is a separate LASA file code.
#'
#' Regardless of `to_factor`/`to_numeric`, every matched column also keeps
#' its original SPSS value coding available as reference attributes --
#' `attr(x, "original_labels")` and `attr(x, "original_values")` -- and the
#' `"respnr"` column (in any capitalization) is matched and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA011 `.sav` file,
#'   for example via [haven::read_sav()].
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA011 suffixes without the wave
#'   prefix (for example `nupers` or `hhpart`), and values are the actual
#'   column names in `data`, for example `c(nupers = "BNUPER")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables remain
#'   numeric with SPSS-style value-label attributes. If `TRUE`, every variable
#'   not restored to numeric by `to_numeric` (see below) is converted to a
#'   factor using its value labels as levels; observed values without a
#'   codebook label are retained as numeric-text levels.
#' @param to_numeric Logical. If `FALSE` (default), count variables retain
#'   their SPSS-style value-label attributes. If `TRUE`, count variables
#'   (`nupers`, `hhnch`, `hhnstch`, `hhnsib`, `hhnothf`, `hhnnonk`) are
#'   converted to ordinary numeric vectors, negative missing-reason codes are
#'   replaced with `NA`, and non-negative counts are retained. This takes
#'   precedence over `to_factor` for these variables.
#' @param standardize_names Logical. If `FALSE` (default), original column
#'   names are retained (except for any renaming triggered by
#'   `split_wavecode`, see below). If `TRUE`, matched LASA011 columns are
#'   renamed to their canonical lowercase documentation names with the wave
#'   code removed, such as `nupers`, `hhpart`, or `hhnnonk`, `"respnr"` (in
#'   any capitalization) is renamed to `"respnr"`, and `split_wavecode` is
#'   always treated as `TRUE` as well, regardless of what was passed for
#'   `split_wavecode`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with the wave-letter prefix removed (e.g.
#'   `bnupers` becomes `nupers`), and a new `"LASA_wave"` column, filled with
#'   `wave`, is inserted right after `"respnr"`. Always treated as `TRUE`
#'   when `standardize_names = TRUE`.
#'
#' @return `data`, with variable and value labels attached to every matched
#'   LASA011 column, optionally transformed and renamed, plus reference
#'   `original_labels`/`original_values` attributes preserving the original
#'   SPSS value coding regardless of that reshaping. A new `"LASA_wave"`
#'   column is added after `"respnr"` when `standardize_names = TRUE` or
#'   `split_wavecode = TRUE`. A variable-name matching audit is attached as
#'   `attr(data, "label_report")` and can be retrieved with
#'   [lasa_label_report()].
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()],
#'   [apply_lasa046_labels()]
#' @export
#'
#' @examples
#' dat_b <- data.frame(BNUPERS = c(1, 2, -2))
#' dat_b <- apply_lasa011_labels(dat_b, wave = "B")
#' attr(dat_b$BNUPERS, "label")
#' attr(dat_b$BNUPERS, "labels")
#'
#' dat_f <- data.frame(
#'   FHHPart = c(1, 0, -2),
#'   FHHNCh = c(2, 0, -2)
#' )
#' dat_f <- apply_lasa011_labels(
#'   dat_f,
#'   wave = "F",
#'   to_factor = TRUE,
#'   to_numeric = TRUE,
#'   standardize_names = TRUE
#' )
#' lasa_label_report(dat_f, problems_only = TRUE)
apply_lasa011_labels <- function(data,
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
    B = "b", C = "c", D = "d", E = "e", `2B` = "b",
    F = "f", G = "g", H = "h", `3B` = "b", MB = "b",
    I = "i", J = "j", K = "k"
  )

  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 011 wave: ", wave,
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
    fn_name = "apply_lasa011_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_labels <- function(...) {
    c(...)
  }

  referenced_missing <- function(reference) {
    setNames(-2, paste0("na, see ", toupper(reference)))
  }

  nupers_reference <- paste0(toupper(prefix), "HINDEP in LASA014")

  nupers_labels <- if (wave == "B") {
    value_labels(
      "na, wrong skip" = -3,
      "na, not liv independently" = -2,
      "none" = 0
    )
  } else if (wave %in% c("C", "D", "E", "2B")) {
    value_labels(
      "na, wrong skip" = -3,
      setNames(-2, paste0("na, see ", nupers_reference)),
      "na, asked" = -1,
      "none" = 0
    )
  } else if (wave == "MB") {
    value_labels(
      "na, wrong skip" = -3,
      "na, asked" = -1,
      "none" = 0
    )
  } else {
    value_labels(
      "na, wrong skip" = -3,
      setNames(-2, paste0("na, see ", nupers_reference)),
      "na, asked" = -1,
      "none" = 0
    )
  }

  nupers_label <- if (wave == "B") {
    "Number of persons in household"
  } else if (wave %in% c("C", "D", "E", "2B")) {
    "# other persons in household (partner excluded)"
  } else {
    "# other persons in household"
  }

  specs <- list(
    list(
      suffix = "nupers",
      variable_label = nupers_label,
      value_label_map = nupers_labels,
      variable_type = "numeric"
    )
  )

  if (wave %in% c("F", "G", "H", "3B", "I", "J", "K")) {
    nupers_name <- paste0(prefix, "NUPERS")
    count_missing <- referenced_missing(nupers_name)

    specs <- c(
      specs,
      list(
        list(
          suffix = "hhpart",
          variable_label = "partner in household",
          value_label_map = c(
            count_missing,
            value_labels(
              "no partner in household" = 0,
              "partner in household" = 1
            )
          ),
          variable_type = "categorical"
        ),
        list(
          suffix = "hhnch",
          variable_label = "number of children in household",
          value_label_map = count_missing,
          variable_type = "numeric"
        ),
        list(
          suffix = "hhnstch",
          variable_label = "number of stepchildren in household",
          value_label_map = count_missing,
          variable_type = "numeric"
        ),
        list(
          suffix = "hhnsib",
          variable_label = "number of siblings in household",
          value_label_map = count_missing,
          variable_type = "numeric"
        ),
        list(
          suffix = "hhnothf",
          variable_label = "number of other family members in household",
          value_label_map = count_missing,
          variable_type = "numeric"
        ),
        list(
          suffix = "hhnnonk",
          variable_label = "number of nonkin persons in household",
          value_label_map = count_missing,
          variable_type = "numeric"
        )
      )
    )
  }

  # Every LASA011 spec declares its own numeric/categorical nature
  # explicitly (rather than relying on .lasa_label_engine()'s default
  # is_codebook_numeric() auto-detection) because "nupers" mixes a
  # substantive "none" = 0 code into an otherwise all-negative missing-code
  # value-label map, which the auto-detection heuristic cannot tell apart
  # from a purely missing-reason codebook.
  for (spec in specs) {
    engine$label_variable(
      spec$suffix,
      spec$variable_label,
      spec$value_label_map,
      force_numeric = identical(spec$variable_type, "numeric")
    )
  }

  engine$finalize()
}
