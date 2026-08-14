# Apply LASA133 (SF-12 and WHO quality of life) SPSS labels

Attaches SPSS-style variable and value labels to the SF-12 and WHO
quality-of-life items documented in LASA133 for waves D, E, F, G, H, 3B,
I, J, and K.

## Usage

``` r
apply_lasa133_labels(
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

  A data frame or tibble imported from a LASA133 `.sav` file. Names
  include wave-prefixed `quli01`–`quli12`, plus `quli13` and `quli14` in
  waves I–K.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"D"`, `"E"`, `"F"`, `"G"`, `"H"`, `"3B"`,
  `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector mapping suffixes without the wave
  prefix (for example `quli01` or `quli14`) to actual names in `data`.

- to_factor:

  Logical. If `TRUE`, matched variables are converted to factors using
  the documented labels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA133 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. If `TRUE`, matched names and `respnr` are standardized and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names lose the wave prefix and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA133 labels, requested conversion or renaming, preserved
original coding, `LASA_wave` provenance, and a `label_report`.

## Details

Every documented wave contains the 12 SF-12 items for general health,
physical functioning, role limitations, pain, mental health, vitality,
and social functioning. Waves I, J, and K additionally contain two
WHOQOL items rating quality of life and whether life feels meaningful.
Derived scores in the separate LASA333 and LASA533 files are
intentionally outside this function's scope.

All LASA133 variables are categorical. `to_numeric` is accepted for
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
dat <- data.frame(dquli01 = c(1, 5), dquli08 = c(1, 4))
dat <- apply_lasa133_labels(dat, wave = "D", to_factor = TRUE)
attr(dat$dquli01, "labels")
#> NULL
```
