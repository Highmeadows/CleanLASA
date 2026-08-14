# Apply LASA 133 (SF-12 and WHO quality of life) SPSS labels
#
# Source: LASA133_varinfo.pdf (31-Jan-2024)

#' Apply LASA133 (SF-12 and WHO quality of life) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the SF-12 and WHO
#' quality-of-life items documented in LASA133 for waves D, E, F, G, H, 3B,
#' I, J, and K.
#'
#' Every documented wave contains the 12 SF-12 items for general health,
#' physical functioning, role limitations, pain, mental health, vitality, and
#' social functioning. Waves I, J, and K additionally contain two WHOQOL
#' items rating quality of life and whether life feels meaningful. Derived
#' scores in the separate LASA333 and LASA533 files are intentionally outside
#' this function's scope.
#'
#' All LASA133 variables are categorical. `to_numeric` is accepted for
#' interface consistency but does not convert them. `to_factor = TRUE`
#' converts matched variables using the documented value labels.
#'
#' Matching tries `name_corrections`, an exact case-sensitive match, and then
#' a case-insensitive exact match. Original SPSS coding is preserved;
#' standardized naming removes the wave prefix and can add `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA133 `.sav` file.
#'   Names include wave-prefixed `quli01`--`quli12`, plus `quli13` and
#'   `quli14` in waves I--K.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"D"`, `"E"`, `"F"`, `"G"`, `"H"`,
#'   `"3B"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector mapping suffixes
#'   without the wave prefix (for example `quli01` or `quli14`) to actual
#'   names in `data`.
#' @param to_factor Logical. If `TRUE`, matched variables are converted to
#'   factors using the documented labels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA133 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. If `TRUE`, matched names and `respnr` are
#'   standardized and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched names lose the wave prefix
#'   and a `LASA_wave` column is inserted after `respnr`.
#'
#' @return `data`, with LASA133 labels, requested conversion or renaming,
#'   preserved original coding, `LASA_wave` provenance, and a `label_report`.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(dquli01 = c(1, 5), dquli08 = c(1, 4))
#' dat <- apply_lasa133_labels(dat, wave = "D", to_factor = TRUE)
#' attr(dat$dquli01, "labels")
apply_lasa133_labels <- function(data,
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
  valid_waves <- c("D", "E", "F", "G", "H", "3B", "I", "J", "K")
  if (!wave %in% valid_waves) {
    stop(
      "Unknown LASA 133 wave: ", wave,
      ". Use one of: D, E, F, G, H, 3B, I, J, K.", call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  prefix <- if (wave == "3B") "b" else tolower(wave)
  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = prefix,
    fn_name = "apply_lasa133_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  general_health <- c(
    "asked, no answer" = -1, "excellent" = 1, "very good" = 2,
    "good" = 3, "fair" = 4, "poor" = 5
  )
  physical_function <- c(
    "asked, no answer" = -1, "yes, limited a lot" = 1,
    "yes, limited a little" = 2, "no, not limited at all" = 3
  )
  yes_no <- c("asked, no answer" = -1, "yes" = 1, "no" = 2)
  pain <- c(
    "asked, no answer" = -1, "not at all" = 1, "a little bit" = 2,
    "moderately" = 3, "quite a bit" = 4, "extremely" = 5
  )
  time_frequency <- c(
    "asked, no answer" = -1, "all of the time" = 1,
    "most of the time" = 2, "a good bit of the time" = 3,
    "some of the time" = 4, "a little of the time" = 5,
    "none of the time" = 6
  )

  item_labels <- c(
    "SF12-01: GH, general health",
    "SF12-02: PF, moderate activities",
    "SF12-03: PF, climbing stairs",
    "SF12-04: RP, physical accomplished less",
    "SF12-05: RP, limited in activities",
    "SF12-06: RE, mental accomplished less",
    "SF12-07: RE, work not careful",
    "SF12-08: BP, pain",
    "SF12-09: MH, calm",
    "SF12-10: VT, energy",
    "SF12-11: MH, blue",
    "SF12-12: SF, social activities"
  )
  item_maps <- list(
    general_health, physical_function, physical_function,
    yes_no, yes_no, yes_no, yes_no, pain,
    time_frequency, time_frequency, time_frequency, time_frequency
  )
  for (i in seq_along(item_labels)) {
    engine$label_variable(
      sprintf("quli%02d", i), item_labels[[i]], item_maps[[i]]
    )
  }

  if (wave %in% c("I", "J", "K")) {
    engine$label_variable(
      "quli13", "WHOQOL: rating quality of life",
      c(
        "asked, no answer" = -1, "very poor" = 1, "rather poor" = 2,
        "neither poor nor good" = 3, "rather good" = 4,
        "very good" = 5
      )
    )
    engine$label_variable(
      "quli14", "WHOQOL: feeling life is meaningful",
      c(
        "asked, no answer" = -1, "not at all" = 1, "a little" = 2,
        "a moderate amount" = 3, "very much" = 4,
        "an extreme amount" = 5
      )
    )
  }

  engine$finalize()
}
