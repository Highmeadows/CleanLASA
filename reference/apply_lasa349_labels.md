# Apply LASA349 (General Self-Regulation Scale Scores) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the five constructed General
Self-Regulation variables documented in LASA349 for waves G and H.

## Usage

``` r
apply_lasa349_labels(
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

  A data frame or tibble imported from a LASA349 `.sav` file. Documented
  names use a `g` or `h` wave prefix followed by `qgsr`, `qgsrsu`,
  `qgsrmk`, `qgsracp`, or `qmisgsr`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"G"` or `"H"`.

- name_corrections:

  Optional named character vector mapping canonical LASA349 suffixes
  without the wave prefix to actual column names in `data`.

- to_factor:

  Logical. If `TRUE`, the four variables carrying documented value
  labels are converted to factors. Observed unlabelled scores remain
  numeric-text levels.

- to_numeric:

  Logical. If `TRUE`, all five variables are restored to plain numeric
  and negative values are replaced by `NA`.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column containing the selected wave is inserted
  immediately after the respondent-number column.

## Value

`data`, with LASA349 variable/value labels, optional conversion and
standardized naming, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

The inventory comprises the total General Self-Regulation score,
strategy use and metastrategy-knowledge subscales, an
action-and-coping-planning subscale, and a count of missing General
Self-Regulation values. The four scores use `-2` for no valid data and
have documented low/high endpoints. The missing-value count has no
documented value-label map. The 14 source questionnaire items belong to
LASA149 and are intentionally outside this function's inventory.

All five variables are numeric. With `to_numeric = TRUE`, negative
missing codes become `NA`; `to_numeric` therefore takes precedence over
`to_factor`. With `to_factor = TRUE` alone, the four value-labelled
scores become factors and observed unlabelled interior scores remain
numeric-text levels. The unlabelled missing-value count remains numeric.

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
dat <- data.frame(RespNr = 1:2, gqgsr = c(-2, 70), gqmisgsr = c(2, 0))
dat <- apply_lasa349_labels(dat, wave = "G", to_numeric = TRUE)
attr(dat$gqgsr, "label")
#> [1] "general self-regulation scale score"
```
