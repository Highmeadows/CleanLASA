# Apply LASA272 (Negative Life Events) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to data imported from a LASA272
negative-life-events `.sav` file. The function uses the wave-specific
names, question wording, and routing/missing-value codes documented for
waves C through K.

## Usage

``` r
apply_lasa272_labels(
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

  A data frame or tibble imported from a LASA272 `.sav` file, containing
  wave-prefixed variables such as `cfadied`, `dfadied`, or `kfadied`.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"C"`, `"D"`, `"E"`, `"F"`, `"G"`, `"H"`,
  `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit name overrides. Names are
  canonical LASA272 suffixes without the wave prefix (for example
  `fadied` or `illpart`), and values are the actual column names in
  `data`, for example `c(fadied = "C_FATHER_DIED")`.

- to_factor:

  Logical. If `FALSE` (default), variables remain numeric with
  SPSS-style value-label attributes. If `TRUE`, value-labelled variables
  are converted to factors. Observed codes absent from the codebook are
  retained as numeric-text levels rather than converted to `NA`.

- to_numeric:

  Logical. If `FALSE` (default), variables retain their value-label
  attributes. If `TRUE`, variables whose value labels consist
  exclusively of negative missing-reason codes are converted to plain
  numeric and negative values become `NA`. LASA272's documented
  variables all include substantive response codes, so this option
  normally leaves them labelled (or converts them to factors when
  `to_factor = TRUE`).

- standardize_names:

  Logical. If `FALSE` (default), original column names are retained
  (except for any renaming triggered by `split_wavecode`, see below). If
  `TRUE`, matched columns are renamed to their canonical lowercase
  LASA272 names with the wave code removed, such as `fadied` or
  `killpart`, `"respnr"` (in any capitalization) is renamed to
  `"respnr"`, and `split_wavecode` is always treated as `TRUE` as well,
  regardless of what was passed for `split_wavecode`.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, matched columns are renamed
  with the wave-letter prefix removed (e.g. `cfadied` becomes `fadied`),
  and a new `"LASA_wave"` column, filled with `wave`, is inserted right
  after `"respnr"`. Always treated as `TRUE` when
  `standardize_names = TRUE`.

## Value

`data`, with variable and value labels applied to matched LASA272
columns, optional factor conversion and name standardization, plus
reference `original_labels`/`original_values` attributes preserving the
original SPSS value coding regardless of that reshaping. A new
`"LASA_wave"` column is added after `"respnr"` when
`standardize_names = TRUE` or `split_wavecode = TRUE`. A
`"label_report"` attribute is retrievable with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact case-sensitive match, and (3) a
case-insensitive exact match. Variables that cannot be matched are left
unchanged and recorded in the `"label_report"` attribute.

Regardless of `to_factor`/`to_numeric`, every matched column also keeps
its original SPSS value coding available as reference attributes –
`attr(x, "original_labels")` and `attr(x, "original_values")` – and the
`"respnr"` column (in any capitalization) is matched and, when
`standardize_names = TRUE`, renamed to `"respnr"`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md)

## Examples

``` r
if (FALSE) { # \dontrun{
dat_c <- haven::read_sav("LASAC272.SAV", user_na = TRUE)
dat_c <- apply_lasa272_labels(dat_c, wave = "C")

dat_k <- read_lasa_sav(
  "LASAK272.SAV",
  to_factor = TRUE,
  standardize_names = TRUE
)

lasa_label_report(dat_k, problems_only = TRUE)
} # }
```
