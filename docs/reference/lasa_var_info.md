# Open a LASA variable-information codebook

Opens the variable-information codebook associated with a LASA data-file
code. This is for conveniently looking up the variable- and value
labels, but not always self-explanatory. For more information on a
variable, its references, original questionnaire, and other relevant
information search the LASA website: https://lasa-vu.nl/topics/

## Usage

``` r
lasa_var_info(
  filecode,
  viewer = c("auto", "rstudio", "system"),
  open = interactive()
)
```

## Arguments

- filecode:

  A single non-empty character string containing a LASA data-file code,
  such as `"046"`, `"z004"`, or `"zoa2"`. The optional `"LASA"` prefix
  is accepted.

- viewer:

  Where to open the codebook. One of:

  `"auto"`

  :   Use the RStudio Viewer when available and otherwise use the
      system's default browser or PDF viewer.

  `"rstudio"`

  :   Attempt to use the RStudio Viewer and fall back to the system's
      default browser or PDF viewer if it is unavailable.

  `"system"`

  :   Use the system's default browser or PDF viewer.

- open:

  Logical. Should the codebook be opened? The default is `TRUE` during
  interactive use and `FALSE` otherwise. Set `open = FALSE` to retrieve
  the codebook path without opening the PDF.

## Value

Invisibly returns the full path to the codebook PDF.

## Details

Codebooks are downloaded directly from the public LASA website, and
exported wit this package in the `inst/codebooks/` directory. In
RStudio, the function first attempts to display the PDF in the Viewer
pane. If the RStudio Viewer is unavailable or cannot open the file, the
PDF is opened with the system's default browser or PDF viewer.

Codebook filenames are derived automatically from `filecode` according
to the LASA naming conventions:

- Standard data files: `LASA[filecode]_varinfo.pdf`, for example
  `LASA046_varinfo.pdf`.

- Z-files: `LASAz[number]_varinfo.pdf`, for example
  `LASAz004_varinfo.pdf`.

- Algorithm-based osteoarthritis files `zoa1`, `zoa2`, and `zoa3`:
  `LASAzoa1_2_3_varinfo.pdf`.

Filename matching is case-insensitive. Consequently, file codes may be
supplied with or without the `LASA` prefix and in upper- or lowercase.

## Examples

``` r
if (FALSE) { # \dontrun{
lasa_var_info("046")
lasa_var_info("LASA046")
lasa_var_info("z004")
lasa_var_info("LASAz095")
lasa_var_info("zoa2")

# Explicitly use the system's default PDF viewer
lasa_var_info("046", viewer = "system")

# Retrieve the installed path without opening the PDF
codebook_path <- lasa_var_info("046", open = FALSE)
} # }
```
