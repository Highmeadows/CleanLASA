# Is a codebook's value-label map made up only of missing-reason codes?

Default numeric-eligibility classifier shared by every
`apply_*_labels()` function's
[`.lasa_label_engine()`](https://highmeadows.github.io/CleanLASA/reference/dot-lasa_label_engine.md)
instance (see below). A variable qualifies for `to_numeric` restoration
when every one of its codebook value labels is a negative code (e.g. -1,
-2, -3), which is how this package's LASA codebooks mark
count/continuous variables whose only labelled values are missing-reason
codes.

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

## Details

Some file-specific implementations use a stricter or looser rule (for
example, requiring the label text itself to look like a missing-reason
label) and supply their own function of the same signature to
`.lasa_label_engine(is_codebook_numeric = ...)` instead of this default.
