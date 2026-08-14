# Apply LASA226 (Anxiety scale scores) SPSS labels

Attaches SPSS-style labels to the anxiety total score and reason-missing
variable documented in LASA226 for waves B, C, D, E, F, G, H, 3B, MB, I,
and J. The score ranges from 0 to 21. B, the regular later waves, and MB
use materially different names, variable-label wording, and value maps.

## Usage

``` r
apply_lasa226_labels(
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

  A data frame or tibble imported from a LASA226 `.sav` file.

- wave:

  Character scalar identifying B, C, D, E, F, G, H, 3B, MB, I, or J.

- name_corrections:

  Optional named character vector mapping canonical suffixes for the
  selected wave to actual columns.

- to_factor:

  Logical. Convert labelled categorical variables to factors unless
  numeric restoration takes precedence.

- to_numeric:

  Logical. Restore the anxiety score to plain numeric and replace
  negative values with `NA`.

- standardize_names:

  Logical. Standardize names and `respnr`, remove wave prefixes, and add
  `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes and add `LASA_wave`; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASA226 metadata, optional conversion and renaming, the
`LASA_wave` attribute, and a `label_report` audit.

## Details

The total score is numeric: `to_numeric = TRUE` restores plain numeric
values and replaces negative codes with `NA`. The reason field remains
categorical and supports `to_factor = TRUE`. B includes code 4 for
refused test; later and MB reason maps end at code 3. Matching,
original-code preservation, standardized naming, `respnr`, `LASA_wave`,
and the final `label_report` follow the shared label engine.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, canxint = c(-2, 12), crmanx = c(3, -2))
apply_lasa226_labels(dat, wave = "C", to_numeric = TRUE)
#>   RespNr canxint crmanx
#> 1      1      NA      3
#> 2      2      12     -2
```
