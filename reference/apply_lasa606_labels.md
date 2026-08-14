# Apply LASA606 (PROXY depressive affect) SPSS labels

Attaches the variable and value labels documented for LASA606 proxy
telephone-interview data in waves C, D, and E. Each wave contains four
depressive-affect items scored from rarely or never (0) to mostly or
always (3), followed by the depressive-affect total score.

## Usage

``` r
apply_lasa606_labels(
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

  A data frame or tibble imported from a LASA606 `.sav` file.

- wave:

  Character scalar: `"C"`, `"D"`, or `"E"`; matching is
  case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix to actual column names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors.

- to_numeric:

  Logical. Convert the eligible depressive-affect score to plain numeric
  and replace its negative missing code with `NA`.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove the wave
  prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes from matched names and add `LASA_wave`;
  implied by `standardize_names = TRUE`.

## Value

`data` with LASA606 metadata, optional conversions and renaming, a
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

Matching uses an explicit `name_corrections` entry, an exact match, then
a case-insensitive exact match. `to_factor = TRUE` converts the four
categorical items to factors while retaining observed undocumented
codes. `to_numeric = TRUE` restores the total score to plain numeric and
replaces its documented negative missing code with `NA`. Original values
and labels remain available in `original_values` and `original_labels`
attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, ctpces01 = c(0, 2), ctpcedep = c(-1, 5))
apply_lasa606_labels(dat, wave = "C")
#>   RespNr ctpces01 ctpcedep
#> 1      1        0       -1
#> 2      2        2        5
```
