# Apply LASA108 (Advance care planning) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to advance-care-planning variables
documented in LASA108 for waves I and K.

## Usage

``` r
apply_lasa108_labels(
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

  A data frame or tibble imported from a LASA108 `.sav` file. Names
  range from `iqacp1a` through `iqacp10e` in I and from `kqacp1a`
  through `kqacp7e` in K.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"I"` or `"K"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (for example `qacp1a`, `qacp5e`, or `qacp10e`) to actual
  column names in `data`.

- to_factor:

  Logical. If `TRUE`, matched variables are converted to factors using
  the documented labels; observed unlabelled codes remain numeric-text
  levels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA108 has no variables
  eligible for numeric conversion.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names have their wave prefix removed and
  `LASA_wave` is inserted immediately after the respondent-number
  column.

## Value

`data`, with LASA108 labels, optional factor conversion and name
standardization, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

Wave I contains 48 yes/no items across ten planning topics: future
health, a partner's future health, future care and guidance, informal
care, substitute medical decision-making, nursing-home admission,
life-extending treatment, resuscitation, euthanasia, and deathbed
wishes. The four partner-health items additionally use code -2 for not
applicable. Wave K uses a redesigned 35-item mention inventory across
seven topics, with five indicators per topic for thinking, discussion,
and a living will.

The source PDF repeats `kqacp1a` through `kqacp2e` verbatim on its final
page. They are implemented once in their first documented position, so
the wave-K inventory contains 35 unique variables rather than 45 rows.

All LASA108 variables are categorical. `to_numeric` is accepted for the
shared interface but does not convert them. With `to_factor = TRUE`,
matched variables become factors and observed unlabelled codes remain
numeric-text levels.

Column matching tries an explicit `name_corrections` override, an exact
case-sensitive name, then a case-insensitive exact name. Matched columns
preserve the original SPSS coding in `original_labels` and
`original_values`. Requested standardization removes the wave prefix,
standardizes `respnr`, and inserts `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(iqacp1a = c(-1, 1, 2), iqacp2a = c(-2, 1, 2))
dat <- apply_lasa108_labels(dat, wave = "I")
attr(dat$iqacp2a, "labels")
#> not applicable      no answer            yes             no 
#>             -2             -1              1              2 
```
