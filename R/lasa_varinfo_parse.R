# Positional parsing of LASA variable-information PDFs.
#
# This parser deliberately keeps physical PDF lines until the last possible
# moment. LASA uses layout and line-scoped wave qualifiers in the "values"
# column (for example "For B/.../G:" versus "From H onwards:"). Flattening a
# whole cell before interpreting those qualifiers loses the wave scope and can
# create incorrect labels. The helpers below therefore:
#   * strip the repeated PDF header separately on every page;
#   * keep section/file identifiers out of variable labels;
#   * derive canonical names after wave-prefix expansion; and
#   * parse value-label conditions before expanding value labels to waves.

.lasa_varinfo_name_regex <- "^[a-z][a-z0-9]*(?:/[a-z0-9]+)*$"
.lasa_varinfo_qualifier_regex <- "(?i)^(?:not in|only in|in)(?:\\s+waves?)?\\s+(?:2B|3B|4B|MB|[B-L])\\b"
.lasa_varinfo_date_regex <- "^[0-9]{1,2}-[A-Za-z]{3}-[0-9]{4}$"

.lasa_varinfo_known_wave_tokens <- c(
  "2B", "3B", "4B", "MB", "B", "C", "D", "E",
  "F", "G", "H", "I", "J", "K", "L"
)

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
  tokens <- tokens[
    stats::complete.cases(tokens[c("x", "y", "text")]),
    ,
    drop = FALSE
  ]
  tokens$text <- as.character(tokens$text)
  tokens[order(tokens$page, tokens$y, tokens$x), , drop = FALSE]
}

.lasa_varinfo_group_lines <- function(page_tokens) {
  if (nrow(page_tokens) == 0L) return(list())
  page_tokens <- page_tokens[order(page_tokens$y, page_tokens$x), , drop = FALSE]
  split(page_tokens, page_tokens$y)[unique(as.character(page_tokens$y))]
}

.lasa_varinfo_line_text <- function(line_df) {
  line_df <- line_df[order(line_df$x), , drop = FALSE]
  n <- nrow(line_df)
  if (n == 0L) return("")

  pieces <- character(n)
  for (i in seq_len(n)) {
    pieces[[i]] <- line_df$text[[i]]
    if (i < n && isTRUE(line_df$space[[i]])) {
      pieces[[i]] <- paste0(pieces[[i]], " ")
    }
  }
  paste(pieces, collapse = "")
}

.lasa_varinfo_extract_identifiers <- function(text) {
  if (length(text) == 0L || is.na(text) || !nzchar(text)) {
    return(character(0))
  }
  tokens <- unlist(strsplit(text, "[^A-Za-z0-9]+"))
  tokens <- tokens[nzchar(tokens)]
  tokens[
    grepl(
      "^(?:LASA|LAS)[A-Za-z0-9]{2,7}$",
      tokens,
      ignore.case = TRUE,
      perl = TRUE
    )
  ]
}

.lasa_varinfo_identifier_wave_filecode <- function(token) {
  token <- toupper(trimws(token))
  parsed <- tryCatch(.lasa_parse_filename(token), error = function(e) NULL)
  if (!is.null(parsed)) {
    return(list(wave = parsed$wave, file_code = parsed$file_code))
  }

  m <- regmatches(
    token,
    regexec("^(2B|3B|4B|MB|[BCDEFGHIJKLZ])([0-9A-Z]{2,4})$", token)
  )[[1L]]
  if (length(m) == 3L) {
    return(list(wave = m[[2L]], file_code = tolower(m[[3L]])))
  }

  list(wave = NA_character_, file_code = NA_character_)
}

.lasa_varinfo_wave_from_token <- function(token) {
  .lasa_varinfo_identifier_wave_filecode(token)$wave
}

.lasa_varinfo_extract_bare_wave_identifier <- function(text) {
  tokens <- unlist(strsplit(text, "[^A-Za-z0-9]+"))
  tokens <- tokens[nzchar(tokens)]
  if (length(tokens) == 0L) return(character(0))

  first <- toupper(tokens[[1L]])
  if (grepl("^(2B|3B|4B|MB|[BCDEFGHIJKLZ])[0-9]{2,4}$", first)) {
    first
  } else {
    character(0)
  }
}

.lasa_varinfo_extract_any_identifiers <- function(text) {
  ids <- .lasa_varinfo_extract_identifiers(text)
  if (length(ids) == 0L) {
    ids <- .lasa_varinfo_extract_bare_wave_identifier(text)
  }
  ids
}

.lasa_varinfo_wave_prefix <- function(wave) {
  tolower(sub(".*([A-Za-z])$", "\\1", wave))
}

.lasa_varinfo_collapse_prefixes <- function(waves) {
  waves <- waves[!is.na(waves) & nzchar(waves)]
  if (length(waves) == 0L) {
    return(list(waves = list(), prefixes = character(0)))
  }

  prefixes <- .lasa_varinfo_wave_prefix(waves)
  keep <- c(TRUE, prefixes[-1L] != prefixes[-length(prefixes)])
  list(
    waves = split(waves, cumsum(keep)),
    prefixes = prefixes[keep]
  )
}

