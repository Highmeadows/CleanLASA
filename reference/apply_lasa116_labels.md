# Apply LASA116 (Decubitus) SPSS labels

Attaches SPSS-style variable and value labels to the two decubitus items
documented in LASAB116. The self-administered questionnaire records
whether the respondent suffered bed sores and, separately, whether the
respondent received treatment.

## Usage

``` r
apply_lasa116_labels(
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

  A data frame or tibble imported from LASAB116.

- wave:

  Character scalar. Only `"B"` is documented and accepted; matching is
  case-insensitive.

- name_corrections:

  Optional named character vector whose names are canonical suffixes
  (`qdecu01` or `qdecu02`) and whose values are actual column names in
  `data`.

- to_factor:

  Logical. Convert matched variables to factors using the documented
  value labels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA116 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. Standardize matched names and respondent number, remove the
  `b` wave prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove the wave prefix from matched names and add
  `LASA_wave`; implied by `standardize_names = TRUE`.

## Value

`data` with LASA116 metadata, optional conversion and renaming,
original-coding attributes, `LASA_wave`, and a `label_report` audit.

## Details

LASA116 is documented only for wave B. Both variables are categorical.
`qdecu01` distinguishes no bed sores from three documented duration
categories; `qdecu02` records treatment. Both use `-1` for no answer.

Matching tries `name_corrections`, an exact name, then a
case-insensitive exact name. `to_factor = TRUE` converts the items using
their documented value maps and preserves any observed unlabelled codes
as numeric-text levels. No variable is eligible for `to_numeric`.
Original labels and values are retained in `original_labels` and
`original_values`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(BQDECU01 = c(-1, 1, 4), bqdecu02 = c(-1, 1, 2))
dat <- apply_lasa116_labels(dat, wave = "B")
attr(dat$BQDECU01, "labels")
#>        no answer               no  yes, <two weeks yes, 2wks><3mths 
#>               -1                1                2                3 
#>    yes, >3months 
#>                4 
```
