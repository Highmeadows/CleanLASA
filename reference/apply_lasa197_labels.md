# Apply LASA197 (Awareness of Age-Related Change) SPSS labels

Attaches SPSS-style variable and value labels to the ten AARC-SF items
documented for LASA197 in wave K. The items cover age-related gains and
losses in relationships, cognition, health awareness, activities,
knowledge, energy, priorities, dependence, freedom, and motivation. All
use the documented five-level response scale plus the `-1` not-asked
code.

## Usage

``` r
apply_lasa197_labels(
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

  A data frame or tibble imported from a LASA197 `.sav` file.

- wave:

  Character scalar identifying wave `"K"`, case-insensitively.

- name_corrections:

  Optional named character vector mapping canonical suffixes such as
  `maarc1` to actual columns in `data`.

- to_factor:

  Logical. Convert labelled categorical items to factors.

- to_numeric:

  Logical. Accepted for the shared interface; LASA197 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. Standardize names and `respnr`, remove wave prefixes, and add
  `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes and add `LASA_wave`; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASA197 metadata, optional conversion and renaming, the
`LASA_wave` attribute, and a `label_report` audit.

## Details

Matching tries `name_corrections`, an exact match, and a
case-insensitive exact match. `to_factor = TRUE` converts matched items
to factors while keeping observed undocumented codes. LASA197 has no
variables eligible for `to_numeric`. Original SPSS values and labels are
preserved. Standardized naming removes the wave prefix, standardizes
`respnr`, and adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, KMAARC1 = c(-1, 1), kmaarc10 = c(2, 5))
apply_lasa197_labels(dat, wave = "K")
#>   RespNr KMAARC1 kmaarc10
#> 1      1      -1        2
#> 2      2       1        5
```
