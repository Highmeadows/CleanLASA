# Apply LASA026 (Anxiety/HADS-A) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the seven anxiety items documented in
LASA026. Wave B additionally contains `banxmv`, the number of missing
item values. Wave MB uses medical-interview names (`bmanxiet1` through
`bmanxiet7`); the other documented waves use the `anxiet` suffix.

## Usage

``` r
apply_lasa026_labels(
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

  A data frame or tibble imported from a LASA026 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Expected names include `banxiet1`, `ganxiet7`, `bmanxiet1`, and
  wave-B-only `banxmv`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"F"`, `"G"`,
  `"H"`, `"3B"`, `"MB"`, `"I"`, or `"J"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA026 suffixes without the wave prefix (for
  example `anxiet1`, `manxiet7`, or `anxmv`), and values are actual
  column names in `data`, for example `c(anxiet1 = "tense_last_week")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their documented labels. An observed value without a
  label remains a numeric-text factor level. `banxmv` is also factored
  unless `to_numeric = TRUE`.

- to_numeric:

  Logical. If `FALSE` (default), wave-B `banxmv` retains its SPSS-style
  missing-code labels. If `TRUE`, it becomes ordinary numeric, negative
  missing-reason codes become `NA`, and non-negative counts are
  retained. Anxiety items remain categorical. This takes precedence over
  `to_factor` for `banxmv`.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA026 columns are renamed to their canonical lowercase suffixes with
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
LASA026 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added when
requested. The generic name-matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

All anxiety items use the same four response categories and a -2 routing
label referring to the wave-specific reason-missing variable in LASA226.
Item 4 is marked `"positive"` in its variable label exactly as printed.
The function attaches metadata only and does not reverse-score the item
or compute a total anxiety score.

By default, matched variables remain numeric with their SPSS-style
labels. With `to_factor = TRUE`, they become factors using the
documented response text; observed unlabelled codes remain numeric-text
levels. `banxmv` is a count: with `to_numeric = TRUE`, its negative
missing-reason codes become `NA` and non-negative counts are retained.
The seven anxiety items remain categorical, and numeric conversion takes
precedence over factor conversion for `banxmv`.

The source PDF documents waves B, C, D, E, F, G, H, 3B, MB, I, and J. It
does not contain variable tables for wave 2B or K. The PDF also
documents LASA226 scale scores and reason-missing variables; those are
intentionally outside LASA026 and are not changed by this function.

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

[`apply_lasa025_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa025_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:4,
  ganxiet1 = c(-2, 0, 1, 3),
  ganxiet4 = c(-1, 0, 2, 3)
)
dat <- apply_lasa026_labels(dat, wave = "G")
attr(dat$ganxiet1, "labels")
#> na, see GRMANX in LASAG226                  na, asked 
#>                         -2                         -1 
#>            rarely or never           some of the time 
#>                          0                          1 
#>               occasionally           mostly or always 
#>                          2                          3 
```
