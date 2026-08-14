# Apply LASA045 (Hospitalization) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the hospitalization and
specialist-contact variables documented in LASA045. The implementation
covers waves B, C, D, E, 2B, F, G, H, 3B, MB, I, and J.

## Usage

``` r
apply_lasa045_labels(
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

  A data frame or tibble imported from a LASA045 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Depending on `wave`, names include `bmedspec`, `hpsyhosp`, `jerh`, and
  `jerhn`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, or `"J"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA045 suffixes without the wave prefix (for
  example `medspec`, `hosp`, `psyhosp`, `erh`, or `erhn`), and values
  are actual column names in `data`.

- to_factor:

  Logical. If `FALSE` (default), variables retain their numeric
  representation with SPSS-style value-label attributes. If `TRUE`,
  categorical variables are converted to factors using the documented
  labels. Observed unlabelled codes remain numeric-text levels.

- to_numeric:

  Logical. If `TRUE`, wave J's emergency-room visit count is restored to
  plain numeric and negative values are replaced by `NA`. Other LASA045
  variables remain categorical. This conversion takes precedence over
  `to_factor` for the eligible count variable.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA045 columns are renamed to their canonical lowercase suffixes with
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
LASA045 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added when
requested. The generic name-matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

Waves B through I primarily record recent medical-specialist contact,
hospitalization, psychiatrist contact, and psychiatric hospitalization,
with smaller schemas at 3B and MB. Wave J adds emergency-room contact
and its number of visits. The function retains the documented changes
from zero-based yes/no coding at B to four response categories in
subsequent waves, as well as the wave-specific interview-termination
codes and routing references.

This function labels variables processed into LASA045 only. Specialist
specifications stored under filecode 245 are outside its scope. The
`ziekan` and `seh_reden` fields shown in the PDF are also excluded
because the documentation states that they were not processed into
LASA045 and must be requested separately.

Wave J's emergency-room visit count is numeric and has only negative
missing-reason labels. With `to_numeric = TRUE`, it is restored to plain
numeric and all observed negative values become `NA`. Other LASA045
variables are categorical and are unaffected by `to_numeric`. With
`to_factor = TRUE`, categorical variables become factors and observed
unlabelled codes remain numeric-text levels. For the visit count,
`to_numeric` takes precedence when both conversion options are
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

[`apply_lasa044_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa044_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  jmedspec = c(-4, 1, 2),
  jerh = c(-1, 1, 2),
  jerhn = c(-2, 1, 4)
)
dat <- apply_lasa045_labels(dat, wave = "J", to_numeric = TRUE)
attr(dat$jmedspec, "labels")
#> na, short/terminated interview                      na, asked 
#>                             -4                             -1 
#>                             no                            yes 
#>                              1                              2 
#>                R does not know                        refused 
#>                              3                              4 
```
