# Apply LASA 245 (medical specialists) SPSS labels
#
# Source: LASA045_varinfo.pdf (13-Jul-2020), pages 4--5

#' Apply LASA245 (Medical Specialists) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the medical-specialist variables documented as
#' LASA245 in the LASA045 hospitalization codebook. LASA245 specifies the
#' number and types of medical specialists contacted during the past six
#' months.
#'
#' The available files cover waves B, C, D, E, 2B, F, G, H, 3B, and I. All
#' waves contain the specialist count and types 01--30. Types 31--32 occur in
#' B through G but not H, 3B, or I; types 33--34 start in D; type 35 is a
#' tropical doctor in 2B and a geneticist in F through I; and type 36 occurs
#' only in H, 3B, and I. The source marks MB245 and J245 as not yet available,
#' so those waves are not accepted here.
#'
#' The specialist count is numeric and has only documented negative
#' missing/routing codes. With `to_numeric = TRUE`, it becomes plain numeric
#' and negative values become `NA`. Specialist-type indicators are
#' categorical (`not reported`/`reported`) and can be converted to factors.
#' Original SPSS values and labels are preserved in `original_values` and
#' `original_labels`.
#'
#' Column matching uses an explicit `name_corrections` override, an exact
#' case-sensitive match, and then a case-insensitive exact match. Standardized
#' naming removes the wave prefix, standardizes `respnr`, and inserts a
#' `LASA_wave` column.
#'
#' @param data A data frame or tibble imported from a LASA245 `.sav` file.
#'   Expected names include `bimspec#`, `cimspec01`, and `himspec36`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, or `"I"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (for example `imspec01` or `mspec31`)
#'   to actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, matched specialist-type indicators are
#'   converted to factors. Observed unlabelled values remain numeric-text
#'   levels.
#' @param to_numeric Logical. If `TRUE`, the specialist count is converted to
#'   plain numeric and its negative missing/routing codes become `NA`.
#' @param standardize_names Logical. If `TRUE`, matched names and `respnr` are
#'   standardized, wave prefixes are removed, and `LASA_wave` is added.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and `LASA_wave` is added. Implied by
#'   `standardize_names = TRUE`.
#'
#' @return `data` with LASA245 metadata, requested conversions and renaming,
#'   the `LASA_wave` provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()],
#'   [apply_lasa045_labels()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:2,
#'   `bimspec#` = c(-2, 2),
#'   bimspec01 = c(0, 1),
#'   check.names = FALSE
#' )
#' dat <- apply_lasa245_labels(dat, wave = "B", to_numeric = TRUE)
#' attr(dat$bimspec01, "labels")
apply_lasa245_labels <- function(data,
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
    F = "f", G = "g", H = "h", `3B` = "b", I = "i"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 245 wave: ", wave, ". Use one of: ",
      paste(names(wave_prefix), collapse = ", "), ".",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  prefix <- unname(wave_prefix[[wave]])
  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa245_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  file_045 <- c(
    B = "LASAB045", C = "LASAC045", D = "LASAD045", E = "LASAE045",
    `2B` = "LAS2B045", F = "LASAF045", G = "LASAG045", H = "LASAH045",
    `3B` = "LAS3B045", I = "LASAI045"
  )
  count_labels <- c(
    if (wave == "B") c("na, short version" = -4),
    setNames(-2, paste0(
      "na, see ", toupper(prefix), "MEDSPEC in ", file_045[[wave]]
    )),
    "na, asked" = -1
  )
  engine$label_variable(
    "imspec#", "# of specialists reported", count_labels,
    force_numeric = TRUE
  )

  specialist_labels <- c(
    "internist", "lung specialist", "cardiologist", "endocrinologist",
    "gastro-enterologist", "nephrologist", "rheumatologist",
    "haemotologist", "oncologist", "geriatrist", "neurologist",
    "rehabilitation specialist", "dermatologist", "radiologist",
    "radiotherapist", "nuclear medicine physician", "surgeon",
    "vascular surgeon", "orthopaedist", "urologist", "plastic surgeon",
    "chest surgeon", "neurosurgeon", "oral/dental surgeon",
    "anaesthesiologist", "gynaecologist", "ear/nose/throat specialist",
    "opthalmologist", "clinical chemist / blood examination", "audiologist"
  )
  imspec_labels <- c(
    setNames(-2, paste0("na, see ", toupper(prefix), "IMSPEC#")),
    "not reported" = 0,
    "reported" = 1
  )
  for (i in seq_along(specialist_labels)) {
    engine$label_variable(
      sprintf("imspec%02d", i), specialist_labels[[i]], imspec_labels,
      force_numeric = FALSE
    )
  }

  if (wave %in% c("B", "C", "D", "E", "2B", "F", "G")) {
    mspec_labels <- c(
      setNames(-2, paste0("na, see ", toupper(prefix), "MSPEC#")),
      "not reported" = 0,
      "reported" = 1
    )
    engine$label_variable(
      "mspec31", "psychologist", mspec_labels, force_numeric = FALSE
    )
    engine$label_variable(
      "mspec32", "chiropractor", mspec_labels, force_numeric = FALSE
    )
  }

  if (wave %in% c("D", "E", "2B", "F", "G", "H", "3B", "I")) {
    engine$label_variable(
      "imspec33", "phlebologist", imspec_labels, force_numeric = FALSE
    )
    engine$label_variable(
      "imspec34", "podologist", imspec_labels, force_numeric = FALSE
    )
  }

  if (wave == "2B") {
    tropical_labels <- c(
      "na, see BMSPEC#" = -2, "not reported" = 0, "reported" = 1
    )
    engine$label_variable(
      "mspec35", "tropical doctor", tropical_labels, force_numeric = FALSE
    )
  }

  if (wave %in% c("F", "G", "H", "3B", "I")) {
    engine$label_variable(
      "imspec35", "geneticist", imspec_labels, force_numeric = FALSE
    )
  }

  if (wave %in% c("H", "3B", "I")) {
    engine$label_variable(
      "imspec36", "medical microbiologist", imspec_labels,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
