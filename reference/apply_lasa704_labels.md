# Apply LASA704 (RESP vision and hearing) SPSS labels

Attaches the variable and value labels documented for LASA704 respondent
telephone-interview data in waves C through K. Wave C contains two
questions about change in vision and hearing during the previous three
years. Waves D through I contain six questions about glasses, hearing
aids, reading small print, and following a conversation. Waves J and K
replace the earlier hearing-aid block with six more detailed questions
about aid possession, use, current wearing, and conversation.

## Usage

``` r
apply_lasa704_labels(
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

  A data frame or tibble imported from a LASA704 `.sav` file.

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
  LASA704 contains no such variables.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove wave prefixes,
  and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes from matched names and add `LASA_wave`;
  implied by `standardize_names = TRUE`.

## Value

`data` with LASA704 metadata, optional conversion and reshaping, an
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

All documented LASA704 variables are categorical. Consequently,
`to_factor = TRUE` converts them to factors while retaining observed
undocumented codes, whereas `to_numeric` does not alter them. Original
values and value labels remain available in `original_values` and
`original_labels` attributes.

Matching tries an explicit `name_corrections` entry, an exact match, and
a case-insensitive exact match, in that order. Standardized naming
removes the wave prefix; `standardize_names` and `split_wavecode` add
`LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, ctrsight = c(3, 4), ctrhear = c(3, 5))
apply_lasa704_labels(dat, wave = "C")
#>   RespNr ctrsight ctrhear
#> 1      1        3       3
#> 2      2        4       5
```
