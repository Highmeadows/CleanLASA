# Open LASA variable information

Searches the [LASA topic overview](https://lasa-vu.nl/en/topic-table/)
and opens the variable-information PDF linked by LASA. The documentation
is opened from the LASA website; no PDF files are read from or bundled
with the package. The underlying topic table is cached the same way as
in
[`lasa_topics()`](https://highmeadows.github.io/CleanLASA/reference/lasa_topics.md)
(in-session and on disk); `refresh = TRUE` rebuilds it from the live
site first.

## Usage

``` r
lasa_var_info(
  filecode,
  viewer = c("auto", "rstudio", "system"),
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

- viewer:

  Where to open the PDF. One of `"auto"`, `"rstudio"`, or `"system"`.
  `"auto"` uses the system's webbrowser as PDF viewer.

- open:

  Logical. Should the PDF be opened? The default is `TRUE` in an
  interactive R session and `FALSE` otherwise. If `FALSE`, the URL is
  returned without being opened.

- fuzzy_match:

  Logical. If `TRUE`, allow small typographical errors in topic names.

- max_edit_distance:

  Maximum edit distance allowed for fuzzy topic-name matching.

- refresh:

  Logical. If `TRUE`, refresh the cached LASA topic table before
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
