# Apply LASA020 (Digit Span) SPSS labels

Attaches the SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) documented for the 15 separate Digit Span
item scores in LAS3B020. The file contains eight forwards items,
covering spans of two through nine numbers, and seven backwards items,
covering spans of two through eight numbers. Each item records the
number of correct answers across attempts 1 and 2.

## Usage

``` r
apply_lasa020_labels(
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

  A data frame or tibble imported from a LAS3B020 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Expected names are `bDSf01` through `bDSf08` and `bDSb01` through
  `bDSb07`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. LASA020 is documented only for `"3B"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA020 suffixes without the `b` wave prefix (for
  example `DSf01` or `DSb07`), and values are actual column names in
  `data`, for example `c(DSf01 = "forward_span_2")`.

- to_factor:

  Logical. If `FALSE` (default), matched items remain numeric with
  SPSS-style value-label attributes. If `TRUE`, they are converted to
  factors using the documented correctness and missing-value labels. An
  observed unlabelled code is retained as a numeric-text level.

- to_numeric:

  Logical. If `FALSE` (default), matched items retain their SPSS-style
  labels. If `TRUE`, they are restored to ordinary numeric, negative
  missing-reason codes become `NA`, and non-negative scores are
  retained. This takes precedence over `to_factor`.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA020 columns are renamed to their canonical lowercase suffixes with
  the wave code removed; `"respnr"` is standardized; and
  `split_wavecode` is always treated as `TRUE`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, matched columns are renamed
  with their `b` prefix removed and a new `"LASA_wave"` column filled
  with `"3B"` is inserted immediately after the respondent-number
  column. It is always treated as `TRUE` when
  `standardize_names = TRUE`.

## Value

`data`, with variable/value-label attributes attached to every matched
LASA020 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added when
requested. The generic name-matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA020 is documented only for wave 3B. By default, matched variables
remain numeric with codes -3 through 2 and their SPSS labels attached.
With `to_factor = TRUE`, they become factors using the documented
labels. With `to_numeric = TRUE`, they become plain numeric counts:
negative missing-reason codes become `NA`, while zero, one, two, and any
observed non-negative unlabelled value are retained. `to_numeric` takes
precedence over `to_factor` for every Digit Span item.

The same PDF also documents LAS3B220, which contains total scores and
the reason-missing variable. Those variables are intentionally outside
LASA020 and are not changed by this function; they belong to
[`apply_lasa220_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa220_labels.md).

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive name match, and (3) a
case-insensitive exact match. Variables documented for LAS3B020 but
absent from `data` are left untouched and recorded as `"not found"` in
the generic matching audit.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` are part of the parameter contract shared by every
`apply_*_labels()` function in this package. Regardless of conversion,
every matched column keeps its original SPSS value coding in
`attr(x, "original_labels")` and `attr(x, "original_values")`. The
`"respnr"` column is matched in any capitalization and, when
`standardize_names = TRUE`, renamed to `"respnr"`.

## See also

[`apply_lasa019_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa019_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:4,
  bDSf01 = c(-3, 0, 1, 2),
  bDSb01 = c(-2, -1, 1, 2)
)
dat <- apply_lasa020_labels(dat, wave = "3B")
attr(dat$bDSf01, "label")
#> [1] "Digit Span forwards: 2 numbers, attempt 1+2"
attr(dat$bDSf01, "labels")
#>                  na, see BRMDS na, previous answers incorrect 
#>                             -3                             -2 
#>                test broken off                      0 correct 
#>                             -1                              0 
#>                      1 correct                      2 correct 
#>                              1                              2 

numeric_dat <- apply_lasa020_labels(
  dat, wave = "3B", to_numeric = TRUE,
  standardize_names = TRUE
)
numeric_dat$dsf01
#> [1] NA  0  1  2
#> attr(,"label")
#> [1] "Digit Span forwards: 2 numbers, attempt 1+2"
#> attr(,"original_labels")
#>                  na, see BRMDS na, previous answers incorrect 
#>                             -3                             -2 
#>                test broken off                      0 correct 
#>                             -1                              0 
#>                      1 correct                      2 correct 
#>                              1                              2 
#> attr(,"original_values")
#> [1] -3  0  1  2
```
