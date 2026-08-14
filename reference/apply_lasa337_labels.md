# Apply LASA337 (Valuation of Late Life Scale Scores) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the four Valuation of Late Life scale
scores documented in LASA337 for waves E and F.

## Usage

``` r
apply_lasa337_labels(
  data,
  wave,
  name_corrections = NULL,
  to_factor = FALSE,
  to_numeric = FALSE,
  standardize_names = FALSE,
  split_wavecode = FALSE
)
```

## Arguments

- data:

  A data frame or tibble imported from a LASA337 `.sav` file. Documented
  names are `eqvall`, `eqres`, `eqamb`, and `eqzest` in wave E, with the
  corresponding `f` prefix in wave F.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"E"` or `"F"`.

- name_corrections:

  Optional named character vector mapping canonical LASA337 suffixes
  without the wave prefix (`qvall`, `qres`, `qamb`, or `qzest`) to
  actual column names in `data`.

- to_factor:

  Logical. If `TRUE`, variables with documented value labels are
  converted to factors. Observed unlabelled scores remain numeric-text
  levels.

- to_numeric:

  Logical. If `TRUE`, all four scale scores are restored to plain
  numeric and negative values are replaced by `NA`.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column containing the selected wave is inserted
  immediately after the respondent-number column.

## Value

`data`, with LASA337 variable/value labels, optional conversion and
standardized naming, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

The inventory comprises the total Valuation of Late Life score and its
resilience, ambition, and zest-for-life subscales. These scale scores
are distinct from the item-level LASA137 variables listed in the same
source document. Every LASA337 score uses `-2` for no valid data.
Documented low and high endpoint labels differ slightly by wave for the
total score and ambition subscale and are reproduced exactly.

All four variables are numeric. With `to_numeric = TRUE`, their negative
missing code becomes `NA`; `to_numeric` therefore takes precedence over
`to_factor`. With `to_factor = TRUE` alone, documented endpoints become
factor levels and observed unlabelled interior scores are retained as
numeric-text levels.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive match, and (3) a
case-insensitive exact match. Variables absent from `data` are recorded
as `"not found"` in the matching audit. Original labels and values are
preserved, and optional standardized naming removes the wave prefix,
standardizes `respnr`, and adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, eqvall = c(-2, 48), eqres = c(12, 20))
dat <- apply_lasa337_labels(dat, wave = "E", to_numeric = TRUE)
attr(dat$eqvall, "label")
#> [1] "value of late life scale score"
```
