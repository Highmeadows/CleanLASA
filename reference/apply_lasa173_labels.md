# Apply LASA173 (existential loneliness) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the 16 existential-loneliness items
documented in LASA173 for wave J. Each label contains the English item
followed by its Dutch wording. All items share the documented five-point
response scale from emphatic no to emphatic yes, plus missing/status
codes.

## Usage

``` r
apply_lasa173_labels(
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

  A data frame or tibble imported from a LASAJ173 `.sav` file.
  Documented names are `jmexlo1`, `jmexlo3`, `jmexlo6`, and the
  remaining listed `jmexlo` items through `jmexlo31`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. Must be `"J"`.

- name_corrections:

  Optional named character vector mapping canonical LASA173 suffixes
  without the wave prefix (for example, `mexlo1`) to actual column names
  in `data`.

- to_factor:

  Logical. If `TRUE`, variables with documented value labels are
  converted to factors. Observed unlabelled codes remain numeric-text
  levels.

- to_numeric:

  Logical. Accepted for the shared interface. LASA173 has no documented
  continuous numeric variables.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA173 labels, optional factor conversion and standardized
naming, preserved original SPSS coding, the `LASA_wave` provenance
attribute, and a `label_report` matching audit.

## Details

All LASA173 variables are categorical and therefore none is converted by
`to_numeric = TRUE`. With `to_factor = TRUE`, documented codes become
factor levels while observed unlabelled codes are retained. Matching
tries `name_corrections`, an exact match, then a case-insensitive exact
match. Original labels and values are preserved. Optional standardized
naming removes the `j` prefix, standardizes `respnr`, and adds
`LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, jmexlo1 = c(1, 5), jmexlo8 = c(2, 4))
apply_lasa173_labels(dat, wave = "J", to_factor = TRUE)
#>   RespNr jmexlo1 jmexlo8
#> 1      1     no!      no
#> 2      2    yes!     yes
```
