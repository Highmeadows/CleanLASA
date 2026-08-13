.lasa_topic_table_url <- "https://lasa-vu.nl/en/topic-table/"
.lasa_topic_cache <- new.env(parent = emptyenv())

## A control-picture character that can never appear in real LASA text,
## used to mark line-break/paragraph boundaries inside a table cell before
## they get collapsed into ordinary whitespace (see
## `.lasa_node_text_with_breaks()`), so they can still be told apart from a
## simple run of spaces once the text is flattened.
.lasa_break_marker <- "\u241E"

#' Search the LASA topic table
#'
#' Retrieves the topic overview from the LASA website and returns topics,
#' file codes, and available waves. The table is built from the live site
#' the first time it is needed, then cached - both for the rest of the
#' current R session and on disk, so it does not have to be rebuilt every
#' session. Use `refresh = TRUE` to check the live site for anything new
#' (a new wave, a corrected file code, a newly added topic) instead of
#' using the cache. To get the linked variable-information PDF for a
#' topic or file code, use [lasa_var_info()].
#'
#' Topic, theme, and subtheme matching is case-insensitive. Incomplete names
#' and small typographical errors are accepted when `fuzzy_match = TRUE`.
#' Supplying `theme` searches both the main LASA themes and their subthemes.
#'
#' Some LASA topics are documented with several related file codes on one
#' row of the topic table, such as a main file, a telephone-interview
#' version, or a longitudinally cleaned version. When the LASA site's own
#' label for the row spells these out (for example "Self-report of chronic
#' diseases - tel. proxy - tel. respondent"), each file code is returned
#' with only the part of the label that describes it (e.g. `"Self-report of
#' chronic diseases - tel. proxy"` for the proxy-interview file code) rather
#' than the full combined label repeated for every code. Splitting prefers
#' the row's own column layout and falls back to the LASA file-code
#' numbering convention (0/1 = main face-to-face file, 2/3 = processed or
#' derived file, 4/5 = longitudinally cleaned or revised file, 6 = telephone
#' interview with a proxy, 7 = telephone interview with the respondent);
#' when a single file code covers several qualifiers on its own (nothing to
#' disambiguate), the full descriptive list is dropped in favor of the
#' plain base topic name.
#'
#' A small number of rows need information that is not present in the
#' compact topic-table text at all - it lives in a file code's own
#' variable-information PDF, its topic page's prose, or specific
#' domain knowledge - and no scraper can derive that from the table alone.
#' Those rows carry a curated, documented correction (see
#' `data-raw/lasa_topic_overrides.R` in the package source for the full
#' list and the reasoning behind each one). This curation is applied every
#' time the table is built, independently of `refresh`.
#'
#' @param topic A topic search term. Use `"all"` (the default) to return every
#'   topic, optionally within the selected `theme` or subtheme.
#' @param theme An optional theme or subtheme search term, such as
#'   `"cognitive"` or `"memory"`.
#' @param fuzzy_match Logical. If `TRUE`, allow fuzzy matching.
#' @param max_edit_distance Maximum edit distance used for fuzzy matching.
#' @param refresh Logical. If `TRUE`, ignore the cached topic table (both the
#'   in-session and on-disk cache) and rebuild it from the LASA website.
#'
#' @return A data frame with one row per topic and file-code combination. It
#'   contains `theme`, `subtheme`, `topic`, `filecode`, `waves`, and
#'   `has_varinfo`, which indicates whether a variable-information PDF is
#'   linked for that row; use [lasa_var_info()] to get or open it.
#'
#' @examples
#' \dontrun{
#' lasa_topics()
#' lasa_topics(topic = "Physical")
#' lasa_topics(topic = "physical act")
#' lasa_topics(theme = "cognitive")
#' lasa_topics(theme = "memory")
#' lasa_topics(refresh = TRUE)
#' }
#'
#' @export
lasa_topics <- function(
    topic = "all",
    theme = NULL,
    fuzzy_match = TRUE,
    max_edit_distance = 2L,
    refresh = FALSE
) {
  .lasa_validate_scalar_character(topic, "topic")
  if (!is.null(theme)) {
    .lasa_validate_scalar_character(theme, "theme")
  }
  .lasa_validate_flag(fuzzy_match, "fuzzy_match")
  .lasa_validate_max_distance(max_edit_distance)
  .lasa_validate_flag(refresh, "refresh")

  topic_index <- .lasa_topic_index(refresh = refresh)

  if (!is.null(theme)) {
    theme_values <- unique(c(
      topic_index$theme,
      stats::na.omit(topic_index$subtheme)
    ))
    matched_theme <- .lasa_best_match(
      query = theme,
      candidates = theme_values,
      fuzzy_match = fuzzy_match,
      max_edit_distance = max_edit_distance,
      label = "LASA theme or subtheme"
    )
    normalized_theme <- .lasa_normalize_text(matched_theme)

    normalized_main_themes <- .lasa_normalize_text(topic_index$theme)
    normalized_subthemes <- .lasa_normalize_text(topic_index$subtheme)
    keep_theme <-
      (!is.na(normalized_main_themes) &
         normalized_main_themes == normalized_theme) |
      (!is.na(normalized_subthemes) &
         normalized_subthemes == normalized_theme)
    topic_index <- topic_index[keep_theme, , drop = FALSE]
  }

  if (!identical(.lasa_normalize_text(topic), "all")) {
    topic_scores <- .lasa_match_scores(
      query = topic,
      candidates = topic_index$topic,
      fuzzy_match = fuzzy_match,
      max_edit_distance = max_edit_distance
    )
    keep_topic <- topic_scores$matched

    if (!any(keep_topic)) {
      stop(
        sprintf("No LASA topics matched %s.", shQuote(topic)),
        call. = FALSE
      )
    }

    topic_index <- topic_index[keep_topic, , drop = FALSE]
    topic_index$.match_score <- topic_scores$score[keep_topic]

    # Search the complete table for matching theme names, not only the topic
    # rows retained above.
    complete_index <- .lasa_topic_index(refresh = FALSE)
    all_labels <- unique(data.frame(
      type = c(
        rep("theme", length(unique(complete_index$theme))),
        rep(
          "subtheme",
          length(unique(stats::na.omit(complete_index$subtheme)))
        )
      ),
      label = c(
        unique(complete_index$theme),
        unique(stats::na.omit(complete_index$subtheme))
      ),
      stringsAsFactors = FALSE
    ))
    label_scores <- .lasa_match_scores(
      query = topic,
      candidates = all_labels$label,
      fuzzy_match = fuzzy_match,
      max_edit_distance = max_edit_distance
    )
    matching_labels <- all_labels[label_scores$matched, , drop = FALSE]

    if (nrow(matching_labels) > 0L) {
      message(
        "Matching LASA themes/subthemes: ",
        paste(
          sprintf("%s (%s)", matching_labels$label, matching_labels$type),
          collapse = "; "
        ),
        ". Use `lasa_topics(theme = ...)` to search within one of them."
      )
    }
  } else {
    topic_index$.match_score <- 0
  }

  order_index <- order(
    topic_index$.match_score,
    topic_index$theme,
    topic_index$subtheme,
    topic_index$topic,
    topic_index$filecode,
    na.last = TRUE
  )
  topic_index <- topic_index[order_index, , drop = FALSE]
  topic_index$.match_score <- NULL
  topic_index$varinfo_url <- NULL
  topic_index$topic_url <- NULL
  topic_index$filecode_type <- NULL
  rownames(topic_index) <- NULL
  topic_index
}

