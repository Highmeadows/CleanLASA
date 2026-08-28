# Read and label a LASA SPSS data file

Reads a LASA `.sav` file, identifies its wave and file code from the
file name, and labels it using
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)
– the package's normalized, database-driven variable/value-label
metadata – via
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md),
which does all of the actual matching/transforming/standardizing work.
`read_lasa_sav()` is a thin wrapper around it.

## Usage

``` r
read_lasa_sav(
  path,
  filecode = NULL,
  wave = NULL,
  name_corrections = NULL,
  fuzzy_matching = TRUE,
  standardize = TRUE,
  .standardize_names = NULL,
  .standardize_var_labels = NULL,
  .standardize_val_labels = NULL,
  add_wavecode = FALSE,
  to_factor = TRUE,
  to_numeric = TRUE,
  user_na = TRUE,
  read_sav_args = list()
)
```

## Arguments

- path:

  Path to a LASA SPSS `.sav` file. LASA file names are parsed
  case-insensitively.

- filecode:

  Optional manual override for the LASA file code, for a file name that
  doesn't follow the documented convention. If omitted, derived from
  `path`.

- wave:

  Optional manual override for the LASA wave code (e.g. useful for a
  nonstandard baseline wave). If omitted, derived from `path`.

- name_corrections, fuzzy_matching, standardize, .standardize_names,
  .standardize_var_labels, .standardize_val_labels, add_wavecode,
  to_factor, to_numeric:

  The shared reshaping arguments used throughout this package – see
  [`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
  for the full description of each.

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

`filecode`/`wave` override the parsed values when supplied – the place
to correct a nonstandard file name or a baseline wave that doesn't
follow the usual convention.

After identification, `read_lasa_sav()` reads the file with
[`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
lowercases every column name, and forwards everything else to
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md),
which performs all column matching, value/variable-label attachment,
`to_factor`/`to_numeric` reshaping, standardization, and `add_wavecode`.
A file code with no database coverage yet is labelled as a no-op (every
column left untouched, `"not found"` recorded in the matching audit)
rather than an error – add coverage with
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md),
or wait for a package update.

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

# to_factor/to_numeric/standardize default to TRUE.
dat_h <- read_lasa_sav("LASAH046.SAV")

# add_wavecode = TRUE without full name standardization:
dat_2b <- read_lasa_sav(
  "LAS2B046.SAV",
  .standardize_names = FALSE,
  add_wavecode = TRUE
)

# Manually correct a mistyped column name:
dat_b <- read_lasa_sav(
  "LASAB046.SAV",
  name_corrections = c(lphya08 = "BLPYA08")
)

dat_z004 <- read_lasa_sav("LASAZ004.SAV")
} # }
```
