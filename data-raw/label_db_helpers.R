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
## Every variable_<fc>.R script declares its content via the
## variable_labels()/value_labels()/.lasa_finalize_fc() DSL below --
## .lasa_finalize_fc() assembles the four wide tables via the
## .lasa_build_*_table() functions below, already correctly subsetted to
## each wave's own coverage (no separate pruning step needed). Fix an
## irregular wave-specific variable *name* with .override_label() on the
## result, chained after .lasa_finalize_fc() -- see its own header
## comment for the pattern.

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

## A harmonized value label is a human-authored placeholder, the fixed
## string "label varies by wave", when a code's real-world meaning
## genuinely differs by wave and no single cross-wave label could be
## written -- the author typed this in as a stand-in rather than leave it
## blank (a code like this is simply never given a "Z"-scoped
## value_labels() declaration in the new DSL; the marker/detector below
## stays only for recognizing it in already-built data, e.g. a manual
## override, not as something a script authors going forward). See
## data-raw/build_lasa_label_db.R for what happens next: the code is
## dropped from that variable's harmonized value labels and the
## variable's var_type is reclassified "text" (its wave-specific label
## text is used instead, see R/lasa_apply_labels.R).
## `%in%`, not `==`: a value-label vector can legitimately hold
## NA_character_ (a code that exists but was never given specific
## wording) -- `==` would propagate that to NA and break any `if(any(...))`
## caller downstream, where `%in%` correctly (and silently) reads it as
## "not a placeholder".
.lasa_is_placeholder_category_label <- function(label_text) {
  trimws(label_text) %in% "label varies by wave"
}

## -----------------------------------------------------------------------
## Declarative authoring DSL: variable_labels()/value_labels()/
## .lasa_finalize_fc() -- every data-raw/variable_<fc>.R script declares
## its content through these, replacing an earlier round's
## harmonized_labels/wave_coverage/.replace_labels()/.replace_in_list()
## pattern (no longer present here at all).
##
## New shape a variable_<fc>.R script authors, top to bottom:
##   var_types_vec <- c(cn1 = "numeric", cn2 = "categorical", ...)  # every
##     canonical name this filecode declares, in any order -- everything
##     below is matched to it by name, never by position.
##   variable_labels(cn1 = "text", ..., .applies_to_waves = c("Z"))  # the
##     harmonized/default declaration, and/or
##   variable_labels("cn1", "cn2", ..., .applies_to_waves = c("C", "D"))  # a
##     bare-name coverage call (inherits "Z" text), and/or
##   variable_labels(cn1 = "wave-specific text", ..., .applies_to_waves = c("C", "D"))  # an
##     override call -- any one call is bare-only or override-only, never both
##   value_labels(`-1` = "na", ..., .applies_to_vars = c("cn1", "cn2"), .applies_to_waves = c("Z", "C", "D"))
##     additive: a (variable, wave) pair's final code set is the union of
##     every value_labels() call naming it (see value_labels() below)
##   negative_values("cn1", ..., .applies_to_waves = c("E", "F"))  # numeric
##     variables whose genuine values can be negative (see negative_values())
##   .lasa_fc_<fc> <- .lasa_finalize_fc("<fc>")  # closes out the file
##
## "Z" is a synthetic sentinel wave, never a real LASA one, standing in
## for the cross-wave-harmonized/default declaration -- translated to the
## existing "all"/Harmonized_labels convention below, so nothing past
## .lasa_finalize_fc() (build_lasa_label_db.R, the four
## .lasa_build_*_table() functions above) needs to know the DSL exists.

## Internal accumulator for variable_labels()/value_labels() below --
## reset by .lasa_finalize_fc() at the end of every variable_<fc>.R
## script (via on.exit()), so declarations never leak from one file into
## the next even though every script is source()'d into the same shared
## environment (see build_lasa_label_db.R's loop).
.lasa_dsl_state <- new.env(parent = emptyenv())
.lasa_reset_dsl_state <- function() {
  .lasa_dsl_state$variable_labels_calls <- list()
  .lasa_dsl_state$value_labels_calls <- list()
  .lasa_dsl_state$negative_values_calls <- list()
}
.lasa_reset_dsl_state()

