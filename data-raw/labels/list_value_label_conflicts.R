## Collects every row across data-raw/labels/lasa_value_labels_<filecode>.csv
## whose `conflicts` column is non-empty into one review file,
## data-raw/labels/lasa_value_label_conflicts.csv, with every original
## column plus a `solution` column suggesting a resolution.
##
## Only the "Cross-wave coding conflict: <code> differs for <waves1>
## (<label1>), <waves2> (<label2>), ..." note shape gets an automatic
## `solution`, and only when every wave-group's label is the *same*
## label modulo formatting (case, whitespace, "na" vs "not available" --
## see normalize_label()/is_safe_majority()): i.e. the "conflict" was a
## formatting artifact, not a real difference. Anything else -- including
## a label that is a superset/rewording of another (e.g. "difficulty" vs
## "much difficulty", "light exertion" vs "heavy exertion", "pain legs"
## vs "chest pain") -- is left blank. An earlier, fuzzier version of this
## rule (majority wins, blocked only by an explicit negation/number
## mismatch) accepted several of exactly those wrong-in-a-different-way
## cases, so this file no longer tries to *interpret* a wording
## difference at all, only to recognize when there wasn't a real one.
## Every other note shape (a within-wave coding ambiguity, an unresolved
## PDF table/footnote reference, a wave-coverage gap, or a variable-type
## disagreement) needs an actual look at the source documentation, so
## `solution` is left blank for a human to fill in -- see the package
## owner's review of that file for the values that should be incorporated
## back into data-raw/labels/variables_<fc>.R / value_label_sets.R.
##
## Run from the package root; re-run whenever more filecodes are added.

Sys.setlocale("LC_CTYPE", "C.UTF-8") # scan()/read.csv() mis-tokenize UTF-8 text under a C/POSIX locale

labels_dir <- file.path("data-raw", "labels")

read_csv_bom <- function(path) {
  ## colClasses = "character" throughout -- filecode ("011") and value_raw
  ## ("-2") must not be auto-coerced to numeric, which would silently drop
  ## leading zeros / reformat them.
  utils::read.csv(
    path, fileEncoding = "UTF-8-BOM", stringsAsFactors = FALSE,
    check.names = FALSE, na.strings = "", colClasses = "character"
  )
}

## Splits `s` on top-level commas only (ignores commas nested inside
## parentheses, e.g. the "yes, ƒ 300-400" label of one wave-group must stay
## whole). Returns a character vector of the comma-separated pieces.
split_top_level <- function(s) {
  depth <- 0L
  starts <- 1L
  breaks <- integer(0)
  chars <- strsplit(s, "", fixed = TRUE)[[1]]
  for (i in seq_along(chars)) {
    ch <- chars[[i]]
    if (ch == "(") depth <- depth + 1L
    else if (ch == ")") depth <- depth - 1L
    else if (ch == "," && depth == 0L) breaks <- c(breaks, i)
  }
  bounds <- c(0L, breaks, nchar(s) + 1L)
  pieces <- character(length(bounds) - 1L)
  for (i in seq_along(pieces)) {
    pieces[[i]] <- substr(s, bounds[[i]] + 1L, bounds[[i + 1L]] - 1L)
  }
  trimws(pieces)
}

## Normalizes a label for *equality* comparison only: lowercase, the
## standalone abbreviation "na" -> "not available" (a well-attested,
## corpus-wide convention -- e.g. per-wave rows say "na, wrong skip"
## where the harmonized/Z-wave row says "not available, wrong skip" --
## not a guess), collapsed whitespace, and stripped leading/trailing
## punctuation. Deliberately *not* a fuzzy/token-overlap similarity: a
## first attempt at that (allowing e.g. "yes, with difficulty" to match
## "yes, with much difficulty", or "no exertion: pain legs" to match "no
## exertion: chest pain", or "light exertion" to match "heavy exertion")
## turned out to accept real, meaningful differences that merely shared
## most of their boilerplate wording -- exactly the failure mode this
## review file exists to avoid. Two labels are only ever treated as "the
## same" here when they are the same after this narrow normalization.
normalize_label <- function(label) {
  lower <- tolower(label)
  lower <- gsub("\\bna\\b", "not available", lower)
  lower <- gsub("[[:space:]]+", " ", lower)
  trimws(lower, whitespace = "[ \t\r\n[:punct:]]")
}

