# Parse a LASA data-file name

Internal helper used by
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
to derive the LASA wave and file code from the documented file naming
convention.

## Usage

``` r
.lasa_parse_datafile_name(path)
```

## Arguments

- path:

  Character string containing a LASA file path or file name.

## Value

A named list with `wave`, `file_code`, `file_name`, and
`apply_function`.

## Details

Standard wave files use `LASA[wave][file_code].SAV`, for example
`LASAB046.SAV` or `LASAZ004.SAV`. Files for the replenishment/migrant
cohort waves 2B, 3B, 4B, and MB omit the `A` after `LAS`, for example
`LAS2B046.SAV` or `LASMB004.SAV`.