# Header handling ---------------------------------------------------------

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
        values_x = if (length(values_hit) > 0L) {
          min(line_df$x[values_hit])
        } else {
          Inf
        }
      ))
    }
  }
  NULL
}

.lasa_varinfo_close_line_gap <- function(ys) {
  gaps <- diff(ys)
  gaps <- gaps[is.finite(gaps) & gaps > 0 & gaps < 40]
  if (length(gaps) == 0L) return(18)
  max(18, 1.8 * stats::median(gaps))
}

# The old parser used the minimum title-block height over all pages. That can
# leave a longer header fragment on another page, after which a LASA file
# identifier may be appended to the current variable label. Determine the
# repeated header extent per page instead.
.lasa_varinfo_title_block_end_y <- function(lines) {
  if (length(lines) == 0L) return(NA_real_)

  texts <- vapply(lines, .lasa_varinfo_line_text, character(1L))
  ys <- as.numeric(names(lines))

  info_idx <- which(
    grepl("(?i)variable\\s*information", texts, perl = TRUE)
  )
  if (length(info_idx) == 0L) return(NA_real_)
  info_idx <- info_idx[[1L]]

  end_idx <- info_idx
  j <- info_idx

  # First consume the normal slash/comma continuation of the file list.
  repeat {
    if (j + 1L > length(texts)) break
    ends_open <- grepl("[/,]\\s*$", trimws(texts[[j]]))
    next_starts_open <- grepl("^\\s*[/,]", texts[[j + 1L]])
    if (!ends_open && !next_starts_open) break
    j <- j + 1L
    end_idx <- j
  }

  # Some LASA headers contain an additional related-file line after the
  # semicolon, e.g. "LASAC246 (activity by age periode)" in LASA046. It is
  # still part of the repeated top header. Include only identifier lines that
  # are vertically contiguous with the header; the later in-body section
  # marker is separated by a larger gap and remains available to start_section.
  close_gap <- .lasa_varinfo_close_line_gap(ys)
  repeat {
    if (end_idx + 1L > length(texts)) break

    next_text <- trimws(texts[[end_idx + 1L]])
    next_ids <- .lasa_varinfo_extract_identifiers(next_text)
    gap <- ys[[end_idx + 1L]] - ys[[end_idx]]

    looks_like_identifier_continuation <-
      length(next_ids) > 0L &&
      grepl("^(?:LASA|LAS)", next_text, ignore.case = TRUE)

    if (!looks_like_identifier_continuation ||
        !is.finite(gap) ||
        gap > close_gap) {
      break
    }

    end_idx <- end_idx + 1L
  }

  ys[[end_idx]]
}

# Defensive fallback if a malformed/reflowed page header survives the y-based
# strip. Section-marker lines are consumed before body parsing, so a full
# LASA-file identifier encountered in the body is header noise, not a variable
# label.
.lasa_varinfo_is_repeated_header_fragment <- function(text) {
  text <- trimws(text)
  if (!nzchar(text)) return(FALSE)

  grepl("(?i)^LASA\\s*[0-9A-Za-z]+\\s*-", text, perl = TRUE) ||
    grepl("(?i)^variable\\s*information\\b", text, perl = TRUE) ||
    grepl("(?i)^www\\.lasa-vu\\.nl\\b", text, perl = TRUE) ||
    grepl(
      "(?i)^(?:LASA|LAS)(?:2B|3B|4B|MB|[BCDEFGHIJKLZ])?[A-Za-z0-9]{2,4}(?:\\s|/|,|;|\\(|$)",
      text,
      perl = TRUE
    )
}

# Wave/name handling ------------------------------------------------------

.lasa_varinfo_wave_mentions <- function(text) {
  if (is.na(text) || !nzchar(text)) return(character(0))

  pattern <- paste0(
    "(?i)(?<![A-Za-z0-9])(",
    paste(.lasa_varinfo_known_wave_tokens, collapse = "|"),
    ")(?![A-Za-z0-9])"
  )
  hits <- regmatches(text, gregexpr(pattern, text, perl = TRUE))[[1L]]
  if (length(hits) == 1L && identical(hits, character(0))) {
    return(character(0))
  }
  toupper(hits)
}

.lasa_varinfo_qualifier_wave_subset <- function(condition, section_waves) {
  if (is.na(condition) || !nzchar(condition)) return(NULL)

  section_waves <- section_waves[
    !is.na(section_waves) & nzchar(section_waves)
  ]

  kind <- if (grepl("(?i)^not in(?:\\s+waves?)?\\s+", condition, perl = TRUE)) {
    "not"
  } else if (grepl("(?i)^only in(?:\\s+waves?)?\\s+", condition, perl = TRUE)) {
    "only"
  } else {
    return(NULL)
  }

  mentioned <- .lasa_varinfo_wave_mentions(condition)
  if (length(mentioned) == 0L) return(NULL)

  if (identical(kind, "only")) {
    section_waves[section_waves %in% mentioned]
  } else {
    section_waves[!section_waves %in% mentioned]
  }
}

