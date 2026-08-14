# Apply LASA074 (Vignettes about help) SPSS labels

Attaches the variable and value labels documented for the 52 LASAD074
vignettes-about-help variables. The D-wave file contains vignette
sequence variables; original and condensed responses about Mary, Sophia,
Emily, and John; and variables describing equality across the four
vignette children.

## Usage

``` r
apply_lasa074_labels(
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

  A data frame or tibble imported from LASAD074.

- wave:

  Character scalar identifying wave `"D"`; matching is case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  `d` prefix (for example `vigseq`, `vigm1`, or `vigeqc`) to actual
  column names in `data`.

- to_factor:

  Logical. Convert matched value-labelled variables to factors; observed
  undocumented codes remain numeric-text levels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA074 has no eligible
  numeric variables.

- standardize_names:

  Logical. Rename matched columns to canonical lowercase suffixes,
  standardize `respnr`, and imply wave splitting.

- split_wavecode:

  Logical. Remove the `d` prefix from matched names and add `LASA_wave`
  after the respondent-number column.

## Value

The labelled data, with requested factor conversion and canonical names,
preserved original coding, `LASA_wave`, and `label_report`.

## Details

The original response maps preserve vignette-specific structural-missing
codes, including the documented `corrected2yes`,
equal-to-other-children, and `no@dvig*1` labels. Sequence permutations
and decimal-comma equality codes are reproduced as numeric SPSS values.
The routing variable `dvigeqr` is documented as having no value-label
map and is left unlabelled by value.

All LASA074 variables are treated as categorical; `to_numeric` is
accepted for interface consistency but does not convert them. The
total-score variable in LASAD274, documented in the same PDF, is
intentionally excluded and belongs to
[`apply_lasa274_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa274_labels.md).

Matching tries `name_corrections`, exact names, then case-insensitive
exact names. Factor conversion and standardized-name/wave splitting
preserve the original coding and use the shared `label_report` audit.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(dvigseq1 = c(1, 4), dvigm1 = c(-2, 2))
dat <- apply_lasa074_labels(dat, wave = "D")
attr(dat$dvigm1, "labels")
#>           do not know             no answer                    no 
#>                    -2                    -1                     1 
#>                   yes equal to oth children 
#>                     2                     3 
```
