# Apply LASA047 (Network domain identification and significance) labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to member-level social-network variables
documented in LASA047. The implementation covers waves B, C, D, E, 2B,
F, G, H, 3B, I, J, and K; the PDF does not document an MB file.

## Usage

``` r
apply_lasa047_labels(
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

  A data frame or tibble imported from a LASA047 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Depending on `wave`, names include `bnwmem`, `gnwtrav`, `bnwmsupp`,
  and `knwconf`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA047 suffixes without the wave prefix (for
  example `nwmem`, `nwtype`, `nwtrav`, `emo_rec`, or `nwconf`), and
  values are actual column names in `data`.

- to_factor:

  Logical. If `FALSE` (default), variables retain their numeric
  representation with SPSS-style value-label attributes. If `TRUE`,
  categorical variables are converted to factors using the documented
  labels. Observed unlabelled codes remain numeric-text levels.

- to_numeric:

  Logical. If `TRUE`, `nwmem`, `freqran`, and `nwtrav` are restored to
  plain numeric and negative values are replaced by `NA`. Other LASA047
  variables remain categorical. This conversion takes precedence over
  `to_factor` for eligible numeric fields.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA047 columns are renamed to their canonical lowercase suffixes with
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
LASA047 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added when
requested. The generic name-matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

The file contains one record for each nominated network member. It
records the nomination domain, household status, relationship type,
contact frequency, travel time, support-question order, and four types
of support. Wave B additionally contains partner status and
most-supportive-member indicators. Later waves contain confidant
identification instead. The ranking-tie variable `random` is present
only through wave G.

This function labels variables stored in the member-level LASA047 files
only. Network-size and aggregate variables stored under constructed
filecode 247 are outside its scope.

`nwmem`, `freqran`, and `nwtrav` are numeric identifiers, ranks, or
measurements. With `to_numeric = TRUE`, these fields are restored to
plain numeric and all observed negative values become `NA`; substantive
values such as travel-time boundaries 0, 60, and 1440 remain numeric.
Other LASA047 variables are categorical and are unaffected by
`to_numeric`. With `to_factor = TRUE`, categorical variables become
factors and observed unlabelled codes remain numeric-text levels. For
eligible numeric fields, `to_numeric` takes precedence when both
conversions are requested.

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

[`apply_lasa045_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa045_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  gnwmem = c(10101, 10102, 10103),
  gnwfreq = c(-6, 4, 8),
  gnwtrav = c(-7, 60, 1440)
)
dat <- apply_lasa047_labels(dat, wave = "G", to_numeric = TRUE)
attr(dat$gnwfreq, "labels")
#>               NA: see 247          RCF/SYS addition                 no answer 
#>                        -6                        -3                        -1 
#>                     never      yearly or less often            few times year 
#>                         1                         2                         3 
#>                   monthly        once every 2 weeks                    weekly 
#>                         4                         5                         6 
#>            few times week daily or household member 
#>                         7                         8 
```
