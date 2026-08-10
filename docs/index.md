# CleanLASA

The goal of CleanLASA is to make it easy to import and clean LASA
(Longitudinal Aging Study Amsterdam) SPSS data files in R. It applies
the correct variable and value labels from the LASA documentation,
handles differences between waves, and flags any variables that could
not be matched to the documentation so they can be checked manually.

## Installation

You can install the development version of CleanLASA from
[GitHub](https://github.com/) with:

``` r

# install.packages("devtools")
devtools::install_github("Highmeadows/CleanLASA")
```

## Example

The main entry point is
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
which detects which LASA datafile you’re working with and dispatches to
the correct import/cleaning function automatically:

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

For LASA046 files specifically,
[`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md)
applies all SPSS variable- and value-labels and imports the data
correctly. The current version supports waves: `B`, `C`, `D`, `E`, `2B`,
`F`, `G`, `H`, `MB`, `3B`, `I`, `J`, `K`

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
matched to the LASA documentation using
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md):

``` r

lasa_label_report(data)
```

This returns the set of “faulty” variables — ones that couldn’t be
matched to their corresponding documentation — so you can inspect and
resolve them before analysis.

## Functions

| Function | Description |
|----|----|
| [`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md) | Wrapper function that identifies the LASA datafile type and calls the correct import/cleaning function |
| [`apply_lasa046_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa046_labels.md) | Applies SPSS variable- and value-labels for LASA046 data files and imports them correctly; works across all waves |
| [`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md) | Returns variables that could not be matched to the corresponding LASA documentation |
| [`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md) | Returns the LASA documentation of the corresponding datafile in an external pdf viewer |

## Documentation

Full function reference and articles are available at:
<https://highmeadows.github.io/CleanLASA/>
