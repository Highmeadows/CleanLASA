# Apply LASA149 (General Self Regulation) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the fourteen General Self Regulation
(GSR) items documented for LASA149. The item set covers strategy use,
metastrategy knowledge, action planning, and coping planning.

## Usage

``` r
apply_lasa149_labels(
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

  A data frame or tibble imported from a LASA149 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).

- wave:

  Character scalar identifying LASA wave `"G"` or `"H"`; matching is
  case-insensitive.

- name_corrections:

  Optional named character vector. Names are canonical suffixes without
  a wave prefix (for example `qgsr01`) and values are actual column
  names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors using their
  documented value labels.

- to_numeric:

  Logical. Accepted for the shared interface; LASA149 has no numeric
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

LASA149 is documented for waves G and H. Both waves contain the same
fourteen categorical items; only the wave prefix differs. All items use
a six-point agreement scale and the `-1` no-answer code. The GSR total
and subscale scores shown in the same codebook belong to filecode
LASA349 and are deliberately not included here.

Column matching tries, in order: an explicit `name_corrections`
override, an exact case-sensitive match, and a case-insensitive exact
match. `to_factor = TRUE` converts matched categorical items to factors
while retaining observed unlabelled codes as numeric-text levels.
LASA149 has no numeric variables eligible for `to_numeric` conversion.
Original values and labels are preserved in `original_values` and
`original_labels`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  GQGSR01 = c(-1, 1, 6),
  gqgsr14 = c(1, 3, 6)
)
dat <- apply_lasa149_labels(dat, wave = "G")
attr(dat$GQGSR01, "labels")
#>         no answer strongly disagree          disagree slightly disagree 
#>                -1                 1                 2                 3 
#>    slightly agree             agree    strongly agree 
#>                 4                 5                 6 
```
