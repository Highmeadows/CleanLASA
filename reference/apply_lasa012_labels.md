# Apply LASA012 (Pets in Household) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to a LASA012 pets-in-household data frame,
using the variable names, wording, and missing-value codes documented
for the requested wave. By default, matched variables remain numeric.
Optional arguments allow converting categorical variables to factors,
restoring the number-of-species variable to plain numeric, correcting
mismatched column names, and standardizing names to the canonical LASA
documentation spelling.

## Usage

``` r
apply_lasa012_labels(
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

  A data frame or tibble imported from a LASA012 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Expected wave-prefixed names include `bpets`, `cpetothe`, `fcat`, and
  `knspecie`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA012 suffixes without the wave prefix (for
  example `pets`, `petothe`, or `nspecie`), and values are the actual
  column names in `data`, for example `c(petothe = "F_OTHER_PET")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, the main pets
  question and the cat, dog, bird, and other-pets indicators are
  converted to factors using their value labels as levels. Observed
  values without a codebook label are retained as numeric-text levels
  rather than converted to `NA`.

- to_numeric:

  Logical. If `FALSE` (default), the number-of-species variable retains
  its SPSS-style missing-value label. If `TRUE`, `nspecie` is restored
  to an ordinary numeric vector, negative missing-reason codes are
  replaced with `NA`, and non-negative species counts are retained. This
  takes precedence over `to_factor` for `nspecie`; the categorical pet
  variables remain labelled or become factors according to `to_factor`.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA012 columns are renamed to their canonical lowercase suffixes with
  the wave code removed, such as `pets`, `petothe`, or `nspecie`;
  `"respnr"` in any capitalization is renamed to `"respnr"`; and
  `split_wavecode` is always treated as `TRUE`, regardless of the value
  supplied to `split_wavecode`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, matched columns are renamed
  with the wave prefix removed (for example, `fpetothe` becomes
  `petothe`) and a new `"LASA_wave"` column filled with `wave` is
  inserted immediately after the respondent-number column. It is always
  treated as `TRUE` when `standardize_names = TRUE`.

## Value

`data`, with variable- and value-label attributes attached to every
matched LASA012 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added after
`"respnr"` when `standardize_names = TRUE` or `split_wavecode = TRUE`.
The generic variable-name audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA012 changes across waves. Wave B calls the other-pets indicator
`petsoth`, whereas later waves use `petothe`; the routing and
missing-reason codes for the main `pets` question also differ between B,
C, D/E, 2B, and the later waves. `wave` is therefore required,
especially because B, 2B, and 3B all use variable names beginning with
`"b"`.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive name match, and (3) a
case-insensitive exact match. Variables documented for the selected wave
but absent from `data` are left untouched and recorded as `"not found"`
in the generic matching audit.

The LASAB212 variables shown in the LASA012 codebook describe specific
types of other pets and are not processed by this function because
LASAB212 is a separate LASA file code.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` are part of the parameter contract shared by every
`apply_*_labels()` function in this package. Regardless of
`to_factor`/`to_numeric`, every matched column keeps its original SPSS
value coding in `attr(x, "original_labels")` and
`attr(x, "original_values")`. The `"respnr"` column is matched in any
capitalization and, when `standardize_names = TRUE`, renamed to
`"respnr"`.

## See also

[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat_b <- data.frame(
  BPETS = c(-4, 0, 1),
  BCAT = c(-2, 0, 1),
  BNSPECIE = c(-2, 0, 2)
)
dat_b <- apply_lasa012_labels(dat_b, wave = "B")
attr(dat_b$BPETS, "label")
#> [1] "Do you have pets?"
attr(dat_b$BPETS, "labels")
#> na, short version                no               yes 
#>                -4                 0                 1 

dat_f <- data.frame(
  RespNr = 1:3,
  FPETS = c(1, 0, -1),
  FPETOTHE = c(1, 0, -2),
  FNSPECIE = c(2, 0, -2)
)
dat_f <- apply_lasa012_labels(
  dat_f,
  wave = "F",
  to_factor = TRUE,
  to_numeric = TRUE,
  standardize_names = TRUE
)
lasa_label_report(dat_f, problems_only = TRUE)
#>   suffix expected_name matched_name    method standardized_to
#> 1    dog          fdog         <NA> not found            <NA>
#> 2    cat          fcat         <NA> not found            <NA>
#> 3   bird         fbird         <NA> not found            <NA>
```