## Declares variable-label text for a set of canonical names, for a set
## of waves -- replaces a `Wave_X_labels = .replace_labels(harmonized_labels, ...)`
## call site. `...` must be either all bare (unnamed) canonical-name
## strings -- coverage only, text inherited from this file's "Z"
## (harmonized) declaration -- or all named (`cn = "text"`) -- this
## wave-set's own override text for `cn` -- never a mix of the two in
## one call (split into two calls sharing the same .applies_to_waves
## instead); this keeps a call from having to be scanned past a long
## bare-name list to find the handful of actual overrides, or vice
## versa. Called directly; does not return the accumulated state, only
## appends to it -- .lasa_finalize_fc() reads .lasa_dsl_state back.
variable_labels <- function(..., .applies_to_waves) {
  dots <- list(...)
  if (length(dots) == 0L) {
    stop("variable_labels() needs at least one canonical name or `name = \"text\"` entry.", call. = FALSE)
  }
  nms <- names(dots)
  if (is.null(nms)) nms <- rep("", length(dots))
  bare <- unlist(dots[nms == ""], use.names = FALSE)
  overrides <- dots[nms != ""]
  if (length(bare) > 0L && length(overrides) > 0L) {
    stop(
      "variable_labels() call mixes bare coverage names and named overrides -- ",
      "split into two calls (one bare, one override) sharing the same .applies_to_waves.",
      call. = FALSE
    )
  }
  if (length(bare) > 0L && !is.character(bare)) {
    stop("variable_labels()'s bare (unnamed) arguments must be canonical name strings.", call. = FALSE)
  }
  if (anyDuplicated(bare) > 0L) {
    stop("variable_labels() call repeats bare name(s): ", paste(unique(bare[duplicated(bare)]), collapse = ", "), call. = FALSE)
  }
  if (anyDuplicated(names(overrides)) > 0L) {
    stop(
      "variable_labels() call repeats override name(s): ",
      paste(unique(names(overrides)[duplicated(names(overrides))]), collapse = ", "),
      call. = FALSE
    )
  }
  if (length(overrides) > 0L && !all(vapply(overrides, function(x) is.character(x) && length(x) == 1L, logical(1)))) {
    stop("variable_labels()'s named arguments must each be a single text string.", call. = FALSE)
  }
  if (!is.character(.applies_to_waves) || length(.applies_to_waves) == 0L) {
    stop("variable_labels() needs a non-empty .applies_to_waves character vector.", call. = FALSE)
  }
  call <- list(covered = c(bare, names(overrides)), overrides = overrides, waves = .applies_to_waves)
  .lasa_dsl_state$variable_labels_calls <- c(.lasa_dsl_state$variable_labels_calls, list(call))
  invisible(NULL)
}

## Declares a partial, ADDITIVE contribution of value-label codes for a
## set of canonical names, for a set of waves -- replaces a
## `cn = .replace_labels(standardized_value_labels$cn, ...)` entry inside
## a `Wave_X_labels = .replace_in_list(...)` call. Additive, not a full
## replacement: multiple calls can cover the same (variable, wave) pair,
## as long as they never repeat the same numeric code for it (checked at
## .lasa_finalize_fc() time, across every call in the file) -- a
## (variable, wave) pair's final code set is the union of every call
## naming it. This is what lets a small set of near-universal codes (the
## missing-reason codes, mainly) be declared once, spliced directly as
## literal text into one call covering every variable/wave that shares
## them, with each variable's/wave-group's own remaining codes added by
## later, more narrowly-scoped calls. A (variable, wave) pair not named
## by any call simply has no value labels -- the natural default state,
## no separate "empty call" mechanism needed. As with variable_labels(),
## "Z" can be mixed with real waves in one call's .applies_to_waves.
##
## LASA codes missing values as negative numbers, so every negative code
## is a missing-value code (build_lasa_label_db.R sets `is_missing = code
## < 0`) -- including a code whose label names a valid answer (`-2` =
## "valid score", "never had job", "normal test"): in context it explains
## why the value is missing. Values a numeric variable's documentation
## lists only to describe its scale (its range or endpoints, such as
## "lowest" or "high prestige", or example values such as a -9.2 dB
## threshold) are measurements, not codes, so they get no value label
## (.lasa_finalize_fc() refuses one transcribed without wording); a value
## that stands for a range keeps its wording, e.g. `98` = "98 or more".
value_labels <- function(..., .applies_to_vars, .applies_to_waves) {
  labels <- c(...)
  if (length(labels) == 0L) {
    stop("value_labels() needs at least one `code = \"text\"` entry.", call. = FALSE)
  }
  nms <- names(labels)
  if (is.null(nms) || any(nms == "")) {
    stop("value_labels()'s `...` entries must all be named by their numeric code, e.g. `-1` = \"na\".", call. = FALSE)
  }
  if (anyDuplicated(nms) > 0L) {
    stop("value_labels() call repeats code(s): ", paste(unique(nms[duplicated(nms)]), collapse = ", "), call. = FALSE)
  }
  if (!is.character(.applies_to_vars) || length(.applies_to_vars) == 0L) {
    stop("value_labels() needs a non-empty .applies_to_vars character vector.", call. = FALSE)
  }
  if (!is.character(.applies_to_waves) || length(.applies_to_waves) == 0L) {
    stop("value_labels() needs a non-empty .applies_to_waves character vector.", call. = FALSE)
  }
  call <- list(labels = labels, vars = .applies_to_vars, waves = .applies_to_waves)
  .lasa_dsl_state$value_labels_calls <- c(.lasa_dsl_state$value_labels_calls, list(call))
  invisible(NULL)
}

