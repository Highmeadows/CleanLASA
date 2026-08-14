# Apply LASA035 (Chronic diseases) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the chronic-disease variables documented
in LASA035 and its separate head-trauma supplement. All 13
main-interview waves are supported. The selected inventories contain
between eight variables in wave MB and 185 variables in wave K.

## Usage

``` r
apply_lasa035_labels(
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

  A data frame or tibble imported from a LASA035 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Depending on `wave`, names include `bcara01`, `hcance5m`, `irh10_1j`,
  and `KCORONA1_LC1`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA035 suffixes without the wave prefix (for
  example `cara01`, `cance5m`, or `corona1_lc1`), and values are actual
  column names in `data`, for example
  `c(cara01 = "chronic_lung_disease")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their documented labels. An observed value without a
  label remains a numeric-text factor level. Numeric variables are also
  factored unless `to_numeric = TRUE`.

- to_numeric:

  Logical. If `FALSE` (default), numeric variables retain their
  SPSS-style missing/routing labels. If `TRUE`, documented numeric
  fields become ordinary numeric, negative codes become `NA`, and
  non-negative values are retained. Other variables remain categorical.
  This takes precedence over `to_factor` for numeric fields.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA035 columns are renamed to their canonical lowercase suffixes with
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
LASA035 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added when
requested. The generic name-matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

The function follows seven independently documented schema families (B,
C, 2B/3B, D–H, MB, I/J, and K). It retains changes in disease-history
coding, month/year fields, tumor and metastasis checklists, joint
surgery, knee pain, hypertension, care-limitation items, and the K-wave
COVID-19 and vaccination questions. The separate head-trauma codebook
contributes four variables to waves D through K.

Repeated `see ...` rows inherit the complete value-label map of the
referenced earlier item. Month, other-disease, and joint-location tables
are expanded to their full documented value sets. Explicit wave-specific
exceptions are applied where a shared PDF table gives different labels
or routing codes for 2B versus 3B, D–F versus G/H, or I versus J.

By default, matched variables remain numeric with their SPSS-style
labels. With `to_factor = TRUE`, categorical variables become factors
and observed unlabelled codes remain numeric-text levels. Age, year,
distance, and other fields whose codebooks contain only negative missing
codes qualify automatically for numeric restoration. Head-trauma counts
and the 0–10 knee-pain scales are also numeric: with
`to_numeric = TRUE`, their negative routing/missing codes become `NA`
and non-negative values are retained. Numeric conversion takes
precedence over factor conversion.

The chronic-disease PDF also documents the derived filecodes 235 and
435. They are intentionally outside LASA035 and are not changed by this
function.

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

[`apply_lasa034_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa034_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  kcara01 = c(-5, 0, 3),
  kkneep2 = c(-3, 0, 10),
  KCORONA1 = c(-5, 1, 2)
)
dat <- apply_lasa035_labels(dat, wave = "K")
attr(dat$kcara01, "labels")
#>               na, see KRMCH                   na, asked 
#>                          -5                          -1 
#>                          no  no, previous interview yes 
#>                           0                           1 
#>  yes, previous interview no yes, previous interview yes 
#>                           2                           3 
```
