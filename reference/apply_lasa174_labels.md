# Apply LASA174 (food supplements) SPSS labels

Attaches SPSS-style variable labels and value labels to the
food-supplement variables documented in LASA174 for waves I and J. Wave
I records a general supplement list. Wave J separates vitamin D and
multivitamin supplements. Both computer-assisted files allow a
sample-dependent number of repeated supplement records; this function
labels every documented repeat index present in `data` (and every repeat
named in `name_corrections`).

## Usage

``` r
apply_lasa174_labels(
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

  A data frame or tibble imported from a LASA174 `.sav` file. Wave-I
  names begin with `im`; wave-J names begin with `jmD` or `jmMV`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"I"` or `"J"`.

- name_corrections:

  Optional named character vector mapping canonical LASA174 suffixes
  without the initial wave prefix (for example, `msupquant1` or
  `mDsupquant1`) to actual column names in `data`.

- to_factor:

  Logical. If `TRUE`, variables with documented value labels are
  converted to factors unless converted to numeric.

- to_numeric:

  Logical. If `TRUE`, documented counts, quantities, and
  times-per-period variables are restored to plain numeric and negative
  values are replaced by `NA`.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA174 labels, optional conversion and standardized
naming, preserved original SPSS coding, the `LASA_wave` provenance
attribute, and a `label_report` matching audit.

## Details

Supplement counts, quantities, and use frequencies are eligible for
`to_numeric = TRUE`; negative missing codes then become `NA`. Use,
measurement-unit, period, dosage-form, and seasonal-use variables remain
categorical. Text fields receive variable labels without invented value
labels. With `to_factor = TRUE`, documented categorical codes become
factor levels while observed unlabelled codes are retained.

The source PDF also contains LASA374, which adds derived vitamin D
content. Those variables belong to a separate filecode and are
intentionally not labelled here. Matching tries `name_corrections`, an
exact match, then a case-insensitive exact match. Original labels and
values are preserved; optional standardized naming removes the wave
prefix and adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, imsup = c(1, 2), `im#sup` = c(0, 1))
apply_lasa174_labels(dat, wave = "I", to_factor = TRUE)
#>   RespNr imsup im.sup
#> 1      1    no      0
#> 2      2   yes      1
```
