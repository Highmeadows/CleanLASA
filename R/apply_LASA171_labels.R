# Apply LASA 171 (calf measurement) SPSS variable and value labels
#
# Source: LASA171_varinfo.pdf (14-Jun-2017)

#' Apply LASA171 (calf measurement) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the calf-circumference
#' variables documented in LASA171 for waves B, D, E, 2B, F, G, H, and 3B.
#' The inventory and coding changed materially across waves: wave B used a
#' single measurement plus detailed remarks; D/E and G used duplicate
#' measurements and separate particularity indicators; 2B used one
#' measurement; F used a single combined particularities variable; and H/3B
#' used one measurement with reason-missing status. From wave I onward calf
#' measurement is documented in LASA161 instead.
#'
#' Calf measurements are eligible for `to_numeric = TRUE`; documented
#' negative missing codes then become `NA`. Status and particularity variables
#' remain categorical. With `to_factor = TRUE`, their documented codes become
#' factor levels while observed unlabelled codes are retained.
#'
#' Matching tries `name_corrections`, an exact match, then a case-insensitive
#' exact match. Original labels and values are preserved. Optional
#' standardized naming removes the wave prefix, standardizes `respnr`, and
#' adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA171 `.sav` file.
#'   Names use the wave-specific `b`, `d`, `e`, `f`, `g`, or `h` prefix; wave
#'   2B and 3B both use `b`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, or `"3B"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (for example, `mcalf01`) to actual
#'   column names in `data`.
#' @param to_factor Logical. If `TRUE`, variables with documented value labels
#'   are converted to factors unless they are converted to numeric.
#' @param to_numeric Logical. If `TRUE`, documented calf measurements are
#'   restored to plain numeric and negative values are replaced by `NA`.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column is inserted after `respnr`.
#'
#' @return `data`, with LASA171 labels, optional conversion and standardized
#'   naming, preserved original SPSS coding, the `LASA_wave` provenance
#'   attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, hmcalf01 = c(-1, 35), hmcalf02 = c(0, 1))
#' apply_lasa171_labels(dat, wave = "H", to_numeric = TRUE)
apply_lasa171_labels <- function(data,
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
  valid_waves <- c("B", "D", "E", "2B", "F", "G", "H", "3B")
  if (!wave %in% valid_waves) {
    stop(
      "Unknown LASA 171 wave: ", wave,
      ". Use one of: B, D, E, 2B, F, G, H, 3B.",
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
    B = "b", D = "d", E = "e", `2B` = "b", F = "f", G = "g",
    H = "h", `3B` = "b"
  )
  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa171_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  if (wave == "B") {
    engine$label_variable(
      "mcalf01", "circumference: in cm",
      c("not in sample" = -3, "no measurement" = -1),
      force_numeric = TRUE
    )
    remark_labels <- c(
      "not in sample" = -3, "no" = 1, "yes" = 2,
      "not done various reasons" = 3
    )
    remark_variables <- c(
      mcalf02 = "measurement: remarks Y/N",
      mcalf03 = "remark: refused",
      mcalf04 = "remark: sitting down",
      mcalf05 = "remark: not physically able",
      mcalf06 = "remark: on right calf",
      mcalf07 = "remark: impediments",
      mcalf08 = "remark: edema present",
      mcalf09 = "remark: support stocking",
      mcalf10 = "remark: long underwear",
      mcalf11 = "remark other"
    )
    for (suffix in names(remark_variables)) {
      engine$label_variable(
        suffix, unname(remark_variables[[suffix]]), remark_labels,
        force_numeric = FALSE
      )
    }
  } else if (wave %in% c("D", "E")) {
    measurement_labels <- c(
      "na, wrong skip" = -3, "na, see D/ERM161" = -2, "na, asked" = -1
    )
    engine$label_variable(
      "mcalf1a", "Measured calf (1) in cm", measurement_labels,
      force_numeric = TRUE
    )
    engine$label_variable(
      "mcalf1b", "Measured calf (2) in cm", measurement_labels,
      force_numeric = TRUE
    )
    engine$label_variable(
      "mcalf02", "Calf particularities",
      c(
        "na, wrong skip" = -3, "na, see D/ERM161" = -2,
        "na, asked" = -1, "no" = 1, "yes" = 2
      ),
      force_numeric = FALSE
    )
    indicator_labels <- c(
      "na, wrong skip" = -3, "na, see D/EMCALF02" = -2,
      "na, asked" = -1, "not mentioned" = 0, "mentioned" = 1
    )
    indicator_variables <- c(
      mcalf12 = "Calf: no bare leg",
      mcalf13 = "Calf: much space between tape and leg",
      mcalf04 = "Calf: R sitting down",
      mcalf06 = "Calf: on right leg",
      mcalf03 = "Calf: refused"
    )
    for (suffix in names(indicator_variables)) {
      engine$label_variable(
        suffix, unname(indicator_variables[[suffix]]), indicator_labels,
        force_numeric = FALSE
      )
    }
    engine$label_variable(
      "rm161", "", c("valid data" = -2, "interview terminated" = 2),
      force_numeric = FALSE
    )
  } else if (wave == "2B") {
    engine$label_variable(
      "mcalf1", "Measured calf in cm",
      c(
        "na, wrong skip" = -3, "na, see BRM161" = -2,
        "na, asked" = -1, "na, asked" = 0
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "mcalf02", "Calf particularities",
      c(
        "na, wrong skip" = -3, "na, see BRM161" = -2,
        "na, asked" = -1, "no" = 1, "yes" = 2
      ),
      force_numeric = FALSE
    )
    indicator_labels <- c(
      "na, wrong skip" = -3, "na, see BMCALF02" = -2,
      "na, asked" = -1, "not mentioned" = 0, "mentioned" = 1
    )
    indicator_variables <- c(
      mcalf12 = "Calf: no bare leg",
      mcalf13 = "Calf: much space between tape and leg",
      mcalf04 = "Calf: R sitting down",
      mcalf06 = "Calf: on right leg",
      mcalf03 = "Calf: refused"
    )
    for (suffix in names(indicator_variables)) {
      engine$label_variable(
        suffix, unname(indicator_variables[[suffix]]), indicator_labels,
        force_numeric = FALSE
      )
    }
  } else if (wave == "F") {
    measurement_labels <- c("na, see FRM161" = -2, "na, asked" = -1)
    engine$label_variable(
      "mcalf1a", "Measured calf (1) in cm", measurement_labels,
      force_numeric = TRUE
    )
    engine$label_variable(
      "mcalf1b", "Measured calf (2) in cm", measurement_labels,
      force_numeric = TRUE
    )
    engine$label_variable(
      "mcalf02", "Calf particularities",
      c(
        "na, see FRM161" = -2, "na, asked" = -1,
        "no particularities" = 1, "no bare leg" = 2,
        "much space between tape and leg" = 3, "R sitting down" = 4,
        "on right leg" = 5, "R refused" = 6
      ),
      force_numeric = FALSE
    )
    engine$label_variable(
      "rm161", "",
      c("valid data" = -2, "short version" = 1, "interview terminated" = 2),
      force_numeric = FALSE
    )
  } else if (wave == "G") {
    measurement_labels <- c("na, see GRM161" = -2, "na, asked" = -1)
    engine$label_variable(
      "mcalf1a", "Measured calf (1) in cm", measurement_labels,
      force_numeric = TRUE
    )
    engine$label_variable(
      "mcalf1b", "Measured calf (2) in cm", measurement_labels,
      force_numeric = TRUE
    )
    engine$label_variable(
      "mcalf02", "Calf particularities",
      c(
        "na, see GRM161" = -2, "na, asked" = -1,
        "no" = 1, "yes" = 2
      ),
      force_numeric = FALSE
    )
    indicator_labels <- c(
      "na, wrong skip" = -3, "na, see GMCALF02" = -2,
      "na, asked" = -1, "not mentioned" = 0, "mentioned" = 1
    )
    indicator_variables <- c(
      mcalf12 = "Calf: no bare leg",
      mcalf13 = "Calf: much space between tape and leg",
      mcalf04 = "Calf: R sitting down",
      mcalf06 = "Calf: on right leg",
      mcalf03 = "Calf: refused"
    )
    for (suffix in names(indicator_variables)) {
      engine$label_variable(
        suffix, unname(indicator_variables[[suffix]]), indicator_labels,
        force_numeric = FALSE
      )
    }
    engine$label_variable(
      "rm161", "",
      c(
        "valid data" = -2, "- to be coded -" = 0, "short version" = 1,
        "interview terminated" = 2
      ),
      force_numeric = FALSE
    )
  } else {
    see_rm <- "na, see H/BRM171"
    see_particularities <- "na, see H/BMCALF02"
    engine$label_variable(
      "mcalf01", "Measured calf in cm",
      setNames(c(-2, -1), c(see_rm, "na, asked")),
      force_numeric = TRUE
    )
    engine$label_variable(
      "mcalf02", "Calf particularities",
      setNames(c(-2, -1, 0, 1), c(see_rm, "na, asked", "not mentioned", "mentioned")),
      force_numeric = FALSE
    )
    indicator_labels <- setNames(
      c(-2, -1, 0, 1),
      c(see_particularities, "na, asked", "not mentioned", "mentioned")
    )
    indicator_variables <- c(
      mcalf12 = "Calf: no bare leg",
      mcalf13 = "Calf: much space between tape and leg",
      mcalf04 = "Calf: R sitting down",
      mcalf06 = "Calf: on right leg",
      mcalf03 = "Calf: refused"
    )
    for (suffix in names(indicator_variables)) {
      engine$label_variable(
        suffix, unname(indicator_variables[[suffix]]), indicator_labels,
        force_numeric = FALSE
      )
    }
    engine$label_variable(
      "rm171", "Reason missing: LASAH/B171",
      c(
        "valid data" = -2, "- to be coded -" = 0, "short version" = 1,
        "interview terminated" = 2
      ),
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
