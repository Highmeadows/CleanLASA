# Inspect a LASA variable-name labelling audit

Returns the generic variable-name matching audit attached by a LASA
file-specific label function. The function is independent of the LASA
file code and therefore works for any future `apply_*_labels()`
implementation that stores its audit in the `"label_report"` attribute.

## Usage

``` r
lasa_label_report(data, problems_only = FALSE)
```

## Arguments

- data:

  A data object previously processed by a LASA file-specific label
  function or by
  [`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md).

- problems_only:

  Logical. If `FALSE` (default), return the full matching audit. If
  `TRUE`, retain rows requiring attention. If the report has a logical
  `problem` column, that column is used. Otherwise, when a `method`
  column is available, common non-exact/failure methods are used.

## Value

A data frame containing the variable-name matching audit. The returned
report retains LASA context in the attributes `"LASA_wave"`,
`"LASA_file_code"`, `"LASA_source_file"`, and `"LASA_label_function"`
when those are available on `data`.

## Details

File-specific labelling functions should store their matching audit as
`attr(data, "label_report")` and the wave identifier as
`attr(data, "LASA_wave")`. This avoids embedding a particular LASA file
code in the attribute names and lets one reporting function serve all
LASA files.

For consistency across future label implementations, reports should
ideally contain a `method` column using values such as `"exact"`,
`"case-insensitive exact"`, `"normalized exact"`, `"fuzzy"`,
`"not found"`, or `"ambiguous"`; alternatively they may provide a
logical `problem` column.

## See also

[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, BLPHYA07 = c(1, 2))
dat <- apply_lasa046_labels(dat, wave = "B", warn_unmatched = FALSE)
lasa_label_report(dat, problems_only = TRUE)
#>     suffix expected matched    method edit_distance standardized_to note
#> 1  lphya01 blphya01    <NA> not found            NA            <NA> <NA>
#> 2  lphya02 blphya02    <NA> not found            NA            <NA> <NA>
#> 3  lphya03 blphya03    <NA> not found            NA            <NA> <NA>
#> 4  lphya04 blphya04    <NA> not found            NA            <NA> <NA>
#> 5  lphya05 blphya05    <NA> not found            NA            <NA> <NA>
#> 6  lphya06 blphya06    <NA> not found            NA            <NA> <NA>
#> 7  lphya08 blphya08    <NA> not found            NA            <NA> <NA>
#> 8  lphya09 blphya09    <NA> not found            NA            <NA> <NA>
#> 9  lphya10 blphya10    <NA> not found            NA            <NA> <NA>
#> 10 lphya11 blphya11    <NA> not found            NA            <NA> <NA>
#> 11 lphya12 blphya12    <NA> not found            NA            <NA> <NA>
#> 12 lphya13 blphya13    <NA> not found            NA            <NA> <NA>
#> 13 lphya14 blphya14    <NA> not found            NA            <NA> <NA>
#> 14 lphya15 blphya15    <NA> not found            NA            <NA> <NA>
#> 15 lphya16 blphya16    <NA> not found            NA            <NA> <NA>
#> 16 lphya17 blphya17    <NA> not found            NA            <NA> <NA>
#> 17 lphya18 blphya18    <NA> not found            NA            <NA> <NA>
#> 18 lphya19 blphya19    <NA> not found            NA            <NA> <NA>
#> 19 lphya20 blphya20    <NA> not found            NA            <NA> <NA>
#> 20 lphya21 blphya21    <NA> not found            NA            <NA> <NA>
#> 21 lphya22 blphya22    <NA> not found            NA            <NA> <NA>
#> 22 lphya23 blphya23    <NA> not found            NA            <NA> <NA>
#> 23 lphya24 blphya24    <NA> not found            NA            <NA> <NA>
#> 24 lphya25 blphya25    <NA> not found            NA            <NA> <NA>
#> 25 lphya26 blphya26    <NA> not found            NA            <NA> <NA>
#> 26 lphya27 blphya27    <NA> not found            NA            <NA> <NA>
#> 27 lphya28 blphya28    <NA> not found            NA            <NA> <NA>
#> 28 lphya29 blphya29    <NA> not found            NA            <NA> <NA>
#> 29 lphya30 blphya30    <NA> not found            NA            <NA> <NA>
#> 30 lphya31 blphya31    <NA> not found            NA            <NA> <NA>
#> 31 lphya32 blphya32    <NA> not found            NA            <NA> <NA>
#> 32 lphya33 blphya33    <NA> not found            NA            <NA> <NA>
#> 33 lphya34 blphya34    <NA> not found            NA            <NA> <NA>
#> 34 lphya35 blphya35    <NA> not found            NA            <NA> <NA>
#> 35 lphya36 blphya36    <NA> not found            NA            <NA> <NA>
#> 36 lphya37 blphya37    <NA> not found            NA            <NA> <NA>
#> 37 lphya38 blphya38    <NA> not found            NA            <NA> <NA>
#> 38 lphya39 blphya39    <NA> not found            NA            <NA> <NA>
#> 39 lphya40 blphya40    <NA> not found            NA            <NA> <NA>
#> 40 lphya41 blphya41    <NA> not found            NA            <NA> <NA>
#> 41 lphya42 blphya42    <NA> not found            NA            <NA> <NA>
#> 42 lphya43 blphya43    <NA> not found            NA            <NA> <NA>
#> 43 lphya44 blphya44    <NA> not found            NA            <NA> <NA>
#> 44 lphya45 blphya45    <NA> not found            NA            <NA> <NA>
#> 45 lphya46 blphya46    <NA> not found            NA            <NA> <NA>
#>    problem
#> 1     TRUE
#> 2     TRUE
#> 3     TRUE
#> 4     TRUE
#> 5     TRUE
#> 6     TRUE
#> 7     TRUE
#> 8     TRUE
#> 9     TRUE
#> 10    TRUE
#> 11    TRUE
#> 12    TRUE
#> 13    TRUE
#> 14    TRUE
#> 15    TRUE
#> 16    TRUE
#> 17    TRUE
#> 18    TRUE
#> 19    TRUE
#> 20    TRUE
#> 21    TRUE
#> 22    TRUE
#> 23    TRUE
#> 24    TRUE
#> 25    TRUE
#> 26    TRUE
#> 27    TRUE
#> 28    TRUE
#> 29    TRUE
#> 30    TRUE
#> 31    TRUE
#> 32    TRUE
#> 33    TRUE
#> 34    TRUE
#> 35    TRUE
#> 36    TRUE
#> 37    TRUE
#> 38    TRUE
#> 39    TRUE
#> 40    TRUE
#> 41    TRUE
#> 42    TRUE
#> 43    TRUE
#> 44    TRUE
#> 45    TRUE
```
