# Assert that a value is a single, non-missing TRUE/FALSE

Small internal validator shared by the argument-checking code in this
file and by every `apply_*_labels()` function in the package, so the
same error message format is used everywhere a scalar logical argument
(such as `to_factor`, `to_numeric`, or `fuzzy_matching`) is required.

## Usage

``` r
.lasa_assert_scalar_logical(x, name)
```

## Arguments

- x:

  The value to check.

- name:

  Character scalar: the argument name to use in the error message.

## Value

Invisibly `NULL`. Called for its side effect of raising an error when
`x` is not a scalar logical.
