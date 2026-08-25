## `lasa_var_info()` resolves a file code or topic name (via the bundled
## `lasa_topic_database`, see R/lasa_topics.R) to LASA's own linked
## variable-information PDF. Unlike `lasa_topics()`, this still scrapes
## https://lasa-vu.nl/en/topic-table/ live -- but only for the much smaller
## `filecode -> varinfo PDF url` mapping (`.lasa_scrape_varinfo_links()`
## below), never for topic/theme text, which now comes entirely from the
## hand-maintained database.

.lasa_topic_table_url <- "https://lasa-vu.nl/en/topic-table/"
.lasa_varinfo_cache <- new.env(parent = emptyenv())

## A control-picture character that can never appear in real LASA text, used
## to mark line-break/paragraph boundaries inside a wave cell (see
## `.lasa_node_text_with_breaks()`) before they collapse into ordinary
## whitespace -- otherwise two file codes stacked on separate lines in one
## cell (e.g. via `<br>`) could get glued together with no separator at all.
.lasa_break_marker <- "␞"

#' Open LASA variable information
#'
#' Searches the package's bundled LASA topic database (see [lasa_topics()])
#' to resolve a file code or topic name, then scrapes the
#' [LASA topic overview](https://lasa-vu.nl/en/topic-table/) live to find and
#' open the variable-information PDF LASA links for it. The documentation is
#' opened from the LASA website; no PDF files are read from or bundled with
#' the package. The live lookup is cached (in-session and on disk);
#' `refresh = TRUE` rebuilds it from the live site first.
#'
#' `filecode` may be a LASA file code, a LASA data-file name, or a topic name.
#' File-code matching ignores case, spaces, underscores, hyphens, an optional
#' `"LASA"` prefix, and common file suffixes. Topic matching is
#' case-insensitive and accepts incomplete names. Small typographical errors
#' are accepted when `fuzzy_match = TRUE`.
#'
#' @param filecode A single LASA file code, data-file name, or topic name, such
#'   as `"046"`, `"LASA046"`, `"LASA 046"`, `"lasa_046"`, or
#'   `"Physical activity"`.
#' @param open Logical. Should the PDF be opened? The default is `TRUE` in an
#'   interactive R session and `FALSE` otherwise. If `FALSE`, the URL is
#'   returned without being opened. When opened, it is always opened in the
#'   system's default web browser -- the RStudio Viewer does not render
#'   hosted PDFs/HTML reliably, so it is not used here.
#' @param fuzzy_match Logical. If `TRUE`, allow small typographical errors in
#'   topic names.
#' @param max_edit_distance Maximum edit distance allowed for fuzzy topic-name
#'   matching.
#' @param refresh Logical. If `TRUE`, refresh the cached varinfo-link lookup
#'   before searching it.
#'
#' @return Invisibly returns the HTTPS URL of the matched variable-information
#'   PDF.
#'
#' @examples
#' \dontrun{
#' lasa_var_info("046")
#' lasa_var_info("LASA046")
#' lasa_var_info("LASA 046")
#' lasa_var_info("lasa_046")
#' lasa_var_info("Physical activity")
#' lasa_var_info("physical act")
#'
#' # Retrieve the URL without opening the PDF
#' url <- lasa_var_info("046", open = FALSE)
#' }
#'
#' @export
lasa_var_info <- function(
    filecode,
    open = interactive(),
    fuzzy_match = TRUE,
    max_edit_distance = 2L,
    refresh = FALSE
) {
  .lasa_var_info_validate_character(filecode, "filecode")
  .lasa_validate_flag(open, "open")
  .lasa_validate_flag(fuzzy_match, "fuzzy_match")
  .lasa_validate_max_distance(max_edit_distance)
  .lasa_validate_flag(refresh, "refresh")

  varinfo_index <- .lasa_varinfo_index(refresh = refresh)
  varinfo_url <- .lasa_var_info_resolve(
    query = filecode,
    topic_database = .lasa_topic_database(),
    varinfo_index = varinfo_index,
    fuzzy_match = fuzzy_match,
    max_edit_distance = max_edit_distance
  )

  if (open) {
    utils::browseURL(varinfo_url)
  }

  invisible(varinfo_url)
}

