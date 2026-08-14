# Apply LASA033 (Receiving care) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the receiving-care variables documented
in LASA033. All 13 main-interview waves are supported. The exact
inventory is selected by `wave`; it ranges from 80 variables in wave E
to 955 variables in wave H.

## Usage

``` r
apply_lasa033_labels(
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

  A data frame or tibble imported from a LASA033 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Depending on `wave`, names include `bhealth1`, `hrhour201`,
  `iphelp06A`, and `krhelp02B`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA033 suffixes without the wave prefix (for
  example `rhelpyn`, `phlp01y`, or `rhelp02b`), and values are actual
  column names in `data`, for example
  `c(rhelpyn = "receives_personal_care")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their documented labels. An observed value without a
  label remains a numeric-text factor level. Numeric variables are also
  factored unless `to_numeric = TRUE`.

- to_numeric:

  Logical. If `FALSE` (default), documented numeric variables retain
  their SPSS-style missing/routing labels. If `TRUE`, years, counts, and
  hours become ordinary numeric, negative codes become `NA`, and
  non-negative values are retained. Other variables remain categorical.
  This takes precedence over `to_factor` for numeric fields.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA033 columns are renamed to their canonical lowercase suffixes with
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
LASA033 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added when
requested. The generic name-matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

The codebook changes substantially over time. Early waves distinguish
help with personal and domestic care and, except in wave E, who provided
care during illness. Later waves add total weekly hours, nursing,
guidance and administrative help, unmet needs, and control over
caregiving. Waves I/J/K split neighbours from friends; J/K additionally
split children from children-in-law. Wave H contains 660 person-level
variables described as ranges in the PDF. Those ranges are expanded here
in the same documented order: sex and weekly hours for up to five people
in each provider group.

Variables that represent years, counts, or hours are marked as numeric.
With `to_numeric = TRUE`, their negative missing/routing codes become
`NA` and non-negative values are retained. All other variables remain
categorical. Numeric conversion takes precedence over factor conversion.
Wave-H person-level hour variables and helper-count variables have no
value labels in the source; their variable labels or value-label sets
are left correspondingly empty while they remain available for numeric
conversion.

The source PDF also documents LASAH233 constructed scale-score
variables. They belong to filecode 233 and are intentionally not changed
by this LASA033 function.

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

[`apply_lasa032_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa032_labels.md),
[`apply_lasa034_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa034_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  irhelpyn = c(-5, 1, 2),
  irhour01 = c(-4, 4, 12),
  iphelp06A = c(-2, 0, 1)
)
dat <- apply_lasa033_labels(dat, wave = "I")
attr(dat$irhelpyn, "labels")
#> na, terminated interview                na, asked                       no 
#>                       -5                       -1                        1 
#>                      yes              do not know        refused to answer 
#>                        2                        3                        4 
```
