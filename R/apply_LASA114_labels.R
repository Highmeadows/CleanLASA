# Apply LASA 114 (perceived physical activity; LIVAS) SPSS labels
#
# Source: LASA114_varinfo.pdf (04-Sep-2012)

#' Apply LASA114 (Perceived physical activity; LIVAS) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the ten perceived-physical-activity self-efficacy
#' items documented for LASA114. The items compare current flexibility,
#' reaction time, strength, condition, smooth movement, stair climbing, grip,
#' walking speed, balance, and activity with five years earlier.
#'
#' LASA114 is documented for waves B, C, D, E, 2B, and F. Each wave contains
#' the same ten categorical items; only the wave prefix differs. Item-specific
#' response wording is reproduced from the codebook, including the common
#' `-1` no-answer code. The separately documented LIVAS scale score belongs
#' to filecode LASA314 and is deliberately not included here.
#'
#' Column matching tries, in order: an explicit `name_corrections` override,
#' an exact case-sensitive match, and a case-insensitive exact match.
#' `to_factor = TRUE` converts matched categorical items to factors while
#' retaining observed unlabelled codes as numeric-text levels. LASA114 has no
#' numeric variables eligible for `to_numeric` conversion. Original values
#' and labels are preserved in `original_values` and `original_labels`.
#'
#' @param data A data frame or tibble imported from a LASA114 `.sav` file,
#'   for example via [haven::read_sav()].
#' @param wave Character scalar identifying the LASA wave. One of `"B"`,
#'   `"C"`, `"D"`, `"E"`, `"2B"`, or `"F"`; matching is case-insensitive.
#' @param name_corrections Optional named character vector. Names are
#'   canonical suffixes without a wave prefix (for example `qseff01`) and
#'   values are actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to
#'   factors using their documented value labels.
#' @param to_numeric Logical. Accepted for the shared interface; LASA114 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. Rename matched columns to lowercase
#'   suffixes without the wave prefix, standardize the respondent-number
#'   column to `respnr`, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove the wave prefix from matched column
#'   names and add `LASA_wave`. Always enabled by `standardize_names = TRUE`.
#'
#' @return `data` with documented metadata applied, optional conversion and
#'   renaming, a `LASA_wave` attribute, and a matching audit in the
#'   `label_report` attribute.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   BQSEFF01 = c(-1, 1, 5),
#'   bqseff10 = c(1, 3, 5)
#' )
#' dat <- apply_lasa114_labels(dat, wave = "B")
#' attr(dat$BQSEFF01, "labels")
apply_lasa114_labels <- function(data,
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
  wave_prefix <- c(B = "b", C = "c", D = "d", E = "e", `2B` = "b", F = "f")
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 114 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa114_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  specs <- list(
    list(
      "qseff01", "Self efficacy 1: flexible (+)",
      c(
        "no answer" = -1, "much more flexible" = 1, "more flexible" = 2,
        "just as flexible" = 3, "less flexible" = 4,
        "much less flexible" = 5
      )
    ),
    list(
      "qseff02", "Self efficacy 2: reaction time (+)",
      c(
        "no answer" = -1, "much better" = 1, "better" = 2,
        "just as good" = 3, "worse" = 4, "much worse" = 5
      )
    ),
    list(
      "qseff03", "self efficacy 3: strong (-)",
      c(
        "no answer" = -1, "much less strong" = 1, "less strong" = 2,
        "just as strong" = 3, "stronger" = 4, "much stronger" = 5
      )
    ),
    list(
      "qseff04", "Self efficacy 4: good condition (+)",
      c(
        "no answer" = -1, "much better" = 1, "better" = 2,
        "just as good" = 3, "worse" = 4, "much worse" = 5
      )
    ),
    list(
      "qseff05", "self efficacy 5: move smoothly (-)",
      c(
        "no answer" = -1, "much less smoothly" = 1, "less smoothly" = 2,
        "just as smoothly" = 3, "more smoothly" = 4,
        "much more smoothly" = 5
      )
    ),
    list(
      "qseff06", "Self efficacy 6: stairs (+)",
      c(
        "no answer" = -1, "much more easy" = 1, "more easy" = 2,
        "just as easy" = 3, "more difficult" = 4,
        "much more difficult" = 5
      )
    ),
    list(
      "qseff07", "self efficacy 7: strong grip (+)",
      c(
        "no answer" = -1, "much greater" = 1, "greater" = 2,
        "smaller" = 3, "less" = 4, "much smaller" = 5
      )
    ),
    list(
      "qseff08", "Self efficacy 8: walk fast (-)",
      c(
        "no answer" = -1, "much slower" = 1, "slower" = 2,
        "just as fast" = 3, "faster" = 4, "much faster" = 5
      )
    ),
    list(
      "qseff09", "Self efficacy 9: good balance (+)",
      c(
        "no answer" = -1, "much better" = 1, "better" = 2,
        "just as good" = 3, "worse" = 4, "much worse" = 5
      )
    ),
    list(
      "qseff10", "Self efficacy 10: active (-)",
      c(
        "no answer" = -1, "much less active" = 1, "less active" = 2,
        "just as active" = 3, "more active" = 4,
        "much more active" = 5
      )
    )
  )

  for (item in specs) {
    engine$label_variable(item[[1L]], item[[2L]], item[[3L]], force_numeric = FALSE)
  }

  engine$finalize()
}
