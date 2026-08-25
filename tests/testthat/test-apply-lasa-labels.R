# apply_lasa_labels() identity resolution, exercised against the real
# bundled lasa_label_db_bundled (filecode 046 is expected to always be
# covered -- see data-raw/build_lasa_label_db.R).

fixture <- function() {
  data.frame(RespNr = 1:3, BLPHYA01 = c(1, 4, 2), stringsAsFactors = FALSE)
}

test_that("explicit filecode/wave resolve identity", {
  out <- apply_lasa_labels(fixture(), filecode = "046", wave = "B", standardize = FALSE)
  expect_false(is.null(attr(out$BLPHYA01, "label")))
})

test_that("stored LASA_file_code/LASA_wave provenance is reused after read_lasa_sav()", {
  skip_if_not_installed("haven")
  path <- tempfile(fileext = ".sav")
  on.exit(unlink(path), add = TRUE)
  haven::write_sav(fixture(), path)
  newpath <- file.path(dirname(path), "LASAB046.SAV")
  on.exit(unlink(newpath), add = TRUE)
  file.copy(path, newpath, overwrite = TRUE)

  dat <- read_lasa_sav(newpath, standardize = FALSE)
  # Strip attributes the way dplyr::mutate() would, but keep the ones
  # apply_lasa_labels() is meant to recover identity from.
  provenance <- attributes(dat)[c("LASA_wave", "LASA_file_code")]
  stripped <- as.data.frame(unclass(dat))
  attr(stripped, "LASA_wave") <- provenance$LASA_wave
  attr(stripped, "LASA_file_code") <- provenance$LASA_file_code

  relabelled <- apply_lasa_labels(stripped, standardize = FALSE)
  expect_false(is.null(attr(relabelled$blphya01, "label")))
})

test_that("wave can be recovered from a single-valued Wave column", {
  dat <- fixture()
  dat$Wave <- "B"
  out <- apply_lasa_labels(dat, filecode = "046", standardize = FALSE)
  expect_false(is.null(attr(out$BLPHYA01, "label")))
})

test_that("missing identity produces the documented error", {
  expect_error(
    apply_lasa_labels(fixture()),
    "Could not determine the LASA file code and wave"
  )
})

test_that("re-applying after label/labels are stripped is idempotent", {
  out1 <- apply_lasa_labels(fixture(), filecode = "046", wave = "B", standardize = FALSE)
  # Strip only label/labels, keep provenance attributes.
  attr(out1$BLPHYA01, "label") <- NULL
  attr(out1$BLPHYA01, "labels") <- NULL
  out2 <- apply_lasa_labels(out1, filecode = "046", wave = "B", standardize = FALSE)
  expect_false(is.null(attr(out2$BLPHYA01, "label")))
})

test_that("canonical-name matching works after .standardize_names has already run", {
  out <- apply_lasa_labels(fixture(), filecode = "046", wave = "B", .standardize_names = TRUE)
  expect_true("lphya01" %in% names(out))
  # Re-apply against the already-standardized names: canonical match path.
  out2 <- apply_lasa_labels(out, filecode = "046", wave = "B", standardize = FALSE)
  expect_false(is.null(attr(out2$lphya01, "label")))
})

test_that("defaults standardize names, factor/numeric-convert, and add a Wave column", {
  out <- apply_lasa_labels(fixture(), filecode = "046", wave = "B")
  expect_true(all(c("respnr", "Wave", "lphya01") %in% names(out)))
  expect_true(all(out$Wave == "B"))
  expect_equal(match("Wave", names(out)), match("respnr", names(out)) + 1L)
})
