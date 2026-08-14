# Apply LASA038 (Religious beliefs and philosophy) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the religious-belief variables
documented in LASA038. The function covers waves C, D, E, 2B, F, G, H,
3B, MB, I, J, and K. LASA038 does not document wave A or B files.

## Usage

``` r
apply_lasa038_labels(
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

  A data frame or tibble imported from a LASA038 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Depending on `wave`, names include `crelig01`, `drelig1a`, `brelig08`,
  and `krelig8a`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`, `"G"`,
  `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA038 suffixes without the wave prefix (for
  example `relig01`, `relig1a`, `relig8a`, or `rmgl`), and values are
  actual column names in `data`.

- to_factor:

  Logical. If `FALSE` (default), variables remain numeric with
  SPSS-style value-label attributes. If `TRUE`, they are converted to
  factors using the documented labels. An observed value without a label
  remains a numeric-text factor level.

- to_numeric:

  Logical. Accepted for interface consistency. LASA038 has no numeric
  variables eligible for conversion, so this argument does not alter
  matched columns.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA038 columns are renamed to their canonical lowercase suffixes with
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
LASA038 column, optional factor conversion and canonical renaming, and
`original_labels`/`original_values` attributes preserving the original
SPSS coding. A `"LASA_wave"` column is added when requested. The generic
name-matching audit is attached as `attr(data, "label_report")` and can
be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

The wave schemas are not interchangeable. Wave C contains the original
belief, salience, and cosmic-transcendence item sets. Waves D, E, and 2B
add church attendance and prayer frequency, with church denomination
documented only at D. Later waves retain smaller subsets. Wave 3B has
its own interview-termination code, and wave MB uses a distinct church-
membership classification and an eight-category attendance scale. These
differences are preserved exactly as documented.

This function labels only variables stored in the LASA038 files. The
longitudinal church-affiliation variables documented separately in
`LASAz038_varinfo.pdf` and the constructed scales in LASA238 are outside
its scope.

All LASA038 variables are categorical. Consequently, `to_numeric` is
accepted for consistency with the shared apply-labels interface but does
not convert them. With `to_factor = TRUE`, matched variables become
factors and observed unlabelled codes remain numeric-text levels.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive name match, and (3) a
case-insensitive exact match. Variables documented for the selected wave
but absent from `data` are left untouched and recorded as `"not found"`
in the generic matching audit.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` follow the parameter contract shared by the package's
other `apply_*_labels()` functions. Regardless of conversion, every
matched column keeps its original SPSS coding in
`attr(x, "original_labels")` and `attr(x, "original_values")`. The
`"respnr"` column is matched in any capitalization and, when
`standardize_names = TRUE`, renamed to `"respnr"`.

## See also

[`apply_lasa036_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa036_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  frelig1b = c(-2, 1, 6),
  frelig08 = c(-1, 1, 2),
  frelig8a = c(-1, 4, 8)
)
dat <- apply_lasa038_labels(dat, wave = "F")
attr(dat$frelig1b, "labels")
#>        na, see FRMGL            na, asked                never 
#>                   -2                   -1                    1 
#>  once a year or less   a few times a year approx. once a month 
#>                    2                    3                    4 
#> 2 or 3 times a month  once a week or more 
#>                    5                    6 
```
