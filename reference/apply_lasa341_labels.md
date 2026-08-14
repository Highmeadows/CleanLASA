# Apply LASA341 (Need for Affiliation Score) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the constructed six-item
need-for-affiliation score documented in LASA341 for waves 2B and G.

## Usage

``` r
apply_lasa341_labels(
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

  A data frame or tibble imported from a LASA341 `.sav` file, containing
  `bqan` for wave 2B or `gqan` for wave G.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"2B"` or `"G"`.

- name_corrections:

  Optional named character vector mapping the canonical LASA341 suffix
  without the wave prefix (`qan`) to the actual column name in `data`.

- to_factor:

  Logical. If `TRUE`, the score is converted to a factor. Observed
  unlabelled interior scores remain numeric-text levels.

- to_numeric:

  Logical. If `TRUE`, the score is restored to plain numeric and
  negative values are replaced by `NA`.

- standardize_names:

  Logical. If `TRUE`, the matched column is renamed to canonical
  lowercase `qan`, `respnr` is standardized, and `split_wavecode` is
  treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, the matched column has its wave prefix removed and
  a `LASA_wave` column containing the selected wave is inserted
  immediately after the respondent-number column.

## Value

`data`, with the LASA341 variable/value labels, optional conversion and
standardized naming, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

LASA341 contains one numeric score, `bqan` in wave 2B and `gqan` in wave
G. The documented range runs from low affiliation need (6) to strong
affiliation need (18), with `-1` denoting no valid data. The six source
questionnaire items belong to LASA141 and are intentionally outside this
function's inventory.

With `to_numeric = TRUE`, the negative missing code becomes `NA`;
`to_numeric` therefore takes precedence over `to_factor`. With
`to_factor = TRUE` alone, documented endpoints become factor levels and
observed unlabelled interior scores are retained as numeric-text levels.

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
dat <- data.frame(RespNr = 1:3, bqan = c(-1, 10, 18))
dat <- apply_lasa341_labels(dat, wave = "2B", to_numeric = TRUE)
attr(dat$bqan, "label")
#> [1] "need for affiliation <6 items>"
```
