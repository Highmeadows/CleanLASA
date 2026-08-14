# Apply LASA091 (PTSD self-report items) SPSS labels

Attaches the variable and value labels documented for the 23 SRIP/ZIL
PTSD self-report items in LASAD091 and LASAE091. Each item concerns
experiences during the preceding four weeks and uses not-at-all through
very-much response categories. The PDF's page heading says LASA 025, but
its variable information explicitly identifies filecode LASA091.

## Usage

``` r
apply_lasa091_labels(
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

  A data frame or tibble imported from LASAD091 or LASAE091.

- wave:

  Character scalar identifying wave `"D"` or `"E"`; matching is
  case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes `ptsd01`
  through `ptsd23` to actual column names in `data`.

- to_factor:

  Logical. Convert matched items to factors with documented value
  labels; observed undocumented codes remain numeric-text levels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA091 has no eligible
  numeric variables.

- standardize_names:

  Logical. Rename matched columns to lowercase canonical suffixes,
  standardize `respnr`, and imply wave splitting.

- split_wavecode:

  Logical. Remove the wave prefix from matched names and add `LASA_wave`
  after the respondent-number column.

## Value

The labelled data, with requested factor conversion and canonical names,
preserved original coding, `LASA_wave`, and `label_report`.

## Details

All LASA091 items are categorical; `to_numeric` is accepted for the
shared interface but does not convert them. Constructed score filecode
LASA291, documented in the same PDF, is intentionally excluded and
belongs to `apply_lasa291_labels()`.

Matching tries `name_corrections`, exact names, and case-insensitive
exact names. Factor conversion and canonical renaming/wave splitting
preserve the original SPSS coding and produce the generic `label_report`
audit.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(dptsd01 = c(-2, 1, 4), dptsd12 = c(1, 2, 3))
dat <- apply_lasa091_labels(dat, wave = "D")
attr(dat$dptsd01, "labels")
#> na, see D/ERMPTSD in LASAD/E291                       na, asked 
#>                              -2                              -1 
#>                      not at all                        somewhat 
#>                               1                               2 
#>                    considerably                       very much 
#>                               3                               4 
```
