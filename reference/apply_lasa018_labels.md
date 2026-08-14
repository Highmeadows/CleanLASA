# Apply LASA018 (Health Insurance) SPSS labels

Attaches the SPSS-style variable label (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) documented for the LASAB018
health-insurance variable. By default, the matched variable remains
numeric. Optional arguments allow converting it to a factor, correcting
a mismatched column name, and standardizing its name to the canonical
LASA spelling.

## Usage

``` r
apply_lasa018_labels(
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

  A data frame or tibble imported from a LASAB018 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
  containing `bhinsura`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. LASA018 is documented only for `"B"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  The name is the canonical suffix `hinsura`, and its value is the
  actual column name in `data`, for example
  `c(hinsura = "B_HEALTH_INSURANCE")`.

- to_factor:

  Logical. If `FALSE` (default), `hinsura` remains numeric with
  SPSS-style value-label attributes. If `TRUE`, it is converted to a
  factor using the documented labels. An observed unlabelled code is
  retained as a numeric-text level rather than becoming `NA`.

- to_numeric:

  Logical. Retained for the common apply-label parameter contract.
  `hinsura` is categorical, so this argument does not change it.

- standardize_names:

  Logical. If `FALSE` (default), the source column name is retained
  except for renaming requested through `split_wavecode`. If `TRUE`, the
  matched column is renamed to `hinsura`, `"respnr"` is standardized,
  and `split_wavecode` is always treated as `TRUE`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, `bhinsura` is renamed to
  `hinsura` and a new `"LASA_wave"` column filled with `"B"` is inserted
  immediately after the respondent-number column. It is always treated
  as `TRUE` when `standardize_names = TRUE`.

## Value

`data`, with variable/value-label attributes attached to the matched
LASA018 column, optional factor conversion and canonical renaming, and
`original_labels`/`original_values` attributes preserving the original
SPSS coding. A `"LASA_wave"` column is added when requested. The generic
name-matching audit is attached as `attr(data, "label_report")` and can
be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA018 is documented only for wave B. Column matching tries, in order:
(1) an explicit override in `name_corrections`, (2) an exact
case-sensitive name match, and (3) a case-insensitive exact match. A
missing `bhinsura` column is recorded as `"not found"` in the matching
audit rather than raising an error.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` are part of the parameter contract shared by every
`apply_*_labels()` function in this package. Regardless of conversion,
the matched column keeps its original SPSS value coding in
`attr(x, "original_labels")` and `attr(x, "original_values")`. The
`"respnr"` column is matched in any capitalization and, when
`standardize_names = TRUE`, renamed to `"respnr"`.

## See also

[`apply_lasa017_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa017_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  BHINSURA = c(-5, 1, 3)
)
dat <- apply_lasa018_labels(dat, wave = "B")
attr(dat$BHINSURA, "label")
#> [1] "HEALTH INSURANCE"
attr(dat$BHINSURA, "labels")
#>         no insurance      na, do not know sick-fund: mandatory 
#>                   -5                   -1                    1 
#> sick-fund: voluntary    private Insurance 
#>                    2                    3 
```
