# Apply LASA137 (Valuation of late life) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the valuation-of-late-life items
documented in LASA137 for waves E and F.

## Usage

``` r
apply_lasa137_labels(
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

  A data frame or tibble imported from a LASA137 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Wave-E names include `eqvall01` through `eqvall19`; wave-F names use
  the `f` prefix for its 12-item subset.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"E"` or `"F"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (`qvall01` through `qvall19`) to actual column names in
  `data`.

- to_factor:

  Logical. If `TRUE`, the categorical valuation items are converted to
  factors using the documented response labels.

- to_numeric:

  Logical. Retained for the shared parameter contract. LASA137 contains
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

`data`, with LASA137 variable/value labels, optional factor conversion
and standardized naming, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

Wave E contains the full 19-item questionnaire. Wave F contains the 12
documented items 01, 04, 06, 07, 10, 11, 13, 14, 15, 16, 18, and 19. All
use the same agreement scale from strongly agree (1) to strongly
disagree (5), plus -1 for no answer. The total and subscale scores shown
in the source PDF belong to the separate LASA337 scale-score file and
are not handled here.

All LASA137 variables are categorical: `to_factor = TRUE` converts them
to factors, while `to_numeric` is retained for the shared parameter
contract but does not change them. Column matching tries an explicit
`name_corrections` override, an exact match, then a case-insensitive
exact match. Original SPSS coding is preserved. Standardized naming
optionally removes the wave prefix, standardizes `respnr`, and adds
`LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, eqvall01 = c(1, 5), eqvall19 = c(-1, 3))
dat <- apply_lasa137_labels(dat, wave = "E", to_factor = TRUE)
attr(dat$eqvall01, "labels")
#> NULL
```
