#' Open LASA variable information
#'
#' Searches the [LASA topic overview](https://lasa-vu.nl/en/topic-table/)
#' and opens the variable-information PDF linked by LASA. The documentation is
#' opened from the LASA website; no PDF files are read from or bundled with the
#' package. The underlying topic table is cached the same way as in
#' [lasa_topics()] (in-session and on disk); `refresh = TRUE` rebuilds it from
#' the live site first.
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
#' @param viewer Where to open the PDF. One of `"auto"`, `"rstudio"`, or
#'   `"system"`. `"auto"` uses the system's webbrowser as PDF viewer.
#' @param open Logical. Should the PDF be opened? The default is `TRUE` in an
#'   interactive R session and `FALSE` otherwise. If `FALSE`, the URL is
#'   returned without being opened.
#' @param fuzzy_match Logical. If `TRUE`, allow small typographical errors in
#'   topic names.
#' @param max_edit_distance Maximum edit distance allowed for fuzzy topic-name
#'   matching.
#' @param refresh Logical. If `TRUE`, refresh the cached LASA topic table before
#'   searching it.
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
    viewer = c("auto", "rstudio", "system"),
    open = interactive(),
    fuzzy_match = TRUE,
    max_edit_distance = 2L,
    refresh = FALSE
) {
  viewer <- match.arg(viewer)
  .lasa_var_info_validate_character(filecode, "filecode")
  .lasa_var_info_validate_flag(open, "open")
  .lasa_var_info_validate_flag(fuzzy_match, "fuzzy_match")
  .lasa_var_info_validate_distance(max_edit_distance)
  .lasa_var_info_validate_flag(refresh, "refresh")

  topic_index <- .lasa_topic_index(refresh = refresh)
  varinfo_url <- .lasa_var_info_resolve(
    query = filecode,
    topic_index = topic_index,
    fuzzy_match = fuzzy_match,
    max_edit_distance = max_edit_distance
  )

  if (!open) {
    return(invisible(varinfo_url))
  }

  rstudio_viewer <- getOption("viewer")
  use_rstudio_viewer <-
    identical(viewer, "rstudio") #||
  #(identical(viewer, "auto") && is.function(rstudio_viewer))

  if (use_rstudio_viewer && is.function(rstudio_viewer)) {
    viewer_succeeded <- tryCatch(
      {
        rstudio_viewer(varinfo_url)
        TRUE
      },
      error = function(error) FALSE
    )

    if (viewer_succeeded) {
      return(invisible(varinfo_url))
    }
  } else if (identical(viewer, "rstudio")) {
    warning(
      paste0(
        "The RStudio Viewer is unavailable; using the system browser or ",
        "PDF viewer."
      ),
      call. = FALSE
    )
  }

  utils::browseURL(varinfo_url)
  invisible(varinfo_url)
}

.lasa_var_info_resolve <- function(
    query,
    topic_index,
    fuzzy_match = TRUE,
    max_edit_distance = 2L
) {
  required_columns <- c("topic", "filecode", "varinfo_url")
  missing_columns <- setdiff(required_columns, names(topic_index))

  if (!is.data.frame(topic_index) || length(missing_columns) > 0L) {
    stop(
      paste0(
        "The LASA topic table has an unexpected format. Missing column(s): ",
        paste(missing_columns, collapse = ", "), "."
      ),
      call. = FALSE
    )
  }

  normalized_query_code <- .lasa_var_info_normalize_filecode(query)
  normalized_filecodes <- .lasa_var_info_normalize_filecode(
    topic_index$filecode
  )
  code_rows <- which(
    !is.na(normalized_filecodes) &
      nzchar(normalized_filecodes) &
      normalized_filecodes == normalized_query_code
  )

  if (length(code_rows) > 0L) {
    matched_rows <- topic_index[code_rows, , drop = FALSE]
    matched_by <- paste0("LASA file code ", shQuote(query))
    preferred_code <- unique(normalized_filecodes[code_rows])
    preferred_code <- preferred_code[nzchar(preferred_code)]
  } else {
    topic_match <- .lasa_var_info_match_topic(
      query = query,
      topics = topic_index$topic,
      fuzzy_match = fuzzy_match,
      max_edit_distance = max_edit_distance
    )
    matched_rows <- topic_index[topic_match$rows, , drop = FALSE]
    matched_by <- paste0("LASA topic ", shQuote(topic_match$label))
    preferred_code <- character()
  }

  urls <- .lasa_var_info_urls(matched_rows$varinfo_url)

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
  normalized_query <- .lasa_var_info_normalize_text(query)
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

  normalized_candidates <- .lasa_var_info_normalize_text(candidate_labels)
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
      .lasa_var_info_normalize_text(candidate_labels) ==
        .lasa_var_info_normalize_text(best_labels[[1L]])
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

.lasa_var_info_normalize_filecode <- function(x) {
  output <- tolower(trimws(x))
  output <- sub("[.]sav$", "", output)
  output <- sub("_?varinfo[.]pdf$", "", output)
  output <- sub("[.]pdf$", "", output)
  output <- sub("^lasa", "", output)
  output <- gsub("[^a-z0-9]", "", output)
  output[is.na(x)] <- NA_character_
  output
}

.lasa_var_info_normalize_text <- function(x) {
  output <- iconv(x, from = "", to = "ASCII//TRANSLIT", sub = "")
  output <- tolower(output)
  output <- gsub("[^a-z0-9]+", " ", output)
  output <- trimws(gsub("[[:space:]]+", " ", output))
  output[is.na(x)] <- NA_character_
  output
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

.lasa_var_info_validate_flag <- function(x, argument) {
  if (!is.logical(x) || length(x) != 1L || is.na(x)) {
    stop(
      sprintf("`%s` must be either `TRUE` or `FALSE`.", argument),
      call. = FALSE
    )
  }
}

.lasa_var_info_validate_distance <- function(x) {
  if (!is.numeric(x) || length(x) != 1L || is.na(x) ||
      x < 0 || x != as.integer(x)) {
    stop(
      "`max_edit_distance` must be one non-negative integer.",
      call. = FALSE
    )
  }
}
