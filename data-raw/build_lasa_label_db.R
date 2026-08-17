## Builds the package's bundled `lasa_label_db` dataset (data/lasa_label_db.rda)
## by parsing every LASA variable-information PDF available at build time.
##
## Preference order for the source of each PDF:
##   1. The live LASA site, via update_lasa_labels(filecode = ...) --
##      resolved through .lasa_resolve_varinfo_url(), which itself prefers
##      the live .lasa_topic_index() scrape and falls back to the bundled
##      offline manifest (lasa_offline_topics_table) when the site can't
##      be reached.
##   2. When neither the live site nor a network connection is available
##      at all (e.g. this package's own sandboxed development/CI
##      environments), fall back to parsing the PDFs already present in
##      `codebook/` directly via update_lasa_labels(path = ...).
##
## `codebook/` itself is disposable bootstrap material, not shipped or
## depended on by anything under R/ -- see the package README. This
## script is the only place that reads it.
##
## Run non-strict (strict = FALSE): correctness over coverage, per the
## package's design notes -- a PDF whose wave-prefix expansion or a
## cross-reference can't be unambiguously resolved contributes whatever
## rows it *can* confidently parse, with the rest recorded as explicit
## `parse_note`s for follow-up, rather than blocking the whole file's
## contribution to the bootstrap.

devtools::load_all(".", quiet = TRUE)

codebook_dir <- "codebook"
pdf_files <- sort(list.files(codebook_dir, pattern = "_varinfo\\.pdf$", ignore.case = TRUE, full.names = TRUE))
cat(length(pdf_files), "PDF(s) found in", codebook_dir, "\n")

## Start from a clean user-local database so this bootstrap run reflects
## only these PDFs (not any state left over from interactive testing).
unlink(.lasa_label_db_path())

results <- vector("list", length(pdf_files))
names(results) <- basename(pdf_files)

for (i in seq_along(pdf_files)) {
  pdf_path <- pdf_files[[i]]
  results[[i]] <- tryCatch(
    update_lasa_labels(path = pdf_path, strict = FALSE),
    error = function(e) {
      list(status = "error", document_id = NA_character_, pdf_changed = NA,
           filecodes = character(0), n_variables = 0L, n_value_labels = 0L,
           n_unresolved = NA_integer_, error = conditionMessage(e))
    }
  )
  cat(sprintf(
    "[%3d/%3d] %-45s %-9s vars=%-5d vals=%-5d unresolved=%s\n",
    i, length(pdf_files), basename(pdf_path), results[[i]]$status,
    results[[i]]$n_variables, results[[i]]$n_value_labels,
    if (is.null(results[[i]]$n_unresolved)) "NA" else results[[i]]$n_unresolved
  ))
}

errored <- names(results)[vapply(results, function(r) identical(r$status, "error"), logical(1L))]
if (length(errored) > 0L) {
  cat("\nPDFs that failed to parse entirely:\n")
  for (nm in errored) cat(" -", nm, ":", results[[nm]]$error, "\n")
}

## Promote the accumulated user-local database to the package's bundled
## dataset. Named distinctly from the exported lasa_label_db() *function*
## (R/lasa_label_db.R) -- a lazy-loaded data object and an exported
## function cannot share one name in the same namespace.
lasa_label_db_bundled <- lasa_label_db()

cat(
  "\nBootstrap summary:\n",
  " documents:   ", nrow(lasa_label_db_bundled$documents), "\n",
  " variables:   ", nrow(lasa_label_db_bundled$variables), "\n",
  " value_labels:", nrow(lasa_label_db_bundled$value_labels), "\n",
  " unresolved variable rows:", sum(!is.na(lasa_label_db_bundled$variables$parse_note)),
  sprintf(" (%.1f%%)\n", 100 * mean(!is.na(lasa_label_db_bundled$variables$parse_note))),
  " distinct filecodes:", length(unique(.lasa_normalize_filecode(lasa_label_db_bundled$variables$filecode))), "\n"
)

usethis::use_data(lasa_label_db_bundled, overwrite = TRUE, compress = "xz")

## The bundled dataset now carries everything the user-local snapshot had;
## clear the local snapshot so a fresh `devtools::load_all()`/install picks
## up the freshly bundled data() object instead of this dev machine's
## leftover file.
unlink(.lasa_label_db_path())

cat("\nWrote data/lasa_label_db_bundled.rda\n")
