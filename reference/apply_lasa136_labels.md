# Apply LASA136 (Worrying) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the 16 Penn State Worry Questionnaire
items documented in LASAE136.

## Usage

``` r
apply_lasa136_labels(
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

  A data frame or tibble imported from a LASAE136 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
  containing any of `eqworr01` through `eqworr16`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. LASA136 is documented only for `"E"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (`qworr01` through `qworr16`) to actual column names in
  `data`.

- to_factor:

  Logical. If `TRUE`, the categorical worry items are converted to
  factors using the documented response labels.

- to_numeric:

  Logical. Retained for the shared parameter contract. LASA136 contains
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

`data`, with LASA136 variable/value labels, optional factor conversion
and standardized naming, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

All items use the same five-level response scale from "not at all
characteristic" to "very characteristic", plus -1 for no answer. The
worry-scale score shown in the source PDF belongs to the separate
LASA336 scale-score file and is intentionally outside this function.

LASA136 is documented only for wave E. Its 16 variables are categorical;
consequently `to_factor = TRUE` converts them to factors, whereas
`to_numeric` is retained for the common parameter contract but does not
change them. Observed unlabelled codes remain numeric-text factor
levels.

Column matching tries an explicit `name_corrections` override, an exact
case-sensitive match, then a case-insensitive exact match. Absent
variables are reported as `"not found"`. Original labels and values are
preserved, and optional standardized naming removes the `e` prefix,
standardizes `respnr`, and adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, eqworr01 = c(1, 5), eqworr16 = c(-1, 3))
dat <- apply_lasa136_labels(dat, wave = "E", to_factor = TRUE)
attr(dat$eqworr01, "label")
#> [1] "Worry 01: not enough time"
```
