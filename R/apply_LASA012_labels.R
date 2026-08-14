# Apply LASA 012 (Pets in household) SPSS variable and value labels
#
# Source: LASA012_varinfo.pdf (24-Aug-2023)
#
# LASAB212 is documented in the same PDF, but it is a separate LASA file
# code. This function deliberately handles only LASA012 files.

#' Apply LASA012 (Pets in Household) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to a LASA012 pets-in-household data frame, using the
#' variable names, wording, and missing-value codes documented for the
#' requested wave. By default, matched variables remain numeric. Optional
#' arguments allow converting categorical variables to factors, restoring
#' the number-of-species variable to plain numeric, correcting mismatched
#' column names, and standardizing names to the canonical LASA documentation
#' spelling.
#'
#' LASA012 changes across waves. Wave B calls the other-pets indicator
#' `petsoth`, whereas later waves use `petothe`; the routing and
#' missing-reason codes for the main `pets` question also differ between B,
#' C, D/E, 2B, and the later waves. `wave` is therefore required, especially
#' because B, 2B, and 3B all use variable names beginning with `"b"`.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive exact match. Variables documented for the selected wave
#' but absent from `data` are left untouched and recorded as `"not found"` in
#' the generic matching audit.
#'
#' The LASAB212 variables shown in the LASA012 codebook describe specific
#' types of other pets and are not processed by this function because
#' LASAB212 is a separate LASA file code.
#'
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` are part of the parameter contract shared by every
#' `apply_*_labels()` function in this package. Regardless of
#' `to_factor`/`to_numeric`, every matched column keeps its original SPSS
#' value coding in `attr(x, "original_labels")` and
#' `attr(x, "original_values")`. The `"respnr"` column is matched in any
#' capitalization and, when `standardize_names = TRUE`, renamed to
#' `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA012 `.sav` file,
#'   for example via [haven::read_sav()]. Expected wave-prefixed names include
#'   `bpets`, `cpetothe`, `fcat`, and `knspecie`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA012 suffixes without the wave
#'   prefix (for example `pets`, `petothe`, or `nspecie`), and values are the
#'   actual column names in `data`, for example
#'   `c(petothe = "F_OTHER_PET")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, the
#'   main pets question and the cat, dog, bird, and other-pets indicators are
#'   converted to factors using their value labels as levels. Observed values
#'   without a codebook label are retained as numeric-text levels rather than
#'   converted to `NA`.
#' @param to_numeric Logical. If `FALSE` (default), the number-of-species
#'   variable retains its SPSS-style missing-value label. If `TRUE`,
#'   `nspecie` is restored to an ordinary numeric vector, negative
#'   missing-reason codes are replaced with `NA`, and non-negative species
#'   counts are retained. This takes precedence over `to_factor` for
#'   `nspecie`; the categorical pet variables remain labelled or become
#'   factors according to `to_factor`.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA012 columns are renamed to their canonical lowercase
#'   suffixes with the wave code removed, such as `pets`, `petothe`, or
#'   `nspecie`; `"respnr"` in any capitalization is renamed to `"respnr"`;
#'   and `split_wavecode` is always treated as `TRUE`, regardless of the value
#'   supplied to `split_wavecode`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with the wave prefix removed (for example,
#'   `fpetothe` becomes `petothe`) and a new `"LASA_wave"` column filled with
#'   `wave` is inserted immediately after the respondent-number column. It is
#'   always treated as `TRUE` when `standardize_names = TRUE`.
#'
#' @return `data`, with variable- and value-label attributes attached to every
#'   matched LASA012 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added after
#'   `"respnr"` when `standardize_names = TRUE` or `split_wavecode = TRUE`.
#'   The generic variable-name audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa046_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat_b <- data.frame(
#'   BPETS = c(-4, 0, 1),
#'   BCAT = c(-2, 0, 1),
#'   BNSPECIE = c(-2, 0, 2)
#' )
#' dat_b <- apply_lasa012_labels(dat_b, wave = "B")
#' attr(dat_b$BPETS, "label")
#' attr(dat_b$BPETS, "labels")
#'
#' dat_f <- data.frame(
#'   RespNr = 1:3,
#'   FPETS = c(1, 0, -1),
#'   FPETOTHE = c(1, 0, -2),
#'   FNSPECIE = c(2, 0, -2)
#' )
#' dat_f <- apply_lasa012_labels(
#'   dat_f,
#'   wave = "F",
#'   to_factor = TRUE,
#'   to_numeric = TRUE,
#'   standardize_names = TRUE
#' )
#' lasa_label_report(dat_f, problems_only = TRUE)
apply_lasa012_labels <- function(data,
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
    F = "f", G = "g", H = "h", `3B` = "b",
    I = "i", J = "j", K = "k"
  )

  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 012 wave: ", wave,
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
    fn_name = "apply_lasa012_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_labels <- function(...) {
    c(...)
  }

  pets_value_labels <- if (wave == "B") {
    value_labels(
      "na, short version" = -4,
      "no" = 0,
      "yes" = 1
    )
  } else if (wave == "C") {
    value_labels(
      "no" = 0,
      "yes" = 1
    )
  } else if (wave %in% c("D", "E")) {
    value_labels(
      "na, asked" = -1,
      "no" = 0,
      "yes" = 1
    )
  } else if (wave == "2B") {
    value_labels(
      "na, interview terminated" = -2,
      "na, asked" = -1,
      "no" = 0,
      "yes" = 1
    )
  } else {
    value_labels(
      "na, asked" = -1,
      "no" = 0,
      "yes" = 1
    )
  }

  pets_reference <- paste0(toupper(prefix), "PETS")
  indicator_value_labels <- value_labels(
    setNames(-2, paste0("na, see ", pets_reference)),
    "not mentioned" = 0,
    "mentioned" = 1
  )
  species_value_labels <- setNames(-2, paste0("na, see ", pets_reference))

  if (wave == "B") {
    specs <- list(
      list(
        suffix = "pets", variable_label = "Do you have pets?",
        value_label_map = pets_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "cat", variable_label = "pets: Cat(s)",
        value_label_map = indicator_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "dog", variable_label = "pets: Dog(s)",
        value_label_map = indicator_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "bird", variable_label = "pets: Bird(s)",
        value_label_map = indicator_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "petsoth", variable_label = "pets: Other",
        value_label_map = indicator_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "nspecie", variable_label = "pets: Number of species",
        value_label_map = species_value_labels, force_numeric = TRUE
      )
    )
  } else if (wave %in% c("C", "D", "E")) {
    specs <- list(
      list(
        suffix = "pets", variable_label = "Do you have pets?",
        value_label_map = pets_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "cat", variable_label = "pets: Cat(s)",
        value_label_map = indicator_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "dog", variable_label = "pets: Dog(s)",
        value_label_map = indicator_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "bird", variable_label = "pets: Bird(s)",
        value_label_map = indicator_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "petothe", variable_label = "pets: Other",
        value_label_map = indicator_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "nspecie", variable_label = "pets: Number of species",
        value_label_map = species_value_labels, force_numeric = TRUE
      )
    )
  } else {
    specs <- list(
      list(
        suffix = "pets", variable_label = "do you have pets?",
        value_label_map = pets_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "dog", variable_label = "pets: dog(s)",
        value_label_map = indicator_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "cat", variable_label = "pets: cat (s)",
        value_label_map = indicator_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "bird", variable_label = "pets: bird (s)",
        value_label_map = indicator_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "petothe", variable_label = "pets: other",
        value_label_map = indicator_value_labels, force_numeric = FALSE
      ),
      list(
        suffix = "nspecie", variable_label = "pets: number of species",
        value_label_map = species_value_labels, force_numeric = TRUE
      )
    )
  }

  for (spec in specs) {
    engine$label_variable(
      suffix = spec$suffix,
      variable_label = spec$variable_label,
      value_label_map = spec$value_label_map,
      force_numeric = spec$force_numeric
    )
  }

  engine$finalize()
}
