# Convert a value-labelled variable to a factor

Shared `to_factor = TRUE` transformation used by
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)'s
engine. Converts `x` to a factor using `value_label_map`'s names as
level text for coded values; an observed value with no codebook label,
or a code the codebook lists without wording (an `NA` label), keeps its
own numeric code (as text) as its level, rather than becoming `NA`.
Colliding level text (e.g. two different codes that happen to share a
label) is disambiguated by appending the numeric code in brackets.

## Usage

``` r
.lasa_convert_to_labelled_factor(
  x,
  value_label_map,
  missing_codes = numeric(0),
  keep_user_na = TRUE
)
```

## Arguments

- x:

  A (possibly value-labelled) vector.

- value_label_map:

  A named numeric vector of SPSS value labels (names = label text,
  values = numeric codes).

- missing_codes:

  Numeric vector of the codes that count as missing for this variable.

- keep_user_na:

  Logical: keep missing codes as levels (`TRUE`) or turn them into `NA`
  (`FALSE`).

## Value

A factor the same length as `x`.

## Details

With `keep_user_na = FALSE`, every code in `missing_codes` becomes `NA`
and gets no level of its own; with `keep_user_na = TRUE`, missing codes
are ordinary levels carrying their label text.
