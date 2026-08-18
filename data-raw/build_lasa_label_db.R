## Build the bundled LASA label database.
##
## The parser is the primary source of truth. This script additionally applies
## a very small set of explicit, source-verified corrections before writing
## `data/lasa_label_db_bundled.rda`. These corrections are deliberately kept
## here (rather than in the runtime label engine) so:
##   * the bundled database itself contains the correct metadata;
##   * a rebuild is reproducible; and
##   * parser regressions are caught by validation instead of silently shipped.
##
## Run from the package root.

devtools::load_all(".", quiet = TRUE)

manifest_path <- file.path("data-raw", "lasa_topics_table.csv")
if (!file.exists(manifest_path)) {
  stop("Missing ", manifest_path, call. = FALSE)
}

manifest <- utils::read.csv(
  manifest_path,
  stringsAsFactors = FALSE,
  check.names = FALSE
)

required_manifest_columns <- c(
  "filecode", "has_varinfo", "varinfo_file"
)
missing_manifest_columns <- setdiff(
  required_manifest_columns,
  names(manifest)
)
if (length(missing_manifest_columns) > 0L) {
  stop(
    "The LASA topic manifest is missing: ",
    paste(missing_manifest_columns, collapse = ", "),
    call. = FALSE
  )
}

manifest <- manifest[
  !is.na(manifest$has_varinfo) &
    manifest$has_varinfo &
    !is.na(manifest$varinfo_file) &
    nzchar(manifest$varinfo_file),
  ,
  drop = FALSE
]

# One shared PDF can document several filecodes. Parse each unique PDF once.
pdf_groups <- split(
  manifest,
  manifest$varinfo_file
)
pdf_groups <- pdf_groups[
  order(names(pdf_groups))
]

codebook_dir <- "codebook"
cat(
  length(pdf_groups),
  "unique varinfo PDF(s) listed in",
  manifest_path,
  "\n"
)

# Start from a clean user-local database so the build does not inherit state
# from prior interactive tests/updates.
unlink(.lasa_label_db_path())

results <- vector("list", length(pdf_groups))
names(results) <- names(pdf_groups)

for (i in seq_along(pdf_groups)) {
  pdf_name <- names(pdf_groups)[[i]]
  rows <- pdf_groups[[i]]
  local_path <- file.path(codebook_dir, pdf_name)

  # Prefer a local development copy when present. Otherwise use one
  # representative filecode to resolve/download the shared PDF from LASA.
  representative_filecode <- rows$filecode[
    !is.na(rows$filecode) & nzchar(rows$filecode)
  ][[1L]]

  results[[i]] <- tryCatch(
    {
      if (file.exists(local_path)) {
        update_lasa_labels(
          path = local_path,
          strict = FALSE
        )
      } else {
        update_lasa_labels(
          filecode = representative_filecode,
          strict = FALSE
        )
      }
    },
    error = function(e) {
      list(
        status = "error",
        document_id = NA_character_,
        pdf_changed = NA,
        parser_changed = NA,
        filecodes = character(0),
        n_variables = 0L,
        n_value_labels = 0L,
        n_unresolved = NA_integer_,
        error = conditionMessage(e)
      )
    }
  )

  cat(sprintf(
    "[%3d/%3d] %-45s %-9s vars=%-5d vals=%-5d unresolved=%s\n",
    i,
    length(pdf_groups),
    pdf_name,
    results[[i]]$status,
    results[[i]]$n_variables,
    results[[i]]$n_value_labels,
    if (is.null(results[[i]]$n_unresolved)) {
      "NA"
    } else {
      results[[i]]$n_unresolved
    }
  ))
}

errored <- names(results)[
  vapply(
    results,
    function(r) identical(r$status, "error"),
    logical(1L)
  )
]

if (length(errored) > 0L) {
  cat("\nPDFs that failed to parse/update:\n")
  for (nm in errored) {
    cat(" -", nm, ":", results[[nm]]$error, "\n")
  }
  stop(
    "Bundled database build aborted because ", length(errored),
    " varinfo PDF(s) failed. Do not write a silently incomplete bundled database.",
    call. = FALSE
  )
}

lasa_label_db_bundled <- lasa_label_db()

# -------------------------------------------------------------------------
# Reproducible bundled-data corrections
# -------------------------------------------------------------------------

.bootstrap_repair_canonical_names <- function(db) {
  if (nrow(db$variables) == 0L) return(db)

  # Apply the same post-parse canonical repair independently per source
  # document. Doing this document-by-document prevents a coincidentally equal
  # variable name in an unrelated filecode from being mistaken for evidence
  # that a name is wave-invariant.
  document_ids <- unique(db$variables$document_id)

  for (document_id in document_ids) {
    idx <- which(db$variables$document_id == document_id)
    db$variables[idx, ] <- .lasa_varinfo_repair_canonical_names(
      db$variables[idx, , drop = FALSE]
    )
  }

  db
}

