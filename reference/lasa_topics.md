# Search the LASA topic table

Searches the package's bundled LASA topic database and returns topics,
file codes, and available waves. This table is hand-maintained (see
`data-raw/lasa_topic_database.R` in the package source) rather than
scraped, so it updates only when the package itself does. To get the
linked variable-information PDF for a topic or file code – resolved live
from the LASA website – use
[`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md).

## Usage

``` r
lasa_topics(topic = "all", theme = NULL, fuzzy_match = TRUE, max_edit_distance = 2L)
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

A topic with no file code yet (e.g. a planned but not-yet-released
measure), or a file code with no linked variable-information PDF, is
still included in the result – `filecode` is `NA` and/or `has_varinfo`
is `FALSE` for that row, rather than the row being dropped.

To add a new topic or file code to this table, or to update which waves
an existing file code is available in (e.g. a newly released wave), edit
`data-raw/lasa_topic_database.R` directly and re-run it.

## Examples

``` r
lasa_topics()
#> Error in .lasa_topic_database(): object 'lasa_topic_database' not found
lasa_topics(topic = "Physical")
#> Error in .lasa_topic_database(): object 'lasa_topic_database' not found
lasa_topics(topic = "physical act")
#> Error in .lasa_topic_database(): object 'lasa_topic_database' not found
lasa_topics(theme = "cognitive")
#> Error in .lasa_topic_database(): object 'lasa_topic_database' not found
lasa_topics(theme = "memory")
#> Error in .lasa_topic_database(): object 'lasa_topic_database' not found
```
