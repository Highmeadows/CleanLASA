# Apply LASA 071 (attitude toward ageing) SPSS labels
#
# Source: LASA071_varinfo.pdf (24-Jan-2024)

#' Apply LASA071 (Attitude toward ageing) SPSS labels
#'
#' Attaches the variable and value labels documented for the four evaluation-
#' of-age-norms items in LASA071. The file is documented at waves B and K.
#' Items concern daily pursuits, financial situation, contact with family or
#' friends, and current affairs. Both waves use no/more-or-less/yes response
#' categories, with wave-specific missing-reason labels and codes.
#'
#' The documented wave-K name for the third item is `kbeval03`, unlike
#' `keval01`, `keval02`, and `keval04`; this spelling is preserved. Its
#' canonical suffix for matching and standardized output is `beval03`.
#'
#' All variables are categorical, so `to_numeric` is accepted for the shared
#' interface but does not convert them. Matching tries `name_corrections`,
#' exact names, and then case-insensitive exact names. Conversion and renaming
#' preserve original coding and produce the generic `label_report` audit.
#'
#' @param data A data frame or tibble imported from a LASAB071 or LASAK071
#'   `.sav` file.
#' @param wave Character scalar identifying wave `"B"` or `"K"`; matching is
#'   case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (`eval01` through `eval04` at B, and
#'   `eval01`, `eval02`, `beval03`, and `eval04` at K) to actual names.
#' @param to_factor Logical. Convert matched variables to factors using the
#'   documented value labels; observed undocumented codes remain text levels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA071 has
#'   no eligible numeric variables.
#' @param standardize_names Logical. Rename matched columns to lowercase
#'   canonical suffixes, standardize `respnr`, and imply wave splitting.
#' @param split_wavecode Logical. Remove the wave prefix from matched names and
#'   insert `LASA_wave` after the respondent-number column.
#'
#' @return The labelled data, with requested factor conversion and canonical
#'   names, preserved original coding, `LASA_wave`, and `label_report`.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(beval01 = c(-4, 1, 3))
#' dat <- apply_lasa071_labels(dat, wave = "B")
#' attr(dat$beval01, "labels")
apply_lasa071_labels <- function(data,
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
  if (!wave %in% c("B", "K")) {
    stop("Unknown LASA 071 wave: ", wave, ". Use: B, K.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = tolower(wave),
    fn_name = "apply_lasa071_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_map <- if (wave == "B") {
    c(
      "no answer, short version" = -4, "no answer, asked" = -1,
      "no" = 1, "more or less" = 2, "yes" = 3
    )
  } else {
    c(
      "na, short interview" = -4, "na, wrong skip" = -3,
      "no" = 1, "more or less" = 2, "yes" = 3
    )
  }

  suffixes <- if (wave == "B") {
    c("eval01", "eval02", "eval03", "eval04")
  } else {
    c("eval01", "eval02", "beval03", "eval04")
  }
  variable_labels <- c(
    "Evaluation age norms: daily pursuits",
    "Evaluation age norms: financial situation",
    "Evaluation age norms: contact with family/friends",
    "Evaluation age norms: current affairs"
  )

  for (i in seq_along(suffixes)) {
    engine$label_variable(
      suffixes[[i]], variable_labels[[i]], value_map,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
