# Inspect a LASA variable-name labelling audit

Returns the generic variable-name matching audit attached by
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)/[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md).
The audit is bidirectional: it covers both documented variables not
found in the data, and data columns not documented in the label
database.

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
  `TRUE`, retain rows requiring attention: unmatched in either
  direction, or matched only via a fuzzy/ambiguous method.

## Value

A data frame containing the variable-name matching audit. The returned
report retains LASA context in the attributes `"LASA_wave"` and
`"LASA_file_code"` when those are available on `data`.

## Details

[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
and
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
store their matching audit as `attr(data, "label_report")` and the wave
identifier as `attr(data, "LASA_wave")`.

The report's `direction` column is one of `"matched"`,
`"documented_not_in_data"` (a database variable wasn't found in `data` –
possibly fixable with `name_corrections`), or `"data_not_documented"` (a
column in `data` didn't match anything in the database). Neither
direction is ever an error – unmatched variables are always left
untouched.

The `method` column records how a match was made: `"exact"`,
`"case-insensitive exact"`, `"exact canonical"`,
`"case-insensitive canonical"`, `"fuzzy"`, `"manual correction"`,
`"manual_not_found"`, `"ambiguous fuzzy"`, `"not found"`, or
`"undocumented column"` – each optionally suffixed with
`" (manual override)"` when the match's label/value labels were patched
by
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md).
A `"fuzzy"`/`"ambiguous fuzzy"` row also has a non-`NA` `edit_distance`.
When produced with `.standardize_names` effectively `TRUE`, matched rows
also have a `standardized_to` column recording the matched column's
renamed (canonical) name.

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
