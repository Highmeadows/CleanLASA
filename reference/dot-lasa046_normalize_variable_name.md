# Normalize a LASA 046 variable name for matching

Internal helper used to compare LASA variable names case-insensitively
and while ignoring punctuation such as underscores. It does not rename
columns; canonical renaming is handled by
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md)
when `standardize_names = TRUE`.

## Usage

``` r
.lasa046_normalize_variable_name(x)
```

## Arguments

- x:

  Character vector of variable names.

## Value

Lowercase alphanumeric character vector.
