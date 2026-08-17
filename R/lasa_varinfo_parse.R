# Positional PDF parsing of LASA "varinfo" documentation PDFs.
#
# LASA variable-information PDFs (e.g. LASA046_varinfo.pdf) document one or
# more LASA file codes' variables, labels, and value-label codebooks in a
# 3-column ("name" / "label" / "values") table. A repeated page header
# (title + "Variable information: <filecode list>" + footer) appears on
# every page and must be stripped; several documents cover more than one
# LASA file code, demarcated by an in-body section-marker line right before
# a fresh "name/label/values" header row -- and a single page can hold more
# than one such section back to back (e.g. several short protein tables).
#
# This file turns one such PDF into structured `variables` and
# `value_labels` rows (see R/lasa_label_db.R for the schema they feed into).
# Parsing is positional (pdftools::pdf_data(), not pdftools::pdf_text())
# because flattened text visibly misorders wrapped table cells around
# multi-line wave-condition qualifiers.

## A compact multi-wave variable name looks like "b/c/d/e/b/f/g/h/b/i/jlphya01":
## a "/"-joined run of single-wave-prefix letters, immediately (no space)
## followed by the bare variable suffix. A bare canonical name with no wave
## compacting at all (e.g. "byear") is the same pattern with zero slashes.
.lasa_varinfo_name_regex <- "^[a-z][a-z0-9]*(?:/[a-z0-9]+)*$"

## Recognizes a standalone wave-qualifier line such as "Not in wave MB:",
## "Only in waves H, 3B, MB, I, J:", "In waves I, J:".
.lasa_varinfo_qualifier_regex <- "(?i)^(not in|only in|in)\\s+waves?\\b"

.lasa_varinfo_date_regex <- "^[0-9]{1,2}-[A-Za-z]{3}-[0-9]{4}$"

#' Read one PDF's tokens into a single data frame
#' @keywords internal
.lasa_varinfo_pdf_tokens <- function(path) {
  pages <- pdftools::pdf_data(path)
  if (length(pages) == 0L) {
    stop("PDF '", path, "' has no pages.", call. = FALSE)
  }
  out <- lapply(seq_along(pages), function(i) {
    p <- pages[[i]]
    if (nrow(p) == 0L) return(NULL)
    p$page <- i
    p
  })
  out <- out[!vapply(out, is.null, logical(1))]
  if (length(out) == 0L) {
    stop("PDF '", path, "' contains no extractable text tokens.", call. = FALSE)
  }
  tokens <- do.call(rbind, out)
  tokens <- tokens[stats::complete.cases(tokens[c("x", "y", "text")]), , drop = FALSE]
  tokens$text <- as.character(tokens$text)
  tokens[order(tokens$page, tokens$y, tokens$x), , drop = FALSE]
}

## Groups a page's tokens into lines (identical y within a page). Returns a
## list of data frames, one per line, ordered top to bottom then left to
## right.
.lasa_varinfo_group_lines <- function(page_tokens) {
  if (nrow(page_tokens) == 0L) return(list())
  ord <- order(page_tokens$y, page_tokens$x)
  page_tokens <- page_tokens[ord, , drop = FALSE]
  split(page_tokens, page_tokens$y)[unique(as.character(page_tokens$y))]
}

## Reconstructs a line's text, honoring pdftools' per-token `space` flag
## (TRUE = a space follows this token before the next one).
.lasa_varinfo_line_text <- function(line_df) {
  line_df <- line_df[order(line_df$x), , drop = FALSE]
  n <- nrow(line_df)
  if (n == 0L) return("")
  pieces <- character(n)
  for (i in seq_len(n)) {
    pieces[[i]] <- line_df$text[[i]]
    if (i < n && isTRUE(line_df$space[[i]])) pieces[[i]] <- paste0(pieces[[i]], " ")
  }
  paste(pieces, collapse = "")
}

