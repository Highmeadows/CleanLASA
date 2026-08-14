# Apply LASA801 (Coffee and Tea Consumption) SPSS Labels

Attaches the variable and value labels documented for the 26 coffee- and
tea-consumption variables in LASA801. The available file is wave J. It
includes parallel questions for participants aged 40–65 years and for
consumption during the past month, plus usual coffee- and tea-cup
volume. Although the PDF header mentions wave K, its footnote states
that K was not yet available; consequently this function accepts only
wave J.

## Usage

``` r
apply_lasa801_labels(
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

  A data frame or tibble imported from a LASA801 `.sav` file.

- wave:

  Character scalar. Only `"J"` is documented as available.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  J prefix to actual column names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors.

- to_numeric:

  Logical. Restore eligible cup counts and free-text cup volumes to
  plain numeric, replacing negative codes with `NA`.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove the wave
  prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove the wave prefix and add `LASA_wave`; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASA801 metadata, requested conversions and renaming,
preserved original coding, a `LASA_wave` attribute, and a
`label_report`.

## Details

Daily total cup counts and free-text "other" cup volumes are numeric and
eligible for `to_numeric`; negative missing codes become `NA`. Weekly
frequencies, beverage-specific cup categories (which include code 11 for
not applicable), and cup-size categories can be converted with
`to_factor`. Original coding is retained in reference attributes.

Matching tries `name_corrections`, an exact case-sensitive name, then a
case-insensitive exact name. Standardized naming removes the J prefix,
standardizes `respnr`, and adds `LASA_wave`. `split_wavecode` removes
the prefix and adds the wave column without otherwise standardizing
`respnr`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, jqcof1 = c(0, 7), jqcof2 = c(-1, 4))
apply_lasa801_labels(dat, wave = "J", to_numeric = TRUE)
#>   RespNr jqcof1 jqcof2
#> 1      1      0     NA
#> 2      2      7      4
```
