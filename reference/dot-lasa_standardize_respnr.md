# Standardize the "respnr" (respondent number) column name

Internal helper shared by every `apply_*_labels()` function in this
package. The LASA respondent-number identifier column is present in
essentially every LASA data file but is spelled inconsistently across
files/waves (e.g. `"RespNr"`, `"RESPNR"`, `"respnr"`). This helper finds
it by an exact, then case-insensitive, name match and – only when
`standardize_names = TRUE` – renames it to the canonical lowercase
spelling `"respnr"`.

## Usage

``` r
.lasa_standardize_respnr(data, standardize_names = FALSE)
```

## Arguments

- data:

  A data frame or tibble that may contain a respondent-number column.

- standardize_names:

  Logical. If `TRUE`, a matched respnr column is renamed to `"respnr"`.

## Value

A list with `data` (possibly renamed), `matched_name` (the original
column name found, or `NA_character_` if none was found), `method`
(`"exact"`, `"case-insensitive exact"`, or `"not found"`), and
`respnr_name` (the column's name in the returned `data`: `"respnr"` when
it was renamed, otherwise `matched_name`).
