# Apply LASA175 (attitudes towards nursing home care) SPSS labels

Attaches SPSS-style variable and value labels to the nine attitude items
documented in LASA175 for waves J and K. Items cover perceived quality,
privacy, time outside, social contact, autonomy, visitors, and
respectful treatment in nursing homes. All share a five-point agreement
scale plus the documented asked-missing code.

## Usage

``` r
apply_lasa175_labels(
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

  A data frame or tibble imported from a LASA175 `.sav` file. Documented
  names are `jmnh01` through `jmnh09` in wave J and the corresponding
  `kmnh` names in wave K.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"J"` or `"K"`.

- name_corrections:

  Optional named character vector mapping canonical LASA175 suffixes
  without the wave prefix (for example, `mnh01`) to actual column names
  in `data`.

- to_factor:

  Logical. If `TRUE`, variables with documented value labels are
  converted to factors.

- to_numeric:

  Logical. Accepted for the shared interface. LASA175 has no documented
  continuous numeric variables.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA175 labels, optional factor conversion and standardized
naming, preserved original SPSS coding, the `LASA_wave` provenance
attribute, and a `label_report` matching audit.

## Details

All LASA175 variables are categorical and none is converted by
`to_numeric = TRUE`. With `to_factor = TRUE`, documented codes become
factor levels while observed unlabelled codes are retained. Matching
tries `name_corrections`, an exact match, then a case-insensitive exact
match. Original labels and values are preserved. Optional standardized
naming removes the wave prefix, standardizes `respnr`, and adds
`LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, jmnh01 = c(1, 5), jmnh02 = c(2, 4))
apply_lasa175_labels(dat, wave = "J", to_factor = TRUE)
#>   RespNr              jmnh01   jmnh02
#> 1      1 completely disagree disagree
#> 2      2    completely agree    agree
```
