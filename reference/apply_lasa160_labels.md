# Apply LASA160 (Weight change) SPSS labels

Applies the wave-specific LASA160 labels for recent weight change,
amount gained or lost, stated and coded reasons, lifetime weight
history, body- weight appraisal, weight-loss methods, appetite, stress
or illness, and migrant-cohort unintentional-weight-loss screening.
Supported files are B, C, D, E, 2B, F, G, H, 3B, MB, I, and J.

## Usage

``` r
apply_lasa160_labels(
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

  A data frame or tibble imported from a LASA160 `.sav` file.

- wave:

  Character scalar identifying wave `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`,
  `"F"`, `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, or `"J"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix to actual column names.

- to_factor:

  Logical. Convert labelled categorical variables to factors.

- to_numeric:

  Logical. Restore eligible weight, age, and height variables to numeric
  and replace negative missing codes with `NA`.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove the wave
  prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes and add `LASA_wave`; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASA160 metadata, optional reshaping, a `LASA_wave`
attribute, and a `label_report` matching audit.

## Details

Matching tries `name_corrections`, exact names, then case-insensitive
exact names. `to_factor` converts categorical variables to factors while
keeping observed undocumented codes. `to_numeric` restores documented
weights, amounts, ages, and heights to plain numeric and converts their
negative missing codes to `NA`. Original values and labels remain as
attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(bmweightch = c(-1, 1, 3), bmweightchkg = c(-1, 2, 5))
apply_lasa160_labels(dat, wave = "B")
#>   bmweightch bmweightchkg
#> 1         -1           -1
#> 2          1            2
#> 3          3            5
```
