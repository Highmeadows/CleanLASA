# Apply LASA705 (RESP falling) SPSS labels

Attaches the variable and value labels documented for LASA705 respondent
telephone-interview data in waves C through K. The file covers falls
during the previous year, the number of fractures since the previous
interview, and up to three fractures with their type, cause, and doctor
contact.

## Usage

``` r
apply_lasa705_labels(
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

  A data frame or tibble imported from a LASA705 `.sav` file.

- wave:

  Character scalar: `"C"`, `"D"`, `"E"`, `"F"`, `"G"`, `"H"`, `"I"`,
  `"J"`, or `"K"`; matching is case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix to actual column names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors.

- to_numeric:

  Logical. Convert documented fall and fracture counts to plain numeric
  and replace negative values with `NA`.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove wave prefixes,
  and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes from matched names and add `LASA_wave`;
  implied by `standardize_names = TRUE`.

## Value

`data` with LASA705 metadata, requested conversions and reshaping, an
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

Wave C uses an earlier fracture inventory. Wave D retains two fall
questions that are absent from E through K. Waves D through K include a
fracture count and three separate indicators of whether each fracture
occurred. Doctor-contact code `0` means no in waves C through G, whereas
code `1` means no from wave H onward.

Fall and fracture counts are codebook-numeric and are eligible for
`to_numeric`; negative values become `NA`. Other documented variables
are categorical and can be converted with `to_factor`. Original values
and labels are preserved in reference attributes.

Matching tries `name_corrections`, an exact match, and a
case-insensitive exact match. Standardized naming removes the wave
prefix; `standardize_names` and `split_wavecode` add `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, ctrfall = c(1, 2), ctrfalln = c(-2, 3))
apply_lasa705_labels(dat, wave = "C", to_numeric = TRUE)
#>   RespNr ctrfall ctrfalln
#> 1      1       1       NA
#> 2      2       2        3
```