# Always derive a canonical-name candidate from compact notation, even when
# wave expansion later fails. This prevents strings such as
# "b/c/d/.../klphya01" from becoming canonical names.
.lasa_varinfo_compact_canonical <- function(name_raw, expected_prefix = NULL) {
  parts <- strsplit(name_raw, "/", fixed = TRUE)[[1L]]
  last <- parts[[length(parts)]]

  if (length(parts) > 1L) {
    if (!is.null(expected_prefix) &&
        nzchar(expected_prefix) &&
        startsWith(last, expected_prefix) &&
        nchar(last) > nchar(expected_prefix)) {
      return(substring(last, nchar(expected_prefix) + 1L))
    }

    if (nchar(last) > 1L &&
        substr(last, 1L, 1L) %in% tolower(letters[2:12])) {
      return(substring(last, 2L))
    }
  }

  name_raw
}

.lasa_varinfo_expand_name <- function(
    name_raw,
    section_waves,
    condition = NA_character_
) {
  result <- .lasa_varinfo_expand_name_impl(name_raw, section_waves)

  if (anyNA(result$wave)) {
    qualifier_waves <- .lasa_varinfo_qualifier_wave_subset(
      condition,
      section_waves
    )
    if (!is.null(qualifier_waves) && length(qualifier_waves) > 0L) {
      retried <- .lasa_varinfo_expand_name_impl(
        name_raw,
        qualifier_waves
      )
      if (!anyNA(retried$wave)) return(retried)
    }
  }

  result
}

.lasa_varinfo_expand_name_impl <- function(name_raw, section_waves) {
  parts <- strsplit(name_raw, "/", fixed = TRUE)[[1L]]
  n_parts <- length(parts)

  section_waves <- section_waves[
    !is.na(section_waves) & nzchar(section_waves)
  ]

  if (n_parts == 1L) {
    if (length(section_waves) == 1L) {
      return(data.frame(
        wave = section_waves,
        canonical_name = name_raw,
        variable_name = name_raw,
        parse_note = NA_character_,
        stringsAsFactors = FALSE
      ))
    }

    return(data.frame(
      wave = NA_character_,
      canonical_name = name_raw,
      variable_name = name_raw,
      parse_note = "wave-invariant name; section spans multiple waves",
      stringsAsFactors = FALSE
    ))
  }

  collapsed <- .lasa_varinfo_collapse_prefixes(section_waves)
  expected_last_prefix <- if (length(collapsed$prefixes) > 0L) {
    collapsed$prefixes[[length(collapsed$prefixes)]]
  } else {
    NULL
  }
  canonical_guess <- .lasa_varinfo_compact_canonical(
    name_raw,
    expected_prefix = expected_last_prefix
  )

  if (length(collapsed$prefixes) != n_parts) {
    return(data.frame(
      wave = NA_character_,
      canonical_name = canonical_guess,
      variable_name = name_raw,
      parse_note = sprintf(
        paste0(
          "compact name has %d wave-prefix token(s) but the document's ",
          "collapsed wave sequence has %d; not expanded"
        ),
        n_parts,
        length(collapsed$prefixes)
      ),
      stringsAsFactors = FALSE
    ))
  }

  last_prefix <- collapsed$prefixes[[n_parts]]
  last_part <- parts[[n_parts]]

  if (!startsWith(last_part, last_prefix)) {
    return(data.frame(
      wave = NA_character_,
      canonical_name = canonical_guess,
      variable_name = name_raw,
      parse_note = sprintf(
        "expected last wave-prefix token to start with '%s', got '%s'; not expanded",
        last_prefix,
        last_part
      ),
      stringsAsFactors = FALSE
    ))
  }

  suffix <- substring(last_part, nchar(last_prefix) + 1L)
  if (!nzchar(suffix)) {
    return(data.frame(
      wave = NA_character_,
      canonical_name = canonical_guess,
      variable_name = name_raw,
      parse_note = "no variable suffix found after wave-prefix tokens; not expanded",
      stringsAsFactors = FALSE
    ))
  }

  waves_out <- unlist(collapsed$waves, use.names = FALSE)
  prefixes_out <- .lasa_varinfo_wave_prefix(waves_out)

  data.frame(
    wave = waves_out,
    canonical_name = suffix,
    variable_name = paste0(prefixes_out, suffix),
    parse_note = NA_character_,
    stringsAsFactors = FALSE
  )
}

