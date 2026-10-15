# Restore a value-labelled variable to plain numeric

Shared `to_numeric = TRUE, keep_user_na = FALSE` transformation used by
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)'s
engine. Strips any value-label attributes and coerces `x` to an ordinary
numeric vector, replacing every missing code with `NA`.

## Usage

``` r
.lasa_restore_plain_numeric(x, missing_codes = numeric(0))
```

## Arguments

- x:

  A (possibly value-labelled) vector.

- missing_codes:

  Numeric vector of the codes that count as missing for this variable
  (see `.lasa_missing_codes()`).

## Value

A plain numeric vector, the same length as `x`, with missing codes
replaced by `NA_real_`.
