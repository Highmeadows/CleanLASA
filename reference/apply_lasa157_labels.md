# Apply LASA157 (Contrast sensitivity test) SPSS labels

Attaches the variable and value labels documented for LASA157 contrast
sensitivity data. Waves B, C, and D contain functional test variables;
waves E, 2B, and F contain only the six self-reported daily-sight items.
The inventories and missing-value codes differ materially by wave.

## Usage

``` r
apply_lasa157_labels(
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

  A data frame or tibble imported from a LASA157 `.sav` file.

- wave:

  Character scalar: `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, or `"F"`;
  matching is case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix to actual column names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors.

- to_numeric:

  Logical. Convert eligible test measurements and scores to plain
  numeric and replace documented negative missing codes with `NA`.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove the wave
  prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes from matched names and add `LASA_wave`;
  implied by `standardize_names = TRUE`.

## Value

`data` with LASA157 metadata, optional conversions and renaming, a
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

Matching uses an explicit `name_corrections` entry, an exact match, then
a case-insensitive exact match. `to_factor = TRUE` converts categorical
variables to factors while retaining observed undocumented codes.
`to_numeric = TRUE` restores contrast measurements and scores whose
codebook labels contain only negative missing-value codes to plain
numeric, replacing those negative codes with `NA`. Original values and
labels remain available in `original_values` and `original_labels`
attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, bmdasig1 = c(-1, 2), bmcontra = c(-1, 12))
apply_lasa157_labels(dat, wave = "B")
#>   RespNr bmdasig1 bmcontra
#> 1      1       -1       -1
#> 2      2        2       12
```
