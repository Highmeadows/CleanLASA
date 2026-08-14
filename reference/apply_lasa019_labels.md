# Apply LASA019 (Income Evaluation) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to a LASA019 income-evaluation data frame,
using the wording, currency bands, routing references, and missing-value
codes documented for the requested wave. By default, matched variables
remain numeric. Optional arguments allow converting categorical
variables to factors, restoring the year of a major income decline to
plain numeric, correcting mismatched column names, and standardizing
names.

## Usage

``` r
apply_lasa019_labels(
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

  A data frame or tibble imported from a LASA019 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Expected wave-prefixed names include `bincdecl`, `cincdclm`,
  `gincdcly`, and `kincsat1`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA019 suffixes without the wave prefix (for
  example `incdecl`, `incdcly`, or `incsat1`), and values are actual
  column names in `data`, for example `c(incdecl = "B_INCOME_DECLINE")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their documented value labels. Observed values
  without a label remain numeric-text factor levels.

- to_numeric:

  Logical. If `FALSE` (default), `incdcly` retains its SPSS-style
  missing-reason labels. If `TRUE`, it is restored to ordinary numeric,
  negative missing-reason codes become `NA`, and non-negative years are
  retained. This takes precedence over `to_factor` for `incdcly`; the
  month and evaluation variables remain categorical.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA019 columns are renamed to their canonical lowercase suffixes with
  the wave code removed; `"respnr"` is standardized; and
  `split_wavecode` is always treated as `TRUE`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, matched columns are renamed
  with the wave prefix removed and a new `"LASA_wave"` column filled
  with `wave` is inserted immediately after the respondent-number
  column. It is always treated as `TRUE` when
  `standardize_names = TRUE`.

## Value

`data`, with variable/value-label attributes attached to every matched
LASA019 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added when
requested. The generic name-matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA019 changes across waves. Wave B asks about the last five years and
uses guilder bands; C/D ask about the last three years and add
month/year follow-ups; E/F contain only satisfaction items; 2B uses
detailed euro bands; G through K use broader euro bands; 3B documents
month/year follow-ups but does not print month value labels; and MB
again contains a smaller item set. `wave` is required because B, 2B, 3B,
and MB all use variable names beginning with `"b"` while their schemas
differ.

In the shared G/H/I/J/K table, J and K replace the general routing label
for `incdecl` with `"na, see J/KINCCAT"`; the function applies that
wave-specific override. For 3B, only the printed negative labels are
attached to `incdclm`; unprinted month names are not inferred.

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

[`apply_lasa018_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa018_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  GINCDECL = c(-5, 1, 7),
  GINCDCLM = c(-2, 1, 12),
  GINCDCLY = c(-2, 2018, 2022),
  GINCSAT1 = c(-5, 1, 5)
)
dat <- apply_lasa019_labels(dat, wave = "G")
attr(dat$GINCDECL, "labels")
#>         na, refused   na, short version      na, wrong skip  no answer, routing 
#>                  -5                  -4                  -3                  -2 
#>           na, asked                  no      yes, < 45 euro  yes, 45 - 136 euro 
#>                  -1                   1                   2                   3 
#> yes, 136 - 227 euro yes, 227 - 318 euro yes, 318 - 410 euro     yes, > 410 euro 
#>                   4                   5                   6                   7 
```
