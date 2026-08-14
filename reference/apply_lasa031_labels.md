# Apply LASA031 (Senses) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the vision, hearing, tinnitus, and
related sensory variables documented in LASA031. The function covers all
13 waves and selects the exact main- or medical-interview schema
requested by `wave`. Inventories range from nine variables in wave 2B to
29 in waves J/K.

## Usage

``` r
apply_lasa031_labels(
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

  A data frame or tibble imported from a LASA031 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Depending on `wave`, names include `bsense01`, `gmsens01`, `hmsens7a`,
  `bmsens20`, and `jmsens22b`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA031 suffixes without the wave prefix (for
  example `sense03`, `msens7a`, or `msens22b`), and values are actual
  column names in `data`, for example `c(msens01 = "wears_glasses")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their documented labels. An observed value without a
  label remains a numeric-text factor level. J/K hearing ratings are
  also factored unless `to_numeric = TRUE`.

- to_numeric:

  Logical. If `FALSE` (default), J/K `msens21`, `msens22a`, and
  `msens22b` retain their SPSS-style missing/routing labels. If `TRUE`,
  those 0–9 ratings become ordinary numeric, negative codes become `NA`,
  and non-negative ratings are retained. Other variables remain
  categorical. This takes precedence over `to_factor` for the ratings.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA031 columns are renamed to their canonical lowercase suffixes with
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
LASA031 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added when
requested. The generic name-matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA031 changes substantially over time. Early waves use `sense`
variables; medical-interview waves use `msens`; wave MB contains a
reduced combined with/without-aid questionnaire; and waves J/K split
several hearing items by zero, one, or two hearing aids. The later
schemas also add tinnitus, party-conversation, current-hearing-aid, and
0–9 hearing-rating variables. This function follows each PDF table
independently rather than filling gaps from another wave.

Three conspicuous routing strings are preserved exactly as printed for
auditability: H `msens13` refers to `HMSENS7A1`, 3B `sense05` refers to
`BSENS01`, and J/K `msens04` refers to `J/KMSENS01OF 03????`. The
function does not silently repair those source strings.

By default, matched variables remain numeric with their SPSS-style
labels. With `to_factor = TRUE`, categorical variables become factors
and observed unlabelled codes remain numeric-text levels. The J/K
subjective hearing ratings (`msens21`, `msens22a`, and `msens22b`) are
numeric 0–9 scales: with `to_numeric = TRUE`, their negative
routing/missing codes become `NA` and non-negative ratings are retained.
Other LASA031 variables remain categorical. Numeric conversion takes
precedence over factor conversion for those three ratings.

The source PDF also documents LASA231 constructed vision/hearing
variables. Those variables are intentionally outside LASA031 and are not
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

[`apply_lasa030_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa030_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  hmsens01 = c(-5, 1, 2),
  hmsens7a = c(-5, 1, 6),
  hmsens18 = c(-2, 1, 2)
)
dat <- apply_lasa031_labels(dat, wave = "H")
attr(dat$hmsens7a, "labels")
#>             na, section not done                        na, asked 
#>                               -5                               -1 
#>             no, never had before     yes, possess one without use 
#>                                1                                2 
#>     yes, possess two without use        yes, possess one with use 
#>                                3                                4 
#> yes, possess two with use of one        yes, possess two with use 
#>                                5                                6 
```
