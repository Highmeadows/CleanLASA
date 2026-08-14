# Apply LASA169 (daily experiences) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to the 14 daily-experiences variables
documented in LASA169 for waves J and K. The source notes that the
K-wave data file was not yet available when the codebook was issued, but
documents the same `kmdexp` inventory and coding as wave J.

## Usage

``` r
apply_lasa169_labels(
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

  A data frame or tibble imported from a LASA169 `.sav` file. Documented
  names are `jmdexp1` through `jmdexp69` in wave J and the corresponding
  `kmdexp` names in wave K.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"J"` or `"K"`.

- name_corrections:

  Optional named character vector mapping canonical LASA169 suffixes
  without the wave prefix (for example, `mdexp1`) to actual column names
  in `data`.

- to_factor:

  Logical. If `TRUE`, variables with documented value labels are
  converted to factors. Observed unlabelled codes remain numeric-text
  levels.

- to_numeric:

  Logical. Accepted for the shared interface. LASA169 has no documented
  continuous numeric variables, so its variables retain their labelled
  coding.

- standardize_names:

  Logical. If `TRUE`, matched columns are renamed to canonical lowercase
  suffixes without the wave prefix, `respnr` is standardized, and
  `split_wavecode` is treated as `TRUE`.

- split_wavecode:

  Logical. If `TRUE`, matched columns have the wave prefix removed and a
  `LASA_wave` column containing the selected wave is inserted
  immediately after the respondent-number column.

## Value

`data`, with LASA169 variable/value labels, optional factor conversion
and standardized naming, preserved original SPSS coding, the `LASA_wave`
provenance attribute, and a `label_report` matching audit.

## Details

The first five variables record how often unfair interpersonal treatment
occurred. Nine follow-up indicators record perceived reasons for those
experiences: gender, ethnicity, age, weight, disability, appearance,
sexual orientation, financial situation, and another reason. All
variables are categorical; none is converted by `to_numeric = TRUE`.

Column matching tries an explicit `name_corrections` override, an exact
match, then a case-insensitive exact match. With `to_factor = TRUE`,
documented codes become factor levels while observed unlabelled codes
are retained. Original labels and values are preserved. Optional
standardized naming removes the wave prefix, standardizes `respnr`, and
adds `LASA_wave`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
dat <- data.frame(RespNr = 1:2, jmdexp1 = c(1, 6), jmdexp63 = c(0, 1))
dat <- apply_lasa169_labels(dat, wave = "J", to_factor = TRUE)
attr(dat$jmdexp1, "label")
#> [1] "daily experiences: treated with less respect"
```
