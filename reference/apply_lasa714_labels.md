# Apply LASA714 (RESP Weight Change) SPSS Labels

Attaches the variable and value labels documented for LASA714 respondent
telephone-interview data in waves I and J. The twelve-variable inventory
covers recent weight change, kilograms gained or lost, reported and
constructed reasons for change, appetite, estimated body weight, and
self-reported weight. The appetite reference period is six months in
wave I and seven days in wave J.

## Usage

``` r
apply_lasa714_labels(
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

  A data frame or tibble imported from a LASA714 `.sav` file.

- wave:

  Character scalar identifying wave `"I"` or `"J"`, matched
  case-insensitively.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix to actual column names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors.

- to_numeric:

  Logical. Restore eligible weight quantities to plain numeric and
  replace negative missing codes with `NA`.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove wave prefixes,
  and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes and add `LASA_wave`; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASA714 metadata, optional conversions and renaming,
preserved original coding, a `LASA_wave` attribute, and a
`label_report`.

## Details

The kilogram and self-reported-weight fields are codebook-numeric and
are eligible for `to_numeric`; their negative missing codes become `NA`.
Categorical fields can be converted with `to_factor`, while observed
undocumented codes are retained. Where the PDF prints a routing label
without a numeric code, no numeric value label is inferred.

Matching uses an explicit `name_corrections` entry, an exact match, then
a case-insensitive exact match. Original values and labels are
preserved. Standardized naming removes the wave prefix, standardizes
`respnr`, and adds `LASA_wave`; `split_wavecode` removes the prefix
without otherwise standardizing respondent-number spelling.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, itrvar142 = c(1, 3),
                  itrvar143L = c(-1, 4.5))
apply_lasa714_labels(dat, wave = "I", to_numeric = TRUE)
#>   RespNr itrvar142 itrvar143L
#> 1      1         1         NA
#> 2      2         3        4.5
```
