# Apply LASA 222 (constructed Raven scores) SPSS labels
#
# Source: LASA022_varinfo.pdf (25-Mar-2022), LAS(A)*222 sections

#' Apply LASA222 (Constructed Raven scores) SPSS labels
#'
#' Attaches SPSS-style labels to the constructed Raven Coloured Progressive
#' Matrices scores in LASA222: section A, section B, total score, and reason
#' fields. LASA222 is documented for waves B, C, D, E, 2B, F, and G.
#'
#' The inventory contains four variables in B through 2B and five in F and G,
#' where separate reason fields are supplied for section B and the complete
#' test. The codebook documents wave-specific names and coding, including
#' `na, see BRMCRAV` in B, physical/visual wording in B and C, a `-1` linked
#' reason in F and G, and an additional code 0 in G. Score variables are
#' numeric and `to_numeric = TRUE` replaces their negative missing codes with
#' `NA`; reason variables remain categorical. Matching, factor conversion,
#' original-value preservation, name standardization, `respnr`, `LASA_wave`,
#' and the `label_report` follow the shared label engine.
#'
#' @param data A data frame or tibble imported from a LASA222 `.sav` file.
#' @param wave Character scalar identifying B, C, D, E, 2B, F, or G.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes for the selected wave to actual columns.
#' @param to_factor Logical. Convert labelled categorical variables to factors
#'   unless numeric restoration takes precedence.
#' @param to_numeric Logical. Restore score variables to plain numeric and
#'   replace negative missing codes with `NA`.
#' @param standardize_names Logical. Standardize names and `respnr`, remove
#'   wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA222 metadata, optional conversion and renaming, the
#'   `LASA_wave` attribute, and a `label_report` audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, dravatot = c(-2, 10), drmcrav = c(3, -2))
#' apply_lasa222_labels(dat, wave = "D", to_numeric = TRUE)
apply_lasa222_labels <- function(data,
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
  wave_prefix <- c(B = "b", C = "c", D = "d", E = "e", `2B` = "b", F = "f", G = "g")
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 222 wave: ", wave, ". Use one of: ",
      paste(names(wave_prefix), collapse = ", "), ".", call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = unname(wave_prefix[[wave]]),
    fn_name = "apply_lasa222_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  score_labels <- if (wave == "B") {
    c("na, see BRMCRAV" = -2)
  } else {
    c("no valid data" = -2)
  }
  score_suffixes <- if (wave %in% c("E", "F", "G")) {
    c("mrvatot", "mrvbtot", "mcraven")
  } else if (wave == "2B") {
    c("ravatot", "ravbtot", "mcraven")
  } else {
    c("ravatot", "ravbtot", "craven")
  }
  total_labels <- if (wave == "2B") {
    c(
      "Total C. raven score section A",
      "Total C. raven score section B",
      "Total score coloured raven"
    )
  } else if (wave == "E") {
    c(
      "Total c. raven score section A",
      "Total c. raven score section B",
      "Total score couloured raven"
    )
  } else {
    c(
      "Total c. raven score section A",
      "Total c. raven score section B",
      "Total score coloured raven"
    )
  }
  for (i in seq_along(score_suffixes)) {
    engine$label_variable(
      score_suffixes[[i]], total_labels[[i]], score_labels,
      force_numeric = TRUE
    )
  }

  physical_label <- if (wave %in% c("B", "C")) {
    "not able to (physical): visus"
  } else {
    "not able to (physical)"
  }
  reason_labels <- c(
    "valid score" = -2,
    "short version" = 1,
    "interview terminated" = 2,
    "too many missings" = 3,
    "refused test" = 4,
    "not able to (cognitive)" = 5,
    setNames(6, physical_label),
    "technical problems" = 7,
    "unknown" = 8
  )

  if (wave %in% c("F", "G")) {
    linked_label <- paste0("see ", wave, "MRMCRAV")
    reason_labels <- c("valid score" = -2, setNames(-1, linked_label))
    if (wave == "G") {
      reason_labels <- c(reason_labels, "- to be coded -" = 0)
    }
    reason_labels <- c(
      reason_labels,
      "short version" = 1,
      "interview terminated" = 2,
      "too many missings" = 3,
      "refused test" = 4,
      "not able to (cognitive)" = 5,
      "not able to (physical)" = 6,
      "technical problems" = 7,
      "unknown" = 8
    )
    engine$label_variable(
      "mrmcrab", "Reason, no valid data b-section c. raven",
      reason_labels, force_numeric = FALSE
    )
    engine$label_variable(
      "mrmcrav", "Reason, no valid data on c. raven",
      reason_labels, force_numeric = FALSE
    )
  } else {
    reason_label <- if (wave == "2B") {
      "Reason, no valid data on C. Raven"
    } else {
      "Reason, no valid data on c. raven"
    }
    engine$label_variable(
      "rmcrav", reason_label, reason_labels, force_numeric = FALSE
    )
  }
  engine$finalize()
}