## Does a page's top region look like the start of the repeated boilerplate
## title block ("LASA<code> - <topic title> ... Variable information:
## <filecode list, possibly spanning several lines>")? Returns the y of the
## last line belonging to that block (strip everything with y <= this), or
## NA if the page has no such block.
##
## The "Variable information:" filecode/wave list spans as many additional
## lines as end with a trailing "/" or "," -- the source PDF's own explicit
## "more items follow" marker -- and stops at the first line that doesn't
## (whether that line ends with a semicolon, as the standard multi-wave
## list does, or is simply the end of a single-line list). This is more
## precise than merely checking whether a line "looks like" a bare
## filecode/wave fragment: a genuine section-marker line immediately after
## the block (e.g. "LASAC868 (SAP)", "z004 (LASA-B, LASA-2B, LASA-3B)")
## has exactly that same shape but is never continuation-punctuated, so it
## is correctly left for the caller to treat as a marker instead of being
## swept into the boilerplate.
.lasa_varinfo_title_block_end_y <- function(lines) {
  if (length(lines) == 0L) return(NA_real_)
  texts <- vapply(lines, .lasa_varinfo_line_text, character(1L))
  ys <- as.numeric(names(lines))

  info_idx <- which(grepl("(?i)variable\\s*information", texts, perl = TRUE))
  if (length(info_idx) == 0L) return(NA_real_)
  info_idx <- info_idx[[1L]]

  end_idx <- info_idx
  j <- info_idx
  repeat {
    if (j + 1L > length(texts)) break
    ends_open <- grepl("[/,]\\s*$", trimws(texts[[j]]))
    next_starts_open <- grepl("^\\s*[/,]", texts[[j + 1L]])
    if (!ends_open && !next_starts_open) break
    j <- j + 1L
    end_idx <- j
  }
  ys[[end_idx]]
}

## Detects a "name / label / values" header row among a page's lines
## (after boilerplate stripping). Returns list(index=, name_x=, label_x=,
## values_x=) or NULL.
.lasa_varinfo_find_header_row <- function(lines) {
  for (i in seq_along(lines)) {
    line_df <- lines[[i]]
    lowered <- tolower(trimws(line_df$text))
    name_hit <- which(lowered == "name" & line_df$x < 100)
    label_hit <- which(lowered == "label")
    values_hit <- which(lowered == "values")
    if (length(name_hit) > 0L && length(label_hit) > 0L) {
      return(list(
        index = i,
        name_x = min(line_df$x[name_hit]),
        label_x = min(line_df$x[label_hit]),
        values_x = if (length(values_hit) > 0L) min(line_df$x[values_hit]) else Inf
      ))
    }
  }
  NULL
}

## Extracts full LASA data-file identifiers (e.g. "LASAB046", "LAS2B046",
## "LASMB004", "LASAz004") from a line of text, in order, keeping
## duplicates (order and repetition both matter for wave-prefix
## expansion). Deliberately narrower than the generic
## `.lasa_extract_filecodes()` helper in lasa_topics.R, which extracts bare
## filecodes (e.g. "046") from topic-table prose and would incorrectly
## split a glued identifier like "LAS2B046" into "LAS2B" + "046".
.lasa_varinfo_extract_identifiers <- function(text) {
  if (length(text) == 0L || is.na(text) || !nzchar(text)) return(character(0))
  tokens <- unlist(strsplit(text, "[^A-Za-z0-9]+"))
  tokens <- tokens[nzchar(tokens)]
  tokens[grepl("^(?:LASA|LAS)[A-Za-z0-9]{2,7}$", tokens, ignore.case = TRUE, perl = TRUE)]
}

## Best-effort extraction of wave and file code from one filecode-shaped
## token, reusing the package's own filename convention parser
## (.lasa_parse_filename(), lasa_io.R) for LASA/LAS-prefixed identifiers
## (e.g. "LASAB046", "LASMB004"). Some section markers instead give a bare
## token with no LASA/LAS prefix at all (e.g. "z004" for a "Z"-wave
## document, "mb004" for its MB companion) -- handled by a parallel bare
## fallback so these still resolve rather than falling through to the
## document-level identifier list (which would wrongly merge every section
## of a multi-section document together).
.lasa_varinfo_identifier_wave_filecode <- function(token) {
  token <- toupper(trimws(token))
  parsed <- tryCatch(.lasa_parse_filename(token), error = function(e) NULL)
  if (!is.null(parsed)) return(list(wave = parsed$wave, file_code = parsed$file_code))

  m <- regmatches(token, regexec("^(2B|3B|4B|MB|[BCDEFGHIJKLZ])([0-9A-Z]{2,4})$", token))[[1L]]
  if (length(m) == 3L) return(list(wave = m[[2L]], file_code = tolower(m[[3L]])))
  list(wave = NA_character_, file_code = NA_character_)
}

