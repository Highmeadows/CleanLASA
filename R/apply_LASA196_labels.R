# Apply LASA 196 (health literacy) SPSS labels
#
# Source: LASA196_varinfo.pdf (18-Mar-2024)

#' Apply LASA196 (Health literacy) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the 16 Health Literacy Questionnaire items
#' documented for LASA196 in wave K. Items cover finding, understanding,
#' judging, and applying treatment, prevention, and health-promotion
#' information. All use the documented four-level ease/difficulty response
#' scale and the `-1` not-asked code.
#'
#' Column matching tries an explicit `name_corrections` override, an exact
#' case-sensitive match, and a case-insensitive exact match, in that order.
#' `to_factor = TRUE` converts matched items to factors while retaining
#' observed undocumented codes as numeric-text levels. LASA196 has no numeric
#' variables eligible for `to_numeric`. Original values and labels are
#' preserved, and optional standardized naming removes the wave prefix,
#' standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA196 `.sav` file.
#' @param wave Character scalar identifying the LASA wave. Only `"K"` is
#'   documented; matching is case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (for example `mhlq1`) to actual columns.
#' @param to_factor Logical. Convert labelled categorical items to factors.
#' @param to_numeric Logical. Accepted for the shared interface; LASA196 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove the wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove the wave prefix and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA196 metadata, optional conversion and renaming, the
#'   `LASA_wave` provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, KMHLQ1 = c(-1, 1), kmhlq16 = c(2, 4))
#' apply_lasa196_labels(dat, wave = "K")
apply_lasa196_labels <- function(data,
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
  if (wave != "K") {
    stop("Unknown LASA 196 wave: ", wave, ". Use K.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = "k",
    fn_name = "apply_lasa196_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  response_labels <- c(
    "na, asked" = -1,
    "very easy" = 1,
    "fairly easy" = 2,
    "fairly difficult" = 3,
    "very difficult" = 4
  )
  item_labels <- c(
    "HLQ: find information about the treatment of illnesses that concern you",
    "HLQ: find out where to go for professional help when sick",
    "HLQ: understand what your doctor says to you",
    "HLQ: understand doctor or pharmacist instruction on how to take a prescribed medicine",
    "HLQ: judge when you may need a second opinion from another doctor",
    "HLQ: make a decision about illness with information from doctor",
    "HLQ: follow instructions from your doctor or pharmacist",
    "HLQ: find information on how to manage mental health problems (stress or depression)",
    "HLQ: understand warnings about unhealthy behaviours (smoking, low physical activity and drinking too much)",
    "HLQ: understand why you need health screenings",
    "HLQ: judge if information on health risks in media is reliable",
    "HLQ: decide how to protect yourself from illness based on information in the media",
    "HLQ: find information about activities that are good for your mental well-being",
    "HLQ: understand advice on health from family or friends",
    "HLQ: understand information in media on how to get healthier",
    "HLQ: judge which everyday behaviour is related to your health"
  )

  for (i in seq_along(item_labels)) {
    engine$label_variable(
      paste0("mhlq", i), item_labels[[i]], response_labels,
      force_numeric = FALSE
    )
  }
  engine$finalize()
}