## Declares canonical names whose genuine values can be negative in the
## given (real) waves -- a measurement the documentation defines as signed,
## such as a hearing threshold in dB, a signed difference score, or an
## EQ-5D index. LASA codes missing values as negative numbers, and an
## undocumented negative number in a variable's data is normally read as
## a missing code too; for these variables only their documented missing
## codes are, and every other negative value is kept as a measurement.
negative_values <- function(..., .applies_to_waves) {
  vars <- c(...)
  if (length(vars) == 0L || !is.character(vars) || !is.null(names(vars))) {
    stop("negative_values() needs one or more bare canonical-name strings.", call. = FALSE)
  }
  if (!is.character(.applies_to_waves) || length(.applies_to_waves) == 0L || "Z" %in% .applies_to_waves) {
    stop("negative_values() needs a non-empty .applies_to_waves of real waves (not \"Z\").", call. = FALSE)
  }
  call <- list(vars = vars, waves = .applies_to_waves)
  .lasa_dsl_state$negative_values_calls <- c(.lasa_dsl_state$negative_values_calls, list(call))
  invisible(NULL)
}

## Resolves one wave's variable_labels() text for every name in
## `all_names`: every variable_labels() call whose .applies_to_waves
## includes `wave` contributes either its own override text (named
## arguments) or, for a bare/coverage-only name, `default`'s text for
## that name -- errors if two calls both name the same canonical name
## for this wave (a scalar label has no legitimate way to be "spliced"
## from two calls), or if a bare name has no `default` text to inherit
## (always the case for wave == "Z" itself, since `default = NULL` there
## -- there's nothing "before" the harmonized declaration to default
## from). When `full = TRUE` (the "Z" resolution), returns a vector
## covering every name in `all_names` (NA for a name with no "Z" text at
## all) -- this fixes the table column *universe* for every wave via
## .lasa_build_name_table()/.lasa_build_label_table(), which key their
## canonical_name set off `names(variable_labels_list$Harmonized_labels)`,
## so it must include every declared canonical name even when some have
## no harmonized default. When `full = FALSE` (a real wave), returns
## only the names actually resolved for it -- the per-wave *coverage*
## itself, exactly as an unpadded/subsetted vector always has.
.lasa_resolve_calls <- function(var_calls, wave, default, all_names, filecode, full = FALSE) {
  resolved <- character(0)
  for (call in var_calls) {
    if (!(wave %in% call$waves)) next
    overrides <- call$overrides
    for (nm in names(overrides)) {
      if (nm %in% names(resolved)) {
        stop(filecode, ": variable_labels() declares '", nm, "' for wave '", wave, "' in more than one call.", call. = FALSE)
      }
      resolved[nm] <- overrides[[nm]]
    }
    bare <- setdiff(call$covered, names(overrides))
    for (nm in bare) {
      if (nm %in% names(resolved)) {
        stop(filecode, ": variable_labels() declares '", nm, "' for wave '", wave, "' in more than one call.", call. = FALSE)
      }
      if (is.null(default) || !(nm %in% names(default)) || is.na(default[[nm]])) {
        stop(
          filecode, ": variable_labels() bare-references '", nm, "' for wave '", wave,
          "' but it has no Z (harmonized) default text -- give it its own override text for this wave.",
          call. = FALSE
        )
      }
      resolved[nm] <- default[[nm]]
    }
  }
  if (full) {
    out <- stats::setNames(rep(NA_character_, length(all_names)), all_names)
    out[names(resolved)] <- resolved
    return(out)
  }
  resolved
}

