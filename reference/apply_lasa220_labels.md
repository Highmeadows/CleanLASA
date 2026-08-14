# Apply LASA220 (Digit Span total scores) SPSS labels

Attaches SPSS-style variable and value labels to the six constructed
Digit Span variables documented in the LAS3B220 section of the LASA020
codebook. The inventory contains the total correct score, forward and
backward correct scores, forward and backward spans, and the
reason-missing field.

## Usage

``` r
apply_lasa220_labels(
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

  A data frame or tibble imported from a LAS3B220 `.sav` file.

- wave:

  Character scalar identifying wave `"3B"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes such as
  `dstot` or `rmds` to actual columns.

- to_factor:

  Logical. Convert variables carrying value labels to factors, unless
  numeric restoration takes precedence.

- to_numeric:

  Logical. Restore the five score variables to plain numeric and replace
  negative codes with `NA`.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove the wave
  prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove the wave prefix and add `LASA_wave`; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASA220 metadata, optional conversion and renaming, the
`LASA_wave` attribute, and a `label_report` matching audit.

## Details

LASA220 is documented only for wave 3B. The five score variables use the
`-2` no-score and `-1` too-many-missings codes and are eligible for
numeric restoration: `to_numeric = TRUE` removes their value labels and
converts negative values to `NA`. The reason field remains categorical.
`to_factor = TRUE` applies the documented labels while preserving
observed undocumented values. Matching tries corrections, exact names,
and then case-insensitive exact names. Standardized naming removes the
`b` prefix, standardizes `respnr`, and adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, BDSTOT = c(-1, 12), BRMDS = c(3, -2))
apply_lasa220_labels(dat, wave = "3B", to_numeric = TRUE)
#>   RespNr BDSTOT BRMDS
#> 1      1     NA     3
#> 2      2     12    -2
```
