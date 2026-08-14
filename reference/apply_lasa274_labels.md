# Apply LASA274 (Vignette Total Score) SPSS labels

Attaches the SPSS-style variable label (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the LASA274 total Frequency of Requested
Effort (FRE) score derived from the LASA074 vignettes about help.

## Usage

``` r
apply_lasa274_labels(
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

  A data frame or tibble imported from a LASAD274 `.sav` file.

- wave:

  Character scalar identifying wave `"D"`, matched case-insensitively.

- name_corrections:

  Optional named character vector mapping canonical suffix `vignet` to
  the actual column name in `data`.

- to_factor:

  Logical. If `TRUE`, the score is converted to a factor from its
  documented missing and endpoint labels unless `to_numeric = TRUE`
  takes precedence. Unlabelled observed scores are retained.

- to_numeric:

  Logical. If `TRUE`, convert the score to plain numeric and replace its
  negative missing code with `NA`.

- standardize_names:

  Logical. If `TRUE`, standardize matched names and `respnr`, remove the
  wave prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. If `TRUE`, remove the wave prefix from the matched column and
  add `LASA_wave`. Implied by `standardize_names = TRUE`.

## Value

`data` with LASA274 metadata, requested conversion and renaming, the
`LASA_wave` provenance attribute, and a `label_report` matching audit.

## Details

LASA274 is documented only for wave D and contains one numeric score,
`dvignet`. The documented range is 0 (low FRE) through 19 (high FRE),
with `-1` indicating more than three missing vignette items. With
`to_numeric = TRUE`, the score becomes plain numeric and `-1` becomes
`NA`. Original values and labels remain available in `original_values`
and `original_labels`.

Column matching uses an explicit `name_corrections` override, an exact
case-sensitive match, and then a case-insensitive exact match.
Standardized naming removes the D-wave prefix, standardizes `respnr`,
and inserts a `LASA_wave` column.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
[`apply_lasa074_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa074_labels.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:3, dvignet = c(-1, 0, 19))
dat <- apply_lasa274_labels(dat, wave = "D", to_numeric = TRUE)
attr(dat$dvignet, "label")
#> [1] "total score vignettes FRE"
```
