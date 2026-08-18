# update_lasa_labels(): download/read, hash, parse, validate and merge one
# LASA varinfo PDF into the user-local label database.

# Bump whenever parser semantics change. The no-op check below includes this
# version, so an unchanged PDF is reparsed after a parser fix instead of
# preserving metadata produced by an older parser.
.lasa_parser_version <- "1.1"

.lasa_classify_var_type <- function(variables, value_labels) {
  key <- function(df) {
    paste(df$filecode, df$wave, df$variable_name, sep = "\r")
  }
  var_key <- key(variables)
  val_key <- key(value_labels)

  vapply(seq_len(nrow(variables)), function(i) {
    codes <- value_labels$value_numeric[val_key == var_key[[i]]]
    codes <- codes[!is.na(codes)]
    if (length(codes) == 0L || .lasa_is_codebook_numeric(codes)) {
      "numeric"
    } else {
      "categorical"
    }
  }, character(1L))
}

.lasa_download_varinfo <- function(url) {
  destination <- tempfile(fileext = ".pdf")
  result <- tryCatch(
    {
      utils::download.file(
        url,
        destination,
        mode = "wb",
        quiet = TRUE
      )
      TRUE
    },
    error = function(e) FALSE,
    warning = function(w) FALSE
  )

  if (!isTRUE(result) ||
      !file.exists(destination) ||
      file.info(destination)$size == 0L) {
    stop(
      "Could not download the variable-information PDF from ",
      url,
      ". If you already have the PDF saved locally, call ",
      "update_lasa_labels(path = ...) instead.",
      call. = FALSE
    )
  }

  destination
}

# Deduplicate exact repeats, but never choose arbitrarily between contradictory
# parser results. The old implementation kept the first occurrence when the
# same key had two different labels; that is unsafe for wave-specific coding.
.lasa_resolve_parsed_variable_duplicates <- function(variables) {
  if (nrow(variables) == 0L) return(variables)

  key <- paste(
    variables$filecode,
    variables$wave,
    variables$variable_name,
    sep = "\r"
  )
  duplicate_keys <- unique(key[duplicated(key) | duplicated(key, fromLast = TRUE)])

  for (dup_key in duplicate_keys) {
    idx <- which(key == dup_key)
    compare <- variables[
      idx,
      intersect(
        c("canonical_name", "variable_label"),
        names(variables)
      ),
      drop = FALSE
    ]

    normalized <- lapply(compare, function(x) {
      ifelse(is.na(x), "<NA>", trimws(as.character(x)))
    })
    signature <- do.call(
      paste,
      c(normalized, list(sep = "\r"))
    )

    if (length(unique(signature)) > 1L) {
      first <- variables[idx[[1L]], , drop = FALSE]
      stop(
        "The PDF parser produced conflicting variable definitions for ",
        "(filecode, wave, variable_name) = ('",
        first$filecode[[1L]], "', '",
        first$wave[[1L]], "', '",
        first$variable_name[[1L]], "'). ",
        "The database was not modified. Fix the parser/source ambiguity ",
        "instead of keeping an arbitrary first occurrence.",
        call. = FALSE
      )
    }
  }

  variables[!duplicated(key), , drop = FALSE]
}

.lasa_resolve_parsed_value_duplicates <- function(value_labels) {
  if (nrow(value_labels) == 0L) return(value_labels)

  resolved <- !is.na(value_labels$value_raw)
  key <- paste(
    value_labels$filecode,
    value_labels$wave,
    value_labels$variable_name,
    value_labels$value_raw,
    sep = "\r"
  )
  duplicate_keys <- unique(
    key[resolved & (duplicated(key) | duplicated(key, fromLast = TRUE))]
  )

  for (dup_key in duplicate_keys) {
    idx <- which(key == dup_key & resolved)

    labels <- ifelse(
      is.na(value_labels$value_label[idx]),
      "<NA>",
      trimws(as.character(value_labels$value_label[idx]))
    )

    if (length(unique(labels)) > 1L) {
      first <- value_labels[idx[[1L]], , drop = FALSE]
      stop(
        "The PDF parser produced conflicting value labels for ",
        "(filecode, wave, variable_name, value) = ('",
        first$filecode[[1L]], "', '",
        first$wave[[1L]], "', '",
        first$variable_name[[1L]], "', '",
        first$value_raw[[1L]], "'). Parsed labels: ",
        paste(unique(labels), collapse = " | "),
        ". The database was not modified. This usually indicates an ",
        "unresolved wave-specific condition in the PDF.",
        call. = FALSE
      )
    }
  }

  keep <- !resolved | !duplicated(key)
  value_labels[keep, , drop = FALSE]
}

