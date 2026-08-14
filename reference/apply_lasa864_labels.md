# Apply LASA864 (Serum Cortisol) SPSS labels

Attaches the variable and value labels documented for the three serum
cortisol measures in the LASAC864 medical-interview file. The wave-C
inventory contains total cortisol, corticosteroid binding globuline, and
calculated free cortisol. Codes `-3` and `-1` identify an incorrect
value and no determination where documented.

## Usage

``` r
apply_lasa864_labels(
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

  A data frame or tibble imported from a LASAC864 `.sav` file.

- wave:

  Character scalar: `"C"`; matching is case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix to actual column names in `data`.

- to_factor:

  Logical. Convert value-labelled variables to factors.

- to_numeric:

  Logical. Restore laboratory measures to plain numeric and replace
  negative missing codes with `NA`.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove the wave
  prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes from matched names and add `LASA_wave`;
  implied by `standardize_names = TRUE`.

## Value

`data` with LASA864 metadata, optional conversions and renaming, a
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

Matching uses an explicit `name_corrections` entry, an exact match, then
a case-insensitive exact match. `to_numeric = TRUE` restores the
laboratory measures to plain numeric and replaces negative missing codes
with `NA`. `to_factor = TRUE` converts value-labelled columns to factors
when numeric restoration is not requested. Original values and labels
remain available in `original_values` and `original_labels` attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, cmco = c(-1, 250))
apply_lasa864_labels(dat, wave = "C", to_numeric = TRUE)
#>   RespNr cmco
#> 1      1   NA
#> 2      2  250
```
