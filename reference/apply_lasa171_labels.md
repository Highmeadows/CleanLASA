# Apply LASA171 (calf measurement) SPSS labels

Attaches SPSS-style variable and value labels to the calf-circumference
variables documented in LASA171 for waves B, D, E, 2B, F, G, H, and 3B.
The inventory and coding changed materially across waves: wave B used a
single measurement plus detailed remarks; D/E and G used duplicate
measurements and separate particularity indicators; 2B used one
measurement; F used a single combined particularities variable; and H/3B
used one measurement with reason-missing status. From wave I onward calf
measurement is documented in LASA161 instead.

## Usage

``` r
apply_lasa171_labels(
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

  A data frame or tibble imported from a LASA171 `.sav` file. Names use
  the wave-specific `b`, `d`, `e`, `f`, `g`, or `h` prefix; wave 2B and
  3B both use `b`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"D"`, `"E"`, `"2B"`, `"F"`, `"G"`,
  `"H"`, or `"3B"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (for example, `mcalf01`) to actual column names in `data`.

- to_factor:

  Logical. If `TRUE`, variables with documented value labels are
  converted to factors unless they are converted to numeric.

- to_numeric:

  Logical. If `TRUE`, documented calf measurements are restored to plain
  numeric and negative values are replaced by `NA`.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA171 labels, optional conversion and standardized
naming, preserved original SPSS coding, the `LASA_wave` provenance
attribute, and a `label_report` matching audit.

## Details

Calf measurements are eligible for `to_numeric = TRUE`; documented
negative missing codes then become `NA`. Status and particularity
variables remain categorical. With `to_factor = TRUE`, their documented
codes become factor levels while observed unlabelled codes are retained.

Matching tries `name_corrections`, an exact match, then a
case-insensitive exact match. Original labels and values are preserved.
Optional standardized naming removes the wave prefix, standardizes
`respnr`, and adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, hmcalf01 = c(-1, 35), hmcalf02 = c(0, 1))
apply_lasa171_labels(dat, wave = "H", to_numeric = TRUE)
#>   RespNr hmcalf01 hmcalf02
#> 1      1       NA        0
#> 2      2       35        1
```
