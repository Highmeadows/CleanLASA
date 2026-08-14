# Apply LASA118 (Diet/food quality) SPSS labels

Attaches SPSS-style metadata to the diet, food-quality, and appetite
variables documented for LASA118. The inventory changes substantially by
wave: B contains 20 chewing, meal-frequency, diet, fruit, and vegetable
items; C and D contain one chewing item; H, I, and J contain seven
eating- risk items; and K contains those seven items plus four appetite
items.

## Usage

``` r
apply_lasa118_labels(
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

  A data frame or tibble imported from a LASA118 `.sav` file.

- wave:

  Character scalar identifying `"B"`, `"C"`, `"D"`, `"H"`, `"I"`, `"J"`,
  or `"K"`; matching is case-insensitive.

- name_corrections:

  Optional named character vector whose names are canonical suffixes
  without the wave prefix, such as `qfood01` or `qapp1`, and whose
  values are actual column names in `data`.

- to_factor:

  Logical. Convert matched categorical variables to factors using
  documented value labels.

- to_numeric:

  Logical. Restore eligible wave-B frequency variables to plain numeric
  and replace negative missing codes with `NA`.

- standardize_names:

  Logical. Standardize matched names and respondent number, remove wave
  prefixes, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes from matched names and add `LASA_wave`;
  implied by `standardize_names = TRUE`.

## Value

`data` with LASA118 metadata, optional conversion and renaming,
original-coding attributes, `LASA_wave`, and a `label_report` audit.

## Details

Wave-B meal-frequency and fruit/vegetable frequency variables are
numeric with `-1` for no answer. With `to_numeric = TRUE`, these
variables become plain numeric and negative codes become `NA`. All
remaining variables are categorical and can be converted with
`to_factor = TRUE`. Value labels, variable labels, and spelling are
reproduced from the codebook.

Column matching tries `name_corrections`, an exact name, then a case-
insensitive exact name. Original labels and values are retained in
`original_labels` and `original_values` attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  BQFOOD01 = c(-1, 1, 4),
  bqfood02 = c(-1, 2, 4)
)
dat <- apply_lasa118_labels(dat, wave = "B", to_numeric = TRUE)
dat$bqfood02
#> [1] NA  2  4
#> attr(,"label")
#> [1] "#times eaten: morning"
#> attr(,"original_labels")
#> no answer 
#>        -1 
#> attr(,"original_values")
#> [1] -1  2  4
```
