# Apply LASA148 (Medical decisions about life) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the fifteen medical-decision variables
documented for LASA148. Five items identify who should decide about
treatment at the end of life, and ten items record treatment preferences
in cancer and dementia vignettes.

## Usage

``` r
apply_lasa148_labels(
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

  A data frame or tibble imported from a LASA148 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).

- wave:

  Character scalar identifying LASA wave `"G"`; matching is
  case-insensitive.

- name_corrections:

  Optional named character vector. Names are canonical suffixes without
  the wave prefix (for example `qeoldt1`) and values are actual column
  names in `data`.

- to_factor:

  Logical. Convert labelled categorical variables to factors using their
  documented value labels.

- to_numeric:

  Logical. Accepted for the shared interface; LASA148 has no numeric
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

LASA148 is documented only for wave G. The five decision-maker
indicators use the codebook's `-1`/0/`-1` map for no answer, not
mentioned, and mentioned, respectively. That duplicated `-1` is
reproduced literally and retained in `original_labels`; it is not
silently corrected. The vignette items use codes 1 through 4 from yes to
no, plus `-1` for no answer.

Column matching tries, in order: an explicit `name_corrections`
override, an exact case-sensitive match, and a case-insensitive exact
match. `to_factor = TRUE` converts matched categorical items to factors
while retaining observed unlabelled codes as numeric-text levels.
Because the decision-maker map assigns two texts to `-1`, factor
conversion uses the first documented text for that code; the full map
remains available in `original_labels`. LASA148 has no numeric variables
eligible for `to_numeric` conversion. Original values are preserved in
`original_values`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  GQEOLDT1 = c(-1, 0, 1),
  gqvgcan1 = c(-1, 1, 4)
)
dat <- apply_lasa148_labels(dat, wave = "G")
attr(dat$GQEOLDT1, "labels")
#> no answer, asked    not mentioned        mentioned 
#>               -1                0               -1 
```
