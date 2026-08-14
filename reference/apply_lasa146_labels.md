# Apply LASA146 (Last wishes) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the eleven last-wishes items documented
for LASA146. The items concern dependence, treatment decisions, support,
companionship, the moment of dying, preferred place of death, and an
other-wish indicator.

## Usage

``` r
apply_lasa146_labels(
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

  A data frame or tibble imported from a LASA146 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).

- wave:

  Character scalar identifying LASA wave `"F"`; matching is
  case-insensitive.

- name_corrections:

  Optional named character vector. Names are canonical suffixes without
  the wave prefix (for example `qdecf01`) and values are actual column
  names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors using their
  documented value labels.

- to_numeric:

  Logical. Accepted for the shared interface; LASA146 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. Rename matched columns to lowercase suffixes without the wave
  prefix, standardize the respondent-number column to `respnr`, and add
  `LASA_wave`.

- split_wavecode:

  Logical. Remove the wave prefix from matched column names and add
  `LASA_wave`. Always enabled by `standardize_names = TRUE`.

## Value

`data` with documented metadata applied, optional conversion and
renaming, a `LASA_wave` attribute, and a matching audit in the
`label_report` attribute.

## Details

LASA146 is documented only for wave F. Items 1 through 10 use a
five-point agreement scale with `-1` for no answer. Item 11 records
whether another wish was mentioned, using 0/1 plus the same `-1`
no-answer code.

Column matching tries, in order: an explicit `name_corrections`
override, an exact case-sensitive match, and a case-insensitive exact
match. `to_factor = TRUE` converts matched categorical items to factors
while retaining observed unlabelled codes as numeric-text levels.
LASA146 has no numeric variables eligible for `to_numeric` conversion.
Original values and labels are preserved in `original_values` and
`original_labels`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  FQDECF01 = c(-1, 1, 5),
  fqdecf11 = c(-1, 0, 1)
)
dat <- apply_lasa146_labels(dat, wave = "F")
attr(dat$FQDECF01, "labels")
#>                 no answer         strongly disagree                  disagree 
#>                        -1                         1                         2 
#> no agreement/disagreement                     agree            strongly agree 
#>                         3                         4                         5 
```