## ============================================================
## Curated overrides: the live scrape (`.lasa_scrape_topic_table()`) does
## the general-purpose parsing, but a specific, documented set of rows
## need corrections sourced from a varinfo PDF, a topic page, or Bram's
## own knowledge of the data - information that plainly is not present in
## the compact topic-table text for the algorithm to derive on its own.
## See data-raw/lasa_topic_overrides.R for how these are curated and
## R/sysdata.rda for where they are stored (`lasa_topic_overrides`,
## `lasa_topic_code_aliases`, `lasa_topic_wave_splits`).
## ============================================================

## A single filecode reused for a *different* topic at different waves
## (not merely a different theme/subtheme - see data-raw for the one
## current example, filecode 161). Replaces the matched row with two:
## one for `waves_for_first`, one for everything else.
.lasa_apply_wave_splits <- function(topic_index) {
  wave_order <- c(
    "B", "C", "D", "E", "2B", "IM", "F", "G", "H", "3B", "MB",
    "I", "J", "K", "4B", "L"
  )
  extra_rows <- list()

  for (i in seq_len(nrow(lasa_topic_wave_splits))) {
    spec <- lasa_topic_wave_splits[i, ]
    match_idx <- which(
      .lasa_normalize_filecode(topic_index$filecode) ==
        .lasa_normalize_filecode(spec$filecode) &
        !is.na(topic_index$theme) & topic_index$theme == spec$theme &
        !is.na(topic_index$subtheme) & topic_index$subtheme == spec$subtheme
    )
    if (length(match_idx) != 1L) {
      next
    }

    row <- topic_index[match_idx, , drop = FALSE]
    row_waves <- trimws(strsplit(row$waves, ",", fixed = TRUE)[[1L]])
    ## Intersect with the row's actual (freshly scraped) waves, rather than
    ## trusting the override's static list outright - if LASA adds or drops
    ## a wave for this filecode, this adapts instead of assigning waves
    ## that don't actually exist in the row (or dropping ones that do).
    first_waves <- intersect(
      trimws(strsplit(spec$waves_for_first, ",", fixed = TRUE)[[1L]]),
      row_waves
    )
    rest_waves <- setdiff(row_waves, first_waves)
    if (length(rest_waves) == 0L || length(first_waves) == 0L) {
      next
    }
    rest_waves <- rest_waves[order(match(rest_waves, wave_order))]

    topic_index$topic[match_idx] <- spec$topic_for_rest
    topic_index$waves[match_idx] <- paste(rest_waves, collapse = ", ")

    new_row <- row
    new_row$topic <- spec$topic_for_first
    new_row$waves <- paste(first_waves, collapse = ", ")
    extra_rows[[length(extra_rows) + 1L]] <- new_row
  }

  if (length(extra_rows) > 0L) {
    topic_index <- rbind(topic_index, do.call(rbind, extra_rows))
  }
  topic_index
}

