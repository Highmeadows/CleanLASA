# Apply LASA120 (Sexuality) SPSS labels

Attaches SPSS-style variable and value labels to the sexuality variables
documented for LASA120. Waves B, 2B, and 3B contain three evaluations of
sexual life. Wave E contains those three items plus two attitudes about
sexuality and intimacy in later life. Wave F contains items 2 through 5.

## Usage

``` r
apply_lasa120_labels(
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

  A data frame or tibble imported from a LASA120 `.sav` file.

- wave:

  Character scalar identifying `"B"`, `"E"`, `"2B"`, `"F"`, or `"3B"`;
  matching is case-insensitive.

- name_corrections:

  Optional named character vector whose names are canonical suffixes
  without the wave prefix, such as `qsex01`, and whose values are actual
  column names in `data`.

- to_factor:

  Logical. Convert matched variables to factors using the documented
  value labels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA120 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. Standardize matched names and respondent number, remove wave
  prefixes, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes from matched names and add `LASA_wave`;
  implied by `standardize_names = TRUE`.

## Value

`data` with LASA120 metadata, optional conversion and renaming,
original-coding attributes, `LASA_wave`, and a `label_report` audit.

## Details

All LASA120 variables are categorical and use `-1` for no answer.
`to_factor = TRUE` converts matched variables with their documented
unpleasant/pleasant, unimportant/important, or disagreement/agreement
scales while retaining observed unlabelled codes. No variable is
eligible for `to_numeric`.

Matching tries `name_corrections`, an exact name, then a
case-insensitive exact name. Original labels and values are retained in
`original_labels` and `original_values` attributes.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:3, BQSEX01 = c(-1, 1, 5))
dat <- apply_lasa120_labels(dat, wave = "B")
attr(dat$BQSEX01, "labels")
#>               no answer         very unpleasant              unpleasant 
#>                      -1                       1                       2 
#> not unpleasant/pleasant                pleasant           very pleasant 
#>                       3                       4                       5 
```
