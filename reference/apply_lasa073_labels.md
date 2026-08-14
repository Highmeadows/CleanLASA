# Apply LASA073 (Loneliness) SPSS labels

Attaches the bilingual variable labels and SPSS-style value labels for
the De Jong Gierveld loneliness items documented in LASA073. Waves B, C,
D, and E contain the eleven scale items; B additionally documents
interview mode. Waves F, G, H, 3B, MB, I, and J add a direct loneliness
item and loneliness self-rating. Although LAS2B073 is named in the
codebook header, the PDF does not document any LAS2B073 raw variables;
wave `"2B"` is therefore accepted with an empty file-specific inventory
rather than inferred metadata.

## Usage

``` r
apply_lasa073_labels(
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

  A data frame or tibble imported from a LASA073 `.sav` file.

- wave:

  Character scalar identifying `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`,
  `"F"`, `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, or `"J"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes such as
  `lo1`, `lo11`, `losom`, `lorat`, or `lo_mode` to actual names in
  `data`.

- to_factor:

  Logical. Convert matched categorical variables to factors using the
  documented labels; undocumented observed codes remain levels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA073 has no eligible
  numeric variables.

- standardize_names:

  Logical. Rename matched columns to lowercase canonical suffixes,
  standardize `respnr`, and imply wave splitting.

- split_wavecode:

  Logical. Remove the wave prefix from matched names and insert
  `LASA_wave` immediately after the respondent-number column.

## Value

The labelled data, with requested factor conversion and canonical names,
preserved original coding, a `LASA_wave` attribute, and `label_report`.

## Details

All documented LASA073 variables are categorical. `to_numeric` is
accepted for the shared interface but does not convert them. Matching
tries explicit corrections, exact names, and case-insensitive exact
names. Factor conversion, standardized names, respondent-number
handling, wave splitting, preserved original coding, and `label_report`
use the shared engine.

The same PDF also documents derived scale filecode LASA273. Those
variables are intentionally excluded here and belong to
[`apply_lasa273_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa273_labels.md).

## See also

[`apply_lasa272_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa272_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(blo1 = c(-4, 1, 3), blo2 = c(1, 2, 3))
dat <- apply_lasa073_labels(dat, wave = "B")
attr(dat$blo1, "labels")
#>           refusal/skip by interviewer not asked (interview terminated/skip) 
#>                                    -4                                    -3 
#>                             no answer                                    no 
#>                                    -1                                     1 
#>                          more-or-less                                   yes 
#>                                     2                                     3 
```
