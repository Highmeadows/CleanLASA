# Apply LASA140 (Parental data) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the six parental-data variables
documented in LASA140 for replenishment waves 2B and 3B.

## Usage

``` r
apply_lasa140_labels(
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

  A data frame or tibble imported from a LAS2B140 or LAS3B140 `.sav`
  file, for example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
  containing any of `bqmo_ch`, `bqfa_ch`, `bqmo_emp`, `bqmo_vol`,
  `bqparsep`, or `bqparsey`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"2B"` or `"3B"`.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  `b` prefix (`qmo_ch`, `qfa_ch`, `qmo_emp`, `qmo_vol`, `qparsep`, or
  `qparsey`) to actual column names in `data`.

- to_factor:

  Logical. If `TRUE`, categorical variables with documented value labels
  are converted to factors. Observed unlabelled codes remain
  numeric-text levels.

- to_numeric:

  Logical. If `TRUE`, the parental separation year is restored to plain
  numeric and negative values are replaced by `NA`.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the `b` prefix removed and a
  `LASA_wave` column containing the selected wave is inserted
  immediately after the respondent-number column.

## Value

`data`, with LASA140 variable/value labels, optional conversion and
standardized naming, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

Both waves contain parental church membership, maternal employment and
volunteer work during the respondent's youth, parental
separation/divorce, and year of separation/divorce. The
church-denomination coding differs materially: 2B uses eight substantive
categories, whereas 3B uses ten and distinguishes several Reformed and
Protestant denominations. Both waves store these variables with the `b`
prefix.

Church membership and yes/no variables are categorical. The separation
year is numeric; with `to_numeric = TRUE`, its documented -2 and -1
missing codes become `NA`. With `to_factor = TRUE`, categorical fields
become factors and observed unlabelled codes remain numeric-text levels.

Column matching tries an explicit `name_corrections` override, an exact
case-sensitive match, then a case-insensitive exact match. Original SPSS
labels and values are preserved. Standardized naming optionally removes
the `b` prefix, standardizes `respnr`, and adds the selected
`LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, bqmo_ch = c(1, 5), bqparsey = c(-2, 1990))
dat <- apply_lasa140_labels(dat, wave = "2B", to_numeric = TRUE)
attr(dat$bqmo_ch, "labels")
#>                   no answer            no church member 
#>                          -1                           1 
#>                    Reformed              Dutch reformed 
#>                           2                           3 
#> small reformed denomination              Roman-Catholic 
#>                           4                           5 
#>          Humanistic society                      Jewish 
#>                           6                           7 
#>                       other 
#>                           8 
```