.lasa_var_info_resolve <- function(
    query,
    topic_database,
    varinfo_index,
    fuzzy_match = TRUE,
    max_edit_distance = 2L
) {
  normalized_query_code <- .lasa_var_info_normalize_filecode(query)
  normalized_filecodes <- .lasa_normalize_filecode(topic_database$filecode)
  code_rows <- which(
    !is.na(normalized_filecodes) & normalized_filecodes == normalized_query_code
  )

  if (length(code_rows) > 0L) {
    matched_rows <- topic_database[code_rows, , drop = FALSE]
    matched_by <- paste0("LASA file code ", shQuote(query))
    preferred_code <- unique(normalized_filecodes[code_rows])
  } else {
    topic_match <- .lasa_var_info_match_topic(
      query = query,
      topics = topic_database$topic,
      fuzzy_match = fuzzy_match,
      max_edit_distance = max_edit_distance
    )
    matched_rows <- topic_database[topic_match$rows, , drop = FALSE]
    matched_by <- paste0("LASA topic ", shQuote(topic_match$label))
    preferred_code <- character()
  }

  candidate_codes <- unique(.lasa_normalize_filecode(
    stats::na.omit(matched_rows$filecode)
  ))
  urls <- .lasa_var_info_urls(varinfo_index$varinfo_url[
    .lasa_normalize_filecode(varinfo_index$filecode) %in% candidate_codes
  ])

  if (length(urls) == 0L) {
    topics <- unique(stats::na.omit(matched_rows$topic))
    filecodes <- unique(stats::na.omit(matched_rows$filecode))
    context <- c(
      if (length(topics) > 0L) {
        paste0("topic(s): ", paste(topics, collapse = "; "))
      },
      if (length(filecodes) > 0L) {
        paste0("file code(s): ", paste(filecodes, collapse = ", "))
      }
    )

    stop(
      sprintf(
        paste0(
          "No variable-information PDF is linked on the LASA website for %s%s."
        ),
        matched_by,
        if (length(context) == 0L) "" else paste0(" (", paste(context, collapse = "; "), ")")
      ),
      call. = FALSE
    )
  }

  if (length(preferred_code) == 1L) {
    expected_name <- paste0("lasa", preferred_code, "_varinfo.pdf")
    canonical_url <- urls[
      tolower(.lasa_var_info_url_basename(urls)) == expected_name
    ]
    if (length(canonical_url) == 1L) {
      urls <- canonical_url
    }
  }

  if (length(urls) > 1L) {
    choices <- unique(data.frame(
      topic = matched_rows$topic,
      filecode = matched_rows$filecode,
      stringsAsFactors = FALSE
    ))
    choice_text <- paste(
      sprintf(
        "%s [%s]",
        choices$topic,
        ifelse(is.na(choices$filecode), "no file code", choices$filecode)
      ),
      collapse = "; "
    )

    stop(
      sprintf(
        paste0(
          "Multiple variable-information PDFs match %s: %s. ",
          "Use a more specific topic name or file code."
        ),
        shQuote(query),
        choice_text
      ),
      call. = FALSE
    )
  }

  if (!grepl("^https://", urls[[1L]], ignore.case = TRUE)) {
    stop(
      "The matched LASA variable-information link is not a valid HTTPS URL.",
      call. = FALSE
    )
  }

  urls[[1L]]
}

