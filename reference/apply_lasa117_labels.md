# Apply LASA117 (Sleep habits) SPSS labels

Attaches SPSS-style variable and value labels to the sleep-habit
variables documented for LASA117. Waves B, C, D, E, 2B, and F contain
four items: hours slept and three sleep-problem frequency items. Waves
G, H, 3B, I, J, and K additionally contain bedtime hour and minute plus
a fifth item on sleep quality.

## Usage

``` r
apply_lasa117_labels(
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

  A data frame or tibble imported from a LASA117 `.sav` file.

- wave:

  Character scalar identifying `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`,
  `"F"`, `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector whose names are canonical suffixes
  without a wave prefix, such as `qsleep1` or `qsleeph`, and whose
  values are actual column names.

- to_factor:

  Logical. Convert matched value-labelled variables to factors using
  documented labels.

- to_numeric:

  Logical. Restore documented numeric variables to plain numeric and
  replace negative missing-value codes with `NA`.

- standardize_names:

  Logical. Standardize matched names and respondent number, remove wave
  prefixes, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove wave prefixes from matched names and add `LASA_wave`;
  implied by `standardize_names = TRUE`.

## Value

`data` with LASA117 metadata, optional conversion and renaming,
original-coding attributes, `LASA_wave`, and a `label_report` audit.

## Details

Hours slept and bedtime hour/minute are numeric variables. Their
documented missing-value maps vary by wave: bedtime hour and minute have
no value map in G; hour has `-1` in H, 3B, I, J, and K; minute has `-1`
in H, 3B, I, and J, while the PDF documents no value for K. With
`to_numeric = TRUE`, these numeric variables become plain numeric and
negative codes become `NA`. Sleep-problem and sleep-quality items are
categorical and can be converted with `to_factor = TRUE`.

Matching tries `name_corrections`, an exact match, then a
case-insensitive exact match. Original labels and values are retained in
`original_labels` and `original_values`. The sleeping-problems scale
score belongs to LASA317 and is not included here.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  GQSLEEP1 = c(-1, 6, 8),
  gqsleep2 = c(1, 2, 4)
)
dat <- apply_lasa117_labels(dat, wave = "G", to_numeric = TRUE)
dat$GQSLEEP1
#> [1] NA  6  8
#> attr(,"label")
#> [1] "Sleep 1: hours sleep in 24 hours"
#> attr(,"original_labels")
#> no answer 
#>        -1 
#> attr(,"original_values")
#> [1] -1  6  8
```