.lasa_varinfo_wave_from_token <- function(token) {
  .lasa_varinfo_identifier_wave_filecode(token)$wave
}

## First bare (no LASA/LAS prefix) wave-shaped token in a section-marker
## line, e.g. "z004" from "z004 (LASA-B, LASA-2B, LASA-3B)". Returns
## character(0) when the marker's first token isn't wave-shaped.
.lasa_varinfo_extract_bare_wave_identifier <- function(text) {
  tokens <- unlist(strsplit(text, "[^A-Za-z0-9]+"))
  tokens <- tokens[nzchar(tokens)]
  if (length(tokens) == 0L) return(character(0))
  first <- toupper(tokens[[1L]])
  if (grepl("^(2B|3B|4B|MB|[BCDEFGHIJKLZ])[0-9]{2,4}$", first)) first else character(0)
}

## Combines the LASA/LAS-prefixed and bare-wave-token extractors: whichever
## finds something first. Used both to resolve a section's own identifiers
## and to decide which candidate marker line(s) actually belong to the
## header row they precede (see start_section() below).
.lasa_varinfo_extract_any_identifiers <- function(text) {
  ids <- .lasa_varinfo_extract_identifiers(text)
  if (length(ids) == 0L) ids <- .lasa_varinfo_extract_bare_wave_identifier(text)
  ids
}

## Wave -> lowercase variable-name prefix letter, per the documented
## convention already used throughout the hand-written apply_LASA*_labels.R
## files: the prefix is the wave code's final alphabetic character,
## lowercased (B->b, 2B->b, 3B->b, MB->b, C->c, ..., K->k, Z->z).
.lasa_varinfo_wave_prefix <- function(wave) {
  tolower(sub(".*([A-Za-z])$", "\\1", wave))
}

## Collapses consecutive duplicate prefixes in a wave sequence, matching
## the compact notation's own collapsing (e.g. 3B and MB, both prefix "b",
## collapse to one "b" slot when adjacent in the document's wave order).
.lasa_varinfo_collapse_prefixes <- function(waves) {
  prefixes <- .lasa_varinfo_wave_prefix(waves)
  keep <- c(TRUE, prefixes[-1] != prefixes[-length(prefixes)])
  list(
    waves = split(waves, cumsum(keep)),
    prefixes = prefixes[keep]
  )
}

## Known LASA wave-code tokens, used to pull an explicit wave list out of a
## qualifier line's free text.
.lasa_varinfo_known_wave_tokens <- c(
  "2B", "3B", "4B", "MB", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"
)

## Parses a standalone wave-qualifier line ("Not in wave MB:", "Only in
## waves H, 3B, MB, I, J:") into an explicit wave subset of `section_waves`,
## preserving the section's own order. Returns NULL when the line isn't one
## of the two unambiguous presence qualifiers ("Not in wave(s)" / "Only in
## wave(s)") -- a bare "In wave(s) ...:" line is often a label-wording note
## rather than a presence restriction (e.g. "In waves I, J: put on
## cardigan"), so it is deliberately left unresolved rather than guessed.
.lasa_varinfo_qualifier_wave_subset <- function(condition, section_waves) {
  if (is.na(condition) || !nzchar(condition)) return(NULL)
  kind <- if (grepl("(?i)^not in\\s+waves?\\b", condition, perl = TRUE)) {
    "not"
  } else if (grepl("(?i)^only in\\s+waves?\\b", condition, perl = TRUE)) {
    "only"
  } else {
    return(NULL)
  }

  mentioned <- unlist(regmatches(
    condition,
    gregexpr(paste0("\\b(", paste(.lasa_varinfo_known_wave_tokens, collapse = "|"), ")\\b"), condition)
  ))
  mentioned <- toupper(mentioned)
  if (length(mentioned) == 0L) return(NULL)

  if (identical(kind, "only")) {
    intersect(section_waves, mentioned)
  } else {
    setdiff(section_waves, mentioned)
  }
}

