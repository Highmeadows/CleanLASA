# Apply LASA273 (Loneliness Scales) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the three scaled loneliness variables
documented as LASA273 in the LASA073 codebook: total, emotional, and
social loneliness.

## Usage

``` r
apply_lasa273_labels(
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

  A data frame or tibble imported from a LASA273 `.sav` file.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, or `"J"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes `lo`,
  `loemo`, or `losoc` to actual column names in `data`.

- to_factor:

  Logical. If `TRUE`, scale variables are converted to factors using
  documented value labels, unless `to_numeric = TRUE` takes precedence.

- to_numeric:

  Logical. If `TRUE`, scale variables are converted to plain numeric and
  negative missing/routing values become `NA`.

- standardize_names:

  Logical. If `TRUE`, matched names and `respnr` are standardized, wave
  prefixes are removed, and `LASA_wave` is added.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and
  `LASA_wave` is added. Implied by `standardize_names = TRUE`.

## Value

`data` with LASA273 metadata, requested conversions and renaming, the
`LASA_wave` provenance attribute, and a `label_report` matching audit.

## Details

LASA273 is documented for waves B, C, D, E, 2B, F, G, H, 3B, MB, I, and
J. Every wave contains three scale variables, but missing-value and
routing codes differ across B–E, 2B, F, G, and H onward. The total score
ranges from no loneliness (0) to severe loneliness (11); emotional and
social subscales have documented endpoints 0–6 and 0–5, respectively.

All three variables are numeric scale scores. With `to_numeric = TRUE`,
they become plain numeric and documented negative missing/routing values
become `NA`. With `to_factor = TRUE` alone, the documented endpoint and
missing labels can be used as factor levels. Original SPSS values and
labels remain available in `original_values` and `original_labels`.

Column matching uses an explicit `name_corrections` override, an exact
case-sensitive match, and then a case-insensitive exact match.
Standardized naming removes the wave prefix, standardizes `respnr`, and
inserts a `LASA_wave` column.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
[`apply_lasa073_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa073_labels.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:3, hlo = c(-1, 0, 7), hloemo = c(0, 3, 6))
dat <- apply_lasa273_labels(dat, wave = "H", to_numeric = TRUE)
attr(dat$hlo, "label")
#> [1] "loneliness <scale de Jong Gierveld>"
```
