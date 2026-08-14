# Apply LASA 173 (existential loneliness) SPSS variable and value labels
#
# Source: LASA173_varinfo.pdf (18-Feb-2020)

#' Apply LASA173 (existential loneliness) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the 16 existential-loneliness items documented in
#' LASA173 for wave J. Each label contains the English item followed by its
#' Dutch wording. All items share the documented five-point response scale
#' from emphatic no to emphatic yes, plus missing/status codes.
#'
#' All LASA173 variables are categorical and therefore none is converted by
#' `to_numeric = TRUE`. With `to_factor = TRUE`, documented codes become
#' factor levels while observed unlabelled codes are retained. Matching tries
#' `name_corrections`, an exact match, then a case-insensitive exact match.
#' Original labels and values are preserved. Optional standardized naming
#' removes the `j` prefix, standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASAJ173 `.sav` file.
#'   Documented names are `jmexlo1`, `jmexlo3`, `jmexlo6`, and the remaining
#'   listed `jmexlo` items through `jmexlo31`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. Must be `"J"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   LASA173 suffixes without the wave prefix (for example, `mexlo1`) to
#'   actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, variables with documented value labels
#'   are converted to factors. Observed unlabelled codes remain numeric-text
#'   levels.
#' @param to_numeric Logical. Accepted for the shared interface. LASA173 has
#'   no documented continuous numeric variables.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column is inserted after `respnr`.
#'
#' @return `data`, with LASA173 labels, optional factor conversion and
#'   standardized naming, preserved original SPSS coding, the `LASA_wave`
#'   provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, jmexlo1 = c(1, 5), jmexlo8 = c(2, 4))
#' apply_lasa173_labels(dat, wave = "J", to_factor = TRUE)
apply_lasa173_labels <- function(data,
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
  if (wave != "J") {
    stop("Unknown LASA 173 wave: ", wave, ". Use: J.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = "j",
    fn_name = "apply_lasa173_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  response_labels <- c(
    "interview terminated" = -4,
    "not asked" = -2,
    "na, asked" = -1,
    "no!" = 1,
    "no" = 2,
    "more or less" = 3,
    "yes" = 4,
    "yes!" = 5
  )
  variables <- c(
    mexlo1 = paste(
      "I am happy with the way I have lived my life /",
      "Ik ben gelukkig over hoe ik mijn leven heb geleid"
    ),
    mexlo3 = "There is a purpose to my life / Mijn leven heeft een bepaalde bedoeling",
    mexlo6 = paste(
      "I am surrounded by strangers I cannot connect with /",
      "Ik ben omringd door vreemden met wie ik geen contact kan leggen"
    ),
    mexlo8 = "I feel lonely / Ik voel mij eenzaam",
    mexlo12 = paste(
      "I feel I have people I can trust and rely on if I need them /",
      "Ik heb mensen waarop ik kan vertrouwen en rekenen wanneer ik daar behoefte aan heb"
    ),
    mexlo16 = paste(
      "I stay in bad relationships too long in order not to be alone /",
      "Ik blijf te lang in een slechte relatie omdat ik niet alleen wil zijn"
    ),
    mexlo18 = "I feel helpless / Ik voel me hulpeloos",
    mexlo21 = "I feel alone / Ik voel me alleen",
    mexlo23 = "I mean something to others / Ik beteken iets voor andere mensen",
    mexlo24 = paste(
      "Important relationships have ended or become weaker /",
      "Belangrijke contacten zijn weggevallen of verwaterd"
    ),
    mexlo25 = "I feel at the mercy of the world / Ik voel mij machteloos tegenover de wereld",
    mexlo26 = "I feel dead / Het voelt alsof ik dood ben",
    mexlo27 = "The universe is full of meaning / Deze wereld biedt vele mogelijkheden",
    mexlo29 = "I feel that there is little point to life / Het leven heeft weinig zin",
    mexlo30 = paste(
      "No one else in the world can understand my feelings /",
      "Niemand kan mijn gevoelens begrijpen"
    ),
    mexlo31 = paste(
      "My world seems so different from everybody else’s /",
      "Mijn wereld is totaal anders dan die van andere mensen"
    )
  )
  for (suffix in names(variables)) {
    engine$label_variable(
      suffix, unname(variables[[suffix]]), response_labels,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
