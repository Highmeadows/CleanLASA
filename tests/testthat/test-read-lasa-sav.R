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
  # no explicit removal needed here.
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
  dat <- read_lasa_sav(path, standardize = FALSE)
  expect_false(is.null(attr(dat$blphya01, "label")))
  expect_equal(attr(dat, "LASA_wave"), "B")
  expect_equal(attr(dat, "LASA_file_code"), "046")
  expect_equal(attr(dat, "LASA_source_file"), "LASAB046.SAV")
})

test_that("defaults standardize names/labels, factor/numeric-convert, and add a Wave column", {
  path <- write_lasa_sav(lasa046_fixture("H"), "LASAH046.SAV")
  dat <- read_lasa_sav(path)
  expect_true("lphya01" %in% names(dat))
  expect_true("Wave" %in% names(dat))
  expect_true(all(dat$Wave == "H"))
  expect_equal(match("Wave", names(dat)), match("respnr", names(dat)) + 1L)
})

test_that("to_factor/to_numeric can be turned off", {
  path <- write_lasa_sav(lasa046_fixture("H"), "LASAH046.SAV")
  dat <- read_lasa_sav(path, to_factor = FALSE, to_numeric = FALSE, standardize = FALSE)
  expect_false(is.factor(dat$hlphya01))
})

test_that("add_wavecode works without .standardize_names", {
  path <- write_lasa_sav(lasa046_fixture("B"), "LAS2B046.SAV")
  dat <- read_lasa_sav(path, .standardize_names = FALSE, add_wavecode = TRUE)
  # names are lowercased by read_lasa_sav() regardless of standardization
  expect_true("respnr" %in% names(dat))
  expect_true(all(dat$Wave == "2B"))
})

test_that("filecode/wave arguments override the parsed file name", {
  path <- write_lasa_sav(lasa046_fixture("B"), "notlasa.sav")
  dat <- read_lasa_sav(path, filecode = "046", wave = "B", standardize = FALSE)
  expect_false(is.null(attr(dat$blphya01, "label")))
})

test_that("provenance is sufficient for a later apply_lasa_labels() call", {
  path <- write_lasa_sav(lasa046_fixture("C"), "LASAC046.SAV")
  dat <- read_lasa_sav(path, standardize = FALSE)
  dat2 <- apply_lasa_labels(dat, standardize = FALSE)
  expect_false(is.null(attr(dat2$clphya01, "label")))
})

test_that("an unrecognized file name errors clearly", {
  path <- write_lasa_sav(lasa046_fixture(), "notlasa.sav")
  expect_error(read_lasa_sav(path), "Cannot identify a LASA wave and file code")
})

test_that("name_corrections is forwarded through read_lasa_sav", {
  fixture <- lasa046_fixture()
  names(fixture)[names(fixture) == "BLPHYA07"] <- "BLPYA07_TYPO"
  path <- write_lasa_sav(fixture, "LASAB046.SAV")
  dat <- read_lasa_sav(path, name_corrections = c(lphya07 = "BLPYA07_TYPO"), standardize = FALSE)
  expect_false(is.null(attr(dat$blpya07_typo, "label")))
})

test_that("fuzzy_matching absorbs a typo without name_corrections", {
  fixture <- lasa046_fixture()
  # doubled "a": close to blphya07 (distance 1) but at least distance 2
  # from every other "blphyaNN" sibling, so this is a clean, unambiguous
  # fuzzy match (unlike a deleted digit, which tends to tie with an
  # adjacent-numbered sibling in this densely-packed naming family).
  names(fixture)[names(fixture) == "BLPHYA07"] <- "BLPHYAA07"
  path <- write_lasa_sav(fixture, "LASAB046.SAV")
  dat <- read_lasa_sav(path, standardize = FALSE)
  report <- lasa_label_report(dat)
  row <- report[report$suffix == "blphya07" & !is.na(report$suffix), ]
  expect_equal(row$method, "fuzzy")
  expect_equal(row$edit_distance, 1L)
})

test_that("fuzzy_matching = FALSE leaves a typo unmatched and reported", {
  fixture <- lasa046_fixture()
  names(fixture)[names(fixture) == "BLPHYA07"] <- "BLPHYAA07"
  path <- write_lasa_sav(fixture, "LASAB046.SAV")
  dat <- read_lasa_sav(path, fuzzy_matching = FALSE, standardize = FALSE)
  report <- lasa_label_report(dat)
  row <- report[report$suffix == "blphya07" & !is.na(report$suffix), ]
  expect_equal(row$method, "not found")
})
