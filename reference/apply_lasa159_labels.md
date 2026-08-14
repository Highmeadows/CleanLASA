# Apply LASA159 (Decubitus) SPSS labels

Attaches the documented labels for the eight wave-B LASA159 decubitus
variables: reported presence and location, most severe location,
observed stage, home and nursing-home treatment, occurrence during the
past year, and frequency. All response and missing-value codes follow
the codebook.

## Usage

``` r
apply_lasa159_labels(
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

  A data frame or tibble imported from a LASA159 `.sav` file.

- wave:

  Character scalar `"B"`; matching is case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes to actual
  column names.

- to_factor:

  Logical. Convert labelled variables to factors.

- to_numeric:

  Logical. Accepted for the shared interface; no LASA159 variables are
  eligible for numeric restoration.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove the wave
  prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes and add `LASA_wave`; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASA159 metadata, optional reshaping, the `LASA_wave`
attribute, and a `label_report` audit.

## Details

Matching tries `name_corrections`, exact names, then case-insensitive
exact names. `to_factor = TRUE` converts labelled variables to factors
while retaining undocumented observed values. LASA159 has no variables
eligible for `to_numeric`. Original values and labels are preserved as
attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(bmdecu01 = c(-1, 1, 2), bmdecu04 = c(0, 1, 2))
apply_lasa159_labels(dat, wave = "B")
#>   bmdecu01 bmdecu04
#> 1       -1        0
#> 2        1        1
#> 3        2        2
```
