# Apply LASA013 (Residence in 1944) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the four variables documented for the
LASAB013 residence-in-1944 file. By default, matched variables remain
numeric. Optional arguments allow converting categorical variables to
factors, correcting mismatched column names, and standardizing names to
the canonical LASA documentation spelling.

## Usage

``` r
apply_lasa013_labels(
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

  A data frame or tibble imported from a LASAB013 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Expected wave-prefixed names are `bcity`, `bprovinc`, `bcountry`, and
  `bremarks`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. LASA013 is documented only for `"B"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA013 suffixes without the wave prefix (`city`,
  `provinc`, `country`, or `remarks`), and values are the actual column
  names in `data`, for example `c(country = "B_COUNTRY")`.

- to_factor:

  Logical. If `FALSE` (default), all four categorical variables remain
  numeric with SPSS-style value-label attributes. If `TRUE`, they are
  converted to factors using their documented value labels as levels.
  Observed city or country codes omitted by the abbreviated PDF
  classification are retained as numeric-text levels.

- to_numeric:

  Logical. Retained for the common apply-label parameter contract.
  LASA013 contains no documented count or continuous variable, so this
  argument does not change any LASA013 column.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA013 columns are renamed to their canonical lowercase suffixes with
  the wave code removed (`city`, `provinc`, `country`, and `remarks`);
  `"respnr"` in any capitalization is renamed to `"respnr"`; and
  `split_wavecode` is always treated as `TRUE`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, matched columns are renamed
  with the B prefix removed (for example, `bcountry` becomes `country`)
  and a new `"LASA_wave"` column filled with `"B"` is inserted
  immediately after the respondent-number column. It is always treated
  as `TRUE` when `standardize_names = TRUE`.

## Value

`data`, with variable- and value-label attributes attached to every
matched LASA013 column, optional factor conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added after
`"respnr"` when `standardize_names = TRUE` or `split_wavecode = TRUE`.
The generic variable-name audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA013 is documented only for wave B. Its codebook prints the complete
province and special-remarks classifications, but abbreviates the city
classification between AALSMEER (1) and ZWOLLE-KERSPEL (565), and the
country classification between ANTILLES (1) and VIETNAM (26), with
ellipses. This function therefore attaches only the city and country
labels explicitly recorded in `LASA013_varinfo.pdf`; it does not invent
the omitted intermediate labels. When `to_factor = TRUE`, an observed
omitted code is retained as a numeric-text factor level instead of being
converted to `NA`.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive name match, and (3) a
case-insensitive exact match. Variables documented for LASAB013 but
absent from `data` are left untouched and recorded as `"not found"` in
the generic matching audit.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` are part of the parameter contract shared by every
`apply_*_labels()` function in this package. Regardless of
`to_factor`/`to_numeric`, every matched column keeps its original SPSS
value coding in `attr(x, "original_labels")` and
`attr(x, "original_values")`. The `"respnr"` column is matched in any
capitalization and, when `standardize_names = TRUE`, renamed to
`"respnr"`.

## See also

[`apply_lasa012_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa012_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(
  RespNr = 1:3,
  BCITY = c(-4, 1, 565),
  BPROVINC = c(-2, 8, 12),
  BCOUNTRY = c(-2, 1, 26),
  BREMARKS = c(-2, 1, 14)
)
dat <- apply_lasa013_labels(dat, wave = "B")
attr(dat$BCITY, "label")
#> [1] "Residence 1944: City"
attr(dat$BPROVINC, "labels")
#> routing (no city)  province unknown            DRENTE         FLEVOLAND 
#>                -2                -1                 1                 2 
#>         FRIESLAND        GELDERLAND         GRONINGEN           LIMBURG 
#>                 3                 4                 5                 6 
#>     NOORD BRABANT     NOORD HOLLAND         OVERIJSEL           UTRECHT 
#>                 7                 8                 9                10 
#>           ZEELAND      Zuid HOLLAND 
#>                11                12 

dat_factor <- apply_lasa013_labels(
  dat,
  wave = "B",
  to_factor = TRUE,
  standardize_names = TRUE
)
lasa_label_report(dat_factor, problems_only = TRUE)
#> [1] suffix          expected_name   matched_name    method         
#> [5] standardized_to
#> <0 rows> (or 0-length row.names)
```
