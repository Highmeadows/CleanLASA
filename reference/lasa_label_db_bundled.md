# Bundled LASA variable/value-label database

The package's own snapshot of the label database, assembled by
`data-raw/build_lasa_label_db.R` from hardcoded, hand-maintained R
(`data-raw/labels/value_label_sets.R` and
`data-raw/labels/variables_ <filecode>.R`), transcribed from LASA's own
variable-information documentation.
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
and
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
use this snapshot automatically, layered with any local corrections
recorded by
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md).
Not usually accessed directly – call
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)
instead, which returns this same schema layered with any local updates.

## Usage

``` r
lasa_label_db_bundled
```

## Format

A list with four elements:

- variables:

  One row per (`filecode`, `wave`, `variable_name`): `canonical_name`
  (the wave-stripped name), `variable_label` (the wave-specific text),
  `harmonized_var_label` (a cross-wave-consistent description of the
  same variable), `var_type`
  (`"numeric"`/`"categorical"`/`"text"`/`"date"`).

- value_labels:

  One row per (`filecode`, `wave`, `variable_name`, `value_numeric`):
  `value_label`, `is_missing` – the value labels as documented for that
  wave.

- value_labels_harmonized:

  One row per (`filecode`, `canonical_name`, `value_numeric`):
  `value_label`, `is_missing` – the cross-wave-standardized value labels
  for that variable, independent of wave (used where a variable's coding
  was harmonized across waves that documented it slightly differently).

- manual_overrides:

  A list of `variables`/`value_labels` patch tables; empty in the
  bundled snapshot – populated only in a user's local copy by
  [`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md).

## Source

Transcribed from LASA's own variable-information documentation
(<https://lasa-vu.nl/en/topic-table/>) into
`data-raw/labels/variables_<filecode>.R`, assembled by
`data-raw/build_lasa_label_db.R`.

## See also

[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md),
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md),
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md)
