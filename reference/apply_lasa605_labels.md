# Apply LASA605 (PROXY falling and fractures) SPSS labels

Attaches the variable and value labels documented for LASA605 proxy
telephone-interview data. Wave C records falls and up to three fractures
in a ten-variable inventory. Wave D adds a fracture count and separate
occurrence questions for each fracture. Waves E through K retain the
eleven fracture variables but omit the two fall questions.

## Usage

``` r
apply_lasa605_labels(
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

  A data frame or tibble imported from a LASA605 `.sav` file.

- wave:

  Character scalar: `"C"`, `"D"`, `"E"`, `"F"`, `"G"`, `"H"`, `"I"`,
  `"J"`, or `"K"`; matching is case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix to actual column names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors.

- to_numeric:

  Logical. Convert eligible fall/fracture counts to plain numeric and
  replace documented negative missing codes with `NA`.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove the wave
  prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes from matched names and add `LASA_wave`;
  implied by `standardize_names = TRUE`.

## Value

`data` with LASA605 metadata, optional conversions and renaming, a
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

Fracture type uses the documented 13-code table, from pulse/wrist/Colles
fracture through unknown type. Matching uses an explicit
`name_corrections` entry, an exact match, then a case-insensitive exact
match. `to_factor = TRUE` converts categorical variables to factors
while retaining observed undocumented codes. `to_numeric = TRUE`
restores the fall and fracture counts to plain numeric and replaces
their negative missing codes with `NA`. Original values and labels
remain available in `original_values` and `original_labels` attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, ctpfall = c(1, 2), ctpfalln = c(-2, 3))
apply_lasa605_labels(dat, wave = "C")
#>   RespNr ctpfall ctpfalln
#> 1      1       1       -2
#> 2      2       2        3
```