.lasa_var_info_match_topic <- function(
    query,
    topics,
    fuzzy_match,
    max_edit_distance
) {
  normalized_query <- .lasa_normalize_text(query)
  if (is.na(normalized_query) || !nzchar(normalized_query)) {
    stop(
      "`filecode` must contain at least one letter or number.",
      call. = FALSE
    )
  }

  topic_parts <- lapply(topics, function(topic) {
    if (is.na(topic) || !nzchar(topic)) {
      return(character())
    }
    trimws(strsplit(topic, ";", fixed = TRUE)[[1L]])
  })
  candidate_labels <- unlist(topic_parts, use.names = FALSE)
  candidate_rows <- rep.int(seq_along(topic_parts), lengths(topic_parts))
  keep <- !is.na(candidate_labels) & nzchar(candidate_labels)
  candidate_labels <- candidate_labels[keep]
  candidate_rows <- candidate_rows[keep]

  normalized_candidates <- .lasa_normalize_text(candidate_labels)
  exact <- normalized_candidates == normalized_query
  prefix <- startsWith(normalized_candidates, normalized_query)
  positions <- vapply(
    normalized_candidates,
    function(candidate) {
      as.integer(regexpr(normalized_query, candidate, fixed = TRUE)[[1L]])
    },
    integer(1L)
  )
  contains <- positions > 0L
  distances <- as.numeric(utils::adist(
    normalized_query,
    normalized_candidates,
    partial = TRUE
  ))
  fuzzy <- fuzzy_match & distances <= max_edit_distance
  matched <- exact | prefix | contains | fuzzy

  if (!any(matched)) {
    stop(
      sprintf(
        paste0(
          "No LASA file code or topic matched %s. ",
          "Use `lasa_topics()` to inspect the available topics and file codes."
        ),
        shQuote(query)
      ),
      call. = FALSE
    )
  }

  length_difference <- abs(
    nchar(normalized_candidates) - nchar(normalized_query)
  )
  scores <- ifelse(
    exact,
    0,
    ifelse(
      prefix,
      10 + length_difference / 1000,
      ifelse(
        contains,
        20 + positions / 100 + length_difference / 1000,
        30 + distances + length_difference / 1000
      )
    )
  )
  scores[!matched] <- Inf
  best_score <- min(scores)
  best_labels <- unique(candidate_labels[scores == best_score])

  if (length(best_labels) > 1L) {
    stop(
      sprintf(
        paste0(
          "The topic name %s is ambiguous. Matching LASA topics: %s. ",
          "Use a more specific topic name or a file code."
        ),
        shQuote(query),
        paste(best_labels, collapse = "; ")
      ),
      call. = FALSE
    )
  }

  list(
    label = best_labels[[1L]],
    rows = unique(candidate_rows[
      .lasa_normalize_text(candidate_labels) ==
        .lasa_normalize_text(best_labels[[1L]])
    ])
  )
}

.lasa_var_info_urls <- function(x) {
  x <- x[!is.na(x) & nzchar(trimws(x))]
  if (length(x) == 0L) {
    return(character())
  }

  urls <- unlist(strsplit(x, ";", fixed = TRUE), use.names = FALSE)
  unique(trimws(urls[nzchar(trimws(urls))]))
}

## Superset of the generic `.lasa_normalize_filecode()` (R/lasa_topic_shared.R):
## `filecode` here may be a whole data-file name (e.g. "LASA046.sav",
## "LASA046_varinfo.pdf"), so common suffixes are stripped first.
.lasa_var_info_normalize_filecode <- function(x) {
  output <- tolower(trimws(x))
  output <- sub("[.]sav$", "", output)
  output <- sub("_?varinfo[.]pdf$", "", output)
  output <- sub("[.]pdf$", "", output)
  .lasa_normalize_filecode(output)
}

.lasa_var_info_url_basename <- function(x) {
  x <- sub("[?#].*$", "", x)
  basename(x)
}

.lasa_var_info_validate_character <- function(x, argument) {
  if (!is.character(x) || length(x) != 1L || is.na(x) || !nzchar(trimws(x))) {
    stop(
      sprintf("`%s` must be a single, non-empty character string.", argument),
      call. = FALSE
    )
  }
}

## ============================================================
## Live scrape: filecode -> varinfo PDF url(s). Topic/theme text is never
## parsed here (see R/lasa_topics.R for that, now hand-maintained) -- only
## which file codes appear in which wave cell, and which varinfo.pdf link(s)
## (if any) that cell carries.
## ============================================================

