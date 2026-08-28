# Open LASA variable information

Searches the package's bundled LASA topic database (see
[`lasa_topics()`](https://highmeadows.github.io/CleanLASA/reference/lasa_topics.md))
to resolve a file code or topic name, then scrapes the [LASA topic
overview](https://lasa-vu.nl/en/topic-table/) live to find and open the
variable-information PDF LASA links for it. The documentation is opened
from the LASA website; no PDF files are read from or bundled with the
package. The live lookup is cached (in-session and on disk);
`refresh = TRUE` rebuilds it from the live site first.

## Usage

``` r
lasa_var_info(
  filecode,
  open = interactive(),
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

  Logical. Should the PDF be opened? The default is `TRUE` in an
  interactive R session and `FALSE` otherwise. If `FALSE`, the URL is
  returned without being opened. When opened, it is always opened in the
  system's default web browser – the RStudio Viewer does not render
  hosted PDFs/HTML reliably, so it is not used here.

- fuzzy_match:

  Logical. If `TRUE`, allow small typographical errors in topic names.

- max_edit_distance:

  Maximum edit distance allowed for fuzzy topic-name matching.

- refresh:

  Logical. If `TRUE`, refresh the cached varinfo-link lookup before
  searching it.

## Value

Invisibly returns the HTTPS URL of the matched variable-information PDF.

## Details

`filecode` may be a LASA file code, a LASA data-file name, or a topic
name. File-code matching ignores case, spaces, underscores, hyphens, an
optional `"LASA"` prefix, and common file suffixes. Topic matching is
case-insensitive and accepts incomplete names. Small typographical
errors are accepted when `fuzzy_match = TRUE`.

## Examples

``` r
if (FALSE) { # \dontrun{
lasa_var_info("046")
lasa_var_info("LASA046")
lasa_var_info("LASA 046")
lasa_var_info("lasa_046")
lasa_var_info("Physical activity")
lasa_var_info("physical act")

# Retrieve the URL without opening the PDF
url <- lasa_var_info("046", open = FALSE)
} # }
```
