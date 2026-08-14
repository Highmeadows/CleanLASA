# Apply LASA103 (Singing and making music) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the singing-and-music variables
documented in LASA103 for waves H, I, and J.

## Usage

``` r
apply_lasa103_labels(
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

  A data frame or tibble imported from a LASA103 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Depending on `wave`, names include `hqmus1`, `iqsmus1`, `jqmussl`,
  `jqmussl_y1`, and `jqmuslc`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"H"`, `"I"`, or `"J"`.

- name_corrections:

  Optional named character vector mapping canonical LASA103 suffixes
  without the wave prefix (for example `qmus1`, `qsmus1`, `qmussl`, or
  `qmussl_y1`) to actual column names in `data`.

- to_factor:

  Logical. If `TRUE`, categorical variables with documented value labels
  are converted to factors. Observed unlabelled codes remain
  numeric-text levels.

- to_numeric:

  Logical. If `TRUE`, documented counts, frequencies, durations, ages,
  years, and other numeric fields are restored to plain numeric and
  negative values are replaced by `NA`.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column containing the selected wave is inserted
  immediately after the respondent-number column.

## Value

`data`, with LASA103 variable/value labels, optional conversion and
standardized naming, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

Waves H and I share a 12-variable self-administered-questionnaire
schema: making music, instrument type, singing, frequency and duration,
six music genres, and an open specification for another genre. Wave J
uses a 29-variable schema covering music or singing lessons for up to
six instruments (including voice), current music-making, whether this is
done alone or with others, music listening, and concert attendance.

Frequencies, durations, ages, years, counts, and variables whose only
documented codes are negative missing-reason codes are eligible for
`to_numeric`. With `to_numeric = TRUE`, these fields are restored to
plain numeric and observed negative values become `NA`. Free-text
instrument and genre-specification fields are not converted. With
`to_factor = TRUE`, categorical variables become factors and observed
unlabelled codes remain numeric-text levels. `to_numeric` takes
precedence for eligible fields.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive match, and (3) a
case-insensitive exact match. Variables documented for the selected wave
but absent from `data` are recorded as `"not found"` in the matching
audit.

The shared reshaping arguments preserve each matched column's original
SPSS coding in `original_labels` and `original_values`. When requested,
matched names are standardized by removing the wave prefix, `respnr` is
standardized, and a `LASA_wave` column is inserted.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, hqmus1 = c(1, 2), hqmus4 = c(-2, 5))
dat <- apply_lasa103_labels(dat, wave = "H", to_numeric = TRUE)
attr(dat$hqmus1, "labels")
#> no answer        no       yes 
#>        -1         1         2 
```
