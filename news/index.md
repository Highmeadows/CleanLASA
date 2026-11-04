# Changelog

## CleanLASA (development version)

### Missing values

- `keep_user_na = TRUE` now keeps a missing-value code with its own
  label, declared SPSS user-missing, for every variable: the informative
  label (e.g. `-2` = “institution”) stays in the data but counts as
  missing ([`is.na()`](https://rdrr.io/r/base/NA.html)). A `to_factor`
  variable comes out as a `haven_labelled_spss` vector of label text
  instead of a factor with the missing reasons as levels (a factor can’t
  mark a level missing).
  [`labelled::to_factor()`](https://larmarange.github.io/labelled/reference/to_factor.html)
  turns it into that factor; `labelled::to_factor(user_na_to_na = TRUE)`
  into one without them
  ([\#27](https://github.com/Highmeadows/CleanLASA/issues/27)).
- With `standardize`, a missing-value code whose meaning differs between
  waves keeps its code for the meaning the documentation introduced
  first; a later meaning moves to the code another wave gives it, or
  else to a free code (`-9`, then `-99`, `-98`, …). For example, 272’s
  `-4` is “short version” in wave C and “do not know” from D on, which
  now reads as `-9`
  ([\#27](https://github.com/Highmeadows/CleanLASA/issues/27)).
- Harmonized missing codes are labelled with what the waves say (e.g.
  “na, see MOVED”, “institution”), no longer with a label made up to
  cover several reasons (“not available, routing”, “response
  unavailable”)
  ([\#27](https://github.com/Highmeadows/CleanLASA/issues/27)).

### Value labels

- A variable whose answer labels differ between waves (e.g. 161’s
  remarks, `1 = "no"` in C but `1 = "yes"` in 2B) is now `var_type`
  “text”: with `standardize` it reads as a factor whose levels are every
  wave’s answers, the same at every wave, or as plain text with
  `to_factor = FALSE`. Its harmonized labels no longer join several
  waves’ labels (“no / yes”). Without `standardize`, every variable gets
  its own wave’s labels, as a factor with `to_factor`
  ([\#27](https://github.com/Highmeadows/CleanLASA/issues/27)).
- Codes that share a label, such as z004 `anation`’s 19 and 23
  (“Italian”), are now one factor level instead of “Italian \[19\]” and
  “Italian \[23\]”
  ([\#27](https://github.com/Highmeadows/CleanLASA/issues/27)).
- A text variable’s code that its wave doesn’t label falls back to the
  harmonized label (e.g. 035 `hart14` at wave B)
  ([\#27](https://github.com/Highmeadows/CleanLASA/issues/27)).
- Categorical items typed numeric are now categorical: 035 `incon9`,
  `incon10`, `cva02`, `cva02b`, `hart06`, `kneep5`, `kneep9`; 161
  `mgriplp3`/`4`, `mgriprp3`/`4`, `mweightp7`, `rm161`; 033 `health3`,
  `health4`; 045 `erh`, `sych`; 154 `msmokecigpnw`; 158 `mpeakfc`; 184
  `mmilka50y`, `mmilkb25y`; 435 `xcara07`, `xcara08`, `xcva02`,
  `xdiabe12`, `xhart06`, `xhart11`. z004 `aedu` stays numeric: it is
  years of education, and its labels name each number of years’ level
  ([\#27](https://github.com/Highmeadows/CleanLASA/issues/27)).
- The label database has a new table, `value_labels_crosswalk`, listing
  how a wave’s codes read under `standardize`.

## CleanLASA 1.0.0

First stable release.

### New features

- [`transform_lasa_data()`](https://highmeadows.github.io/CleanLASA/reference/transform_lasa_data.md)
  reshapes LASA data between wide format (one row per respondent, as in
  Z files) and long format (one row per respondent per wave). Long
  format has a `Wave` column and a `Time` column that counts waves from
  each respondent’s own cohort baseline (B, 2B, 3B, MB or 4B). Merged
  and stacked files work too.
- `read_lasa_sav(format_as_long = TRUE)` returns a file in long format
  straight away.
- Wide output can name columns by wave (`prefix = "Wave"`) or by time
  since baseline (`prefix = "Time"`). Time-prefixed data carries a
  `cohort` column that merges with `LASAZ002.sav`’s.
- Cross-wave Z files such as `LASAZOA1.sav` are now labelled and
  converted to factors.

### Missing values

- The new `keep_user_na` argument decides what happens to missing-value
  codes, and it does the same thing for every variable type. With
  `FALSE` (the default), every missing code becomes `NA`. With `TRUE`,
  every missing code is kept, as label text or as a declared-missing
  `haven_labelled_spss` value. `user_na` is deprecated: a supplied value
  is used as `keep_user_na`, with a warning.
- Discrete negative codes are always treated as missing, even when the
  label sounds substantive (e.g. “never had job” or “valid score”).
  Variables whose genuine values can be negative (e.g. dB thresholds)
  keep those values. The label database marks them with
  `can_be_negative`.

### Label database

- Fixed many gaps and errors in the bundled label database, including
  the ones reported in
  [\#18](https://github.com/Highmeadows/CleanLASA/issues/18).
- “na, see …” routing labels now name only the referenced variable.
- Codes that have no wording are named after their number. Listed values
  of numeric variables that have no wording are dropped.
- The bundled database is now found even without
  [`library(CleanLASA)`](https://highmeadows.github.io/CleanLASA/).

### Package

- Now requires R 4.0.0 or later.
- The introduction vignette is now built as a proper package vignette.
