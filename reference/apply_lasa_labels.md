# Apply LASA variable/value labels from the label database

The engine behind
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md):
attaches SPSS-style variable and value labels to a data frame using the
package's normalized
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md).
Works on any data frame, not only one produced by
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md):
pass `filecode`/`wave` explicitly, or let them be recovered
automatically from `data`'s own `"LASA_file_code"`/ `"LASA_wave"`
provenance attributes (set by
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
and by this function itself, so labelling can be safely re-applied after
a transformation like `dplyr::mutate()` strips attributes) or from a
single-valued `"Wave"` column.

## Usage

``` r
apply_lasa_labels(
  data,
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
  to_numeric = TRUE
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

- name_corrections:

  Optional named character vector overriding automatic column matching
  for specific variables, in the format
  `canonical_name = "faulty_or_nonstandard_name"`, e.g.
  `c(lphya08 = "BLPYA08")`.

- fuzzy_matching:

  Logical, default `TRUE`. When a variable isn't found by exact or
  canonical-name matching, try an edit-distance match (via
  [`utils::adist()`](https://rdrr.io/r/utils/adist.html)) against the
  data columns not already claimed by another variable, absorbing most
  typos. A unique best match within the distance threshold is used
  (recorded as `"fuzzy"` in the
  [`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md)
  audit); a tie is left unmatched (`"ambiguous fuzzy"`) rather than
  guessed.

- standardize:

  Logical, default `TRUE`. Overarching switch for `.standardize_names`,
  `.standardize_var_labels`, and `.standardize_val_labels`: each
  defaults to following `standardize`, but can be set independently.

- .standardize_names:

  Logical or `NULL` (default). If `TRUE`, matched columns are renamed to
  their canonical (wave-stripped) lowercase name; if `NULL`, follows
  `standardize`. Implies `add_wavecode = TRUE`.

- .standardize_var_labels:

  Logical or `NULL` (default). If `TRUE`, the harmonized
  (cross-wave-consistent) variable label is attached as the active
  `"label"` instead of the wave-specific one; if `NULL`, follows
  `standardize`. The wave-specific label is always available separately
  as `"wave_label"`.

- .standardize_val_labels:

  Logical or `NULL` (default). If `TRUE`, the harmonized value-label set
  is used as the active `"labels"` (and for `to_factor` level text)
  instead of the wave-specific one, where one is documented; if `NULL`,
  follows `standardize`. The wave-specific value labels are always
  available separately as `"labels_wave"`.

- add_wavecode:

  Logical, default `FALSE`. If `TRUE`, inserts a `"Wave"` column (filled
  with the already-resolved `wave`) right after `"respnr"`. Forced to
  `TRUE` whenever `.standardize_names` is effectively `TRUE`.

- to_factor:

  Logical, default `TRUE`. Convert categorical (value-labelled)
  variables to factors using the active value labels as levels, instead
  of leaving them numeric/character. A variable whose value coding is
  inconsistent across waves (database `var_type == "text"`) is instead
  recoded to its wave-specific label text (character), never a factor –
  see Details.

- to_numeric:

  Logical, default `TRUE`. Restore count/continuous variables (per the
  database's `var_type`) to plain numeric, converting negative codes to
  `NA`.

## Value

`data`, labelled (and optionally reshaped/renamed) with
`"label_report"`, `"variable.labels"`, `"LASA_wave"`, and
`"LASA_file_code"` attributes (re-)attached. Each matched column also
carries `"label"`/`"labels"` (the *active* variable label / value labels
– wave-specific unless the corresponding standardize switch is on),
`"wave_label"`/`"labels_wave"` (always the wave-specific versions),
`"canonical_name"` (the wave-stripped variable name), and, where the
database documents them, `"harmonized_label"`/ `"labels_harmonized"`
(the cross-wave-consistent versions – never present for a
`var_type == "text"` variable).

## Details

Identity (file code and wave) is resolved in priority order: (1) the
`filecode`/`wave` arguments, if supplied; (2) `data`'s own
`"LASA_file_code"`/`"LASA_wave"` attributes; (3) a single-valued
`"Wave"` column in `data` (for the wave only – `filecode` must still
come from elsewhere); (4) a best-effort guess from `data`'s own object
name, when it happens to follow the LASA file-naming convention (e.g. a
data frame literally named `LASAB046`) – never required, and not
something to rely on.

Column matching tries, in order: (1) an explicit `name_corrections`
override, (2) an exact (case-sensitive) match against the wave-specific
documented name, (3) a case-insensitive match against that name, (4) an
exact match against the canonical (wave-stripped) name, (5) a
case-insensitive match against the canonical name, (6) when
`fuzzy_matching = TRUE`, an edit-distance match against the data columns
not already claimed. `"respnr"` is matched through this same chain (it
isn't a documented database variable, so it's always matched by name
rather than canonical/value-label lookups).

Unmatched variables in either direction (documented but absent from
`data`, or present in `data` but undocumented) are never an error –
they're left alone and recorded in the `"label_report"` attribute; see
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

A variable's value coding sometimes genuinely differs by wave (e.g. a
binary code's polarity flipped, or an income variable's brackets were
redefined) so no single cross-wave value label could be written; the
database marks such a variable `var_type == "text"` and documents no
harmonized value labels for it at all. `to_factor` then recodes it to
its wave-specific label text (character) instead of a factor, so waves
whose numeric codes disagree but whose label text agrees (e.g.
`0 = "no", 1 = "yes"` vs. `1 = "no", 2 = "yes"`) still merge correctly.

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
