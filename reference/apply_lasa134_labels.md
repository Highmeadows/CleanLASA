# Apply LASA134 (Birth weight) SPSS labels

Attaches SPSS-style variable and value labels to birth-weight variables
documented in LASA134 for waves E, 2B, and 3B.

## Usage

``` r
apply_lasa134_labels(
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

  A data frame or tibble imported from a LASA134 `.sav` file. Names are
  `eqbwght`/`eqbwghts` in E and `bqbwght`/`bqbwghts` in 2B and 3B;
  `bqbwghtw` occurs only in 3B.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"E"`, `"2B"`, or `"3B"`.

- name_corrections:

  Optional named character vector mapping suffixes without the wave
  prefix (for example `qbwght` or `qbwghtw`) to actual names in `data`.

- to_factor:

  Logical. If `TRUE`, categorical source variables are converted to
  factors using the documented value labels.

- to_numeric:

  Logical. If `TRUE`, birth weight is restored to plain numeric and
  negative values become `NA`.

- standardize_names:

  Logical. If `TRUE`, matched names and `respnr` are standardized and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names lose the wave prefix and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA134 labels, requested conversion or renaming, preserved
original coding, `LASA_wave` provenance, and a `label_report`.

## Details

All three waves contain birth weight in grams and a source-quality item.
Wave 3B additionally records which document supplied the birth weight.
The weight variable is numeric and eligible for `to_numeric`; a negative
missing code becomes `NA`. Source variables are categorical and can be
converted with `to_factor`.

Matching tries `name_corrections`, an exact case-sensitive match, and
then a case-insensitive exact match. Both replenishment waves use the
documented `b` variable prefix, while the `LASA_wave` provenance
distinguishes `2B` from `3B`. Original SPSS coding is preserved.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(eqbwght = c(-1, 3500), eqbwghts = c(1, 3))
dat <- apply_lasa134_labels(dat, wave = "E", to_numeric = TRUE)
attr(dat$eqbwghts, "labels")
#>                no answer checked in documentation      known without check 
#>                       -1                        1                        2 
#>               estimation 
#>                        3 
```
