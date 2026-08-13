# Apply LASA046 (LAPAQ / Physical Activity) SPSS labels

Attaches SPSS-style variable labels (`attr(x, "label")`) and value
labels (`attr(x, "labels")`) to a LASA046 (LAPAQ physical activity
questionnaire) data frame, using the coding scheme documented for the
requested wave. By default variables are left numeric; optional
arguments allow converting categorical variables to factors, restoring
count/continuous variables to plain numeric, correcting mismatched
column names, and standardizing column names to the canonical LASA
documentation spelling.

## Usage

``` r
apply_lasa046_labels(
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

  A data frame or tibble imported from a LASA046 `.sav` file (for
  example via
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html)),
  containing wave-prefixed variables such as `blphya01`, `clphya01`,
  etc.

- wave:

  Character scalar identifying the LASA wave, matched
  case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
  `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.

- name_corrections:

  Optional named character vector for explicit name overrides, used when
  a column in `data` does not exactly or case-insensitively match its
  expected LASA046 name (e.g. a typo introduced during data entry or
  export). Names are canonical LASA046 suffixes (without the wave
  prefix), and values are the actual column names found in `data`, for
  example `c(lphya08 = "BLPYA08")`. A correction that points to a column
  not present in `data` is recorded as `"manual_not_found"` in the
  matching audit rather than raising an error.

- to_factor:

  Logical. If `FALSE` (default), categorical variables remain numeric
  with SPSS-style value-label attributes. If `TRUE`, every categorical
  variable's value labels are used as factor levels; any observed value
  that has no codebook label is retained as its own level (labelled with
  the numeric code) rather than being converted to `NA`. Ignored for a
  given variable when `to_numeric` applies to it instead (see below).

- to_numeric:

  Logical. If `FALSE` (default), count/continuous variables keep their
  SPSS-style missing-reason value-label attributes. If `TRUE`, every
  variable whose codebook value labels consist exclusively of negative
  missing-reason codes (e.g. -1, -2, -3) is restored to an ordinary
  numeric vector: all negative values become `NA` and all remaining
  values are kept as numeric. This takes precedence over `to_factor` for
  these variables.

- standardize_names:

  Logical. If `FALSE` (default), original column names in `data` are
  left unchanged (except for any renaming triggered by `split_wavecode`,
  see below). If `TRUE`, every successfully matched LASA046 column is
  renamed to its canonical lowercase documentation name with the wave
  code removed, such as `lphya01`, `lphya26`, or `lphya50`, the
  `"respnr"` column (in any capitalization) is renamed to `"respnr"`,
  and `split_wavecode` is always treated as `TRUE` as well (see below),
  regardless of what was passed for `split_wavecode`. Renaming happens
  only after all variables have been matched, so it cannot affect
  matching decisions; the function stops with an informative error if
  renaming would create duplicate column names.

- split_wavecode:

  Logical. If `FALSE` (default) and `standardize_names = FALSE`, no
  wave-code splitting occurs. If `TRUE`, every successfully matched
  LASA046 column is renamed to its canonical name with the wave-letter
  prefix removed (e.g. `blphya01` becomes `lphya01`), and a new
  `"LASA_wave"` column, filled with `wave`, is inserted right after the
  `"respnr"` column (matched but not renamed unless
  `standardize_names = TRUE`; inserted at the front of `data` if no
  `"respnr"`-like column is found). Always treated as `TRUE` when
  `standardize_names = TRUE`, even if `split_wavecode` itself was left
  at its default.

## Value

`data`, with `label` and `labels` attributes added to every matched
LASA046 column (transformed to a factor or plain numeric where
`to_factor`/`to_numeric` apply), plus reference `original_labels` /
`original_values` attributes preserving the original SPSS value coding
regardless of that reshaping. Columns are optionally renamed when
`standardize_names = TRUE`, and a new `"LASA_wave"` column is added
after `"respnr"` when `standardize_names = TRUE` or
`split_wavecode = TRUE`. A variable-name matching audit is attached as
the generic `"label_report"` attribute; retrieve it with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## Details

LASA046 variable names, wording, and value codings change across waves
(for example, the sport-type coding scheme was redesigned starting at
wave H, and several items only exist in a subset of waves). `wave` must
be supplied explicitly because several waves share the same
variable-name prefix (`"b"` for B, 2B, 3B, and MB) but use different
labels/codings.

Column matching tries, in order: (1) an explicit override in
`name_corrections`, (2) an exact (case-sensitive) name match, (3) a
case-insensitive name match. A LASA046 variable that cannot be matched
by any of these is left unlabelled and recorded as `"not found"` in the
matching audit rather than raising an error, since not every wave's file
contains every variable.

`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
`split_wavecode` are part of a parameter contract shared by every
`apply_*_labels()` function in this package (see the header comment in
`lasa_io.R`). Because
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
forwards these same five arguments automatically when dispatching to
this function, they can be supplied either directly to
`apply_lasa046_labels()` or through
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
– both forms behave identically.

Regardless of `to_factor`/`to_numeric`, every matched column also keeps
its original SPSS value coding available as reference attributes –
`attr(x, "original_labels")` (the codebook: value labels keyed by their
numeric code) and `attr(x, "original_values")` (the raw numeric values
as imported, before any `to_factor`/`to_numeric` reshaping) – so R
output can be cross-checked against another program's (e.g. SPSS) coding
no matter which shape the column was converted to.

The `"respnr"` (respondent number) column, present in essentially every
LASA data file under inconsistent capitalization (e.g. `"RespNr"`), is
also matched and, when `standardize_names = TRUE`, renamed to
`"respnr"`.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
if (FALSE) { # \dontrun{
dat_b  <- apply_lasa046_labels(dat_b, wave = "B")
dat_2b <- apply_lasa046_labels(dat_2b, wave = "2B")

# Convert categorical variables to factors, restore count variables to
# plain numeric, and use canonical column names (this also splits the
# wave code into its own "LASA_wave" column):
dat_h <- apply_lasa046_labels(
  dat_h, wave = "H",
  to_factor = TRUE, to_numeric = TRUE, standardize_names = TRUE
)

# Split the wave code into "LASA_wave" without fully standardizing names:
dat_2b <- apply_lasa046_labels(dat_2b, wave = "2B", split_wavecode = TRUE)

# Manually correct a mistyped column name:
dat_3b <- apply_lasa046_labels(
  dat_3b, wave = "3B",
  name_corrections = c(lphya08 = "BLPYA08")
)

# Equivalently, via read_lasa_sav():
dat_h <- read_lasa_sav(
  "LASAH046.SAV",
  to_factor = TRUE, to_numeric = TRUE, standardize_names = TRUE
)

lasa_label_report(dat_h, problems_only = TRUE)
} # }
```
