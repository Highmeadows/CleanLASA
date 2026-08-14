# Apply LASA 135 (EuroQol/VAS) SPSS variable and value labels
#
# Source: LASA135_varinfo.pdf (14-Nov-2017)

#' Apply LASA135 (EuroQol/VAS) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the six EuroQol variables documented in LASA135
#' for waves E, F, G, H, 3B, and I.
#'
#' The inventory contains the five three-level EQ-5D dimensions (mobility,
#' self-care, usual activities, pain/discomfort, and anxiety/depression) and
#' the 0--100 EQ visual analogue scale. The two TTO index variables shown in
#' the same source document belong to the separate LASA335 scale-score file
#' and are intentionally not labelled by this LASA135 function.
#'
#' The EQ-5D dimensions are categorical. The EQVAS score is numeric and its
#' documented -1 missing code becomes `NA` when `to_numeric = TRUE`. With
#' `to_factor = TRUE`, variables carrying value labels become factors and
#' observed unlabelled codes remain numeric-text levels. `to_numeric` takes
#' precedence for EQVAS.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive match, and (3) a
#' case-insensitive exact match. Variables absent from `data` are recorded as
#' `"not found"` in the matching audit. Original labels and values are
#' preserved, and optional standardized naming removes the wave prefix,
#' standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA135 `.sav` file,
#'   for example via [haven::read_sav()]. Documented names run from
#'   `eqeq5d1` through `eqeqvas` in wave E, with the corresponding `f`, `g`,
#'   `h`, `b` (3B), or `i` prefix in later files.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"E"`, `"F"`, `"G"`, `"H"`, `"3B"`, or
#'   `"I"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   LASA135 suffixes without the wave prefix (`qeq5d1` through `qeq5d5`, or
#'   `qeqvas`) to actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, variables with documented value labels
#'   are converted to factors. Observed unlabelled codes remain numeric-text
#'   levels.
#' @param to_numeric Logical. If `TRUE`, EQVAS is restored to plain numeric
#'   and negative values are replaced by `NA`.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column containing the selected wave is
#'   inserted immediately after the respondent-number column.
#'
#' @return `data`, with LASA135 variable/value labels, optional conversion and
#'   standardized naming, preserved original SPSS coding, the `LASA_wave`
#'   provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, eqeq5d1 = c(1, 2), eqeqvas = c(-1, 80))
#' dat <- apply_lasa135_labels(dat, wave = "E", to_numeric = TRUE)
#' attr(dat$eqeq5d1, "labels")
apply_lasa135_labels <- function(data,
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
  valid_waves <- c("E", "F", "G", "H", "3B", "I")
  if (!wave %in% valid_waves) {
    stop(
      "Unknown LASA 135 wave: ", wave,
      ". Use one of: E, F, G, H, 3B, I.",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  prefix <- switch(
    wave,
    E = "e", F = "f", G = "g", H = "h", `3B` = "b", I = "i"
  )
  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa135_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  engine$label_variable(
    "qeq5d1", "EQ5D1: Mobility",
    c(
      "no answer" = -1,
      "no problems walking" = 1,
      "some problems walking" = 2,
      "confined to bed" = 3
    ),
    force_numeric = FALSE
  )
  engine$label_variable(
    "qeq5d2", "EQ5D2: Self-care",
    c(
      "no answer" = -1,
      "no problems washing/dressing" = 1,
      "some problems washing/dressing" = 2,
      "unable to wash/dress" = 3
    ),
    force_numeric = FALSE
  )
  engine$label_variable(
    "qeq5d3", "EQ5D3: Usual activities",
    c(
      "no answer" = -1,
      "no problems usual activities" = 1,
      "some problems usual activities" = 2,
      "unable to perform usual activities" = 3
    ),
    force_numeric = FALSE
  )
  engine$label_variable(
    "qeq5d4", "EQ5D4: Pain/discomfort",
    c(
      "no answer" = -1,
      "no pain/discomfort" = 1,
      "moderate pain/discomfort" = 2,
      "extreme pain/discomfort" = 3
    ),
    force_numeric = FALSE
  )
  engine$label_variable(
    "qeq5d5", "EQ5D5: Anxiety/depression",
    c(
      "no answer" = -1,
      "not anxious/depressed" = 1,
      "moderately anxious/depressed" = 2,
      "extreme anxious/depressed" = 3
    ),
    force_numeric = FALSE
  )
  engine$label_variable(
    "qeqvas", "EQVAS: Self-rated health (scale)",
    c(
      "no answer" = -1,
      "worst possible health state" = 0,
      "best possible health state" = 100
    ),
    force_numeric = TRUE
  )

  engine$finalize()
}
