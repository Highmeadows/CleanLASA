# Apply LASA138 (Religiousness) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the six religiousness items documented
in LASAE138: life after death, heaven, hell, the devil, Adam and Eve,
and the Bible as the word of God.

## Usage

``` r
apply_lasa138_labels(
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

  A data frame or tibble imported from a LASAE138 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
  containing any of `eqreli02` through `eqreli07`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. LASA138 is documented only for `"E"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (`qreli02` through `qreli07`) to actual column names in
  `data`.

- to_factor:

  Logical. If `TRUE`, the categorical religiousness items are converted
  to factors using the documented response labels.

- to_numeric:

  Logical. Retained for the shared parameter contract. LASA138 contains
  no numeric count or continuous variables, so it does not change the
  documented items.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column containing `"E"` is inserted immediately after the
  respondent-number column.

## Value

`data`, with LASA138 variable/value labels, optional factor conversion
and standardized naming, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

Every item uses no answer (-1), yes (1), and no (2). The orthodoxy scale
score shown in the source PDF belongs to the separate LASA338
scale-score file and is intentionally not labelled here.

LASA138 is documented only for wave E and all six variables are
categorical. `to_factor = TRUE` converts them to factors; `to_numeric`
is retained for the shared parameter contract but does not change them.
Column matching tries an explicit `name_corrections` override, an exact
match, then a case-insensitive exact match. Standardized naming
optionally removes the wave prefix, standardizes `respnr`, and adds
`LASA_wave` while preserving original SPSS labels and values.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, eqreli02 = c(1, 2), eqreli07 = c(-1, 1))
dat <- apply_lasa138_labels(dat, wave = "E", to_factor = TRUE)
attr(dat$eqreli02, "labels")
#> NULL
```