## A malformed filecode (e.g. a stray scraped character) that should not
## exist as its own row; its waves are merged into an already-correct row
## instead.
.lasa_apply_code_aliases <- function(topic_index) {
  for (i in seq_len(nrow(lasa_topic_code_aliases))) {
    spec <- lasa_topic_code_aliases[i, ]
    alias_idx <- which(
      .lasa_normalize_filecode(topic_index$filecode) ==
        .lasa_normalize_filecode(spec$alias_filecode) &
        !is.na(topic_index$theme) & topic_index$theme == spec$alias_theme &
        !is.na(topic_index$subtheme) & topic_index$subtheme == spec$alias_subtheme
    )
    canonical_idx <- which(
      .lasa_normalize_filecode(topic_index$filecode) ==
        .lasa_normalize_filecode(spec$canonical_filecode) &
        !is.na(topic_index$theme) & topic_index$theme == spec$alias_theme &
        !is.na(topic_index$subtheme) & topic_index$subtheme == spec$alias_subtheme &
        (is.na(spec$canonical_old_topic_contains) |
           (!is.na(topic_index$topic) &
              grepl(spec$canonical_old_topic_contains, topic_index$topic, fixed = TRUE)))
    )
    if (length(alias_idx) != 1L || length(canonical_idx) != 1L) {
      next
    }

    alias_row <- topic_index[alias_idx, ]
    canonical_waves <- trimws(strsplit(topic_index$waves[canonical_idx], ",", fixed = TRUE)[[1L]])
    alias_waves <- trimws(strsplit(alias_row$waves, ",", fixed = TRUE)[[1L]])
    wave_order <- c(
      "B", "C", "D", "E", "2B", "IM", "F", "G", "H", "3B", "MB",
      "I", "J", "K", "4B", "L"
    )
    merged_waves <- union(canonical_waves, alias_waves)
    merged_waves <- merged_waves[order(match(merged_waves, wave_order))]
    topic_index$waves[canonical_idx] <- paste(merged_waves, collapse = ", ")

    if (!is.na(alias_row$varinfo_url)) {
      existing <- topic_index$varinfo_url[canonical_idx]
      topic_index$varinfo_url[canonical_idx] <- if (is.na(existing)) {
        alias_row$varinfo_url
      } else {
        paste(unique(c(
          strsplit(existing, "; ", fixed = TRUE)[[1L]],
          strsplit(alias_row$varinfo_url, "; ", fixed = TRUE)[[1L]]
        )), collapse = "; ")
      }
      topic_index$has_varinfo[canonical_idx] <- TRUE
    }

    topic_index <- topic_index[-alias_idx, , drop = FALSE]
  }
  topic_index
}

## Straightforward label (and occasionally filecode_type) corrections -
## see data-raw/lasa_topic_overrides.R for the full list and, for each,
## a one-line note on where the correction came from.
.lasa_apply_topic_overrides <- function(topic_index) {
  for (i in seq_len(nrow(lasa_topic_overrides))) {
    spec <- lasa_topic_overrides[i, ]
    match_idx <- which(
      .lasa_normalize_filecode(topic_index$filecode) ==
        .lasa_normalize_filecode(spec$filecode) &
        !is.na(topic_index$theme) & topic_index$theme == spec$theme &
        (is.na(spec$subtheme) & is.na(topic_index$subtheme) |
           !is.na(spec$subtheme) & !is.na(topic_index$subtheme) &
           topic_index$subtheme == spec$subtheme) &
        (is.na(spec$old_topic_contains) |
           (!is.na(topic_index$topic) &
              grepl(spec$old_topic_contains, topic_index$topic, fixed = TRUE)))
    )
    if (length(match_idx) != 1L) {
      ## An override that no longer matches exactly one row (e.g. because
      ## the live site's wording shifted) is skipped rather than guessed
      ## at, so a stale override can never silently corrupt the wrong row.
      next
    }
    topic_index$topic[match_idx] <- spec$new_topic
    if (!is.na(spec$new_filecode_type)) {
      topic_index$filecode_type[match_idx] <- spec$new_filecode_type
    }
  }
  topic_index
}

.lasa_apply_topic_curation <- function(topic_index) {
  topic_index <- .lasa_apply_wave_splits(topic_index)
  topic_index <- .lasa_apply_code_aliases(topic_index)
  topic_index <- .lasa_apply_topic_overrides(topic_index)
  topic_index <- topic_index[
    order(topic_index$theme, topic_index$subtheme, topic_index$topic, topic_index$filecode),
    ,
    drop = FALSE
  ]
  rownames(topic_index) <- NULL
  topic_index
}

