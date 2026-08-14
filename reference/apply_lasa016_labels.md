# Apply LASA016 (Employment Status) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to a LASA016 employment-status data frame.
The function includes all wave-specific variables and all six
classification tables printed in `LASA016_varinfo.pdf`: SBC92
occupational class, month, skill type, job regularity, job type, and
skill/work level.

## Usage

``` r
apply_lasa016_labels(
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

  A data frame or tibble imported from a LASA016 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Expected names include `bjob1`, `gcjclass`, `hpcjsbc`, `ijobs`,
  `jrjobchange01`, and `kretyr01`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA016 suffixes without the wave prefix (for
  example `job1`, `cjclass`, or `pjob6`), and values are actual column
  names in `data`, for example `c(cjclass = "B_CJCLASS")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their value labels. Observed values without a
  codebook label remain numeric-text levels. For the documented
  duplicate J/K `tasks` codes, the first published label is used as the
  factor level and the full mapping remains in `original_labels`.

- to_numeric:

  Logical. If `FALSE` (default), numeric measures retain their
  SPSS-style missing-reason labels. If `TRUE`, numeric measures such as
  hours, years, counts, percentages, ages, source occupation codes, and
  prestige/productivity scores are restored to ordinary numeric vectors;
  negative missing codes become `NA`. This takes precedence over
  `to_factor` for those variables.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA016 columns are renamed to their canonical lowercase suffixes with
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
LASA016 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added when
requested. The generic name-matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA016 changes substantially across waves. Early waves use SBC92 source
variables and retirement modules, 2B adds respondent/father/partner job
histories, H introduces SBC2010 source variables, 3B and MB add last-job
histories, and J/K add job-change, work-ability, absence, and expanded
retirement modules. `wave` is required because B, 2B, 3B, and MB all use
variable names beginning with `"b"` while documenting different schemas.

By default, matched variables retain their imported numeric coding. With
`to_factor = TRUE`, categorical variables use their codebook labels as
factor levels. With `to_numeric = TRUE`, counts, hours, years,
percentages, ages, occupation/prestige scores, and other numeric
measures are restored to plain numeric and negative missing-reason codes
become `NA`.

Two source anomalies are handled transparently. First, the K-wave table
prints the paid-job variable as `kkob1`, although all routing references
call it `KJOB1`. The function treats `kjob1` as canonical and
automatically accepts `kkob1` when that printed spelling is present.
Second, the J/K `tasks` rows assign -1 and -2 both to missing reasons
and to substantive task categories. Their `labels` and `original_labels`
attributes preserve all published entries in order. Because a factor
cannot have two meanings for one numeric code, factor conversion uses
the first published meaning for each duplicated code; the full ambiguous
mapping remains available in `original_labels` for auditing.

Several other routing labels that appear to contain typographical errors
(for example `"na, see G/JOBC"` and selected 3B cross-references) are
also preserved verbatim. This keeps the metadata directly comparable
with the published PDF instead of silently rewriting its wording.

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

[`apply_lasa015_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa015_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  IJOB1 = c(-4, 1, 2),
  IJOBSTAM = c(-3, 1, 12),
  IJOB6 = c(-2, 20, 40)
)
dat <- apply_lasa016_labels(dat, wave = "I")
attr(dat$IJOBSTAM, "labels")
#>  na, wrong skip na, see IJOBC/S       na, asked         January        February 
#>              -3              -2              -1               1               2 
#>           March           April             May            June            July 
#>               3               4               5               6               7 
#>          August       September         October        November        December 
#>               8               9              10              11              12 

dat <- apply_lasa016_labels(
  dat,
  wave = "I",
  to_factor = TRUE,
  to_numeric = TRUE,
  standardize_names = TRUE
)
lasa_label_report(dat, problems_only = TRUE)
#>      suffix expected_name matched_name    method standardized_to
#> 1      jobc         ijobc         <NA> not found            <NA>
#> 2      jobs         ijobs         <NA> not found            <NA>
#> 3   jobstay      ijobstay         <NA> not found            <NA>
#> 4     cjsbc        icjsbc         <NA> not found            <NA>
#> 5   cjclass      icjclass         <NA> not found            <NA>
#> 6   cjlevel      icjlevel         <NA> not found            <NA>
#> 7    cjtype       icjtype         <NA> not found            <NA>
#> 8      job3         ijob3         <NA> not found            <NA>
#> 9     job3a        ijob3a         <NA> not found            <NA>
#> 10     job4         ijob4         <NA> not found            <NA>
#> 11     job5         ijob5         <NA> not found            <NA>
#> 12    job5a        ijob5a         <NA> not found            <NA>
#> 13    job5b        ijob5b         <NA> not found            <NA>
#> 14     job7         ijob7         <NA> not found            <NA>
#> 15  jobstom      ijobstom         <NA> not found            <NA>
#> 16  jobstoy      ijobstoy         <NA> not found            <NA>
#> 17   employ       iemploy         <NA> not found            <NA>
#> 18   disabl       idisabl         <NA> not found            <NA>
#> 19  disablp      idisablp         <NA> not found            <NA>
#> 20  retired      iretired         <NA> not found            <NA>
#> 21  retivol      iretivol         <NA> not found            <NA>
#> 22  workret      iworkret         <NA> not found            <NA>
#> 23    pjob1        ipjob1         <NA> not found            <NA>
#> 24    pjobc        ipjobc         <NA> not found            <NA>
#> 25    pjobs        ipjobs         <NA> not found            <NA>
#> 26   pjstam       ipjstam         <NA> not found            <NA>
#> 27   pjstay       ipjstay         <NA> not found            <NA>
#> 28   pcjsbc       ipcjsbc         <NA> not found            <NA>
#> 29 pcjclass     ipcjclass         <NA> not found            <NA>
#> 30 pcjlevel     ipcjlevel         <NA> not found            <NA>
#> 31  pcjtype      ipcjtype         <NA> not found            <NA>
#> 32    pjob3        ipjob3         <NA> not found            <NA>
#> 33   pjob3a       ipjob3a         <NA> not found            <NA>
#> 34    pjob4        ipjob4         <NA> not found            <NA>
#> 35    pjob5        ipjob5         <NA> not found            <NA>
#> 36   pjob5a       ipjob5a         <NA> not found            <NA>
#> 37   pjob5b       ipjob5b         <NA> not found            <NA>
#> 38    pjob6        ipjob6         <NA> not found            <NA>
#> 39    pjob7        ipjob7         <NA> not found            <NA>
```
