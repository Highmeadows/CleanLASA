# Apply LASA114 (Perceived physical activity; LIVAS) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the ten perceived-physical-activity
self-efficacy items documented for LASA114. The items compare current
flexibility, reaction time, strength, condition, smooth movement, stair
climbing, grip, walking speed, balance, and activity with five years
earlier.

## Usage

``` r
apply_lasa114_labels(
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

  A data frame or tibble imported from a LASA114 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).

- wave:

  Character scalar identifying the LASA wave. One of `"B"`, `"C"`,
  `"D"`, `"E"`, `"2B"`, or `"F"`; matching is case-insensitive.

- name_corrections:

  Optional named character vector. Names are canonical suffixes without
  a wave prefix (for example `qseff01`) and values are actual column
  names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors using their
  documented value labels.

- to_numeric:

  Logical. Accepted for the shared interface; LASA114 has no numeric
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

LASA114 is documented for waves B, C, D, E, 2B, and F. Each wave
contains the same ten categorical items; only the wave prefix differs.
Item-specific response wording is reproduced from the codebook,
including the common `-1` no-answer code. The separately documented
LIVAS scale score belongs to filecode LASA314 and is deliberately not
included here.

Column matching tries, in order: an explicit `name_corrections`
override, an exact case-sensitive match, and a case-insensitive exact
match. `to_factor = TRUE` converts matched categorical items to factors
while retaining observed unlabelled codes as numeric-text levels.
LASA114 has no numeric variables eligible for `to_numeric` conversion.
Original values and labels are preserved in `original_values` and
`original_labels`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  BQSEFF01 = c(-1, 1, 5),
  bqseff10 = c(1, 3, 5)
)
dat <- apply_lasa114_labels(dat, wave = "B")
attr(dat$BQSEFF01, "labels")
#>          no answer much more flexible      more flexible   just as flexible 
#>                 -1                  1                  2                  3 
#>      less flexible much less flexible 
#>                  4                  5 
```