.lasa_validate_parsed_label_semantics <- function(variables, value_labels) {
  problems <- character(0)

  if (nrow(variables) > 0L) {
    bad_filecode <- !is.na(variables$filecode) &
      grepl("[;,/[:space:]]", variables$filecode)
    if (any(bad_filecode)) {
      examples <- unique(variables$filecode[bad_filecode])
      problems <- c(
        problems,
        paste0(
          "filecode contains a combined/non-normalized key: ",
          paste(utils::head(examples, 5L), collapse = ", ")
        )
      )
    }
    bad_canonical <- !is.na(variables$canonical_name) &
      (grepl("/", variables$canonical_name, fixed = TRUE) |
         grepl("[[:space:]]", variables$canonical_name) |
         variables$canonical_name != tolower(variables$canonical_name))
    if (any(bad_canonical)) {
      examples <- unique(variables$canonical_name[bad_canonical])
      problems <- c(
        problems,
        paste0(
          "canonical_name is not a clean lowercase wave-stripped name: ",
          paste(utils::head(examples, 5L), collapse = ", ")
        )
      )
    }

    # This catches a future regression in which the post-parse canonical
    # repair is accidentally skipped. It deliberately delegates the
    # invariant-name distinction (e.g. z004/MB004 `byear`) to the same
    # conservative repair helper used by the parser.
    repaired <- .lasa_varinfo_repair_canonical_names(variables)
    canonical_changed <- !is.na(variables$canonical_name) &
      !is.na(repaired$canonical_name) &
      variables$canonical_name != repaired$canonical_name
    if (any(canonical_changed)) {
      examples <- unique(variables$variable_name[canonical_changed])
      problems <- c(
        problems,
        paste0(
          "canonical_name still appears to contain a wave prefix for: ",
          paste(utils::head(examples, 5L), collapse = ", ")
        )
      )
    }

    identifier_leak <- !is.na(variables$parse_note) &
      grepl(
        "variable label still contains a LASA file identifier",
        variables$parse_note,
        fixed = TRUE
      )
    if (any(identifier_leak)) {
      examples <- unique(variables$variable_name[identifier_leak])
      problems <- c(
        problems,
        paste0(
          "variable-label header/filecode leakage remains for: ",
          paste(utils::head(examples, 5L), collapse = ", ")
        )
      )
    }
  }

  if (nrow(value_labels) > 0L) {
    # A wave condition belongs in the row's `wave`/`source_condition`, never
    # inside the final value_label. This explicitly catches the old LASA046
    # failure: "na, (from wave h: not done,) wrong skip".
    scoped_text_leak <- !is.na(value_labels$value_label) &
      grepl(
        paste0(
          "(?i)(?:^|[,(;[:space:]])(?:",
          "for\\s+(?:2B|3B|4B|MB|[B-L])|",
          "from(?:\\s+wave)?\\s+(?:2B|3B|4B|MB|[B-L])|",
          "only\\s+in(?:\\s+waves?)?\\s+(?:2B|3B|4B|MB|[B-L])|",
          "not\\s+in(?:\\s+waves?)?\\s+(?:2B|3B|4B|MB|[B-L])|",
          "in\\s+waves?\\s+(?:2B|3B|4B|MB|[B-L])",
          ")\\b"
        ),
        value_labels$value_label,
        perl = TRUE
      )
    if (any(scoped_text_leak)) {
      examples <- unique(value_labels$value_label[scoped_text_leak])
      problems <- c(
        problems,
        paste0(
          "wave-condition text still leaked into value_label: ",
          paste(utils::head(examples, 5L), collapse = " | ")
        )
      )
    }
  }

  unique(problems)
}

