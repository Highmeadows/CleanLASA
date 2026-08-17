# Bundled LASA variable/value-label database

The package's own snapshot of the label database, built by
`data-raw/build_lasa_label_db.R` from every LASA variable-information
PDF available at build time.
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
and
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
use this snapshot automatically, layered with any local updates recorded
by
[`update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/update_lasa_labels.md)
or
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

- documents:

  One row per parsed varinfo PDF: `document_id`, `source_url`,
  `pdf_filename`, `document_date`, `retrieved_at`, `sha256`,
  `parser_version`, `filecodes` (semicolon-joined).

- variables:

  One row per (`filecode`, `wave`, `variable_name`): `canonical_name`,
  `variable_label`, `var_type`
  (`"categorical"`/`"numeric"`/`"date"`/`"unresolved"`), `document_id`,
  `source_page`/`source_row`/`source_condition` (provenance within the
  PDF), `parse_note` (non-`NA` when this row needed manual review).

- value_labels:

  One row per (`filecode`, `wave`, `variable_name`, `value_raw`):
  `value_numeric`, `value_label`, `is_missing`, plus the same
  `document_id`/provenance/`parse_note` columns as `variables`.

- manual_overrides:

  A list of `variables`/`value_labels` patch tables; empty in the
  bundled snapshot – populated only in a user's local copy by
  [`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md).

## Source

Parsed from LASA variable-information PDFs
(<https://lasa-vu.nl/en/topic-table/>) by
`data-raw/build_lasa_label_db.R`.

## See also

[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md),
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md),
[`update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/update_lasa_labels.md)
