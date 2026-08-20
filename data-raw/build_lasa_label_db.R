## Build the bundled LASA label database.
##
## Unlike the package's previous PDF-parsing build, every variable and
## value label here is hardcoded, hand-maintained R: this script only
## sources and assembles it. Source of the labels:
##   * data-raw/labels/value_label_sets.R    reusable value-label vectors,
##                                            shared across many variables
##   * data-raw/labels/variables_<fc>.R      one file per filecode: its
##                                            `variables` table, per-wave
##                                            `value_labels`, and
##                                            `value_labels_harmonized`
##                                            (cross-wave-standardized
##                                            value labels)
##
## To add a wave to an existing filecode, or add a brand-new filecode: edit
## (or add) the relevant `data-raw/labels/variables_<fc>.R` file directly,
## then re-run this script. See that file's own header comment for the
## expected shape, and data-raw/labels/value_label_sets.R for the shared
## vectors available to reference.
##
## Run from the package root.

Sys.setlocale("LC_CTYPE", "C.UTF-8") # guards UTF-8 label text if this ever reads a non-UTF-8-locale file again

devtools::load_all(".", quiet = TRUE)

labels_dir <- file.path("data-raw", "labels")
sets_path <- file.path(labels_dir, "value_label_sets.R")
if (!file.exists(sets_path)) stop("Missing ", sets_path, call. = FALSE)

fc_scripts <- sort(list.files(labels_dir, pattern = "^variables_.*\\.R$", full.names = TRUE))
if (length(fc_scripts) == 0L) {
  stop("No data-raw/labels/variables_<filecode>.R scripts found.", call. = FALSE)
}
cat(length(fc_scripts), "filecode script(s) found in", labels_dir, "\n")

## Source the shared value-label vectors first, then every filecode script,
## all into one environment so `variables_<fc>.R`'s references to shared
## vectors resolve -- a stale/renamed reference fails loudly here (a bare
## `object '...' not found` error from source()) rather than silently.
label_env <- new.env(parent = baseenv())
source(sets_path, local = label_env)

fc_objects <- list()
for (script in fc_scripts) {
  fc <- sub("^variables_(.*)\\.R$", "\\1", basename(script))
  source(script, local = label_env)
  obj_name <- paste0(".lasa_fc_", fc)
  if (!exists(obj_name, envir = label_env, inherits = FALSE)) {
    stop(script, " did not define the expected object '", obj_name, "'.", call. = FALSE)
  }
  fc_objects[[fc]] <- get(obj_name, envir = label_env, inherits = FALSE)
}

## ---------------------------------------------------------------------
## Assemble the three base tables from every filecode object.
## ---------------------------------------------------------------------

variables_list <- vector("list", length(fc_objects))
value_labels_list <- vector("list", length(fc_objects))
harmonized_list <- vector("list", length(fc_objects))
names(variables_list) <- names(fc_objects)

for (fc in names(fc_objects)) {
  obj <- fc_objects[[fc]]

  vars <- obj$variables
  vars <- cbind(filecode = fc, vars, stringsAsFactors = FALSE)
  vars <- vars[, c("filecode", "wave", "variable_name", "canonical_name", "variable_label", "harmonized_var_label", "var_type")]
  variables_list[[fc]] <- vars

  # (wave, canonical_name) -> variable_name, to join value_labels/value_labels_harmonized
  # (both keyed by canonical_name) back to a concrete wave-specific variable_name.
  name_lookup <- stats::setNames(vars$variable_name, paste(vars$wave, vars$canonical_name))

  vl_rows <- list()
  for (cn in names(obj$value_labels)) {
    for (w in names(obj$value_labels[[cn]])) {
      vec <- obj$value_labels[[cn]][[w]]
      vname <- name_lookup[[paste(w, cn)]]
      if (is.null(vname)) {
        stop(sprintf(
          "%s: value_labels$%s$%s has no matching row in 'variables' (wave %s, canonical_name %s).",
          fc, cn, w, w, cn
        ), call. = FALSE)
      }
      codes <- suppressWarnings(as.numeric(names(vec)))
      vl_rows[[length(vl_rows) + 1L]] <- data.frame(
        filecode = fc, wave = w, variable_name = vname,
        value_numeric = codes, value_label = unname(vec), is_missing = codes < 0,
        stringsAsFactors = FALSE
      )
    }
  }
  value_labels_list[[fc]] <- if (length(vl_rows) > 0L) do.call(rbind, vl_rows) else NULL

  hz_rows <- list()
  for (cn in names(obj$value_labels_harmonized)) {
    vec <- obj$value_labels_harmonized[[cn]]
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