## Expands a compact name expression (e.g. "b/c/d/e/b/f/g/h/b/i/jlphya01")
## against a section's ordered wave list. Returns a data frame with one row
## per (wave, variable_name), or one row with wave = NA and a parse_note
## when the token count doesn't unambiguously match -- never guesses. When
## the full section wave list doesn't reconcile but an unambiguous
## "Not in wave(s)"/"Only in wave(s)" qualifier is active, retries against
## that narrower, explicit wave subset before giving up.
.lasa_varinfo_expand_name <- function(name_raw, section_waves, condition = NA_character_) {
  result <- .lasa_varinfo_expand_name_impl(name_raw, section_waves)
  if (anyNA(result$wave)) {
    qualifier_waves <- .lasa_varinfo_qualifier_wave_subset(condition, section_waves)
    if (!is.null(qualifier_waves) && length(qualifier_waves) > 0L) {
      retried <- .lasa_varinfo_expand_name_impl(name_raw, qualifier_waves)
      if (!anyNA(retried$wave)) return(retried)
    }
  }
  result
}

## Returns a data frame with one row per expanded wave: `wave`,
## `canonical_name` (the bare, wave-stripped documentation name, e.g.
## "lphya01"), `variable_name` (the actual expected column name for that
## specific wave's .sav file, e.g. "blphya01" -- what
## .lasa_apply_labels() matches data column names against), and
## `parse_note`.
.lasa_varinfo_expand_name_impl <- function(name_raw, section_waves) {
  parts <- strsplit(name_raw, "/", fixed = TRUE)[[1L]]
  n_parts <- length(parts)

  if (n_parts == 1L) {
    ## No compacting at all: either a bare (wave-invariant) canonical name
    ## whose column name never carries a wave prefix at all (e.g. z004's
    ## "sex", "byear"), or a single-wave section. Attribute it to every
    ## wave in the section when there's exactly one, else leave
    ## wave-invariant (NA) with a note so it is never silently
    ## mis-attributed to the wrong wave.
    if (length(section_waves) == 1L) {
      return(data.frame(
        wave = section_waves, canonical_name = name_raw, variable_name = name_raw,
        parse_note = NA_character_, stringsAsFactors = FALSE
      ))
    }
    return(data.frame(
      wave = NA_character_, canonical_name = name_raw, variable_name = name_raw,
      parse_note = "wave-invariant name; section spans multiple waves",
      stringsAsFactors = FALSE
    ))
  }

  collapsed <- .lasa_varinfo_collapse_prefixes(section_waves)
  if (length(collapsed$prefixes) != n_parts) {
    return(data.frame(
      wave = NA_character_, canonical_name = name_raw, variable_name = name_raw,
      parse_note = sprintf(
        "compact name has %d wave-prefix token(s) but the document's collapsed wave sequence has %d; not expanded",
        n_parts, length(collapsed$prefixes)
      ),
      stringsAsFactors = FALSE
    ))
  }

  ## The last "/"-joined token is <prefix><suffix> glued with no separator.
  last_prefix <- collapsed$prefixes[[n_parts]]
  last_part <- parts[[n_parts]]
  if (!startsWith(last_part, last_prefix)) {
    return(data.frame(
      wave = NA_character_, canonical_name = name_raw, variable_name = name_raw,
      parse_note = sprintf(
        "expected last wave-prefix token to start with '%s', got '%s'; not expanded",
        last_prefix, last_part
      ),
      stringsAsFactors = FALSE
    ))
  }
  suffix <- substring(last_part, nchar(last_prefix) + 1L)
  if (!nzchar(suffix)) {
    return(data.frame(
      wave = NA_character_, canonical_name = name_raw, variable_name = name_raw,
      parse_note = "no variable suffix found after wave-prefix tokens; not expanded",
      stringsAsFactors = FALSE
    ))
  }

  waves_out <- unlist(collapsed$waves, use.names = FALSE)
  prefixes_out <- .lasa_varinfo_wave_prefix(waves_out)
  data.frame(
    wave = waves_out, canonical_name = suffix, variable_name = paste0(prefixes_out, suffix),
    parse_note = NA_character_, stringsAsFactors = FALSE
  )
}

