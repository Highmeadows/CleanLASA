# Apply LASA 273 (loneliness scales) SPSS labels
#
# Source: LASA073_varinfo.pdf (21-Feb-2020), pages 3--5

#' Apply LASA273 (Loneliness Scales) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the three scaled loneliness variables documented
#' as LASA273 in the LASA073 codebook: total, emotional, and social
#' loneliness.
#'
#' LASA273 is documented for waves B, C, D, E, 2B, F, G, H, 3B, MB, I, and J.
#' Every wave contains three scale variables, but missing-value and routing
#' codes differ across B--E, 2B, F, G, and H onward. The total score ranges
#' from no loneliness (0) to severe loneliness (11); emotional and social
#' subscales have documented endpoints 0--6 and 0--5, respectively.
#'
#' All three variables are numeric scale scores. With `to_numeric = TRUE`,
#' they become plain numeric and documented negative missing/routing values
#' become `NA`. With `to_factor = TRUE` alone, the documented endpoint and
#' missing labels can be used as factor levels. Original SPSS values and
#' labels remain available in `original_values` and `original_labels`.
#'
#' Column matching uses an explicit `name_corrections` override, an exact
#' case-sensitive match, and then a case-insensitive exact match. Standardized
#' naming removes the wave prefix, standardizes `respnr`, and inserts a
#' `LASA_wave` column.
#'
#' @param data A data frame or tibble imported from a LASA273 `.sav` file.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, or `"J"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes `lo`, `loemo`, or `losoc` to actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, scale variables are converted to
#'   factors using documented value labels, unless `to_numeric = TRUE` takes
#'   precedence.
#' @param to_numeric Logical. If `TRUE`, scale variables are converted to plain
#'   numeric and negative missing/routing values become `NA`.
#' @param standardize_names Logical. If `TRUE`, matched names and `respnr` are
#'   standardized, wave prefixes are removed, and `LASA_wave` is added.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and `LASA_wave` is added. Implied by
#'   `standardize_names = TRUE`.
#'
#' @return `data` with LASA273 metadata, requested conversions and renaming,
#'   the `LASA_wave` provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()],
#'   [apply_lasa073_labels()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:3, hlo = c(-1, 0, 7), hloemo = c(0, 3, 6))
#' dat <- apply_lasa273_labels(dat, wave = "H", to_numeric = TRUE)
#' attr(dat$hlo, "label")
apply_lasa273_labels <- function(data,
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
    G = "g", H = "h", `3B` = "b", MB = "b", I = "i", J = "j"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 273 wave: ", wave, ". Use one of: ",
      paste(names(wave_prefix), collapse = ", "), ".",
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
    fn_name = "apply_lasa273_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  if (wave %in% c("B", "C", "D", "E")) {
    total_labels <- c(
      "refusal/skip by interviewer" = -4,
      "terminated interview" = -3,
      ">1 miss items" = -2,
      "no loneliness" = 0,
      "severe loneliness" = 11
    )
    emotional_labels <- c(
      "born <=1907|>1937" = 9,
      "phone (unit nonresponse)" = 8,
      "proxy (unit nonresponse)" = 7,
      "unit nonresponse" = 6,
      "short version" = -5,
      "refusal R/skip by interviewer" = -4,
      "terminated interview" = -3,
      ">1 missing items" = -1,
      "no loneliness" = 0,
      "severe loneliness" = 6
    )
    social_labels <- emotional_labels
    social_labels[["severe loneliness"]] <- 5
    total_label <- "loneliness 11 items dichotomous"
    social_label <- "social loneliness <scale de Jong Gierveld>"
  } else if (wave == "2B") {
    total_labels <- c(
      "refusal/skip by interviewer" = -4,
      "terminated interview" = -3,
      ">1 miss items" = -2,
      "no loneliness" = 0,
      "severe loneliness" = 11
    )
    emotional_labels <- c(
      "short version" = -5,
      "refusal R/skip by interviewer" = -4,
      "terminated interview" = -3,
      ">1 missing items" = -1,
      "no loneliness" = 0,
      "severe loneliness" = 6
    )
    social_labels <- emotional_labels
    social_labels[["severe loneliness"]] <- 5
    total_label <- "loneliness 11 items dichotomous"
    social_label <- "social loneliness <scale de Jong Gierveld>"
  } else if (wave == "F") {
    total_labels <- c(
      "refusal/skip by interviewer" = -4,
      "terminated interview" = -3,
      ">1 miss items" = -1,
      "no loneliness" = 0,
      "severe loneliness" = 11
    )
    emotional_labels <- c(
      "born <= 1907" = -9,
      "phone (unit nonresponse)" = 8,
      "proxy (unit nonresponse)" = 7,
      "unit nonresponse" = 6,
      "short version" = -5,
      "refusal/skip by interviewer" = -4,
      "terminated interview" = -3,
      ">1 missing items" = -1,
      "no loneliness" = 0,
      "severe loneliness" = 6
    )
    social_labels <- emotional_labels
    social_labels[["severe loneliness"]] <- 5
    total_label <- "loneliness <scale de Jong Gierveld>"
    social_label <- "social loneliness < scale de Jong Gierveld>"
  } else if (wave == "G") {
    total_labels <- c(
      "short version" = -5,
      "refusal/skip by interviewer" = -4,
      "terminated interview" = -3,
      ">1 missing items" = -1,
      "no loneliness" = 0,
      "severe loneliness" = 11
    )
    emotional_labels <- c(
      "short version" = -5,
      "refusal/skip by interviewer" = -4,
      "terminated interview" = -3,
      ">1 missing items" = -1,
      "no loneliness" = 0,
      "severe loneliness" = 6
    )
    social_labels <- emotional_labels
    social_labels[["severe loneliness"]] <- 5
    total_label <- "loneliness <scale de Jong Gierveld>"
    social_label <- "social loneliness <scale de Jong Gierveld>"
  } else {
    total_labels <- c(
      "short version" = -5,
      "refusal R/skip by interviewer" = -4,
      "not asked (interview terminated" = -3,
      ">2 missing items" = -1,
      "no loneliness" = 0,
      "severe loneliness" = 11
    )
    emotional_labels <- c(
      "short version" = -5,
      "refusal R/skip by interviewer" = -4,
      "not asked (interview terminated" = -3,
      ">1 missing items" = -1,
      "no loneliness" = 0,
      "severe loneliness" = 6
    )
    social_labels <- emotional_labels
    social_labels[["severe loneliness"]] <- 5
    total_label <- "loneliness <scale de Jong Gierveld>"
    social_label <- "social loneliness <scale de Jong Gierveld>"
  }

  engine$label_variable(
    "lo", total_label, total_labels, force_numeric = TRUE
  )
  engine$label_variable(
    "loemo", "emotional loneliness <scale de Jong Gierveld>",
    emotional_labels, force_numeric = TRUE
  )
  engine$label_variable(
    "losoc", social_label, social_labels, force_numeric = TRUE
  )

  engine$finalize()
}
