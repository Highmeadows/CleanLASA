# Apply LASA106 (Work perception) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the work-perception variables documented
in LASA106 for waves 3B, MB, I, J, and K.

## Usage

``` r
apply_lasa106_labels(
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

  A data frame or tibble imported from a LASA106 `.sav` file. Depending
  on `wave`, names include `bqworkd`, `iqworkd1`, `jqworkd18`,
  `kqworkd21`, `bqworkYN`, `bqworkn1`, and `bqworkp13`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (for example `qworkd`, `qworkd18`, `qworkyn`, `qworkn1`,
  or `qworkp1`) to actual column names in `data`.

- to_factor:

  Logical. If `TRUE`, matched variables are converted to factors using
  the documented labels; observed unlabelled codes remain numeric-text
  levels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA106 has no variables
  eligible for numeric conversion.

- standardize_names:

  Logical. If `TRUE`, matched variables are renamed to canonical
  lowercase suffixes without the wave prefix, `respnr` is standardized,
  and `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names have their wave prefix removed and a
  `LASA_wave` column is inserted immediately after the respondent-number
  column.

## Value

`data`, with LASA106 labels, optional factor conversion and name
standardization, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

Waves 3B, I, J, and K contain an employment-history item followed by 21
work-demand items. Items 1–17 permit `not applicable` only in wave I;
social-support items 18–21 permit it in waves I, J, and K. Wave MB uses
a redesigned medical-interview schema: a four-level employment-history
item and 13 paired `work demands`/`work demanded` items, for 27
variables total. The documented wave-specific inventories, labels, and
response maps are retained.

LASA106 fields are categorical. `to_numeric` is accepted for consistency
with the shared interface but does not convert them. With
`to_factor = TRUE`, matched variables become factors using the
documented response labels; observed unlabelled codes remain
numeric-text levels.

Column matching tries an explicit `name_corrections` override, an exact
case-sensitive name, then a case-insensitive exact name. Every matched
field preserves the original SPSS coding in `original_labels` and
`original_values`. Requested standardization removes the wave prefix,
standardizes `respnr`, and inserts `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(iqworkd = c(1, 2), iqworkd1 = c(1, 5))
dat <- apply_lasa106_labels(dat, wave = "I")
attr(dat$iqworkd1, "labels")
#> na, see B/I/J/KQWORKD             na, asked                 never 
#>                    -2                    -1                     1 
#>             sometimes                 often          all the time 
#>                     2                     3                     4 
#>        not applicable 
#>                     5 
```
