# Apply LASA044 (Contact with health/social services) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the health- and social-service variables
documented in LASA044. The implementation covers waves B, C, D, E, 2B,
F, G, H, 3B, MB, I, and J.

## Usage

``` r
apply_lasa044_labels(
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

  A data frame or tibble imported from a LASA044 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Depending on `wave`, names include `blst1k01`, `glst1c1n`, `bfacil`,
  and `ilst2c20`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, or `"J"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA044 suffixes without the wave prefix (for
  example `lst1c01`, `lst1c1n`, `lst2k09`, or `facil`), and values are
  actual column names in `data`.

- to_factor:

  Logical. If `FALSE` (default), variables retain their numeric
  representation with SPSS-style value-label attributes. If `TRUE`,
  categorical variables are converted to factors using the documented
  labels. Observed unlabelled codes remain numeric-text levels.

- to_numeric:

  Logical. If `TRUE`, family-physician contact-count fields are restored
  to plain numeric and negative values are replaced by `NA`. Other
  LASA044 variables remain categorical. This conversion takes precedence
  over `to_factor` for eligible count variables.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA044 columns are renamed to their canonical lowercase suffixes with
  the wave prefix removed; `"respnr"` is standardized; and
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
LASA044 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added when
requested. The generic name-matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA044 changes substantially across waves. Wave B distinguishes knowing
about a service from contacting it and contains 68 variables. Waves C
through G retain the contact series, with a family-physician contact
count added at G. Waves H and 3B use reduced service lists and revised
termination codes. Wave MB adds four accessibility-facility variables,
and waves I and J introduce social-alarm and group-daycare items. The
documented inventories, ordering, routing references, missing codes, and
wording differences are retained for each wave.

Family-physician contact-count fields are numeric measures with
documented negative missing codes and a labelled upper category at 98.
With `to_numeric = TRUE`, these fields are restored to plain numeric and
all observed negative values become `NA`; the value 98 remains 98. Other
LASA044 variables are categorical and are unaffected by `to_numeric`.
With `to_factor = TRUE`, categorical variables become factors and
observed unlabelled codes remain numeric-text levels. For contact
counts, `to_numeric` takes precedence when both conversion options are
requested.

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

[`apply_lasa039_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa039_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  glst1c01 = c(-5, 0, 1),
  glst1c1n = c(-2, 3, 98),
  glst2c01 = c(-3, 0, 1)
)
dat <- apply_lasa044_labels(dat, wave = "G", to_numeric = TRUE)
attr(dat$glst1c01, "labels")
#> na, interview terminated                na, asked            not mentioned 
#>                       -5                       -1                        0 
#>                mentioned 
#>                        1 
```
