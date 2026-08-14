# Apply LASA132 (Filial obligations expectation) SPSS labels

Attaches SPSS-style variable and value labels to the 16
filial-obligation expectation items documented in LASA132 for waves D,
E, and J.

## Usage

``` r
apply_lasa132_labels(
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

  A data frame or tibble imported from a LASA132 `.sav` file. Expected
  names are wave-prefixed forms of `qfioe01`–`qfioe16`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"D"`, `"E"`, or `"J"`.

- name_corrections:

  Optional named character vector mapping suffixes without the wave
  prefix (for example `qfioe01`) to actual names in `data`.

- to_factor:

  Logical. If `TRUE`, matched variables are converted to factors using
  the documented labels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA132 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. If `TRUE`, matched names and `respnr` are standardized and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names lose the wave prefix and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA132 labels, requested conversion or renaming, preserved
original coding, `LASA_wave` provenance, and a `label_report`.

## Details

The items address expectations that children live nearby, help during
illness or financially, maintain contact, accept responsibility, spend
time together, provide personal support and advice, check in, help, and
care. All use the same strongly-disagree–strongly-agree scale. The
aggregate score in the separate LASA332 file is outside this function's
scope.

All LASA132 variables are categorical. `to_numeric` is accepted for
interface consistency but does not convert them. `to_factor = TRUE`
converts matched variables using the documented value labels.

Matching tries `name_corrections`, an exact case-sensitive match, and
then a case-insensitive exact match. Original SPSS coding is preserved;
standardized naming removes the wave prefix and can add `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(dqfioe01 = c(1, 5), dqfioe16 = c(2, 4))
dat <- apply_lasa132_labels(dat, wave = "D", to_factor = TRUE)
attr(dat$dqfioe01, "labels")
#> NULL
```
