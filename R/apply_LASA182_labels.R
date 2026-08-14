# Apply LASA 182 (thyroid, back pain, bedridden) SPSS labels
#
# Source: LASA182_varinfo.pdf (09-Apr-2024)

#' Apply LASA182 (thyroid, back pain, bedridden) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the thyroid, back-pain, and confinement-to-bed
#' variables documented for LASA182.
#'
#' LASA182 is documented for waves C, D, E, F, G, H, and 3B. Thyroid status
#' occurs in C and D; back-pain occurrence and duration occur in C through E;
#' and confinement to bed occurs in C, D, F, G, H, and 3B. Wave C additionally
#' contains indicators for confinement before age 25, after age 25, and during
#' the past year. Coding and routing-missing values follow the wave-specific
#' tables in the codebook.
#'
#' Column matching tries, in order: an explicit `name_corrections` override,
#' an exact case-sensitive match, and a case-insensitive exact match.
#' `to_factor = TRUE` converts matched categorical variables to factors while
#' retaining observed unlabelled codes as numeric-text levels. LASA182 has no
#' variables eligible for `to_numeric` conversion. Original values and value
#' labels are preserved in `original_values` and `original_labels`.
#'
#' @param data A data frame or tibble imported from a LASA182 `.sav` file,
#'   for example via [haven::read_sav()].
#' @param wave Character scalar identifying the LASA wave. One of `"C"`,
#'   `"D"`, `"E"`, `"F"`, `"G"`, `"H"`, or `"3B"`; matching is
#'   case-insensitive.
#' @param name_corrections Optional named character vector. Names are
#'   canonical suffixes without a wave prefix (for example `mbackp`) and
#'   values are actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors
#'   using their documented value labels.
#' @param to_numeric Logical. Accepted for the shared interface; LASA182 has
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
#' dat <- data.frame(CMBACKP = c(-1, 1, 2), cmbackpd = c(-2, 1, 3))
#' dat <- apply_lasa182_labels(dat, wave = "C")
#' attr(dat$CMBACKP, "labels")
apply_lasa182_labels <- function(data,
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
  wave_prefix <- c(C = "c", D = "d", E = "e", F = "f", G = "g", H = "h", `3B` = "b")
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 182 wave: ", wave, ". Use one of: ",
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
    fn_name = "apply_lasa182_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  yes_no <- c("na, asked" = -1, "no" = 1, "yes" = 2)
  back_duration <- c(
    "na, see C/DMBACKP" = -2,
    "less than one week" = 1,
    "> week < one month" = 2,
    "> one month" = 3
  )
  confined_recent <- c(
    "na, asked" = -1,
    "no" = 1,
    "yes, not the past year" = 2,
    "yes, the past year" = 3
  )

  specs <- switch(
    wave,
    C = list(
      list("mthyrover", "Thyroid gland: overactive", c(
        "na, interview terminated" = -5, "no" = 1, "yes" = 2,
        "do not know" = 3
      )),
      list("mbackp", "Back pain since last interview", c(
        "na, interview terminated" = -5, yes_no
      )),
      list("mbackpd", "Back pain duration", back_duration),
      list("mconfbed", "Confined to bed yes/no", c(
        "na, interview terminated" = -5, "na, asked" = -1,
        "no" = 1, "yes" = 2, "do not know" = 3
      )),
      list("mconfbedb25", "Confined to bed: before age 25", c(
        "na, see CMCONFBED" = -2, "not mentioned" = 0, "mentioned" = 1
      )),
      list("mconfbeda25", "Confined to bed: after age 25", c(
        "na, see CMCONFBED" = -2, "not mentioned" = 0, "mentioned" = 1
      )),
      list("mconfbedpy", "Confined to bed: past year", c(
        "na, see CMCONFBED" = -2, "not mentioned" = 0, "mentioned" = 1
      ))
    ),
    D = list(
      list("mthyrover", "Thyroid gland: overactive", c(
        "na, interview terminated" = -5, "no" = 1, "yes" = 2,
        "do not know" = 3
      )),
      list("mbackp", "Back pain since last interview", c(
        "na, interview terminated" = -5, yes_no
      )),
      list("mbackpd", "Back pain duration", back_duration),
      list("mconfbed", "Confined to bed since last interview", c(
        "na, interview terminated" = -5, confined_recent
      ))
    ),
    E = list(
      list("mbackp", "Back pain since last interview", yes_no),
      list("mbackpd", "Back pain duration", c(
        "na, see EMBACKP" = -2, "na, asked" = -1,
        "less than one week" = 1, "> week < one month" = 2,
        "> one month" = 3
      ))
    ),
    F = list(list("mconfbed", "Confined to bed since last interview", confined_recent)),
    G = list(list("mconfbed", "Confined to bed since last interview", confined_recent)),
    H = list(list("mconfbed", "Confined to bed since last interview", confined_recent)),
    `3B` = list(list(
      "mconfbed", "Confined to bed in last 3 years for 6 weeks or more",
      confined_recent
    ))
  )

  for (item in specs) {
    engine$label_variable(item[[1L]], item[[2L]], item[[3L]], force_numeric = FALSE)
  }

  engine$finalize()
}
