# Resolve a LASA varinfo PDF for a file code (or explicit URL)

Resolve a LASA varinfo PDF for a file code (or explicit URL)

## Usage

``` r
.lasa_resolve_varinfo_url(filecode = NULL, url = NULL)
```

## Arguments

- filecode:

  Optional LASA file code (e.g. `"046"`, `"z004"`, `"zoa1"`), matched
  via the same normalization
  [`lasa_topics()`](https://highmeadows.github.io/CleanLASA/reference/lasa_topics.md)
  uses internally. A bare group prefix that isn't itself a documented
  file code (e.g. `"zoa"` when only `"zoa1"`/`"zoa2"`/`"zoa3"` are
  documented, but all three share one PDF) also resolves, as long as
  it's unambiguous.

- url:

  Optional explicit HTTPS URL (or local path). When supplied, `filecode`
  is not looked up at all – resolution is bypassed entirely.

## Value

A list with `filecodes` (character vector: every normalized file code
documented by this PDF, including the requested one), `varinfo_url`
(HTTPS URL, or `NA_character_` when only resolved via the offline
manifest – see `varinfo_file`), `varinfo_file` (the PDF's own file name,
always available), and `source` (`"explicit"`, `"online"`, or
`"offline"`).