# A name written without slash-compaction in a single-wave section is
# ambiguous: it may be genuinely invariant (e.g. "byear" in z004/MB004) or
# may carry the wave prefix. Resolve that ambiguity only after the complete
# document is parsed. If exactly the same variable_name occurs in more than
# one wave, it is strong evidence that the name is invariant and must not be
# stripped. Otherwise a leading prefix matching that row's wave is treated as
# the LASA wave prefix.
.lasa_varinfo_repair_canonical_names <- function(variables) {
  if (nrow(variables) == 0L) return(variables)

  variables$canonical_name <- tolower(variables$canonical_name)

  non_missing <- !is.na(variables$wave)
  invariant_names <- character(0)

  if (any(non_missing)) {
    waves_by_name <- split(
      variables$wave[non_missing],
      variables$variable_name[non_missing]
    )
    invariant_names <- names(waves_by_name)[
      vapply(
        waves_by_name,
        function(x) {
          x <- unique(stats::na.omit(x))
          if (length(x) <= 1L) return(FALSE)
          length(unique(.lasa_varinfo_wave_prefix(x))) > 1L
        },
        logical(1L)
      )
    ]
  }

  for (i in seq_len(nrow(variables))) {
    vname <- tolower(variables$variable_name[[i]])
    cname <- tolower(variables$canonical_name[[i]])
    wave <- variables$wave[[i]]

    if (vname %in% invariant_names) {
      variables$canonical_name[[i]] <- vname
      next
    }

    if (is.na(wave) || !nzchar(wave)) next

    prefix <- .lasa_varinfo_wave_prefix(wave)
    if (identical(cname, vname) &&
        startsWith(vname, prefix) &&
        nchar(vname) > nchar(prefix)) {
      variables$canonical_name[[i]] <-
        substring(vname, nchar(prefix) + 1L)
    }
  }

  variables
}

# Value-label handling ----------------------------------------------------

# Parse a condition prefix used inside a values cell. The result is a list
# with an explicit wave subset and the text after the colon. "For ...",
# "Only in ...", "Not in ...", "In ...", and "From H onwards" are supported.
.lasa_varinfo_value_condition <- function(text, section_waves) {
  text <- trimws(text)
  section_waves <- section_waves[
    !is.na(section_waves) & nzchar(section_waves)
  ]

  colon <- regexpr(":", text, fixed = TRUE)
  if (colon[[1L]] < 0L) {
    return(list(
      recognized = FALSE,
      complete = FALSE,
      waves = character(0),
      condition = NA_character_,
      remainder = text
    ))
  }

  condition <- trimws(substr(text, 1L, colon[[1L]] - 1L))
  remainder <- trimws(substr(text, colon[[1L]] + 1L, nchar(text)))

  from_match <- regmatches(
    condition,
    regexec(
      "(?i)^from(?:\\s+wave)?\\s+(2B|3B|4B|MB|[B-L])\\s+onwards?$",
      condition,
      perl = TRUE
    )
  )[[1L]]

  if (length(from_match) == 2L) {
    first_wave <- toupper(from_match[[2L]])
    idx <- match(first_wave, section_waves)
    waves <- if (is.na(idx)) character(0) else section_waves[idx:length(section_waves)]

    return(list(
      recognized = TRUE,
      complete = TRUE,
      waves = waves,
      condition = condition,
      remainder = remainder
    ))
  }

  until_match <- regmatches(
    condition,
    regexec(
      "(?i)^(?:until|up to)(?:\\s+wave)?\\s+(2B|3B|4B|MB|[B-L])$",
      condition,
      perl = TRUE
    )
  )[[1L]]

  if (length(until_match) == 2L) {
    last_wave <- toupper(until_match[[2L]])
    idx <- match(last_wave, section_waves)
    waves <- if (is.na(idx)) character(0) else section_waves[seq_len(idx)]

    return(list(
      recognized = TRUE,
      complete = TRUE,
      waves = waves,
      condition = condition,
      remainder = remainder
    ))
  }

  kind <- if (grepl("(?i)^for\\s+", condition, perl = TRUE)) {
    "only"
  } else if (grepl("(?i)^only\\s+in(?:\\s+waves?)?\\s+", condition, perl = TRUE)) {
    "only"
  } else if (grepl("(?i)^not\\s+in(?:\\s+waves?)?\\s+", condition, perl = TRUE)) {
    "not"
  } else if (grepl("(?i)^in(?:\\s+waves?)?\\s+", condition, perl = TRUE)) {
    "only"
  } else {
    NULL
  }

  if (is.null(kind)) {
    return(list(
      recognized = FALSE,
      complete = TRUE,
      waves = character(0),
      condition = NA_character_,
      remainder = text
    ))
  }

  mentioned <- .lasa_varinfo_wave_mentions(condition)
  if (length(mentioned) == 0L) {
    return(list(
      recognized = FALSE,
      complete = TRUE,
      waves = character(0),
      condition = NA_character_,
      remainder = text
    ))
  }

  waves <- if (identical(kind, "not")) {
    section_waves[!section_waves %in% mentioned]
  } else {
    section_waves[section_waves %in% mentioned]
  }

  list(
    recognized = TRUE,
    complete = TRUE,
    waves = waves,
    condition = condition,
    remainder = remainder
  )
}

.lasa_varinfo_value_condition_start <- function(text) {
  wave <- "(?:2B|3B|4B|MB|[B-L])"
  grepl(
    paste0(
      "(?i)^(?:",
      "for\\s+", wave, "\\b|",
      "only\\s+in(?:\\s+waves?)?\\s+", wave, "\\b|",
      "not\\s+in(?:\\s+waves?)?\\s+", wave, "\\b|",
      "in(?:\\s+waves?)?\\s+", wave, "\\b|",
      "from(?:\\s+wave)?\\s+", wave, "\\b|",
      "(?:until|up to)(?:\\s+wave)?\\s+", wave, "\\b",
      ")"
    ),
    trimws(text),
    perl = TRUE
  )
}