## Splits value-label text such as "na, wrong skip(-3), no(1), yes(2)" into
## one row per "<label>(<code>)" entry. Non-matching trailing text (e.g. an
## unresolved "see table <Name> *" external reference) is preserved as a
## single row with `value_raw = NA` and the raw text kept in `parse_note`,
## rather than being silently dropped.
.lasa_varinfo_split_value_labels <- function(values_text) {
  values_text <- trimws(values_text)
  if (!nzchar(values_text)) {
    return(data.frame(
      value_raw = character(0), value_label = character(0),
      parse_note = character(0), stringsAsFactors = FALSE
    ))
  }

  if (grepl("(?i)see\\s+table", values_text, perl = TRUE)) {
    return(data.frame(
      value_raw = NA_character_, value_label = NA_character_,
      parse_note = paste0("external reference not resolved: ", values_text),
      stringsAsFactors = FALSE
    ))
  }

  ## Split after "),": each chunk is "<label text>(<code>)"; label text may
  ## itself legitimately contain commas (e.g. "na, wrong skip(-3)").
  chunks <- strsplit(values_text, "(?<=\\)),\\s*", perl = TRUE)[[1L]]
  chunks <- trimws(chunks)
  chunks <- chunks[nzchar(chunks)]
  ## A trailing chunk may keep its terminal comma/period; strip it.
  chunks <- sub("[,.]+$", "", chunks)

  rows <- lapply(chunks, function(chunk) {
    m <- regmatches(chunk, regexec("^(.*)\\((-?[0-9]+(?:\\.[0-9]+)?)\\)$", chunk, perl = TRUE))[[1L]]
    if (length(m) != 3L) {
      return(data.frame(
        value_raw = NA_character_, value_label = NA_character_,
        parse_note = paste0("could not parse value/code from: ", chunk),
        stringsAsFactors = FALSE
      ))
    }
    label <- trimws(m[[2L]])
    code <- trimws(m[[3L]])
    note <- if (grepl("(?i)\\((from wave|only wave|not wave|wave )", chunk, perl = TRUE) ||
                grepl("(?i)\\bfrom wave\\b", label, perl = TRUE)) {
      "label text contains an embedded wave-conditional; verify manually"
    } else if (grepl("(?i)^see\\s", label)) {
      paste0("cross-reference: ", label)
    } else {
      NA_character_
    }
    data.frame(
      value_raw = code, value_label = label, parse_note = note,
      stringsAsFactors = FALSE
    )
  })

  do.call(rbind, rows)
}

