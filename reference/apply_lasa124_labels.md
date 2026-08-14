# Apply LASA124 (Metamemory) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the metamemory items documented in
LASA124 for waves B, C, and D.

## Usage

``` r
apply_lasa124_labels(
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

  A data frame or tibble imported from a LASA124 `.sav` file. Expected
  names include `bqmemo01`, `cqmemo31`, and `dqmemo41`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, or `"D"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (for example `qmemo01` or `qmemo39`) to actual column
  names in `data`.

- to_factor:

  Logical. If `TRUE`, matched variables are converted to factors using
  the documented value labels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA124 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. If `TRUE`, matched names are standardized, `respnr` is
  standardized, and `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA124 labels, requested conversion or renaming, preserved
original coding, a `LASA_wave` provenance attribute, and a
`label_report` matching audit.

## Details

Wave B contains 30 items. Waves C and D contain the same 30 items plus
11 additional items, for 41 variables in total. Items 1–10 measure
memory strategies on a never–always scale; items 11 onward use a
strongly-disagree–strongly-agree scale. Scale scores stored in the
separate LASA324 files are intentionally outside this function's scope.

All LASA124 variables are categorical. Consequently, `to_numeric` is
accepted for interface consistency but does not convert them. With
`to_factor = TRUE`, matched variables become factors and observed
unlabelled codes remain numeric-text levels.

Column matching tries an explicit `name_corrections` override, an exact
case-sensitive match, and then a case-insensitive exact match. Every
documented variable is recorded in the final `label_report`, including
variables absent from `data`.

Original SPSS codes and labels are preserved in `original_values` and
`original_labels`. Standardized naming removes the wave prefix,
standardizes `respnr`, and inserts a `LASA_wave` column.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(bqmemo01 = c(1, 5), bqmemo11 = c(2, 4))
dat <- apply_lasa124_labels(dat, wave = "B", to_factor = TRUE)
attr(dat$bqmemo01, "labels")
#> NULL
```
