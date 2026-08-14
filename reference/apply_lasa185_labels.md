# Apply LASA185 (Foot problems) SPSS labels

Attaches SPSS-style variable and value labels to the foot-inspection
variables documented for LASA185 in waves C, D, E, and F. Waves C and D
contain the full inspection battery: whole-foot inspection, eight
finding indicators, an other-specification field, pull-up toes, and
smack feet. Wave C additionally contains two ankle, two knee, and two
pulse-width measurements that the codebook notes were processed in
LASAC185 although their questionnaire source was LASAC161. Waves E and F
contain only the pull-up-toes item.

## Usage

``` r
apply_lasa185_labels(
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

  A data frame or tibble imported from a LASA185 `.sav` file.

- wave:

  Character scalar identifying wave `"C"`, `"D"`, `"E"`, or `"F"`;
  matching is case-insensitive.

- name_corrections:

  Optional named character vector mapping suffixes without the wave
  prefix (for example `mfeetinsp`) to actual columns.

- to_factor:

  Logical. Convert labelled categorical variables to factors.

- to_numeric:

  Logical. Restore ankle, knee, and pulse widths to plain numeric and
  replace negative missing codes with `NA`.

- standardize_names:

  Logical. Standardize matched names and respondent number, remove wave
  prefixes, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes and add `LASA_wave`; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASA185 metadata, optional conversion and renaming, a
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

The six wave-C width measurements are numeric. With `to_numeric = TRUE`,
their negative missing codes become `NA`. `to_factor = TRUE` converts
labelled categorical variables to factors and retains unlabelled
observed codes. Original coding is preserved in `original_values` and
`original_labels`.

Matching tries a manual `name_corrections` override, an exact match,
then a case-insensitive exact match. Standardized naming removes the
wave prefix, standardizes `respnr`, and adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(cmfeetinsp = c(-1, 1, 2), cmankle1 = c(-1, 60, 72))
apply_lasa185_labels(dat, wave = "C", to_numeric = TRUE)
#>   cmfeetinsp cmankle1
#> 1         -1       NA
#> 2          1       60
#> 3          2       72
```
