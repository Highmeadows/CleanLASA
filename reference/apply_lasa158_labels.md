# Apply LASA158 (Peak flow test) SPSS labels

Applies the variable labels, response labels, and wave-specific
missing-value codes documented for the LASA158 peak-flow test. LASA158
is available in waves B, C, D, E, G, and H. The trial, completion,
reason, understanding, cooperation, position, and maximum-score
inventories differ across the B, C, and later-wave forms.

## Usage

``` r
apply_lasa158_labels(
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

  A data frame or tibble imported from a LASA158 `.sav` file.

- wave:

  Character scalar: `"B"`, `"C"`, `"D"`, `"E"`, `"G"`, or `"H"`;
  matching is case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes to actual
  column names.

- to_factor:

  Logical. Convert labelled categorical variables to factors.

- to_numeric:

  Logical. Convert eligible peak-flow trials and scores to plain numeric
  and replace negative missing codes with `NA`.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove wave prefixes,
  and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes and add `LASA_wave`; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASA158 metadata, optional reshaping, the `LASA_wave`
attribute, and a `label_report` audit.

## Details

Matching tries `name_corrections`, an exact match, then a
case-insensitive exact match. `to_factor` converts categorical variables
to factors and retains observed undocumented values. `to_numeric`
restores trial and score variables to plain numeric and replaces
documented negative missing codes with `NA`. Original values and labels
are preserved as attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(bmpeakf1 = c(-2, 250), bmpeakfp = c(-1, 1))
apply_lasa158_labels(dat, wave = "B")
#>   bmpeakf1 bmpeakfp
#> 1       -2       -1
#> 2      250        1
```
