# Apply LASA variable/value labels from the label database

Attaches SPSS-style variable and value labels to a data frame using the
package's normalized
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md),
instead of a file-specific `apply_lasa*_labels()` function. Works on any
data frame, not only one produced by
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md):
pass `filecode`/`wave` explicitly, or let them be recovered
automatically from `data`'s own `"LASA_file_code"`/ `"LASA_wave"`
provenance attributes (set by
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
and by this function itself, so labelling can be safely re-applied after
a transformation like `dplyr::mutate()` strips attributes) or from a
single-valued `"LASA_wave"` column.

## Usage

``` r
apply_lasa_labels(
  data,
  filecode = NULL,
  wave = NULL,
  name_corrections = NULL,
  to_factor = FALSE,
  to_numeric = FALSE,
  standardize_names = FALSE,
  split_wavecode = FALSE
)
```

## Arguments

- data:

  A data frame or tibble to label.

- filecode:

  Optional LASA file code (e.g. `"046"`, `"z004"`). If omitted,
  recovered from `data`'s provenance (see Details).

- wave:

  Optional LASA wave code (e.g. `"B"`, `"2B"`). If omitted, recovered
  from `data`'s provenance (see Details).

- name_corrections, to_factor, to_numeric, standardize_names,
  split_wavecode:

  The same five shared reshaping arguments used throughout this package
  (see
  [`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)).

## Value

`data`, labelled (and optionally reshaped/renamed) exactly as
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
would, with `"label_report"`, `"LASA_wave"`, and `"LASA_file_code"`
attributes (re-)attached. Each labelled column also carries `"label"`
(the wave-specific variable label), `"labels"` (its value labels,
SPSS/haven-style), `"canonical_name"` (the wave-stripped variable name),
`"harmonized_label"` (the cross-wave-consistent variable label), and,
where the database documents one, `"labels_harmonized"` (the
cross-wave-standardized value labels) – groundwork for a future
`standardize_names`/`standardize_labels` pair of arguments, not yet
implemented.

## Details

Identity (file code and wave) is resolved in priority order: (1) the
`filecode`/`wave` arguments, if supplied; (2) `data`'s own
`"LASA_file_code"`/`"LASA_wave"` attributes; (3) a single-valued
`"LASA_wave"` column in `data` (for the wave only – `filecode` must
still come from elsewhere); (4) a best-effort guess from `data`'s own
object name, when it happens to follow the LASA file-naming convention
(e.g. a data frame literally named `LASAB046`) – never required, and not
something to rely on.

Column matching tries, in order: (1) an explicit `name_corrections`
override, (2) an exact (case-sensitive) match against the wave-specific
documented name, (3) a case-insensitive match against that name, (4) an
exact match against the canonical (wave-stripped) name, (5) a
case-insensitive match against the canonical name.

## See also

[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md),
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md),
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md)

## Examples

``` r
if (FALSE) { # \dontrun{
dat <- read_lasa_sav("LASAB046.SAV")
dat <- dplyr::mutate(dat, respnr = respnr) # attributes stripped
dat <- apply_lasa_labels(dat) # re-applies via stored provenance
} # }
```
