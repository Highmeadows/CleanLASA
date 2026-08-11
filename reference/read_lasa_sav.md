# Read and label a LASA SPSS data file

Reads a LASA `.sav` file, identifies its wave and file code from the
file name, finds the corresponding file-specific `apply_*_labels()`
function, and applies that function to the imported data.

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
  ...
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
  available to the file-specific labelling function before any requested
  conversion to `NA`.

- read_sav_args:

  Optional named list of additional arguments passed to
  [`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
  for example `list(encoding = "UTF-8")`. Do not include `file` or
  `user_na`; those are controlled by `path` and `user_na`.

- name_corrections:

  Optional named character vector of manual column overrides, forwarded
  to the selected file-specific label function when it declares a
  `name_corrections` argument (every `apply_*_labels()` function in this
  package does; see
  [`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md)
  for details). Names are canonical variable suffixes (without the wave
  prefix); values are the actual column names found in the imported
  data, for example `c(lphya08 = "BLPYA08")`. Use this when a column in
  the `.sav` file does not exactly or case-insensitively match its
  documented LASA name.

- to_factor:

  Logical, default `FALSE`. Forwarded to the selected file-specific
  label function. When `TRUE`, categorical variables are converted to
  factors using their SPSS value labels as level text, instead of being
  left numeric with value-label attributes attached.

- to_numeric:

  Logical, default `FALSE`. Forwarded to the selected file-specific
  label function. When `TRUE`, count/continuous variables (those whose
  only codebook value labels are negative missing-reason codes) are
  restored to plain numeric, with negative codes converted to `NA`.
  Takes precedence over `to_factor` for those variables.

- standardize_names:

  Logical, default `FALSE`. Forwarded to the selected file-specific
  label function. When `TRUE`, every successfully matched column is
  renamed to its canonical lowercase LASA documentation name (e.g.
  `blphya01`).

- ...:

  Additional named arguments forwarded to the selected file-specific
  label function, for file-specific parameters that fall outside the
  four shared reshaping arguments listed above.

## Value

The object returned by the selected file-specific label function, with
generic LASA provenance attributes attached.

## Details

The dispatcher follows the LASA filename convention:

- regular single-letter waves: `LASA[wave][file_code].SAV`, e.g.
  `LASAE046.SAV`;

- waves 2B, 3B, 4B, and MB: `LAS[wave][file_code].SAV`, e.g.
  `LAS3B046.SAV`;

- information stored across waves: wave code `Z`, e.g. `LASAZ004.SAV`;

- file codes contain 2 or 3 alphanumeric characters and are interpreted
  case-insensitively.

File-specific label functions are selected by convention. If the file
code starts with a number, the expected function is
`apply_lasa[file_code]_labels()`; for example, file 046 maps to
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md)
and file 004 maps to `apply_lasa004_labels()`. If the file code starts
with a letter, the expected function is
`apply_lasa_[file_code]_labels()`; for example, FI maps to
`apply_lasa_fi_labels()`. The OA files `oa1`, `oa2`, and `oa3` are a
hard-coded family and all map to `apply_lasa_oa_labels()`.

Every `apply_*_labels()` function in this package shares the same
parameter contract: `data`, a wave- and/or file-code-identifying
argument, and the four reshaping arguments documented above
(`name_corrections`, `to_factor`, `to_numeric`, `standardize_names`; see
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md)
for the canonical implementation). `read_lasa_sav()` declares those four
reshaping arguments explicitly, with the defaults shown above, so
callers can discover and use them without needing to know which
file-specific function is ultimately dispatched to. The selected
function must already be available in the package namespace or current R
session. `read_lasa_sav()` inspects that function's formal arguments
(via [`formals()`](https://rdrr.io/r/base/formals.html)) and:

- always supplies `data`;

- supplies `wave` and/or `file_code` when the function declares them;

- supplies `name_corrections`, `to_factor`, `to_numeric`, and
  `standardize_names` when the function declares them, and otherwise
  warns – rather than silently ignoring the request – if the caller
  supplied a non-default value for one of these;

- forwards any further named arguments from `...` unchanged, for
  file-specific parameters that fall outside the shared contract.

This permits shared implementations such as a future
`apply_lasa_oa_labels(data, file_code, name_corrections, to_factor, to_numeric, standardize_names, ...)`
to coexist with wave-aware ones such as
`apply_lasa046_labels(data, wave, name_corrections, to_factor, to_numeric, standardize_names)`.

After labelling, generic provenance attributes are attached:
`"LASA_wave"`, `"LASA_file_code"`, `"LASA_source_file"`, and
`"LASA_label_function"`. File-specific functions should attach their
variable-name matching audit under the generic `"label_report"`
attribute; retrieve it with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# Automatically dispatches to apply_lasa046_labels()
dat_e <- read_lasa_sav("LASAE046.SAV")

# Also dispatches to apply_lasa046_labels(), with wave = "3B"
dat_3b <- read_lasa_sav("LAS3B046.SAV")

# The four shared reshaping arguments are available directly on
# read_lasa_sav(), without needing to know they live on
# apply_lasa046_labels() specifically:
dat_h <- read_lasa_sav(
  "LASAH046.SAV",
  to_factor = TRUE,
  to_numeric = TRUE,
  standardize_names = TRUE
)

# Manually correct a mistyped column name:
dat_b <- read_lasa_sav(
  "LASAB046.SAV",
  name_corrections = c(lphya08 = "BLPYA08")
)

# Dispatches to apply_lasa004_labels() once that function exists
dat_z004 <- read_lasa_sav("LASAZ004.SAV")

# Both dispatch to apply_lasa_oa_labels() once that function exists
oa1 <- read_lasa_sav("LASAzoa1.sav")
oa2 <- read_lasa_sav("LASAzoa2.sav")
} # }
```
