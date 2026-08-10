# Assert that a value is a single, non-missing TRUE/FALSE

Small internal validator shared by the argument-checking code in this
file, so the same error message format is used everywhere a scalar
logical argument is required.

## Usage

``` r
.lasa_validate_scalar_logical(x, name)
```

## Arguments

- x:

  The value to check.

- name:

  Character scalar: the argument name to use in the error message.

## Value

Invisibly `NULL`. Called for its side effect of raising an error when
`x` is not a scalar logical.
