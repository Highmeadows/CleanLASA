# Apply LASA028 (Perceived self-efficacy/ALCOS) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the 12 ALCOS perceived-self-efficacy
items and four missing-value counts documented in LASA028. All 12 waves
use the same item wording and five-point agreement scale; the -2 routing
metadata is expanded to the wave-specific reason-missing variable and
LASA228 file.

## Usage

``` r
apply_lasa028_labels(
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

  A data frame or tibble imported from a LASA028 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
  containing wave-prefixed `alcos01` through `alcos12` and up to four
  missing-count variables.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA028 suffixes without the wave prefix (for
  example `alcos01`, `alcmv`, or `compmv`), and values are actual column
  names in `data`, for example `c(alcos01 = "plans_item")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their documented labels. An observed value without a
  label remains a numeric-text factor level. Missing-value counts are
  also factored unless `to_numeric = TRUE`.

- to_numeric:

  Logical. If `FALSE` (default), the four missing-value counts retain
  their SPSS-style missing/routing label. If `TRUE`, they become
  ordinary numeric, negative codes become `NA`, and non-negative counts
  are retained. ALCOS items remain categorical. This takes precedence
  over `to_factor` for count variables.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA028 columns are renamed to their canonical lowercase suffixes with
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
LASA028 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added when
requested. The generic name-matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

The source prints the neutral response as `"no disagreement/agreement"`
for wave B and `"no disagreement/ agreement"` for later waves. This
function preserves that spacing difference exactly.

By default, matched variables remain numeric with their SPSS-style
labels. With `to_factor = TRUE`, they become factors using the
documented response text; observed unlabelled codes remain numeric-text
levels. The four missing-value variables are counts: with
`to_numeric = TRUE`, their -2 missing/routing code becomes `NA` and
non-negative counts are retained. ALCOS item responses remain
categorical, and numeric conversion takes precedence over factor
conversion for the count variables.

The source PDF also documents LASA228 constructed scale scores and
reason-missing variables. Those variables are intentionally outside
LASA028 and are not changed by this function.

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

[`apply_lasa026_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa026_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:4,
  galcos01 = c(-2, 1, 3, 5),
  galcmv = c(-2, 0, 1, 4)
)
dat <- apply_lasa028_labels(dat, wave = "G")
attr(dat$galcos01, "labels")
#> na, see GRMALC in LASAG228                  na, asked 
#>                         -2                         -1 
#>          strongly disagree                   disagree 
#>                          1                          2 
#> no disagreement/ agreement                      agree 
#>                          3                          4 
#>             strongly agree 
#>                          5 
```
