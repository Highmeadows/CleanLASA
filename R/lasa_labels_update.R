# update_lasa_labels(): download (or read a local file), hash, parse,
# validate, and merge one LASA varinfo PDF into the user-local label
# database, replacing only the records it owns.

.lasa_parser_version <- "1.0"

## Classifies each variable's var_type from its own value_labels rows,
## reusing the package's existing `.lasa_is_codebook_numeric()` convention
## (lasa_io.R): numeric when there are no value labels at all, or when
## every one of them is a negative missing-reason code; categorical
## otherwise. Dates are not auto-detected from the PDF text alone (no
## reliable positional signal) -- left as a possible
## manual_update_lasa_labels() override.
.lasa_classify_var_type <- function(variables, value_labels) {
  key <- function(df) paste(df$filecode, df$wave, df$variable_name, sep = "\r")
  var_key <- key(variables)
  val_key <- key(value_labels)

  vapply(seq_len(nrow(variables)), function(i) {
    codes <- value_labels$value_numeric[val_key == var_key[[i]]]
    codes <- codes[!is.na(codes)]
    if (length(codes) == 0L || .lasa_is_codebook_numeric(codes)) "numeric" else "categorical"
  }, character(1L))
}

## Downloads `url` to a temp file and returns its path, or errors with a
## clear message pointing at 'path' as an offline alternative.
.lasa_download_varinfo <- function(url) {
  destination <- tempfile(fileext = ".pdf")
  result <- tryCatch(
    {
      utils::download.file(url, destination, mode = "wb", quiet = TRUE)
      TRUE
    },
    error = function(e) FALSE,
    warning = function(w) FALSE
  )
  if (!isTRUE(result) || !file.exists(destination) || file.info(destination)$size == 0L) {
    stop(
      "Could not download the variable-information PDF from ", url, ". ",
      "If you already have the PDF saved locally, call update_lasa_labels(path = ...) instead.",
      call. = FALSE
    )
  }
  destination
}

