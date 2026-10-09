## Writes `data` to a .sav file named `filename` in the session tempdir, so
## read_lasa_sav() can parse the LASA wave/file code from the name.
write_lasa_sav <- function(data, filename) {
  skip_if_not_installed("haven")
  path <- tempfile(fileext = ".sav")
  haven::write_sav(data, path)
  # Written into R's session tempdir, which is cleaned up automatically;
  # no explicit removal needed here.
  newpath <- file.path(dirname(path), filename)
  # overwrite = TRUE: several tests reuse the same LASA file
  # name (e.g. "LASAB046.SAV") in the shared session tempdir with
  # different fixture content; file.copy()'s default (overwrite = FALSE)
  # would silently keep an earlier test's stale file in place.
  file.copy(path, newpath, overwrite = TRUE)
  newpath
}
