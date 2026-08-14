# Apply LASA017 (Income) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to a LASA017 income data frame, using the
wording, income-category thresholds, routing references, and
missing-value codes documented for the requested wave. By default,
matched variables remain numeric. Optional arguments allow converting
the categorical variables to factors, correcting mismatched column
names, and standardizing names to the canonical LASA documentation
spelling.

## Usage

``` r
apply_lasa017_labels(
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

  A data frame or tibble imported from a LASA017 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Expected wave-prefixed names include `brespinc`, `brinc01`, `fincc5s`,
  `iincc8s`, and `kincc10s`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA017 suffixes without the wave prefix (for
  example `respinc`, `inccat`, or `incc8s`), and values are actual
  column names in `data`, for example `c(inccat = "B_INCOME_CATEGORY")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their documented value labels. Observed values
  without a codebook label remain numeric-text levels rather than
  becoming `NA`.

- to_numeric:

  Logical. Retained for the common apply-label parameter contract.
  LASA017 documents categorical screens, source checklists, and income
  bands rather than raw numeric income measures, so this argument does
  not change LASA017 columns. Raw amounts documented for the separate
  LASAB217 file are not processed here.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA017 columns are renamed to their canonical lowercase suffixes with
  the wave code removed; `"respnr"` is standardized; and
  `split_wavecode` is always treated as `TRUE`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, matched columns are renamed
  with the wave prefix removed and a new `"LASA_wave"` column filled
  with `wave` is inserted immediately after the respondent-number
  column. It is always treated as `TRUE` when
  `standardize_names = TRUE`.

## Value

`data`, with variable/value-label attributes attached to every matched
LASA017 column, optional factor conversion and canonical renaming, and
`original_labels`/`original_values` attributes preserving the original
SPSS coding. A `"LASA_wave"` column is added when requested. The generic
name-matching audit is attached as `attr(data, "label_report")` and can
be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA017 changes across waves. Wave B uses 0/1 screening codes and Dutch
guilder categories; 2B contains respondent and partner income-source
checklists; F through I use progressively revised euro thresholds; J and
K introduce a new lowest category and shift the remaining category
numbers; and K adds response codes for an unreported partner amount and
an unknown combined amount. `wave` is therefore required, especially
because B, 2B, 3B, and MB all use variable names beginning with `"b"`.

The shared C/D/E table prints substantive `inccat` category labels only
for wave C. For D and E, this function therefore attaches the documented
routing label but does not infer unprinted category labels. Observed
unlabelled codes are retained as numeric-text factor levels when
`to_factor = TRUE`.

`LASA017_varinfo.pdf` also contains LASAB217, a separate specification-
income file with income-source amounts. Those variables are deliberately
excluded from this function and belong in `apply_lasa217_labels()`.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive name match, and (3) a
case-insensitive exact match. Variables documented for the selected wave
but absent from `data` are left untouched and recorded as `"not found"`
in the generic matching audit.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` are part of the parameter contract shared by every
`apply_*_labels()` function in this package. Regardless of conversion,
every matched column keeps its original SPSS value coding in
`attr(x, "original_labels")` and `attr(x, "original_values")`. The
`"respnr"` column is matched in any capitalization and, when
`standardize_names = TRUE`, renamed to `"respnr"`.

## See also

[`apply_lasa016_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa016_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  IRESPINC = c(-4, 1, 2),
  IINCCAT = c(-2, 1, 24),
  IINCC8S = c(-2, 1, 2)
)
dat <- apply_lasa017_labels(dat, wave = "I")
attr(dat$IINCCAT, "labels")
#>                   na, see IINCF     454-567 euro (1000-1250 fl) 
#>                              -2                               1 
#>     568-680 euro (1251-1500 fl)     681-794 euro (1501-1750 fl) 
#>                               2                               3 
#>     795-907 euro (1751-2000 fl)    908-1021 euro (2001-2250 fl) 
#>                               4                               5 
#>   1022-1134 euro (2251-2500 fl)   1135-1361 euro (2501-3000 fl) 
#>                               6                               7 
#>   1362-1588 euro (3001-3500 fl)   1589-1815 euro (3501-4000 fl) 
#>                               8                               9 
#>   1816-2042 euro (4001-4500 fl)   2043-2269 euro (4501-5000 fl) 
#>                              10                              11 
#>   2270-2495 euro (5001-5500 fl)   2496-2722 euro (5501-6000 fl) 
#>                              12                              13 
#>   2723-2949 euro (6001-6500 fl)   2950-3176 euro (6501-7000 fl) 
#>                              14                              15 
#>   3177-3403 euro (7001-7500 fl)   3404-3630 euro (7501-8000 fl) 
#>                              16                              17 
#>   3631-3857 euro (8001-8500 fl)   3858-4084 euro (8501-9000 fl) 
#>                              18                              19 
#>   4085-4311 euro (9001-9500 fl)  4312-4537 euro (9501-10000 fl) 
#>                              20                              21 
#> 4538-4991 euro (10001-11000 fl) 4992-5445 euro (11001-12000 fl) 
#>                              22                              23 
#> 5446 or more (12000 fl or more) 
#>                              24 

dat <- apply_lasa017_labels(
  dat,
  wave = "I",
  to_factor = TRUE,
  standardize_names = TRUE
)
lasa_label_report(dat, problems_only = TRUE)
#>    suffix expected_name matched_name    method standardized_to
#> 1 partinc      ipartinc         <NA> not found            <NA>
#> 2    incf         iincf         <NA> not found            <NA>
#> 3  incc6s       iincc6s         <NA> not found            <NA>
```
