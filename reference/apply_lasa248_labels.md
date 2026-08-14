# Apply LASA248 (Children Summary and Status) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the LASA248 summary and data-status
variables in the LASA048 children codebook. The documented files cover
waves E, 2B, F, 3B, and MB.

## Usage

``` r
apply_lasa248_labels(
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

  A data frame or tibble imported from a LASA248 `.sav` file.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"E"`, `"2B"`, `"F"`, `"3B"`, or `"MB"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (for example `data048`, `nchild`, or `Nrecs048`) to actual
  column names in `data`.

- to_factor:

  Logical. If `TRUE`, categorical variables are converted to factors;
  observed unlabelled codes remain numeric-text levels.

- to_numeric:

  Logical. If `TRUE`, documented child-count variables are converted to
  plain numeric and negative codes become `NA`.

- standardize_names:

  Logical. If `TRUE`, matched names and `respnr` are standardized, wave
  prefixes are removed, and `LASA_wave` is added.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and
  `LASA_wave` is added. Implied by `standardize_names = TRUE`.

## Value

`data` with LASA248 metadata, requested conversions and renaming, the
`LASA_wave` provenance attribute, and a `label_report` matching audit.

## Details

Waves E and F each contain one data-availability/status variable. Waves
2B and 3B contain eight variables describing numbers and types of
children, childlessness, parental status, and completeness of the linked
LASA048 records. MB contains the number of children reported in the
face-to-face demographic interview and the number represented in the
medical-interview LASA048 file. Coding differs materially between 2B and
3B.

Child-count variables are numeric. With `to_numeric = TRUE`, their
negative missing/routing codes become `NA` and their substantive counts
remain plain numeric. The remaining variables are categorical and can be
converted to factors with `to_factor = TRUE`. Original SPSS values and
labels are always retained in `original_values` and `original_labels`.

Column matching uses an explicit `name_corrections` override, an exact
case-sensitive match, and then a case-insensitive exact match.
Standardized naming removes the wave prefix, standardizes `respnr`, and
inserts a `LASA_wave` column.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
[`apply_lasa048_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa048_labels.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:2,
  bnchild = c(-1, 3),
  bchild = c(0, 2)
)
dat <- apply_lasa248_labels(dat, wave = "3B", to_numeric = TRUE)
attr(dat$bchild, "labels")
#>        children? (no answer)                    childless 
#>                           -1                            0 
#> yes; no specific information                     yes, own 
#>                            1                            2 
#>                     yes,step                 yes,own+step 
#>                            3                            4 
#>               yes,only other 
#>                            5 
```