#' Refresh the LASA label database from a variable-information PDF
#'
#' Downloads (or reads, via `path`) one LASA varinfo PDF, parses it, and
#' merges the result into the user-local label database used by
#' [apply_lasa_labels()] and [read_lasa_sav()]. Parsed records owned by the
#' document/filecode are replaced transactionally; manual overrides remain
#' separate and are composed on top at lookup time.
#'
#' @param filecode Optional LASA file code to resolve a PDF for.
#' @param url Optional explicit PDF URL.
#' @param path Optional path to an already-downloaded PDF.
#' @param dry_run Logical. Parse and validate but do not save.
#' @param strict Logical. Block an explicitly requested filecode when its
#'   variable/wave identity cannot be resolved unambiguously.
#'
#' @return Invisibly, a list describing the update.
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
    if (!is.character(path) ||
        length(path) != 1L ||
        is.na(path) ||
        !file.exists(path)) {
      stop(
        "'path' must be a single existing file path.",
        call. = FALSE
      )
    }

    local_pdf_path <- path
    source_url <- if (!is.null(url)) url else NA_character_
    source_filename <- basename(path)
  } else {
    resolved <- .lasa_resolve_varinfo_url(
      filecode = filecode,
      url = url
    )

    if (is.na(resolved$varinfo_url)) {
      stop(
        "The variable-information PDF for this filecode was only ",
        "resolved via the offline manifest, which does not carry a ",
        "downloadable URL. Supply 'path' with a local copy of '",
        resolved$varinfo_file,
        "' instead.",
        call. = FALSE
      )
    }

    local_pdf_path <- .lasa_download_varinfo(resolved$varinfo_url)
    on.exit(unlink(local_pdf_path), add = TRUE)
    source_url <- resolved$varinfo_url
    source_filename <- if (!is.null(resolved$varinfo_file) &&
                           !is.na(resolved$varinfo_file) &&
                           nzchar(resolved$varinfo_file)) {
      resolved$varinfo_file
    } else {
      basename(sub("[?#].*$", "", resolved$varinfo_url))
    }
  }

  raw_bytes <- readBin(
    local_pdf_path,
    "raw",
    file.info(local_pdf_path)$size
  )
  sha <- digest::digest(
    raw_bytes,
    algo = "sha256",
    serialize = FALSE
  )

  document_id <- sub(
    "\\.pdf$",
    "",
    source_filename,
    ignore.case = TRUE
  )

  db <- .lasa_load_label_db()
  existing_doc <- db$documents[
    db$documents$document_id == document_id,
    ,
    drop = FALSE
  ]

  same_hash <- nrow(existing_doc) == 1L &&
    identical(existing_doc$sha256[[1L]], sha)
  same_parser <- nrow(existing_doc) == 1L &&
    !is.na(existing_doc$parser_version[[1L]]) &&
    identical(
      as.character(existing_doc$parser_version[[1L]]),
      .lasa_parser_version
    )

  # Same bytes are only a no-op if they were already interpreted by this
  # parser version. Parser fixes therefore automatically rebuild old local
  # metadata even when LASA has not changed the PDF.
  if (same_hash && same_parser) {
    return(invisible(list(
      status = "no_op",
      document_id = document_id,
      pdf_changed = FALSE,
      parser_changed = FALSE,
      filecodes = strsplit(
        existing_doc$filecodes[[1L]],
        ";",
        fixed = TRUE
      )[[1L]],
      n_variables = sum(
        db$variables$document_id == document_id
      ),
      n_value_labels = sum(
        db$value_labels$document_id == document_id
      ),
      n_unresolved = sum(
        db$variables$document_id == document_id &
          !is.na(db$variables$parse_note)
      )
    )))
  }

  parsed <- .lasa_parse_varinfo(
    local_pdf_path,
    document_id = document_id
  )
  variables <- parsed$variables
  value_labels <- parsed$value_labels

  semantic_problems <- .lasa_validate_parsed_label_semantics(
    variables,
    value_labels
  )
  if (length(semantic_problems) > 0L) {
    stop(
      "Parsed metadata failed semantic validation; the existing ",
      "database is unchanged:\n- ",
      paste(semantic_problems, collapse = "\n- "),
      call. = FALSE
    )
  }

  variables <- .lasa_resolve_parsed_variable_duplicates(
    variables
  )
  value_labels <- .lasa_resolve_parsed_value_duplicates(
    value_labels
  )

  variables$document_id <- rep(
    document_id,
    nrow(variables)
  )

  value_labels$value_numeric <- suppressWarnings(
    as.numeric(value_labels$value_raw)
  )
  value_labels$is_missing <-
    !is.na(value_labels$value_numeric) &
    value_labels$value_numeric < 0
  value_labels$document_id <- rep(
    document_id,
    nrow(value_labels)
  )

  variables$var_type <- .lasa_classify_var_type(
    variables,
    value_labels
  )

  affected_filecodes <- unique(
    stats::na.omit(variables$filecode)
  )
  affected_keys <- .lasa_normalize_filecode(
    affected_filecodes
  )

  if (isTRUE(strict) && !is.null(filecode)) {
    requested_key <- .lasa_normalize_filecode(filecode)
    requested_rows <- variables[
      .lasa_normalize_filecode(variables$filecode) ==
        requested_key,
      ,
      drop = FALSE
    ]

    unresolved <- requested_rows[
      !is.na(requested_rows$parse_note) &
        is.na(requested_rows$wave),
      ,
      drop = FALSE
    ]

    if (nrow(unresolved) > 0L) {
      stop(
        nrow(unresolved),
        " row(s) for filecode '",
        filecode,
        "' could not be unambiguously parsed from '",
        basename(local_pdf_path),
        "' (strict = TRUE blocks the update; the existing database ",
        "is unchanged). First problem: ",
        unresolved$parse_note[[1L]],
        " (variable '",
        unresolved$variable_name[[1L]],
        "').",
        call. = FALSE
      )
    }
  }

  new_documents <- data.frame(
    document_id = document_id,
    source_url = source_url,
    pdf_filename = source_filename,
    document_date = tryCatch(
      as.Date(
        parsed$document$document_date[[1L]],
        format = "%d-%b-%Y"
      ),
      error = function(e) as.Date(NA)
    ),
    retrieved_at = Sys.time(),
    sha256 = sha,
    parser_version = .lasa_parser_version,
    filecodes = paste(affected_filecodes, collapse = ";"),
    stringsAsFactors = FALSE
  )

  variable_cols <- names(
    .lasa_empty_label_db()$variables
  )
  value_cols <- names(
    .lasa_empty_label_db()$value_labels
  )

  variables <- variables[
    ,
    variable_cols[
      variable_cols %in% names(variables)
    ],
    drop = FALSE
  ]
  value_labels <- value_labels[
    ,
    value_cols[
      value_cols %in% names(value_labels)
    ],
    drop = FALSE
  ]

  owned_doc <- db$documents$document_id == document_id
  owned_filecode_var <-
    .lasa_normalize_filecode(db$variables$filecode) %in%
    affected_keys
  owned_filecode_val <-
    .lasa_normalize_filecode(db$value_labels$filecode) %in%
    affected_keys

  new_db <- db
  new_db$documents <- rbind(
    db$documents[!owned_doc, , drop = FALSE],
    new_documents
  )
  new_db$variables <- rbind(
    db$variables[
      !(
        db$variables$document_id == document_id |
          owned_filecode_var
      ),
      ,
      drop = FALSE
    ],
    variables
  )
  new_db$value_labels <- rbind(
    db$value_labels[
      !(
        db$value_labels$document_id == document_id |
          owned_filecode_val
      ),
      ,
      drop = FALSE
    ],
    value_labels
  )

  rownames(new_db$documents) <- NULL
  rownames(new_db$variables) <- NULL
  rownames(new_db$value_labels) <- NULL

  problems <- .lasa_validate_label_db(new_db)
  if (length(problems) > 0L) {
    stop(
      "Merging '",
      basename(local_pdf_path),
      "' would leave the label database in an invalid state ",
      "(existing database is unchanged):\n- ",
      paste(problems, collapse = "\n- "),
      call. = FALSE
    )
  }

  status <- if (nrow(existing_doc) == 1L) {
    "updated"
  } else {
    "inserted"
  }

  result <- list(
    status = status,
    document_id = document_id,
    pdf_changed = !same_hash,
    parser_changed = !same_parser,
    filecodes = affected_filecodes,
    n_variables = nrow(variables),
    n_value_labels = nrow(value_labels),
    n_unresolved = sum(!is.na(variables$parse_note))
  )

  if (isTRUE(dry_run)) {
    return(invisible(result))
  }

  .lasa_save_label_db(new_db)
  invisible(result)
}
