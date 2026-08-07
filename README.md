# CleanLASA

<!-- badges: start -->
<!-- badges: end -->

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

The main entry point is `read_lasa_sav()`, which detects which LASA
datafile you're working with and dispatches to the correct
import/cleaning function automatically:

``` r
library(CleanLASA)

# Import and label a LASA .sav file
data <- read_lasa_sav("path/to/LASA[wave][file_code].sav")
```

For LASA046 files specifically, `apply_lasa046_labels()` applies all
SPSS variable- and value-labels and imports the data correctly. It
works across all waves of LASA046:

``` r
data <- apply_lasa046_labels("path/to/LASA[wave]046.sav")
```

After importing, you can check whether any variables could not be
matched to the LASA documentation using `lasa_label_report()`:

``` r
lasa_label_report(data)
```

This returns the set of "faulty" variables — ones that couldn't be
matched to their corresponding documentation — so you can inspect and
resolve them before analysis.

## Functions

| Function | Description |
|---|---|
| `read_lasa_sav()` | Wrapper function that identifies the LASA datafile type and calls the correct import/cleaning function |
| `apply_lasa046_labels()` | Applies SPSS variable- and value-labels for LASA046 data files and imports them correctly; works across all waves |
| `lasa_label_report()` | Returns variables that could not be matched to the corresponding LASA documentation |

## Documentation

Full function reference and articles are available at:
<https://highmeadows.github.io/CleanLASA/>
