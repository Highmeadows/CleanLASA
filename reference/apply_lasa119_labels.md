# Apply LASA119 (Fertility in women) SPSS labels

Attaches SPSS-style variable and value labels to the 13 fertility and
menopause variables documented in LASAB119. The self-administered module
covers reproductive timing and number of children, menopause, oral
contraceptive use, and five menopause-related symptoms.

## Usage

``` r
apply_lasa119_labels(
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

  A data frame or tibble imported from LASAB119.

- wave:

  Character scalar. Only `"B"` is documented and accepted; matching is
  case-insensitive.

- name_corrections:

  Optional named character vector whose names are canonical suffixes
  without the `b` prefix, such as `qmeno01`, and whose values are actual
  column names in `data`.

- to_factor:

  Logical. Convert matched categorical variables to factors using
  documented value labels.

- to_numeric:

  Logical. Restore eligible age, count, and duration variables to plain
  numeric and replace negative missing codes with `NA`.

- standardize_names:

  Logical. Standardize matched names and respondent number, remove the
  `b` wave prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove the wave prefix from matched names and add
  `LASA_wave`; implied by `standardize_names = TRUE`.

## Value

`data` with LASA119 metadata, optional conversion and renaming,
original-coding attributes, `LASA_wave`, and a `label_report` audit.

## Details

Age, count, and duration variables (`qmeno01`, `qmeno02`, `qmeno03`,
`qmeno05`, and `qmeno08`) are numeric and can be restored with
`to_numeric = TRUE`; all negative missing codes then become `NA`. The
remaining variables are categorical and can be converted with
`to_factor = TRUE`. The common missing codes are `-3` for no answer,
skipped, `-2` for male respondent, and `-1` for no answer.

Matching tries `name_corrections`, an exact name, then a
case-insensitive exact name. Original labels and values are retained in
`original_labels` and `original_values` attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  BQMENO01 = c(-2, 13, 15),
  bqmeno06 = c(-2, 1, 3)
)
dat <- apply_lasa119_labels(dat, wave = "B", to_numeric = TRUE)
dat$BQMENO01
#> [1] NA 13 15
#> attr(,"label")
#> [1] "menopause 01: age start period"
#> attr(,"original_labels")
#> no answer, skipped    male respondent          no answer 
#>                 -3                 -2                 -1 
#> attr(,"original_values")
#> [1] -2 13 15
```
