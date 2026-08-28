# CleanLASA

<!-- badges: start -->
<!-- badges: end -->

The goal of CleanLASA is to make it easy to import and clean LASA
(Longitudinal Aging Study Amsterdam) SPSS data files in R. It applies
the correct variable and value labels from the LASA documentation,
handles differences between waves, flags any variables that could
not be matched to the documentation so they can be checked manually,
and helps you find and open the right LASA documentation for a topic
or file code.

Variable and value-label metadata lives in a single normalized database
(`lasa_label_db()`), bundled with the package and transcribed from LASA's
own variable-information documentation. Coverage grows and gets corrected
with package updates; local, one-off corrections are also possible with
`manual_update_lasa_labels()`.

## Installation

WARNING! The project is stil heavily work-in-progress, so installing is currently not recommended.
You can install the development version of CleanLASA from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Highmeadows/CleanLASA")
```

## Example

The main entry point is `read_lasa_sav()`, which detects which LASA
datafile you're working with (from its file name) and labels it using
the package's label database automatically:

``` r
library(CleanLASA)

# Import and label a LASA .sav file

# importing the data should generally be in this format:
data <- read_lasa_sav("path/to/LASA[wave][file_code].sav")

# Specific examples:
data <- read_lasa_sav("LASAB046.sav") # LASA wave B file 046
data <- read_lasa_sav("LASA_data/LASAZ004.sav") # LASA wave Z file 004
data <- read_lasa_sav("Documents/Research/data/LAS2B011.sav") # LASA wave 2B file 011
data <- read_lasa_sav("lasazoa1.sav") # LASA wave Z file oa1
```

### Shared arguments

`read_lasa_sav()` is a thin wrapper: identification (file code/wave) and
reading the `.sav` file happens there, but all matching, transforming, and
standardizing is done by `apply_lasa_labels()`, which both functions share.

- `filecode`/`wave` -- manual override for the LASA file code/wave, for a
  file name that doesn't follow the documented convention (`read_lasa_sav()`
  only).
- `name_corrections` -- manually point a canonical suffix (e.g. `lphya08`)
  at a differently-named source column, for a known typo/renaming in the
  data.
- `fuzzy_matching` (default `TRUE`) -- when exact/canonical matching fails,
  fall back to an edit-distance match against the data's own column names,
  absorbing most typos without needing `name_corrections`.
- `to_factor`/`to_numeric` (default `TRUE`) -- convert categorical variables
  to factors using their SPSS value labels as levels, and restore
  count/continuous variables to plain numeric, converting negative
  (missing-reason) codes to `NA`.
- `standardize` (default `TRUE`) -- overarching switch for the three
  switches below; each can also be set independently.
  - `.standardize_names` -- rename every matched column to its canonical
    lowercase LASA name with the wave code removed (e.g. `lphya01`), and
    standardize `"respnr"` (in any capitalization) to `"respnr"`. Implies
    `add_wavecode = TRUE`.
  - `.standardize_var_labels` -- use the cross-wave-consistent ("harmonized")
    variable label as the active `"label"`, instead of the wave-specific one.
  - `.standardize_val_labels` -- use the harmonized value labels as the
    active `"labels"` (and for `to_factor` level text), where documented.
- `add_wavecode` (default `FALSE`) -- insert a `"Wave"` column, filled with
  the file's already-identified wave code (e.g. `"B"`, `"2B"`, `"3B"`),
  right after `"respnr"`.

``` r
# Rename columns to their canonical names, harmonize labels, and insert a
# "Wave" column, all in one call -- this is also the default:
data <- read_lasa_sav("LASAB046.sav")
names(data)[1:3]
#> [1] "respnr"  "Wave"    "lphya01"

# add_wavecode also works on its own, without fully standardizing names:
data <- read_lasa_sav("LASAB046.sav", .standardize_names = FALSE, add_wavecode = TRUE)
```

Regardless of these arguments, every matched column also keeps its
wave-specific label/value labels available as reference attributes --
`attr(x, "wave_label")` and `attr(x, "labels_wave")` -- so R output can
always be cross-checked against another program's (e.g. SPSS) coding, even
after `to_numeric`/`to_factor` reshaping or harmonized-label standardization.

After importing, you can check the variable-name matching audit --
in both directions: documented variables not found in the data, and data
columns not documented in the label database -- using `lasa_label_report()`:

``` r
lasa_label_report(data)
lasa_label_report(data, problems_only = TRUE)
```

Neither direction ever breaks `read_lasa_sav()`/`apply_lasa_labels()`; an
unmatched variable is simply left alone and reported here, often fixable
with `name_corrections`.

### Relabelling a data frame directly

`apply_lasa_labels()` applies the same labelling engine to any data
frame, not only the output of `read_lasa_sav()`. This is useful after a
transformation (e.g. `dplyr::mutate()`) has stripped attributes, or when
a file was imported some other way:

``` r
data <- read_lasa_sav("LASAB046.sav")
data <- dplyr::mutate(data, respnr = respnr) # attributes stripped
data <- apply_lasa_labels(data) # re-labels via stored provenance

