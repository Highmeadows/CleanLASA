# Apply LASA022 (Raven) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the raw Raven's Coloured Progressive
Matrices variables documented in LASA022. Every supported wave contains
12 Section A items, 12 Section B items, and three missing-answer counts.
Waves B through D used the main interview; wave E onward used the
medical interview and added `m` to the variable suffixes.

## Usage

``` r
apply_lasa022_labels(
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

  A data frame or tibble imported from a LASA022 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Expected names include `brava1`, `dravb12`, `bmravamis`, and
  `gmrabmis`, depending on `wave`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  or `"G"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA022 suffixes without the wave prefix (for
  example `rava1`, `mravb12`, or `mrabmis`), and values are actual
  column names in `data`, for example `c(mrava1 = "raven_a_item_1")`.

- to_factor:

  Logical. If `FALSE` (default), categorical Raven items remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors. Codes other than the documented correct response remain
  numeric-text levels. Missing-answer counts are also factored when they
  have labels unless `to_numeric = TRUE`.

- to_numeric:

  Logical. If `FALSE` (default), missing-answer counts retain their
  SPSS-style labels, where documented. If `TRUE`, those count variables
  become ordinary numeric, negative missing/routing codes become `NA`,
  and non-negative counts are retained. Raven item responses remain
  categorical. This takes precedence over `to_factor` for counts.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA022 columns are renamed to their canonical lowercase suffixes with
  the wave code removed; `"respnr"` is standardized; and
  `split_wavecode` is always treated as `TRUE`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, matched columns are renamed
  with their wave prefix removed and a new `"LASA_wave"` column filled
  with `wave` is inserted immediately after the respondent-number
  column. It is always treated as `TRUE` when
  `standardize_names = TRUE`.

## Value

`data`, with variable/value-label attributes attached to every matched
LASA022 column, optional factor/numeric conversion and canonical
renaming, and attributes preserving the original SPSS coding. A
`"LASA_wave"` column is added when requested. The generic name-matching
audit is attached as `attr(data, "label_report")` and can be retrieved
with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

For each Raven item the codebook labels only the correct response code,
which differs by item. Other observed response codes are deliberately
not assigned inferred `"incorrect"` labels. With `to_factor = TRUE`,
those unlabelled responses remain numeric-text factor levels.
Missing-answer variables are counts; with `to_numeric = TRUE`, their
documented negative routing/missing codes become `NA` and non-negative
counts are retained. Numeric conversion takes precedence over factor
conversion for the count variables, while the individual Raven items
remain categorical.

The function preserves two irregularities printed in the source PDF:
Section B item 2 is labelled `"C. Raven Section A: item 2"` in every
wave, and the LAS2B022 value label for `bmrava9` refers to
`"C/DRMCRAV in LAS2B222"`. Neither wording is silently corrected.

The source PDF also documents LASA222 constructed totals and
reason-missing variables. Those variables are intentionally outside
LASA022 and are not changed by this function.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive name match, and (3) a
case-insensitive exact match. Variables documented for the selected wave
but absent from `data` are left untouched and recorded as `"not found"`
in the generic matching audit.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` are part of the parameter contract shared by every
`apply_*_labels()` function in this package. Regardless of conversion,
every matched column keeps its original SPSS value coding in
`attr(x, "original_labels")` (when labels exist) and
`attr(x, "original_values")`. The `"respnr"` column is matched in any
capitalization and, when `standardize_names = TRUE`, renamed to
`"respnr"`.

## See also

[`apply_lasa021_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa021_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:4,
  gmrava1 = c(-2, -1, 4, 6),
  gmravamis = c(-2, 0, 1, 3)
)
dat <- apply_lasa022_labels(dat, wave = "G")
attr(dat$gmrava1, "labels")
#> na, see GMRMCRAV in LASAG222                    na, asked 
#>                           -2                           -1 
#>                      correct 
#>                            4 

numeric_dat <- apply_lasa022_labels(dat, wave = "G", to_numeric = TRUE)
numeric_dat$gmravamis
#> [1] NA  0  1  3
#> attr(,"label")
#> [1] "# of missing answers first Raven test (A)"
#> attr(,"original_labels")
#> na, see GMRMCRAV in LASAG222 
#>                           -2 
#> attr(,"original_values")
#> [1] -2  0  1  3
```
