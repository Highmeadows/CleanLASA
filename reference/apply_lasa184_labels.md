# Apply LASA184 (Diet) SPSS labels

Attaches SPSS-style variable and value labels to the diet and
milk-product variables documented for LASA184. The file is documented
for waves C and D. Both waves contain the diet indicator and five
diet-type indicators; wave C additionally contains high-calorie and
other-diet indicators, five weekly milk-product frequencies, and
milk-consumption histories for three age periods.

## Usage

``` r
apply_lasa184_labels(
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

  A data frame or tibble imported from a LASA184 `.sav` file.

- wave:

  Character scalar identifying wave `"C"` or `"D"`; matching is
  case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (for example `mdiet`) to actual columns.

- to_factor:

  Logical. Convert labelled variables to factors.

- to_numeric:

  Logical. Convert weekly milk-product counts to plain numeric and
  replace negative missing codes with `NA`.

- standardize_names:

  Logical. Standardize matched names and respondent number, remove wave
  prefixes, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes and add `LASA_wave`; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASA184 metadata, optional conversion and renaming, a
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

Weekly milk-product frequencies are numeric counts. With
`to_numeric = TRUE`, their negative missing codes become `NA`; the other
variables remain categorical. With `to_factor = TRUE`, labelled
variables become factors and observed unlabelled values are retained as
numeric-text levels. Original values and labels remain available in
`original_values` and `original_labels`.

Matching tries an explicit `name_corrections` override, an exact match,
then a case-insensitive exact match. Optional standardized naming
removes the wave prefix, standardizes `respnr`, and adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(cmdiet = c(-1, 1, 2), cmmilkmlk = c(-1, 0, 7))
apply_lasa184_labels(dat, wave = "C", to_numeric = TRUE)
#>   cmdiet cmmilkmlk
#> 1     -1        NA
#> 2      1         0
#> 3      2         7
```
