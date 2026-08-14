# Apply LASA109 (Care and contacts with caregivers) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the 13 perceived-control-in-health-care
items documented in LASA109 for waves I, J, and K.

## Usage

``` r
apply_lasa109_labels(
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

  A data frame or tibble imported from a LASA109 `.sav` file. Names use
  the wave prefix followed by `qpchc05` through `qpchc15`, `qpchc17`, or
  `qpchc18`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (for example `qpchc05` or `qpchc18`) to actual column
  names in `data`.

- to_factor:

  Logical. If `TRUE`, matched variables are converted to factors using
  the documented labels; observed unlabelled codes remain numeric-text
  levels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA109 has no variables
  eligible for numeric conversion.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes, `respnr` is standardized, and `split_wavecode` is treated as
  `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names have their wave prefix removed and a
  `LASA_wave` column is inserted immediately after the respondent-number
  column.

## Value

`data`, with LASA109 labels, optional factor conversion and name
standardization, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

Items 05–15 cover recognizing care needs, finding and arranging care,
navigating organizations and appointments, and communicating with health
professionals. Items 17 and 18 cover managing medication and following
recommendations. All items use a five-point agreement scale; items 17
and 18 additionally include code 6 for not applicable.

All LASA109 variables are categorical. `to_numeric` is accepted for the
shared interface but does not convert them. With `to_factor = TRUE`,
matched variables become factors and observed unlabelled codes remain
numeric-text levels.

Column matching tries an explicit `name_corrections` override, an exact
case-sensitive name, then a case-insensitive exact name. Matched fields
preserve their original SPSS coding in `original_labels` and
`original_values`. Requested standardization removes the wave prefix,
standardizes `respnr`, and inserts `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(iqpchc05 = c(1, 3, 5), iqpchc17 = c(1, 5, 6))
dat <- apply_lasa109_labels(dat, wave = "I")
attr(dat$iqpchc17, "labels")
#>         no answer strongly disagree          disagree no (dis)agreement 
#>                -1                 1                 2                 3 
#>             agree    strongly agree    not applicable 
#>                 4                 5                 6 
```
