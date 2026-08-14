# Apply LASA145 (Body shape) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the perceived-body-shape variables
documented for LASA145. These cover current and ideal silhouettes, plus
recalled body shape at age 40 where that item was collected.

## Usage

``` r
apply_lasa145_labels(
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

  A data frame or tibble imported from a LASA145 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).

- wave:

  Character scalar identifying the LASA wave. One of `"F"`, `"G"`,
  `"3B"`, or `"MB"`; matching is case-insensitive.

- name_corrections:

  Optional named character vector. Names are canonical suffixes without
  a wave prefix (for example `qcshape`) and values are actual column
  names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors using their
  documented value labels.

- to_numeric:

  Logical. Accepted for the shared interface; LASA145 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. Rename matched columns to lowercase suffixes without the wave
  prefix, standardize the respondent-number column to `respnr`, and add
  `LASA_wave`.

- split_wavecode:

  Logical. Remove the wave prefix from matched column names and add
  `LASA_wave`. Always enabled by `standardize_names = TRUE`.

## Value

`data` with documented metadata applied, optional conversion and
renaming, a `LASA_wave` attribute, and a matching audit in the
`label_report` attribute.

## Details

LASA145 is documented for waves F, G, 3B, and MB. Waves F and G contain
current and ideal body shape; wave 3B additionally contains body shape
at age 40. The MB medical-interview file contains current body shape and
body shape at age 40, using the documented `bm` prefix. Every item uses
silhouette codes 1 through 9 and the `-1` no-valid-data code. The
discrepancy score shown in the same codebook belongs to filecode LASA345
and is not included.

Column matching tries, in order: an explicit `name_corrections`
override, an exact case-sensitive match, and a case-insensitive exact
match. `to_factor = TRUE` converts matched silhouette variables to
factors while retaining observed unlabelled codes as numeric-text
levels. LASA145 has no numeric variables eligible for `to_numeric`
conversion. Original values and value labels are preserved in
`original_values` and `original_labels`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  FQCSHAPE = c(-1, 1, 9),
  fqishape = c(1, 5, 9)
)
dat <- apply_lasa145_labels(dat, wave = "F")
attr(dat$FQCSHAPE, "labels")
#>                 no valid data silhouette 1 (extremely thin) 
#>                            -1                             1 
#>                  silhouette 2                  silhouette 3 
#>                             2                             3 
#>                  silhouette 4                  silhouette 5 
#>                             4                             5 
#>                  silhouette 6                  silhouette 7 
#>                             6                             7 
#>                  silhouette 8     silhouette 9 (very large) 
#>                             8                             9 
```
