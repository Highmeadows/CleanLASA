# Apply LASAzdc3 (Diabetes Mellitus Algorithm) SPSS labels

Attaches SPSS-style variable and value labels to the three diabetes
mellitus algorithm variables documented for LASAzdc3. The Z-file
contains the 3B-cohort diabetes status (`b_DM`), the I-wave status with
dropouts defined (`i_DM`), and the unadjusted I-wave algorithm result
(`i_alg_DM_ruw`).

## Usage

``` r
apply_lasazdc3_labels(
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

  A data frame or tibble imported from a LASAzdc3 `.sav` file.

- wave:

  Character scalar identifying wave `"Z"`.

- name_corrections:

  Optional named character vector mapping documented names such as
  `b_DM` or `i_alg_DM_ruw` to actual columns.

- to_factor:

  Logical. Convert variables carrying value labels to factors while
  retaining observed undocumented values.

- to_numeric:

  Logical. Request numeric restoration for eligible variables. LASAzdc3
  has no eligible variables.

- standardize_names:

  Logical. Standardize matched names and `respnr` and add `LASA_wave`.

- split_wavecode:

  Logical. Add `LASA_wave` and standardize matched names; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASAzdc3 metadata, optional factor conversion and renaming,
the `LASA_wave` attribute, and a `label_report` matching audit.

## Details

LASAzdc3 is a wave-Z file. All three variables are categorical: status
codes distinguish missing, no diabetes, definite diabetes, possible
diabetes, and contradictory information; the two I-wave fields
additionally define code 5 as dropout. Therefore none is eligible for
`to_numeric` restoration. `to_factor = TRUE` applies the documented
category text while retaining observed undocumented codes. Matching
tries corrections, exact names, and then case-insensitive exact names.
Standardized naming lowercases the documented names, standardizes
`respnr`, and adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, b_DM = c(0, 1), i_DM = c(1, 5))
apply_lasazdc3_labels(dat, wave = "Z", to_factor = TRUE)
#>   RespNr        b_DM        i_DM
#> 1      1       no DM definite DM
#> 2      2 definite DM    drop-out
```
