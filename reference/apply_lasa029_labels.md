# Apply LASA029 (Meta-emotion) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the four meta-emotion items and
reason-missing variable documented in LASAB029. Each item uses its own
four-level response wording and refers to `brmmeemo` for the -2 routing
code.

## Usage

``` r
apply_lasa029_labels(
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

  A data frame or tibble imported from a LASAB029 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
  containing `bmetaem1` through `bmetaem4` and/or `brmmeemo`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. LASA029 is documented only for `"B"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA029 suffixes without the `b` prefix (`metaem1`
  through `metaem4`, or `rmmeemo`), and values are actual column names
  in `data`, for example `c(metaem1 = "emotional_item")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their documented labels. An observed value without a
  label remains a numeric-text factor level.

- to_numeric:

  Logical. Retained for the common apply-label parameter contract.
  LASA029 contains no count or continuous variables, so this argument
  does not change the documented categorical variables.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA029 columns are renamed to their canonical lowercase suffixes with
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
LASA029 column, optional factor conversion and canonical renaming, and
`original_labels`/`original_values` attributes preserving the original
SPSS coding. A `"LASA_wave"` column is added when requested. The generic
name-matching audit is attached as `attr(data, "label_report")` and can
be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA029 is documented only for wave B. By default, matched variables
remain numeric with their SPSS-style labels. With `to_factor = TRUE`,
they become factors using the documented response text; observed
unlabelled codes remain numeric-text levels. All five variables are
categorical, so `to_numeric` is retained for the common function
contract but does not change them.

The same source PDF also documents the self-administered LAS2B143
version, whose variable names and some labels differ. Those filecode-143
variables are intentionally outside LASA029 and are not changed by this
function.

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

[`apply_lasa028_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa028_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:4,
  bmetaem1 = c(-2, 1, 3, 4),
  bmetaem3 = c(-1, 1, 2, 4),
  brmmeemo = c(-2, 1, 2, 5)
)
dat <- apply_lasa029_labels(dat, wave = "B")
attr(dat$bmetaem1, "labels")
#>         na, see BRMMEEMO                na, asked absolutely not emotional 
#>                       -2                       -1                        1 
#>       a little emotional         fairly emotional           very emotional 
#>                        2                        3                        4 
```
