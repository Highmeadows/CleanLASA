# Apply LASA034 (physical performance tests) SPSS labels

Attaches the documented SPSS variable labels (`attr(x, "label")`) and
value labels (`attr(x, "labels")`) to variables from a LASA034 physical
performance file. The implementation covers waves B, C, D, E, 2B, F, G,
H, 3B, MB, I, J, and K, including their wave-specific tests and codings.

## Usage

``` r
apply_lasa034_labels(
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

  A data frame or tibble imported from a LASA034 `.sav` file.

- wave:

  Character scalar identifying the LASA wave. One of `"B"`, `"C"`,
  `"D"`, `"E"`, `"2B"`, `"F"`, `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`,
  `"J"`, or `"K"` (matched case-insensitively).

- name_corrections:

  Optional named character vector mapping canonical LASA034 suffixes
  (without a wave prefix), such as `walk04a`, to actual column names in
  `data`.

- to_factor:

  Logical. If `TRUE`, variables with substantive value labels are
  converted to factors. Observed but unlabelled values are retained as
  levels containing their numeric code.

- to_numeric:

  Logical. If `TRUE`, variables whose value labels consist only of
  negative missing-reason codes are converted to plain numeric and all
  negative values are replaced by `NA`. This takes precedence over
  `to_factor`.

- standardize_names:

  Logical. If `TRUE`, matched variables are renamed to their canonical
  lowercase LASA034 names with the wave code removed, `"respnr"` (in any
  capitalization) is renamed to `"respnr"`, and `split_wavecode` is
  always treated as `TRUE` as well, regardless of what was passed for
  `split_wavecode`.

- split_wavecode:

  Logical. If `TRUE`, matched columns are renamed with the wave-letter
  prefix removed (e.g. `bwalk04` becomes `walk04`), and a new
  `"LASA_wave"` column, filled with `wave`, is inserted right after
  `"respnr"`. Always treated as `TRUE` when `standardize_names = TRUE`.

## Value

`data`, with labels applied and an audit in its `label_report`
attribute, plus reference `original_labels`/`original_values` attributes
preserving the original SPSS value coding regardless of
`to_factor`/`to_numeric` reshaping. A new `"LASA_wave"` column is added
after `"respnr"` when `standardize_names = TRUE` or
`split_wavecode = TRUE`.

## Details

The shared reshaping arguments have the same names, defaults, and
behavior as in
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md).
Column matching tries an explicit `name_corrections` override, an exact
match, and a case-insensitive exact match, in that order. Results are
recorded in the generic `label_report` attribute and can be inspected
with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

Regardless of `to_factor`/`to_numeric`, every matched column also keeps
its original SPSS value coding available as reference attributes –
`attr(x, "original_labels")` and `attr(x, "original_values")` – and the
`"respnr"` column (in any capitalization) is matched and, when
`standardize_names = TRUE`, renamed to `"respnr"`.

## See also

[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(BWALK01 = c(1, 2), BWALK04 = c(8.2, -6))
dat <- apply_lasa034_labels(dat, wave = "B")
attr(dat$BWALK01, "label")
#> [1] "Physical check"
attr(dat$BWALK01, "labels")
#>   na, see BRMPF       na, asked no restrictions   in wheelchair  recent surgery 
#>              -2              -1               1               2               3 
#> recent accident           other 
#>               4               5 

dat <- apply_lasa034_labels(
  dat, wave = "B", to_factor = TRUE, to_numeric = TRUE,
  standardize_names = TRUE
)
```
