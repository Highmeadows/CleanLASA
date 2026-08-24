## Shared constants and helper functions for the per-filecode label
## database builders (data-raw/variable_<filecode>.R). Sourced once,
## before any of those scripts, by data-raw/build_lasa_label_db.R.
##
## Format each variable_<fc>.R builds: four "wide" tables -- one row per
## LASA wave documented for that filecode (plus a synthetic "all" row
## holding the cross-wave-harmonized/standardized values), one column per
## canonical variable name (plus the identifier columns below) -- then
## combined into:
##   .lasa_fc_<fc> <- list(
##     variables = <wave-specific variable names>,
##     variable_labels = <wave-specific + harmonized variable-label text>,
##     value_labels = <wave-specific + harmonized value-label sets, as
##                     list-columns: each cell is a named numeric vector,
##                     name = label text, value = numeric code>,
##     variable_types = <one collapsed type per canonical name, same shape>
##   )
##
## The pattern throughout: start from a mechanical default (a wave's
## variable name = its prefix + the canonical name; a wave's labels = the
## harmonized ones, subset to the names that wave actually documents),
## and override only the exceptions -- see .override_label(),
## .replace_labels(), .replace_in_list() below. Coverage (which canonical
## names a given wave actually documents -- not every filecode asks every
## variable in every wave) lives in exactly one place: the names present
## in that wave's entry of `variable_labels_list`/`value_labels_list` in
## each per-filecode script. Everything else (variables, value labels,
## types) derives its own per-wave coverage from those same names, so
## there's no separate coverage bookkeeping to keep in sync.

# Wave -> the lowercase prefix LASA puts on that wave's variable names.
# "A" is an earlier baseline wave documented by only a few filecodes (see
# .lasa_wave_rows()). A handful of filecodes' variables don't follow this
# convention at all (typos, non-standard casing, or an entirely different
# per-variable numbering scheme); those are corrected with
# .override_label() in the filecode's own script, not here.
wave_prefix <- c(
  `A` = "a", `B` = "b", `C` = "c", `D` = "d", `E` = "e", `2B` = "b",
  `F` = "f", `G` = "g", `H` = "h", `3B` = "b", `MB` = "b",
  `I` = "i", `J` = "j", `K` = "k"
)

# Identifiers carried alongside the canonical-name columns in every wide
# table -- not survey variables themselves. `file_identifiers` locate a
# row (filecode + this database's own wave label); `resp_identifiers`
# name the two columns every LASA dataset needs regardless of filecode
# (the case identifier and, once split out by standardize_names, the
# wave). No CSV documents these directly, so they're filled with a fixed
# default in every script; correct with .override_label() if a specific
# filecode/wave genuinely differs (e.g. a differently-cased respnr).
file_identifiers <- c("filecode", "LASA_Wave")
resp_identifiers <- c("respnr", "Wave")

## The row set for one filecode's wide tables: every standard wave in
## `wave_prefix` order, plus `"A"` only for the (rare) filecodes that
## document it, plus the synthetic `"all"` row last (the cross-wave-
## harmonized/standardized values -- same wave label
## manual_update_lasa_labels(wave = "all") already uses).
.lasa_wave_rows <- function(has_wave_a = FALSE) {
  waves <- names(wave_prefix)
  if (!has_wave_a) waves <- setdiff(waves, "A")
  c(waves, "all")
}

## An all-NA character data.frame with one row per `waves` and one column
## per identifier + canonical name. Internal building block for the four
## `.lasa_build_*_table()` functions below.
.lasa_new_wide_table <- function(canonical_name, filecode, waves) {
  cols <- c(file_identifiers, resp_identifiers, canonical_name)
  df <- as.data.frame(
    matrix(NA_character_, nrow = length(waves), ncol = length(cols)),
    stringsAsFactors = FALSE
  )
  names(df) <- cols
  df$filecode <- filecode
  df$LASA_Wave <- waves
  df
}

## Overwrites one cell of a `variables` table (as built by
## .lasa_build_name_table()) with an explicit value, for the rare
## documented name that doesn't match the mechanical wave-prefix pattern.
## Designed to be chained: `table |> .override_label(...) |> .override_label(...)`.
.override_label <- function(database, wave, variable, override_value) {
  row <- match(wave, database$LASA_Wave)
  if (is.na(row)) {
    stop("wave '", wave, "' not found in this table's LASA_Wave column.", call. = FALSE)
  }
  if (!variable %in% names(database)) {
    stop("'", variable, "' is not a column of this table.", call. = FALSE)
  }
  database[row, variable] <- override_value
  database
}

