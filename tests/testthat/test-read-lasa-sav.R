lasa046_fixture <- function(prefix = "B") {
  dat <- data.frame(
    RespNr = 1:3,
    x1 = c(1, 4, 2),
    x2 = c(1, 2, -1),
    stringsAsFactors = FALSE
  )
  names(dat)[2:3] <- paste0(toupper(prefix), c("LPHYA01", "LPHYA07"))
  dat
}

write_lasa_sav <- function(data, filename) {
  skip_if_not_installed("haven")
  path <- tempfile(fileext = ".sav")
  haven::write_sav(data, path)
  # Written into R's session tempdir, which is cleaned up automatically;
  # no explicit removal needed here (matches the package's existing test
  # fixtures, e.g. test-apply-lasa046-labels.R).
  newpath <- file.path(dirname(path), filename)
  # overwrite = TRUE: several tests in this file reuse the same LASA file
  # name (e.g. "LASAB046.SAV") in the shared session tempdir with
  # different fixture content; file.copy()'s default (overwrite = FALSE)
  # would silently keep an earlier test's stale file in place.
  file.copy(path, newpath, overwrite = TRUE)
  newpath
}

test_that("read_lasa_sav labels via the database-driven engine (no dispatch table)", {
  path <- write_lasa_sav(lasa046_fixture(), "LASAB046.SAV")
  dat <- read_lasa_sav(path)
  expect_false(is.null(attr(dat$BLPHYA01, "label")))
  expect_equal(attr(dat, "LASA_wave"), "B")
  expect_equal(attr(dat, "LASA_file_code"), "046")
  expect_equal(attr(dat, "LASA_source_file"), "LASAB046.SAV")
})

test_that("reshaping arguments are forwarded correctly", {
  path <- write_lasa_sav(lasa046_fixture("H"), "LASAH046.SAV")
  dat <- read_lasa_sav(path, to_factor = TRUE, to_numeric = TRUE, standardize_names = TRUE)
  expect_true(is.factor(dat$lphya01))
  expect_true("LASA_wave" %in% names(dat))
  expect_true(all(dat$LASA_wave == "H"))
})

test_that("split_wavecode works without standardize_names", {
  path <- write_lasa_sav(lasa046_fixture("B"), "LAS2B046.SAV")
  dat <- read_lasa_sav(path, split_wavecode = TRUE)
  expect_true("RespNr" %in% names(dat))
  expect_true(all(dat$LASA_wave == "2B"))
})

test_that("provenance is sufficient for a later apply_lasa_labels() call", {
  path <- write_lasa_sav(lasa046_fixture("C"), "LASAC046.SAV")
  dat <- read_lasa_sav(path)
  dat2 <- apply_lasa_labels(dat)
  expect_false(is.null(attr(dat2$CLPHYA01, "label")))
})

test_that("an unrecognized file name errors clearly", {
  path <- write_lasa_sav(lasa046_fixture(), "notlasa.sav")
  expect_error(read_lasa_sav(path), "Cannot identify a LASA wave and file code")
})

test_that("name_corrections is forwarded through read_lasa_sav", {
  fixture <- lasa046_fixture()
  names(fixture)[names(fixture) == "BLPHYA07"] <- "BLPYA07_TYPO"
  path <- write_lasa_sav(fixture, "LASAB046.SAV")
  dat <- read_lasa_sav(path, name_corrections = c(lphya07 = "BLPYA07_TYPO"))
  expect_false(is.null(attr(dat$BLPYA07_TYPO, "label")))
})
