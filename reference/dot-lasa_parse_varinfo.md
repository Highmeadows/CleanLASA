# Parse one LASA varinfo PDF into structured metadata

Parse one LASA varinfo PDF into structured metadata

## Usage

``` r
.lasa_parse_varinfo(path, document_id = NULL)
```

## Arguments

- path:

  Path to a local `*_varinfo.pdf` file.

- document_id:

  Character scalar identifying this document (typically the file stem,
  e.g. `"LASA046_varinfo"`). Defaults to the file's own basename
  (without extension).

## Value

A list with `document` (single-row data frame: `document_id`,
`document_date`, `filecodes`), `variables`, and `value_labels` data
frames (see R/lasa_label_db.R for the full schema these feed into;
`var_type`/`is_missing`/`document_id` etc. are filled in by the caller,
not here – this function only does the positional PDF extraction).
