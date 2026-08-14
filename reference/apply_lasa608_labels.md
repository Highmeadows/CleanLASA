# Apply LASA608 (PROXY religious beliefs and philosophy) SPSS labels

Attaches the variable and value labels documented for the two LASA608
proxy telephone-interview items in wave C. Both items use a five-point
agreement scale. The documented second variable is spelled `ctprei10` in
the codebook and is therefore represented by canonical suffix `tprei10`.

## Usage

``` r
apply_lasa608_labels(
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

  A data frame or tibble imported from a LASA608 `.sav` file.

- wave:

  Character scalar `"C"`; matching is case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix to actual column names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors.

- to_numeric:

  Logical. Convert eligible codebook-numeric variables to plain numeric;
  LASA608 has no such variables.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove the wave
  prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes from matched names and add `LASA_wave`;
  implied by `standardize_names = TRUE`.

## Value

`data` with LASA608 metadata, optional conversions and renaming, a
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

Matching uses an explicit `name_corrections` entry, an exact match, then
a case-insensitive exact match. `to_factor = TRUE` converts the
categorical variables to factors while retaining observed undocumented
codes. LASA608 contains no codebook-numeric variables, so `to_numeric`
does not alter its documented variables. Original values and labels
remain available in `original_values` and `original_labels` attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, ctprel09 = c(1, 4), ctprei10 = c(2, 5))
apply_lasa608_labels(dat, wave = "C")
#>   RespNr ctprel09 ctprei10
#> 1      1        1        2
#> 2      2        4        5
```
