# Apply LASA604 (PROXY vision and hearing) SPSS labels

Attaches the variable and value labels documented for LASA604 proxy
telephone-interview data. Waves C, D, and E contain two questions about
change in vision and hearing during the previous three years. Waves F
through K contain six questions about glasses, hearing aids, reading
small print, and following a conversation. Codes 5 for not using an aid
are documented only in waves H through K.

## Usage

``` r
apply_lasa604_labels(
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

  A data frame or tibble imported from a LASA604 `.sav` file.

- wave:

  Character scalar: `"C"`, `"D"`, `"E"`, `"F"`, `"G"`, `"H"`, `"I"`,
  `"J"`, or `"K"`; matching is case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix to actual column names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors.

- to_numeric:

  Logical. Convert eligible codebook-numeric variables to plain numeric;
  LASA604 has no such variables.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove the wave
  prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes from matched names and add `LASA_wave`;
  implied by `standardize_names = TRUE`.

## Value

`data` with LASA604 metadata, optional conversions and renaming, a
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

Matching uses an explicit `name_corrections` entry, an exact match, then
a case-insensitive exact match. `to_factor = TRUE` converts labelled
categorical variables to factors while retaining observed undocumented
codes. LASA604 contains no codebook-numeric variables, so `to_numeric`
does not alter its documented categorical variables. Original values and
labels remain available in `original_values` and `original_labels`
attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, ctpsight = c(3, 4), ctphear = c(3, 5))
apply_lasa604_labels(dat, wave = "C")
#>   RespNr ctpsight ctphear
#> 1      1        3       3
#> 2      2        4       5
```
