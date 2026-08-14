# Apply LASA015 (Ownership and Neighbourhood) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to a LASA015 ownership-and-neighbourhood
data frame, using the variable names, wording, routing references, and
missing-value codes documented for the requested wave. By default,
matched variables remain numeric. Optional arguments allow converting
categorical variables to factors, restoring years-in-neighbourhood to
plain numeric, correcting mismatched column names, and standardizing
names to the canonical LASA documentation spelling.

## Usage

``` r
apply_lasa015_labels(
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

  A data frame or tibble imported from a LASA015 `.sav` file, for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  Expected wave-prefixed names include `bhowner`, `cmovefut`, `ghouse2`,
  and `gh2locsp`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit column name overrides.
  Names are canonical LASA015 suffixes without the wave prefix (for
  example `howner`, `movefut`, or `h2loc`), and values are the actual
  column names in `data`, for example `c(howner = "B_HOWNER")`.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, they are converted
  to factors using their value labels as levels. Observed values without
  a codebook label are retained as numeric-text levels rather than
  converted to `NA`.

- to_numeric:

  Logical. If `FALSE` (default), years in the neighbourhood retains its
  SPSS-style missing-reason labels. If `TRUE`, `yneigh` is restored to
  an ordinary numeric vector, negative missing-reason codes are replaced
  with `NA`, and non-negative years are retained. This takes precedence
  over `to_factor` for `yneigh`; all other variables remain labelled or
  become factors according to `to_factor`.

- standardize_names:

  Logical. If `FALSE` (default), source column names are retained except
  for renaming requested through `split_wavecode`. If `TRUE`, matched
  LASA015 columns are renamed to their canonical lowercase suffixes with
  the wave code removed; `"respnr"` in any capitalization is renamed to
  `"respnr"`; and `split_wavecode` is always treated as `TRUE`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, matched columns are renamed
  with the wave prefix removed (for example, `ghouse2` becomes `house2`)
  and a new `"LASA_wave"` column filled with `wave` is inserted
  immediately after the respondent-number column. It is always treated
  as `TRUE` when `standardize_names = TRUE`.

## Value

`data`, with variable- and value-label attributes attached to every
matched LASA015 column, optional factor/numeric conversion and canonical
renaming, and `original_labels`/`original_values` attributes preserving
the original SPSS coding. A `"LASA_wave"` column is added after
`"respnr"` when `standardize_names = TRUE` or `split_wavecode = TRUE`.
The generic variable-name audit is attached as
`attr(data, "label_report")` and can be retrieved with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA015 changes substantially across waves. Wave B uses a short-version
missing code and 0/1 response codes; wave 2B adds detailed intended-move
variables and an interview-terminated code; wave G adds a second-home
module; and wave 3B omits the routing code from two neighbourhood items.
The remaining waves share a core schema, although `movefut` is
documented only for C, D, and E. `wave` is therefore required,
especially because B, 2B, and 3B all use variable names beginning with
`"b"`.

The LASA015 PDF records the `gh22owns` routing label as
`"na, see GH21OWN"`, even though the variable describes an `gh22own`
follow-up. This function preserves the published wording verbatim so its
value-label metadata remains auditable against the source document.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive name match, and (3) a
case-insensitive exact match. Variables documented for the selected wave
but absent from `data` are left untouched and recorded as `"not found"`
in the generic matching audit.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` are part of the parameter contract shared by every
`apply_*_labels()` function in this package. Regardless of
`to_factor`/`to_numeric`, every matched column keeps its original SPSS
value coding in `attr(x, "original_labels")` and
`attr(x, "original_values")`. The `"respnr"` column is matched in any
capitalization and, when `standardize_names = TRUE`, renamed to
`"respnr"`.

## See also

[`apply_lasa014_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa014_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat_b <- data.frame(
  BHOWNER = c(-4, 1, 2),
  BMORTGA = c(-2, 1, 2),
  BYNEIGH = c(-4, 8, 20)
)
dat_b <- apply_lasa015_labels(dat_b, wave = "B")
attr(dat_b$BHOWNER, "labels")
#> na, short version    na, wrong skip       na, routing  no answer, asked 
#>                -4                -3                -2                -1 
#>             owner            tenant         subtenant          resident 
#>                 1                 2                 3                 4 
#>              free 
#>                 5 

dat_g <- data.frame(
  RespNr = 1:3,
  GHOUSE2 = c(-1, 1, 2),
  GHS21 = c(-2, 0, 1),
  GH2DURA = c(-2, 1, 4)
)
dat_g <- apply_lasa015_labels(
  dat_g,
  wave = "G",
  to_factor = TRUE,
  standardize_names = TRUE
)
lasa_label_report(dat_g, problems_only = TRUE)
#>     suffix expected_name matched_name    method standardized_to
#> 1   howner       ghowner         <NA> not found            <NA>
#> 2   mortga       gmortga         <NA> not found            <NA>
#> 3   yneigh       gyneigh         <NA> not found            <NA>
#> 4    pleas        gpleas         <NA> not found            <NA>
#> 5     safe         gsafe         <NA> not found            <NA>
#> 6     hs22         ghs22         <NA> not found            <NA>
#> 7     hs23         ghs23         <NA> not found            <NA>
#> 8     hs24         ghs24         <NA> not found            <NA>
#> 9     hs25         ghs25         <NA> not found            <NA>
#> 10    hs26         ghs26         <NA> not found            <NA>
#> 11   hs26s        ghs26s         <NA> not found            <NA>
#> 12  h21own       gh21own         <NA> not found            <NA>
#> 13 h21owns      gh21owns         <NA> not found            <NA>
#> 14  h22own       gh22own         <NA> not found            <NA>
#> 15 h22owns      gh22owns         <NA> not found            <NA>
#> 16   h2loc        gh2loc         <NA> not found            <NA>
#> 17 h2locsp      gh2locsp         <NA> not found            <NA>
```
