# Apply LASA011 (Household Composition) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to a LASA011 household-composition data
frame, using the coding scheme documented for the requested wave. By
default, variables remain numeric. Optional arguments allow converting
categorical variables to factors, restoring count variables to plain
numeric, correcting mismatched column names, and standardizing names to
the canonical LASA documentation spelling.

## Usage

``` r
apply_lasa011_labels(
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

  A data frame or tibble imported from a LASA011 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA011 suffixes without the wave prefix (for
  example `nupers` or `hhpart`), and values are the actual column names
  in `data`, for example `c(nupers = "BNUPER")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, every variable not
  restored to numeric by `to_numeric` (see below) is converted to a
  factor using its value labels as levels; observed values without a
  codebook label are retained as numeric-text levels.

- to_numeric:

  Logical. If `FALSE` (default), count variables retain their SPSS-style
  value-label attributes. If `TRUE`, count variables (`nupers`, `hhnch`,
  `hhnstch`, `hhnsib`, `hhnothf`, `hhnnonk`) are converted to ordinary
  numeric vectors, negative missing-reason codes are replaced with `NA`,
  and non-negative counts are retained. This takes precedence over
  `to_factor` for these variables.

- standardize_names:

  Logical. If `FALSE` (default), original column names are retained
  (except for any renaming triggered by `split_wavecode`, see below). If
  `TRUE`, matched LASA011 columns are renamed to their canonical
  lowercase documentation names with the wave code removed, such as
  `nupers`, `hhpart`, or `hhnnonk`, `"respnr"` (in any capitalization)
  is renamed to `"respnr"`, and `split_wavecode` is always treated as
  `TRUE` as well, regardless of what was passed for `split_wavecode`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, matched columns are renamed
  with the wave-letter prefix removed (e.g. `bnupers` becomes `nupers`),
  and a new `"LASA_wave"` column, filled with `wave`, is inserted right
  after `"respnr"`. Always treated as `TRUE` when
  `standardize_names = TRUE`.

## Value

`data`, with variable and value labels attached to every matched LASA011
column, optionally transformed and renamed, plus reference
`original_labels`/`original_values` attributes preserving the original
SPSS value coding regardless of that reshaping. A new `"LASA_wave"`
column is added after `"respnr"` when `standardize_names = TRUE` or
`split_wavecode = TRUE`. A variable-name matching audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA011 changes across waves. Wave B records the total number of persons
in the household; later waves record other household members, excluding
the respondent's partner. From wave F onward, the file also
distinguishes the partner, children, stepchildren, siblings, other
family members, and nonkin household members. `wave` is therefore
required, especially because B, 2B, 3B, and MB all use the variable-name
prefix `"b"`.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive name match, and (3) a
case-insensitive name match. Unmatched documented variables are left
untouched and recorded as `"not found"` in the generic matching audit.

The LASAB211 variables shown in the LASA011 codebook are not processed
by this function because LASAB211 is a separate LASA file code.

Regardless of `to_factor`/`to_numeric`, every matched column also keeps
its original SPSS value coding available as reference attributes –
`attr(x, "original_labels")` and `attr(x, "original_values")` – and the
`"respnr"` column (in any capitalization) is matched and, when
`standardize_names = TRUE`, renamed to `"respnr"`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md)

## Examples

``` r
dat_b <- data.frame(BNUPERS = c(1, 2, -2))
dat_b <- apply_lasa011_labels(dat_b, wave = "B")
attr(dat_b$BNUPERS, "label")
#> [1] "Number of persons in household"
attr(dat_b$BNUPERS, "labels")
#>            na, wrong skip na, not liv independently                      none 
#>                        -3                        -2                         0 

dat_f <- data.frame(
  FHHPart = c(1, 0, -2),
  FHHNCh = c(2, 0, -2)
)
dat_f <- apply_lasa011_labels(
  dat_f,
  wave = "F",
  to_factor = TRUE,
  to_numeric = TRUE,
  standardize_names = TRUE
)
lasa_label_report(dat_f, problems_only = TRUE)
#>    suffix expected_name matched_name    method standardized_to
#> 1  nupers       fnupers         <NA> not found            <NA>
#> 2 hhnstch      fhhnstch         <NA> not found            <NA>
#> 3  hhnsib       fhhnsib         <NA> not found            <NA>
#> 4 hhnothf      fhhnothf         <NA> not found            <NA>
#> 5 hhnnonk      fhhnnonk         <NA> not found            <NA>
#> 6  respnr        respnr         <NA> not found            <NA>
```