## Pure HTML scraping and parsing - no caching, no curation overrides. Kept
## separate from `.lasa_topic_index()` so tests can inject a synthetic
## `document` and exercise the real parsing path deterministically.
.lasa_scrape_topic_table <- function(document = NULL) {
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

  current_theme <- NA_character_
  current_subtheme <- NA_character_
  records <- list()
  record_index <- 0L

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

    if (grepl("^THEME[[:space:]]+", first_cell, ignore.case = TRUE)) {
      theme_text <- sub(
        "^THEME[[:space:]]+",
        "",
        first_cell,
        ignore.case = TRUE
      )
      current_theme <- .lasa_strip_break_marker(tools::toTitleCase(tolower(theme_text)))
      current_subtheme <- NA_character_
      next
    }

    if (identical(cell_text[-1L], waves)) {
      current_subtheme <- .lasa_strip_break_marker(first_cell)
      next
    }

    if (is.na(current_theme) || !nzchar(first_cell) || identical(first_cell, "#")) {
      next
    }

    first_cell_node <- cells[[1L]]
    topic_links <- xml2::xml_find_all(
      first_cell_node,
      ".//a[contains(@href, '/topics/')]"
    )
    topic_link_text <- if (length(topic_links) == 0L) {
      character()
    } else {
      vapply(topic_links, .lasa_node_text_with_breaks, character(1L))
    }
    topic_parts <- unique(.lasa_clean_html_text(topic_link_text))
    topic_parts <- topic_parts[nzchar(topic_parts)]
    topic_name <- if (length(topic_parts) == 0L) {
      first_cell
    } else {
      paste(topic_parts, collapse = "; ")
    }

    topic_hrefs <- unique(xml2::xml_attr(topic_links, "href"))
    topic_hrefs <- topic_hrefs[!is.na(topic_hrefs) & nzchar(topic_hrefs)]
    topic_urls <- if (length(topic_hrefs) == 0L) {
      character()
    } else {
      unique(xml2::url_absolute(topic_hrefs, .lasa_topic_table_url))
    }

    code_waves <- list()
    code_labels <- character()
    code_urls <- list()
    waves_without_code <- character()
    wave_code_lists <- vector("list", length(waves))

    for (wave_index in seq_along(waves)) {
      wave <- waves[[wave_index]]
      wave_cell <- cells[[wave_index + 1L]]
      wave_text <- cell_text[[wave_index + 1L]]
      wave_codes <- .lasa_extract_filecodes(wave_text)
      wave_code_lists[[wave_index]] <- wave_codes

      if (length(wave_codes) == 0L && identical(toupper(wave_text), "X")) {
        waves_without_code <- c(waves_without_code, wave)
      }

      for (wave_code in wave_codes) {
        code_key <- .lasa_normalize_filecode(wave_code)
        code_waves[[code_key]] <- unique(c(code_waves[[code_key]], wave))
        if (!code_key %in% names(code_labels)) {
          code_labels[[code_key]] <- wave_code
        }
      }

      pdf_links <- xml2::xml_find_all(
        wave_cell,
        paste0(
          ".//a[contains(translate(@href, 'PDF', 'pdf'), ",
          "'_varinfo.pdf')]"
        )
      )

      if (length(pdf_links) > 0L) {
        for (pdf_link in pdf_links) {
          pdf_url <- xml2::url_absolute(
            xml2::xml_attr(pdf_link, "href"),
            .lasa_topic_table_url
          )
          linked_codes <- .lasa_extract_filecodes(xml2::xml_text(pdf_link))

          for (linked_code in linked_codes) {
            code_key <- .lasa_normalize_filecode(linked_code)
            code_urls[[code_key]] <- unique(c(code_urls[[code_key]], pdf_url))
          }
        }
      }
    }

    resolved_topic_labels <- if (length(topic_parts) <= 1L) {
      .lasa_resolve_topic_labels(
        label_text = topic_name,
        ref_order = .lasa_reference_code_order(wave_code_lists),
        all_code_keys = names(code_waves)
      )
    } else if (length(topic_parts) == length(code_waves)) {
      ## A row with several distinct `/topics/` links (semicolon-joined)
      ## and exactly as many distinct file codes: pair them up by the
      ## row's own column order, the same way single-link compound labels
      ## are split. Each linked topic's own text becomes that code's
      ## label - a leading "- " bullet marker some rows use is trimmed.
      ref_order <- .lasa_reference_code_order(wave_code_lists)
      ref_keys <- unique(.lasa_normalize_filecode(ref_order))
      if (length(ref_keys) == length(topic_parts) &&
          setequal(ref_keys, names(code_waves))) {
        cleaned_parts <- sub("^(?:[-\u2013\u2014]\\s*)+", "", topic_parts, perl = TRUE)
        result <- stats::setNames(cleaned_parts, ref_keys)
        result[names(code_waves)]
      } else {
        NULL
      }
    } else {
      NULL
    }

    if (length(code_waves) > 0L) {
      for (code_key in names(code_waves)) {
        urls <- code_urls[[code_key]]
        urls <- urls[!is.na(urls) & nzchar(urls)]
        record_topic <- if (!is.null(resolved_topic_labels) &&
                            code_key %in% names(resolved_topic_labels)) {
          unname(resolved_topic_labels[[code_key]])
        } else {
          topic_name
        }
        record_index <- record_index + 1L
        records[[record_index]] <- data.frame(
          theme = current_theme,
          subtheme = current_subtheme,
          topic = record_topic,
          filecode = unname(code_labels[[code_key]]),
          filecode_type = unname(.lasa_filecode_role(code_key)),
          waves = paste(code_waves[[code_key]], collapse = ", "),
          has_varinfo = length(urls) > 0L,
          varinfo_url = if (length(urls) == 0L) {
            NA_character_
          } else {
            paste(urls, collapse = "; ")
          },
          topic_url = if (length(topic_urls) == 0L) {
            NA_character_
          } else {
            paste(topic_urls, collapse = "; ")
          },
          stringsAsFactors = FALSE
        )
      }
    }

    if (length(code_waves) == 0L || length(waves_without_code) > 0L) {
      record_index <- record_index + 1L
      records[[record_index]] <- data.frame(
        theme = current_theme,
        subtheme = current_subtheme,
        topic = topic_name,
        filecode = NA_character_,
        filecode_type = NA_character_,
        waves = if (length(waves_without_code) == 0L) {
          NA_character_
        } else {
          paste(unique(waves_without_code), collapse = ", ")
        },
        has_varinfo = FALSE,
        varinfo_url = NA_character_,
        topic_url = if (length(topic_urls) == 0L) {
          NA_character_
        } else {
          paste(topic_urls, collapse = "; ")
        },
        stringsAsFactors = FALSE
      )
    }
  }

  if (length(records) == 0L) {
    stop("No topics could be parsed from the LASA topic table.", call. = FALSE)
  }

  topic_index <- do.call(rbind, records)
  rownames(topic_index) <- NULL

  ## Defensive final pass: theme/subtheme are covered above at the point
  ## they're detected, but this also catches the marker anywhere it might
  ## have survived in `topic` (e.g. an unresolved leftover segment) rather
  ## than relying on every intermediate code path to have stripped it.
  topic_index$theme <- vapply(topic_index$theme, .lasa_strip_break_marker, character(1L))
  topic_index$subtheme <- vapply(topic_index$subtheme, .lasa_strip_break_marker, character(1L))
  topic_index$topic <- vapply(topic_index$topic, .lasa_strip_break_marker, character(1L))

  topic_index
}

