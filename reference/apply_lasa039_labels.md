# Apply LASA039 (Lifetime Psychopathology/LIDAS) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the 53 variables documented in the
wave-K LASA039 Lifetime Psychopathology (LIDAS) file.

## Usage

``` r
apply_lasa039_labels(
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

  A data frame or tibble imported from a LASAK039 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Names include `klidascont`, `klidasdepd`, `klidasdepa`, and
  `klidastreatpsy`.

- wave:

  Character scalar identifying the LASA wave. Only `"K"` is documented
  and accepted; matching is case-insensitive.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA039 suffixes without the `k` prefix (for
  example `lidascont`, `lidasdepa`, or `lidastreatpsy`), and values are
  actual column names in `data`.

- to_factor:

  Logical. If `FALSE` (default), variables retain their numeric
  representation with SPSS-style value-label attributes. If `TRUE`,
  categorical variables are converted to factors using the documented
  labels. Observed unlabelled codes remain numeric-text levels.

- to_numeric:

  Logical. If `TRUE`, the 14 age-at-first-diagnosis variables are
  restored to plain numeric and negative values are replaced by `NA`.
  Other LASA039 variables remain categorical. This conversion takes
  precedence over `to_factor` for eligible variables.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA039 columns are renamed to their canonical lowercase suffixes with
  the `k` wave prefix removed; `"respnr"` is standardized; and
  `split_wavecode` is always treated as `TRUE`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, matched columns are renamed
  with their `k` prefix removed and a new `"LASA_wave"` column filled
  with `"K"` is inserted immediately after the respondent-number column.
  It is always treated as `TRUE` when `standardize_names = TRUE`.

## Value

`data`, with variable/value-label attributes attached to every matched
LASA039 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added when
requested. The generic name-matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

The file records contact with psychological care, lifetime
mental-disorder status, and diagnosis/age-at-first-diagnosis/treatment
triplets for 14 disorder groups. It also contains a general
mental-treatment item and eight treatment or medication types. Shared
value cells in the source PDF are applied to every variable covered by
those cells: `lidascont` and `lidasdiag` share one yes/no map, while all
eight `lidastreat*` type variables share one mentioned/not-mentioned
map.

The 14 age-at-first-diagnosis variables are continuous measures whose
only documented value labels are negative missing-reason codes. With
`to_numeric = TRUE`, those fields are restored to plain numeric and all
observed negative values become `NA`. The remaining variables are
categorical and are unaffected by `to_numeric`. With `to_factor = TRUE`,
categorical variables become factors; observed unlabelled codes remain
numeric-text levels. For eligible age variables, `to_numeric` takes
precedence when both conversion options are requested.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive name match, and (3) a
case-insensitive exact match. Variables documented for wave K but absent
from `data` are left untouched and recorded as `"not found"` in the
generic matching audit.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` follow the parameter contract shared by the package's
other `apply_*_labels()` functions. Regardless of conversion, every
matched column keeps its original SPSS coding in
`attr(x, "original_labels")` and `attr(x, "original_values")`. The
`"respnr"` column is matched in any capitalization and, when
`standardize_names = TRUE`, renamed to `"respnr"`.

## See also

[`apply_lasa038_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa038_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  klidasdepd = c(-2, 0, 1),
  klidasdepa = c(-3, 24, 51),
  klidasdept = c(-1, 1, 2)
)
dat <- apply_lasa039_labels(dat, wave = "K", to_numeric = TRUE)
attr(dat$klidasdepd, "labels")
#> na, see klidasdiag          na, asked      not mentioned          mentioned 
#>                 -2                 -1                  0                  1 
```
