# CleanLASA introduction

## Overview

`CleanLASA` is designed to make LASA (Longitudinal Aging Study
Amsterdam) SPSS data easier to find, import, document, and prepare for
analysis in R. The package connects three parts of the LASA workflow
that otherwise require substantial manual work:

1.  finding the relevant LASA topic, file code, measurement waves, and
    variable documentation;
2.  importing LASA `.sav` files while applying the correct wave-specific
    variable and value labels; and
3.  auditing, refreshing, or manually correcting the metadata used for
    labelling.

The central import function is
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md).
It identifies the LASA wave and file code from the file name and then
applies metadata from the package’s normalized label database. The same
labelling engine is available separately through
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
when data have already been imported.

A typical workflow is therefore:

``` text
find topic/file code -> inspect LASA documentation -> import .sav file
        -> apply/reshape labels -> inspect matching audit -> analyse data
```

The examples involving LASA data files or the live LASA website are not
run when this vignette is built, because LASA data are not distributed
with the package and website access may not be available during package
installation.

## 1. Find topics, file codes, and waves

Use
[`lasa_topics()`](https://highmeadows.github.io/CleanLASA/reference/lasa_topics.md)
to search the package’s bundled LASA topic database. With no arguments
it returns the complete topic index; searches can instead be restricted
by topic, theme, subtheme, or file code.

``` r

# Browse the complete LASA topic index
lasa_topics()

# Search by topic name; partial and small fuzzy matches are supported
lasa_topics(topic = "physical act")

# Search a theme or subtheme
lasa_topics(theme = "cognitive")
lasa_topics(theme = "memory")

# Search by file code
lasa_topics("011")

# A 3-digit file code also matches processed/scaled variants sharing the
# same final two digits -- this also returns the "245" row
lasa_topics("045")
```

The returned data frame contains one row per topic/file-code
combination, with columns for `theme`, `subtheme`, `topic`, `filecode`,
`waves`, and `has_varinfo`. This makes it possible to identify not only
the relevant file code, but also the waves in which that topic is
available and whether LASA links a variable-information PDF for it. A
topic with no file code yet, or a file code with no linked PDF, still
appears in the result (`filecode` is `NA` and/or `has_varinfo` is
`FALSE`) rather than being dropped.

This table is hand-maintained (see `data-raw/lasa_topic_database.R` in
the package source) rather than scraped, so it updates only when the
package itself does.

## 2. Open the corresponding variable-information PDF or webpage

After identifying a topic or file code,
[`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md)
scrapes the live [LASA topic
overview](https://lasa-vu.nl/en/topic-table/) to resolve either the
variable-information PDF LASA links for it, or its LASA topic webpage
(`target`). It accepts common variations of a file code as well as topic
names.

``` r

# By file code
lasa_var_info("046")
lasa_var_info("LASA046")

# By topic name
lasa_var_info("Physical activity")
lasa_var_info("physical act")

# Open the topic's LASA webpage instead of the PDF (also accepts
# "webpage"/"website"/"browser"/"online", case-insensitively)
lasa_var_info("046", target = "web")

# Retrieve the URL without opening the document
url <- lasa_var_info("046", open = FALSE)

# Force a fresh lookup instead of using the cached link
lasa_var_info("046", refresh = TRUE)
```

By default, an interactive R session opens the PDF in the system’s
default web browser (the RStudio Viewer does not render hosted PDFs
reliably, so it is never used here). Not every file code has a linked
PDF; when that’s the case,
[`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md)
automatically detours to the topic’s LASA webpage instead and prints a
message explaining why – there is no detour in the other direction (a
`target = "web"` request with no resolvable webpage is a normal error).
The underlying link lookup is cached, both for the current R session and
on disk, so it doesn’t have to be rebuilt every session. No LASA
variable-information PDFs are bundled with `CleanLASA`; this function
always resolves the document from the live LASA website.

## 3. Import and label a LASA SPSS file

[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
is the main entry point for analysis data. It reads the file with
[`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
derives the LASA wave and file code from the file name, retrieves the
corresponding metadata from
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md),
and applies variable and value labels.

``` r

# Regular LASA wave: LASA + wave + file code
physical_activity_b <- read_lasa_sav("LASAB046.sav")

# Information stored in a Z file
sex <- read_lasa_sav("LASAZ004.sav")

# Replenishment/migrant-cohort waves use LAS2B/LAS3B/LAS4B/LASMB
physical_activity_3b <- read_lasa_sav("LAS3B046.sav")
```

The filename parser is case-insensitive. Regular single-letter waves
follow `LASA[wave][filecode].sav`; waves `2B`, `3B`, `4B`, and `MB`
follow `LAS[wave][filecode].sav`.

By default, `user_na = TRUE` is passed to
[`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html)
so SPSS user-defined missing codes remain available while labels and
optional conversions are applied. Additional
[`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html)
arguments can be supplied through `read_sav_args`:

``` r

data <- read_lasa_sav(
  "LASAB046.sav",
  read_sav_args = list(encoding = "UTF-8")
)
```

Do not include `file` or `user_na` inside `read_sav_args`; those are
controlled by `path` and `user_na` directly.

After import, the returned object carries LASA provenance attributes for
the wave, file code, and source filename. The labelling audit is stored
separately as the `label_report` attribute.

## 4. Choose how labelled variables are represented

By default,
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)/[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
do all of this at once: categorical variables become factors
(`to_factor`), count/continuous variables are restored to plain numeric
(`to_numeric`), variable names are standardized to their canonical form
and a `"Wave"` column is added (`standardize`, which implies
`add_wavecode`), and harmonized variable/value labels become the active
ones. Each of these can be turned off individually.

``` r

data <- haven::read_sav("LASAB046.sav")
```

``` r

summary(data$blphya01)
#>   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#> -5.000   4.000   4.000   3.476   4.000   4.000

attr(data$blphya01, "labels")
#> Na, interview terminated      Na, short interview           Na, wrong skip
#>                       -5                       -4                       -3
#>                  Na, see                Na, asked     Respondent bedridden
#>                       -2                       -1                        1
#> Respondent in elec. whee Respondent in mech. whee             not 1 2 or 3
#>                        2                        3                        4
```

### Convert labelled categories to factors

`to_factor` defaults to `TRUE`, so documented value labels are
represented as R factor levels without any extra argument:

``` r

data <- read_lasa_sav("LASAB046.sav")
summary(data$lphya01)
#> Na, interview terminated      Na, short interview           Na, wrong skip
#>                       13                      175                        0
#>                  Na, see                Na, asked     Respondent bedridden
#>                        0                        4                       20
#> Respondent in elec. whee Respondent in mech. whee             not 1 2 or 3
#>                        5                       20                     2870

attr(data$lphya01, "labels_wave")
#> Na, interview terminated      Na, short interview           Na, wrong skip
#>                       -5                       -4                       -3
#>                  Na, see                Na, asked     Respondent bedridden
#>                       -2                       -1                        1
#> Respondent in elec. whee Respondent in mech. whee             not 1 2 or 3
#>                        2                        3                        4
```

Observed values that do not have a documented codebook label are
retained as their numeric code (represented as text) rather than
silently converted to `NA`. Set `to_factor = FALSE` to keep the variable
numeric/character instead.

### Variables whose coding is inconsistent across waves

Some variables’ coding genuinely differs by wave – a binary code’s
polarity flipped, or an income variable’s brackets were redefined – so
no single cross-wave value label could be written for them. The label
database marks these `var_type == "text"` and documents no harmonized
value labels at all for them; `to_factor` recodes such a variable to its
wave-specific label text (a character vector) instead of a factor, so
waves whose numeric codes disagree but whose label text agrees
(`0 = "no", 1 = "yes"` in one wave, `1 = "no", 2 = "yes"` in another)
still merge correctly on the text itself.

### Restore count/continuous variables to plain numeric

The label database classifies variables whose codebook contains no
categorical codes (or only negative missing-reason codes) as numeric.
`to_numeric` defaults to `TRUE`: those variables are restored to
ordinary numeric vectors and negative observed codes are converted to
`NA`, with no extra argument needed:

``` r

data <- read_lasa_sav("LASAB046.sav")
summary(data$lphya01)
#>   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#> -5.000   4.000   4.000   3.476   4.000   4.000
```

`to_factor` and `to_numeric` don’t conflict: numeric-classified
variables are restored to numeric while other variables with value-label
maps are represented as factors, in the same call.

### Standardize variable names and separate the wave code

LASA variable names often contain a wave-specific prefix. For example, a
variable may be documented as `blphya01` in wave B but have the
canonical name `lphya01` in the label database.

`standardize` (default `TRUE`) is the overarching switch for three
independent sub-switches – `.standardize_names` (rename matched
variables to their canonical lowercase names, and standardize the
respondent-number column to `respnr`), `.standardize_var_labels`, and
`.standardize_val_labels` (use the harmonized, cross-wave-consistent
variable/value labels as the active ones). `.standardize_names = TRUE`
implies `add_wavecode = TRUE`: a `"Wave"` column is inserted immediately
after `respnr`.

``` r

data <- read_lasa_sav("LASAB046.sav") # standardize = TRUE by default

names(data)[1:4]
#> "respnr"    "Wave"      "lphya01"   "lphya02"

unique(data$Wave)
#> "B"
```

`add_wavecode = TRUE` can also be used on its own, without renaming
variables to their canonical names:

``` r

data <- read_lasa_sav(
  "LASAB046.sav",
  .standardize_names = FALSE,
  add_wavecode = TRUE
)

names(data)[1:4]
#> "respnr"    "Wave"      "blphya01"  "blphya02"

unique(data$Wave)
#> "B"
```

### Correct a known source-column name

If a source file contains a known typo or nonstandard column name, use
`name_corrections` to map a documented wave-specific or canonical
variable name to the actual source column, which would otherwise not
import correctly. This can be done with the specification
`canonical_name = "nonstandard name in the datafile"`:

``` r

data <- read_lasa_sav(
  "LASAB046.sav",
  name_corrections = c(lphya08 = "BLPYA08")
)
```

This override is used before the automatic exact/case-insensitive/fuzzy
matching steps.

`fuzzy_matching` (default `TRUE`) handles many typos automatically,
without needing `name_corrections` at all: when a variable can’t be
found by exact or canonical-name matching, an edit-distance match
against the data’s own unclaimed column names is tried. A unique close
match is used (and recorded as `"fuzzy"` in the matching audit, see
below); an ambiguous one (e.g. two equally-close candidates) is left
unmatched rather than guessed.

### Preserve the original coding for reference

For matched variables, `CleanLASA` keeps the wave-specific variable
label and value-label map available as reference attributes –
`"wave_label"` and `"labels_wave"` – regardless of
`.standardize_var_labels`/`.standardize_val_labels`. These remain
available after factor/numeric reshaping too, which makes it possible to
compare the transformed R representation with the original SPSS coding.

``` r

attr(data$lphya01, "wave_label")
attr(data$lphya01, "labels_wave")
```

## 5. Audit how variables were matched

Every call to
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
or
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
attaches a variable matching audit. Retrieve it with
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md):

``` r

report <- lasa_label_report(data)
report
```

By default, this returns the **full**, bidirectional audit: successful
matches, documented variables that were not found in the data
(`direction = "documented_not_in_data"`), and data columns that don’t
correspond to any documented variable
(`direction = "data_not_documented"`). The `method` column records how a
match was made, for example `exact`, `case-insensitive exact`,
`exact canonical`, `fuzzy`, `manual correction`, `not found`, or
`undocumented column`. Neither direction is ever an error – an unmatched
variable is simply left untouched and reported.

To focus only on entries that may require attention, use:

``` r

lasa_label_report(data, problems_only = TRUE)
```

This is useful before analysis when you want to verify that expected
variables were matched correctly (and often fixable with
`name_corrections`), and to spot columns in your data that aren’t
documented for the selected file code/wave (for example newly created
analysis variables, or a column the label database genuinely doesn’t
cover). Either way, those columns are never modified by the label
engine.

## 6. Apply LASA labels to an existing data frame

[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
exposes the same database-driven label engine without reading a file.
This is useful if you imported a `.sav` file yourself or need to
re-apply metadata after transformations.

``` r

raw <- haven::read_sav("LASAC046.sav", user_na = TRUE)

data <- apply_lasa_labels(
  raw,
  filecode = "046",
  wave = "C"
) # to_factor/to_numeric/standardize all default to TRUE
```

When `data` already carries the `LASA_file_code` and `LASA_wave`
provenance attributes created by
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
or a previous
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
call, those arguments can usually be omitted:

``` r

data <- read_lasa_sav("LASAB046.sav")

# ...perform transformations that may remove column attributes...

data <- apply_lasa_labels(data)
```

For the wave,
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
can also use a single-valued `Wave` column (the column
`add_wavecode`/`.standardize_names` inserts). Supplying `filecode` and
`wave` explicitly is the most robust option for data frames that did not
originate from
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md).

## 7. Inspect the label database

[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)
returns the metadata database currently in effect. It is a list with
four main components:

- `variables`: one row per file-code/wave/variable combination,
  including the wave-specific name, canonical name, wave-specific
  variable label, cross-wave-consistent (“harmonized”) variable label,
  and variable type;
- `value_labels`: the long-format value/code label definitions, as
  documented for that specific wave;
- `value_labels_harmonized`: the same variable’s value labels
  standardized across every wave that documents it (no `wave` column –
  it applies regardless of wave), for combining data across waves that
  coded the same concept slightly differently – absent entirely for a
  variable whose coding is inconsistent across waves
  (`var_type == "text"` in `variables`); and
- `manual_overrides`: separately stored hand-authored corrections for
  variables and value labels.

``` r

db <- lasa_label_db()

# Which wave-B variables are currently known for file code 046?
subset(db$variables, filecode == "046" & wave == "B")

# Inspect the corresponding value-label rows
subset(db$value_labels, filecode == "046" & wave == "B")

# The cross-wave-standardized value labels for the same variable
subset(db$value_labels_harmonized, filecode == "046" & canonical_name == "lphya01")
```

The package ships with a bundled snapshot, transcribed from LASA’s own
variable-information documentation; coverage grows and gets corrected
with package updates. If you record a manual correction (below),
`CleanLASA` writes a full updated snapshot to the package-specific user
data directory and uses that user-local database in preference to the
bundled copy on subsequent calls. This means corrections persist across
R sessions without modifying the installed package library.

## 8. Record a manual metadata correction

[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md)
is an escape hatch for a source-document error or a variable/value label
that needs a deliberate local correction. The correction is stored in a
separate override layer, so a later package update does not silently
remove it – it only replaces the bundled base layer the correction is
composed on top of.

Merge one corrected value label into the existing set: With
`replace_val_labels=FALSE` (the default), supplied value labels are
appended to the existing documentation.

``` r

manual_update_lasa_labels(
  filecode = "046",
  wave = "B",
  variable = "lphya01",
  val_labels = c(`-5` = "NA, wrong, skip")
)
```

Or replace the complete value-label set for the variable across all
waves in which that canonical variable is represented: With
`replace_val_labels=TRUE`, the value labels in the label database are
overridden with the supplied values, thus ignoring the original value
labels.

``` r

manual_update_lasa_labels(
  filecode = "046",
  wave = "all",
  variable = "lphya01",
  val_labels = c(`-5` = "NA, wrong, skip"),
  replace_val_labels = TRUE
)
```

The same function can replace a variable label through `var_label` to
replace the existing variable labels.

``` r

manual_update_lasa_labels(
  filecode = "046",
  wave = "B",
  variable = "lphya01",
  var_label = "New label"
)
```

Both functionalities can also be combines and/or applied across multiple
waves at once: This updates the local database, and can subsequently be
applied to the loaded dataframes with
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)

``` r

manual_update_lasa_labels(
  filecode = "046",
  wave = "all", # update all waves. Currently B-K
  variable = "lphya01",
  var_label = "New label",
  val_labels = c(`-5` = "NA, wrong, skip")
)

manual_update_lasa_labels(
  filecode = "046",
  wave = c("B", "C", "D"), # only update specified waves.  
  variable = "lphya01",
  var_label = "New label",
  val_labels = c(`-5` = "NA, wrong, skip")
)
```

## 9. A complete analysis-oriented workflow

For most analyses, the package can be used with a small number of steps:

``` r

library(CleanLASA)

# 1. Find the relevant LASA topic and file code
lasa_topics(topic = "physical activity")

# 2. Inspect the official variable-information document if needed
lasa_var_info("046")

# 3. Import the LASA file -- to_factor/to_numeric/standardize (names,
#    variable labels, value labels) all default to TRUE
data <- read_lasa_sav("LASAB046.sav")

# 4. Check only matching problems before analysis
problems <- lasa_label_report(data, problems_only = TRUE)
problems
```

If the required file code is not yet covered by the active label
database,
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
does not dispatch to a file-specific labelling function or invent
metadata. Add a deliberate correction with
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md),
or wait for a package update that adds coverage, and import/apply the
labels again.

## Function summary

| Function | Main purpose |
|----|----|
| [`lasa_topics()`](https://highmeadows.github.io/CleanLASA/reference/lasa_topics.md) | Search LASA topics, themes/subthemes, file codes, and available waves |
| [`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md) | Resolve and open the LASA variable-information PDF or webpage for a file code or topic |
| [`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md) | Read a LASA `.sav` file, identify wave/file code, and apply database-backed labels |
| [`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md) | Apply the same LASA labelling engine to an existing data frame |
| [`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md) | Inspect the full matching audit or only entries requiring attention |
| [`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md) | Inspect the active bundled + user-local label metadata database |
| [`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md) | Add or correct metadata in a persistent manual override layer |

Together, these functions make the LASA documentation part of the R data
workflow: topics and source documents remain discoverable, imported
variables retain their documented meaning, transformations remain
auditable, and the metadata layer can be refreshed without maintaining
separate file-specific labelling functions.
