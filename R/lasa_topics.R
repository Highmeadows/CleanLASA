## The public topic-search entry point (`lasa_topics()`) and the validation
## helper used when the bundled topic database itself is rebuilt.
##
## Unlike earlier versions of this package, the topic table is no longer
## scraped from https://lasa-vu.nl/en/topic-table/ at call time: parsing that
## page's irregular HTML (line-break-glued topics, several file codes
## sharing one row, compound labels) didn't always go right, so the table is
## now hand-transcribed instead, in `data-raw/lasa_topic_database.R`, and
## bundled with the package as the internal `lasa_topic_database` object (see
## `R/sysdata.rda`). `lasa_var_info()` (R/lasa_var_info.R) still scrapes the
## live page, but only to resolve a file code's varinfo.pdf link -- never for
## topic/theme text.

## Validates the hand-maintained topic database's structural integrity.
## Returns a character vector of problem descriptions (empty = valid). Used
## by data-raw/lasa_topic_database.R when rebuilding R/sysdata.rda; mirrors
## the validation style of `.lasa_validate_label_db()` in R/lasa_label_db.R.
.lasa_validate_topic_database <- function(topic_database) {
  problems <- character(0)

  key <- with(
    topic_database,
    paste(theme, subtheme, topic, filecode, sep = "\r")
  )
  if (anyDuplicated(key) > 0L) {
    problems <- c(problems, sprintf(
      "%d duplicate (theme, subtheme, topic, filecode) row(s).",
      sum(duplicated(key))
    ))
  }

  inconsistent <- topic_database$has_varinfo & is.na(topic_database$filecode)
  if (any(inconsistent)) {
    problems <- c(problems, sprintf(
      "%d row(s) have has_varinfo = TRUE but no filecode.",
      sum(inconsistent)
    ))
  }

  problems
}

## Thin accessor around the bundled `lasa_topic_database` object (see
## data-raw/lasa_topic_database.R / R/sysdata.rda), kept as a function
## rather than referencing the object directly so tests can substitute a
## fixture via `local_mocked_bindings(.lasa_topic_database = ...)`.
.lasa_topic_database <- function() {
  lasa_topic_database
}

#' Search the LASA topic table
#'
#' Searches the package's bundled LASA topic database and returns topics,
#' file codes, and available waves. This table is hand-maintained (see
#' `data-raw/lasa_topic_database.R` in the package source) rather than
#' scraped, so it updates only when the package itself does. To get the
#' linked variable-information PDF for a topic or file code -- resolved live
#' from the LASA website -- use [lasa_var_info()].
#'
#' Topic, theme, and subtheme matching is case-insensitive. Incomplete names
#' and small typographical errors are accepted when `fuzzy_match = TRUE`.
#' Supplying `theme` searches both the main LASA themes and their subthemes.
#'
#' A topic with no file code yet (e.g. a planned but not-yet-released
#' measure), or a file code with no linked variable-information PDF, is
#' still included in the result -- `filecode` is `NA` and/or
#' `has_varinfo` is `FALSE` for that row, rather than the row being
#' dropped.
#'
#' To add a new topic or file code to this table, or to update which waves
#' an existing file code is available in (e.g. a newly released wave),
#' edit `data-raw/lasa_topic_database.R` directly and re-run it.
#'
#' @param topic A topic search term. Use `"all"` (the default) to return every
#'   topic, optionally within the selected `theme` or subtheme.
#' @param theme An optional theme or subtheme search term, such as
#'   `"cognitive"` or `"memory"`.
#' @param fuzzy_match Logical. If `TRUE`, allow fuzzy matching.
#' @param max_edit_distance Maximum edit distance used for fuzzy matching.
#'
#' @return A data frame with one row per topic and file-code combination. It
#'   contains `theme`, `subtheme`, `topic`, `filecode`, `waves`, and
#'   `has_varinfo`, which indicates whether a variable-information PDF is
#'   linked for that row; use [lasa_var_info()] to get or open it.
#'
#' @examples
#' lasa_topics()
#' lasa_topics(topic = "Physical")
#' lasa_topics(topic = "physical act")
#' lasa_topics(theme = "cognitive")
#' lasa_topics(theme = "memory")
#'
#' @export
lasa_topics <- function(
    topic = "all",
    theme = NULL,
    fuzzy_match = TRUE,
    max_edit_distance = 2L
) {
  .lasa_validate_scalar_character(topic, "topic")
  if (!is.null(theme)) {
    .lasa_validate_scalar_character(theme, "theme")
  }
  .lasa_validate_flag(fuzzy_match, "fuzzy_match")
  .lasa_validate_max_distance(max_edit_distance)

  topic_index <- .lasa_topic_database()

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

    # Search the complete database for matching theme names, not only the
    # topic rows retained above (and not only within a `theme` filter, if
    # one was supplied).
    complete_index <- .lasa_topic_database()
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
