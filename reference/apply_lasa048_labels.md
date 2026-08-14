# Apply LASA048 (Children) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to child-record variables documented in
LASA048. The implementation covers waves C, E, 2B, F, 3B, MB, and I.

## Usage

``` r
apply_lasa048_labels(
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

  A data frame or tibble imported from a LASA048 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Depending on `wave`, names include `cnwmem`, `echstat`, `fchmar`,
  `bchtrav`, `kindnr`, and `ichfreq`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"C"`, `"E"`, `"2B"`, `"F"`, `"3B"`,
  `"MB"`, or `"I"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA048 suffixes without the wave prefix (for
  example `chid`, `chstat`, `chage`, `chtrav`, or `nwmem`). For MB's
  unprefixed Dutch names, use `kindnr`, `geslacht`, `leeftijd`,
  `partner`, `afstand`, or `contact`. Values are actual column names.

- to_factor:

  Logical. If `FALSE` (default), variables retain their numeric
  representation with SPSS-style value-label attributes. If `TRUE`,
  categorical variables are converted to factors using the documented
  labels. Observed unlabelled codes remain numeric-text levels.

- to_numeric:

  Logical. If `TRUE`, documented identifiers, ages, distances/travel
  times, ranks, and year fields are restored to plain numeric and
  negative values are replaced by `NA`. Other variables remain
  categorical. This takes precedence over `to_factor` for eligible
  fields.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA048 columns are renamed to their canonical lowercase suffixes with
  the wave prefix removed; `"respnr"` is standardized; and
  `split_wavecode` is always treated as `TRUE`. MB names are already
  unprefixed and therefore remain unchanged.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, matched prefixed columns are
  renamed with their wave prefix removed and a new `"LASA_wave"` column
  filled with `wave` is inserted immediately after the respondent-number
  column. It is always treated as `TRUE` when
  `standardize_names = TRUE`.

## Value

`data`, with variable/value-label attributes attached to every matched
LASA048 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added when
requested. The generic name-matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

The child file was repeatedly redesigned. Wave C contains four network
selection fields. Wave E reconstructs child status across earlier waves.
Wave 2B adds detailed source/status information, and wave F adds marital
history and grandchildren. Wave 3B uses a shorter harmonized child
record, MB is a six-field medical-interview file with Dutch variable
names, and wave I contains extensive reasons for items not being asked.
Each wave's documented inventory, order, wording, sparse codes, and
missing reasons are retained.

This function labels child-level LASA048 variables only. Constructed
respondent-level child summaries stored under filecode 248 are outside
its scope.

Child/network identifiers, ages, travel/distance measures, ranking
fields, and documented year fields are numeric. With
`to_numeric = TRUE`, these fields are restored to plain numeric and all
observed negative values become `NA`; substantive nonnegative values
remain numeric. Other LASA048 variables are categorical and are
unaffected by `to_numeric`. With `to_factor = TRUE`, categorical
variables become factors and observed unlabelled codes remain
numeric-text levels. For eligible numeric fields, `to_numeric` takes
precedence when both conversions are requested.

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

[`apply_lasa047_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa047_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  bchid = c(101, 102, 103),
  bchage = c(-5, 35, 62),
  bchtrav = c(-7, 30, 1440)
)
dat <- apply_lasa048_labels(dat, wave = "3B", to_numeric = TRUE)
attr(dat$bchtrav, "original_labels")
#> not asked (child in network, not in top10) 
#>                                         -7 
#>                           RCF/SYS addition 
#>                                         -5 
#>               not asked (child in network) 
#>                                         -2 
#>                                  no answer 
#>                                         -1 
#>                                    no time 
#>                                          0 
#>                                 30 minutes 
#>                                         30 
#>                                     1 hour 
#>                                         60 
#>                                  >24 hours 
#>                                       1440 
```
