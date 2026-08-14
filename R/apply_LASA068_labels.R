# Apply LASA 068 (care in country of origin) SPSS labels
#
# Source: LASA068_varinfo.pdf (08-Dec-2017)

#' Apply LASA068 (Care in country of origin) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the 17 variables documented in the LASMB068 care-
#' in-country-of-origin file.
#'
#' The file contains one screening item for medical care during a stay in the
#' country of origin in the past year, six types of provider contacted, and
#' ten reasons for obtaining that care. The 16 follow-up items share the same
#' documented routing and mentioned/not-mentioned value map.
#'
#' All LASA068 variables are categorical. Consequently, `to_numeric` is
#' accepted for consistency with the shared apply-labels interface but does
#' not convert them. With `to_factor = TRUE`, matched variables become
#' factors and observed unlabelled codes remain numeric-text levels.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive exact match. Documented variables absent from `data` are
#' left untouched and recorded as `"not found"` in the generic matching audit.
#'
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` follow the parameter contract shared by the package's
#' other `apply_*_labels()` functions. Regardless of conversion, every
#' matched column keeps its original SPSS coding in
#' `attr(x, "original_labels")` and `attr(x, "original_values")`. The
#' `"respnr"` column is matched in any capitalization and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASMB068 `.sav` file,
#'   for example via [haven::read_sav()]. Names include `bmcarco`, `bmcarc1`,
#'   and `bmcarr10`.
#' @param wave Character scalar identifying the LASA wave. Only `"MB"` is
#'   documented and accepted; matching is case-insensitive.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA068 suffixes without the `b`
#'   prefix (for example `mcarco`, `mcarc1`, or `mcarr10`), and values are
#'   actual column names in `data`.
#' @param to_factor Logical. If `FALSE` (default), variables remain numeric
#'   with SPSS-style value-label attributes. If `TRUE`, they are converted to
#'   factors using the documented labels. An observed unlabelled code remains
#'   a numeric-text factor level.
#' @param to_numeric Logical. Accepted for interface consistency. LASA068 has
#'   no numeric variables eligible for conversion, so this argument does not
#'   alter matched columns.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched columns are renamed to their canonical lowercase suffixes
#'   with the `b` prefix removed; `"respnr"` is standardized; and
#'   `split_wavecode` is always treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with their `b` prefix removed and a new
#'   `"LASA_wave"` column filled with `"MB"` is inserted immediately after
#'   the respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA068 column, optional factor conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. The generic matching audit is attached as
#'   `attr(data, "label_report")` and can be retrieved with
#'   [lasa_label_report()].
#'
#' @seealso [apply_lasa048_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   bmcarco = c(-4, 1, 2),
#'   bmcarc1 = c(-2, 0, 1),
#'   bmcarr01 = c(-2, 1, 0)
#' )
#' dat <- apply_lasa068_labels(dat, wave = "MB")
#' attr(dat$bmcarc1, "labels")
apply_lasa068_labels <- function(data,
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
  if (wave != "MB") {
    stop("Unknown LASA 068 wave: ", wave, ". Use: MB.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = "b",
    fn_name = "apply_lasa068_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  screening <- c(
    "na, terminated interview" = -4,
    "na, asked" = -1,
    "no" = 1,
    "yes" = 2
  )
  follow_up <- c(
    "na, see BMCARCO" = -2,
    "not mentioned" = 0,
    "mentioned" = 1
  )

  engine$label_variable(
    "mcarco", "Medical care during stay in country of origin past year",
    screening
  )

  contact_labels <- c(
    "Medical care: contact with pharmacy",
    "Medical care: contact with physician or specialist",
    "Medical care: contact with hospital or health centre",
    "Medical care: contact with dentist",
    "Medical care: contact with alternative or traditional healer",
    "Medical care: contact with other"
  )
  for (i in seq_along(contact_labels)) {
    engine$label_variable(
      paste0("mcarc", i), contact_labels[[i]], follow_up
    )
  }

  reason_labels <- c(
    "Medical care reason: new complaint / sickness during stay",
    "Medical care reason: dissatisfaction about care in the Netherlands",
    "Medical care reason: severity of the complaint during stay",
    "Medical care reason: no language barriers with physician or specialist",
    "Medical care reason: periodic consultation / health check",
    "Medical care reason: to buy medicines not prescribed in the Netherlands",
    "Medical care reason: to buy medicines not available in the Netherlands",
    "Medical care reason: cheaper in country of origin",
    "Medical care reason: because of the waiting lists in the Netherlands",
    "Medical care reason: other"
  )
  for (i in seq_along(reason_labels)) {
    engine$label_variable(
      sprintf("mcarr%02d", i), reason_labels[[i]], follow_up
    )
  }

  engine$finalize()
}
