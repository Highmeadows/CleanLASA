# Read and label a LASA SPSS data file

Reads a LASA `.sav` file, identifies its wave and file code from the
file name, finds the corresponding file-specific `apply_*_labels()`
function, and applies that function to the imported data.

## Usage

``` r
read_lasa_sav(path, user_na = TRUE, read_sav_args = list(), ...)
```

## Arguments

- path:

  Path to a LASA SPSS `.sav` file. LASA file names are parsed
  case-insensitively.

- user_na:

  Logical passed to `haven::read_sav()`. The default is `TRUE` so SPSS
  user-defined missing codes remain available to the file-specific
  labelling function before any requested conversion to `NA`.

- read_sav_args:

  Optional named list of additional arguments passed to
  `haven::read_sav()`, for example `list(encoding = "UTF-8")`. Do not
  include `file` or `user_na`; those are controlled by `path` and
  `user_na`.

- ...:

  Named arguments forwarded unchanged to the selected file-specific
  label function. For LASA 046, supported options include `fuzzy_match`,
  `max_edit_distance`, `name_corrections`, `warn_unmatched`,
  `to_factor`, `to_numeric`, and `standardize_names`. Other
  file-specific implementations may expose a different set of options.
  Unsupported arguments are detected before the label function is
  called.

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

The selected function must already be available in the package namespace
or current R session. The wrapper always supplies `data`. It supplies
`wave` when that argument exists in the selected function's formal
arguments (checked via
[`formals()`](https://rdrr.io/r/base/formals.html)), and supplies
`file_code` when that argument exists. This permits shared
implementations such as a future
`apply_lasa_oa_labels(data, file_code, ...)` while retaining the
standard wave-aware interface used by
`apply_lasa046_labels(data, wave, ...)`.

Arguments supplied through `...` are reserved for the selected label
function, not for `haven::read_sav()`. They are validated against that
function's formal arguments and then passed through with
[`do.call()`](https://rdrr.io/r/base/do.call.html). For example, when
file 046 is detected, `to_factor = TRUE`, `to_numeric = TRUE`,
`standardize_names = TRUE`, and `name_corrections =` `...` are passed
directly to
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md).
Additional SPSS import options belong in `read_sav_args`.

After labelling, generic provenance attributes are attached:
`"LASA_wave"`, `"LASA_file_code"`, `"LASA_source_file"`, and
`"LASA_label_function"`. File-specific functions should attach their
variable-name audit under the generic `"label_report"` attribute.

## See also

[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# Automatically dispatches to apply_lasa046_labels()
dat_e <- read_lasa_sav(
  "LASAE046.SAV",
  to_factor = TRUE,
  to_numeric = TRUE,
  standardize_names = TRUE,
  name_corrections = c(lphya08 = "ELPYA08")
)

# Also dispatches to apply_lasa046_labels(), with wave = "3B"
dat_3b <- read_lasa_sav("LAS3B046.SAV")

# Dispatches to apply_lasa004_labels() once that function exists
dat_z004 <- read_lasa_sav("LASAZ004.SAV")

# Both dispatch to apply_lasa_oa_labels() once that function exists
oa1 <- read_lasa_sav("LASAzoa1.sav")
oa2 <- read_lasa_sav("LASAzoa2.sav")
} # }
```
