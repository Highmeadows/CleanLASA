lasa046_fixture <- function() {
  data.frame(
    RespNr = 1:3,
    BLPHYA01 = c(1, 4, 2),
    BLPHYA07 = c(1, 2, -1),
    BLPHYA08 = c(-1, 5, 10),
    stringsAsFactors = FALSE
  )
}

test_that("original SPSS value coding is preserved regardless of reshaping", {
  as_is <- apply_lasa046_labels(lasa046_fixture(), wave = "B")
  expect_identical(unname(attr(as_is$BLPHYA07, "original_values")), c(1, 2, -1))
  expect_false(is.null(attr(as_is$BLPHYA07, "original_labels")))

  numeric_shaped <- apply_lasa046_labels(lasa046_fixture(), wave = "B", to_numeric = TRUE)
  expect_true(is.na(numeric_shaped$BLPHYA08[[1]]))
  expect_identical(unname(attr(numeric_shaped$BLPHYA08, "original_values")), c(-1, 5, 10))
  expect_false(is.null(attr(numeric_shaped$BLPHYA08, "original_labels")))

  factor_shaped <- apply_lasa046_labels(lasa046_fixture(), wave = "B", to_factor = TRUE)
  expect_true(is.factor(factor_shaped$BLPHYA01))
  expect_identical(unname(attr(factor_shaped$BLPHYA01, "original_values")), c(1, 4, 2))
  expect_false(is.null(attr(factor_shaped$BLPHYA01, "original_labels")))
})

test_that("standardize_names always implies split_wavecode", {
  dat <- apply_lasa046_labels(lasa046_fixture(), wave = "B", standardize_names = TRUE)

  expect_true("respnr" %in% names(dat))
  expect_true("LASA_wave" %in% names(dat))
  expect_identical(names(dat)[[2]], "LASA_wave")
  expect_true(all(dat$LASA_wave == "B"))
  expect_true("lphya01" %in% names(dat))
  expect_false("blphya01" %in% names(dat))
})

test_that("split_wavecode works independently of standardize_names", {
  dat <- apply_lasa046_labels(lasa046_fixture(), wave = "2B", split_wavecode = TRUE)

  # respnr is matched (to position LASA_wave) but not renamed, since
  # standardize_names = FALSE.
  expect_true("RespNr" %in% names(dat))
  expect_true("LASA_wave" %in% names(dat))
  expect_identical(names(dat)[[2]], "LASA_wave")
  expect_true(all(dat$LASA_wave == "2B"))
  expect_true("lphya01" %in% names(dat))
})

test_that("LASA_wave records the actual wave code, e.g. 3B", {
  dat <- apply_lasa046_labels(lasa046_fixture(), wave = "3B", standardize_names = TRUE)
  expect_true(all(dat$LASA_wave == "3B"))
})

test_that("LASA_wave is inserted at the front when respnr is absent", {
  dat <- apply_lasa046_labels(
    data.frame(BLPHYA01 = c(1, 2)), wave = "B", split_wavecode = TRUE
  )
  expect_identical(names(dat)[[1]], "LASA_wave")
})

test_that("respnr variations are standardized only when standardize_names = TRUE", {
  fixture <- lasa046_fixture()
  names(fixture)[[1]] <- "RESPNR"

  unstandardized <- apply_lasa046_labels(fixture, wave = "B")
  expect_true("RESPNR" %in% names(unstandardized))

  standardized <- apply_lasa046_labels(fixture, wave = "B", standardize_names = TRUE)
  expect_true("respnr" %in% names(standardized))
  expect_false("RESPNR" %in% names(standardized))
})

test_that("label_report includes a respnr row", {
  dat <- apply_lasa046_labels(lasa046_fixture(), wave = "B", standardize_names = TRUE)
  report <- lasa_label_report(dat)

  respnr_row <- report[report$suffix == "respnr", ]
  expect_equal(nrow(respnr_row), 1)
  expect_equal(respnr_row$method, "case-insensitive exact")
  expect_equal(respnr_row$standardized_to, "respnr")
})

test_that("read_lasa_sav forwards split_wavecode to apply_lasa046_labels", {
  skip_if_not_installed("haven")

  path <- tempfile(fileext = ".sav")
  on.exit(unlink(path), add = TRUE)
  haven::write_sav(lasa046_fixture(), path)
  file.rename(path, file.path(dirname(path), "LAS3B046.SAV"))
  path <- file.path(dirname(path), "LAS3B046.SAV")
  on.exit(unlink(path), add = TRUE)

  dat <- read_lasa_sav(path, split_wavecode = TRUE)
  expect_true("LASA_wave" %in% names(dat))
  expect_true(all(dat$LASA_wave == "3B"))
  expect_true("RespNr" %in% names(dat))

  dat_std <- read_lasa_sav(path, standardize_names = TRUE)
  expect_true("respnr" %in% names(dat_std))
  expect_true("LASA_wave" %in% names(dat_std))
})
