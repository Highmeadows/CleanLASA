# Convert a value-labelled variable to a factor

Shared `to_factor = TRUE` transformation used by every
`apply_*_labels()` function's `.lasa_label_engine()` instance. Converts
`x` to a factor using `value_label_map`'s names as level text for coded
values; an observed value with no codebook label keeps its own numeric
code (as text) as its level, rather than becoming `NA`. Colliding level
text (e.g. two different codes that happen to share a label) is
disambiguated by appending the numeric code in brackets.

## Usage

``` r
.lasa_convert_to_labelled_factor(x, value_label_map)
```

## Arguments

- x:

  A (possibly value-labelled) vector.

- value_label_map:

  A named numeric vector of SPSS value labels (names = label text,
  values = numeric codes).

## Value

A factor the same length as `x`.
