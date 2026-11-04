#' Bundled LASA variable/value-label database
#'
#' The package's own snapshot of the label database, assembled by
#' `data-raw/build_lasa_label_db.R` from hardcoded, hand-maintained R
#' (`data-raw/label_db_helpers.R` and `data-raw/variable_<filecode>.R`),
#' transcribed from LASA's own variable-information
#' documentation. [read_lasa_sav()] and [apply_lasa_labels()] use this
#' snapshot automatically, layered with any local corrections recorded by
#' [manual_update_lasa_labels()]. Not usually accessed directly -- call
#' [lasa_label_db()] instead, which returns this same schema layered with
#' any local updates.
#'
#' @format A list with five elements:
#' \describe{
#'   \item{variables}{One row per (`filecode`, `wave`, `variable_name`):
#'     `canonical_name` (the wave-stripped name), `variable_label` (the
#'     wave-specific text), `harmonized_var_label` (a cross-wave-consistent
#'     description of the same variable), `var_type`
#'     (`"numeric"`/`"categorical"`/`"text"`/`"date"`), `can_be_negative`
#'     (`TRUE` when the documentation shows the variable's genuine values
#'     can be negative, e.g. a hearing threshold in dB, so only its
#'     documented missing-value codes count as missing).}
#'   \item{value_labels}{One row per (`filecode`, `wave`, `variable_name`,
#'     `value_numeric`): `value_label`, `is_missing` -- the value labels as
#'     documented for that wave. `is_missing` is `TRUE` for a missing-value
#'     code: every negative code.}
#'   \item{value_labels_harmonized}{One row per (`filecode`,
#'     `canonical_name`, `value_numeric`): `value_label`, `is_missing` --
#'     the cross-wave-standardized value labels for that variable,
#'     independent of wave (used where a variable's coding was harmonized
#'     across waves that documented it slightly differently). A missing
#'     code whose meaning differs between waves has a row for each
#'     meaning, the later ones at a free code such as -9 or -99.}
#'   \item{value_labels_crosswalk}{One row per (`filecode`, `wave`,
#'     `variable_name`, `value_numeric`) whose standardized reading differs
#'     from the wave's own: `canonical_name`, `harmonized_numeric` (the
#'     harmonized code of a moved missing code; `NA` for an answer of a
#'     `"text"` variable), `harmonized_label`, `is_missing`, and `level`
#'     (the position of a `"text"` variable's answer among its factor
#'     levels, which are every wave's answers).}
#'   \item{manual_overrides}{A list of `variables`/`value_labels` patch
#'     tables; empty in the bundled snapshot -- populated only in a user's
#'     local copy by [manual_update_lasa_labels()].}
#' }
#'
#' @source Transcribed from LASA's own variable-information documentation
#'   (<https://lasa-vu.nl/en/topic-table/>) into
#'   `data-raw/variable_<filecode>.R`, assembled by
#'   `data-raw/build_lasa_label_db.R`.
#' @seealso [lasa_label_db()], [apply_lasa_labels()], [manual_update_lasa_labels()]
"lasa_label_db_bundled"
