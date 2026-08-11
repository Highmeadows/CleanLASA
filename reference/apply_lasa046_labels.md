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
  standardize_names = FALSE
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
  left unchanged. If `TRUE`, every successfully matched LASA046 column
  is renamed to its canonical lowercase documentation name, such as
  `blphya01`, `clphya26`, or `klphya50`. Renaming happens only after all
  variables have been matched, so it cannot affect matching decisions;
  the function stops with an informative error if renaming would create
  duplicate column names.

## Value

`data`, with `label` and `labels` attributes added to every matched
LASA046 column (transformed to a factor or plain numeric where
`to_factor`/`to_numeric` apply), and optionally renamed when
`standardize_names = TRUE`. A variable-name matching audit is attached
as the generic `"label_report"` attribute; retrieve it with
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

`name_corrections`, `to_factor`, `to_numeric`, and `standardize_names`
are part of a parameter contract shared by every `apply_*_labels()`
function in this package (see the header comment in `lasa_io.R`).
Because
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
forwards these same four arguments automatically when dispatching to
this function, they can be supplied either directly to
`apply_lasa046_labels()` or through
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
– both forms behave identically.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)

## Examples

``` r
if (FALSE) { # \dontrun{
dat_b  <- apply_lasa046_labels(dat_b, wave = "B")
dat_2b <- apply_lasa046_labels(dat_2b, wave = "2B")

# Convert categorical variables to factors, restore count variables to
# plain numeric, and use canonical column names:
dat_h <- apply_lasa046_labels(
  dat_h, wave = "H",
  to_factor = TRUE, to_numeric = TRUE, standardize_names = TRUE
)

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
