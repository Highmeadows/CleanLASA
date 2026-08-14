# Apply LASA135 (EuroQol/VAS) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the six EuroQol variables documented in
LASA135 for waves E, F, G, H, 3B, and I.

## Usage

``` r
apply_lasa135_labels(
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

  A data frame or tibble imported from a LASA135 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Documented names run from `eqeq5d1` through `eqeqvas` in wave E, with
  the corresponding `f`, `g`, `h`, `b` (3B), or `i` prefix in later
  files.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"E"`, `"F"`, `"G"`, `"H"`, `"3B"`, or
  `"I"`.

- name_corrections:

  Optional named character vector mapping canonical LASA135 suffixes
  without the wave prefix (`qeq5d1` through `qeq5d5`, or `qeqvas`) to
  actual column names in `data`.

- to_factor:

  Logical. If `TRUE`, variables with documented value labels are
  converted to factors. Observed unlabelled codes remain numeric-text
  levels.

- to_numeric:

  Logical. If `TRUE`, EQVAS is restored to plain numeric and negative
  values are replaced by `NA`.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column containing the selected wave is inserted
  immediately after the respondent-number column.

## Value

`data`, with LASA135 variable/value labels, optional conversion and
standardized naming, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

The inventory contains the five three-level EQ-5D dimensions (mobility,
self-care, usual activities, pain/discomfort, and anxiety/depression)
and the 0–100 EQ visual analogue scale. The two TTO index variables
shown in the same source document belong to the separate LASA335
scale-score file and are intentionally not labelled by this LASA135
function.

The EQ-5D dimensions are categorical. The EQVAS score is numeric and its
documented -1 missing code becomes `NA` when `to_numeric = TRUE`. With
`to_factor = TRUE`, variables carrying value labels become factors and
observed unlabelled codes remain numeric-text levels. `to_numeric` takes
precedence for EQVAS.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive match, and (3) a
case-insensitive exact match. Variables absent from `data` are recorded
as `"not found"` in the matching audit. Original labels and values are
preserved, and optional standardized naming removes the wave prefix,
standardizes `respnr`, and adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, eqeq5d1 = c(1, 2), eqeqvas = c(-1, 80))
dat <- apply_lasa135_labels(dat, wave = "E", to_numeric = TRUE)
attr(dat$eqeq5d1, "labels")
#>             no answer   no problems walking some problems walking 
#>                    -1                     1                     2 
#>       confined to bed 
#>                     3 
```
