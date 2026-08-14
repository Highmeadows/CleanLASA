# Apply LASA110 (Satisfaction and important life aspects) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the life-satisfaction and
important-life-aspect variables documented in LASA110 for waves B
through K, including replenishment waves 2B and 3B.

## Usage

``` r
apply_lasa110_labels(
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

  A data frame or tibble imported from a LASA110 `.sav` file. Names
  include a wave prefix followed by `qsatis1`, `qsatis2`,
  `qimpor1`–`qimpor9`, and `qnansw`; H, I, and J also use `qsatis3` and
  `qsatis4`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (for example `qsatis1`, `qimpor4`, or `qnansw`) to actual
  column names in `data`.

- to_factor:

  Logical. If `TRUE`, categorical variables are converted to factors
  using the documented labels; observed unlabelled codes remain
  numeric-text levels.

- to_numeric:

  Logical. If `TRUE`, the aspect-count variable and, where present, the
  0–10 satisfaction score are restored to plain numeric and negative
  values are replaced by `NA`.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names have their wave prefix removed and
  `LASA_wave` is inserted immediately after the respondent-number
  column.

## Value

`data`, with LASA110 labels, optional conversion and standardized
naming, preserved original SPSS coding, the `LASA_wave` provenance
attribute, and a `label_report` matching audit.

## Details

Every documented wave contains two five-point satisfaction items, nine
indicators for important life aspects, and a count of mentioned aspects.
The fourth aspect is labelled `sensible spending of time` in waves B–H
except 3B, and `meaningful pastime` in 3B, I, J, and K. Waves H, I, and
J additionally contain a 0–10 current-satisfaction score and a
comparison with the previous year.

The aspect-count variable and the 0–10 current-satisfaction score are
eligible for `to_numeric`; observed negative missing codes become `NA`.
Other LASA110 fields are categorical. With `to_factor = TRUE`,
categorical variables become factors and observed unlabelled codes
remain numeric-text levels. `to_numeric` takes precedence for eligible
fields.

Column matching tries an explicit `name_corrections` override, an exact
case-sensitive name, then a case-insensitive exact name. Every matched
field preserves its original SPSS coding in `original_labels` and
`original_values`. Requested standardization removes the wave prefix,
standardizes `respnr`, and inserts `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(hqsatis1 = c(1, 5), hqnansw = c(0, 9))
dat <- apply_lasa110_labels(dat, wave = "H", to_numeric = TRUE)
attr(dat$hqsatis1, "labels")
#>                  no answer          very dissatisfied 
#>                         -1                          1 
#>               dissatisfied not dissatisfied/satisfied 
#>                          2                          3 
#>                  satisfied             very satisfied 
#>                          4                          5 
```
