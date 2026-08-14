# Apply LASA025 (Depression/CES-D) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the 20 Center for Epidemiologic Studies
Depression Scale (CES-D) items documented in LASA025. All 13 waves use
the same item wording and four response categories; the -2 routing label
is expanded to the wave-specific reason-missing variable and LASA225
file.

## Usage

``` r
apply_lasa025_labels(
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

  A data frame or tibble imported from a LASA025 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
  containing wave-prefixed variables `cesd01` through `cesd20`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA025 suffixes without the wave prefix (for
  example `cesd01` or `cesd20`), and values are actual column names in
  `data`, for example `c(cesd01 = "bothered_last_week")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their documented labels. An observed value without a
  label remains a numeric-text factor level.

- to_numeric:

  Logical. Retained for the common apply-label parameter contract.
  LASA025 contains categorical CES-D item responses, not count or
  continuous variables, so this argument does not change them.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA025 columns are renamed to their canonical lowercase suffixes with
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
LASA025 column, optional factor conversion and canonical renaming, and
`original_labels`/`original_values` attributes preserving the original
SPSS coding. A `"LASA_wave"` column is added when requested. The generic
name-matching audit is attached as `attr(data, "label_report")` and can
be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

Items 4, 8, 12, and 16 are marked `"positive"` in their variable labels,
exactly as in the codebook. The function attaches metadata only and does
not reverse-score those items or compute a CES-D total.

By default, matched variables remain numeric with their SPSS-style
labels. With `to_factor = TRUE`, they become factors using the
documented response text; observed unlabelled codes remain numeric-text
levels. The items are categorical responses, so `to_numeric` is retained
for the common function contract but does not change them.

The source PDF also documents LASA225 total scores and reason-missing
variables. Those variables are intentionally outside LASA025 and are not
changed by this function.

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

[`apply_lasa024_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa024_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:4,
  gcesd01 = c(-2, 0, 1, 3),
  gcesd04 = c(-1, 0, 2, 3)
)
dat <- apply_lasa025_labels(dat, wave = "G")
attr(dat$gcesd01, "labels")
#> na, see GRMCESD in LASAG225                   na, asked 
#>                          -2                          -1 
#>             rarely or never            some of the time 
#>                           0                           1 
#>                occasionally            mostly or always 
#>                           2                           3 
```