.bootstrap_set_variable <- function(db,
                                    filecode,
                                    wave,
                                    variable_name,
                                    canonical_name,
                                    variable_label) {
  idx <- which(
    .lasa_normalize_filecode(db$variables$filecode) ==
      .lasa_normalize_filecode(filecode) &
      toupper(db$variables$wave) == toupper(wave) &
      tolower(db$variables$variable_name) ==
      tolower(variable_name)
  )

  if (length(idx) != 1L) {
    stop(
      "Bundled correction expected exactly one variable row for ",
      filecode, "/", wave, "/", variable_name,
      " but found ", length(idx), ".",
      call. = FALSE
    )
  }

  db$variables$canonical_name[idx] <- canonical_name
  db$variables$variable_label[idx] <- variable_label
  db$variables$parse_note[idx] <- NA_character_
  db
}

.bootstrap_set_value_label <- function(db,
                                       filecode,
                                       wave,
                                       variable_name,
                                       value,
                                       value_label,
                                       source_condition) {
  value_raw <- as.character(value)

  var_idx <- which(
    .lasa_normalize_filecode(db$variables$filecode) ==
      .lasa_normalize_filecode(filecode) &
      toupper(db$variables$wave) == toupper(wave) &
      tolower(db$variables$variable_name) ==
      tolower(variable_name)
  )
  if (length(var_idx) != 1L) {
    stop(
      "Cannot hardcode value label: variable row not unique for ",
      filecode, "/", wave, "/", variable_name, ".",
      call. = FALSE
    )
  }

  existing <- which(
    .lasa_normalize_filecode(db$value_labels$filecode) ==
      .lasa_normalize_filecode(filecode) &
      toupper(db$value_labels$wave) == toupper(wave) &
      tolower(db$value_labels$variable_name) ==
      tolower(variable_name) &
      !is.na(db$value_labels$value_raw) &
      db$value_labels$value_raw == value_raw
  )

  # Remove every parser-produced definition for this key first. The explicit
  # correction below becomes the single authoritative bundled row.
  if (length(existing) > 0L) {
    db$value_labels <- db$value_labels[-existing, , drop = FALSE]
  }

  variable_row <- db$variables[var_idx, , drop = FALSE]
  value_numeric <- suppressWarnings(as.numeric(value_raw))
  new_row <- data.frame(
    filecode = filecode,
    wave = wave,
    variable_name = variable_name,
    value_raw = value_raw,
    value_numeric = value_numeric,
    value_label = value_label,
    is_missing = !is.na(value_numeric) && value_numeric < 0,
    document_id = variable_row$document_id[[1L]],
    source_page = variable_row$source_page[[1L]],
    source_row = variable_row$source_row[[1L]],
    source_condition = source_condition,
    parse_note = NA_character_,
    stringsAsFactors = FALSE
  )

  db$value_labels <- rbind(
    db$value_labels,
    new_row
  )
  rownames(db$value_labels) <- NULL
  db
}

.bootstrap_apply_verified_corrections <- function(db) {
  db <- .bootstrap_repair_canonical_names(db)

  # LASA046, lphya01 ------------------------------------------------------
  #
  # Source: LASA046_varinfo.pdf, 19-Jan-2024, page 1.
  # Variable label:
  #   "Physical condition respondent: observation"
  #
  # Value -3 is explicitly wave-specific:
  #   B/C/D/E/2B/F/G : "na, wrong skip"
  #   H/3B/I/J/K     : "not done, wrong skip"
  #
  # Keep this source-verified correction in the bundled build even though
  # parser v1.1 now reads the scopes correctly. It is both a safeguard and
  # an executable regression assertion for the metadata users most readily
  # notice.
  waves_early <- c("B", "C", "D", "E", "2B", "F", "G")
  waves_late <- c("H", "3B", "I", "J", "K")
  waves_all <- c(waves_early, waves_late)

  for (wave in waves_all) {
    variable_name <- paste0(
      .lasa_varinfo_wave_prefix(wave),
      "lphya01"
    )

    db <- .bootstrap_set_variable(
      db = db,
      filecode = "046",
      wave = wave,
      variable_name = variable_name,
      canonical_name = "lphya01",
      variable_label = "Physical condition respondent: observation"
    )

    if (wave %in% waves_early) {
      db <- .bootstrap_set_value_label(
        db = db,
        filecode = "046",
        wave = wave,
        variable_name = variable_name,
        value = -3,
        value_label = "na, wrong skip",
        source_condition = "For B/C/D/E/2B/F/G"
      )
    } else {
      db <- .bootstrap_set_value_label(
        db = db,
        filecode = "046",
        wave = wave,
        variable_name = variable_name,
        value = -3,
        value_label = "not done, wrong skip",
        source_condition = "From H onwards"
      )
    }
  }

  db
}

lasa_label_db_bundled <- .bootstrap_apply_verified_corrections(
  lasa_label_db_bundled
)

# -------------------------------------------------------------------------
# Build-time semantic checks
# -------------------------------------------------------------------------

