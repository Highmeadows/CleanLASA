# Apply LASA126 (Oral health) SPSS labels

Attaches SPSS-style variable and value labels to the oral-health
variables documented in LASA126 for waves I, J, and K.

## Usage

``` r
apply_lasa126_labels(
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

  A data frame or tibble imported from a LASA126 `.sav` file. Names may
  include `iqorh3c`, `iqorh8a`, `jqorh3d`, or `kqorh8i`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (for example `qorh3c` or `qorh8i`) to actual names in
  `data`.

- to_factor:

  Logical. If `TRUE`, matched categorical variables are converted to
  factors using the documented labels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA126 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. If `TRUE`, matched names and `respnr` are standardized and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names lose the wave prefix and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA126 labels, requested conversion or renaming, preserved
original coding, `LASA_wave` provenance, and a `label_report`.

## Details

Wave I contains 22 items covering self-rated oral health, own teeth,
dentures, oral hygiene, dental care, gingivitis, and nine recent
oral-health problems. Waves J and K use a shorter eight-item schema and
introduce frequency scales for poorly fitting dentures, toothache while
chewing, and dry mouth.

The documented variables are categorical, including the grouped
own-teeth categories. `to_numeric` is therefore accepted for interface
consistency but does not convert them. `to_factor = TRUE` converts
matched variables to factors while retaining observed unlabelled codes
as numeric-text levels.

Matching tries `name_corrections`, an exact case-sensitive match, and
then a case-insensitive exact match. Original SPSS coding is preserved;
standardized naming removes the wave prefix and can add `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(iqorh1 = c(1, 5), iqorh8a = c(1, 2))
dat <- apply_lasa126_labels(dat, wave = "I", to_factor = TRUE)
attr(dat$iqorh1, "labels")
#> NULL
```
