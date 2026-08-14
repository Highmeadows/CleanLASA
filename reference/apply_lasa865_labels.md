# Apply LASA865 (Thyroid Function) SPSS labels

Attaches the variable and value labels documented for the LASAC865
thyroid-function laboratory file. The wave-C inventory contains
thyroid-stimulating hormone, free T4, and free T3. Code `-1` denotes no
determination; free T4 and free T3 additionally use `-2` routing codes
referring to the preceding thyroid measurements.

## Usage

``` r
apply_lasa865_labels(
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

  A data frame or tibble imported from a LASAC865 `.sav` file.

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

`data` with LASA865 metadata, optional conversions and renaming, a
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

Matching tries `name_corrections`, an exact name, then a
case-insensitive exact name. `to_numeric = TRUE` restores the laboratory
measures to plain numeric and replaces negative missing codes with `NA`.
`to_factor = TRUE` converts value-labelled columns to factors when
numeric restoration is not requested. Original values and labels are
preserved in attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, cmtsh2 = c(-1, 2.4))
apply_lasa865_labels(dat, wave = "C", to_numeric = TRUE)
#>   RespNr cmtsh2
#> 1      1     NA
#> 2      2    2.4
```