.bootstrap_semantic_problems <- function(db) {
  problems <- .lasa_validate_label_db(db)

  if (nrow(db$variables) > 0L) {
    bad_filecode <- !is.na(db$variables$filecode) &
      grepl("[;,/[:space:]]", db$variables$filecode)
    if (any(bad_filecode)) {
      examples <- unique(db$variables$filecode[bad_filecode])
      problems <- c(
        problems,
        paste0(
          sum(bad_filecode),
          " variable row(s) contain combined/non-normalized filecode keys; examples: ",
          paste(utils::head(examples, 5L), collapse = ", ")
        )
      )
    }

    bad_canonical <- !is.na(db$variables$canonical_name) &
      grepl("/", db$variables$canonical_name, fixed = TRUE)
    if (any(bad_canonical)) {
      problems <- c(
        problems,
        paste0(
          sum(bad_canonical),
          " canonical_name value(s) still contain compact wave notation."
        )
      )
    }

    bad_variable_label <- !is.na(db$variables$variable_label) &
      grepl(
        "(?i)\\b(?:LASA|LAS)(?:2B|3B|4B|MB|[BCDEFGHIJKLZ])?[A-Za-z0-9]{2,4}\\b",
        db$variables$variable_label,
        perl = TRUE
      )
    if (any(bad_variable_label)) {
      examples <- unique(
        db$variables$variable_name[bad_variable_label]
      )
      problems <- c(
        problems,
        paste0(
          sum(bad_variable_label),
          " variable_label value(s) still contain a LASA file identifier; ",
          "examples: ",
          paste(utils::head(examples, 8L), collapse = ", ")
        )
      )
    }
  }

  if (nrow(db$value_labels) > 0L) {
    scoped_text_leak <- !is.na(db$value_labels$value_label) &
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
        db$value_labels$value_label,
        perl = TRUE
      )
    if (any(scoped_text_leak)) {
      examples <- unique(db$value_labels$value_label[scoped_text_leak])
      problems <- c(
        problems,
        paste0(
          sum(scoped_text_leak),
          " value_label value(s) still contain unparsed wave-condition text; examples: ",
          paste(utils::head(examples, 5L), collapse = " | ")
        )
      )
    }
  }

  # Explicit regression checks for LASA046 lphya01.
  expected_early <- data.frame(
    wave = c("B", "C", "D", "E", "2B", "F", "G"),
    label = "na, wrong skip",
    stringsAsFactors = FALSE
  )
  expected_late <- data.frame(
    wave = c("H", "3B", "I", "J", "K"),
    label = "not done, wrong skip",
    stringsAsFactors = FALSE
  )
  expected <- rbind(expected_early, expected_late)

  for (i in seq_len(nrow(expected))) {
    wave <- expected$wave[[i]]
    variable_name <- paste0(
      .lasa_varinfo_wave_prefix(wave),
      "lphya01"
    )

    hit <- db$value_labels[
      .lasa_normalize_filecode(db$value_labels$filecode) == "046" &
        toupper(db$value_labels$wave) == wave &
        tolower(db$value_labels$variable_name) ==
          variable_name &
        !is.na(db$value_labels$value_raw) &
        db$value_labels$value_raw == "-3",
      ,
      drop = FALSE
    ]

    if (nrow(hit) != 1L ||
        !identical(hit$value_label[[1L]], expected$label[[i]])) {
      problems <- c(
        problems,
        paste0(
          "LASA046 ", wave, "/", variable_name,
          " value -3 is not the verified label '",
          expected$label[[i]], "'."
        )
      )
    }
  }

  unique(problems)
}

problems <- .bootstrap_semantic_problems(
  lasa_label_db_bundled
)
if (length(problems) > 0L) {
  stop(
    "Bundled LASA label database failed validation:\n- ",
    paste(problems, collapse = "\n- "),
    call. = FALSE
  )
}

cat(
  "\nBootstrap summary:\n",
  " documents:   ",
  nrow(lasa_label_db_bundled$documents),
  "\n",
  " variables:   ",
  nrow(lasa_label_db_bundled$variables),
  "\n",
  " value_labels:",
  nrow(lasa_label_db_bundled$value_labels),
  "\n",
  " unresolved variable rows:",
  sum(!is.na(lasa_label_db_bundled$variables$parse_note)),
  sprintf(
    " (%.1f%%)\n",
    if (nrow(lasa_label_db_bundled$variables) == 0L) {
      0
    } else {
      100 * mean(
        !is.na(lasa_label_db_bundled$variables$parse_note)
      )
    }
  ),
  " distinct filecodes:",
  length(unique(
    .lasa_normalize_filecode(
      lasa_label_db_bundled$variables$filecode
    )
  )),
  "\n"
)

usethis::use_data(
  lasa_label_db_bundled,
  overwrite = TRUE,
  compress = "xz"
)

# The bundled object now contains the complete bootstrap. Remove the local
# snapshot so future load_all()/install calls read the freshly written bundled
# data rather than build-machine state.
unlink(.lasa_label_db_path())

cat("\nWrote data/lasa_label_db_bundled.rda\n")