## Resolves one wave's value_labels() codes -- additive across calls (see
## value_labels()): every call whose .applies_to_waves includes `wave`
## contributes its codes to each of its .applies_to_vars, erroring if two
## calls both contribute the same numeric code for the same (wave,
## variable) pair. When `full = FALSE` (the real-wave case), also errors
## if a call names a variable that `covered` (variable_labels()'s own
## resolved coverage for this wave) doesn't include -- a value_labels()
## call has no meaning for a variable this wave doesn't even document;
## checked via `!full`, not `covered`'s own emptiness, since a real wave
## with zero coverage still has a `covered` that legitimately reduces to
## `character(0)`/`NULL` and must still be checked against. When
## `full = TRUE` (the "Z" resolution -- no coverage check, `covered` is
## unused), returns an entry for every name in `all_names` (an empty
## `character(0)` set, never a bare `NULL`, for a name with no "Z"-scoped
## value labels -- `NULL` would delete rather than clear the
## corresponding list-column cell in .lasa_build_value_table()) -- fixes
## the table column universe the same way .lasa_resolve_calls(full = TRUE)
## does. When `full = FALSE`, returns only the names actually given value
## labels for it -- sparse, exactly as before.
.lasa_resolve_value_calls <- function(val_calls, wave, covered = character(0), all_names = NULL, filecode, full = FALSE) {
  resolved <- list()
  for (call in val_calls) {
    if (!(wave %in% call$waves)) next
    for (var in call$vars) {
      if (!full && !(var %in% covered)) {
        stop(
          filecode, ": value_labels() names '", var, "' for wave '", wave,
          "' but variable_labels() doesn't cover it there.",
          call. = FALSE
        )
      }
      existing <- resolved[[var]]
      dup <- intersect(names(call$labels), names(existing))
      if (length(dup) > 0L) {
        stop(
          filecode, ": value_labels() contributes code(s) ", paste(dup, collapse = ", "),
          " for '", var, "' in wave '", wave, "' more than once.",
          call. = FALSE
        )
      }
      resolved[[var]] <- c(existing, call$labels)
    }
  }
  if (full) {
    out <- stats::setNames(vector("list", length(all_names)), all_names)
    for (nm in all_names) out[[nm]] <- if (!is.null(resolved[[nm]])) resolved[[nm]] else character(0)
    return(out)
  }
  resolved
}

