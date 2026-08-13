# Insert the generic "LASA_wave" column

Internal helper shared by every `apply_*_labels()` function in this
package. Used when `split_wavecode = TRUE` (which is always the
effective setting when `standardize_names = TRUE`, per the shared
parameter contract – see the header comment of this file). Adds a
`"LASA_wave"` column filled with `wave`, positioned immediately after
the respondent-number column identified by
[`.lasa_standardize_respnr()`](https://highmeadows.github.io/CleanLASA/reference/dot-lasa_standardize_respnr.md).
If that column could not be found, `"LASA_wave"` is inserted at the very
front of `data` instead.

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

  The name of the respondent-number column in `data`, as returned by
  [`.lasa_standardize_respnr()`](https://highmeadows.github.io/CleanLASA/reference/dot-lasa_standardize_respnr.md),
  or `NA_character_` if none was found.

## Value

`data` with a new `"LASA_wave"` column inserted.
