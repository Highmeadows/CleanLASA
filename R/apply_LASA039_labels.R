# Apply LASA 039 (Lifetime Psychopathology/LIDAS) SPSS labels
#
# Source: LASA039_varinfo.pdf (19-Feb-2026)

#' Apply LASA039 (Lifetime Psychopathology/LIDAS) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the 53 variables documented in the wave-K
#' LASA039 Lifetime Psychopathology (LIDAS) file.
#'
#' The file records contact with psychological care, lifetime mental-disorder
#' status, and diagnosis/age-at-first-diagnosis/treatment triplets for 14
#' disorder groups. It also contains a general mental-treatment item and
#' eight treatment or medication types. Shared value cells in the source PDF
#' are applied to every variable covered by those cells: `lidascont` and
#' `lidasdiag` share one yes/no map, while all eight `lidastreat*` type
#' variables share one mentioned/not-mentioned map.
#'
#' The 14 age-at-first-diagnosis variables are continuous measures whose only
#' documented value labels are negative missing-reason codes. With
#' `to_numeric = TRUE`, those fields are restored to plain numeric and all
#' observed negative values become `NA`. The remaining variables are
#' categorical and are unaffected by `to_numeric`. With `to_factor = TRUE`,
#' categorical variables become factors; observed unlabelled codes remain
#' numeric-text levels. For eligible age variables, `to_numeric` takes
#' precedence when both conversion options are requested.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive exact match. Variables documented for wave K but absent
#' from `data` are left untouched and recorded as `"not found"` in the
#' generic matching audit.
#'
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` follow the parameter contract shared by the package's
#' other `apply_*_labels()` functions. Regardless of conversion, every
#' matched column keeps its original SPSS coding in
#' `attr(x, "original_labels")` and `attr(x, "original_values")`. The
#' `"respnr"` column is matched in any capitalization and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASAK039 `.sav` file,
#'   for example via [haven::read_sav()]. Names include `klidascont`,
#'   `klidasdepd`, `klidasdepa`, and `klidastreatpsy`.
#' @param wave Character scalar identifying the LASA wave. Only `"K"` is
#'   documented and accepted; matching is case-insensitive.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA039 suffixes without the `k`
#'   prefix (for example `lidascont`, `lidasdepa`, or `lidastreatpsy`), and
#'   values are actual column names in `data`.
#' @param to_factor Logical. If `FALSE` (default), variables retain their
#'   numeric representation with SPSS-style value-label attributes. If
#'   `TRUE`, categorical variables are converted to factors using the
#'   documented labels. Observed unlabelled codes remain numeric-text levels.
#' @param to_numeric Logical. If `TRUE`, the 14 age-at-first-diagnosis
#'   variables are restored to plain numeric and negative values are replaced
#'   by `NA`. Other LASA039 variables remain categorical. This conversion
#'   takes precedence over `to_factor` for eligible variables.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA039 columns are renamed to their canonical lowercase
#'   suffixes with the `k` wave prefix removed; `"respnr"` is standardized;
#'   and `split_wavecode` is always treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with their `k` prefix removed and a new
#'   `"LASA_wave"` column filled with `"K"` is inserted immediately after
#'   the respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA039 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa038_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   klidasdepd = c(-2, 0, 1),
#'   klidasdepa = c(-3, 24, 51),
#'   klidasdept = c(-1, 1, 2)
#' )
#' dat <- apply_lasa039_labels(dat, wave = "K", to_numeric = TRUE)
#' attr(dat$klidasdepd, "labels")
apply_lasa039_labels <- function(data,
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
    stop("Unknown LASA 039 wave: ", wave, ". Use: K.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = "k",
    fn_name = "apply_lasa039_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_labels <- function(labels, values) {
    stats::setNames(as.numeric(values), labels)
  }

  general_yes_no <- value_labels(
    c("na, short interview", "na, wrong skip", "na, asked", "no", "yes"),
    c(-4, -3, -1, 1, 2)
  )
  diagnosis <- value_labels(
    c("na, see klidasdiag", "na, asked", "not mentioned", "mentioned"),
    c(-2, -1, 0, 1)
  )
  age <- value_labels(
    c("na, wrong skip", "na, see klidasdiag", "na, asked"),
    c(-3, -2, -1)
  )
  received_treatment <- value_labels(
    c("na, wrong skip", "na, see klidasdiag", "na, asked", "no", "yes"),
    c(-3, -2, -1, 1, 2)
  )
  treatment_type <- value_labels(
    c("na, see klidastreat", "na, asked", "not mentioned", "mentioned"),
    c(-2, -1, 0, 1)
  )

  engine$label_variable(
    "lidascont",
    "Contacted psychological care (mental health care, psychologist or social worker",
    general_yes_no
  )
  engine$label_variable("lidasdiag", "Had mental disorder", general_yes_no)

  disorders <- list(
    dep = c(
      diagnosis = "Depression: diagnosis",
      age = "Depression: age of first diagnosis",
      treatment = "Depression: received treatment"
    ),
    bipol = c(
      diagnosis = "Dipolar disorder: diagnosis",
      age = "Bipolar disorder: age of first diagnosis",
      treatment = "Bipolar disorder: received treatment"
    ),
    schiz = c(
      diagnosis = "Schizophrenia: diagnosis",
      age = "Schizophrenia: age of first diagnosis",
      treatment = "Schizophrenia: received treatment"
    ),
    ed = c(
      diagnosis = "Eating disorder: diagnosis",
      age = "Eating disorder: age of first diagnosis",
      treatment = "Eating disorder: received treatment"
    ),
    anx = c(
      diagnosis = "Anxiety disorder: diagnosis",
      age = "Anxiety disorder: age of first diagnosis",
      treatment = "Anxiety disorder: received treatment"
    ),
    panic = c(
      diagnosis = "Panic disorder: diagnosis",
      age = "Panic disorder: age of first diagnosis",
      treatment = "Panic disorder: received treatment"
    ),
    ocd = c(
      diagnosis = "Obsessive compulsive disorder (OCD): diagnosis",
      age = "OCD: age of first diagnosis",
      treatment = "OCD: received treatment"
    ),
    ptss = c(
      diagnosis = "PTSS: diagnosis",
      age = "PTSS: age of first diagnosis",
      treatment = "PTSS: received treatment"
    ),
    pho = c(
      diagnosis = "Phobia: diagnosis",
      age = "Phobia: age of first diagnosis",
      treatment = "Phobia: received treatment"
    ),
    adhd = c(
      diagnosis = "ADD/ADHD: diagnosis",
      age = "ADD/ADHD: age of first diagnosis",
      treatment = "ADD/ADHD: received treatment"
    ),
    persd = c(
      diagnosis = "Personality disorder: diagnosis",
      age = "Personality disorder: age of first diagnosis",
      treatment = "Personality disorder: received treatment"
    ),
    alc = c(
      diagnosis = "Alcohol addiction: diagnosis",
      age = "Alcohol addiction: age of first diagnosis",
      treatment = "Alcohol addiction: received treatment"
    ),
    drug = c(
      diagnosis = "Drug addiction: diagnosis",
      age = "Drug addiction: age of first diagnosis",
      treatment = "Drug addiction: received treatment"
    ),
    oth = c(
      diagnosis = "Other: diagnosis",
      age = "Other mental disorder: age of first diagnosis",
      treatment = "Other mental disorder: received treatment"
    )
  )

  for (key in names(disorders)) {
    spec <- disorders[[key]]
    engine$label_variable(
      paste0("lidas", key, "d"), spec[["diagnosis"]], diagnosis
    )
    engine$label_variable(
      paste0("lidas", key, "a"), spec[["age"]], age
    )
    engine$label_variable(
      paste0("lidas", key, "t"), spec[["treatment"]], received_treatment
    )
  }

  engine$label_variable(
    "lidastreat", "Received mental treatment/medication", general_yes_no
  )

  treatment_labels <- c(
    ad = "Mental treatment/medication: antidepressant",
    psy = paste0(
      "Mental treatment/medication: psychotherapy ",
      "(CBT, interpersonal therapy)"
    ),
    eh = "Mental treatment/medication: e-health intervention",
    run = "Mental treatment/medication: running therapy/physical exertion",
    light = "Mental treatment/medication: light therapy",
    phos = "Mental treatment/medication: admission psychiatric hospital",
    ect = "Mental treatment/medication: Electroconvulsive therapy (ECT)",
    oth = "Mental treatment/medication: other"
  )
  for (key in names(treatment_labels)) {
    engine$label_variable(
      paste0("lidastreat", key), unname(treatment_labels[[key]]),
      treatment_type
    )
  }

  engine$finalize()
}