## Pure HTML scraping and parsing - no caching. Kept separate from
## `.lasa_varinfo_index()` so tests can inject a synthetic `document` and
## exercise the real parsing path deterministically.
.lasa_scrape_varinfo_links <- function(document = NULL) {
  if (is.null(document)) {
    document <- tryCatch(
      xml2::read_html(.lasa_topic_table_url),
      error = function(error) {
        stop(
          paste0(
            "The LASA topic table could not be retrieved. Check the internet ",
            "connection and whether ", .lasa_topic_table_url, " is available. ",
            "Original error: ", conditionMessage(error)
          ),
          call. = FALSE
        )
      }
    )
  }

  topic_table <- xml2::xml_find_first(
    document,
    paste0(
      "//table[.//tr[1]/*[1][contains(",
      "translate(normalize-space(.), 'abcdefghijklmnopqrstuvwxyz', ",
      "'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'LASA-WAVE')]]"
    )
  )

  if (inherits(topic_table, "xml_missing")) {
    stop(
      "The LASA topic table was retrieved, but its HTML table could not be found.",
      call. = FALSE
    )
  }

  rows <- xml2::xml_find_all(topic_table, ".//tr")
  if (length(rows) < 2L) {
    stop("The LASA topic table did not contain any topic rows.", call. = FALSE)
  }

  header_cells <- xml2::xml_find_all(rows[[1L]], "./th|./td")
  header_text <- .lasa_clean_html_text(xml2::xml_text(header_cells))
  waves <- header_text[-1L]

  if (length(waves) == 0L || any(!nzchar(waves))) {
    stop("The LASA wave headings could not be read from the topic table.", call. = FALSE)
  }

  code_urls <- list()

  for (row_number in seq.int(2L, length(rows))) {
    cells <- xml2::xml_find_all(rows[[row_number]], "./th|./td")
    if (length(cells) < length(waves) + 1L) {
      next
    }

    cells <- cells[seq_len(length(waves) + 1L)]
    cell_text <- .lasa_clean_html_text(
      vapply(cells, .lasa_node_text_with_breaks, character(1L))
    )
    first_cell <- cell_text[[1L]]

    ## Skip THEME rows, subtheme-header rows (every wave cell repeats the
    ## subtheme name), and blank/separator rows -- none carry file codes or
    ## varinfo links of their own.
    if (grepl("^THEME[[:space:]]+", first_cell, ignore.case = TRUE)) {
      next
    }
    if (identical(cell_text[-1L], waves)) {
      next
    }
    if (!nzchar(first_cell) || identical(first_cell, "#")) {
      next
    }

    for (wave_index in seq_along(waves)) {
      wave_cell <- cells[[wave_index + 1L]]
      wave_text <- cell_text[[wave_index + 1L]]
      wave_codes <- .lasa_extract_filecodes(wave_text)

      pdf_links <- xml2::xml_find_all(
        wave_cell,
        paste0(
          ".//a[contains(translate(@href, 'PDF', 'pdf'), ",
          "'_varinfo.pdf')]"
        )
      )
      if (length(pdf_links) == 0L) {
        next
      }

      for (pdf_link in pdf_links) {
        pdf_url <- xml2::url_absolute(
          xml2::xml_attr(pdf_link, "href"),
          .lasa_topic_table_url
        )
        linked_codes <- .lasa_extract_filecodes(xml2::xml_text(pdf_link))
        ## A varinfo link's own text usually names the exact file code(s) it
        ## covers (e.g. "LASA880_881_882_varinfo.pdf"); fall back to every
        ## code found in the wave cell when the link text names none.
        codes_for_link <- if (length(linked_codes) > 0L) linked_codes else wave_codes

        for (code in codes_for_link) {
          code_key <- .lasa_normalize_filecode(code)
          code_urls[[code_key]] <- unique(c(code_urls[[code_key]], pdf_url))
        }
      }
    }
  }

  if (length(code_urls) == 0L) {
    stop("No varinfo links could be parsed from the LASA topic table.", call. = FALSE)
  }

  data.frame(
    filecode = names(code_urls),
    varinfo_url = vapply(code_urls, paste, character(1L), collapse = "; "),
    stringsAsFactors = FALSE
  )
}

## Session-memory cache is checked first (fastest); a disk cache under
## `tools::R_user_dir("CleanLASA", "cache")` means the lookup also survives
## across R sessions instead of being rebuilt from scratch every time;
## `refresh = TRUE` bypasses both and rebuilds from the live site, updating
## both caches.
.lasa_varinfo_index <- function(refresh = FALSE, document = NULL) {
  if (!is.null(document)) {
    return(.lasa_scrape_varinfo_links(document))
  }

  if (!refresh && exists("varinfo", envir = .lasa_varinfo_cache, inherits = FALSE)) {
    return(get("varinfo", envir = .lasa_varinfo_cache, inherits = FALSE))
  }

  if (!refresh) {
    disk_cached <- .lasa_read_varinfo_disk_cache()
    if (!is.null(disk_cached)) {
      assign("varinfo", disk_cached, envir = .lasa_varinfo_cache)
      return(disk_cached)
    }
  }

  varinfo_index <- .lasa_scrape_varinfo_links()
  assign("varinfo", varinfo_index, envir = .lasa_varinfo_cache)
  .lasa_write_varinfo_disk_cache(varinfo_index)
  varinfo_index
}

