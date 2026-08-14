# Apply LASA182 (thyroid, back pain, bedridden) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the thyroid, back-pain, and
confinement-to-bed variables documented for LASA182.

## Usage

``` r
apply_lasa182_labels(
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

  A data frame or tibble imported from a LASA182 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).

- wave:

  Character scalar identifying the LASA wave. One of `"C"`, `"D"`,
  `"E"`, `"F"`, `"G"`, `"H"`, or `"3B"`; matching is case-insensitive.

- name_corrections:

  Optional named character vector. Names are canonical suffixes without
  a wave prefix (for example `mbackp`) and values are actual column
  names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors using their
  documented value labels.

- to_numeric:

  Logical. Accepted for the shared interface; LASA182 has no numeric
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

LASA182 is documented for waves C, D, E, F, G, H, and 3B. Thyroid status
occurs in C and D; back-pain occurrence and duration occur in C through
E; and confinement to bed occurs in C, D, F, G, H, and 3B. Wave C
additionally contains indicators for confinement before age 25, after
age 25, and during the past year. Coding and routing-missing values
follow the wave-specific tables in the codebook.

Column matching tries, in order: an explicit `name_corrections`
override, an exact case-sensitive match, and a case-insensitive exact
match. `to_factor = TRUE` converts matched categorical variables to
factors while retaining observed unlabelled codes as numeric-text
levels. LASA182 has no variables eligible for `to_numeric` conversion.
Original values and value labels are preserved in `original_values` and
`original_labels`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(CMBACKP = c(-1, 1, 2), cmbackpd = c(-2, 1, 3))
dat <- apply_lasa182_labels(dat, wave = "C")
attr(dat$CMBACKP, "labels")
#> na, interview terminated                na, asked                       no 
#>                       -5                       -1                        1 
#>                      yes 
#>                        2 
```
