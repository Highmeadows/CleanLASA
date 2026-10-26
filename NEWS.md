# CleanLASA 1.0.0

First stable release.

## New features

* `transform_lasa_data()` reshapes LASA data between wide format (one row
  per respondent, as in Z files) and long format (one row per respondent
  per wave). Long format has a `Wave` column and a `Time` column that
  counts waves from each respondent's own cohort baseline (B, 2B, 3B, MB
  or 4B). Merged and stacked files work too.
* `read_lasa_sav(format_as_long = TRUE)` returns a file in long format
  straight away.
* Wide output can name columns by wave (`prefix = "Wave"`) or by time
  since baseline (`prefix = "Time"`). Time-prefixed data carries a
  `cohort` column that merges with `LASAZ002.sav`'s.
* Cross-wave Z files such as `LASAZOA1.sav` are now labelled and
  converted to factors.

## Missing values

* The new `keep_user_na` argument decides what happens to missing-value
  codes, and it does the same thing for every variable type. With
  `FALSE` (the default), every missing code becomes `NA`. With `TRUE`,
  every missing code is kept, as label text or as a declared-missing
  `haven_labelled_spss` value. `user_na` is deprecated: a supplied value
  is used as `keep_user_na`, with a warning.
* Discrete negative codes are always treated as missing, even when the
  label sounds substantive (e.g. "never had job" or "valid score").
  Variables whose genuine values can be negative (e.g. dB thresholds)
  keep those values. The label database marks them with
  `can_be_negative`.

## Label database

* Fixed many gaps and errors in the bundled label database, including
  the ones reported in #18.
* "na, see ..." routing labels now name only the referenced variable.
* Codes that have no wording are named after their number. Listed
  values of numeric variables that have no wording are dropped.
* The bundled database is now found even without `library(CleanLASA)`.

## Package

* Now requires R 4.0.0 or later.
* The introduction vignette is now built as a proper package vignette.
