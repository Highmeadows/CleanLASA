# Apply LASA131 (Social identity) SPSS labels

Attaches SPSS-style variable and value labels to the ten social-identity
items documented in LASA131 for waves D and E.

## Usage

``` r
apply_lasa131_labels(
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

  A data frame or tibble imported from a LASA131 `.sav` file. Expected
  names are `dqsoid01`–`dqsoid10` or `eqsoid01`–`eqsoid10`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"D"` or `"E"`.

- name_corrections:

  Optional named character vector mapping suffixes without the wave
  prefix (for example `qsoid01`) to actual names in `data`.

- to_factor:

  Logical. If `TRUE`, matched variables are converted to factors using
  the documented labels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA131 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. If `TRUE`, matched names and `respnr` are standardized and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names lose the wave prefix and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA131 labels, requested conversion or renaming, preserved
original coding, `LASA_wave` provenance, and a `label_report`.

## Details

The items assess involvement, emotional connection, pride, pleasure,
identification, loyalty, honour, joining, being average, and sense of
self. All use the same strongly-disagree–strongly-agree response scale.
The solidarity score in the separate LASA331 file is outside this
function's scope.

All LASA131 variables are categorical. `to_numeric` is accepted for
interface consistency but does not convert them. `to_factor = TRUE`
converts matched variables using the documented labels.

Matching tries `name_corrections`, an exact case-sensitive match, and
then a case-insensitive exact match. Original SPSS coding is preserved;
standardized naming removes the wave prefix and can add `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(dqsoid01 = c(1, 5), dqsoid03 = c(2, 4))
dat <- apply_lasa131_labels(dat, wave = "D", to_factor = TRUE)
attr(dat$dqsoid01, "labels")
#> NULL
```
