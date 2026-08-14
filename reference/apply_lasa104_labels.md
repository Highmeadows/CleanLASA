# Apply LASA104 (Perceived stress) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the ten perceived-stress questionnaire
items documented in LASA104 for waves H and 3B.

## Usage

``` r
apply_lasa104_labels(
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

  A data frame or tibble imported from a LASA104 `.sav` file. Documented
  names are `hqpss01` through `hqpss10` in H and `bqpss01` through
  `bqpss10` in 3B.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"H"` or `"3B"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (for example `qpss01` or `qpss10`) to actual column names
  in `data`.

- to_factor:

  Logical. If `TRUE`, matched variables are converted to factors using
  the documented labels; observed unlabelled codes remain numeric-text
  levels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA104 has no variables
  eligible for numeric conversion.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes, `respnr` is standardized, and `split_wavecode` is treated as
  `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names have their `h` or `b` wave prefix
  removed and a `LASA_wave` column is inserted immediately after the
  respondent-number column.

## Value

`data`, with LASA104 labels, optional factor conversion and name
standardization, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

All ten items use the same response scale from never to very often, with
code -1 for no answer. The perceived-stress total score shown in the
same source PDF belongs to filecode LASA304 and is deliberately not
included in this LASA104 function.

LASA104 variables are categorical, so `to_numeric` is accepted for the
shared interface but does not convert them. With `to_factor = TRUE`,
matched variables become factors using the documented response labels;
observed unlabelled codes remain numeric-text levels.

Column matching tries an explicit `name_corrections` override, an exact
case-sensitive name, then a case-insensitive exact name. Every matched
column preserves its original SPSS coding in `original_labels` and
`original_values`. Requested name standardization removes the wave
prefix, standardizes `respnr`, and inserts `LASA_wave`.

## See also

`apply_lasa304_labels()`,
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(hqpss01 = c(-1, 0, 4), hqpss04 = c(1, 2, 3))
dat <- apply_lasa104_labels(dat, wave = "H")
attr(dat$hqpss01, "labels")
#>    no answer        never almost never    sometimes        often   very often 
#>           -1            0            1            2            3            4 
```
