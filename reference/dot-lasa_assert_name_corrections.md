# Assert that a value is a valid `name_corrections` argument

Shared validator for the `name_corrections` argument used by
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
and
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md).
A valid `name_corrections` is either `NULL`, or a named character vector
mapping canonical LASA variable suffixes to the actual column names
found in a user's data, for example `c(lphya08 = "BLPYA08")`.

## Usage

``` r
.lasa_assert_name_corrections(x)
```

## Arguments

- x:

  The value to check.

## Value

Invisibly `NULL`. Called for its side effect of raising an error when
`x` is neither `NULL` nor a validly named character vector.
