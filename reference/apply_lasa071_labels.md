# Apply LASA071 (Attitude toward ageing) SPSS labels

Attaches the variable and value labels documented for the four
evaluation- of-age-norms items in LASA071. The file is documented at
waves B and K. Items concern daily pursuits, financial situation,
contact with family or friends, and current affairs. Both waves use
no/more-or-less/yes response categories, with wave-specific
missing-reason labels and codes.

## Usage

``` r
apply_lasa071_labels(
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

  A data frame or tibble imported from a LASAB071 or LASAK071 `.sav`
  file.

- wave:

  Character scalar identifying wave `"B"` or `"K"`; matching is
  case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (`eval01` through `eval04` at B, and `eval01`, `eval02`,
  `beval03`, and `eval04` at K) to actual names.

- to_factor:

  Logical. Convert matched variables to factors using the documented
  value labels; observed undocumented codes remain text levels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA071 has no eligible
  numeric variables.

- standardize_names:

  Logical. Rename matched columns to lowercase canonical suffixes,
  standardize `respnr`, and imply wave splitting.

- split_wavecode:

  Logical. Remove the wave prefix from matched names and insert
  `LASA_wave` after the respondent-number column.

## Value

The labelled data, with requested factor conversion and canonical names,
preserved original coding, `LASA_wave`, and `label_report`.

## Details

The documented wave-K name for the third item is `kbeval03`, unlike
`keval01`, `keval02`, and `keval04`; this spelling is preserved. Its
canonical suffix for matching and standardized output is `beval03`.

All variables are categorical, so `to_numeric` is accepted for the
shared interface but does not convert them. Matching tries
`name_corrections`, exact names, and then case-insensitive exact names.
Conversion and renaming preserve original coding and produce the generic
`label_report` audit.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(beval01 = c(-4, 1, 3))
dat <- apply_lasa071_labels(dat, wave = "B")
attr(dat$beval01, "labels")
#> no answer, short version         no answer, asked                       no 
#>                       -4                       -1                        1 
#>             more or less                      yes 
#>                        2                        3 
```
