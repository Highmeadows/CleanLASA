# Insert the "Wave" column

Internal helper used by
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)'s
engine when `add_wavecode = TRUE` (always the effective setting when
`.standardize_names` is effectively `TRUE`). Adds a `"Wave"` column
filled with `wave`, positioned immediately after the respondent-number
column. If that column could not be matched, `"Wave"` is inserted at the
very front of `data` instead.

## Usage

``` r
.lasa_insert_wave_column(data, wave, respnr_name = NA_character_)
```

## Arguments

- data:

  A data frame or tibble.

- wave:

  Character scalar: the LASA wave code to fill the new column with, e.g.
  `"B"`, `"2B"`, `"3B"`.

- respnr_name:

  The name of the respondent-number column in `data` (its *final*,
  post-rename name), or `NA_character_` if none was matched.

## Value

`data` with a new `"Wave"` column inserted.
