# Apply LASA141 (Need for affiliation) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the six need-for-affiliation
questionnaire items documented in LASA141 for waves 2B and G.

## Usage

``` r
apply_lasa141_labels(
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

  A data frame or tibble imported from a LAS2B141 or LASAG141 `.sav`
  file, for example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Names are `bqan1`, `bqan4`, `bqan6`, `bqan8`, `bqan9`, and `bqan10` in
  2B, with the corresponding `g` prefix in wave G.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"2B"` or `"G"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (`qan1`, `qan4`, `qan6`, `qan8`, `qan9`, or `qan10`) to
  actual column names in `data`.

- to_factor:

  Logical. If `TRUE`, the categorical affiliation items are converted to
  factors using the documented response labels.

- to_numeric:

  Logical. Retained for the shared parameter contract. LASA141 contains
  no numeric count or continuous variables, so it does not change the
  documented items.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column containing the selected wave is inserted
  immediately after the respondent-number column.

## Value

`data`, with LASA141 variable/value labels, optional factor conversion
and standardized naming, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

The inventory consists of items 1, 4, 6, 8, 9, and 10. Each uses no
answer (-1), no (1), more-or-less (2), and yes (3). The constructed
six-item score shown in the same source PDF belongs to the separate
LASA341 file and is intentionally not labelled here. The PDF also
cross-references LASA078, which remains a separate filecode.

All LASA141 items are categorical. `to_factor = TRUE` converts them to
factors and preserves observed unlabelled codes as numeric-text levels;
`to_numeric` is retained for the shared parameter contract but does not
change them. Column matching tries an explicit `name_corrections`
override, an exact match, then a case-insensitive exact match.
Standardized naming optionally removes the `b` or `g` prefix,
standardizes `respnr`, and adds `LASA_wave`, while preserving original
SPSS labels and values.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, bqan1 = c(1, 3), bqan10 = c(-1, 2))
dat <- apply_lasa141_labels(dat, wave = "2B", to_factor = TRUE)
attr(dat$bqan1, "labels")
#> NULL
```
