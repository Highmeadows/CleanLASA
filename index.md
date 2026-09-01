# CleanLASA

------------------------------------------------------------------------

editor_options: markdown: wrap: 72 —

CleanLASA helps you work with LASA (Longitudinal Aging Study Amsterdam)
data in R. LASA data comes as SPSS (`.sav`) files, and each file uses
its own short-hand variable names and numeric codes, which change
slightly from one measurement wave to the next. Reading such a file with
a generic tool like
[`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html)
gives you a data frame of bare numbers with no explanation of what they
mean.

CleanLASA fixes that. Point it at a LASA `.sav` file and it:

- figures out which LASA file and measurement wave you’re looking at,
  from the file name;
- attaches the correct variable and value labels for that specific
  file/wave, so `4` reads as `"married"` instead of just `4`;
- lines up the same variable across waves, even when its name or its
  numeric codes changed between waves;
- tells you plainly which variables it could *not* figure out, so you
  can check them by hand instead of silently getting it wrong; and
- helps you find the right LASA topic, file code, and official
  documentation in the first place.

All of this metadata lives in one bundled database
([`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)),
hand-transcribed from LASA’s own documentation and shipped with the
package. It gets more complete and more accurate with every package
update, and you can also patch your own local copy with
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md)
if something needs a quick, local fix.

## Installation

WARNING! This project is still heavily work-in-progress, so installing
it for real analysis work is currently not recommended.

You can install the development version of CleanLASA from
[GitHub](https://github.com/) with:

``` r

# install.packages("devtools")
devtools::install_github("Highmeadows/CleanLASA")
```

## Quick start

The main function is
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md).
Give it the path to a LASA `.sav` file and it works out the rest from
the file name – reading the file, matching its columns to LASA’s
documentation, attaching labels, turning categorical variables into R
factors, and renaming columns to a name that’s the same across every
wave:

``` r

library(CleanLASA)

data <- read_lasa_sav("LASAB046.sav") # LASA wave B, file code 046

# Check whether anything didn't match:
lasa_label_report(data, problems_only = TRUE)
```

Not sure which file code you need?
[`lasa_topics()`](https://highmeadows.github.io/CleanLASA/reference/lasa_topics.md)
searches LASA’s topics and themes for you, and
[`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md)
opens LASA’s own documentation for a topic or file code:

``` r

lasa_topics(topic = "physical activity")
lasa_var_info("046")
```

## Learn more

This README is just a summary. The [package
vignette](https://highmeadows.github.io/CleanLASA/articles/intro.html)
is a full, step-by-step tutorial that walks through every function with
worked examples – how the file-name-based matching works, every option
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
offers (fuzzy matching, name corrections, converting to factors/numeric,
standardizing names and labels across waves), what’s inside the label
database, how to record your own corrections, and how to search LASA’s
topic index and documentation. Start there if you’re new to the package.

## Functions

| Function | Description |
|----|----|
| [`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md) | Reads a LASA `.sav` file and labels it using [`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md), based on the wave/file code parsed from the file name |
| [`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md) | Applies [`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md) labels to any data frame, resolving file code/wave explicitly or from stored provenance |
| [`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md) | Hand-corrects or adds a variable/value label in your local copy of the database |
| [`restore_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/restore_lasa_labels.md) | Undoes manual corrections (entirely, or scoped) and/or rebuilds the local database cache from the bundled one |
| [`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md) | Returns the label database currently in effect (bundled snapshot + any local updates) |
| [`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md) | Returns variables that could not be matched to the corresponding LASA documentation |
| [`lasa_topics()`](https://highmeadows.github.io/CleanLASA/reference/lasa_topics.md) | Searches the bundled LASA topic database for topics, themes, and file codes |
| [`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md) | Finds and opens a topic’s or file code’s variable-information PDF or LASA webpage, resolved live from the LASA website |

## Documentation

Full function reference and articles are available at:
<https://highmeadows.github.io/CleanLASA/>
