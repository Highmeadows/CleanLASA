# Apply LASA125 (Social participation-2) SPSS labels

Attaches SPSS-style variable and value labels to the
social-participation variables documented in LASA125 for waves B, C, D,
E, 2B, F, and G.

## Usage

``` r
apply_lasa125_labels(
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

  A data frame or tibble imported from a LASA125 `.sav` file. Names may
  include `bqsocp04`, `cqsocp07`, `fqsocp20`, or `gqsocp20b`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  or `"G"`.

- name_corrections:

  Optional named character vector mapping suffixes without the wave
  prefix (for example `qsocp06` or `qsocp20b`) to actual names in
  `data`.

- to_factor:

  Logical. If `TRUE`, categorical variables with documented value labels
  are converted to factors.

- to_numeric:

  Logical. If `TRUE`, documented radio/television hour fields are
  restored to plain numeric and negative values become `NA`.

- standardize_names:

  Logical. If `TRUE`, matched names and `respnr` are standardized and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched names lose the wave prefix and a
  `LASA_wave` column is inserted after `respnr`.

## Value

`data`, with LASA125 metadata, requested conversion or renaming,
preserved original coding, `LASA_wave` provenance, and a `label_report`.

## Details

The wave-specific inventories cover possession and use of a senior card,
hours spent listening to radio or watching television, radio and
television content, newspaper reading, and involvement with geographic
communities. Wave B has the broadest community-involvement block; later
waves retain selected media items. Wave G adds reality programmes, and
the film item is labelled "films/tv series" in F and G rather than
"films/soaps".

Radio- and television-hours variables are numeric and are eligible for
`to_numeric`; negative values become `NA`. Other variables are
categorical and can be converted with `to_factor`. `to_numeric` takes
precedence for eligible variables.

Matching tries `name_corrections`, an exact case-sensitive name, and a
case-insensitive exact name. Original SPSS coding is preserved,
standardized naming removes the wave prefix, and `split_wavecode`
inserts `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(bqsocp06 = c(-1, 2.5), bqsocp07 = c(1, 4))
dat <- apply_lasa125_labels(dat, wave = "B", to_numeric = TRUE)
attr(dat$bqsocp07, "labels")
#>        no answer       very often            often some of the time 
#>               -1                1                2                3 
#>            never 
#>                4 
```