.lasa_varinfo_value_fragment_complete <- function(text) {
  matches <- gregexpr(
    "\\(-?[0-9]+(?:\\.[0-9]+)?\\)",
    text,
    perl = TRUE
  )[[1L]]
  if (length(matches) == 1L && matches[[1L]] < 0L) return(FALSE)

  lengths <- attr(matches, "match.length")
  last_end <- matches[[length(matches)]] + lengths[[length(lengths)]] - 1L
  tail <- trimws(substr(text, last_end + 1L, nchar(text)))
  !nzchar(gsub("[,.;[:space:]]", "", tail))
}

# Convert physical values-column lines into wave-scoped text segments.
#
# A condition with text after ":" is line-scoped. This is what LASA046 uses
# for lphya01:
#   For B/.../G: na, wrong skip(-3),
#   From H onwards: not done, wrong skip(-3),
# followed by an unqualified -1 that applies to every wave.
#
# A condition ending at ":" is block-scoped and applies to subsequent lines
# until another block condition appears. This is what lphya22 uses for its
# wave-specific sport code 17.
.lasa_varinfo_value_segments <- function(values_lines, section_waves) {
  lines <- trimws(unlist(values_lines, use.names = FALSE))
  lines <- lines[nzchar(lines)]
  if (length(lines) == 0L) return(list())

  section_waves <- section_waves[
    !is.na(section_waves) & nzchar(section_waves)
  ]

  block_waves <- section_waves
  block_condition <- NA_character_
  pending_condition <- NULL
  segments <- list()

  append_segment <- function(text, waves, condition, inline) {
    segments[[length(segments) + 1L]] <<- list(
      text = trimws(text),
      waves = waves,
      condition = condition,
      inline = inline
    )
  }

  for (line in lines) {
    if (!is.null(pending_condition)) {
      line <- paste(pending_condition, line)
      pending_condition <- NULL
    }

    condition_start <- .lasa_varinfo_value_condition_start(line)

    if (condition_start && !grepl(":", line, fixed = TRUE)) {
      pending_condition <- line
      next
    }

    parsed_condition <- if (condition_start) {
      .lasa_varinfo_value_condition(line, section_waves)
    } else {
      NULL
    }

    if (!is.null(parsed_condition) && isTRUE(parsed_condition$recognized)) {
      if (nzchar(parsed_condition$remainder)) {
        # Inline condition: do not change the surrounding block scope.
        append_segment(
          parsed_condition$remainder,
          parsed_condition$waves,
          parsed_condition$condition,
          inline = TRUE
        )
      } else {
        block_waves <- parsed_condition$waves
        block_condition <- parsed_condition$condition
      }
      next
    }

    # A wrapped inline value can continue on the next physical line. Retain
    # the inline scope only until a complete <label>(code) expression has
    # been assembled.
    if (length(segments) > 0L &&
        isTRUE(segments[[length(segments)]]$inline) &&
        !.lasa_varinfo_value_fragment_complete(
          segments[[length(segments)]]$text
        )) {
      segments[[length(segments)]]$text <- paste(
        segments[[length(segments)]]$text,
        line
      )
      next
    }

    # Consecutive unqualified/block-scoped lines belong to the same values
    # cell. Joining them here preserves wrapped labels such as
    # "respondent ... wheelchair(2), respondent" / "in mech. wheelchair(3)".
    if (length(segments) > 0L &&
        !isTRUE(segments[[length(segments)]]$inline) &&
        identical(segments[[length(segments)]]$waves, block_waves) &&
        identical(segments[[length(segments)]]$condition, block_condition)) {
      segments[[length(segments)]]$text <- paste(
        segments[[length(segments)]]$text,
        line
      )
    } else {
      append_segment(
        line,
        block_waves,
        block_condition,
        inline = FALSE
      )
    }
  }

  if (!is.null(pending_condition)) {
    append_segment(
      pending_condition,
      character(0),
      pending_condition,
      inline = TRUE
    )
  }

  segments
}

# Split a segment into <label>(<code>) entries while preserving an
# unparseable/external-reference trailer instead of discarding already parsed
# entries. The old implementation returned immediately when "see table" was
# present anywhere in the cell and therefore lost valid missing-code labels
# preceding the reference.
.lasa_varinfo_split_value_labels <- function(values_text) {
  values_text <- trimws(values_text)
  if (!nzchar(values_text)) {
    return(data.frame(
      value_raw = character(0),
      value_label = character(0),
      parse_note = character(0),
      stringsAsFactors = FALSE
    ))
  }

  chunks <- strsplit(values_text, "(?<=\\)),\\s*", perl = TRUE)[[1L]]
  chunks <- trimws(chunks)
  chunks <- chunks[nzchar(chunks)]
  chunks <- sub("[,.]+$", "", chunks)

  rows <- lapply(chunks, function(chunk) {
    m <- regmatches(
      chunk,
      regexec(
        "^(.*)\\((-?[0-9]+(?:\\.[0-9]+)?)\\)$",
        chunk,
        perl = TRUE
      )
    )[[1L]]

    if (length(m) == 3L) {
      label <- trimws(m[[2L]])
      code <- trimws(m[[3L]])

      return(data.frame(
        value_raw = code,
        value_label = label,
        parse_note = if (grepl("(?i)^see\\s", label, perl = TRUE)) {
          paste0("cross-reference: ", label)
        } else {
          NA_character_
        },
        stringsAsFactors = FALSE
      ))
    }

    note <- if (grepl("(?i)see\\s+\\*?table", chunk, perl = TRUE)) {
      paste0("external reference not resolved: ", chunk)
    } else {
      paste0("could not parse value/code from: ", chunk)
    }

    data.frame(
      value_raw = NA_character_,
      value_label = NA_character_,
      parse_note = note,
      stringsAsFactors = FALSE
    )
  })

  do.call(rbind, rows)
}

