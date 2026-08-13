# Search the LASA topic table

Retrieves the topic overview from the LASA website and returns topics,
file codes, and available waves. The table is built from the live site
the first time it is needed, then cached - both for the rest of the
current R session and on disk, so it does not have to be rebuilt every
session. Use `refresh = TRUE` to check the live site for anything new (a
new wave, a corrected file code, a newly added topic) instead of using
the cache. To get the linked variable-information PDF for a topic or
file code, use
[`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md).

## Usage

``` r
lasa_topics(
  topic = "all",
  theme = NULL,
  fuzzy_match = TRUE,
  max_edit_distance = 2L,
  refresh = FALSE
)
```

## Arguments

- topic:

  A topic search term. Use `"all"` (the default) to return every topic,
  optionally within the selected `theme` or subtheme.

- theme:

  An optional theme or subtheme search term, such as `"cognitive"` or
  `"memory"`.

- fuzzy_match:

  Logical. If `TRUE`, allow fuzzy matching.

- max_edit_distance:

  Maximum edit distance used for fuzzy matching.

- refresh:

  Logical. If `TRUE`, ignore the cached topic table (both the in-session
  and on-disk cache) and rebuild it from the LASA website.

## Value

A data frame with one row per topic and file-code combination. It
contains `theme`, `subtheme`, `topic`, `filecode`, `waves`, and
`has_varinfo`, which indicates whether a variable-information PDF is
linked for that row; use
[`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md)
to get or open it.

## Details

Topic, theme, and subtheme matching is case-insensitive. Incomplete
names and small typographical errors are accepted when
`fuzzy_match = TRUE`. Supplying `theme` searches both the main LASA
themes and their subthemes.

Some LASA topics are documented with several related file codes on one
row of the topic table, such as a main file, a telephone-interview
version, or a longitudinally cleaned version. When the LASA site's own
label for the row spells these out (for example "Self-report of chronic
diseases - tel. proxy - tel. respondent"), each file code is returned
with only the part of the label that describes it (e.g.
`"Self-report of chronic diseases - tel. proxy"` for the proxy-interview
file code) rather than the full combined label repeated for every code.
Splitting prefers the row's own column layout and falls back to the LASA
file-code numbering convention (0/1 = main face-to-face file, 2/3 =
processed or derived file, 4/5 = longitudinally cleaned or revised file,
6 = telephone interview with a proxy, 7 = telephone interview with the
respondent); when a single file code covers several qualifiers on its
own (nothing to disambiguate), the full descriptive list is dropped in
favor of the plain base topic name.

A small number of rows need information that is not present in the
compact topic-table text at all - it lives in a file code's own
variable-information PDF, its topic page's prose, or specific domain
knowledge - and no scraper can derive that from the table alone. Those
rows carry a curated, documented correction (see
`data-raw/lasa_topic_overrides.R` in the package source for the full
list and the reasoning behind each one). This curation is applied every
time the table is built, independently of `refresh`.

## Examples

``` r
if (FALSE) { # \dontrun{
lasa_topics()
lasa_topics(topic = "Physical")
lasa_topics(topic = "physical act")
lasa_topics(theme = "cognitive")
lasa_topics(theme = "memory")
lasa_topics(refresh = TRUE)
} # }
```
