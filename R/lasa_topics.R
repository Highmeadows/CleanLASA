.lasa_topic_table_url <- "https://lasa-vu.nl/en/topic-table/"
.lasa_topic_cache <- new.env(parent = emptyenv())

#' Search the LASA topic table
#'
#' Retrieves the live topic overview from the LASA website and returns topics,
#' file codes, available waves, and links to variable-information PDFs. The
#' table is cached for the remainder of the current R session.
#'
#' Topic, theme, and subtheme matching is case-insensitive. Incomplete names
#' and small typographical errors are accepted when `fuzzy_match = TRUE`.
#' Supplying `theme` searches both the main LASA themes and their subthemes.
#'
#' @param topic A topic search term. Use `"all"` (the default) to return every
#'   topic, optionally within the selected `theme` or subtheme.
#' @param theme An optional theme or subtheme search term, such as
#'   `"cognitive"` or `"memory"`.
#' @param fuzzy_match Logical. If `TRUE`, allow fuzzy matching.
#' @param max_edit_distance Maximum edit distance used for fuzzy matching.
#' @param refresh Logical. If `TRUE`, ignore the topic table cached during the
#'   current R session and retrieve it again from the LASA website.
#'
#' @return A data frame with one row per topic and file-code combination. It
#'   contains `theme`, `subtheme`, `topic`, `filecode`, `waves`,
#'   `has_varinfo`, `varinfo_url`, and `topic_url`.
#'
#' @examples
#' \dontrun{
#' lasa_topics()
#' lasa_topics(topic = "Physical")
#' lasa_topics(topic = "physical act")
#' lasa_topics(theme = "cognitive")
#' lasa_topics(theme = "memory")
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
  rownames(topic_index) <- NULL
  topic_index
}


.lasa_topic_index <- function(refresh = FALSE) {
  if (!refresh && exists("topics", envir = .lasa_topic_cache, inherits = FALSE)) {
    return(get("topics", envir = .lasa_topic_cache, inherits = FALSE))
  }

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
    cell_text <- .lasa_clean_html_text(xml2::xml_text(cells))
    first_cell <- cell_text[[1L]]

    if (grepl("^THEME[[:space:]]+", first_cell, ignore.case = TRUE)) {
      theme_text <- sub(
        "^THEME[[:space:]]+",
        "",
        first_cell,
        ignore.case = TRUE
      )
      current_theme <- tools::toTitleCase(tolower(theme_text))
      current_subtheme <- NA_character_
      next
    }

    if (identical(cell_text[-1L], waves)) {
      current_subtheme <- first_cell
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
    topic_parts <- unique(.lasa_clean_html_text(xml2::xml_text(topic_links)))
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

    for (wave_index in seq_along(waves)) {
      wave <- waves[[wave_index]]
      wave_cell <- cells[[wave_index + 1L]]
      wave_text <- cell_text[[wave_index + 1L]]
      wave_codes <- .lasa_extract_filecodes(wave_text)

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

    if (length(code_waves) > 0L) {
      for (code_key in names(code_waves)) {
        urls <- code_urls[[code_key]]
        urls <- urls[!is.na(urls) & nzchar(urls)]
        record_index <- record_index + 1L
        records[[record_index]] <- data.frame(
          theme = current_theme,
          subtheme = current_subtheme,
          topic = topic_name,
          filecode = unname(code_labels[[code_key]]),
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
  assign("topics", topic_index, envir = .lasa_topic_cache)
  topic_index
}

.lasa_extract_filecodes <- function(x) {
  if (length(x) == 0L || is.na(x) || !nzchar(x)) {
    return(character())
  }

  pattern <- paste0(
    "(?i)(?:[[:alpha:]]{1,6}[0-9]+[[:alpha:]]?|",
    "[0-9]{3}[[:alpha:]]?)"
  )
  locations <- gregexpr(pattern, x, perl = TRUE)
  matches <- regmatches(x, locations)[[1L]]

  if (identical(matches, "")) {
    character()
  } else {
    unique(matches)
  }
}

.lasa_normalize_filecode <- function(x) {
  output <- tolower(trimws(x))
  output <- sub("^lasa", "", output)
  output <- gsub("[^a-z0-9]", "", output)
  output[is.na(x)] <- NA_character_
  output
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
  trimws(gsub("[[:space:]]+", " ", x))
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

.lasa_urls_from_rows <- function(rows) {
  url_text <- rows$varinfo_url[!is.na(rows$varinfo_url)]
  urls <- unlist(strsplit(url_text, ";", fixed = TRUE), use.names = FALSE)
  unique(trimws(urls[nzchar(trimws(urls))]))
}

.lasa_canonical_varinfo_url <- function(urls, normalized_filecode) {
  if (length(urls) == 0L || !nzchar(normalized_filecode)) {
    return(character())
  }

  expected_basename <- paste0("lasa", normalized_filecode, "_varinfo.pdf")
  urls[tolower(basename(urls)) == expected_basename]
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