## `tools::R_user_dir()` is the CRAN-recommended, cross-platform location
## for a package's own cache files (not a path the user has to manage).
## Requires R >= 4.0; see DESCRIPTION.
.lasa_varinfo_cache_file <- function() {
  cache_dir <- tools::R_user_dir("CleanLASA", which = "cache")
  file.path(cache_dir, "lasa_varinfo_index.rds")
}

.lasa_read_varinfo_disk_cache <- function() {
  cache_file <- .lasa_varinfo_cache_file()
  if (!file.exists(cache_file)) {
    return(NULL)
  }
  cached <- tryCatch(readRDS(cache_file), error = function(error) NULL)
  if (!is.data.frame(cached)) {
    return(NULL)
  }
  message(
    "Using the LASA varinfo links cached on ", format(file.mtime(cache_file), "%Y-%m-%d"),
    ". Use `refresh = TRUE` to check the live site for updates."
  )
  cached
}

.lasa_write_varinfo_disk_cache <- function(varinfo_index) {
  cache_file <- .lasa_varinfo_cache_file()
  tryCatch(
    {
      dir.create(dirname(cache_file), recursive = TRUE, showWarnings = FALSE)
      saveRDS(varinfo_index, cache_file)
    },
    error = function(error) {
      ## A read-only or unavailable cache directory should never break the
      ## function itself - it just means every session re-scrapes.
      invisible(NULL)
    }
  )
  invisible(NULL)
}

## LASA file codes are usually three digits ("046"), but letter-prefixed
## codes vary in how many digits follow the letters: "z010" (3 digits),
## "ZFF1" (1 digit), "zoa1" (1 digit), "mb010" (3 digits), "zh01"
## (2 digits). A single regex can't tell "ZFF" + 1 digit from "ZFF" + 3
## digits without looking ahead - both are locally valid - so when the
## source HTML has no whitespace between adjacent codes (a real quirk of
## the LASA site, e.g. "z010601701" for z010/601/701 run together), a
## greedy match silently swallows the next code's digits too. This scans
## left to right and, at each letter-prefixed code, tries digit-lengths
## 1 to 3 in order, accepting the first one where the *rest* of the text
## also parses cleanly as a sequence of valid codes - falling back to the
## longest (greedy) digit run if nothing parses perfectly, so it never
## errors out on text it doesn't fully understand.
.lasa_extract_filecodes <- function(x) {
  if (length(x) == 0L || is.na(x) || !nzchar(x)) {
    return(character())
  }

  chars <- strsplit(x, "", fixed = TRUE)[[1L]]
  n <- length(chars)
  is_alpha <- function(i) i >= 1L && i <= n && grepl("[[:alpha:]]", chars[i])
  is_digit <- function(i) i >= 1L && i <= n && grepl("[0-9]", chars[i])

  next_token <- function(pos, require_clean) {
    if (is_alpha(pos)) {
      alpha_end <- pos
      while (alpha_end < n && is_alpha(alpha_end + 1L) &&
             (alpha_end - pos + 1L) < 6L) {
        alpha_end <- alpha_end + 1L
      }
      digit_start <- alpha_end + 1L
      max_len <- 0L
      while (is_digit(digit_start + max_len)) max_len <- max_len + 1L
      max_len <- min(max_len, 3L)
      if (max_len == 0L) {
        return(NULL)
      }

      try_lengths <- if (require_clean) seq_len(max_len) else max_len
      for (digit_length in try_lengths) {
        after_digits <- digit_start + digit_length
        end_pos <- after_digits - 1L
        has_trailing_alpha <- is_alpha(after_digits) && !is_alpha(after_digits + 1L)
        if (has_trailing_alpha) {
          end_pos <- after_digits
        }
        if (!require_clean || .lasa_filecodes_parse_cleanly(
          end_pos + 1L, is_alpha, is_digit, n
        )) {
          return(list(
            token = paste(chars[pos:end_pos], collapse = ""),
            end = end_pos
          ))
        }
      }
      return(next_token(pos, require_clean = FALSE))
    }

    if (is_digit(pos) && is_digit(pos + 1L) && is_digit(pos + 2L)) {
      end_pos <- pos + 2L
      has_trailing_alpha <- is_alpha(end_pos + 1L) && !is_alpha(end_pos + 2L)
      if (has_trailing_alpha) {
        end_pos <- end_pos + 1L
      }
      return(list(
        token = paste(chars[pos:end_pos], collapse = ""),
        end = end_pos
      ))
    }

    NULL
  }

  tokens <- character()
  pos <- 1L
  while (pos <= n) {
    if (!is_alpha(pos) && !is_digit(pos)) {
      pos <- pos + 1L
      next
    }
    result <- next_token(pos, require_clean = TRUE)
    if (is.null(result)) {
      pos <- pos + 1L
      next
    }
    tokens <- c(tokens, result$token)
    pos <- result$end + 1L
  }

  unique(tokens)
}

