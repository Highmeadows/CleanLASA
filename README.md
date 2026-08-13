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

## Installation

You can install the development version of CleanLASA from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Highmeadows/CleanLASA")
```

## Example

The main entry point is `read_lasa_sav()`, which detects which LASA
datafile you're working with and dispatches to the correct
import/cleaning function automatically:

``` r
library(CleanLASA)

# Import and label a LASA .sav file

# importing the data should generally be in this fomrat:
data <- read_lasa_sav("path/to/LASA[wave][file_code].sav")

# Specific examples:
data <- read_lasa_sav("LASAB046.sav") # LASA wave B file 046
data <- read_lasa_sav("LASA_data/LASAZ004.sav") # LASA wave Z file 004
data <- read_lasa_sav("Documents/Research/data/LAS2B011.sav") # LASA wave 2B file 011
data <- read_lasa_sav("lasazoa1.sav") # LASA wave Z file oa1
data <- read_lasa_sav("LASAJFI.sav") # LASA wave J file FI

```

For LASA046 files specifically, `apply_lasa046_labels()` applies all
SPSS variable- and value-labels and imports the data correctly. The current
version supports waves: 
`B`, `C`, `D`, `E`, `2B`, `F`, `G`, `H`, `MB`, `3B`, `I`, `J`, `K`

``` r
# Specifically for LASA046 (Physical Activity), datapath should be in this format:
data <- apply_lasa046_labels("path/to/LASA[wave]046.sav")

# Examples
data <- apply_lasa046_labels("LASAC046.sav")
data <- apply_lasa046_labels("LASMB046.sav")
data <- apply_lasa046_labels("LAS3B046.sav")
```

In the future, similar functions will be built for other datafiles.


After importing, you can check whether any variables could not be
matched to the LASA documentation using `lasa_label_report()`:

``` r
lasa_label_report(data)
```

This returns the set of "faulty" variables — ones that couldn't be
matched to their corresponding documentation — so you can inspect and
resolve them before analysis.

## Finding topics and documentation

`lasa_topics()` searches the [LASA topic
overview](https://lasa-vu.nl/en/topic-table/) for topics, themes, and
file codes:

``` r
# Browse everything
lasa_topics()

# Search by topic name (fuzzy matching handles typos and partial names)
lasa_topics(topic = "physical act")

# Search by theme or subtheme
lasa_topics(theme = "cognitive")
lasa_topics(theme = "memory")
```

The table is built from the live LASA website the first time it's
needed, then cached — both for the rest of the session and on disk —
so it doesn't have to be rebuilt every session. Use `refresh = TRUE`
to check the live site for anything new, such as a newly added wave
or file code.

Once you've found a topic or file code, `lasa_var_info()` opens its
variable-information PDF directly from the LASA website (no PDFs are
bundled with the package):

``` r
lasa_var_info("046")               # by file code
lasa_var_info("LASA046")           # file code variations are recognized
lasa_var_info("Physical activity") # or by topic name
lasa_var_info("physical act")      # fuzzy matching handles typos too

# Get the URL without opening it
url <- lasa_var_info("046", open = FALSE)
```

## Functions

| Function | Description |
|---|---|
| `read_lasa_sav()` | Wrapper function that identifies the LASA datafile type and calls the correct import/cleaning function |
| `apply_lasa046_labels()` | Applies SPSS variable- and value-labels for LASA046 data files and imports them correctly; works across all waves |
| `lasa_label_report()` | Returns variables that could not be matched to the corresponding LASA documentation |
| `lasa_topics()` | Searches the LASA topic overview for topics, themes, and file codes |
| `lasa_var_info()` | Finds and opens a topic's or file code's variable-information PDF from the LASA website |

## Documentation

Full function reference and articles are available at:
<https://highmeadows.github.io/CleanLASA/>
