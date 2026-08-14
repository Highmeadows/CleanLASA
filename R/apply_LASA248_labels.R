# Apply LASA 248 (children summary/status) SPSS labels
#
# Source: LASA048_varinfo.pdf (27-Jun-2022), pages 12--14

#' Apply LASA248 (Children Summary and Status) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the LASA248 summary and data-status variables in
#' the LASA048 children codebook. The documented files cover waves E, 2B, F,
#' 3B, and MB.
#'
#' Waves E and F each contain one data-availability/status variable. Waves 2B
#' and 3B contain eight variables describing numbers and types of children,
#' childlessness, parental status, and completeness of the linked LASA048
#' records. MB contains the number of children reported in the face-to-face
#' demographic interview and the number represented in the medical-interview
#' LASA048 file. Coding differs materially between 2B and 3B.
#'
#' Child-count variables are numeric. With `to_numeric = TRUE`, their negative
#' missing/routing codes become `NA` and their substantive counts remain plain
#' numeric. The remaining variables are categorical and can be converted to
#' factors with `to_factor = TRUE`. Original SPSS values and labels are always
#' retained in `original_values` and `original_labels`.
#'
#' Column matching uses an explicit `name_corrections` override, an exact
#' case-sensitive match, and then a case-insensitive exact match. Standardized
#' naming removes the wave prefix, standardizes `respnr`, and inserts a
#' `LASA_wave` column.
#'
#' @param data A data frame or tibble imported from a LASA248 `.sav` file.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"E"`, `"2B"`, `"F"`, `"3B"`, or `"MB"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (for example `data048`, `nchild`, or
#'   `Nrecs048`) to actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, categorical variables are converted to
#'   factors; observed unlabelled codes remain numeric-text levels.
#' @param to_numeric Logical. If `TRUE`, documented child-count variables are
#'   converted to plain numeric and negative codes become `NA`.
#' @param standardize_names Logical. If `TRUE`, matched names and `respnr` are
#'   standardized, wave prefixes are removed, and `LASA_wave` is added.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and `LASA_wave` is added. Implied by
#'   `standardize_names = TRUE`.
#'
#' @return `data` with LASA248 metadata, requested conversions and renaming,
#'   the `LASA_wave` provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()],
#'   [apply_lasa048_labels()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:2,
#'   bnchild = c(-1, 3),
#'   bchild = c(0, 2)
#' )
#' dat <- apply_lasa248_labels(dat, wave = "3B", to_numeric = TRUE)
#' attr(dat$bchild, "labels")
apply_lasa248_labels <- function(data,
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
  wave_prefix <- c(E = "e", `2B` = "b", F = "f", `3B` = "b", MB = "b")
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 248 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa248_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  if (wave == "E") {
    engine$label_variable(
      "data048", "availability data 048",
      c(
        "all ch died" = -5, "no children" = -4, "refusal" = -3,
        "short/terminated" = -2, "LSAdc" = -1, "data children" = 1
      ),
      force_numeric = FALSE
    )
  }

  if (wave == "F") {
    engine$label_variable(
      "data048", "availability data 048",
      c(
        "terminated interview" = -3, "short version" = -2,
        "questions asked" = 1, "no children" = 2, "refusal" = 3,
        "short version" = 4, "born < 1938" = 5
      ),
      force_numeric = FALSE
    )
  }

  if (wave == "2B") {
    child_count <- c("none" = 0, "four" = 4, "six" = 6, "ten" = 10)
    category_count <- c(
      "no specific information" = -2, "none" = 0, "four" = 4,
      "six" = 6, "ten" = 10
    )
    engine$label_variable(
      "nchild", "number of children", child_count, force_numeric = TRUE
    )
    engine$label_variable(
      "ch_aliv", "number of children alive", child_count,
      force_numeric = TRUE
    )
    engine$label_variable(
      "nc_volu", "reason for childlessness",
      c(
        "not childless" = -2, "no answer" = -1, "choice" = 1,
        "no partner available" = 2, "inadeq life circumstances" = 3,
        "medical reasons" = 4, "no choice other" = 5
      ),
      force_numeric = FALSE
    )
    engine$label_variable(
      "child", "parental b048stat",
      c(
        "children?" = -1, "childless" = 0, "yes; no spec info" = 1,
        "yes,own" = 2, "yes,step" = 3, "yes,own+step" = 4,
        "yes,only other" = 5
      ),
      force_numeric = FALSE
    )
    engine$label_variable(
      "048stat", "status data collected b048",
      c(
        "terminated" = -3, "refusal" = -2, "no children" = -1,
        "children in a048" = 1,
        "children in b048, but not all (missing: type unknown)" = 2,
        "children in b048, but not all foster children" = 3
      ),
      force_numeric = FALSE
    )
    engine$label_variable(
      "chown", "# own children (alive)", category_count,
      force_numeric = TRUE
    )
    engine$label_variable(
      "chstep", "# step children (alive)", category_count,
      force_numeric = TRUE
    )
    engine$label_variable(
      "choth", "# other (type unknown,adopt,foster) (alive)", category_count,
      force_numeric = TRUE
    )
  }

  if (wave == "3B") {
    number_children <- c("no answer" = -1)
    category_count <- c(
      "children in this category, # unknown" = -2,
      "no answer/refusal/terminated" = -1,
      "none in this category" = 0,
      "one in this category" = 1
    )
    engine$label_variable(
      "nchild",
      "number of children ever (biological, step, adoptive, foster)",
      number_children,
      force_numeric = TRUE
    )
    engine$label_variable(
      "ch_aliv",
      "number of children alive (biological, step, adoptive, foster)",
      number_children,
      force_numeric = TRUE
    )
    engine$label_variable(
      "nc_volu", "reason for childlessness",
      c(
        "not childless (answer)" = -3,
        "not childless (not asked)" = -2,
        "no answer" = -1,
        "choice" = 1,
        "no or not right partner available" = 2,
        "inadequate life circumstances" = 3,
        "medical reasons (fertility, illness)" = 4,
        "no choice other" = 5,
        "homosexual" = 6
      ),
      force_numeric = FALSE
    )
    engine$label_variable(
      "child", "parental status (based on b048)",
      c(
        "children? (no answer)" = -1, "childless" = 0,
        "yes; no specific information" = 1, "yes, own" = 2,
        "yes,step" = 3, "yes,own+step" = 4, "yes,only other" = 5
      ),
      force_numeric = FALSE
    )
    engine$label_variable(
      "048stat", "status data collected b048",
      c(
        "interview terminated" = -3,
        "refusal on Q to # children" = -2,
        "no children" = -1,
        "children in b048" = 1,
        "children in b048, but not all (reason & type unknown)" = 2,
        "children in b048, but not all (refusal for questions on children)" = 4,
        "children in b048, but not all (refusal for questions on stepchildren)" = 5
      ),
      force_numeric = FALSE
    )
    engine$label_variable(
      "chown", "# own children (alive)", category_count,
      force_numeric = TRUE
    )
    engine$label_variable(
      "chstep", "# step children (alive)", category_count,
      force_numeric = TRUE
    )
    engine$label_variable(
      "choth", "# other (type unknown,adopt,foster) (alive)", category_count,
      force_numeric = TRUE
    )
  }

  if (wave == "MB") {
    engine$label_variable(
      "nchild", "number of children (questions in demographic part f-t-f interview)",
      c(
        "skip questions children" = -3,
        "no answer question no-yes children" = -1,
        "no children" = 0, "one child" = 1, "13 children" = 13
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "Nrecs048", "number of children (questions in medical interview)",
      c(
        "questions 048 not asked" = -2, "no answer" = -1,
        "no children" = 0, "one child" = 1, "13 children" = 13
      ),
      force_numeric = TRUE
    )
  }

  engine$finalize()
}