## Session-memory cache is checked first (fastest); a disk cache under
## `tools::R_user_dir("CleanLASA", "cache")` means the table also survives
## across R sessions instead of being rebuilt from scratch every time;
## `refresh = TRUE` bypasses both and rebuilds from the live site,
## updating both caches. Curation (`.lasa_apply_topic_curation()`) runs
## once, right after a fresh scrape, and the *curated* result is what
## gets cached - so a cache hit never needs to re-apply it.
.lasa_topic_index <- function(refresh = FALSE, document = NULL) {
  if (!is.null(document)) {
    return(.lasa_apply_topic_curation(.lasa_scrape_topic_table(document)))
  }

  if (!refresh && exists("topics", envir = .lasa_topic_cache, inherits = FALSE)) {
    return(get("topics", envir = .lasa_topic_cache, inherits = FALSE))
  }

  if (!refresh) {
    disk_cached <- .lasa_read_disk_cache()
    if (!is.null(disk_cached)) {
      assign("topics", disk_cached, envir = .lasa_topic_cache)
      return(disk_cached)
    }
  }

  topic_index <- .lasa_apply_topic_curation(.lasa_scrape_topic_table())
  assign("topics", topic_index, envir = .lasa_topic_cache)
  .lasa_write_disk_cache(topic_index)
  topic_index
}

## `tools::R_user_dir()` is the CRAN-recommended, cross-platform location
## for a package's own cache files (not a path the user has to manage).
## Requires R >= 4.0; see DESCRIPTION.
.lasa_cache_file <- function() {
  cache_dir <- tools::R_user_dir("CleanLASA", which = "cache")
  file.path(cache_dir, "lasa_topic_index.rds")
}

.lasa_read_disk_cache <- function() {
  cache_file <- .lasa_cache_file()
  if (!file.exists(cache_file)) {
    return(NULL)
  }
  cached <- tryCatch(readRDS(cache_file), error = function(error) NULL)
  if (!is.data.frame(cached)) {
    return(NULL)
  }
  message(
    "Using the LASA topic table cached on ", format(file.mtime(cache_file), "%Y-%m-%d"),
    ". Use `refresh = TRUE` to check the live site for updates."
  )
  cached
}

