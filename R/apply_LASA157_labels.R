# Apply LASA 157 (contrast sensitivity test) SPSS labels
#
# Source: LASA157_varinfo.pdf (05-Apr-2024)

#' Apply LASA157 (Contrast sensitivity test) SPSS labels
#'
#' Attaches the variable and value labels documented for LASA157 contrast
#' sensitivity data. Waves B, C, and D contain functional test variables;
#' waves E, 2B, and F contain only the six self-reported daily-sight items.
#' The inventories and missing-value codes differ materially by wave.
#'
#' Matching uses an explicit `name_corrections` entry, an exact match, then a
#' case-insensitive exact match. `to_factor = TRUE` converts categorical
#' variables to factors while retaining observed undocumented codes.
#' `to_numeric = TRUE` restores contrast measurements and scores whose
#' codebook labels contain only negative missing-value codes to plain numeric,
#' replacing those negative codes with `NA`. Original values and labels remain
#' available in `original_values` and `original_labels` attributes.
#'
#' @param data A data frame or tibble imported from a LASA157 `.sav` file.
#' @param wave Character scalar: `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, or
#'   `"F"`; matching is case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix to actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors.
#' @param to_numeric Logical. Convert eligible test measurements and scores to
#'   plain numeric and replace documented negative missing codes with `NA`.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove the wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes from matched names and
#'   add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA157 metadata, optional conversions and renaming, a
#'   `LASA_wave` attribute, and a `label_report` matching audit.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, bmdasig1 = c(-1, 2), bmcontra = c(-1, 12))
#' apply_lasa157_labels(dat, wave = "B")
apply_lasa157_labels <- function(data,
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
      "Unknown LASA 157 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa157_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  daily_sight_labels <- c(
    "no answer, asked" = -1,
    "rarely" = 1,
    "sometimes" = 2,
    "often" = 3,
    "almost always" = 4
  )

  if (wave == "B") {
    b_sight_labels <- c(
      "no valid data" = -3,
      "no measurement done" = -2,
      daily_sight_labels
    )
    label_variable("mdasig1", "weather: cloudy", b_sight_labels, FALSE)
    label_variable("mdasig2", "weather: clear sky", b_sight_labels, FALSE)
    label_variable("mdasig3", "sight: blinded by indoor/outdoor", b_sight_labels, FALSE)

    b_measure_labels <- c(
      "no valid data" = -3,
      "no measurement done" = -2,
      "no answer, asked" = -1
    )
    label_variable("mctinch", "contrast: inch", b_measure_labels, TRUE)
    for (eye in c("right", "left")) {
      side <- if (eye == "right") "rey" else "ley"
      for (i in seq_len(5L)) {
        label_variable(
          paste0("mct", side, i),
          paste0("contrast: ", eye, " eye ", LETTERS[[i]]),
          b_measure_labels,
          TRUE
        )
      }
    }
    participation <- c(
      b_measure_labels,
      "excellent" = 1, "good" = 2, "moderate" = 3, "bad" = 4,
      "refused" = 5, "other reason" = 6
    )
    label_variable("mctunde", "understanding of contrast test", b_measure_labels, TRUE)
    label_variable("mctpart", "participation with contrast test", participation, FALSE)
    label_variable("mricont", "right eye: total score low-high", c("no valid data" = -1), TRUE)
    label_variable("mlecont", "left eye: total score low-high", c("no valid data" = -1), TRUE)
    label_variable("mcontra", "contrast: total score low-high", c("no valid data" = -1), TRUE)
  } else if (wave == "C") {
    c_sight_labels <- c("no valid data" = -3, daily_sight_labels)
    label_variable("mdasig1", "weather: cloudy", c_sight_labels, FALSE)
    label_variable("mdasig2", "weather: clear sky", c_sight_labels, FALSE)
    label_variable("mdasig3", "weather: blinded by indoor/outdoor", c_sight_labels, FALSE)
    label_variable(
      "meyetes", "Eye contrast test done: constructed",
      c("done" = 1, "not done" = 2, "no right eye" = 3,
        "no left eye" = 4, "terminated" = 5),
      FALSE
    )
    label_variable(
      "mctrm", "reason contrast test not done",
      c("na, see CMEYETES" = -2, "refused" = 4,
        "not able to [cognitive]" = 5, "not able to [physical]" = 6,
        "technical problems" = 7, "unknown" = 8),
      FALSE
    )
    label_variable(
      "mctinch", "contrast: inch",
      c("na, wrong skip" = -3, "na, see CMEYETES" = -2,
        "30cm" = 1, "32cm" = 2, "40cm" = 3, "18inch [ca 46 cm]" = 4),
      FALSE
    )
    c_measure_labels <- c(
      "na, wrong skip" = -3,
      "na, see CMEYETES" = -2,
      "na, asked" = -1
    )
    for (eye in c("right", "left")) {
      side <- if (eye == "right") "rey" else "ley"
      for (i in seq_len(5L)) {
        label_variable(
          paste0("mct", side, i),
          paste0("contrast: ", eye, " eye ", LETTERS[[i]]),
          c_measure_labels,
          TRUE
        )
      }
    }
    label_variable("mctunde", "understanding of contrast test", c_measure_labels, TRUE)
    c_participation <- c(
      c_measure_labels,
      "excellent" = 1, "good" = 2, "moderate" = 3, "bad" = 4,
      "other: not done" = 10, "other: not able to: phys" = 20,
      "other: not able to: cogn" = 30,
      "other: not done: technical" = 40
    )
    label_variable("mctpart", "participation with contrast test", c_participation, FALSE)
    label_variable(
      "mctglas", "during test: glasses or contact lenses",
      c(c_measure_labels, "none" = 1, "glasses" = 2, "contact lenses" = 3),
      FALSE
    )
  } else {
    daily_labels <- c("no answer, asked" = -1, daily_sight_labels[daily_sight_labels > 0])
    daily_variables <- c(
      "Daily sight: see better cloudy vs sunny weather",
      "Daily sight: blinded on clear day",
      "Daily sight: blinded when indoor -> outdoor",
      "Daily sight: see bicycles and cars approaching",
      "Daily sight: regularly do not see doors and chairs",
      "Daily sight: regularly do not see floor related objects"
    )
    for (i in seq_along(daily_variables)) {
      label_variable(paste0("mdasig", i), daily_variables[[i]], daily_labels, FALSE)
    }

    if (wave == "D") {
      d_measure_labels <- c("no measurement" = -1)
      for (eye in c("right", "left")) {
        side <- if (eye == "right") "rey" else "ley"
        for (i in seq_len(5L)) {
          label_variable(
            paste0("mct", side, i),
            paste0("contrast test: ", eye, " eye ", LETTERS[[i]]),
            d_measure_labels,
            TRUE
          )
        }
      }
      label_variable(
        "mctunde", "understanding of contrast test",
        c("no measurement done" = -2, "no answer, asked" = -1),
        TRUE
      )
      label_variable(
        "mctpart", "participation with contrast test",
        c("no measurement done" = -2, "no answer, asked" = -1,
          "excellent" = 1, "good" = 2, "moderate" = 3, "bad" = 4,
          "refused" = 5, "other reason" = 6),
        FALSE
      )
      label_variable("mctinch", "contast test: inch", d_measure_labels, TRUE)
      label_variable(
        "mctglcl", "contrast test: with glasses or contact lenses",
        c("no answer, asked" = -1, "none" = 1,
          "glasses" = 2, "contact lenses" = 3),
        FALSE
      )
    }
  }

  engine$finalize()
}
