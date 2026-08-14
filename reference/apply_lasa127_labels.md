# Apply LASA127 (End-of-life decisions) SPSS labels

Attaches SPSS-style variable and value labels to the five end-of-life
decision variables documented in LASA127 for waves I, J, and K.

## Usage

``` r
apply_lasa127_labels(
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

  A data frame or tibble imported from a LASA127 `.sav` file. Expected
  names run from `iqeol07`–`iqeol11`, with corresponding `j` or `k`
  prefixes in later waves.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector mapping suffixes without the wave
  prefix (for example `qeol07` or `qeol11`) to actual names in `data`.

- to_factor:

  Logical. If `TRUE`, matched variables are converted to factors using
  the documented labels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA127 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. If `TRUE`, matched names and `respnr` are standardized and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names lose the wave prefix and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA127 labels, requested conversion or renaming, preserved
original coding, `LASA_wave` provenance, and a `label_report`.

## Details

The items cover lifetime thoughts about death, lifetime wishes for
death, wishes to live and to die during the past week, and the balance
between reasons for living and dying. The PDF notes that these are a
subset of medical-interview items asked in wave F under the separate
LASA195 file; those LASA195 variables are not combined here.

All five LASA127 variables are categorical. `to_numeric` is accepted for
interface consistency but does not convert them. `to_factor = TRUE`
converts matched items using their documented value labels.

Matching tries `name_corrections`, an exact case-sensitive match, and
then a case-insensitive exact match. Original SPSS coding is preserved;
standardized naming removes the wave prefix and can add `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(iqeol07 = c(1, 2), iqeol09 = c(1, 3))
dat <- apply_lasa127_labels(dat, wave = "I", to_factor = TRUE)
attr(dat$iqeol07, "labels")
#> NULL
```
