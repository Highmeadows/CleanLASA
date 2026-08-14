# Apply LASA024 (Evaluation Raven) SPSS labels

Attaches the SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) documented for the three LASAB024 Raven
evaluation variables. The variables assess relaxation during the test,
present capability, and expected future capability. They share the same
missing-response codes but use three distinct substantive five-point
scales.

## Usage

``` r
apply_lasa024_labels(
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

  A data frame or tibble imported from a LASAB024 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
  containing some or all of `bmecog1`, `bmecog2`, and `bmecog3`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. LASA024 is documented only for `"B"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA024 suffixes without the `b` prefix (`mecog1`,
  `mecog2`, or `mecog3`), and values are actual column names in `data`,
  for example `c(mecog1 = "raven_relaxation")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their documented labels. An observed value without a
  label remains a numeric-text factor level.

- to_numeric:

  Logical. Retained for the common apply-label parameter contract.
  LASA024 contains no count or continuous variables, so this argument
  does not change the documented categorical variables.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA024 columns are renamed to their canonical lowercase suffixes with
  the `b` prefix removed; `"respnr"` is standardized; and
  `split_wavecode` is always treated as `TRUE`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, matched columns are renamed
  with the `b` prefix removed and a new `"LASA_wave"` column filled with
  `"B"` is inserted immediately after the respondent-number column. It
  is always treated as `TRUE` when `standardize_names = TRUE`.

## Value

`data`, with variable/value-label attributes attached to every matched
LASA024 column, optional factor conversion and canonical renaming, and
`original_labels`/`original_values` attributes preserving the original
SPSS coding. A `"LASA_wave"` column is added when requested. The generic
name-matching audit is attached as `attr(data, "label_report")` and can
be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA024 is documented only for wave B. By default, matched variables
remain numeric with their SPSS-style labels. With `to_factor = TRUE`,
they become factors using the documented response text; observed
unlabelled codes remain numeric-text levels. The variables are
categorical evaluations, so `to_numeric` is retained for the common
function contract but does not change them.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive name match, and (3) a
case-insensitive exact match. Variables absent from `data` are left
untouched and recorded as `"not found"` in the generic matching audit.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` are part of the parameter contract shared by every
`apply_*_labels()` function in this package. Regardless of conversion,
every matched column keeps its original SPSS value coding in
`attr(x, "original_labels")` and `attr(x, "original_values")`. The
`"respnr"` column is matched in any capitalization and, when
`standardize_names = TRUE`, renamed to `"respnr"`.

## See also

[`apply_lasa023_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa023_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  bmecog1 = c(-5, 1, 5),
  bmecog2 = c(-1, 3, 5),
  bmecog3 = c(0, 2, 4)
)
dat <- apply_lasa024_labels(dat, wave = "B")
attr(dat$bmecog1, "labels")
#>     interview broken off no answer, short version         asked, no answer 
#>                       -5                       -4                       -1 
#>                no answer               very tense                   tensed 
#>                        0                        1                        2 
#>   not tense, not relaxed                  relaxed             very relaxed 
#>                        3                        4                        5 
```
