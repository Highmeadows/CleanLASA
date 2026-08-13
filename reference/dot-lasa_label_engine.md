# Build a shared column-matching / labelling / reshaping engine

Internal constructor used by every `apply_*_labels()` function in this
package (see
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md)
for the canonical implementation). Centralizes the generic,
file-independent parts of a LASA labelling function – column matching,
value/variable-label attachment, the `to_factor`/`to_numeric` reshape,
original-value-coding preservation, the
`standardize_names`/`split_wavecode` renaming and `"LASA_wave"` column
insertion, `"respnr"` standardization, and the `"label_report"` matching
audit – so file-specific `apply_*_labels()` implementations only need to
supply their own wave-specific variable names, labels, and value-label
maps.

## Usage

``` r
.lasa_label_engine(
  data,
  wave,
  prefix,
  fn_name,
  name_corrections = NULL,
  to_factor = FALSE,
  to_numeric = FALSE,
  standardize_names = FALSE,
  split_wavecode = FALSE,
  is_codebook_numeric = .lasa_is_codebook_numeric
)
```

## Arguments

- data:

  A data frame or tibble to label.

- wave:

  Character scalar: the LASA wave code (already upper-cased by the
  caller), used to fill the `"LASA_wave"` column when `split_wavecode`
  applies.

- prefix:

  Character scalar: the wave-specific lowercase variable-name prefix
  (e.g. `"b"`), used to build each variable's expected column name as
  `paste0(prefix, suffix)`.

- fn_name:

  Character scalar: the calling function's name (e.g.
  `"apply_lasa046_labels"`), used in error messages.

- name_corrections, to_factor, to_numeric, standardize_names,
  split_wavecode:

  The five shared reshaping arguments documented at the top of this
  file. Already validated by the caller.

- is_codebook_numeric:

  Function of one argument (a value-label map) returning `TRUE` when a
  variable so labelled qualifies for `to_numeric` restoration. Defaults
  to
  [`.lasa_is_codebook_numeric()`](https://highmeadows.github.io/CleanLASA/reference/dot-lasa_is_codebook_numeric.md);
  a file-specific implementation may supply a stricter/looser rule.

## Value

A list with two functions:

- `label_variable(suffix, variable_label, value_label_map = NULL, force_numeric = NULL)`
  – matches, labels, and (if requested) reshapes one column.
  `force_numeric` overrides `is_codebook_numeric()`'s auto-detection for
  this call when not `NULL` (`TRUE`/`FALSE`), for variables whose
  numeric/categorical nature cannot be inferred from their value-label
  map alone.

- `finalize()` – standardizes `"respnr"`, applies queued renames,
  inserts `"LASA_wave"` when applicable, attaches the `"label_report"`
  attribute, and returns the finished data. Call this once, in place of
  a hand-written `finalize_labelled_data()`.

## Details

A typical file-specific implementation looks like:

    apply_lasaXXX_labels <- function(data, wave, name_corrections = NULL,
                                      to_factor = FALSE, to_numeric = FALSE,
                                      standardize_names = FALSE,
                                      split_wavecode = FALSE) {
      wave <- toupper(wave)
      prefix <- ...                       # derive from wave, file-specific

      engine <- .lasa_label_engine(
        data = data, wave = wave, prefix = prefix,
        fn_name = "apply_lasaXXX_labels",
        name_corrections = name_corrections, to_factor = to_factor,
        to_numeric = to_numeric, standardize_names = standardize_names,
        split_wavecode = split_wavecode
      )
      label_variable <- engine$label_variable

      label_variable("suffix1", "Variable label", value_label_map)
      ...                                  # remaining wave-specific variables

      engine$finalize()
    }
