# Apply LASA225 (CES-D scale scores) SPSS labels

Attaches SPSS-style labels to the CES-D total score and reason-missing
variable documented in LASA225 for waves B, C, D, E, 2B, F, G, H, 3B,
MB, I, J, and K. The score ranges from 0 to 60 with the documented
cut-off at 16. Its `-2` missing code and the reason categories vary by
wave group.

## Usage

``` r
apply_lasa225_labels(
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

  A data frame or tibble imported from a LASA225 `.sav` file.

- wave:

  Character scalar identifying B, C, D, E, 2B, F, G, H, 3B, MB, I, J, or
  K.

- name_corrections:

  Optional named character vector mapping `cesdint` or `rmcesd` to
  actual columns.

- to_factor:

  Logical. Convert labelled categorical variables to factors unless
  numeric restoration takes precedence.

- to_numeric:

  Logical. Restore the CES-D score to plain numeric and replace negative
  values with `NA`.

- standardize_names:

  Logical. Standardize names and `respnr`, remove wave prefixes, and add
  `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes and add `LASA_wave`; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASA225 metadata, optional conversion and renaming, the
`LASA_wave` attribute, and a `label_report` audit.

## Details

The CES-D total is numeric: `to_numeric = TRUE` restores a plain numeric
vector and replaces negative values with `NA`. The reason field remains
categorical and can be converted with `to_factor = TRUE`. The function
reproduces the B, C/D/E, 2B, F-through-K, and MB branches, including
MB's code 4 for no valid data. Matching, original-label preservation,
standardized names, `respnr`, `LASA_wave`, and the matching audit use
the shared label engine.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, fcesdint = c(-2, 24), frmcesd = c(3, -2))
apply_lasa225_labels(dat, wave = "F", to_numeric = TRUE)
#>   RespNr fcesdint frmcesd
#> 1      1       NA       3
#> 2      2       24      -2
```