# Or supply identity explicitly:
raw <- haven::read_sav("LASAC046.sav", user_na = TRUE)
data <- apply_lasa_labels(raw, filecode = "046", wave = "C")
```

## The label database

`lasa_label_db()` returns the package's normalized variable/value-label
metadata: which file codes and waves are covered, and each variable's
documented name, wave-specific label, cross-wave-consistent
("harmonized") label, and value-label codebook. Unlike earlier releases,
this metadata is not parsed from PDFs at build or run time -- it is
hardcoded, hand-maintained R (`data-raw/`), transcribed from
LASA's own variable-information documentation and shipped with the
package. A new package release is how coverage grows or gets corrected.

``` r
db <- lasa_label_db()
subset(db$variables, filecode == "046" & wave == "B")
```

The database has three parts: `variables` (one row per file
code/wave/variable), `value_labels` (that variable's value labels as
documented for that specific wave), and `value_labels_harmonized` (the
same variable's value labels standardized across every wave that
documents it, independent of wave -- useful when combining waves that
coded the same concept slightly differently). `apply_lasa_labels()` and
`read_lasa_sav()` attach all of this to each labelled column as
attributes: `"label"`/`"labels"` (the *active* variable label/value labels
-- wave-specific unless `.standardize_var_labels`/`.standardize_val_labels`
is on), `"wave_label"`/`"labels_wave"` (always the wave-specific versions),
`"canonical_name"`, `"harmonized_label"`, and (where documented)
`"labels_harmonized"`.

### Manual corrections

When the bundled database is itself wrong or incomplete about a
variable, or you want a custom label, `manual_update_lasa_labels()`
patches your local copy of the database directly. A later package update
will not silently discard the correction -- it only replaces the bundled
base layer the correction is composed on top of.

``` r
manual_update_lasa_labels(
  filecode = "046", wave = "B", variable = "lphya01",
  val_labels = c(`-5` = "NA, wrong, skip")  # merged into the existing set
)

manual_update_lasa_labels(
  filecode = "046", wave = "all", variable = "lphya01",
  val_labels = c(`-5` = "NA, wrong, skip"),
  replace_val_labels = TRUE  # replaces the value-label set entirely
)
```

## Finding topics and documentation

`lasa_topics()` searches the package's bundled LASA topic database for
topics, themes, and file codes:

``` r
# Browse everything
lasa_topics()

# Search by topic name (fuzzy matching handles typos and partial names)
lasa_topics(topic = "physical act")

# Search by theme or subtheme
lasa_topics(theme = "cognitive")
lasa_topics(theme = "memory")

# Search by file code -- also matches processed/scaled variants sharing
# the same final two digits (e.g. "045" also returns the "245" row)
lasa_topics("011")
```

This table is hand-maintained (see `data-raw/lasa_topic_database.R` in
the package source), not scraped, so it updates only when the package
itself does — but that also makes it directly editable: adding a new
file code or updating which waves an existing one is available in
(e.g. a newly released wave) is a one-line change to that file.

Once you've found a topic or file code, `lasa_var_info()` resolves and
opens its variable-information PDF or its LASA topic webpage, scraped
live from the LASA website (no PDFs are bundled with the package):

``` r
lasa_var_info("046")               # by file code
lasa_var_info("LASA046")           # file code variations are recognized
lasa_var_info("Physical activity") # or by topic name
lasa_var_info("physical act")      # fuzzy matching handles typos too

# Open the LASA topic webpage instead of the PDF
lasa_var_info("046", target = "web")

# Get the URL without opening it
url <- lasa_var_info("046", open = FALSE)
```

The document is always opened in the system's default web browser (the
RStudio Viewer does not render hosted PDFs reliably). When a file code
has no linked PDF, `lasa_var_info()` automatically detours to its LASA
webpage instead, printing a message explaining why. The live lookup
itself is cached, both for the rest of the session and on disk, so it
doesn't have to be rebuilt every session; use `refresh = TRUE` to check
the live site for a changed link.

## Functions

| Function | Description |
|---|---|
| `read_lasa_sav()` | Reads a LASA `.sav` file and labels it using `lasa_label_db()`, based on the wave/file code parsed from the file name |
| `apply_lasa_labels()` | Applies `lasa_label_db()` labels to any data frame, resolving file code/wave explicitly or from stored provenance |
| `manual_update_lasa_labels()` | Hand-corrects or adds a variable/value label in your local copy of the database |
| `lasa_label_db()` | Returns the label database currently in effect (bundled snapshot + any local updates) |
| `lasa_label_report()` | Returns variables that could not be matched to the corresponding LASA documentation |
| `lasa_topics()` | Searches the bundled LASA topic database for topics, themes, and file codes |
| `lasa_var_info()` | Finds and opens a topic's or file code's variable-information PDF or LASA webpage, resolved live from the LASA website |

## Documentation

Full function reference and articles are available at:
<https://highmeadows.github.io/CleanLASA/>
