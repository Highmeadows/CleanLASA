# Refresh the LASA label database from a variable-information PDF

Downloads (or reads, via `path`) one LASA varinfo PDF, parses it, and
merges the result into the user-local label database used by
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
and
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
– replacing only the records this PDF itself owns (its `document_id` and
every file code it documents), never anything recorded by a different
document, and never a
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md)
correction (a separate table, composed back on top at lookup time).

## Usage

``` r
update_lasa_labels(
  filecode = NULL,
  url = NULL,
  path = NULL,
  dry_run = FALSE,
  strict = TRUE
)
```

## Arguments

- filecode:

  Optional LASA file code to resolve a PDF for (e.g. `"046"`, `"z004"`,
  `"zoa1"`, or the bare group prefix `"zoa"` when unambiguous). Ignored
  when `url` or `path` is supplied.

- url:

  Optional explicit PDF URL, bypassing file-code resolution.

- path:

  Optional path to an already-downloaded PDF, bypassing both resolution
  and download – the only supported way to update the database without
  network access.

- dry_run:

  Logical, default `FALSE`. If `TRUE`, parse and validate as usual and
  return the same structured result, but never write to the database.

- strict:

  Logical, default `TRUE`. If `TRUE`, any row that couldn't be
  unambiguously parsed (wave-prefix expansion failure, an unresolved
  cross-reference, etc.) for a filecode the caller explicitly requested
  blocks the update entirely (the existing database is left untouched)
  rather than silently degrading its coverage. Has no effect on rows for
  other file codes incidentally sharing the same PDF.

## Value

Invisibly, a list describing what happened: `status` (`"no_op"`,
`"inserted"`, or `"updated"`), `document_id`, `pdf_changed` (`FALSE` for
an identical-hash no-op), `filecodes`, `n_variables`, `n_value_labels`,
and `n_unresolved` (rows carrying a `parse_note`).

## See also

[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md),
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)
