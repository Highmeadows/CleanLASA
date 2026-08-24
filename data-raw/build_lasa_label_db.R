## Build the bundled LASA label database.
##
## Every variable and value label is hardcoded, hand-maintained R. Source
## of the labels:
##   * data-raw/label_db_helpers.R  shared constants (wave_prefix,
##                                 identifier column names) and helper
##                                 functions (.override_label(),
##                                 .replace_labels(), .replace_in_list(),
##                                 and the four .lasa_build_*_table()
##                                 table constructors)
##   * data-raw/variable_<fc>.R     one file per filecode: four "wide"
##                                 tables (one row per wave + a synthetic
##                                 "all" row for the cross-wave-harmonized
##                                 values, one column per canonical
##                                 variable name) -- see
##                                 label_db_helpers.R's header comment
##                                 for the shape.
##
## This script *flattens* those wide, per-filecode tables into the long,
## normalized shape `R/lasa_label_db.R` and the rest of the package
## expect (`variables`/`value_labels`/`value_labels_harmonized`/
## `manual_overrides`) -- the bundled database's own shape hasn't
## changed, only how it's produced.
##
## To add a wave to an existing filecode, or add a brand-new filecode:
## edit (or add) the relevant `data-raw/variable_<fc>.R` file directly,
## then re-run this script.
##
## Run from the package root.

Sys.setlocale("LC_CTYPE", "C.UTF-8") # guards UTF-8 label text if this ever reads a non-UTF-8-locale file again

devtools::load_all(".", quiet = TRUE)

labels_dir <- "data-raw"
helpers_path <- file.path(labels_dir, "label_db_helpers.R")
if (!file.exists(helpers_path)) stop("Missing ", helpers_path, call. = FALSE)

fc_scripts <- sort(list.files(labels_dir, pattern = "^variable_.*\\.R$", full.names = TRUE))
if (length(fc_scripts) == 0L) {
  stop("No data-raw/variable_<filecode>.R scripts found.", call. = FALSE)
}
cat(length(fc_scripts), "filecode script(s) found in", labels_dir, "\n")

## Source the shared helpers first, then every filecode script, all into
## one environment so a `variable_<fc>.R`'s references to
## wave_prefix/.override_label()/etc. resolve -- a stale/renamed
## reference fails loudly here (a bare `object '...' not found` error
## from source()) rather than silently.
label_env <- new.env(parent = baseenv())
source(helpers_path, local = label_env)

fc_objects <- list()
for (script in fc_scripts) {
  fc <- sub("^variable_(.*)\\.R$", "\\1", basename(script))
  source(script, local = label_env)
  obj_name <- paste0(".lasa_fc_", gsub("[^A-Za-z0-9]", "_", fc))
  if (!exists(obj_name, envir = label_env, inherits = FALSE)) {
    stop(script, " did not define the expected object '", obj_name, "'.", call. = FALSE)
  }
  fc_objects[[fc]] <- get(obj_name, envir = label_env, inherits = FALSE)
}

## ---------------------------------------------------------------------
## Flatten each filecode's four wide tables into long-format rows.
## ---------------------------------------------------------------------

identifier_cols <- c(label_env$file_identifiers, label_env$resp_identifiers)

variables_list <- vector("list", length(fc_objects))
value_labels_list <- vector("list", length(fc_objects))
harmonized_list <- vector("list", length(fc_objects))
names(variables_list) <- names(fc_objects)

