# Apply LASA196 (Health literacy) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the 16 Health Literacy Questionnaire
items documented for LASA196 in wave K. Items cover finding,
understanding, judging, and applying treatment, prevention, and
health-promotion information. All use the documented four-level
ease/difficulty response scale and the `-1` not-asked code.

## Usage

``` r
apply_lasa196_labels(
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

  A data frame or tibble imported from a LASA196 `.sav` file.

- wave:

  Character scalar identifying the LASA wave. Only `"K"` is documented;
  matching is case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  wave prefix (for example `mhlq1`) to actual columns.

- to_factor:

  Logical. Convert labelled categorical items to factors.

- to_numeric:

  Logical. Accepted for the shared interface; LASA196 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. Standardize matched names and `respnr`, remove the wave
  prefix, and add `LASA_wave`.

- split_wavecode:

  Logical. Remove the wave prefix and add `LASA_wave`; implied by
  `standardize_names = TRUE`.

## Value

`data` with LASA196 metadata, optional conversion and renaming, the
`LASA_wave` provenance attribute, and a `label_report` matching audit.

## Details

Column matching tries an explicit `name_corrections` override, an exact
case-sensitive match, and a case-insensitive exact match, in that order.
`to_factor = TRUE` converts matched items to factors while retaining
observed undocumented codes as numeric-text levels. LASA196 has no
numeric variables eligible for `to_numeric`. Original values and labels
are preserved, and optional standardized naming removes the wave prefix,
standardizes `respnr`, and adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, KMHLQ1 = c(-1, 1), kmhlq16 = c(2, 4))
apply_lasa196_labels(dat, wave = "K")
#>   RespNr KMHLQ1 kmhlq16
#> 1      1     -1       2
#> 2      2      1       4
```