#' Refresh the LASA label database from a variable-information PDF
#'
#' Downloads (or reads, via `path`) one LASA varinfo PDF, parses it, and
#' merges the result into the user-local label database used by
#' [apply_lasa_labels()] and [read_lasa_sav()] -- replacing only the
#' records this PDF itself owns (its `document_id` and every file code it
#' documents), never anything recorded by a different document, and never
#' a [manual_update_lasa_labels()] correction (a separate table, composed
#' back on top at lookup time).
#'
#' @param filecode Optional LASA file code to resolve a PDF for (e.g.
#'   `"046"`, `"z004"`, `"zoa1"`, or the bare group prefix `"zoa"` when
#'   unambiguous). Ignored when `url` or `path` is supplied.
#' @param url Optional explicit PDF URL, bypassing file-code resolution.
#' @param path Optional path to an already-downloaded PDF, bypassing both
#'   resolution and download -- the only supported way to update the
#'   database without network access.
#' @param dry_run Logical, default `FALSE`. If `TRUE`, parse and validate
#'   as usual and return the same structured result, but never write to
#'   the database.
#' @param strict Logical, default `TRUE`. If `TRUE`, any row that couldn't
#'   be unambiguously parsed (wave-prefix expansion failure, an
#'   unresolved cross-reference, etc.) for a filecode the caller explicitly
#'   requested blocks the update entirely (the existing database is left
#'   untouched) rather than silently degrading its coverage. Has no effect
#'   on rows for other file codes incidentally sharing the same PDF.
#'
#' @return Invisibly, a list describing what happened: `status`
#'   (`"no_op"`, `"inserted"`, or `"updated"`), `document_id`,
#'   `pdf_changed` (`FALSE` for an identical-hash no-op), `filecodes`,
#'   `n_variables`, `n_value_labels`, and `n_unresolved` (rows carrying a
#'   `parse_note`).
#'
#' @seealso [manual_update_lasa_labels()], [lasa_label_db()]
#' @export
update_lasa_labels <- function(filecode = NULL,
                               url = NULL,
                               path = NULL,
                               dry_run = FALSE,
                               strict = TRUE) {
  .lasa_assert_scalar_logical(dry_run, "dry_run")
  .lasa_assert_scalar_logical(strict, "strict")

  if (!is.null(path)) {
    if (!is.character(path) || length(path) != 1L || is.na(path) || !file.exists(path)) {
      stop("'path' must be a single existing file path.", call. = FALSE)
    }
    local_pdf_path <- path
    source_url <- if (!is.null(url)) url else NA_character_
  } else {
    resolved <- .lasa_resolve_varinfo_url(filecode = filecode, url = url)
    if (is.na(resolved$varinfo_url)) {
      stop(
        "The variable-information PDF for this filecode was only resolved via the offline ",
        "manifest, which does not carry a downloadable URL. Supply 'path' with a local copy ",
        "of '", resolved$varinfo_file, "' instead.",
        call. = FALSE
      )
    }
    local_pdf_path <- .lasa_download_varinfo(resolved$varinfo_url)
    on.exit(unlink(local_pdf_path), add = TRUE)
    source_url <- resolved$varinfo_url
  }

  raw_bytes <- readBin(local_pdf_path, "raw", file.info(local_pdf_path)$size)
  sha <- digest::digest(raw_bytes, algo = "sha256", serialize = FALSE)

  document_id <- sub("\\.pdf$", "", basename(local_pdf_path), ignore.case = TRUE)

  db <- .lasa_load_label_db()
  existing_doc <- db$documents[db$documents$document_id == document_id, , drop = FALSE]
  if (nrow(existing_doc) == 1L && identical(existing_doc$sha256[[1L]], sha)) {
    return(invisible(list(
      status = "no_op", document_id = document_id, pdf_changed = FALSE,
      filecodes = strsplit(existing_doc$filecodes[[1L]], ";", fixed = TRUE)[[1L]],
      n_variables = sum(db$variables$document_id == document_id),
      n_value_labels = sum(db$value_labels$document_id == document_id),
      n_unresolved = sum(db$variables$document_id == document_id & !is.na(db$variables$parse_note))
    )))
  }

  parsed <- .lasa_parse_varinfo(local_pdf_path, document_id = document_id)
  variables <- parsed$variables
  value_labels <- parsed$value_labels

  ## variables$canonical_name is set by the parser itself (the bare,
  ## wave-stripped documentation name; variable_name is the wave-specific
  ## expected column name, e.g. "blphya01" vs. canonical "lphya01").
  variables$document_id <- rep(document_id, nrow(variables))
  value_labels$value_numeric <- suppressWarnings(as.numeric(value_labels$value_raw))
  value_labels$is_missing <- !is.na(value_labels$value_numeric) & value_labels$value_numeric < 0
  value_labels$document_id <- rep(document_id, nrow(value_labels))
  variables$var_type <- .lasa_classify_var_type(variables, value_labels)

  ## The same known merged/spanning-cell parser limitation (see below) can
  ## occasionally produce two variable rows for the same (filecode, wave,
  ## variable_name) key (e.g. a wave-conditional row whose qualifier
  ## overlaps more waves than intended). Keep the first-parsed definition
  ## deterministically and flag it, rather than blocking the update.
  variable_key <- paste(variables$filecode, variables$wave, variables$variable_name, sep = "\r")
  ambiguous_vars <- duplicated(variable_key) | duplicated(variable_key, fromLast = TRUE)
  if (any(ambiguous_vars)) {
    variables$parse_note[ambiguous_vars & is.na(variables$parse_note)] <-
      "ambiguous duplicate variable definition parsed for this key; kept the first occurrence"
    variables <- variables[!duplicated(variable_key), , drop = FALSE]
  }

  affected_filecodes <- unique(stats::na.omit(variables$filecode))
  affected_keys <- .lasa_normalize_filecode(affected_filecodes)

  if (isTRUE(strict) && !is.null(filecode)) {
    requested_key <- .lasa_normalize_filecode(filecode)
    requested_rows <- variables[.lasa_normalize_filecode(variables$filecode) == requested_key, , drop = FALSE]
    unresolved <- requested_rows[!is.na(requested_rows$parse_note) & is.na(requested_rows$wave), , drop = FALSE]
    if (nrow(unresolved) > 0L) {
      stop(
        nrow(unresolved), " row(s) for filecode '", filecode, "' could not be unambiguously ",
        "parsed from '", basename(local_pdf_path), "' (strict = TRUE blocks the update; the ",
        "existing database is unchanged). First problem: ", unresolved$parse_note[[1L]],
        " (variable '", unresolved$variable_name[[1L]], "').",
        call. = FALSE
      )
    }
  }

  ## A merged/spanning values cell that the positional parser couldn't
  ## fully disentangle can occasionally yield two different label texts
  ## for the same (filecode, wave, variable_name, value_raw) key. Rather
  ## than blocking the whole update over this known parser limitation
  ## (see .lasa_parse_varinfo()'s documentation), keep the first-parsed
  ## label deterministically and flag the row for manual review.
  value_key <- paste(value_labels$filecode, value_labels$wave, value_labels$variable_name, value_labels$value_raw, sep = "\r")
  ambiguous <- !is.na(value_labels$value_raw) & (duplicated(value_key) | duplicated(value_key, fromLast = TRUE))
  if (any(ambiguous)) {
    value_labels$parse_note[ambiguous & is.na(value_labels$parse_note)] <-
      "ambiguous duplicate value/code parsed for this key; kept the first occurrence"
    value_labels <- value_labels[!duplicated(value_key), , drop = FALSE]
  }

  new_documents <- data.frame(
    document_id = document_id,
    source_url = source_url,
    pdf_filename = basename(local_pdf_path),
    document_date = tryCatch(
      as.Date(parsed$document$document_date[[1L]], format = "%d-%b-%Y"),
      error = function(e) as.Date(NA)
    ),
    retrieved_at = Sys.time(),
    sha256 = sha,
    parser_version = .lasa_parser_version,
    filecodes = paste(affected_filecodes, collapse = ";"),
    stringsAsFactors = FALSE
  )

  variable_cols <- names(.lasa_empty_label_db()$variables)
  value_cols <- names(.lasa_empty_label_db()$value_labels)
  variables <- variables[, variable_cols[variable_cols %in% names(variables)], drop = FALSE]
  value_labels <- value_labels[, value_cols[value_cols %in% names(value_labels)], drop = FALSE]

  owned_doc <- db$documents$document_id == document_id
  owned_filecode_var <- .lasa_normalize_filecode(db$variables$filecode) %in% affected_keys
  owned_filecode_val <- .lasa_normalize_filecode(db$value_labels$filecode) %in% affected_keys

  new_db <- db
  new_db$documents <- rbind(db$documents[!owned_doc, , drop = FALSE], new_documents)
  new_db$variables <- rbind(
    db$variables[!(db$variables$document_id == document_id | owned_filecode_var), , drop = FALSE],
    variables
  )
  new_db$value_labels <- rbind(
    db$value_labels[!(db$value_labels$document_id == document_id | owned_filecode_val), , drop = FALSE],
    value_labels
  )
  rownames(new_db$documents) <- NULL
  rownames(new_db$variables) <- NULL
  rownames(new_db$value_labels) <- NULL

  problems <- .lasa_validate_label_db(new_db)
  if (length(problems) > 0L) {
    stop(
      "Merging '", basename(local_pdf_path), "' would leave the label database in an ",
      "invalid state (existing database is unchanged):\n- ", paste(problems, collapse = "\n- "),
      call. = FALSE
    )
  }

  status <- if (nrow(existing_doc) == 1L) "updated" else "inserted"
  result <- list(
    status = status, document_id = document_id, pdf_changed = TRUE,
    filecodes = affected_filecodes,
    n_variables = nrow(variables), n_value_labels = nrow(value_labels),
    n_unresolved = sum(!is.na(variables$parse_note))
  )

  if (isTRUE(dry_run)) {
    return(invisible(result))
  }

  .lasa_save_label_db(new_db)
  invisible(result)
}
