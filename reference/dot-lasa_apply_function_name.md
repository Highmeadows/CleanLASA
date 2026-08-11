# Determine the label function for a LASA file code

Internal dispatcher implementing the package naming convention for
file-specific label functions.

## Usage

``` r
.lasa_apply_function_name(file_code)
```

## Arguments

- file_code:

  LASA file code, such as `"046"`, `"004"`, `"FI"`, or `"oa1"`.

## Value

Character scalar containing the expected function name.
