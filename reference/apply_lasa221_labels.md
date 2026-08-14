# Apply LASA221 (MMSE maximum score) SPSS labels

Attaches SPSS-style variable and value labels to the constructed MMSE
scores in LASA221. For the regular cohorts, the score uses the maximum
of spelling backwards and serial subtraction. The Migrant Baseline file
has both the maximum score and an illiterate score based on spelling.

## Usage

``` r
apply_lasa221_labels(
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

  A data frame or tibble imported from a LASA221 `.sav` file.

- wave:

  Character scalar identifying B, C, D, E, 2B, F, G, H, 3B, MB, I, J, or
  K; matching is case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes (`mmsesc`,
  or MB's `msesc1` and `msesc2`) to actual columns.

- to_factor:

  Logical. Convert variables carrying labels to factors unless numeric
  restoration takes precedence.

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

`data` with LASA221 metadata, optional conversion and renaming, the
`LASA_wave` attribute, and a `label_report` audit.

## Details

LASA221 is documented for waves B, C, D, E, 2B, F, G, H, 3B, MB, I, J,
and K. B has a minimum labelled score of 2; C has a minimum of 1; D
onward additionally document `-3` for interview termination. MB
additionally uses `-5` and `-4` missing codes and contains two scores.
All scores are numeric: `to_numeric = TRUE` restores plain numeric
values and replaces negative codes with `NA`. Matching and standardized
naming follow the shared LASA label-engine conventions, including
`respnr`, `LASA_wave`, preserved original coding, and a final
`label_report`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, dmmsesc = c(-3, 27))
apply_lasa221_labels(dat, wave = "D", to_numeric = TRUE)
#>   RespNr dmmsesc
#> 1      1      NA
#> 2      2      27
```
