# Apply LASA121 (Social participation: environmental influence) labels

Attaches SPSS-style variable and value labels to the three social-
participation variables documented for LASA121. The self-administered
items record how often respondents discuss magazines or newspapers,
discuss life, and make calculations.

## Usage

``` r
apply_lasa121_labels(
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

  A data frame or tibble imported from a LASA121 `.sav` file.

- wave:

  Character scalar identifying `"B"`, `"C"`, or `"D"`; matching is
  case-insensitive.

- name_corrections:

  Optional named character vector whose names are canonical suffixes
  without the wave prefix, such as `qsocp01`, and whose values are
  actual column names in `data`.

- to_factor:

  Logical. Convert matched variables to factors using the documented
  value labels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA121 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. Standardize matched names and respondent number, remove wave
  prefixes, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes from matched names and add `LASA_wave`;
  implied by `standardize_names = TRUE`.

## Value

`data` with LASA121 metadata, optional conversion and renaming,
original-coding attributes, `LASA_wave`, and a `label_report` audit.

## Details

LASA121 is documented for waves B, C, and D. Each wave contains the same
three categorical items, coded `-1` no answer, `1` rarely or never, `2`
monthly, and `3` weekly or more often. `to_factor = TRUE` converts
matched items with this map and retains observed unlabelled codes. No
variable is eligible for `to_numeric`.

Matching tries `name_corrections`, an exact name, then a
case-insensitive exact name. Original labels and values are retained in
`original_labels` and `original_values` attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(BQSOCP01 = c(-1, 1, 3), bqsocp03 = c(1, 2, 3))
dat <- apply_lasa121_labels(dat, wave = "B")
attr(dat$BQSOCP01, "labels")
#>            no answer      rarely or never              monthly 
#>                   -1                    1                    2 
#> weekly or more often 
#>                    3 
```
