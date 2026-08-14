# Apply LASAz008 (Age) SPSS labels

Attaches the variable and value labels documented for the longitudinal
LASAz008 age file. The file combines LSN wave A and LASA waves B through
K, including the 2B and 3B cohorts, and stores interview dates plus age
in years and days for the main/telephone and medical interviews.
LASMB008 is documented in the same PDF but belongs to a separate data
file and is not labelled by this function.

## Usage

``` r
apply_lasaz008_labels(
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

  A data frame or tibble imported from `LASAz008.sav`.

- wave:

  Character scalar `"Z"`, matched case-insensitively.

- name_corrections:

  Optional named character vector mapping canonical LASAz008 names to
  actual column names in `data`.

- to_factor:

  Logical. Convert value-labelled variables to factors while retaining
  observed undocumented values as numeric-text levels.

- to_numeric:

  Logical. Restore eligible age/count variables to plain numeric and
  replace negative values with `NA`.

- standardize_names:

  Logical. Lowercase matched names, standardize `respnr`, and add
  `LASA_wave`.

- split_wavecode:

  Logical. Add `LASA_wave`; implied by `standardize_names = TRUE`.

## Value

`data` with LASAz008 metadata, requested conversions and naming, an
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

LASAz008 is a wave-spanning `Z` file, so `wave` must be `"Z"`. Variables
whose only value label is the documented `-2` no-interview code are
eligible for `to_numeric`; negative observed values then become `NA`.
Date variables retain their date-valued no-interview label where the
codebook documents 03.10.1582 and are not treated as plain numeric.

Matching tries an explicit `name_corrections` entry, an exact match, and
a case-insensitive exact match, in that order. `standardize_names`
lowercases matched names and standardizes `respnr`; either
`standardize_names` or `split_wavecode` adds `LASA_wave = "Z"`. Original
values and labels are preserved in `original_values` and
`original_labels` attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, bage = c(65, -2), bdays = c(24000, -2))
apply_lasaz008_labels(dat, wave = "Z", to_numeric = TRUE)
#>   RespNr bage bdays
#> 1      1   65 24000
#> 2      2   NA    NA
```
