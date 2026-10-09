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

## A cross-wave "Z" file (e.g. lasazoa1.SAV) holds wave-prefixed columns
## for several waves at once, filed in the database under its "z"-prefixed
## file code ("zoa1") with each column under its own real wave.
zoa1_fixture <- function() {
  oa_labels <- c(
    missing = -9, no = 0, possible = 1, yes = 2,
    dropout = 8, `dropout at previous waves` = 9
  )
  data.frame(
    RespNr = c(11455, 11459, 11471),
    BOAK = haven::labelled(c(0, 0, 2), oa_labels),
    BOAH = haven::labelled(c(0, 1, 0), oa_labels),
    COAK = haven::labelled(c(8, -9, 0), oa_labels),
    COAH = haven::labelled(c(8, -9, 1), oa_labels),
    DOAK = haven::labelled(c(9, 0, -9), oa_labels),
    DOAH = haven::labelled(c(9, 0, -9), oa_labels)
  )
}

test_that("a Z file name resolves to its z-prefixed file code", {
  expect_equal(.lasa_parse_filename("lasazoa1.SAV")$file_code, "zoa1")
  expect_equal(.lasa_parse_filename("LASAZ004.SAV")$file_code, "z004")
  expect_equal(.lasa_parse_filename("LASAZ004.SAV")$wave, "Z")
})

test_that("a Z file labels every wave's columns and converts them to factors", {
  skip_if_not_installed("haven")
  path <- write_lasa_sav(zoa1_fixture(), "lasazoa1.SAV")
  dat <- read_lasa_sav(path, standardize = TRUE, to_factor = TRUE)

  expect_equal(attr(dat, "LASA_file_code"), "zoa1")
  expect_true(all(dat$Wave == "Z"))
  # wave-prefixed names are kept: renaming to the canonical "oak"/"oah"
  # would collide across waves.
  expect_true(all(c("boak", "boah", "coak", "coah", "doak", "doah") %in% names(dat)))
  for (v in c("boak", "boah", "coak", "coah", "doak", "doah")) {
    expect_true(is.factor(dat[[v]]), info = v)
  }
  # "dropout" codes are real answers; -9 "missing" is a missing code and
  # becomes NA by default (keep_user_na = FALSE).
  expect_equal(as.character(dat$coah), c("dropout", NA, "possible"))
  expect_equal(as.character(dat$doak), c("dropout at previous waves", "no", NA))
  kept <- read_lasa_sav(path, keep_user_na = TRUE)
  expect_equal(as.character(kept$coah), c("dropout", "missing", "possible"))
  expect_equal(as.character(kept$doak), c("dropout at previous waves", "no", "missing"))
  expect_equal(attr(dat$coah, "label"), "Symptomatic hip osteoarthritis")
  expect_equal(attr(dat$coah, "wave_label"), "symptomatic hip OA at C")

  report <- lasa_label_report(dat)
  expect_false(any(report$direction == "data_not_documented"))
})

test_that("a migrant-cohort baseline file resolves to its mb-prefixed file code", {
  expect_equal(.lasa_parse_filename("LASMB004.SAV")$file_code, "mb004")
  expect_equal(.lasa_parse_filename("LASMB004.SAV")$wave, "MB")
  # MB files sharing a regular file code keep it.
  expect_equal(.lasa_parse_filename("LASMB046.SAV")$file_code, "046")
})
