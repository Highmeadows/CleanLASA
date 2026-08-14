# Apply LASA069 (Ties with country of origin) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the 20 bilingual variables documented in
the LASMB069 ties-with-country-of-origin file.

## Usage

``` r
apply_lasa069_labels(
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

  A data frame or tibble imported from a LASMB069 `.sav` file. Names
  include `bcultid1`, `bNLlang1`, `bcultdis1`, and `bloss1`.

- wave:

  Character scalar identifying the LASA wave. Only `"MB"` is documented
  and accepted; matching is case-insensitive.

- name_corrections:

  Optional named character vector mapping canonical suffixes without the
  `b` prefix (for example `cultid1`, `nllang1`, or `loss1`) to actual
  column names in `data`.

- to_factor:

  Logical. If `TRUE`, matched variables are converted to factors using
  the documented labels; observed unlabelled codes remain numeric-text
  levels.

- to_numeric:

  Logical. Accepted for interface consistency; LASA069 has no numeric
  variables eligible for conversion.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical suffixes
  without the `b` prefix, `respnr` is standardized, and `split_wavecode`
  is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have their `b` prefix removed and
  a `LASA_wave` column filled with `"MB"` is inserted after the
  respondent-number column.

## Value

`data`, with LASA069 labels, requested conversion/renaming, preserved
original coding, and a `label_report` matching audit.

## Details

The file contains seven cultural-identity activities rated from never to
often, three Dutch-language and three Dutch-acquaintance statements
rated from strongly disagree to strongly agree, and seven yes/no
belonging, cultural-loss, and homesickness statements. The English/Dutch
variable labels and all three shared value maps are retained.

All LASA069 variables are categorical. Consequently, `to_numeric` is
accepted for consistency with the shared apply-labels interface but does
not convert them. With `to_factor = TRUE`, matched variables become
factors and observed unlabelled codes remain numeric-text levels.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive name match, and (3) a
case-insensitive exact match. Documented variables absent from `data`
are recorded as `"not found"` in the generic matching audit.

The five reshaping arguments follow the package's shared apply-labels
contract. Every matched column preserves the original SPSS coding in
`original_labels` and `original_values`; `respnr` is standardized when
requested.

## See also

[`apply_lasa068_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa068_labels.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(bcultid1 = c(-1, 1, 4), bNLlang1 = c(1, 3, 4))
dat <- apply_lasa069_labels(dat, wave = "MB")
attr(dat$bcultid1, "labels")
#> no answer     never sometimes regularly     often 
#>        -1         1         2         3         4 
```
