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
## harmonized ones, with wave-specific text spliced in) and override only
## the exceptions -- see .override_label(), .replace_labels(),
## .replace_in_list() below. Coverage (which canonical names a given wave
## actually documents -- not every filecode asks every variable in every
## wave) lives in exactly one place per script: its own `wave_coverage`
## list, declared once near the top. The four wide tables are built
## first from the *unsubsetted* label lists (every wave "has" every
## canonical name in the file), then .lasa_prune_wave_coverage() nulls
## each wave back down to its `wave_coverage` entry in one pass at the
## end -- so there's still no separate coverage bookkeeping to keep in
## sync, just one list per script instead of a repeated inline subset at
## every `Wave_X_labels` call site.

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

## Shared default harmonized labels for LASA's most common negative
## (missing-reason) value codes -- consistent enough in meaning across
## nearly every filecode that hand-retyping/re-overriding them per
## variable and per wave is pure duplication. Used the same way
## `harmonized_labels` already is in each variable_<fc>.R script: spliced
## into a variable's own harmonized vector (e.g.
## `default_missing_labels[c("-1", "-3", "-4")]` for a variable without
## a documented -2), overridden with `.replace_labels()` only for the
## rare genuine deviation.
##
## Text chosen per code as the single most common exact wording already
## in use across the 239 variable_<fc>.R files (a corpus-wide survey of
## every `` `-N` = "..." `` entry) -- not a uniform style, because the
## dominant convention genuinely differs by code (-1/-3/-4 mostly read
## "na, ...", -2 mostly reads "not available, routing"); matching each
## code's own real majority usage keeps this default from silently
## contradicting the wording actually used almost everywhere. -2's own
## "na, see <other variable>" cross-references stay variable-specific
## text (never folded into this default): they name *which* other
## variable caused the routing skip, information this generic label
## can't carry. -5 and more extreme codes vary too much by filecode/
## variable (refusal vs. interview-termination vs. entirely bespoke
## reasons, and are occasionally repurposed as a real substantive
## category value, e.g. "-3 = monastery") to have a safe shared default.
default_missing_labels <- c(
  `-1` = "na, asked",
  `-2` = "not available, routing",
  `-3` = "na, wrong skip",
  `-4` = "na, short interview"
)

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

## Nulls out, per wave, every canonical-name cell not in that wave's
## `wave_coverage` entry -- lets `variable_labels_list`/`value_labels_list`
## be authored unsubsetted (every wave's entry = the full harmonized/
## standardized set plus its own `.replace_labels()`/`.replace_in_list()`
## deltas, no `[c(...)]` subsetting at any call site) while the four wide
## tables built from them still end up with exactly the per-wave coverage
## that subsetting used to produce directly. Called once, at the very end
## of each variable_<fc>.R script, on the `fc_labels` list built from the
## four `.lasa_build_*_table()` calls.
##
## `variable_types` is left untouched: type is a property of the
## canonical variable, not of a specific wave, so there's nothing to
## prune there. `value_labels` is a list-column (see
## .lasa_build_value_table()), so its cells are nulled with `list(NULL)`
## per column -- a vectorized `<- NA` would instead set the cell to the
## atomic value `NA`, which is not the same as clearing it (and would
## break the flatten step in build_lasa_label_db.R, which expects an
## absent value-label set to be `NULL`, not `NA`).
.lasa_prune_wave_coverage <- function(fc_labels, wave_coverage) {
  keep_always <- c(file_identifiers, resp_identifiers)
  for (w in names(wave_coverage)) {
    keep <- c(keep_always, wave_coverage[[w]])

    row_v <- which(fc_labels$variables$LASA_Wave == w)
    row_l <- which(fc_labels$variable_labels$LASA_Wave == w)
    row_x <- which(fc_labels$value_labels$LASA_Wave == w)

    drop_v <- setdiff(names(fc_labels$variables), keep)
    drop_l <- setdiff(names(fc_labels$variable_labels), keep)
    drop_x <- setdiff(names(fc_labels$value_labels), keep)

    fc_labels$variables[row_v, drop_v] <- NA_character_
    fc_labels$variable_labels[row_l, drop_l] <- NA_character_
    for (cn in drop_x) fc_labels$value_labels[[cn]][row_x] <- list(NULL)
  }
  fc_labels
}

## A harmonized value label is a human-authored placeholder, the fixed
## string "label varies by wave", when a code's real-world meaning
## genuinely differs by wave and no single cross-wave label could be
## written -- the author typed this in as a stand-in rather than leave it
## blank. See data-raw/build_lasa_label_db.R for what happens next: a
## default-eligible code (-1..-4) is backfilled from
## `default_missing_labels`; any other code is dropped from that
## variable's harmonized value labels and the variable's var_type is
## reclassified "text" (its wave-specific label text is used instead, see
## R/lasa_apply_labels.R).
## `%in%`, not `==`: a value-label vector can legitimately hold
## NA_character_ (a code that exists but was never given specific
## wording) -- `==` would propagate that to NA and break any `if(any(...))`
## caller downstream, where `%in%` correctly (and silently) reads it as
## "not a placeholder".
.lasa_is_placeholder_category_label <- function(label_text) {
  trimws(label_text) %in% "label varies by wave"
}
