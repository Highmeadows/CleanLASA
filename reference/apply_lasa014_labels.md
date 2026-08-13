# Apply LASA014 (Residence characteristics / Relocation) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to a LASA014 data frame, using the coding
scheme documented for the requested wave. By default variables remain
numeric. Optional arguments can convert categorical variables to
factors, restore count/continuous variables to plain numeric, correct
mismatched source names, and standardize matched names to the canonical
LASA spelling.

## Usage

``` r
apply_lasa014_labels(
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

  A data frame or tibble imported from a LASA014 `.sav` file.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector of manual column overrides. Names are
  canonical LASA014 suffixes without the wave prefix; values are actual
  column names in `data`, for example `c(momonth = "BMOMNTH")`.

- to_factor:

  Logical. If `TRUE`, categorical variables are converted to factors
  using their value labels. Observed but unlabelled values are retained
  as numeric-text levels.

- to_numeric:

  Logical. If `TRUE`, count/continuous variables whose labels consist
  only of negative missing-reason codes are converted to plain numeric
  and negative values are replaced with `NA`. This takes precedence over
  `to_factor` for those variables. LASA014's "constructed" variables
  (e.g. `fdoorc`, `nroomsc`) use negative codes for substantive
  categories rather than missing reasons, so they are never restored to
  numeric even when all their codes are negative.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to their canonical
  lowercase LASA014 documentation names with the wave code removed,
  `"respnr"` (in any capitalization) is renamed to `"respnr"`, and
  `split_wavecode` is always treated as `TRUE` as well, regardless of
  what was passed for `split_wavecode`.

- split_wavecode:

  Logical. If `TRUE`, matched columns are renamed with the wave-letter
  prefix removed (e.g. `bhindep` becomes `hindep`), and a new
  `"LASA_wave"` column, filled with `wave`, is inserted right after
  `"respnr"`. Always treated as `TRUE` when `standardize_names = TRUE`.

## Value

`data`, with variable/value labels applied and a generic
`"label_report"` attribute containing the name-matching audit, plus
reference `original_labels`/`original_values` attributes preserving the
original SPSS value coding regardless of `to_factor`/`to_numeric`
reshaping. A new `"LASA_wave"` column is added after `"respnr"` when
`standardize_names = TRUE` or `split_wavecode = TRUE`.

## Details

LASA014 variable names and codings differ across waves. In particular,
waves B, 2B, 3B, and MB all use a `b` prefix while representing distinct
questionnaires. The `wave` argument is therefore required.

Column matching follows the same contract as
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md):
an explicit `name_corrections` override is tried first, followed by an
exact match and a case-insensitive exact match. Any variable expected
for the selected wave that cannot be matched is recorded as
`"not found"` in the generic labelling audit rather than causing an
error.

The companion LASAB214, LASAC214, and LASAD214 files listed at the end
of the same codebook are not LASA014 files and are therefore outside
this function's scope. The `bospec1`-`bospec6` items are included for
wave 2B, because the codebook explicitly places them in LAS2B014 for
that wave.

Regardless of `to_factor`/`to_numeric`, every matched column also keeps
its original SPSS value coding available as reference attributes –
`attr(x, "original_labels")` and `attr(x, "original_values")` – and the
`"respnr"` column (in any capitalization) is matched and, when
`standardize_names = TRUE`, renamed to `"respnr"`.

## See also

[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md)

## Examples

``` r
dat <- data.frame(BHINDEP = c(1, 2), BMOVED = c(1, 2))
dat <- apply_lasa014_labels(dat, wave = "B")
attr(dat$BHINDEP, "labels")
#>          independent     residential home    nursing h-somatic 
#>                    1                    2                    3 
#>      nursing h-psych             hospital psychiatric hospital 
#>                    4                    5                    6 
#>    monastery (added) 
#>                    8 

dat_factor <- apply_lasa014_labels(
  dat, wave = "B", to_factor = TRUE, standardize_names = TRUE
)
levels(dat_factor$bhindep)
#> NULL
```
