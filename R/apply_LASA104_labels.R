# Apply LASA 104 (perceived stress) SPSS labels
#
# Source: LASA104_varinfo.pdf (26-Jun-2023)

#' Apply LASA104 (Perceived stress) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the ten perceived-stress questionnaire items
#' documented in LASA104 for waves H and 3B.
#'
#' All ten items use the same response scale from never to very often, with
#' code -1 for no answer. The perceived-stress total score shown in the same
#' source PDF belongs to filecode LASA304 and is deliberately not included in
#' this LASA104 function.
#'
#' LASA104 variables are categorical, so `to_numeric` is accepted for the
#' shared interface but does not convert them. With `to_factor = TRUE`,
#' matched variables become factors using the documented response labels;
#' observed unlabelled codes remain numeric-text levels.
#'
#' Column matching tries an explicit `name_corrections` override, an exact
#' case-sensitive name, then a case-insensitive exact name. Every matched
#' column preserves its original SPSS coding in `original_labels` and
#' `original_values`. Requested name standardization removes the wave prefix,
#' standardizes `respnr`, and inserts `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA104 `.sav` file.
#'   Documented names are `hqpss01` through `hqpss10` in H and `bqpss01`
#'   through `bqpss10` in 3B.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"H"` or `"3B"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (for example `qpss01` or `qpss10`) to
#'   actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, matched variables are converted to
#'   factors using the documented labels; observed unlabelled codes remain
#'   numeric-text levels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA104 has
#'   no variables eligible for numeric conversion.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes, `respnr` is standardized, and
#'   `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched names have their `h` or
#'   `b` wave prefix removed and a `LASA_wave` column is inserted immediately
#'   after the respondent-number column.
#'
#' @return `data`, with LASA104 labels, optional factor conversion and name
#'   standardization, preserved original SPSS coding, the `LASA_wave`
#'   provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [apply_lasa304_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(hqpss01 = c(-1, 0, 4), hqpss04 = c(1, 2, 3))
#' dat <- apply_lasa104_labels(dat, wave = "H")
#' attr(dat$hqpss01, "labels")
apply_lasa104_labels <- function(data,
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
  wave_prefix <- c(H = "h", `3B` = "b")
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 104 wave: ", wave, ". Use one of: H, 3B.",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = unname(wave_prefix[[wave]]),
    fn_name = "apply_lasa104_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  response <- c(
    "no answer" = -1,
    "never" = 0,
    "almost never" = 1,
    "sometimes" = 2,
    "often" = 3,
    "very often" = 4
  )
  variable_labels <- c(
    "upset because something unexpected",
    "felt unable to control things",
    "felt nervous and stressed",
    "felt confident",
    "felt things going your way",
    "felt could not cope with things",
    "been able to control irritations",
    "felt on top of things",
    "angered because things outside control",
    "felt difficulties piling up"
  )

  for (i in seq_along(variable_labels)) {
    engine$label_variable(
      sprintf("qpss%02d", i), variable_labels[[i]], response,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
