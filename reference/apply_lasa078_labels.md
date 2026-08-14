# Apply LASA078 (Need for affiliation) SPSS labels

Attaches the variable and value labels documented for the six need-for-
affiliation questionnaire items in LASAB078 and LASAE078. The items
cover talking about feelings, seeking support, coping alone, going to
others, keeping feelings private, and leaning on someone during
difficulties.

## Usage

``` r
apply_lasa078_labels(
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

  A data frame or tibble imported from LASAB078 or LASAE078.

- wave:

  Character scalar identifying wave `"B"` or `"E"`; matching is
  case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes (`an1`,
  `an4`, `an6`, `an8`, `an9`, or `an10`) to actual names.

- to_factor:

  Logical. Convert matched items to factors with documented value
  labels; observed undocumented codes remain numeric-text levels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA078 has no eligible
  numeric variables.

- standardize_names:

  Logical. Rename matched variables to lowercase canonical suffixes,
  standardize `respnr`, and imply wave splitting.

- split_wavecode:

  Logical. Remove the wave prefix from matched names and insert
  `LASA_wave` after the respondent-number column.

## Value

The labelled data, with requested factor conversion and canonical names,
preserved original coding, `LASA_wave`, and `label_report`.

## Details

Both waves use no/more-or-less/yes responses but have different
documented missing-reason labels. All six variables are categorical;
`to_numeric` is accepted for the shared interface but does not convert
them. Constructed scale filecode LASA278, documented in the same PDF, is
intentionally excluded and belongs to `apply_lasa278_labels()`.

Matching tries `name_corrections`, exact names, then case-insensitive
exact names. Factor conversion and canonical renaming/wave splitting
preserve the original SPSS coding and use the shared `label_report`
audit.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(ban1 = c(-4, 1, 3), ban4 = c(1, 2, 3))
dat <- apply_lasa078_labels(dat, wave = "B")
attr(dat$ban1, "labels")
#>      short version Q interview broken off        no valid data 
#>                   -4                   -3                   -2 
#>            no answer                   no         more-or-less 
#>                   -1                    1                    2 
#>                  yes 
#>                    3 
```
