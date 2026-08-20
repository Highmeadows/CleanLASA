#' Bundled LASA variable/value-label database
#'
#' The package's own snapshot of the label database, assembled by
#' `data-raw/build_lasa_label_db.R` from hardcoded, hand-maintained R
#' (`data-raw/labels/value_label_sets.R` and `data-raw/labels/variables_
#' <filecode>.R`), transcribed from LASA's own variable-information
#' documentation. [read_lasa_sav()] and [apply_lasa_labels()] use this
#' snapshot automatically, layered with any local corrections recorded by
#' [manual_update_lasa_labels()]. Not usually accessed directly -- call
#' [lasa_label_db()] instead, which returns this same schema layered with
#' any local updates.
#'
#' @format A list with four elements:
#' \describe{
#'   \item{variables}{One row per (`filecode`, `wave`, `variable_name`):
#'     `canonical_name` (the wave-stripped name), `variable_label` (the
#'     wave-specific text), `harmonized_var_label` (a cross-wave-consistent
#'     description of the same variable), `var_type`
#'     (`"numeric"`/`"categorical"`/`"text"`/`"date"`).}
#'   \item{value_labels}{One row per (`filecode`, `wave`, `variable_name`,
#'     `value_numeric`): `value_label`, `is_missing` -- the value labels as
#'     documented for that wave.}
#'   \item{value_labels_harmonized}{One row per (`filecode`,
#'     `canonical_name`, `value_numeric`): `value_label`, `is_missing` --
#'     the cross-wave-standardized value labels for that variable,
#'     independent of wave (used where a variable's coding was harmonized
#'     across waves that documented it slightly differently).}
#'   \item{manual_overrides}{A list of `variables`/`value_labels` patch
#'     tables; empty in the bundled snapshot -- populated only in a user's
#'     local copy by [manual_update_lasa_labels()].}
#' }
#'
#' @source Transcribed from LASA's own variable-information documentation
#'   (<https://lasa-vu.nl/en/topic-table/>) into
#'   `data-raw/labels/variables_<filecode>.R`, assembled by
#'   `data-raw/build_lasa_label_db.R`.
#' @seealso [lasa_label_db()], [apply_lasa_labels()], [manual_update_lasa_labels()]
"lasa_label_db_bundled"