## Closes out one variable_<fc>.R script: reads back everything
## variable_labels()/value_labels() accumulated (plus var_types_vec from
## the caller's own scope), validates it, assembles the classic
## variables/variable_labels/value_labels/variable_types wide tables
## (reusing .lasa_build_name_table()/.lasa_build_label_table()/
## .lasa_build_value_table()/.lasa_build_type_table() unchanged), and
## resets the DSL state so the next file starts clean.
##
## Real waves (the tables' row set) are derived as the union of every
## wave named across every variable_labels()/value_labels() call in the
## file, minus the synthetic "Z", ordered per wave_prefix -- a wave named
## only by a value_labels() call still counts, so a typo'd/unknown wave
## there is caught (via .check_waves() below) rather than silently
## dropped from the row set and never resolved.
##
## Returns the assembled list (variables/variable_labels/value_labels/
## variable_types, plus negative_values: one row per LASA_Wave/
## canonical_name negative_values() declared) -- NOT
## auto-assigned to .lasa_fc_<fc>, so a file
## needing .override_label() can still apply it to the returned
## $variables element before assigning, e.g.:
##   .lasa_fc_022 <- .lasa_finalize_fc("022")
##   .lasa_fc_022$variables <- .lasa_fc_022$variables |>
##     .override_label(wave = "E", variable = "mraabmis", override_value = "emrabmis")
.lasa_finalize_fc <- function(filecode) {
  var_types_vec <- get("var_types_vec", envir = parent.frame())
  on.exit(.lasa_reset_dsl_state())

  var_calls <- .lasa_dsl_state$variable_labels_calls
  val_calls <- .lasa_dsl_state$value_labels_calls
  neg_calls <- .lasa_dsl_state$negative_values_calls
  all_names <- names(var_types_vec)

  if (is.null(all_names) || anyDuplicated(all_names) > 0L || any(all_names == "")) {
    stop(filecode, ": var_types_vec must be a fully-named vector with unique, non-empty names.", call. = FALSE)
  }
  if (length(var_calls) == 0L) {
    stop(
      filecode, ": no variable_labels() calls recorded -- did an earlier .lasa_finalize_fc() ",
      "reset the state, or was this script sourced twice?",
      call. = FALSE
    )
  }

  known_waves <- c("Z", names(wave_prefix))
  check_names <- function(nms, what) {
    bad <- setdiff(nms, all_names)
    if (length(bad) > 0L) {
      stop(filecode, ": ", what, " reference name(s) not in var_types_vec: ", paste(bad, collapse = ", "), call. = FALSE)
    }
  }
  check_waves <- function(waves, what) {
    bad <- setdiff(waves, known_waves)
    if (length(bad) > 0L) {
      stop(filecode, ": ", what, " use unknown wave(s): ", paste(bad, collapse = ", "), call. = FALSE)
    }
  }
  for (call in var_calls) {
    check_names(call$covered, "variable_labels()")
    check_waves(call$waves, "variable_labels()")
  }
  # A value a numeric variable's documentation lists only to describe its
  # scale (an endpoint such as "lowest" or "high prestige", or an example
  # value) is a measurement, not a code, so it gets no value label, and one
  # transcribed without wording is refused; a value that stands for a range
  # keeps its wording (`98` = "98 or more"). Blank or "NA" label text is a
  # transcription slip. A wording-less negative is a missing-value code,
  # except on a variable declared with negative_values(), whose negative
  # values are measurements too.
  signed_vars <- unique(unlist(lapply(neg_calls, `[[`, "vars")))
  check_wordless <- function(call) {
    text <- unname(call$labels)
    codes <- suppressWarnings(as.numeric(names(call$labels)))
    slip <- !is.na(text) & trimws(text) %in% c("", "NA")
    if (any(slip)) {
      stop(filecode, ": value_labels() gives code(s) ", paste(names(call$labels)[slip], collapse = ", "),
        " blank or \"NA\" label text (", paste(call$vars, collapse = ", "), ").", call. = FALSE)
    }
    numeric_vars <- call$vars[var_types_vec[call$vars] == "numeric"]
    signed <- any(call$vars %in% signed_vars)
    listed <- is.na(text) & !is.na(codes) & (codes >= 0 | signed)
    if ((length(numeric_vars) > 0L || signed) && any(listed)) {
      stop(filecode, ": value_labels() lists ", paste(names(call$labels)[listed], collapse = ", "),
        " without wording for numeric variable(s) ", paste(union(numeric_vars, intersect(call$vars, signed_vars)), collapse = ", "),
        ": a listed value of a numeric variable is a measurement, not a code -- leave it out.", call. = FALSE)
    }
  }
  for (call in val_calls) {
    check_names(call$vars, "value_labels()")
    check_waves(call$waves, "value_labels()")
    check_wordless(call)
  }
  for (call in neg_calls) {
    check_names(call$vars, "negative_values()")
    check_waves(call$waves, "negative_values()")
  }

  declared_waves <- unique(unlist(c(lapply(var_calls, `[[`, "waves"), lapply(val_calls, `[[`, "waves"))))
  real_waves <- names(wave_prefix)[names(wave_prefix) %in% declared_waves]

  harmonized_labels <- .lasa_resolve_calls(
    var_calls,
    wave = "Z", default = NULL, all_names = all_names, filecode = filecode, full = TRUE
  )
  variable_labels_list <- list(Harmonized_labels = harmonized_labels)
  for (w in real_waves) {
    variable_labels_list[[paste0("Wave_", w, "_labels")]] <- .lasa_resolve_calls(
      var_calls,
      wave = w, default = harmonized_labels, all_names = all_names, filecode = filecode, full = FALSE
    )
  }

  standardized_value_labels <- .lasa_resolve_value_calls(
    val_calls,
    wave = "Z", covered = NULL, all_names = all_names, filecode = filecode, full = TRUE
  )
  value_labels_list <- list(Harmonized_labels = standardized_value_labels)
  for (w in real_waves) {
    value_labels_list[[paste0("Wave_", w, "_labels")]] <- .lasa_resolve_value_calls(
      val_calls,
      wave = w, covered = names(variable_labels_list[[paste0("Wave_", w, "_labels")]]),
      all_names = all_names, filecode = filecode, full = FALSE
    )
  }

  negative_values <- data.frame(LASA_Wave = character(0), canonical_name = character(0))
  for (call in neg_calls) {
    for (w in call$waves) {
      undocumented <- setdiff(call$vars, names(variable_labels_list[[paste0("Wave_", w, "_labels")]]))
      if (length(undocumented) > 0L) {
        stop(
          filecode, ": negative_values() names ", paste(undocumented, collapse = ", "),
          " for wave '", w, "' but variable_labels() doesn't cover it there.",
          call. = FALSE
        )
      }
    }
    negative_values <- rbind(negative_values, expand.grid(
      LASA_Wave = call$waves, canonical_name = call$vars, stringsAsFactors = FALSE, KEEP.OUT.ATTRS = FALSE
    ))
  }

  waves <- c(real_waves, "all")
  list(
    variables = .lasa_build_name_table(variable_labels_list, filecode = filecode, waves = waves),
    variable_labels = .lasa_build_label_table(variable_labels_list, filecode = filecode, waves = waves),
    value_labels = .lasa_build_value_table(value_labels_list, filecode = filecode, waves = waves),
    variable_types = .lasa_build_type_table(var_types_vec, filecode = filecode, waves = waves),
    negative_values = negative_values
  )
}

