# Apply LASA 149 (General Self Regulation) SPSS labels
#
# Source: LASA149_varinfo.pdf (18-Apr-2024)

#' Apply LASA149 (General Self Regulation) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the fourteen General Self Regulation (GSR) items
#' documented for LASA149. The item set covers strategy use, metastrategy
#' knowledge, action planning, and coping planning.
#'
#' LASA149 is documented for waves G and H. Both waves contain the same
#' fourteen categorical items; only the wave prefix differs. All items use a
#' six-point agreement scale and the `-1` no-answer code. The GSR total and
#' subscale scores shown in the same codebook belong to filecode LASA349 and
#' are deliberately not included here.
#'
#' Column matching tries, in order: an explicit `name_corrections` override,
#' an exact case-sensitive match, and a case-insensitive exact match.
#' `to_factor = TRUE` converts matched categorical items to factors while
#' retaining observed unlabelled codes as numeric-text levels. LASA149 has no
#' numeric variables eligible for `to_numeric` conversion. Original values
#' and labels are preserved in `original_values` and `original_labels`.
#'
#' @param data A data frame or tibble imported from a LASA149 `.sav` file,
#'   for example via [haven::read_sav()].
#' @param wave Character scalar identifying LASA wave `"G"` or `"H"`;
#'   matching is case-insensitive.
#' @param name_corrections Optional named character vector. Names are
#'   canonical suffixes without a wave prefix (for example `qgsr01`) and
#'   values are actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors
#'   using their documented value labels.
#' @param to_numeric Logical. Accepted for the shared interface; LASA149 has
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
#'   GQGSR01 = c(-1, 1, 6),
#'   gqgsr14 = c(1, 3, 6)
#' )
#' dat <- apply_lasa149_labels(dat, wave = "G")
#' attr(dat$GQGSR01, "labels")
apply_lasa149_labels <- function(data,
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
  wave_prefix <- c(G = "g", H = "h")
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 149 wave: ", wave, ". Use one of: G, H.",
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
    fn_name = "apply_lasa149_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  agreement_labels <- c(
    "no answer" = -1,
    "strongly disagree" = 1,
    "disagree" = 2,
    "slightly disagree" = 3,
    "slightly agree" = 4,
    "agree" = 5,
    "strongly agree" = 6
  )

  item_labels <- c(
    "MK2: exhausting to pursue goal, search a new goal",
    "SU3: harder to get same results, keep trying harder",
    "MK3: try to pursue several goals",
    "SU1: effort to achieve a given goal",
    "SU2: set goals clearly, stick to them",
    "AP3: for goals detailed plans how to implement them",
    "CP1: have a backup plan in case something goes wrong",
    "MK1: if difficulty try to achieve goal by other means",
    "MK4: goal difficult to reach, find alternative route",
    "CP3: plan for things other people consider unlikely",
    "AP1: always make detailed plans for my goals",
    "SU4: cannot do something the way before look for new goal",
    "CP2: plan for difficult situations according my intentions",
    "AP2: for my goals make detailed plans when to implement"
  )

  for (i in seq_along(item_labels)) {
    engine$label_variable(
      sprintf("qgsr%02d", i), item_labels[[i]], agreement_labels,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