.lasa_varinfo_parse_scoped_value_labels <- function(
    values_lines,
    applicable_waves
) {
  segments <- .lasa_varinfo_value_segments(
    values_lines,
    applicable_waves
  )

  if (length(segments) == 0L) {
    return(data.frame(
      value_raw = character(0),
      value_label = character(0),
      parse_note = character(0),
      source_condition = character(0),
      stringsAsFactors = FALSE
    ))
  }

  rows <- list()
  for (segment in segments) {
    parsed <- .lasa_varinfo_split_value_labels(segment$text)
    if (nrow(parsed) == 0L) next

    if (length(segment$waves) == 0L) {
      segment_waves <- NA_character_
    } else {
      segment_waves <- segment$waves
    }

    for (wave in segment_waves) {
      x <- parsed
      x$wave <- wave
      x$source_condition <- segment$condition
      rows[[length(rows) + 1L]] <- x
    }
  }

  if (length(rows) == 0L) {
    return(data.frame(
      value_raw = character(0),
      value_label = character(0),
      parse_note = character(0),
      wave = character(0),
      source_condition = character(0),
      stringsAsFactors = FALSE
    ))
  }

  do.call(rbind, rows)
}

# Parser ------------------------------------------------------------------

#' Parse one LASA varinfo PDF into structured metadata
#'
#' @param path Path to a local `*_varinfo.pdf` file.
#' @param document_id Character scalar identifying this document.
#'
#' @return A list with `document`, `variables`, and `value_labels`.
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

  name_x <- 70
  label_x <- 200
  values_x <- 320

  section_filecodes <- character(0)
  section_waves <- character(0)
  active_condition <- NA_character_
  qualifier_open <- FALSE

  variable_rows <- list()
  value_rows <- list()
  row_seq <- 0L
  current_row <- NULL

  # Build page lines first, stripping the footer and capturing the date.
  page_lines <- vector("list", length(pages))
  for (page_no in seq_along(pages)) {
    page_tokens <- pages[[as.character(page_no)]]
    if (is.null(page_tokens)) next

    footer <- page_tokens$y > 785
    date_tok <- footer &
      grepl(.lasa_varinfo_date_regex, page_tokens$text)

    if (any(date_tok) && is.na(document_date)) {
      document_date <- page_tokens$text[which(date_tok)[[1L]]]
    }

    page_tokens <- page_tokens[!footer, , drop = FALSE]
    if (nrow(page_tokens) > 0L) {
      page_lines[[page_no]] <- .lasa_varinfo_group_lines(page_tokens)
    }
  }

  per_page_title_end_y <- vapply(
    page_lines,
    .lasa_varinfo_title_block_end_y,
    numeric(1L)
  )

  reference_title_end_y <- suppressWarnings(
    stats::median(per_page_title_end_y[is.finite(per_page_title_end_y)])
  )
  if (!is.finite(reference_title_end_y)) {
    reference_title_end_y <- NA_real_
  }

  first_title_end <- per_page_title_end_y[[1L]]
  if (!is.finite(first_title_end)) first_title_end <- reference_title_end_y

  title_lines <- if (
      length(page_lines) >= 1L &&
      !is.null(page_lines[[1L]]) &&
      is.finite(first_title_end)
  ) {
    page_lines[[1L]][
      as.numeric(names(page_lines[[1L]])) <= first_title_end
    ]
  } else {
    list()
  }

  title_text <- paste(
    vapply(title_lines, .lasa_varinfo_line_text, character(1L)),
    collapse = " "
  )
  doc_identifiers <- .lasa_varinfo_extract_identifiers(title_text)

  doc_filecodes <- unique(stats::na.omit(vapply(
    doc_identifiers,
    function(id) .lasa_varinfo_identifier_wave_filecode(id)$file_code,
    character(1L)
  )))

  flush_row <- function() {
    if (is.null(current_row)) return(invisible(NULL))
    row_seq <<- row_seq + 1L

    label_lines <- unlist(current_row$label_lines, use.names = FALSE)
    label_lines <- label_lines[
      !vapply(
        label_lines,
        .lasa_varinfo_is_repeated_header_fragment,
        logical(1L)
      )
    ]
    label_text <- trimws(paste(label_lines, collapse = " "))
    label_text <- gsub("\\s+", " ", label_text)

    expanded <- .lasa_varinfo_expand_name(
      current_row$name_raw,
      section_waves,
      current_row$condition
    )

    # One normalized database row per concrete filecode. A shared section
    # such as 868/878 must never be stored under a synthetic "868;878" key.
    row_filecodes <- unique(stats::na.omit(section_filecodes))
    if (length(row_filecodes) == 0L) row_filecodes <- NA_character_

    applicable_waves <- unique(stats::na.omit(expanded$wave))
    if (length(applicable_waves) == 0L) {
      applicable_waves <- section_waves[
        !is.na(section_waves) & nzchar(section_waves)
      ]
    }

    scoped_values <- .lasa_varinfo_parse_scoped_value_labels(
      current_row$values_lines,
      applicable_waves
    )

    for (row_filecode in row_filecodes) {
      for (i in seq_len(nrow(expanded))) {
        row_note <- expanded$parse_note[[i]]

        if (nzchar(label_text) &&
            grepl(
              "(?i)\\b(?:LASA|LAS)(?:2B|3B|4B|MB|[BCDEFGHIJKLZ])?[A-Za-z0-9]{2,4}\\b",
              label_text,
              perl = TRUE
            )) {
          leak_note <- "variable label still contains a LASA file identifier after header cleaning"
          row_note <- if (is.na(row_note)) {
            leak_note
          } else {
            paste(row_note, leak_note, sep = "; ")
          }
        }

        variable_rows[[length(variable_rows) + 1L]] <<- data.frame(
          filecode = row_filecode,
          wave = expanded$wave[[i]],
          variable_name = expanded$variable_name[[i]],
          canonical_name = expanded$canonical_name[[i]],
          variable_label = if (nzchar(label_text)) {
            label_text
          } else {
            NA_character_
          },
          source_page = current_row$page,
          source_row = row_seq,
          source_condition = current_row$condition,
          parse_note = row_note,
          stringsAsFactors = FALSE
        )

        if (nrow(scoped_values) > 0L) {
          wave_i <- expanded$wave[[i]]

          if (is.na(wave_i)) {
            vl <- scoped_values
            vl$wave <- NA_character_
          } else {
            vl <- scoped_values[
              is.na(scoped_values$wave) |
                scoped_values$wave == wave_i,
              ,
              drop = FALSE
            ]
          }

          if (nrow(vl) > 0L) {
            vl$filecode <- row_filecode
            vl$variable_name <- expanded$variable_name[[i]]
            vl$source_page <- current_row$page
            vl$source_row <- row_seq

            missing_condition <- is.na(vl$source_condition) |
              !nzchar(vl$source_condition)
            vl$source_condition[missing_condition] <-
              current_row$condition

            vl <- vl[
              c(
                "value_raw", "value_label", "parse_note",
                "filecode", "wave", "variable_name",
                "source_page", "source_row", "source_condition"
              )
            ]

            value_rows[[length(value_rows) + 1L]] <<- vl
          }
        }
      }
    }

    current_row <<- NULL
    invisible(NULL)
  }

  start_section <- function(marker_text) {
    flush_row()

    identifiers <- .lasa_varinfo_extract_any_identifiers(marker_text)
    if (length(identifiers) == 0L) identifiers <- doc_identifiers

    resolved <- lapply(
      identifiers,
      .lasa_varinfo_identifier_wave_filecode
    )
    waves <- vapply(resolved, `[[`, character(1L), "wave")
    file_codes <- vapply(
      resolved,
      `[[`,
      character(1L),
      "file_code"
    )

    section_filecodes <<- unique(stats::na.omit(file_codes))
    waves <- unique(waves[!is.na(waves)])
    if (length(waves) == 0L) waves <- NA_character_

    section_waves <<- waves
    active_condition <<- NA_character_
    qualifier_open <<- FALSE
    invisible(NULL)
  }

  for (page_no in seq_along(pages)) {
    lines <- page_lines[[page_no]]
    if (is.null(lines)) next

    page_title_end <- per_page_title_end_y[[page_no]]
    if (!is.finite(page_title_end)) {
      page_title_end <- reference_title_end_y
    }

    if (is.finite(page_title_end)) {
      lines <- lines[
        as.numeric(names(lines)) > page_title_end
      ]
    }
    if (length(lines) == 0L) next

    repeat {
      header <- .lasa_varinfo_find_header_row(lines)

      if (!is.null(header)) {
        marker_text <- if (header$index > 1L) {
          marker_lines <- lines[seq_len(header$index - 1L)]
          marker_texts <- vapply(
            marker_lines,
            .lasa_varinfo_line_text,
            character(1L)
          )

          line_filecodes <- lapply(marker_texts, function(txt) {
            ids <- .lasa_varinfo_extract_any_identifiers(txt)
            unique(stats::na.omit(vapply(
              ids,
              function(id) {
                .lasa_varinfo_identifier_wave_filecode(id)$file_code
              },
              character(1L)
            )))
          })

          all_filecodes <- unlist(line_filecodes)

          if (length(all_filecodes) == 0L) {
            marker_texts <- character(0)
          } else {
            filecode_counts <- table(all_filecodes)
            mode_filecode <- names(filecode_counts)[[
              which.max(filecode_counts)
            ]]
            keep <- vapply(
              line_filecodes,
              function(fcs) mode_filecode %in% fcs,
              logical(1L)
            )
            marker_texts <- marker_texts[keep]
          }

          if (length(marker_texts) == 0L) {
            paste(doc_identifiers, collapse = " ")
          } else {
            paste(marker_texts, collapse = " ")
          }
        } else {
          paste(doc_identifiers, collapse = " ")
        }

        start_section(marker_text)
        name_x <- header$name_x
        label_x <- header$label_x
        values_x <- header$values_x
        lines <- lines[-seq_len(header$index)]
      } else if (length(section_waves) == 0L) {
        start_section(paste(doc_identifiers, collapse = " "))
      }

      next_header <- .lasa_varinfo_find_header_row(lines)
      body_end <- if (is.null(next_header)) {
        length(lines)
      } else {
        next_header$index - 1L
      }

      if (body_end >= 1L) {
        for (line_df in lines[seq_len(body_end)]) {
          full_line_text <- .lasa_varinfo_line_text(line_df)

          if (.lasa_varinfo_is_repeated_header_fragment(full_line_text)) {
            next
          }

          line_y <- line_df$y[[1L]]
          name_tokens <- line_df[
            line_df$x < label_x,
            ,
            drop = FALSE
          ]
          label_tokens <- line_df[
            line_df$x >= label_x & line_df$x < values_x,
            ,
            drop = FALSE
          ]
          values_tokens <- line_df[
            line_df$x >= values_x,
            ,
            drop = FALSE
          ]

          name_text <- if (nrow(name_tokens) > 0L) {
            .lasa_varinfo_line_text(name_tokens)
          } else {
            ""
          }

          if (nzchar(name_text) &&
              grepl(.lasa_varinfo_name_regex, name_text, perl = TRUE)) {
            flush_row()

            row_condition <- active_condition
            active_condition <- NA_character_
            qualifier_open <- FALSE

            current_row <- list(
              name_raw = name_text,
              page = page_no,
              y = line_y,
              label_lines = if (nrow(label_tokens) > 0L) {
                list(.lasa_varinfo_line_text(label_tokens))
              } else {
                list()
              },
              values_lines = if (nrow(values_tokens) > 0L) {
                list(.lasa_varinfo_line_text(values_tokens))
              } else {
                list()
              },
              condition = row_condition
            )

          } else if (
              nzchar(name_text) &&
              grepl(.lasa_varinfo_qualifier_regex, name_text, perl = TRUE)
          ) {
            active_condition <- name_text
            qualifier_open <- !grepl(":\\s*$", name_text)

          } else if (
              nzchar(name_text) &&
              qualifier_open &&
              grepl("^[A-Za-z0-9,;/ :]+$", name_text, perl = TRUE)
          ) {
            active_condition <- paste(active_condition, name_text)
            qualifier_open <- !grepl(":\\s*$", name_text)

          } else if (is.null(current_row)) {
            next

          } else {
            if (nrow(label_tokens) > 0L) {
              label_piece <- .lasa_varinfo_line_text(label_tokens)
              if (!.lasa_varinfo_is_repeated_header_fragment(label_piece)) {
                current_row$label_lines[[
                  length(current_row$label_lines) + 1L
                ]] <- label_piece
              }
            }

            if (nrow(values_tokens) > 0L) {
              value_piece <- .lasa_varinfo_line_text(values_tokens)
              if (!.lasa_varinfo_is_repeated_header_fragment(value_piece)) {
                current_row$values_lines[[
                  length(current_row$values_lines) + 1L
                ]] <- value_piece
              }
            }
          }
        }
      }

      lines <- if (is.null(next_header)) {
        list()
      } else {
        lines[-seq_len(body_end)]
      }

      if (length(lines) == 0L) break
    }
  }

  flush_row()

  variables <- if (length(variable_rows) > 0L) {
    do.call(rbind, variable_rows)
  } else {
    data.frame(
      filecode = character(0),
      wave = character(0),
      variable_name = character(0),
      canonical_name = character(0),
      variable_label = character(0),
      source_page = integer(0),
      source_row = integer(0),
      source_condition = character(0),
      parse_note = character(0),
      stringsAsFactors = FALSE
    )
  }

  value_labels <- if (length(value_rows) > 0L) {
    do.call(rbind, value_rows)
  } else {
    data.frame(
      filecode = character(0),
      value_raw = character(0),
      value_label = character(0),
      parse_note = character(0),
      wave = character(0),
      variable_name = character(0),
      source_page = integer(0),
      source_row = integer(0),
      source_condition = character(0),
      stringsAsFactors = FALSE
    )
  }

  variables <- .lasa_varinfo_repair_canonical_names(variables)

  # Keep values aligned with canonical-name repairs only through
  # variable_name/wave keys; no value row contains canonical_name itself.
  rownames(variables) <- NULL
  rownames(value_labels) <- NULL

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
