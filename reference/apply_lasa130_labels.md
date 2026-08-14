# Apply LASA130 (Social desirability) SPSS labels

Attaches SPSS-style variable and value labels to the five social-
desirability items documented in LASA130 for waves C and F.

## Usage

``` r
apply_lasa130_labels(
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

  A data frame or tibble imported from a LASA130 `.sav` file. Expected
  names are `cqsocd1`–`cqsocd5` or `fqsocd1`–`fqsocd5`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"C"` or `"F"`.

- name_corrections:

  Optional named character vector mapping suffixes without the wave
  prefix (for example `qsocd1`) to actual names in `data`.

- to_factor:

  Logical. If `TRUE`, matched variables are converted to factors using
  the documented labels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA130 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. If `TRUE`, matched names and `respnr` are standardized and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names lose the wave prefix and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA130 labels, requested conversion or renaming, preserved
original coding, `LASA_wave` provenance, and a `label_report`.

## Details

The items address courteous behaviour, profiting from others, getting
even, annoyance, and listening well. All use the same certainly-true
through certainly-not-true response scale. The derived score stored in
the separate LASA330 file is intentionally outside this function's
scope.

All LASA130 variables are categorical. `to_numeric` is accepted for
interface consistency but does not convert them. With
`to_factor = TRUE`, matched variables become factors using the
documented value labels.

Matching tries `name_corrections`, an exact case-sensitive match, and
then a case-insensitive exact match. Original SPSS coding is preserved;
standardized naming removes the wave prefix and can add `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(cqsocd1 = c(1, 5), cqsocd2 = c(2, 4))
dat <- apply_lasa130_labels(dat, wave = "C", to_factor = TRUE)
attr(dat$cqsocd1, "labels")
#> NULL
```
