# Apply LASA607 (PROXY cognition, IQCODE) SPSS labels

Attaches the variable and value labels documented for the six LASA607
Informant Questionnaire on Cognitive Decline (IQCODE) items and their
total score in waves C through K. Items range from much better (1) to
much worse (5). The score is documented as low at its minimum (nominally
6) and much decline at its maximum (nominally 30), with endpoints
depending on the specific sample and wave; only its fixed missing code
is attached as a value label.

## Usage

``` r
apply_lasa607_labels(
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

  A data frame or tibble imported from a LASA607 `.sav` file.

- wave:

  Character scalar from `"C"` through `"K"`; matching is
  case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix to actual column names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors.

- to_numeric:

  Logical. Convert the eligible IQCODE total score to plain numeric and
  replace its negative missing code with `NA`.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove the wave
  prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes from matched names and add `LASA_wave`;
  implied by `standardize_names = TRUE`.

## Value

`data` with LASA607 metadata, optional conversions and renaming, a
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

Matching uses an explicit `name_corrections` entry, an exact match, then
a case-insensitive exact match. `to_factor = TRUE` converts the six
categorical items to factors while retaining observed undocumented
codes. `to_numeric = TRUE` restores the total score to plain numeric and
replaces its documented negative missing code with `NA`. Original values
and labels remain available in `original_values` and `original_labels`
attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, ctpcogd1 = c(3, 4), ctpcogdc = c(-1, 18))
apply_lasa607_labels(dat, wave = "C")
#>   RespNr ctpcogd1 ctpcogdc
#> 1      1        3       -1
#> 2      2        4       18
```
