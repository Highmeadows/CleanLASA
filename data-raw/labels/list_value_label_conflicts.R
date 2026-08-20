## Collects every row across data-raw/labels/lasa_value_labels_<filecode>.csv
## whose `conflicts` column is non-empty into one review file,
## data-raw/labels/lasa_value_label_conflicts.csv, with every original
## column plus a `solution` column suggesting a resolution.
##
## Only the "Cross-wave coding conflict: <code> differs for <waves1>
## (<label1>), <waves2> (<label2>), ..." note shape gets an automatic
## `solution`: the label used by the wave-group with the most waves (ties
## are left blank). Every other note shape (a within-wave coding
## ambiguity, an unresolved PDF table/footnote reference, a wave-coverage
## gap, or a variable-type disagreement) needs an actual look at the
## source documentation, so `solution` is left blank for a human to fill
## in -- see the package owner's review of that file for the values that
## should be incorporated back into data-raw/labels/variables_<fc>.R /
## value_label_sets.R.
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

## Parses one "Cross-wave coding conflict: <code> differs for <waves1>
## (<label1>), <waves2> (<label2>), ..." note into the label used by the
## largest wave-group (by wave count, waves split on "/"). Returns NA if
## the note doesn't match the expected shape, or on a tie for largest.
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
  parsed[[best]]$label
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
