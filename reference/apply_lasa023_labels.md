# Apply LASA023 (Everyday memory) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the everyday-memory variables documented
in LASA023. Wave B contains eight task/observation variables plus the
unprefixed `ndays` interview-day variable. Wave F contains only the
handedness observation, with a different coding scheme.

## Usage

``` r
apply_lasa023_labels(
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

  A data frame or tibble imported from a LASA023 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Wave-B names are `bevmem01` through `bevmem08` and `ndays`; wave F
  contains `fevmem08`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. LASA023 is documented for `"B"` and `"F"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA023 suffixes without the wave prefix (for
  example `evmem01`, `ndays`, or `evmem08`), and values are actual
  column names in `data`, for example `c(evmem01 = "pencil_choice")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their documented labels. An observed value without a
  label remains a numeric-text factor level.

- to_numeric:

  Logical. Retained for the common apply-label parameter contract.
  LASA023 contains no count or continuous variables, so this argument
  does not change the documented categorical variables.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA023 columns are renamed to their canonical lowercase suffixes;
  `"respnr"` is standardized; and `split_wavecode` is always treated as
  `TRUE`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, wave-prefixed matched columns
  are renamed with the prefix removed, `ndays` retains its
  already-unprefixed canonical name, and a new `"LASA_wave"` column
  filled with `wave` is inserted immediately after the respondent-number
  column. It is always treated as `TRUE` when
  `standardize_names = TRUE`.

## Value

`data`, with variable/value-label attributes attached to every matched
LASA023 column, optional factor conversion and canonical renaming, and
`original_labels`/`original_values` attributes preserving the original
SPSS coding. A `"LASA_wave"` column is added when requested. The generic
name-matching audit is attached as `attr(data, "label_report")` and can
be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

The codebook spells wave B's interview-day column `ndays`, without the
otherwise consistent `b` wave prefix. The function recognizes that exact
spelling, in any capitalization, automatically. An explicit `ndays`
entry in `name_corrections` still has priority, and a source column
named `bndays` can also be matched through the ordinary shared rules.

By default, matched variables remain numeric with their SPSS-style
labels. With `to_factor = TRUE`, they become factors using the
documented label text; observed unlabelled codes remain numeric-text
levels. All LASA023 variables are categorical task results or
observations, so `to_numeric` is retained for the common function
contract but does not change them.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive name match, and (3) a
case-insensitive exact match. Variables documented for the selected wave
but absent from `data` are left untouched and recorded as `"not found"`
in the generic matching audit.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` are part of the parameter contract shared by every
`apply_*_labels()` function in this package. Regardless of conversion,
every matched column keeps its original SPSS value coding in
`attr(x, "original_labels")` and `attr(x, "original_values")`. The
`"respnr"` column is matched in any capitalization and, when
`standardize_names = TRUE`, renamed to `"respnr"`.

## See also

[`apply_lasa022_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa022_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  bevmem01 = c(-5, 0, 2),
  ndays = c(-5, 0, 2),
  bevmem08 = c(-1, 1, 2)
)
dat <- apply_lasa023_labels(dat, wave = "B")
attr(dat$bevmem01, "labels")
#> na, various reasons           na, asked               wrong     right corrected 
#>                  -5                  -1                   0                   1 
#>               right 
#>                   2 
attr(dat$ndays, "label")
#> [1] "day of interviewing"
```
