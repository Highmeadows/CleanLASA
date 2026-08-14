# Apply LASA222 (Constructed Raven scores) SPSS labels

Attaches SPSS-style labels to the constructed Raven Coloured Progressive
Matrices scores in LASA222: section A, section B, total score, and
reason fields. LASA222 is documented for waves B, C, D, E, 2B, F, and G.

## Usage

``` r
apply_lasa222_labels(
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

  A data frame or tibble imported from a LASA222 `.sav` file.

- wave:

  Character scalar identifying B, C, D, E, 2B, F, or G.

- name_corrections:

  Optional named character vector mapping canonical suffixes for the
  selected wave to actual columns.

- to_factor:

  Logical. Convert labelled categorical variables to factors unless
  numeric restoration takes precedence.

- to_numeric:

  Logical. Restore score variables to plain numeric and replace negative
  missing codes with `NA`.

- standardize_names:

  Logical. Standardize names and `respnr`, remove wave prefixes, and add
  `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes and add `LASA_wave`; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASA222 metadata, optional conversion and renaming, the
`LASA_wave` attribute, and a `label_report` audit.

## Details

The inventory contains four variables in B through 2B and five in F and
G, where separate reason fields are supplied for section B and the
complete test. The codebook documents wave-specific names and coding,
including `na, see BRMCRAV` in B, physical/visual wording in B and C, a
`-1` linked reason in F and G, and an additional code 0 in G. Score
variables are numeric and `to_numeric = TRUE` replaces their negative
missing codes with `NA`; reason variables remain categorical. Matching,
factor conversion, original-value preservation, name standardization,
`respnr`, `LASA_wave`, and the `label_report` follow the shared label
engine.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, dravatot = c(-2, 10), drmcrav = c(3, -2))
apply_lasa222_labels(dat, wave = "D", to_numeric = TRUE)
#>   RespNr dravatot drmcrav
#> 1      1       NA       3
#> 2      2       10      -2
```
