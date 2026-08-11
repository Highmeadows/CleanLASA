# Search the LASA topic table

Retrieves the live topic overview from the LASA website and returns
topics, file codes, available waves, and links to variable-information
PDFs. The table is cached for the remainder of the current R session.

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

  Logical. If `TRUE`, ignore the topic table cached during the current R
  session and retrieve it again from the LASA website.

## Value

A data frame with one row per topic and file-code combination. It
contains `theme`, `subtheme`, `topic`, `filecode`, `waves`,
`has_varinfo`, `varinfo_url`, and `topic_url`.

## Details

Topic, theme, and subtheme matching is case-insensitive. Incomplete
names and small typographical errors are accepted when
`fuzzy_match = TRUE`. Supplying `theme` searches both the main LASA
themes and their subthemes.

## Examples

``` r
if (FALSE) { # \dontrun{
lasa_topics()
lasa_topics(topic = "Physical")
lasa_topics(topic = "physical act")
lasa_topics(theme = "cognitive")
lasa_topics(theme = "memory")
} # }
```
