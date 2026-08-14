# Apply LASA070 (Social participation) SPSS labels

Attaches the variable labels and SPSS-style value-label maps documented
for LASA070 social-participation files. The codebook covers waves B, C,
D, E, 2B, F, G, H, 3B, MB, I, and J. Inventories differ substantially by
wave: earlier files emphasize organizational membership, visits,
volunteering, cultural activities, study, and age norms; later files add
computer, internet, mobile-phone, IT-support, and altruism items. The
reduced MB file contains migrant-cohort membership-composition and
technology items.

## Usage

``` r
apply_lasa070_labels(
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

  A data frame or tibble imported from a LASA070 `.sav` file.

- wave:

  Character scalar identifying wave `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`,
  `"F"`, `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, or `"J"`. Matching is
  case-insensitive.

- name_corrections:

  Optional named character vector. Names are canonical suffixes without
  a wave prefix (for example `socpyn`, `socp27`, or `sp95f1`); values
  are actual names in `data`.

- to_factor:

  Logical. Convert matched categorical variables to factors with
  documented labels; observed undocumented codes remain text levels.

- to_numeric:

  Logical. Restore matched minutes and age variables to plain numeric,
  replacing negative missing-reason codes with `NA`.

- standardize_names:

  Logical. Rename matched variables to lowercase canonical suffixes,
  standardize `respnr`, and imply wave splitting.

- split_wavecode:

  Logical. Remove matched variables' wave prefix and add a `LASA_wave`
  column immediately after the respondent-number column.

## Value

The labelled data, with optional conversions and standardized names,
preserved original coding, a `LASA_wave` attribute, and `label_report`.

## Details

Labels, codes, routing-specific missing labels, variable order, and the
wave-specific omissions are reproduced from `LASA070_varinfo.pdf`. The
frequency codes used where the document refers to its Visit frequency
table are 1 (almost never) through 7 (every day). Minutes and age fields
are the numeric variables eligible for `to_numeric`; other documented
variables are categorical.

Matching tries `name_corrections`, exact names, then case-insensitive
exact names. Missing documented columns are recorded in `label_report`.
Conversion preserves `original_labels` and `original_values`;
standardized names drop the wave prefix, standardize `respnr`, and
optionally add `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, bsocpyn = c(1, 2), bsocp30 = c(-1, 60))
dat <- apply_lasa070_labels(dat, wave = "B")
attr(dat$bsocpyn, "labels")
#>     interview broken off no answer, short version    no answer, wrong skip 
#>                       -5                       -4                       -3 
#>       no answer, routing         no answer, asked                       no 
#>                       -2                       -1                        1 
#>                      yes 
#>                        2 
```
