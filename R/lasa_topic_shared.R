# Matching, normalization, and validation helpers shared by `lasa_topics()`
# (R/lasa_topics.R) and `lasa_var_info()` (R/lasa_var_info.R). Kept in one
# place instead of duplicated per file, since both search the same kind of
# text (LASA topic names, file codes) the same way.

## LASA file codes are usually three digits ("046"), but letter-prefixed
## codes vary in how many digits follow the letters: "z010" (3 digits),
## "ZFF1" (1 digit), "zoa1" (1 digit), "mb010" (3 digits), "zh01"
## (2 digits). Matching against `lasa_topic_database$filecode` only needs
## case/punctuation/prefix normalization, not the fuller filename-suffix
## stripping `.lasa_var_info_normalize_filecode()` does for a user-supplied
## `filecode` argument (which may be a whole file name).
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

## Scores every candidate against `query`: 0 = exact match, 10s = prefix
## match, 20s = substring match (lower score for an earlier/tighter match),
## 30s = fuzzy match within `max_edit_distance` (when `fuzzy_match = TRUE`).
## `matched` is the logical mask callers should filter on; `score` orders
## results best-first.
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

## Resolves `query` to exactly one candidate, erroring if nothing matches or
## if several candidates tie for the best score (an ambiguous match).
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
