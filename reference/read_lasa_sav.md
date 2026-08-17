# Read and label a LASA SPSS data file

Reads a LASA `.sav` file, identifies its wave and file code from the
file name, and labels it using
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)
– the package's normalized, database-driven variable/value-label
metadata – via the same engine
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
uses.

## Usage

``` r
read_lasa_sav(
  path,
  user_na = TRUE,
  read_sav_args = list(),
  name_corrections = NULL,
  to_factor = FALSE,
  to_numeric = FALSE,
  standardize_names = FALSE,
  split_wavecode = FALSE
)
```

## Arguments

- path:

  Path to a LASA SPSS `.sav` file. LASA file names are parsed
  case-insensitively.

- user_na:

  Logical passed to
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html).
  The default is `TRUE` so SPSS user-defined missing codes remain
  available to the labelling step before any requested conversion to
  `NA`.

- read_sav_args:

  Optional named list of additional arguments passed to
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
  for example `list(encoding = "UTF-8")`. Do not include `file` or
  `user_na`; those are controlled by `path` and `user_na`.

- name_corrections, to_factor, to_numeric, standardize_names,
  split_wavecode:

  The five shared reshaping arguments used throughout this package – see
  [`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
  for the full description of each.

## Value

`data` as imported by
[`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
labelled (and optionally reshaped/renamed) with generic LASA provenance
attributes attached.

## Details

The file name is parsed against the LASA naming convention:

- regular single-letter waves: `LASA[wave][file_code].SAV`, e.g.
  `LASAE046.SAV`;

- waves 2B, 3B, 4B, and MB: `LAS[wave][file_code].SAV`, e.g.
  `LAS3B046.SAV`;

- information stored across waves: wave code `Z`, e.g. `LASAZ004.SAV`;

- file codes contain 2 or 3 alphanumeric characters and are interpreted
  case-insensitively.

Column matching, value/variable-label attachment,
`to_factor`/`to_numeric` reshaping, and
`standardize_names`/`split_wavecode` renaming are all performed by
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)'s
underlying engine, looking up metadata for the parsed file code/wave in
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md).
A file code with no database coverage yet is labelled as a no-op (every
column left untouched, `"not found"` recorded in the matching audit)
rather than an error – refresh coverage with
[`update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/update_lasa_labels.md)
or
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md).

After labelling, provenance attributes are attached: `"LASA_wave"`,
`"LASA_file_code"`, and `"LASA_source_file"`. This is what lets
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
re-label the same object later (e.g. after a `dplyr::mutate()` strips
attributes) without needing `filecode`/`wave` supplied again. The
variable-name matching audit is attached as the generic `"label_report"`
attribute; retrieve it with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md),
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)

## Examples

``` r
if (FALSE) { # \dontrun{
dat_e <- read_lasa_sav("LASAE046.SAV")
dat_3b <- read_lasa_sav("LAS3B046.SAV")

dat_h <- read_lasa_sav(
  "LASAH046.SAV",
  to_factor = TRUE,
  to_numeric = TRUE,
  standardize_names = TRUE
)

# split_wavecode = TRUE moves the wave code out of variable names and
# into its own "LASA_wave" column, without fully standardizing names:
dat_2b <- read_lasa_sav("LAS2B046.SAV", split_wavecode = TRUE)

# Manually correct a mistyped column name:
dat_b <- read_lasa_sav(
  "LASAB046.SAV",
  name_corrections = c(lphya08 = "BLPYA08")
)

dat_z004 <- read_lasa_sav("LASAZ004.SAV")
} # }
```