## -----------------------------------------------------------------------
## Cross-wave harmonization of value codes, run by build_lasa_label_db.R
## after flattening every filecode. Compares each canonical variable's
## wave-specific value labels across waves (in documentation order, the
## order of wave_prefix):
##
##   * An answer code (>= 0) of a categorical variable whose label differs
##     between waves (e.g. 1 = "no" in C but "yes" in 2B) can't carry one
##     harmonized label. The variable becomes var_type "text": under
##     standardize it is read as its wave-specific label text, and its
##     factor levels are every distinct answer text over all waves
##     (`level`). Its conflicting answer codes get no harmonized label.
##   * A missing-value code (< 0) whose label differs between waves (e.g.
##     -4 = "short version Q" in C but "do not know" from D) keeps its code
##     for the meaning the documentation introduced first; each later
##     meaning moves to the code another wave already gives it, or else to
##     a free code -9, -99, -98, ... .
##   * A missing-value code's harmonized label says what its waves say
##     (e.g. "institution", "na, see MOVED"), not a label made up to cover
##     several reasons ("not available, routing").
##
## Labels count as the same when they only differ in case, spacing,
## a trailing "[code]", the "na"/"no answer" abbreviation, or (for a
## routing label "na, see X") in the wave prefix of the variable they
## point to.
## -----------------------------------------------------------------------

## Free codes for a missing-value meaning that has to move, in order.
.lasa_spare_missing_codes <- c(-9, -99:-90, -999:-990)

## The comparison key of answer label text.
.lasa_label_key <- function(text) {
  key <- tolower(trimws(gsub("\\s+", " ", text)))
  key <- gsub("\\s*/\\s*", "/", key)
  key <- sub("\\s*\\[-?[0-9.]+\\]$", "", key)
  sub("\\.$", "", key)
}

## The routing label "na, see X" with X's wave prefix dropped when X
## without it, and not X itself, is one of the database's canonical names
## (`canonical`) -- any wave's prefix, as a label sometimes points to
## another wave's variable. With `display`, the variable is written as LASA
## writes it (upper case); otherwise the text keeps its own spelling.
.lasa_strip_routing_prefix <- function(text, wave, canonical, display = FALSE) {
  m <- regexec("^(.*\\bsee\\s+)([A-Za-z0-9_#&]+)(.*)$", text)
  parts <- regmatches(text, m)
  out <- text
  prefixes <- unique(wave_prefix)
  for (i in seq_along(parts)) {
    p <- parts[[i]]
    if (length(p) != 4L) next
    token <- tolower(p[[3L]])
    if (token %in% canonical || sub("[#&].*$", "", token) %in% canonical) next
    stripped <- NA_character_
    for (prefix in prefixes[startsWith(token, prefixes)]) {
      rest <- substring(token, nchar(prefix) + 1L)
      if (rest %in% canonical || sub("[#&].*$", "", rest) %in% canonical) stripped <- rest
    }
    if (is.na(stripped)) next
    out[[i]] <- paste0(p[[2L]], if (display) toupper(stripped) else stripped, p[[4L]])
  }
  out
}

