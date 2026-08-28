# Open LASA variable information

Searches the package's bundled LASA topic database (see
[`lasa_topics()`](https://highmeadows.github.io/CleanLASA/reference/lasa_topics.md))
to resolve a file code or topic name, then scrapes the [LASA topic
overview](https://lasa-vu.nl/en/topic-table/) live to find and open
either the variable-information PDF LASA links for it, or its LASA topic
webpage (see `target`). The documentation is opened from the LASA
website; no PDF files are read from or bundled with the package. The
live lookup is cached (in-session and on disk); `refresh = TRUE`
rebuilds it from the live site first.

## Usage

``` r
lasa_var_info(
  filecode,
  open = interactive(),
  target = c("pdf", "varinfo", "web", "webpage"),
  fuzzy_match = TRUE,
  max_edit_distance = 2L,
  refresh = FALSE
)
```

## Arguments

- filecode:

  A single LASA file code, data-file name, or topic name, such as
  `"046"`, `"LASA046"`, `"LASA 046"`, `"lasa_046"`, or
  `"Physical activity"`.

- open:

  Logical. Should the document be opened? The default is `TRUE` in an
  interactive R session and `FALSE` otherwise. If `FALSE`, the URL is
  returned without being opened. When opened, it is always opened in the
  system's default web browser – the RStudio Viewer does not render
  hosted PDFs/HTML reliably, so it is not used here.

- target:

  Which document to resolve and open: `"pdf"`/`"varinfo"` (the default)
  for the variable-information PDF, or `"web"`/`"webpage"` for the
  topic's LASA webpage. Matched case-insensitively; also accepts
  `"doc"`/`"documentation"` as further aliases for the PDF and
  `"website"`/`"browser"`/`"online"` for the webpage. See Details for
  the pdf-not-found detour to the webpage.

- fuzzy_match:

  Logical. If `TRUE`, allow small typographical errors in topic names.

- max_edit_distance:

  Maximum edit distance allowed for fuzzy topic-name matching.

- refresh:

  Logical. If `TRUE`, refresh the cached varinfo/webpage-link lookup
  before searching it.

## Value

Invisibly returns the HTTPS URL of the matched document (the
variable-information PDF, or the LASA topic webpage).

## Details

`filecode` may be a LASA file code, a LASA data-file name, or a topic
name. File-code matching ignores case, spaces, underscores, hyphens, an
optional `"LASA"` prefix, and common file suffixes. Topic matching is
case-insensitive and accepts incomplete names. Small typographical
errors are accepted when `fuzzy_match = TRUE`.

`target` selects which LASA document to resolve and open, matched
case-insensitively: `"pdf"`/`"varinfo"` (also `"doc"`/`"documentation"`)
for the variable-information PDF (the default), or `"web"`/`"webpage"`
(also `"website"`/`"browser"`/`"online"`) for the matched topic's LASA
webpage (e.g. `https://lasa-vu.nl/topics/physical-activity/`). Not every
file code has a linked PDF (`has_varinfo = FALSE` in
[`lasa_topics()`](https://highmeadows.github.io/CleanLASA/reference/lasa_topics.md)'s
output); when `target` resolves to the PDF but none is linked, this
automatically detours to the topic's webpage instead, printing a message
explaining why. There is no detour in the other direction: if `target`
is the webpage and none can be resolved, that is an error.

## Examples

``` r
if (FALSE) { # \dontrun{
lasa_var_info("046")
lasa_var_info("LASA046")
lasa_var_info("LASA 046")
lasa_var_info("lasa_046")
lasa_var_info("Physical activity")
lasa_var_info("physical act")

# Open the topic's LASA webpage instead of the PDF
lasa_var_info("046", target = "web")

# Retrieve the URL without opening the document
url <- lasa_var_info("046", open = FALSE)
} # }
```