.lasa_write_disk_cache <- function(topic_index) {
  cache_file <- .lasa_cache_file()
  tryCatch(
    {
      dir.create(dirname(cache_file), recursive = TRUE, showWarnings = FALSE)
      saveRDS(topic_index, cache_file)
    },
    error = function(error) {
      ## A read-only or unavailable cache directory should never break
      ## the function itself - it just means every session re-scrapes.
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

.lasa_normalize_filecode <- function(x) {
  output <- tolower(trimws(x))
  output <- sub("^lasa", "", output)
  output <- gsub("[^a-z0-9]", "", output)
  output[is.na(x)] <- NA_character_
  output
}

## LASA file-code numbering convention (per LASA documentation practice):
##   0xx/1xx = main (face-to-face) file
##   2xx/3xx = processed/derived file (scaled scores, sums) or an extension
##             of the main file (e.g. specifications)
##   4xx/5xx = longitudinally cleaned or revised version of the variables
##   6xx     = telephone interview with a proxy of the respondent
##   7xx     = telephone interview with the respondent
## Codes outside this scheme (letter-prefixed codes such as "z004"/"zoa1",
## or numeric codes starting with 8/9, e.g. the Biomaterial theme) are
## classified as "other": the convention does not describe them.
.lasa_filecode_role <- function(code) {
  key <- .lasa_normalize_filecode(code)
  role <- rep_len("other", length(key))
  is_numeric_code <- grepl("^[0-9]{3}", key)
  leading_digit <- substr(key, 1L, 1L)
  role[is_numeric_code & leading_digit %in% c("0", "1")] <- "main"
  role[is_numeric_code & leading_digit %in% c("2", "3")] <- "processed"
  role[is_numeric_code & leading_digit %in% c("4", "5")] <- "cleaned"
  role[is_numeric_code & leading_digit == "6"] <- "proxy"
  role[is_numeric_code & leading_digit == "7"] <- "respondent"
  role[is.na(key)] <- NA_character_
  role
}

## Splits a compound LASA topic label on " - " (also accepting the en dash
## "\u2013" and em dash "\u2014" the LASA site uses), without touching
## hyphens that are part of a word (e.g. "Self-report"). A run of several
## consecutive dashes (e.g. "Vision (self-report) - - tel. proxy", a
## formatting quirk on some rows) is collapsed into a single delimiter
## rather than leaving a stray dash attached to the next segment - which
## would otherwise show up doubled once `.lasa_resolve_topic_labels()`
## adds its own " - " separator. Also splits on `.lasa_break_marker`,
## which stands in for a line break or paragraph boundary in the source
## HTML (see `.lasa_node_text_with_breaks()`) - unlike a dash, the marker
## can never be part of a real word, so it does not need surrounding
## whitespace to be recognized as a separator. The first element is
## always the base topic name; later elements are qualifiers such as
## "tel. proxy" or "longitudinally cleaned".
.lasa_split_topic_segments <- function(text) {
  if (length(text) == 0L || is.na(text) || !nzchar(text)) {
    return(character())
  }
  pattern <- paste0(
    "(?:\\s+[-\u2013\u2014](?:\\s+[-\u2013\u2014])*\\s+|\\s*",
    .lasa_break_marker, "\\s*)"
  )
  parts <- strsplit(text, pattern, perl = TRUE)[[1L]]
  parts <- trimws(parts)
  parts[nzchar(parts)]
}

## Classifies a topic-label qualifier ("tel. proxy", "longitudinally
## cleaned", ...) using the same vocabulary LASA uses on its site, so it can
## be matched against `.lasa_filecode_role()`. Anything without a
## recognized keyword is treated as a generic processed/derived qualifier
## (e.g. "nr. of diseases reported").
.lasa_segment_role <- function(text) {
  normalized <- tolower(text)
  ifelse(
    grepl("proxy", normalized),
    "proxy",
    ifelse(
      grepl("respondent", normalized),
      "respondent",
      ifelse(
        grepl("clean|longitudin|revis", normalized),
        "cleaned",
        "processed"
      )
    )
  )
}

## Determines, for one topic row, the left-to-right order in which its
## distinct file codes appear. LASA lays each row out with a fixed slot
## order per wave-cell (e.g. main, proxy, respondent, cleaned), so the
## wave-cell with the most codes gives the most reliable ordering; any
## codes seen only in sparser cells are appended in first-seen order.
.lasa_reference_code_order <- function(wave_code_lists) {
  wave_code_lists <- wave_code_lists[lengths(wave_code_lists) > 0L]
  if (length(wave_code_lists) == 0L) {
    return(character())
  }

  best <- wave_code_lists[[which.max(lengths(wave_code_lists))]]
  ref_order <- unique(best)

  for (codes in wave_code_lists) {
    ref_keys <- .lasa_normalize_filecode(ref_order)
    new_codes <- codes[!.lasa_normalize_filecode(codes) %in% ref_keys]
    if (length(new_codes) > 0L) {
      ref_order <- c(ref_order, unique(new_codes))
    }
  }

  ref_order
}

## Pairs each segment of a (possibly compound) topic label with the file
## code it describes, so that e.g. "Self-report of chronic diseases - tel.
## proxy" is only attached to the proxy-interview file code, instead of
## repeating the full compound label for every code found in the row.
##
## Pairing prefers the row's own positional layout (`ref_order`, from
## `.lasa_reference_code_order()`); when that does not line up 1:1 with the
## label segments, it falls back to matching by semantic role (derived from
## the file-code numbering convention and from keywords in the segment
## text). Roles left with a code but no matching segment text fall back to
## a short phrase named after the role itself (e.g. "tel. proxy" for a
## 6xx code with nothing better to go on), then to positional leftovers,
## and finally to leaving the full original label attached to any code
## still unresolved.
.lasa_resolve_topic_labels <- function(label_text, ref_order, all_code_keys) {
  all_code_keys <- unique(all_code_keys)
  fallback <- stats::setNames(rep_len(label_text, length(all_code_keys)), all_code_keys)

  segments <- .lasa_split_topic_segments(label_text)

  if (length(all_code_keys) <= 1L) {
    ## Nothing to disambiguate between codes; but if the label itself
    ## lists several qualifiers for what is really just one file, keep
    ## only the base name rather than the full descriptive list (e.g.
    ## "Inflammation factors - Pro-inflammatory cytokine IL-6 - ..." is
    ## just "Inflammation factors" when there is a single filecode).
    if (length(segments) > 1L) {
      return(stats::setNames(rep_len(segments[[1L]], length(all_code_keys)), all_code_keys))
    }
    return(fallback)
  }
  if (length(segments) <= 1L) {
    return(fallback)
  }

  base_label <- segments[[1L]]
  build_label <- function(segment_index) {
    if (segment_index == 1L) {
      base_label
    } else {
      paste(base_label, segments[[segment_index]], sep = " - ")
    }
  }

  ref_keys <- unique(.lasa_normalize_filecode(ref_order))

  if (length(segments) == length(ref_keys) &&
      setequal(ref_keys, all_code_keys)) {
    result <- vapply(seq_along(ref_keys), build_label, character(1L))
    names(result) <- ref_keys
    return(result[all_code_keys])
  }

  modifiers <- if (length(segments) > 1L) segments[-1L] else character()
  segment_roles <- c("main", vapply(modifiers, .lasa_segment_role, character(1L)))
  code_roles <- .lasa_filecode_role(all_code_keys)

  result <- stats::setNames(rep(NA_character_, length(all_code_keys)), all_code_keys)
  used_segment <- rep(FALSE, length(segments))

  ## The bare base label is safe to reuse across every "main" code even
  ## when there is more than one (e.g. a file renumbered for later waves)
  ## - unlike a specific modifier, duplicating "no modifier" never invents
  ## a false distinction. Other roles keep strict 1:1 pairing below.
  main_code_idx <- which(code_roles == "main")
  if (length(main_code_idx) > 0L && segment_roles[[1L]] == "main") {
    result[main_code_idx] <- base_label
    used_segment[[1L]] <- TRUE
  }

  for (role in c("processed", "proxy", "respondent", "cleaned")) {
    code_idx <- which(code_roles == role & is.na(result))
    segment_idx <- which(segment_roles == role & !used_segment)
    n <- min(length(code_idx), length(segment_idx))
    if (n > 0L) {
      for (pair in seq_len(n)) {
        result[code_idx[pair]] <- build_label(segment_idx[pair])
        used_segment[segment_idx[pair]] <- TRUE
      }
    }
  }

  ## A code with a known role (main/processed/cleaned/proxy/respondent)
  ## but no segment of its own gets a short phrase named after that role,
  ## rather than either duplicating a different code's specific modifier
  ## or falling all the way back to the full original label.
  role_default_phrase <- c(
    processed = "processed", cleaned = "longitudinally cleaned",
    proxy = "tel. proxy", respondent = "tel. respondent"
  )
  for (role in names(role_default_phrase)) {
    code_idx <- which(code_roles == role & is.na(result))
    if (length(code_idx) > 0L) {
      result[code_idx] <- paste(base_label, role_default_phrase[[role]], sep = " - ")
    }
  }

  remaining_code_idx <- which(is.na(result))
  remaining_segment_idx <- which(!used_segment)
  n <- min(length(remaining_code_idx), length(remaining_segment_idx))
  if (n > 0L) {
    for (pair in seq_len(n)) {
      result[remaining_code_idx[pair]] <- build_label(remaining_segment_idx[pair])
    }
  }

  result[is.na(result)] <- fallback[is.na(result)]
  result
}

.lasa_normalize_text <- function(x) {
  output <- iconv(x, from = "", to = "ASCII//TRANSLIT", sub = "")
  output <- tolower(output)
  output <- gsub("[^a-z0-9]+", " ", output)
  output <- trimws(gsub("[[:space:]]+", " ", output))
  output[is.na(x)] <- NA_character_
  output
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

## `.lasa_split_topic_segments()` consumes `.lasa_break_marker` as a
## delimiter, but theme and subtheme header cells never go through that
## function - they're used as-is (see the THEME/subtheme detection below)
## - so a `<br>` inside a header (e.g. "Medication/<br>supplements", used
## purely to wrap a narrow table column) would otherwise leave the marker
## sitting in the final theme/subtheme text. This is also applied as a
## final defensive pass over theme/subtheme/topic right before each record
## is built, in case the marker survives some other path.
.lasa_strip_break_marker <- function(x) {
  if (length(x) == 0L || is.na(x) || !nzchar(x)) {
    return(x)
  }
  x <- gsub(paste0("[[:space:]]*", .lasa_break_marker, "[[:space:]]*"), " ", x)
  trimws(x)
}

## `xml_text()` alone loses `<br>`/paragraph boundaries entirely - an empty
## `<br>` tag contributes no characters, so "A<br>B" and "AB" extract to the
## same text, silently gluing two line-break-separated topic names into one
## (this is what happened to "Blood collection and overview (routine)
## measurements" / "Response blood sampling / DNA Date blood sampling",
## which the LASA site displays as two lines in one cell). This inserts
## `.lasa_break_marker` at those boundaries first, by editing the node's
## serialized HTML and re-parsing it, so the boundary survives into the
## extracted text as a marker character instead of disappearing.
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

.lasa_match_scores <- function(
    query,
    candidates,
    fuzzy_match,
    max_edit_distance
) {
  normalized_query <- .lasa_normalize_text(query)
  if (is.na(normalized_query) || !nzchar(normalized_query)) {
    stop(
      "The search value must contain at least one letter or number.",
      call. = FALSE
    )
  }
  normalized_candidates <- .lasa_normalize_text(candidates)
  valid <- !is.na(normalized_candidates) & nzchar(normalized_candidates)

  positions <- rep.int(-1L, length(candidates))
  positions[valid] <- vapply(
    normalized_candidates[valid],
    function(candidate) {
      as.integer(regexpr(normalized_query, candidate, fixed = TRUE)[[1L]])
    },
    integer(1L)
  )

  exact <- valid & normalized_candidates == normalized_query
  prefix <- valid & startsWith(normalized_candidates, normalized_query)
  contains <- valid & positions > 0L
  distance <- rep.int(Inf, length(candidates))

  if (any(valid)) {
    distance[valid] <- as.numeric(utils::adist(
      normalized_query,
      normalized_candidates[valid],
      partial = TRUE
    ))
  }

  matched <- contains | (fuzzy_match & distance <= max_edit_distance)
  matched[!valid | is.na(matched)] <- FALSE
  length_difference <- abs(
    nchar(normalized_candidates) - nchar(normalized_query)
  )

  score <- ifelse(
    exact,
    0,
    ifelse(
      prefix,
      10 + length_difference / 1000,
      ifelse(
        contains,
        20 + positions / 100 + length_difference / 1000,
        30 + distance + length_difference / 1000
      )
    )
  )
  score[!matched] <- Inf

  data.frame(
    matched = matched,
    score = score,
    distance = distance,
    stringsAsFactors = FALSE
  )
}

.lasa_best_match <- function(
    query,
    candidates,
    fuzzy_match,
    max_edit_distance,
    label
) {
  candidates <- unique(candidates[!is.na(candidates) & nzchar(candidates)])
  scores <- .lasa_match_scores(
    query = query,
    candidates = candidates,
    fuzzy_match = fuzzy_match,
    max_edit_distance = max_edit_distance
  )

  if (!any(scores$matched)) {
    stop(
      sprintf("No %s matched %s.", label, shQuote(query)),
      call. = FALSE
    )
  }

  best_score <- min(scores$score)
  best <- candidates[scores$score == best_score]

  if (length(best) > 1L) {
    stop(
      sprintf(
        "The value %s matches multiple values for %s: %s.",
        shQuote(query),
        label,
        paste(best, collapse = "; ")
      ),
      call. = FALSE
    )
  }

  best[[1L]]
}

.lasa_validate_scalar_character <- function(x, argument) {
  if (!is.character(x) || length(x) != 1L || is.na(x) || !nzchar(trimws(x))) {
    stop(
      sprintf("`%s` must be a single, non-empty character string.", argument),
      call. = FALSE
    )
  }
}

.lasa_validate_flag <- function(x, argument) {
  if (!is.logical(x) || length(x) != 1L || is.na(x)) {
    stop(
      sprintf("`%s` must be either `TRUE` or `FALSE`.", argument),
      call. = FALSE
    )
  }
}

.lasa_validate_max_distance <- function(x) {
  if (!is.numeric(x) || length(x) != 1L || is.na(x) ||
      x < 0 || x != as.integer(x)) {
    stop("`max_edit_distance` must be one non-negative integer.", call. = FALSE)
  }
}
