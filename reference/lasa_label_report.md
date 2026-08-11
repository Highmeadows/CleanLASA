# Inspect a LASA variable-name labelling audit

Returns the generic variable-name matching audit attached by a LASA
file-specific label function. The function is independent of the LASA
file code and therefore works for any `apply_*_labels()` implementation
that stores its audit in the `"label_report"` attribute.

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
report retains LASA context in the attributes `"LASA_wave"` and
`"LASA_file_code"` when those are available on `data`.

## Details

File-specific labelling functions should store their matching audit as
`attr(data, "label_report")` and the wave identifier as
`attr(data, "LASA_wave")`. This avoids embedding a particular LASA file
code in the attribute names and lets one reporting function serve all
LASA files.

For consistency across label implementations, reports should ideally
contain a `method` column using values such as `"exact"`,
`"case-insensitive exact"`, `"manual correction"`, `"manual_not_found"`,
`"not found"`, `"fuzzy"`, or `"ambiguous"`; alternatively they may
provide a logical `problem` column. When a report was produced with
`standardize_names = TRUE`, it may also contain a `standardized_to`
column recording each matched column's renamed (canonical) name.

## See also

[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, BLPHYA07 = c(1, 2))
dat <- apply_lasa046_labels(dat, wave = "B")
lasa_label_report(dat, problems_only = TRUE)
#>     suffix expected_name matched_name    method standardized_to
#> 1  lphya01      blphya01         <NA> not found            <NA>
#> 2  lphya02      blphya02         <NA> not found            <NA>
#> 3  lphya03      blphya03         <NA> not found            <NA>
#> 4  lphya04      blphya04         <NA> not found            <NA>
#> 5  lphya05      blphya05         <NA> not found            <NA>
#> 6  lphya06      blphya06         <NA> not found            <NA>
#> 7  lphya08      blphya08         <NA> not found            <NA>
#> 8  lphya09      blphya09         <NA> not found            <NA>
#> 9  lphya10      blphya10         <NA> not found            <NA>
#> 10 lphya11      blphya11         <NA> not found            <NA>
#> 11 lphya12      blphya12         <NA> not found            <NA>
#> 12 lphya13      blphya13         <NA> not found            <NA>
#> 13 lphya14      blphya14         <NA> not found            <NA>
#> 14 lphya15      blphya15         <NA> not found            <NA>
#> 15 lphya16      blphya16         <NA> not found            <NA>
#> 16 lphya17      blphya17         <NA> not found            <NA>
#> 17 lphya18      blphya18         <NA> not found            <NA>
#> 18 lphya19      blphya19         <NA> not found            <NA>
#> 19 lphya20      blphya20         <NA> not found            <NA>
#> 20 lphyasp      blphyasp         <NA> not found            <NA>
#> 21 lphya21      blphya21         <NA> not found            <NA>
#> 22 lphya22      blphya22         <NA> not found            <NA>
#> 23 lphya23      blphya23         <NA> not found            <NA>
#> 24 lphya24      blphya24         <NA> not found            <NA>
#> 25 lphya25      blphya25         <NA> not found            <NA>
#> 26 lphya26      blphya26         <NA> not found            <NA>
#> 27 lphya27      blphya27         <NA> not found            <NA>
#> 28 lphya28      blphya28         <NA> not found            <NA>
#> 29 lphya29      blphya29         <NA> not found            <NA>
#> 30 lphya30      blphya30         <NA> not found            <NA>
#> 31 lphya31      blphya31         <NA> not found            <NA>
#> 32 lphya32      blphya32         <NA> not found            <NA>
#> 33 lphya33      blphya33         <NA> not found            <NA>
#> 34 lphya34      blphya34         <NA> not found            <NA>
#> 35 lphya35      blphya35         <NA> not found            <NA>
#> 36 lphya36      blphya36         <NA> not found            <NA>
#> 37 lphya37      blphya37         <NA> not found            <NA>
#> 38 lphya38      blphya38         <NA> not found            <NA>
#> 39 lphya39      blphya39         <NA> not found            <NA>
#> 40 lphya40      blphya40         <NA> not found            <NA>
#> 41 lphya41      blphya41         <NA> not found            <NA>
#> 42 lphya42      blphya42         <NA> not found            <NA>
#> 43 lphya43      blphya43         <NA> not found            <NA>
#> 44 lphya44      blphya44         <NA> not found            <NA>
#> 45 lphya45      blphya45         <NA> not found            <NA>
#> 46 lphya46      blphya46         <NA> not found            <NA>
#> 47 lphya47      blphya47         <NA> not found            <NA>
#> 48 lphya48      blphya48         <NA> not found            <NA>
#> 49 lphya49      blphya49         <NA> not found            <NA>
#> 50 lphya50      blphya50         <NA> not found            <NA>
```
