# Apply LASA139 (Partner questions) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the partner-question variables
documented in LASA139 for waves E, F, G, H, 3B, I, J, and K.

## Usage

``` r
apply_lasa139_labels(
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

  A data frame or tibble imported from a LASA139 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Names include wave-prefixed forms such as `eqprel1`, `bqpadl6`,
  `iqpdeme`, and `kqprespc4`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"E"`, `"F"`, `"G"`, `"H"`, `"3B"`, `"I"`,
  `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector mapping canonical LASA139 suffixes
  without the wave prefix (for example `qprel1`, `qpdis1`, `qpadl6`, or
  `qprespc1`) to actual column names in `data`.

- to_factor:

  Logical. If `TRUE`, categorical variables with documented value labels
  are converted to factors. Observed unlabelled codes remain
  numeric-text levels.

- to_numeric:

  Logical. Retained for the shared parameter contract. LASA139 contains
  no numeric count or continuous variables, so it does not change the
  documented variables.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column containing the selected wave is inserted
  immediately after the respondent-number column.

## Value

`data`, with LASA139 variable/value labels, optional factor conversion
and standardized naming, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

Every wave contains six relationship-satisfaction items, important
conversation frequency, five partner functional-limitation items,
partner memory problems, and partner dementia. Waves E through J (but
not K) also contain two relationship evaluations, four dispute items,
and public transportation. Dementia is routed from partner status
through 3B and from partner memory problems in I–K. Waves I–K
additionally contain four respite-care items. Consequently, the
documented inventories contain 21 variables in E/F/G/H/3B, 25 in I/J,
and 18 in K.

All documented variables are categorical. With `to_factor = TRUE`, they
become factors and observed unlabelled codes (including intermediate 2–9
relationship-evaluation scores) remain numeric-text levels. `to_numeric`
is retained for the shared parameter contract but does not change them.

Column matching tries an explicit `name_corrections` override, an exact
case-sensitive match, then a case-insensitive exact match. Absent
variables are recorded as `"not found"`. Original SPSS labels and values
are preserved. Standardized naming optionally removes the wave prefix,
standardizes `respnr`, and adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, eqprel1 = c(1, 5), eqpdeme = c(-2, 2))
dat <- apply_lasa139_labels(dat, wave = "E", to_factor = TRUE)
attr(dat$eqprel1, "labels")
#> NULL
```
