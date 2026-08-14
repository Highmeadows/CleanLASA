# Apply LASA 185 (foot problems) SPSS labels
#
# Source: LASA185_varinfo.pdf (09-Apr-2024)

#' Apply LASA185 (Foot problems) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the foot-inspection
#' variables documented for LASA185 in waves C, D, E, and F. Waves C and D
#' contain the full inspection battery: whole-foot inspection, eight finding
#' indicators, an other-specification field, pull-up toes, and smack feet.
#' Wave C additionally contains two ankle, two knee, and two pulse-width
#' measurements that the codebook notes were processed in LASAC185 although
#' their questionnaire source was LASAC161. Waves E and F contain only the
#' pull-up-toes item.
#'
#' The six wave-C width measurements are numeric. With `to_numeric = TRUE`,
#' their negative missing codes become `NA`. `to_factor = TRUE` converts
#' labelled categorical variables to factors and retains unlabelled observed
#' codes. Original coding is preserved in `original_values` and
#' `original_labels`.
#'
#' Matching tries a manual `name_corrections` override, an exact match, then a
#' case-insensitive exact match. Standardized naming removes the wave prefix,
#' standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA185 `.sav` file.
#' @param wave Character scalar identifying wave `"C"`, `"D"`, `"E"`, or
#'   `"F"`; matching is case-insensitive.
#' @param name_corrections Optional named character vector mapping suffixes
#'   without the wave prefix (for example `mfeetinsp`) to actual columns.
#' @param to_factor Logical. Convert labelled categorical variables to factors.
#' @param to_numeric Logical. Restore ankle, knee, and pulse widths to plain
#'   numeric and replace negative missing codes with `NA`.
#' @param standardize_names Logical. Standardize matched names and respondent
#'   number, remove wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA185 metadata, optional conversion and renaming, a
#'   `LASA_wave` attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(cmfeetinsp = c(-1, 1, 2), cmankle1 = c(-1, 60, 72))
#' apply_lasa185_labels(dat, wave = "C", to_numeric = TRUE)
apply_lasa185_labels <- function(data,
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
  wave_prefix <- c(C = "c", D = "d", E = "e", F = "f")
  if (!wave %in% names(wave_prefix)) {
    stop("Unknown LASA 185 wave: ", wave, ". Use one of: C, D, E, F.", call. = FALSE)
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
    fn_name = "apply_lasa185_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  pull_up <- c("na, asked" = -1, "yes" = 1, "no" = 2)
  if (wave %in% c("E", "F")) {
    engine$label_variable(
      "mfeetpllts", "Inspection feet: pull up toes", pull_up,
      force_numeric = FALSE
    )
    return(engine$finalize())
  }

  whole <- c("no valid data" = -1, "yes" = 1, "no" = 2)
  finding <- c(
    "na, see C/DMFEETINSP" = -2,
    "no valid data / na, asked" = -1,
    "not mentioned" = 0,
    "mentioned" = 1
  )
  other_spec <- c(
    "na, wrong skip" = -3,
    "na, see C/DMFEETINSP8" = -2,
    "no valid data / na, asked" = -1,
    "to be coded" = 0
  )
  foot_test <- c("na, asked" = -1, "yes" = 1, "no" = 2)

  if (wave == "C") {
    whole <- c("interview terminated" = -5, whole)
    foot_test <- c("interview terminated" = -5, foot_test)
  }

  labels <- c(
    "Inspection feet: sores",
    "Inspection feet: plaster",
    "Inspection feet: corns",
    "Inspection feet: skewed toes",
    "Inspection feet: amputation toes",
    "Inspection feet: amputation part of foot",
    "Inspection feet: amputation feet",
    "Inspection feet: other"
  )
  specs <- list(list("mfeetinsp", "Inspection feet: whole", whole, FALSE))
  for (index in seq_along(labels)) {
    specs[[length(specs) + 1L]] <- list(
      paste0("mfeetinsp", index), labels[[index]], finding, FALSE
    )
  }
  specs <- c(specs, list(
    list("mfeetinspo", "Inspection feet: other specification", other_spec, FALSE),
    list("mfeetpllts", "Inspection feet: pull up toes", foot_test, FALSE),
    list("mfeetsmf", "Inspection feet: smack feet", foot_test, FALSE)
  ))

  if (wave == "C") {
    width_values <- c(
      "na, interview terminated" = -5,
      "no valid data" = -1
    )
    specs <- c(specs, list(
      list("mankle1", "Ankle (1): width in mm", width_values, TRUE),
      list("mankle2", "Ankle (2): width in mm", width_values, TRUE),
      list("mknee1", "Knee (1): width in mm", width_values, TRUE),
      list("mknee2", "Knee (2): width in mm", width_values, TRUE),
      list("mpulse1", "Pulse (1): width in mm", width_values, TRUE),
      list("mpulse2", "Pulse (2): width in mm", width_values, TRUE)
    ))
  }

  for (item in specs) {
    engine$label_variable(item[[1L]], item[[2L]], item[[3L]], force_numeric = item[[4L]])
  }

  engine$finalize()
}
