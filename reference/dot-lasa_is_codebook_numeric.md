# Is a codebook's value-label map made up only of missing-reason codes?

A variable qualifies for `to_numeric` restoration when every one of its
codebook value labels is a negative code (e.g. -1, -2, -3), which is how
this package's LASA codebooks mark count/continuous variables whose only
labelled values are missing-reason codes. Used by
`data-raw/build_lasa_label_db.R`'s `var_type` classification
(`"numeric"` vs. `"categorical"`), stored in
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)
rather than re-derived at label-application time.

## Usage

``` r
.lasa_is_codebook_numeric(value_label_map)
```

## Arguments

- value_label_map:

  A named numeric vector of SPSS value labels (names = label text,
  values = numeric codes), or `NULL`.

## Value

`TRUE` if `value_label_map` is non-empty and every code in it is
negative; `FALSE` otherwise.
