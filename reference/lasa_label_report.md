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

  A data object previously labelled by
  [`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
  or
  [`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md).

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

[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
and
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
store their matching audit as `attr(data, "label_report")` and the wave
identifier as `attr(data, "LASA_wave")`, so one reporting function
serves every LASA file code.

The report's `method` column uses values such as `"exact"`,
`"case-insensitive exact"`, `"exact canonical"`,
`"case-insensitive canonical"`, `"manual correction"`,
`"manual_not_found"`, or `"not found"` – each optionally suffixed with
`" (manual override)"` when the match's label/value labels were patched
by
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md).
When produced with `standardize_names = TRUE`, it also contains a
`standardized_to` column recording each matched column's renamed
(canonical) name.

## See also

[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)

## Examples

``` r
if (FALSE) { # \dontrun{
dat <- data.frame(RespNr = 1:2, BLPHYA07 = c(1, 2))
dat <- apply_lasa_labels(dat, filecode = "046", wave = "B")
lasa_label_report(dat, problems_only = TRUE)
} # }
```
