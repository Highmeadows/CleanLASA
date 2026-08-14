# Apply LASA356 (15-Word Test Constructed Scores) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the constructed 15-word-test variables
documented in LASA356 for waves B through K, including replenishment
waves 2B and 3B.

## Usage

``` r
apply_lasa356_labels(
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

  A data frame or tibble imported from a LASA356 `.sav` file. Variables
  use their documented wave prefix followed by suffixes such as
  `mtotal`, `mtmax`, `mdelta`, `mret1pc`, and `mret2pc`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector mapping canonical LASA356 suffixes
  without the wave prefix to actual column names in `data`.

- to_factor:

  Logical. If `TRUE`, variables carrying documented value labels are
  converted to factors. Observed unlabelled scores remain numeric-text
  levels.

- to_numeric:

  Logical. If `TRUE`, all LASA356 variables are restored to plain
  numeric and negative values are replaced by `NA`.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column containing the selected wave is inserted
  immediately after the respondent-number column.

## Value

`data`, with LASA356 variable/value labels, optional conversion and
standardized naming, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

Wave B contains trial, delayed-recall, total, maximum, learning-effect,
retention, and recall-interval variables. Wave C contains the same
constructed cognitive scores except the recall interval. From wave D
onward, LASA356 contains five derived scores: total, maximum, learning
effect, and two retention percentages. The much larger set of test
administration and item variables in the same source belongs to LASA156
and is intentionally outside this function's inventory.

The source prints the second B/C retention variable as `mret1pc` a
second time. This function uses `mret2pc`, consistent with its
documented retention-2 formula and with the explicit `mret1pc`/`mret2pc`
distinction in every later wave. Wave-specific missing codes and
variable-label capitalization are otherwise reproduced from the source.

All LASA356 variables are numeric. With `to_numeric = TRUE`, documented
negative codes become `NA`; `to_numeric` therefore takes precedence over
`to_factor`. With `to_factor = TRUE` alone, documented missing codes
become factor levels and observed unlabelled scores remain numeric-text
levels.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive match, and (3) a
case-insensitive exact match. Variables absent from `data` are recorded
as `"not found"` in the matching audit. Original labels and values are
preserved, and optional standardized naming removes the wave prefix,
standardizes `respnr`, and adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, dmtotal = c(-2, 34), dmret1pc = c(-1, 75))
dat <- apply_lasa356_labels(dat, wave = "D", to_numeric = TRUE)
attr(dat$dmtotal, "label")
#> [1] "learning/memory: total of 1, 2 and 3"
```