## `candidate` (the majority group's label) is only safe to propose as
## `solution` if it is the *same label* (per normalize_label()) as every
## other wave-group's label -- i.e. the "conflict" was actually just a
## formatting artifact (casing, whitespace, "na" vs "not available"), not
## a real difference in meaning. Any other difference blanks the whole
## conflict for manual review, rather than guessing which reading is
## right.
is_safe_majority <- function(candidate_label, other_labels) {
  target <- normalize_label(candidate_label)
  all(vapply(other_labels, function(other) normalize_label(other) == target, logical(1)))
}

## Parses one "Cross-wave coding conflict: <code> differs for <waves1>
## (<label1>), <waves2> (<label2>), ..." note into the label used by the
## largest wave-group (by wave count, waves split on "/"), but only when
## that label doesn't contradict any other group's label (see
## is_safe_majority()). Returns NA if the note doesn't match the expected
## shape, on a tie for largest group, or when the majority label isn't
## safe relative to the others.
propose_majority_label <- function(note) {
  if (is.na(note) || !startsWith(note, "Cross-wave coding conflict:")) return(NA_character_)
  rest <- sub("^Cross-wave coding conflict:\\s*\\S+\\s+differs for\\s+", "", note)
  groups <- split_top_level(rest)

  parsed <- lapply(groups, function(g) {
    m <- regmatches(g, regexec("^(.*?)\\s*\\((.*)\\)$", g))[[1]]
    if (length(m) != 3L) return(NULL)
    list(waves = trimws(strsplit(m[[2]], "/", fixed = TRUE)[[1]]), label = m[[3]])
  })
  parsed <- Filter(Negate(is.null), parsed)
  if (length(parsed) == 0L) return(NA_character_)

  n_waves <- vapply(parsed, function(p) length(p$waves), integer(1))
  best <- which(n_waves == max(n_waves))
  if (length(best) != 1L) return(NA_character_) # tie: leave for manual review

  candidate <- parsed[[best]]$label
  other_labels <- vapply(parsed[-best], function(p) p$label, character(1))
  if (!is_safe_majority(candidate, other_labels)) return(NA_character_)
  candidate
}

value_files <- sort(list.files(labels_dir, pattern = "^lasa_value_labels_.*\\.csv$", full.names = TRUE))
cat(length(value_files), "value-label CSV(s) to scan\n")

conflict_rows <- vector("list", length(value_files))
for (i in seq_along(value_files)) {
  df <- read_csv_bom(value_files[[i]])
  conflict_rows[[i]] <- df[!is.na(df$conflicts) & nzchar(df$conflicts), , drop = FALSE]
}
conflicts <- do.call(rbind, conflict_rows)
conflicts <- conflicts[order(conflicts$filecode, conflicts$canonical_name, conflicts$wave), , drop = FALSE]
rownames(conflicts) <- NULL

conflicts$solution <- vapply(conflicts$conflicts, propose_majority_label, character(1))

out_path <- file.path(labels_dir, "lasa_value_label_conflicts.csv")
utils::write.csv(conflicts, out_path, row.names = FALSE, na = "")

cat(
  "\nWrote", out_path, "\n",
  " total conflicting rows:", nrow(conflicts), "\n",
  " with a proposed solution:", sum(!is.na(conflicts$solution)), "\n",
  " needing manual review (blank solution):", sum(is.na(conflicts$solution)), "\n"
)