## Replaces named elements of `original_labels` (a named character
## vector) with the `...` values, matched by name; every other element is
## left untouched. Used for both variable-label and value-label text
## corrections. Errors on a name that doesn't already exist in
## `original_labels`, to catch a typo'd canonical name / value code
## early rather than silently no-op'ing.
.replace_labels <- function(original_labels, ...) {
  updates <- c(...)
  if (length(updates) == 0L) return(original_labels)
  idx <- match(names(updates), names(original_labels))
  if (anyNA(idx)) {
    stop(
      "name(s) not found in original_labels: ",
      paste(names(updates)[is.na(idx)], collapse = ", "),
      call. = FALSE
    )
  }
  original_labels[idx] <- updates
  original_labels
}

## Same idea as .replace_labels(), but for a named *list* of value-label
## vectors (one per canonical name) -- replaces the named entries with
## the `...` values (typically a .replace_labels() call on that entry's
## own vector), matched by name.
.replace_in_list <- function(original_list, ...) {
  updates <- list(...)
  if (length(updates) == 0L) return(original_list)
  idx <- match(names(updates), names(original_list))
  if (anyNA(idx)) {
    stop(
      "name(s) not found in original_list: ",
      paste(names(updates)[is.na(idx)], collapse = ", "),
      call. = FALSE
    )
  }
  original_list[idx] <- updates
  original_list
}

## Builds the `variables` wide table: the wave-specific variable name for
## every (wave, canonical name) pair that wave actually documents
## (i.e. every name present in `variable_labels_list[[paste0("Wave_", wave, "_labels")]]`),
## computed mechanically as `wave_prefix[wave]` + canonical name. Fix any
## cell this doesn't get right with .override_label() on the result.
.lasa_build_name_table <- function(variable_labels_list, filecode, waves = .lasa_wave_rows()) {
  canonical_name <- names(variable_labels_list$Harmonized_labels)
  df <- .lasa_new_wide_table(canonical_name, filecode, waves)
  df$respnr <- "respnr"
  df$Wave <- "Wave"
  for (w in setdiff(waves, "all")) {
    entry <- variable_labels_list[[paste0("Wave_", w, "_labels")]]
    covered <- names(entry)
    if (length(covered) > 0L) {
      df[df$LASA_Wave == w, covered] <- paste0(wave_prefix[[w]], covered)
    }
  }
  df
}

## Builds the `variable_labels` wide table directly from
## `variable_labels_list` (one entry per wave, `Harmonized_labels` for
## the `"all"` row) -- a canonical name absent from a wave's entry stays
## `NA` in that row (not documented for that wave).
.lasa_build_label_table <- function(variable_labels_list, filecode, waves = .lasa_wave_rows()) {
  canonical_name <- names(variable_labels_list$Harmonized_labels)
  df <- .lasa_new_wide_table(canonical_name, filecode, waves)
  df$respnr <- "Respondent ID"
  df$Wave <- "LASA measurement wave"
  for (w in waves) {
    key <- if (identical(w, "all")) "Harmonized_labels" else paste0("Wave_", w, "_labels")
    entry <- variable_labels_list[[key]]
    if (length(entry) > 0L) {
      df[df$LASA_Wave == w, names(entry)] <- unname(entry)
    }
  }
  df
}

## Builds the `value_labels` wide table from `value_labels_list` (one
## entry per wave, `Harmonized_labels` for the `"all"` row; each entry is
## a named list of canonical-name -> named value-label vector). Unlike
## the other tables, each canonical-name column is a *list column*: a
## cell holds the actual named numeric vector (name = label text,
## value = numeric code), not a string -- so it doesn't need
## re-parsing to be used later.
.lasa_build_value_table <- function(value_labels_list, filecode, waves = .lasa_wave_rows()) {
  canonical_name <- names(value_labels_list$Harmonized_labels)
  df <- .lasa_new_wide_table(canonical_name, filecode, waves)
  for (cn in canonical_name) df[[cn]] <- vector("list", nrow(df))
  for (w in waves) {
    key <- if (identical(w, "all")) "Harmonized_labels" else paste0("Wave_", w, "_labels")
    entry <- value_labels_list[[key]]
    row_idx <- which(df$LASA_Wave == w)
    for (cn in names(entry)) df[[cn]][[row_idx]] <- entry[[cn]]
  }
  df
}

## Builds the `variable_types` wide table from a single named vector
## (canonical name -> collapsed type: "numeric"/"categorical"/"text"/
## "date"), replicated across every row -- type is treated as a property
## of the canonical variable, not of a specific wave.
.lasa_build_type_table <- function(var_types_vec, filecode, waves = .lasa_wave_rows()) {
  canonical_name <- names(var_types_vec)
  df <- .lasa_new_wide_table(canonical_name, filecode, waves)
  for (w in waves) df[df$LASA_Wave == w, canonical_name] <- unname(var_types_vec)
  df
}
