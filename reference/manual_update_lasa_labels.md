# Manually correct or add LASA variable/value labels

A hand-authored escape hatch for when the bundled
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)
is itself incomplete or wrong, or a user wants a custom label. Writes
directly to the user-local label database used by
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
and
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md).
Overrides are stored separately from the bundled data and are composed
back on top of it at lookup time, so a later package update never
silently discards a correction recorded here.

## Usage

``` r
manual_update_lasa_labels(
  filecode = NULL,
  wave = NULL,
  variable,
  var_label = NULL,
  val_labels = NULL,
  replace_val_labels = FALSE
)
```

## Arguments

- filecode:

  Optional LASA file code (e.g. `"046"`, `"zoa1"`, `"z004"`). Required
  when `variable`/`wave` match more than one file code, or when defining
  a brand-new variable no existing row matches.

- wave:

  Optional LASA wave code (e.g. `"B"`, `"2B"`), or `"all"` to apply the
  override to every wave the matched `filecode`+canonical-name
  combination exists for. Required when `variable` is a canonical name
  (which carries no wave information on its own), or when a
  wave-specific name's leading prefix is shared by more than one wave
  (e.g. `"b"` is shared by B/2B/3B/MB) and thus can't be inferred.

- variable:

  Required. Either a wave-specific variable name (e.g. `"blphya01"`) or
  a canonical name (e.g. `"lphya01"`).

- var_label:

  Optional replacement variable label. `NA`/omitted leaves the existing
  label untouched.

- val_labels:

  Optional named vector of value-label corrections, keyed by numeric
  code, e.g. `c(\`-5\verb = "NA, wrong, skip", \1\verb = "man") (quote
  or backtick negative/numeric-looking names).

- replace_val_labels:

  Logical, default `FALSE`. If `FALSE`, `val_labels` is merged into the
  existing value-label set (upserted by code). If `TRUE`, the result is
  *only* `val_labels` – every other coded value for this variable is
  dropped when labels are applied.

## Value

Invisibly, a list describing what was recorded: `filecode`, `wave` (the
resolved wave(s)), `variable_name`, and which of
`variable_label`/`value_labels` were updated.

## See also

[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md),
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# Merge a correction into the existing value-label set:
manual_update_lasa_labels(
  filecode = "046", wave = "B", variable = "lphya01",
  val_labels = c(`-5` = "NA, wrong, skip")
)

# Fully replace a variable's value labels:
manual_update_lasa_labels(
  variable = "lphya01", wave = "all", filecode = "046",
  val_labels = c(`-5` = "NA, wrong, skip"), replace_val_labels = TRUE
)
} # }
```
