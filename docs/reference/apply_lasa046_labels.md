# Apply LASA 046 variable labels, value labels, and optional harmonisation

Applies metadata documented for LASA file 046 (LAPAQ / Physical
activity) to a single LASA wave data set. The function is designed for
data imported from SPSS with
[`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html)
but can be used on an equivalent data frame or tibble already present in
R.

## Usage

``` r
apply_lasa046_labels(
  data,
  wave,
  fuzzy_match = TRUE,
  max_edit_distance = 1L,
  name_corrections = NULL,
  warn_unmatched = TRUE,
  to_factor = FALSE,
  to_numeric = FALSE,
  standardize_names = FALSE
)
```

## Arguments

- data:

  A data frame or tibble containing one LASA 046 data file.

- wave:

  Character scalar identifying the LASA measurement wave. Supported
  values are `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`, `"G"`, `"H"`,
  `"3B"`, `"MB"`, `"I"`, `"J"`, and `"K"`. Matching is case-insensitive.
  The wave must be supplied explicitly because B, 2B, 3B, and MB all use
  a `b` variable-name prefix while some labels and coding rules differ.

- fuzzy_match:

  Logical scalar. If `TRUE` (default), permit conservative fuzzy
  matching for likely variable-name typing errors after exact,
  case-insensitive, and punctuation-insensitive matching have failed.

- max_edit_distance:

  Non-negative integer giving the maximum edit distance accepted for
  automatic fuzzy matching. Defaults to `1`.

- name_corrections:

  Optional named character vector for explicit variable-name
  corrections. Vector names are canonical LASA suffixes (or `"respnr"`)
  and values are the corresponding column names in `data`, for example
  `c(lphya08 = "BLPYA08", respnr = "RespNrr")`. Explicit corrections
  take precedence over automatic matching.

- warn_unmatched:

  Logical scalar. If `TRUE` (default), issue a warning when an expected
  variable cannot be matched confidently, a match is ambiguous, a manual
  correction fails, or the respondent identifier has to be inferred from
  first-column position. Successful fuzzy matches are reported by
  message and in the audit but do not by themselves trigger this
  warning.

- to_factor:

  Logical scalar. If `FALSE` (default), variables with substantive value
  labels remain numeric/haven-labelled and receive SPSS-style `"labels"`
  attributes. If `TRUE`, those variables are converted to factors using
  the LASA value labels as factor-level labels. Any observed value
  without a codebook value label is retained as its own factor level
  rather than being converted to `NA`.

- to_numeric:

  Logical scalar. If `FALSE` (default), count, duration, and other
  numeric variables retain their documented negative missing-reason
  value labels. If `TRUE`, a variable is treated as substantive numeric
  when every value label documented for it is a negative missing-reason
  code. Such variables are converted to ordinary numeric vectors, every
  observed value below zero is replaced by `NA`, and all non-negative
  values are retained. For these variables `to_numeric = TRUE` takes
  precedence over `to_factor = TRUE`.

- standardize_names:

  Logical scalar. If `FALSE` (default), the original source column names
  are retained. If `TRUE`, every successfully matched LASA 046 variable
  is renamed to the canonical lowercase LASA documentation name for the
  supplied wave (for example `blphya01`, `clphya26`, or `klphya50`) and
  the first-column respondent identifier is renamed `respnr`. Unmatched
  non-046 columns are left unchanged.

## Value

`data` with LASA 046 variable metadata applied and, depending on the
requested options, variables converted to factors/numeric vectors and/or
names harmonised. The object carries the generic attributes
`"label_report"`, `"LASA_wave"`, `"LASA_file_code"`, and
`"LASA_names_standardized"`.

## Details

**Variable-name matching.** Matching proceeds in the following order:

1.  explicit `name_corrections`;

2.  exact name;

3.  case-insensitive exact name;

4.  normalized exact name, ignoring punctuation/underscores;

5.  optionally, a unique fuzzy match within `max_edit_distance`.

Fuzzy matching is deliberately conservative. Correctly formed LASA 046
names belonging to another questionnaire item are protected from being
selected merely because their edit distance is small.

**Respondent number.** The first column is expected to contain the
respondent number. Capitalization and minor spelling variants of
`respnr` are handled by the same matching logic. Because first-column
position is a structural invariant of these files, the first column is
used as a final fallback when its name cannot be matched; this is
flagged in the audit.

**Numeric versus categorical conversion.** `to_numeric` does not simply
convert every labelled variable to numeric. A variable is identified as
a substantive numeric variable only when all of its codebook value
labels are negative missing-reason codes. This distinguishes variables
such as numbers of occasions and minutes from categorical variables
whose substantive codes have labels such as `"no"`, `"yes"`, or sport
categories.

When both `to_factor = TRUE` and `to_numeric = TRUE`,
numeric/count/duration variables become ordinary numeric vectors with
negative codes set to `NA`, while categorical variables become factors.

**Name harmonisation.** Canonical renaming is performed only after all
matching is complete, so changing an earlier column name cannot alter
later matching decisions. The function stops rather than creating
duplicate names if a canonical name would collide with another column.

**Audit and provenance.** The returned object contains a generic
matching audit in `attr(x, "label_report")`. It also receives
`"LASA_wave"`, `"LASA_file_code"`, and `"LASA_names_standardized"`
attributes. These generic names are shared with other future LASA label
implementations and can be inspected through
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md).

## See also

[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md)

## Examples

``` r
dat <- data.frame(
  RespNr = c(101, 102, 103),
  BLPHYA07 = c(1, 2, -1),
  BLPYA08 = c(4, -1, 7)
)

dat <- apply_lasa046_labels(
  dat,
  wave = "B",
  fuzzy_match = TRUE,
  to_factor = TRUE,
  to_numeric = TRUE,
  standardize_names = TRUE,
  warn_unmatched = FALSE
)
#> LASA046: Unique fuzzy match: blphya08 -> BLPYA08 (edit distance 1).

names(dat)[1:3]
#> [1] "respnr"   "blphya07" "blphya08"
levels(dat$blphya07)
#> [1] "na, wrong skip"   "na, see BLPHYA06" "na, asked"        "no"              
#> [5] "yes"             
dat$blphya08
#> [1]  4 NA  7
#> attr(,"label")
#> [1] "Walking outside: #times last two weeks"
lasa_label_report(dat, problems_only = TRUE)
#>     suffix expected matched    method edit_distance standardized_to
#> 1  lphya01 blphya01    <NA> not found            NA            <NA>
#> 2  lphya02 blphya02    <NA> not found            NA            <NA>
#> 3  lphya03 blphya03    <NA> not found            NA            <NA>
#> 4  lphya04 blphya04    <NA> not found            NA            <NA>
#> 5  lphya05 blphya05    <NA> not found            NA            <NA>
#> 6  lphya06 blphya06    <NA> not found            NA            <NA>
#> 7  lphya08 blphya08 BLPYA08     fuzzy             1        blphya08
#> 8  lphya09 blphya09    <NA> not found            NA            <NA>
#> 9  lphya10 blphya10    <NA> not found            NA            <NA>
#> 10 lphya11 blphya11    <NA> not found            NA            <NA>
#> 11 lphya12 blphya12    <NA> not found            NA            <NA>
#> 12 lphya13 blphya13    <NA> not found            NA            <NA>
#> 13 lphya14 blphya14    <NA> not found            NA            <NA>
#> 14 lphya15 blphya15    <NA> not found            NA            <NA>
#> 15 lphya16 blphya16    <NA> not found            NA            <NA>
#> 16 lphya17 blphya17    <NA> not found            NA            <NA>
#> 17 lphya18 blphya18    <NA> not found            NA            <NA>
#> 18 lphya19 blphya19    <NA> not found            NA            <NA>
#> 19 lphya20 blphya20    <NA> not found            NA            <NA>
#> 20 lphya21 blphya21    <NA> not found            NA            <NA>
#> 21 lphya22 blphya22    <NA> not found            NA            <NA>
#> 22 lphya23 blphya23    <NA> not found            NA            <NA>
#> 23 lphya24 blphya24    <NA> not found            NA            <NA>
#> 24 lphya25 blphya25    <NA> not found            NA            <NA>
#> 25 lphya26 blphya26    <NA> not found            NA            <NA>
#> 26 lphya27 blphya27    <NA> not found            NA            <NA>
#> 27 lphya28 blphya28    <NA> not found            NA            <NA>
#> 28 lphya29 blphya29    <NA> not found            NA            <NA>
#> 29 lphya30 blphya30    <NA> not found            NA            <NA>
#> 30 lphya31 blphya31    <NA> not found            NA            <NA>
#> 31 lphya32 blphya32    <NA> not found            NA            <NA>
#> 32 lphya33 blphya33    <NA> not found            NA            <NA>
#> 33 lphya34 blphya34    <NA> not found            NA            <NA>
#> 34 lphya35 blphya35    <NA> not found            NA            <NA>
#> 35 lphya36 blphya36    <NA> not found            NA            <NA>
#> 36 lphya37 blphya37    <NA> not found            NA            <NA>
#> 37 lphya38 blphya38    <NA> not found            NA            <NA>
#> 38 lphya39 blphya39    <NA> not found            NA            <NA>
#> 39 lphya40 blphya40    <NA> not found            NA            <NA>
#> 40 lphya41 blphya41    <NA> not found            NA            <NA>
#> 41 lphya42 blphya42    <NA> not found            NA            <NA>
#> 42 lphya43 blphya43    <NA> not found            NA            <NA>
#> 43 lphya44 blphya44    <NA> not found            NA            <NA>
#> 44 lphya45 blphya45    <NA> not found            NA            <NA>
#> 45 lphya46 blphya46    <NA> not found            NA            <NA>
#>                                                          note problem
#> 1                                                        <NA>    TRUE
#> 2                                                        <NA>    TRUE
#> 3                                                        <NA>    TRUE
#> 4                                                        <NA>    TRUE
#> 5                                                        <NA>    TRUE
#> 6                                                        <NA>    TRUE
#> 7  Unique fuzzy match: blphya08 -> BLPYA08 (edit distance 1).    TRUE
#> 8                                                        <NA>    TRUE
#> 9                                                        <NA>    TRUE
#> 10                                                       <NA>    TRUE
#> 11                                                       <NA>    TRUE
#> 12                                                       <NA>    TRUE
#> 13                                                       <NA>    TRUE
#> 14                                                       <NA>    TRUE
#> 15                                                       <NA>    TRUE
#> 16                                                       <NA>    TRUE
#> 17                                                       <NA>    TRUE
#> 18                                                       <NA>    TRUE
#> 19                                                       <NA>    TRUE
#> 20                                                       <NA>    TRUE
#> 21                                                       <NA>    TRUE
#> 22                                                       <NA>    TRUE
#> 23                                                       <NA>    TRUE
#> 24                                                       <NA>    TRUE
#> 25                                                       <NA>    TRUE
#> 26                                                       <NA>    TRUE
#> 27                                                       <NA>    TRUE
#> 28                                                       <NA>    TRUE
#> 29                                                       <NA>    TRUE
#> 30                                                       <NA>    TRUE
#> 31                                                       <NA>    TRUE
#> 32                                                       <NA>    TRUE
#> 33                                                       <NA>    TRUE
#> 34                                                       <NA>    TRUE
#> 35                                                       <NA>    TRUE
#> 36                                                       <NA>    TRUE
#> 37                                                       <NA>    TRUE
#> 38                                                       <NA>    TRUE
#> 39                                                       <NA>    TRUE
#> 40                                                       <NA>    TRUE
#> 41                                                       <NA>    TRUE
#> 42                                                       <NA>    TRUE
#> 43                                                       <NA>    TRUE
#> 44                                                       <NA>    TRUE
#> 45                                                       <NA>    TRUE
```
