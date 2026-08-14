# Apply LASA128 (Donorship) SPSS labels

Attaches SPSS-style variable and value labels to donorship variables
documented in LASA128 for waves I and J.

## Usage

``` r
apply_lasa128_labels(
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

  A data frame or tibble imported from a LASA128 `.sav` file. Names may
  include `iqdona3`, `iqdona8`, `jqdona1_2`, or `jqdona1_5`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"I"` or `"J"`.

- name_corrections:

  Optional named character vector mapping suffixes without the wave
  prefix (for example `qdona3` or `qdona1_5`) to actual names in `data`.

- to_factor:

  Logical. If `TRUE`, categorical variables are converted to factors
  using the documented value labels.

- to_numeric:

  Logical. If `TRUE`, the wave-I registration-year fields are restored
  to plain numeric and negative values become `NA`.

- standardize_names:

  Logical. If `TRUE`, matched names and `respnr` are standardized and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names lose the wave prefix and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA128 labels, requested conversion or renaming, preserved
original coding, `LASA_wave` provenance, and a `label_report`.

## Details

Wave I has eight variables on blood or plasma donor registration, former
registration years and reasons for stopping, recent donation frequency,
and organ-donation decisions. Wave J has five variables: current donor
registration and questions about decisions before and after the new
donor law.

The two wave-I registration-year fields are numeric and eligible for
`to_numeric`; their negative routing/missing codes become `NA`. The
other fields are categorical and can be converted with `to_factor`.

Matching tries `name_corrections`, an exact case-sensitive match, and
then a case-insensitive exact match. Original SPSS coding is preserved;
standardized naming removes the wave prefix and can add `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(iqdona1 = c(1, 3), iqdona3 = c(-2, 1995))
dat <- apply_lasa128_labels(dat, wave = "I", to_numeric = TRUE)
attr(dat$iqdona1, "labels")
#>   na, asked  yes, blood yes, plasma          no 
#>          -1           1           2           3 
```
