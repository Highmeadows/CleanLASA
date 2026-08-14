# Apply LASA245 (Medical Specialists) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the medical-specialist variables
documented as LASA245 in the LASA045 hospitalization codebook. LASA245
specifies the number and types of medical specialists contacted during
the past six months.

## Usage

``` r
apply_lasa245_labels(
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

  A data frame or tibble imported from a LASA245 `.sav` file. Expected
  names include `bimspec#`, `cimspec01`, and `himspec36`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, or `"I"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (for example `imspec01` or `mspec31`) to actual column
  names in `data`.

- to_factor:

  Logical. If `TRUE`, matched specialist-type indicators are converted
  to factors. Observed unlabelled values remain numeric-text levels.

- to_numeric:

  Logical. If `TRUE`, the specialist count is converted to plain numeric
  and its negative missing/routing codes become `NA`.

- standardize_names:

  Logical. If `TRUE`, matched names and `respnr` are standardized, wave
  prefixes are removed, and `LASA_wave` is added.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and
  `LASA_wave` is added. Implied by `standardize_names = TRUE`.

## Value

`data` with LASA245 metadata, requested conversions and renaming, the
`LASA_wave` provenance attribute, and a `label_report` matching audit.

## Details

The available files cover waves B, C, D, E, 2B, F, G, H, 3B, and I. All
waves contain the specialist count and types 01–30. Types 31–32 occur in
B through G but not H, 3B, or I; types 33–34 start in D; type 35 is a
tropical doctor in 2B and a geneticist in F through I; and type 36
occurs only in H, 3B, and I. The source marks MB245 and J245 as not yet
available, so those waves are not accepted here.

The specialist count is numeric and has only documented negative
missing/routing codes. With `to_numeric = TRUE`, it becomes plain
numeric and negative values become `NA`. Specialist-type indicators are
categorical (`not reported`/`reported`) and can be converted to factors.
Original SPSS values and labels are preserved in `original_values` and
`original_labels`.

Column matching uses an explicit `name_corrections` override, an exact
case-sensitive match, and then a case-insensitive exact match.
Standardized naming removes the wave prefix, standardizes `respnr`, and
inserts a `LASA_wave` column.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
[`apply_lasa045_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa045_labels.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:2,
  `bimspec#` = c(-2, 2),
  bimspec01 = c(0, 1),
  check.names = FALSE
)
dat <- apply_lasa245_labels(dat, wave = "B", to_numeric = TRUE)
attr(dat$bimspec01, "labels")
#> na, see BIMSPEC#     not reported         reported 
#>               -2                0                1 
```