## Can the text starting at `pos` be fully tokenized (every remaining
## letter/digit consumed by a valid code, separators skipped)? Used as
## look-ahead by `.lasa_extract_filecodes()`'s inner `next_token()`.
.lasa_filecodes_parse_cleanly <- function(pos, is_alpha, is_digit, n) {
  while (pos <= n && !is_alpha(pos) && !is_digit(pos)) {
    pos <- pos + 1L
  }
  if (pos > n) {
    return(TRUE)
  }

  if (is_alpha(pos)) {
    alpha_end <- pos
    while (alpha_end < n && is_alpha(alpha_end + 1L) &&
           (alpha_end - pos + 1L) < 6L) {
      alpha_end <- alpha_end + 1L
    }
    digit_start <- alpha_end + 1L
    max_len <- 0L
    while (is_digit(digit_start + max_len)) max_len <- max_len + 1L
    max_len <- min(max_len, 3L)
    if (max_len == 0L) {
      return(FALSE)
    }
    for (digit_length in seq_len(max_len)) {
      after_digits <- digit_start + digit_length
      end_pos <- after_digits - 1L
      has_trailing_alpha <- is_alpha(after_digits) && !is_alpha(after_digits + 1L)
      if (has_trailing_alpha) {
        end_pos <- after_digits
      }
      if (.lasa_filecodes_parse_cleanly(end_pos + 1L, is_alpha, is_digit, n)) {
        return(TRUE)
      }
    }
    return(FALSE)
  }

  if (is_digit(pos) && is_digit(pos + 1L) && is_digit(pos + 2L)) {
    end_pos <- pos + 2L
    has_trailing_alpha <- is_alpha(end_pos + 1L) && !is_alpha(end_pos + 2L)
    if (has_trailing_alpha) {
      end_pos <- end_pos + 1L
    }
    return(.lasa_filecodes_parse_cleanly(end_pos + 1L, is_alpha, is_digit, n))
  }

  FALSE
}

.lasa_clean_html_text <- function(x) {
  ## Collapse ordinary whitespace runs, but keep the break marker as its
  ## own single-space-padded token rather than swallowing it.
  x <- gsub("[[:space:]]+", " ", x)
  x <- gsub(
    paste0("[[:space:]]*", .lasa_break_marker, "[[:space:]]*"),
    paste0(" ", .lasa_break_marker, " "),
    x
  )
  trimws(x)
}

## `xml_text()` alone loses `<br>`/paragraph boundaries entirely - an empty
## `<br>` tag contributes no characters, so "046<br>146" and "046146" extract
## to the same text, which could glue two stacked file codes together with
## no separator at all. This inserts `.lasa_break_marker` at those
## boundaries first, by editing the node's serialized HTML and re-parsing
## it, so the boundary survives into the extracted text as a marker
## character `.lasa_extract_filecodes()` treats like any other separator.
.lasa_node_text_with_breaks <- function(node) {
  html_string <- tryCatch(as.character(node), error = function(error) NA_character_)
  if (is.na(html_string)) {
    return(xml2::xml_text(node))
  }

  padded_marker <- paste0(" ", .lasa_break_marker, " ")
  html_string <- gsub("<br\\s*/?>", padded_marker, html_string, ignore.case = TRUE, perl = TRUE)
  html_string <- gsub(
    "</(p|div|li)>", paste0(padded_marker, "</\\1>"),
    html_string, ignore.case = TRUE, perl = TRUE
  )

  reparsed <- tryCatch(
    xml2::read_html(paste0("<html><body>", html_string, "</body></html>")),
    error = function(error) NULL
  )
  if (is.null(reparsed)) {
    return(xml2::xml_text(node))
  }
  xml2::xml_text(reparsed)
}
