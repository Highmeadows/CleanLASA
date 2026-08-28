# Restore/reset the local LASA label database

The inverse of
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md):
discards recorded manual overrides (entirely, or scoped to a
`filecode`/`wave`/`variable`), and/or rebuilds the cached base tables
from whichever bundled database the currently-installed package ships –
useful after a package update that adds coverage or corrects a label the
local cache would otherwise keep shadowing indefinitely (see Details).

## Usage

``` r
restore_lasa_labels(
  filecode = NULL,
  wave = NULL,
  variable = NULL,
  rebuild = FALSE
)
```

## Arguments

- filecode:

  Optional LASA file code. Scopes which manual overrides are discarded;
  `NULL` (the default) discards overrides for every file code.

- wave:

  Optional LASA wave code, or `"all"`. Scopes which manual overrides are
  discarded within `filecode`; `NULL` (the default, same as `"all"`)
  discards overrides for every wave.

- variable:

  Optional wave-specific or canonical variable name. Scopes which manual
  overrides are discarded; `NULL` (the default) discards every matched
  override, regardless of variable. Resolved the same way
  [`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md)
  resolves it, so a correction originally recorded with `wave = "all"`
  (one row per wave) is found and removed in full from a single call.

- rebuild:

  Logical, default `FALSE`. If `TRUE`, also replace the cached
  `variables`/`value_labels`/`value_labels_harmonized` tables with fresh
  copies from the currently-installed package's bundled database –
  always the whole database (there is no per-filecode base layer to
  refresh selectively), regardless of any `filecode`/`wave`/ `variable`
  scope above.

## Value

Invisibly, a list describing what happened: `filecode`, `wave`,
`variable` (the requested scope, as supplied), `overrides_removed` (how
many manual-override rows, across both tables, were discarded),
`rebuilt` (whether the base tables were refreshed), and `cache_deleted`
(whether the local cache file was removed entirely, vs. rewritten with
what remains).

## Details

[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md)
persists a *full* snapshot of the label database to a per-user cache
file the first time it's called, not just the correction itself – so
once that cache exists, it takes precedence over the package's bundled
data on every subsequent
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)
call, for every file code, not only the one that was corrected. A later
package update with new or corrected coverage has no effect until that
cache is refreshed. `rebuild = TRUE` does that refresh, and (unless a
`filecode`/`wave`/`variable` scope leaves a manual override in place)
also has nothing left to shadow the bundled data with, so the cache file
itself is removed entirely – meaning any *future* package update takes
effect automatically, with no need to call this again.

## See also

[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md),
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# Undo every manual override ever recorded locally, keeping whatever
# base data is currently cached:
restore_lasa_labels()

# Undo overrides for just one file code:
restore_lasa_labels(filecode = "046")

# Undo one variable's override:
restore_lasa_labels(filecode = "046", variable = "lphya01")

# Full reset: discard every override AND refresh the base data from the
# currently-installed package (removes the local cache file entirely):
restore_lasa_labels(rebuild = TRUE)
} # }
```