## The comparison key of missing-value label text: .lasa_label_key() plus
## the "na"/"no answer" spellings LASA uses for one reason, and routing
## labels compared without the wave prefix.
.lasa_missing_key <- function(text, wave, canonical) {
  key <- .lasa_label_key(.lasa_strip_routing_prefix(text, wave, canonical))
  # A leading qualifier only says the item has no answer ("na, asked",
  # "no answer, asked", "na: died earlier", "not asked: died earlier"):
  # compare the reason after it.
  key <- sub("^(na|n\\.a\\.|no answer|answer|not asked|not available)\\s*[:,]\\s*", "", key)
  key <- sub("^na\\s+", "", key)
  key[key %in% c("na", "no answer", "")] <- "asked"
  key <- sub("^short version( interview| q)?$", "short interview", key)
  key
}

## Applies the harmonization above to the flattened tables. Returns them
## updated, plus `value_labels_crosswalk`: one row per wave-specific value
## label whose harmonized coding differs from the wave's own (a moved
## missing code), or that belongs to a var_type "text" variable --
## harmonized_numeric (NA for a text variable's answer), harmonized_label,
## is_missing, and `level` (a text variable's answer text's position among
## its factor levels).
.lasa_harmonize_codes <- function(variables, value_labels, value_labels_harmonized) {
  wave_order <- names(wave_prefix)
  var_key <- paste(variables$filecode, variables$wave, variables$variable_name, sep = "\r")
  vl_key <- paste(value_labels$filecode, value_labels$wave, value_labels$variable_name, sep = "\r")
  value_labels$canonical_name <- variables$canonical_name[match(vl_key, var_key)]
  hz_key <- paste(value_labels_harmonized$filecode, value_labels_harmonized$canonical_name, sep = "\r")

  types <- unique(variables[c("filecode", "canonical_name", "var_type")])
  groups <- split(seq_len(nrow(value_labels)), paste(value_labels$filecode, value_labels$canonical_name, sep = "\r"))
  # Routing labels can point to a variable of another file code.
  canonical <- unique(tolower(variables$canonical_name))

  crosswalk <- list()
  new_text <- character(0)
  drop_hz <- logical(nrow(value_labels_harmonized))
  hz_label <- value_labels_harmonized$value_label
  hz_add <- list()

  for (g in names(groups)) {
    idx <- groups[[g]]
    rows <- value_labels[idx, , drop = FALSE]
    fc <- rows$filecode[[1L]]
    cn <- rows$canonical_name[[1L]]
    type <- types$var_type[types$filecode == fc & types$canonical_name == cn][[1L]]
    if (type %in% c("date")) next
    ord <- order(match(rows$wave, wave_order), -rows$value_numeric)
    rows <- rows[ord, , drop = FALSE]
    labelled <- !is.na(rows$value_label) & !is.na(rows$value_numeric)
    answer <- labelled & rows$value_numeric >= 0
    missing <- labelled & rows$value_numeric < 0
    hz_rows <- which(hz_key == g)
    hz_codes <- value_labels_harmonized$value_numeric[hz_rows]

    # --- answer codes ---
    answer_key <- .lasa_label_key(rows$value_label)
    conflicting <- character(0)
    if (type %in% c("categorical", "text") && any(answer)) {
      per_code <- tapply(answer_key[answer], rows$value_numeric[answer], function(k) length(unique(k)))
      conflicting <- names(per_code)[per_code > 1L]
    }
    is_text <- identical(type, "text") || length(conflicting) > 0L
    if (length(conflicting) > 0L && !identical(type, "text")) new_text <- c(new_text, g)
    if (length(conflicting) > 0L) {
      drop_hz[hz_rows[as.character(hz_codes) %in% conflicting & hz_codes >= 0]] <- TRUE
    }

    # --- missing codes ---
    mkey <- .lasa_missing_key(rows$value_label, rows$wave, canonical)
    harmonized_numeric <- rows$value_numeric
    harmonized_label <- rows$value_label
    if (any(missing)) {
      used <- unique(c(rows$value_numeric, hz_codes))
      key_code <- character(0) # meaning key -> harmonized code
      code_key <- character(0) # harmonized code -> meaning key
      for (i in which(missing)) {
        k <- mkey[[i]]
        if (k %in% names(key_code)) {
          harmonized_numeric[[i]] <- as.numeric(key_code[[k]])
          next
        }
        code <- rows$value_numeric[[i]]
        if (as.character(code) %in% names(code_key)) {
          code <- setdiff(.lasa_spare_missing_codes, used)[[1L]]
          used <- c(used, code)
        }
        key_code[[k]] <- as.character(code)
        code_key[[as.character(code)]] <- k
        harmonized_numeric[[i]] <- code
      }
      # Each harmonized missing code is labelled with what its waves say,
      # not a label made up to cover several reasons: the hand-written
      # harmonized label when it says the same, else the waves' most common
      # spelling (routing labels without the wave prefix).
      display <- .lasa_strip_routing_prefix(rows$value_label, rows$wave, canonical, display = TRUE)
      for (code in unique(harmonized_numeric[missing])) {
        holders <- which(missing & harmonized_numeric == code)
        counts <- table(display[holders])
        text <- display[holders][display[holders] %in% names(counts)[counts == max(counts)]][[1L]]
        j <- match(code, hz_codes)
        if (!is.na(j) && identical(
          .lasa_missing_key(hz_label[[hz_rows[[j]]]], rows$wave[[holders[[1L]]]], canonical),
          mkey[[holders[[1L]]]]
        )) {
          text <- hz_label[[hz_rows[[j]]]]
        }
        harmonized_label[holders] <- text
        if (!is.na(j)) {
          hz_label[[hz_rows[[j]]]] <- text
        } else {
          hz_add[[length(hz_add) + 1L]] <- data.frame(
            filecode = fc, canonical_name = cn, value_numeric = code, value_label = text,
            is_missing = TRUE, stringsAsFactors = FALSE
          )
        }
      }
    }

    # --- crosswalk rows ---
    level <- rep(NA_integer_, nrow(rows))
    if (is_text) {
      level_keys <- unique(answer_key[answer])
      level[answer] <- match(answer_key[answer], level_keys)
      first_spelling <- rows$value_label[answer][match(level_keys, answer_key[answer])]
      harmonized_label[answer] <- first_spelling[level[answer]]
      harmonized_numeric[answer] <- NA_real_
      keep <- labelled
    } else {
      keep <- missing & harmonized_numeric != rows$value_numeric
    }
    if (any(keep)) {
      crosswalk[[length(crosswalk) + 1L]] <- data.frame(
        filecode = fc, wave = rows$wave[keep], variable_name = rows$variable_name[keep],
        canonical_name = cn, value_numeric = rows$value_numeric[keep], harmonized_numeric = harmonized_numeric[keep],
        harmonized_label = harmonized_label[keep], is_missing = rows$value_numeric[keep] < 0,
        level = level[keep], stringsAsFactors = FALSE
      )
    }
  }

  value_labels_harmonized$value_label <- hz_label
  value_labels_harmonized <- value_labels_harmonized[!drop_hz, , drop = FALSE]
  if (length(hz_add) > 0L) value_labels_harmonized <- rbind(value_labels_harmonized, do.call(rbind, hz_add))
  value_labels_harmonized <- value_labels_harmonized[
    order(value_labels_harmonized$filecode, value_labels_harmonized$canonical_name), , drop = FALSE
  ]
  variables$var_type[paste(variables$filecode, variables$canonical_name, sep = "\r") %in% new_text] <- "text"
  value_labels$canonical_name <- NULL

  crosswalk <- if (length(crosswalk) > 0L) do.call(rbind, crosswalk) else NULL
  list(
    variables = variables, value_labels = value_labels,
    value_labels_harmonized = value_labels_harmonized,
    value_labels_crosswalk = crosswalk, n_new_text = length(new_text)
  )
}
