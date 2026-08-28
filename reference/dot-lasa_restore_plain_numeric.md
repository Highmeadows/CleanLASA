# Restore a value-labelled variable to plain numeric

Shared `to_numeric = TRUE` transformation used by
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)'s
engine. Strips any value-label attributes and coerces `x` to an ordinary
numeric vector, replacing every negative observed value with `NA` –
including a negative code the codebook did not explicitly label.

## Usage

``` r
.lasa_restore_plain_numeric(x)
```

## Arguments

- x:

  A (possibly value-labelled) vector.

## Value

A plain numeric vector, the same length as `x`, with negative values
replaced by `NA_real_`.
