# Resolves a LASA file code to its variable-information PDF's URL, reusing
# the existing, already-tested `.lasa_topic_index()` / `lasa_topics.R`
# machinery (live scrape + cache) rather than re-implementing it. Falls
# back to a bundled, maintained offline manifest
# (`lasa_offline_topics_table`, built from `data-raw/lasa_topics_table.csv`
# by `data-raw/build_lasa_offline_topics_table.R`) when the live site can't
# be reached -- e.g. this package's own CI/sandboxed environments, or a
# user working offline.
#
# Unlike `.lasa_var_info_resolve()` in lasa_var_info.R (which resolves a
# user-facing filecode/topic *query* to a single URL to open), this
# resolver's job is to find the *complete set of file codes that share one
# PDF* with the requested filecode, for `update_lasa_labels()` to parse
# once and record against every one of them.

#' Resolve a LASA varinfo PDF for a file code (or explicit URL)
#'
#' @param filecode Optional LASA file code (e.g. `"046"`, `"z004"`,
#'   `"zoa1"`), matched via the same normalization `lasa_topics()` uses
#'   internally. A bare group
#'   prefix that isn't itself a documented file code (e.g. `"zoa"` when
#'   only `"zoa1"`/`"zoa2"`/`"zoa3"` are documented, but all three share one
#'   PDF) also resolves, as long as it's unambiguous.
#' @param url Optional explicit HTTPS URL (or local path). When supplied,
#'   `filecode` is not looked up at all -- resolution is bypassed entirely.
#'
#' @return A list with `filecodes` (character vector: every normalized
#'   file code documented by this PDF, including the requested one),
#'   `varinfo_url` (HTTPS URL, or `NA_character_` when only resolved via
#'   the offline manifest -- see `varinfo_file`), `varinfo_file` (the PDF's
#'   own file name, always available), and `source` (`"explicit"`,
#'   `"online"`, or `"offline"`).
#' @keywords internal
.lasa_resolve_varinfo_url <- function(filecode = NULL, url = NULL) {
  if (!is.null(url)) {
    if (!is.character(url) || length(url) != 1L || is.na(url) || !nzchar(url)) {
      stop("'url' must be a single non-empty character string.", call. = FALSE)
    }
    return(list(
      filecodes = if (!is.null(filecode)) .lasa_normalize_filecode(filecode) else NA_character_,
      varinfo_url = url,
      varinfo_file = basename(sub("[?#].*$", "", url)),
      source = "explicit"
    ))
  }

  if (is.null(filecode)) {
    stop("Either 'filecode' or 'url' must be supplied.", call. = FALSE)
  }
  normalized <- .lasa_normalize_filecode(filecode)
  if (is.na(normalized) || !nzchar(normalized)) {
    stop("'filecode' must contain at least one letter or number.", call. = FALSE)
  }

  online <- tryCatch(.lasa_resolve_varinfo_online(normalized), error = function(e) NULL)
  if (!is.null(online)) return(online)

  .lasa_resolve_varinfo_offline(normalized)
}

## Rows of `topic_index`/`offline_table` whose (normalized) filecode either
## exactly matches `normalized`, or -- when there's no exact match --
## shares `normalized` as a common bare group prefix (e.g. "zoa" matching
## "zoa1"/"zoa2"/"zoa3"). Returns an empty subset (0 rows) when neither
## matches anything, so the caller can fall through cleanly.
.lasa_varinfo_match_rows <- function(code_keys, normalized) {
  exact <- !is.na(code_keys) & code_keys == normalized
  if (any(exact)) return(exact)
  ## Group alias: bare prefix must be shared by more than one filecode,
  ## and the prefix itself must not look like it's just missing trailing
  ## digits of a single code (guard against e.g. "04" matching "046").
  is_group_prefix <- grepl("^[a-z]+$", normalized)
  if (!is_group_prefix) return(rep(FALSE, length(code_keys)))
  !is.na(code_keys) & startsWith(code_keys, normalized) & code_keys != normalized
}

.lasa_resolve_varinfo_online <- function(normalized) {
  topic_index <- .lasa_topic_index()
  code_keys <- .lasa_normalize_filecode(topic_index$filecode)
  matched <- .lasa_varinfo_match_rows(code_keys, normalized)
  if (!any(matched)) return(NULL)

  rows <- topic_index[matched, , drop = FALSE]
  urls <- .lasa_var_info_urls(rows$varinfo_url)
  if (length(urls) == 0L) return(NULL)
  if (length(urls) > 1L) {
    stop(
      sprintf(
        "Filecode %s matches multiple different variable-information PDFs on the LASA site: %s.",
        shQuote(normalized), paste(urls, collapse = "; ")
      ),
      call. = FALSE
    )
  }

  sibling_matches <- !is.na(topic_index$varinfo_url) &
    vapply(topic_index$varinfo_url, function(x) urls %in% .lasa_var_info_urls(x), logical(1L))
  sibling_rows <- topic_index[sibling_matches, , drop = FALSE]

  list(
    filecodes = unique(.lasa_normalize_filecode(sibling_rows$filecode)),
    varinfo_url = urls,
    varinfo_file = basename(sub("[?#].*$", "", urls)),
    source = "online"
  )
}

.lasa_resolve_varinfo_offline <- function(normalized) {
  tbl <- lasa_offline_topics_table
  code_keys <- .lasa_normalize_filecode(tbl$filecode)
  has_varinfo <- tbl$has_varinfo & !is.na(tbl$varinfo_file) & nzchar(tbl$varinfo_file)
  matched <- .lasa_varinfo_match_rows(code_keys, normalized) & has_varinfo

  if (!any(matched)) {
    stop(
      sprintf(
        paste0(
          "No variable-information PDF found for filecode %s, checking both the live ",
          "LASA site and the bundled offline manifest. Use `lasa_topics()` to inspect ",
          "available file codes, or supply 'url'/'path' directly."
        ),
        shQuote(normalized)
      ),
      call. = FALSE
    )
  }

  rows <- tbl[matched, , drop = FALSE]
  files <- unique(rows$varinfo_file)
  if (length(files) > 1L) {
    stop(
      sprintf(
        "Filecode %s matches multiple different variable-information PDFs in the offline manifest: %s.",
        shQuote(normalized), paste(files, collapse = "; ")
      ),
      call. = FALSE
    )
  }

  sibling_rows <- tbl[!is.na(tbl$varinfo_file) & tbl$varinfo_file == files, , drop = FALSE]
  list(
    filecodes = unique(.lasa_normalize_filecode(sibling_rows$filecode)),
    varinfo_url = NA_character_,
    varinfo_file = files,
    source = "offline"
  )
}
