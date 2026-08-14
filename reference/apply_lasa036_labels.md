# Apply LASA036 (Self-perceived health) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the two or three self-perceived-health
variables documented in LASA036. Twelve waves are supported; the PDF
does not document a wave-MB file.

## Usage

``` r
apply_lasa036_labels(
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

  A data frame or tibble imported from a LASA036 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Names include `bsubhea1`, `bsubhea3`, and `ksubhea4`, depending on
  `wave`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA036 suffixes without the wave prefix
  (`subhea1`, `subhea2`, `subhea3`, or `subhea4`), and values are actual
  column names in `data`, for example
  `c(subhea1 = "current_self_rated_health")`.

- to_factor:

  Logical. If `FALSE` (default), variables remain numeric with
  SPSS-style value-label attributes. If `TRUE`, they are converted to
  factors using the documented labels. An observed value without a label
  remains a numeric-text factor level.

- to_numeric:

  Logical. Accepted for interface consistency. LASA036 has no numeric
  variables eligible for conversion, so this argument does not alter
  matched columns.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA036 columns are renamed to their canonical lowercase suffixes with
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
LASA036 column, optional factor conversion and canonical renaming, and
`original_labels`/`original_values` attributes preserving the original
SPSS coding. A `"LASA_wave"` column is added when requested. The generic
name-matching audit is attached as `attr(data, "label_report")` and can
be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

Every supported wave contains current self-perceived health and health
compared with age peers. Wave 2B additionally asks for a comparison with
ten years ago. Waves F through K instead contain a retrospective health
rating for three (or four) years ago. The age-peer category at code 3 is
printed as `"do not know/just as good"` through wave 3B and as
`"do not know/just as good as other"` from wave F onward; this wording
difference is retained.

All LASA036 variables are categorical. Consequently, `to_numeric` is
accepted for consistency with the shared apply-labels interface but does
not convert these variables. With `to_factor = TRUE`, matched variables
become factors and observed unlabelled codes remain numeric-text levels.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive name match, and (3) a
case-insensitive exact match. Variables documented for the selected wave
but absent from `data` are left untouched and recorded as `"not found"`
in the generic matching audit.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` are part of the parameter contract shared by every
`apply_*_labels()` function in this package. Regardless of conversion,
every matched column keeps its original SPSS coding in
`attr(x, "original_labels")` and `attr(x, "original_values")`. The
`"respnr"` column is matched in any capitalization and, when
`standardize_names = TRUE`, renamed to `"respnr"`.

## See also

[`apply_lasa035_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa035_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  fsubhea1 = c(-5, 1, 5),
  fsubhea2 = c(-1, 2, 4),
  fsubhea4 = c(-1, 3, 5)
)
dat <- apply_lasa036_labels(dat, wave = "F")
attr(dat$fsubhea2, "labels")
#>          na, interview terminated                         na, asked 
#>                                -5                                -1 
#>                       much better                   a little better 
#>                                 1                                 2 
#> do not know/just as good as other                    a little worse 
#>                                 3                                 4 
#>                        much worse 
#>                                 5 
```
