# Apply LASA105 (Religious coping) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the three religious-coping items
documented in LASA105 for waves 3B and MB.

## Usage

``` r
apply_lasa105_labels(
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

  A data frame or tibble imported from a LASA105 `.sav` file. Names are
  `bqrco03`, `bqrco05`, and `bqrco07` in 3B, or `brco03`, `brco05`, and
  `brco07` in MB.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"3B"` or `"MB"`.

- name_corrections:

  Optional named character vector mapping the wave-specific canonical
  suffixes without the `b` prefix (`qrco03`, `qrco05`, `qrco07`,
  `rco03`, `rco05`, or `rco07`) to actual column names in `data`.

- to_factor:

  Logical. If `TRUE`, matched variables are converted to factors using
  the documented labels; observed unlabelled codes remain numeric-text
  levels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA105 has no variables
  eligible for numeric conversion.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes, `respnr` is standardized, and `split_wavecode` is treated as
  `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, the leading `b` is removed from matched names and
  `LASA_wave` is inserted immediately after the respondent-number
  column.

## Value

`data`, with LASA105 labels, optional factor conversion and name
standardization, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

Both waves assess turning to God in a crisis, confessing sins and asking
forgiveness, and feeling abandoned by God. Wave 3B uses suffixes
`qrco03`, `qrco05`, and `qrco07`; MB uses `rco03`, `rco05`, and `rco07`.
The response map is identical in both waves and ranges from never to
very often, with separate negative codes for a short interview and an
item not asked.

All LASA105 variables are categorical. Therefore `to_numeric` is
accepted for the shared interface but does not convert them. With
`to_factor = TRUE`, matched fields become factors and observed
unlabelled codes remain numeric-text levels.

Column matching tries an explicit `name_corrections` override, an exact
case-sensitive name, then a case-insensitive exact name. Every matched
column preserves its original coding in `original_labels` and
`original_values`. Requested standardization removes the leading `b`,
standardizes `respnr`, and inserts `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(bqrco03 = c(-2, 1, 4), bqrco07 = c(1, 2, 3))
dat <- apply_lasa105_labels(dat, wave = "3B")
attr(dat$bqrco03, "labels")
#> na, short interview           na, asked               never           sometimes 
#>                  -2                  -1                   1                   2 
#>           regularly          very often 
#>                   3                   4 
```