#' Parse one LASA varinfo PDF into structured metadata
#'
#' @param path Path to a local `*_varinfo.pdf` file.
#' @param document_id Character scalar identifying this document (typically
#'   the file stem, e.g. `"LASA046_varinfo"`). Defaults to the file's own
#'   basename (without extension).
#'
#' @return A list with `document` (single-row data frame: `document_id`,
#'   `document_date`, `filecodes`), `variables`, and `value_labels` data
#'   frames (see R/lasa_label_db.R for the full schema these feed into;
#'   `var_type`/`is_missing`/`document_id` etc. are filled in by the caller,
#'   not here -- this function only does the positional PDF extraction).
#' @keywords internal
.lasa_parse_varinfo <- function(path, document_id = NULL) {
  if (!file.exists(path)) {
    stop("PDF file not found: ", path, call. = FALSE)
  }
  if (is.null(document_id)) {
    document_id <- sub("\\.pdf$", "", basename(path), ignore.case = TRUE)
  }

  tokens <- .lasa_varinfo_pdf_tokens(path)
  pages <- split(tokens, tokens$page)

  document_date <- NA_character_

  ## Active parsing state, carried across pages.
  name_x <- 70; label_x <- 200; values_x <- 320
  section_filecodes <- character(0)
  section_waves <- character(0)
  active_condition <- NA_character_
  ## TRUE while the most recent qualifier line has not yet been closed by a
  ## trailing ":" -- lets a wrapped qualifier ("Only in waves B, C, D, E,"
  ## / "F, G:") be reassembled across two physical lines instead of only
  ## keeping the first fragment.
  qualifier_open <- FALSE

  variable_rows <- list()
  value_rows <- list()
  row_seq <- 0L

  current_row <- NULL ## list(name_raw=, page=, y=, label_lines=list(), values_lines=list(), condition=)

  flush_row <- function() {
    if (is.null(current_row)) return(invisible(NULL))
    row_seq <<- row_seq + 1L

    label_text <- trimws(paste(unlist(current_row$label_lines), collapse = " "))
    values_text <- trimws(paste(unlist(current_row$values_lines), collapse = " "))

    expanded <- .lasa_varinfo_expand_name(current_row$name_raw, section_waves, current_row$condition)
    row_filecode <- if (length(section_filecodes) == 1L) {
      section_filecodes
    } else if (length(section_filecodes) > 1L) {
      paste(section_filecodes, collapse = ";")
    } else {
      NA_character_
    }
    for (i in seq_len(nrow(expanded))) {
      variable_rows[[length(variable_rows) + 1L]] <<- data.frame(
        filecode = row_filecode,
        wave = expanded$wave[[i]],
        variable_name = expanded$variable_name[[i]],
        canonical_name = expanded$canonical_name[[i]],
        variable_label = if (nzchar(label_text)) label_text else NA_character_,
        source_page = current_row$page,
        source_row = row_seq,
        source_condition = current_row$condition,
        parse_note = expanded$parse_note[[i]],
        stringsAsFactors = FALSE
      )

      vl <- .lasa_varinfo_split_value_labels(values_text)
      if (nrow(vl) > 0L) {
        vl$filecode <- row_filecode
        vl$wave <- expanded$wave[[i]]
        vl$variable_name <- expanded$variable_name[[i]]
        vl$source_page <- current_row$page
        vl$source_row <- row_seq
        vl$source_condition <- current_row$condition
        value_rows[[length(value_rows) + 1L]] <<- vl
      }
    }
    current_row <<- NULL
    invisible(NULL)
  }

  start_section <- function(marker_text) {
    flush_row()
    identifiers <- .lasa_varinfo_extract_any_identifiers(marker_text)
    if (length(identifiers) == 0L) identifiers <- doc_identifiers

    resolved <- lapply(identifiers, .lasa_varinfo_identifier_wave_filecode)
    waves <- vapply(resolved, `[[`, character(1L), "wave")
    file_codes <- vapply(resolved, `[[`, character(1L), "file_code")

    section_filecodes <<- unique(stats::na.omit(file_codes))
    waves <- waves[!is.na(waves)]
    if (length(waves) == 0L) waves <- NA_character_
    section_waves <<- waves
    active_condition <<- NA_character_
    qualifier_open <<- FALSE
    invisible(NULL)
  }

  ## Footer-stripped, line-grouped tokens per page, computed once up front
  ## so the true repeating boilerplate span can be determined document-wide
  ## before any page is processed for real (see below).
  page_lines <- vector("list", length(pages))
  for (page_no in seq_along(pages)) {
    page_tokens <- pages[[as.character(page_no)]]
    if (is.null(page_tokens)) next
    footer <- page_tokens$y > 785
    date_tok <- footer & grepl(.lasa_varinfo_date_regex, page_tokens$text)
    if (any(date_tok) && is.na(document_date)) {
      document_date <- page_tokens$text[which(date_tok)[[1L]]]
    }
    page_tokens <- page_tokens[!footer, , drop = FALSE]
    if (nrow(page_tokens) > 0L) page_lines[[page_no]] <- .lasa_varinfo_group_lines(page_tokens)
  }

  ## The title/"Variable information:" boilerplate is repeated verbatim on
  ## every page. Its per-page extent is already precisely detected (see
  ## .lasa_varinfo_title_block_end_y()), but taking the *minimum* across
  ## the whole document is a cheap extra safety net against any one page's
  ## extraction picking up a stray extra line.
  per_page_title_end_y <- vapply(page_lines, .lasa_varinfo_title_block_end_y, numeric(1L))
  title_end_y <- suppressWarnings(min(per_page_title_end_y, na.rm = TRUE))
  if (!is.finite(title_end_y)) title_end_y <- NA_real_

  title_lines <- if (length(page_lines) >= 1L && !is.null(page_lines[[1L]]) && !is.na(title_end_y)) {
    page_lines[[1L]][as.numeric(names(page_lines[[1L]])) <= title_end_y]
  } else {
    list()
  }
  title_text <- paste(vapply(title_lines, .lasa_varinfo_line_text, character(1L)), collapse = " ")
  doc_identifiers <- .lasa_varinfo_extract_identifiers(title_text)
  doc_filecodes <- unique(stats::na.omit(vapply(doc_identifiers, function(id) {
    .lasa_varinfo_identifier_wave_filecode(id)$file_code
  }, character(1L))))

  for (page_no in seq_along(pages)) {
    lines <- page_lines[[page_no]]
    if (is.null(lines)) next

    if (!is.na(title_end_y)) {
      lines <- lines[as.numeric(names(lines)) > title_end_y]
    }
    if (length(lines) == 0L) next

    ## Peek: does this page (or the remainder of it) open with a fresh
    ## "name/label/values" header row (optionally preceded by one or more
    ## section-marker lines, e.g. "z004 (LASA-B, LASA-2B, LASA-3B)" or a
    ## plain "LASMB004")? Any and all lines before the header belong to the
    ## marker; there may be none, one, or several. A single page can hold
    ## several independent sections back to back, so this scans repeatedly
    ## for header rows rather than only checking once at the top.
    repeat {
      header <- .lasa_varinfo_find_header_row(lines)
      if (!is.null(header)) {
        marker_text <- if (header$index > 1L) {
          marker_lines <- lines[seq_len(header$index - 1L)]
          marker_texts <- vapply(marker_lines, .lasa_varinfo_line_text, character(1L))
          ## Drop annotation lines that happen to sit between the true
          ## section-marker line(s) and the header row but describe a
          ## *different* file (e.g. a passing mention of a related derived
          ## file, "LASAC246 (activity by age periode)", ahead of LASA046's
          ## own wave enumeration). The file code(s) shared by the *most*
          ## marker-candidate lines is/are this section's real subject; a
          ## line naming a file code that isn't among them is an unrelated
          ## aside and gets dropped instead of contaminating the section's
          ## wave list. (Not simply "is this file code in the document's
          ## own declared list": a document can legitimately carry a
          ## section for a file it never mentions in its own title/overview,
          ## e.g. LASA046's separate "246" section further down.)
          line_filecodes <- lapply(marker_texts, function(txt) {
            ids <- .lasa_varinfo_extract_any_identifiers(txt)
            unique(stats::na.omit(vapply(
              ids, function(id) .lasa_varinfo_identifier_wave_filecode(id)$file_code, character(1L)
            )))
          })
          all_filecodes <- unlist(line_filecodes)
          if (length(all_filecodes) == 0L) {
            marker_texts <- character(0)
          } else {
            filecode_counts <- table(all_filecodes)
            mode_filecode <- names(filecode_counts)[[which.max(filecode_counts)]]
            keep <- vapply(line_filecodes, function(fcs) mode_filecode %in% fcs, logical(1L))
            marker_texts <- marker_texts[keep]
          }
          if (length(marker_texts) == 0L) paste(doc_identifiers, collapse = " ") else paste(marker_texts, collapse = " ")
        } else {
          paste(doc_identifiers, collapse = " ")
        }
        start_section(marker_text)
        name_x <- header$name_x; label_x <- header$label_x; values_x <- header$values_x
        lines <- lines[-seq_len(header$index)]
      } else if (length(section_waves) == 0L) {
        ## No header row seen yet anywhere and no section active: bootstrap
        ## from the document-level filecode list so rows aren't silently lost.
        start_section(paste(doc_identifiers, collapse = " "))
      }

      ## Body lines belonging to the section just started run up to (but
      ## excluding) the next header row on this page, if any.
      next_header <- .lasa_varinfo_find_header_row(lines)
      body_end <- if (is.null(next_header)) length(lines) else next_header$index - 1L

      if (body_end >= 1L) {
        for (line_df in lines[seq_len(body_end)]) {
          line_y <- line_df$y[[1L]]
          name_tokens <- line_df[line_df$x < label_x, , drop = FALSE]
          label_tokens <- line_df[line_df$x >= label_x & line_df$x < values_x, , drop = FALSE]
          values_tokens <- line_df[line_df$x >= values_x, , drop = FALSE]

          name_text <- if (nrow(name_tokens) > 0L) .lasa_varinfo_line_text(name_tokens) else ""

          if (nzchar(name_text) && grepl(.lasa_varinfo_name_regex, name_text, perl = TRUE)) {
            flush_row()
            current_row <- list(
              name_raw = name_text, page = page_no, y = line_y,
              ## The row-starting line often already carries the first line
              ## of label/values text alongside the name token (they all
              ## share one y), so seed the accumulators with it rather than
              ## dropping it.
              label_lines = if (nrow(label_tokens) > 0L) list(.lasa_varinfo_line_text(label_tokens)) else list(),
              values_lines = if (nrow(values_tokens) > 0L) list(.lasa_varinfo_line_text(values_tokens)) else list(),
              condition = active_condition
            )
          } else if (nzchar(name_text) && grepl(.lasa_varinfo_qualifier_regex, name_text, perl = TRUE)) {
            active_condition <- name_text
            qualifier_open <- !grepl(":\\s*$", name_text)
          } else if (nzchar(name_text) && qualifier_open &&
                     grepl("^[A-Za-z0-9,;: ]+$", name_text, perl = TRUE)) {
            ## Continuation of a qualifier line wrapped across two physical
            ## lines (e.g. "Only in waves B, C, D, E," / "F, G:").
            active_condition <- paste(active_condition, name_text)
            qualifier_open <- !grepl(":\\s*$", name_text)
          } else if (is.null(current_row)) {
            ## Stray content before any row has started in this section
            ## (should not normally happen); ignore rather than crash.
            next
          } else {
            if (nrow(label_tokens) > 0L) {
              current_row$label_lines[[length(current_row$label_lines) + 1L]] <-
                .lasa_varinfo_line_text(label_tokens)
            }
            if (nrow(values_tokens) > 0L) {
              current_row$values_lines[[length(current_row$values_lines) + 1L]] <-
                .lasa_varinfo_line_text(values_tokens)
            }
          }
        }
      }

      lines <- if (is.null(next_header)) list() else lines[-seq_len(body_end)]
      if (length(lines) == 0L) break
    }
  }
  flush_row()

  variables <- if (length(variable_rows) > 0L) do.call(rbind, variable_rows) else {
    data.frame(
      filecode = character(0), wave = character(0), variable_name = character(0),
      canonical_name = character(0), variable_label = character(0),
      source_page = integer(0), source_row = integer(0),
      source_condition = character(0), parse_note = character(0), stringsAsFactors = FALSE
    )
  }
  value_labels <- if (length(value_rows) > 0L) do.call(rbind, value_rows) else {
    data.frame(
      filecode = character(0), value_raw = character(0), value_label = character(0),
      parse_note = character(0), wave = character(0), variable_name = character(0),
      source_page = integer(0), source_row = integer(0), source_condition = character(0),
      stringsAsFactors = FALSE
    )
  }

  list(
    document = data.frame(
      document_id = document_id,
      pdf_filename = basename(path),
      document_date = document_date,
      filecodes = paste(unique(doc_filecodes), collapse = ";"),
      stringsAsFactors = FALSE
    ),
    variables = variables,
    value_labels = value_labels
  )
}
