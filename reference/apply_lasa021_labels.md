# Apply LASA021 (Memory complaints and MMSE) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the memory-complaint and Mini-Mental
State Examination variables documented in LASA021. The function covers
all 13 documented waves. Standard waves contain two memory questions and
23 MMSE items; wave MB additionally contains an MMSE-version variable
and 22 items from the illiterate MMSE, whose item 12 is not present in
the codebook.

## Usage

``` r
apply_lasa021_labels(
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

  A data frame or tibble imported from a LASA021 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Standard-wave names include `bmemory1` and `bmmse01` through
  `bmmse23`; wave MB can additionally contain `bmmsevrs` and `bimmse01`
  through `bimmse23`, excluding `bimmse12`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA021 suffixes without the wave prefix (for
  example `memory1`, `mmse12`, or `immse23`), and values are actual
  column names in `data`, for example `c(memory1 = "memory_problem")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their documented labels. An observed value without a
  label remains a numeric-text factor level.

- to_numeric:

  Logical. If `FALSE` (default), bounded right-answer counts retain
  their SPSS-style value labels. If `TRUE`, those counts are restored to
  ordinary numeric, negative missing-reason codes become `NA`, and
  non-negative counts are retained. Binary items remain categorical.
  This takes precedence over `to_factor` for count items.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA021 columns are renamed to their canonical lowercase suffixes with
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
LASA021 column, optional factor conversion and canonical renaming, and
`original_labels`/`original_values` attributes preserving the original
SPSS coding. A `"LASA_wave"` column is added when requested. The generic
name-matching audit is attached as `attr(data, "label_report")` and can
be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

The coding changes after waves B/C. From D onward, memory question 1 and
the primary MMSE items add a -2 routing code referring to the
wave-specific MMSE score in LASA221. MMSE orientation items 02 through
10 instead refer to item 01. Wave MB uses `bmmsevrs` routing and has
distinct item wording, including subtraction of 3 and days in reverse
order. These differences are selected from `wave`; no labels are
inferred across wave schemas.

By default, matched variables remain numeric with their SPSS labels.
With `to_factor = TRUE`, they become factors using the documented label
text; observed unlabelled codes remain numeric-text levels. With
`to_numeric = TRUE`, the bounded right-answer counts are restored to
plain numeric, negative missing-reason codes become `NA`, and
non-negative counts are retained. Binary wrong/correct and no/yes items
remain categorical. Numeric conversion takes precedence over factor
conversion for count items.

The source PDF also documents LASA221 (the maximum spelling/subtraction
MMSE score) and LASA421 (separate subtraction and spelling scores).
Those filecodes are intentionally outside LASA021 and their variables
are not changed by this function.

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

[`apply_lasa020_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa020_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  gmemory1 = c(-2, 1, 2),
  gmmse01 = c(-2, 1, 2),
  gmmse11 = c(-2, 1, 3)
)
dat <- apply_lasa021_labels(dat, wave = "G")
attr(dat$gmemory1, "labels")
#> na, see GMMSESC in LASAG221                   na, asked 
#>                          -2                          -1 
#>                          no                         yes 
#>                           1                           2 
attr(dat$gmmse11, "label")
#> [1] "MMSE item11: Three objects"

mb <- data.frame(bmmsevrs = c(-2, 1, 2), bimmse01 = c(-2, 1, 2))
mb <- apply_lasa021_labels(mb, wave = "MB", to_factor = TRUE)
levels(mb$bimmse01)
#> [1] "na, see BMMSEVRS" "na, asked"        "wrong"            "correct"         
```
