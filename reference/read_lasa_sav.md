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
  keep_user_na = FALSE,
  format_as_long = FALSE,
  read_sav_args = list(),
  user_na
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

- keep_user_na:

  Logical, default `FALSE`. With `FALSE`, every missing-value code
  becomes `NA`; with `TRUE`, missing codes are kept (as label text in
  factors and character variables, as the raw code declared user-missing
  otherwise). See
  [`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md).
  The file itself is always read with every code intact
  (`haven::read_sav(user_na = TRUE)`), so this choice is made from the
  LASA documentation rather than from whatever the `.sav` file happens
  to declare.

- format_as_long:

  Logical, default `FALSE`. If `TRUE`, the labelled data are transformed
  to long format with
  [`transform_lasa_data()`](https://highmeadows.github.io/CleanLASA/reference/transform_lasa_data.md):
  one row per respondent per wave, with a `"Wave"` column and a `"Time"`
  column (the number of waves since the respondent's baseline). Meant
  for Z files, which LASA stores in wide format (e.g. `boak`, `coak`,
  `doak`, ... become one `oak` column); their stable variables, such as
  sex or year of birth, are repeated on every row of the respondent. The
  default `FALSE` returns the data as before, a Z file in its own wide
  layout.

- read_sav_args:

  Optional named list of additional arguments passed to
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
  for example `list(encoding = "UTF-8")`. Do not include `file` (set by
  `path`) or `user_na` (always `TRUE`; choose how missing codes come out
  with `keep_user_na`).

- user_na:

  Deprecated: use `keep_user_na` instead. A supplied value is used as
  `keep_user_na`, with a warning.

## Value

`data` as imported by
[`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
labelled (and optionally reshaped/renamed) with generic LASA provenance
attributes attached – in long format when `format_as_long = TRUE`.

## Details

The file name is parsed against the LASA naming convention:

- regular single-letter waves: `LASA[wave][file_code].SAV`, e.g.
  `LASAE046.SAV`;

- waves 2B, 3B, 4B, and MB: `LAS[wave][file_code].SAV`, e.g.
  `LAS3B046.SAV`;

- information stored across waves: wave code `Z`, e.g. `LASAZ004.SAV`
  (file code `"z004"`) or `LASAZOA1.SAV` (file code `"zoa1"`). A Z file
  holds wave-prefixed columns for several waves at once; each is
  labelled from its own wave's metadata and keeps its documented
  (wave-prefixed) name under `standardize`, since the canonical names
  would collide;

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

With `format_as_long = TRUE`, the labelled data are finally passed to
[`transform_lasa_data()`](https://highmeadows.github.io/CleanLASA/reference/transform_lasa_data.md)
(`format = "long"`). A regular wave file is already long under the
default `standardize = TRUE` and gains a `"Time"` column; its
wave-prefixed names lose their prefix where `standardize` left it: all
of them with `standardize = FALSE`, and those of waves 4B and L, which
the label database doesn't document yet. A Z file's wave-prefixed
columns become one column per variable, with the wave of each row in
`"Wave"`. A file without wave-specific columns, such as the Z file
`LASAZ004.SAV` or the migrant cohort's `LASMB004.SAV` (sex, year of
birth, ...), has no wave dimension: it keeps one row per respondent,
without `"Wave"` and `"Time"` columns, and a message says so; merge it
with long data by `respnr` alone. Long data that span several waves no
longer carry a single `"LASA_wave"` attribute.

`"Time"` counts the waves since each respondent's baseline (Time 0), so
it needs the respondent's cohort: every row of a baseline file is Time
0, and every row of a file of waves C to E, which only the first cohort
takes part in, gets that cohort's Time – also rows holding nothing but
missing-value codes, whatever the respondent numbers say. Wave A (the
LSN pilot study) has no Time. The waves from F on are shared by several
cohorts, so the wave of such a file doesn't show who belongs to which:
its rows get their Time from LASA's respondent numbers, five digits the
first of which says the cohort (1 to 3 the first, 4 to 6 the second, 7
to 9 the third; a 1, which the LSN pilot study's respondents have too,
only where the respondent's values aren't all missing-value codes). The
rows of respondents whose number doesn't say get no Time, with a
message, until the file is combined with data that show the cohorts (the
baseline files, or `LASAZ002.SAV`'s `cohort` column) and transformed
again; where those show another cohort than a number, they decide, with
a warning. The fourth and the migrant cohort's numbers aren't known yet,
so read on its own, a file of waves I to L may give their rows another
cohort's Time (see
[`transform_lasa_data()`](https://highmeadows.github.io/CleanLASA/reference/transform_lasa_data.md),
which also explains combining files).

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md),
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md),
[`transform_lasa_data()`](https://highmeadows.github.io/CleanLASA/reference/transform_lasa_data.md)

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

# Keep missing-value codes (e.g. "na, asked") instead of turning them
# into NA:
dat_b014 <- read_lasa_sav("LASAB014.SAV", keep_user_na = TRUE)

# A Z file in long format: one row per respondent per wave, with the
# wave-prefixed boak, coak, ... combined into one oak column.
dat_oa_long <- read_lasa_sav("LASAZOA1.SAV", format_as_long = TRUE)
} # }
```