for (fc in names(fc_objects)) {
  obj <- fc_objects[[fc]]
  vt <- obj$variables # wave-specific names
  vl <- obj$variable_labels # wave-specific + harmonized label text
  vv <- obj$value_labels # wave-specific + harmonized value-label sets (list-columns)
  vty <- obj$variable_types # collapsed type, constant per canonical name

  canonical_cols <- setdiff(names(vt), identifier_cols)
  all_row <- which(vt$LASA_Wave == "all")
  real_rows <- which(vt$LASA_Wave != "all")

  # --- variables: one row per (wave, canonical_name) with a documented name ---
  var_rows <- list()
  for (i in real_rows) {
    wave <- vt$LASA_Wave[[i]]
    for (cn in canonical_cols) {
      vname <- vt[i, cn]
      if (is.na(vname)) next
      var_rows[[length(var_rows) + 1L]] <- data.frame(
        filecode = fc, wave = wave, variable_name = vname, canonical_name = cn,
        variable_label = vl[i, cn], harmonized_var_label = vl[all_row, cn],
        var_type = vty[i, cn],
        stringsAsFactors = FALSE
      )
    }
  }
  variables_list[[fc]] <- if (length(var_rows) > 0L) do.call(rbind, var_rows) else NULL

  # (wave, canonical_name) -> variable_name, to attach the right
  # wave-specific name to each value-label row below.
  name_lookup <- stats::setNames(
    variables_list[[fc]]$variable_name,
    paste(variables_list[[fc]]$wave, variables_list[[fc]]$canonical_name)
  )

  # --- value_labels: one row per (wave, canonical_name, code) ---
  vl_rows <- list()
  for (i in real_rows) {
    wave <- vt$LASA_Wave[[i]]
    for (cn in canonical_cols) {
      vec <- vv[[cn]][[i]]
      if (is.null(vec) || length(vec) == 0L) next
      vname <- name_lookup[[paste(wave, cn)]]
      if (is.null(vname) || is.na(vname)) {
        stop(sprintf(
          "%s: value_labels$%s has a value-label set for wave %s but no matching row in 'variables'.",
          fc, cn, wave
        ), call. = FALSE)
      }
      codes <- suppressWarnings(as.numeric(names(vec)))
      vl_rows[[length(vl_rows) + 1L]] <- data.frame(
        filecode = fc, wave = wave, variable_name = vname,
        value_numeric = codes, value_label = unname(vec), is_missing = codes < 0,
        stringsAsFactors = FALSE
      )
    }
  }
  value_labels_list[[fc]] <- if (length(vl_rows) > 0L) do.call(rbind, vl_rows) else NULL

  # --- value_labels_harmonized: one row per (canonical_name, code), from the "all" row ---
  hz_rows <- list()
  for (cn in canonical_cols) {
    vec <- vv[[cn]][[all_row]]
    if (is.null(vec) || length(vec) == 0L) next
    codes <- suppressWarnings(as.numeric(names(vec)))
    hz_rows[[length(hz_rows) + 1L]] <- data.frame(
      filecode = fc, canonical_name = cn,
      value_numeric = codes, value_label = unname(vec), is_missing = codes < 0,
      stringsAsFactors = FALSE
    )
  }
  harmonized_list[[fc]] <- if (length(hz_rows) > 0L) do.call(rbind, hz_rows) else NULL
}

empty <- .lasa_empty_label_db()

variables <- do.call(rbind, c(list(empty$variables), variables_list))
value_labels <- do.call(rbind, c(list(empty$value_labels), value_labels_list))
value_labels_harmonized <- do.call(rbind, c(list(empty$value_labels_harmonized), harmonized_list))
rownames(variables) <- NULL
rownames(value_labels) <- NULL
rownames(value_labels_harmonized) <- NULL

lasa_label_db_bundled <- list(
  variables = variables,
  value_labels = value_labels,
  value_labels_harmonized = value_labels_harmonized,
  manual_overrides = empty$manual_overrides
)

## ---------------------------------------------------------------------
## Validate and write.
## ---------------------------------------------------------------------

problems <- .lasa_validate_label_db(lasa_label_db_bundled)
if (length(problems) > 0L) {
  stop(
    "Bundled LASA label database failed validation:\n- ",
    paste(problems, collapse = "\n- "),
    call. = FALSE
  )
}

cat(
  "\nBuild summary:\n",
  " filecodes:  ", length(fc_objects), "\n",
  " variables:  ", nrow(lasa_label_db_bundled$variables), "\n",
  " value_labels:", nrow(lasa_label_db_bundled$value_labels), "\n",
  " value_labels_harmonized:", nrow(lasa_label_db_bundled$value_labels_harmonized), "\n"
)

usethis::use_data(
  lasa_label_db_bundled,
  overwrite = TRUE,
  compress = "xz"
)

# The bundled object now contains the complete build. Remove the local
# snapshot so future load_all()/install calls read the freshly written
# bundled data rather than build-machine/dev state.
unlink(.lasa_label_db_path())

cat("\nWrote data/lasa_label_db_bundled.rda\n")
