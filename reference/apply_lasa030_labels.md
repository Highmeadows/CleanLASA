# Apply LASA030 (Functional Limitations and ADL) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to a LASA030 functional-limitations data
frame, using the coding and questionnaire layout documented for the
requested wave.

## Usage

``` r
apply_lasa030_labels(
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

  A data frame or tibble imported from a LASA030 `.sav` file, containing
  wave-prefixed variables such as `badl1a`, `cadl1a`, or `kadl7d`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit name overrides. Names are
  canonical LASA030 suffixes without the wave prefix, and values are the
  actual column names in `data`, for example `c(adl4a = "B_ADL4A")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables stay numeric with
  SPSS-style value-label attributes. If `TRUE`, value labels are used as
  factor levels, while observed values without a codebook label are
  retained under their numeric code.

- to_numeric:

  Logical. If `FALSE` (default), variables retain their value-label
  attributes. If `TRUE`, variables whose codebook labels contain only
  negative missing-reason codes are restored to plain numeric, with
  negative values converted to `NA`. LASA030 contains categorical
  variables, so this option normally makes no changes, but it is
  retained as part of the package-wide `apply_*_labels()` argument
  contract.

- standardize_names:

  Logical. If `FALSE` (default), source column names are preserved
  (except for any renaming triggered by `split_wavecode`, see below). If
  `TRUE`, matched columns are renamed to their canonical lowercase
  LASA030 names with the wave code removed, such as `adl1a` or `adl7d`,
  `"respnr"` (in any capitalization) is renamed to `"respnr"`, and
  `split_wavecode` is always treated as `TRUE` as well, regardless of
  what was passed for `split_wavecode`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, matched columns are renamed
  with the wave-letter prefix removed (e.g. `badl1a` becomes `adl1a`),
  and a new `"LASA_wave"` column, filled with `wave`, is inserted right
  after `"respnr"`. Always treated as `TRUE` when
  `standardize_names = TRUE`.

## Value

`data`, with variable- and value-label attributes attached to every
matched LASA030 column, optionally converted to factors and/or renamed,
plus reference `original_labels`/`original_values` attributes preserving
the original SPSS value coding regardless of that reshaping. A new
`"LASA_wave"` column is added after `"respnr"` when
`standardize_names = TRUE` or `split_wavecode = TRUE`. A matching audit
is attached as the generic `"label_report"` attribute and can be
retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA030 changed across waves. Wave B used four response categories for
the activity questions and included three activities. Later waves used
five response categories, while the available activities and follow-up
items also varied. `wave` must therefore be supplied explicitly,
especially because B, 2B, 3B, and MB all use variable names beginning
with `"b"`.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive match, and (3) a
case-insensitive match. Variables documented for a wave but absent from
`data` are left untouched and recorded as `"not found"` in the matching
audit.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` are part of a parameter contract shared by every
`apply_*_labels()` function in this package (see the header comment in
`lasa_io.R` and
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md)
for the canonical implementation). Regardless of
`to_factor`/`to_numeric`, every matched column also keeps its original
SPSS value coding available as reference attributes –
`attr(x, "original_labels")` and `attr(x, "original_values")` – and the
`"respnr"` column (in any capitalization) is matched and, when
`standardize_names = TRUE`, renamed to `"respnr"`.

## See also

[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat_b <- data.frame(BADL1A = c(1, 4), BADL1B = c(1, 2))
dat_b <- apply_lasa030_labels(dat_b, wave = "B")
attr(dat_b$BADL1A, "label")
#> [1] "Stairs: 15 steps without stopping"
attr(dat_b$BADL1A, "labels")
#> na, interview terminated                na, asked             no, I cannot 
#>                       -5                       -1                        1 
#>           only with help     yes, with difficulty        yes, without help 
#>                        2                        3                        4 

dat_k <- data.frame(KADL1A = c(1, 5), KADL7D = c(1, 4))
dat_k <- apply_lasa030_labels(
  dat_k,
  wave = "K",
  to_factor = TRUE,
  standardize_names = TRUE
)
lasa_label_report(dat_k, problems_only = TRUE)
#>    suffix expected_name matched_name    method standardized_to
#> 1   adl1b        kadl1b         <NA> not found            <NA>
#> 2   adl1c        kadl1c         <NA> not found            <NA>
#> 3   adl1d        kadl1d         <NA> not found            <NA>
#> 4   adl2a        kadl2a         <NA> not found            <NA>
#> 5   adl2b        kadl2b         <NA> not found            <NA>
#> 6   adl2c        kadl2c         <NA> not found            <NA>
#> 7   adl2d        kadl2d         <NA> not found            <NA>
#> 8   adl3a        kadl3a         <NA> not found            <NA>
#> 9   adl3b        kadl3b         <NA> not found            <NA>
#> 10  adl3c        kadl3c         <NA> not found            <NA>
#> 11  adl3d        kadl3d         <NA> not found            <NA>
#> 12  adl4a        kadl4a         <NA> not found            <NA>
#> 13  adl4b        kadl4b         <NA> not found            <NA>
#> 14  adl4c        kadl4c         <NA> not found            <NA>
#> 15  adl4d        kadl4d         <NA> not found            <NA>
#> 16  adl5a        kadl5a         <NA> not found            <NA>
#> 17  adl5b        kadl5b         <NA> not found            <NA>
#> 18  adl5c        kadl5c         <NA> not found            <NA>
#> 19  adl5d        kadl5d         <NA> not found            <NA>
#> 20  adl6a        kadl6a         <NA> not found            <NA>
#> 21  adl6b        kadl6b         <NA> not found            <NA>
#> 22  adl6c        kadl6c         <NA> not found            <NA>
#> 23  adl6d        kadl6d         <NA> not found            <NA>
#> 24  adl7a        kadl7a         <NA> not found            <NA>
#> 25  adl7b        kadl7b         <NA> not found            <NA>
#> 26  adl7c        kadl7c         <NA> not found            <NA>
#> 27 respnr        respnr         <NA> not found            <NA>
```
