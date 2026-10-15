# Negative values: a negative code is always a missing-value code, even
# when its label names a valid answer (`-2` = "valid score": the score is
# valid, so its "reason missing" variable has nothing to record), and so
# is an undocumented negative value -- except in a variable whose genuine
# values can be negative (database can_be_negative), such as a
# speech-reception threshold in dB, where only the documented missing
# codes count and every other negative value is a measurement.

local_negative_db <- function(env = parent.frame()) {
  tmp <- tempfile(fileext = ".rds")
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tmp, .env = env)

  db <- .lasa_empty_label_db()
  db$variables <- rbind(db$variables, data.frame(
    filecode = "998", wave = "B",
    variable_name = c("brmpf", "bsrt", "bcount"),
    canonical_name = c("rmpf", "srt", "count"),
    variable_label = c("Reason missing: performance test", "Speech-reception threshold (in dB)", "Number of visits"),
    harmonized_var_label = c("Reason missing: performance test", "Speech-reception threshold (in dB)", "Number of visits"),
    var_type = c("categorical", "numeric", "numeric"),
    can_be_negative = c(FALSE, TRUE, FALSE),
    stringsAsFactors = FALSE
  ))
  db$value_labels <- rbind(db$value_labels, data.frame(
    filecode = "998", wave = "B",
    variable_name = c(rep("brmpf", 4), rep("bsrt", 2), "bcount"),
    value_numeric = c(-2, -1, 1, 2, -24, -22, -1),
    value_label = c(
      "valid score", "na, asked", "short version", "interview terminated",
      "non-valid, too many incomplete triplets", "test not done", "na, asked"
    ),
    is_missing = c(TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE),
    stringsAsFactors = FALSE
  ))
  .lasa_save_label_db(db)
  tmp
}

negative_fixture <- function() {
  data.frame(
    respnr = 1:5,
    brmpf = c(-2, -1, 1, -3, 2),
    bsrt = c(-6.4, -9.2, 1.5, -22, -24),
    bcount = c(-7, 3, -1, 0, 2),
    stringsAsFactors = FALSE
  )
}

relabel <- function(data, ...) {
  .lasa_apply_labels(data, filecode = "998", wave = "B", standardize = FALSE, ...)
}

test_that("a negative code is missing, even when its label names a valid answer", {
  local_negative_db()
  out <- relabel(negative_fixture())

  expect_s3_class(out$brmpf, "factor")
  expect_equal(as.character(out$brmpf), c(NA, NA, "short version", NA, "interview terminated"))
  expect_equal(levels(out$brmpf), c("short version", "interview terminated"))
  expect_equal(as.vector(out$bcount), c(NA, 3, NA, 0, 2))
})

test_that("a variable whose values can be negative keeps its measurements", {
  local_negative_db()
  out <- relabel(negative_fixture())

  expect_equal(as.vector(out$bsrt), c(-6.4, -9.2, 1.5, NA, NA))
})

test_that("keep_user_na = TRUE declares only the missing codes as missing", {
  local_negative_db()
  out <- relabel(negative_fixture(), keep_user_na = TRUE)

  expect_s3_class(out$bsrt, "haven_labelled_spss")
  expect_equal(sort(attr(out$bsrt, "na_values")), c(-24, -22))
  expect_equal(is.na(out$bsrt), c(FALSE, FALSE, FALSE, TRUE, TRUE))
  expect_equal(
    as.character(out$brmpf),
    c("valid score", "na, asked", "short version", "-3", "interview terminated")
  )
  expect_equal(sort(attr(out$bcount, "na_values")), c(-7, -1))
})

test_that("the labelled (to_factor/to_numeric off) form keeps negative measurements", {
  local_negative_db()
  out <- relabel(negative_fixture(), to_factor = FALSE, to_numeric = FALSE)

  expect_equal(as.vector(unclass(out$brmpf)), c(NA, NA, 1, NA, 2))
  expect_equal(as.vector(unclass(out$bsrt)), c(-6.4, -9.2, 1.5, NA, NA))
})

test_that("re-labelling already-converted output keeps negative measurements", {
  local_negative_db()
  kept <- relabel(negative_fixture(), keep_user_na = TRUE, to_numeric = FALSE)
  # bsrt has value labels, so to_numeric = FALSE makes it a factor whose
  # measurements are levels named after their own number.
  expect_s3_class(kept$bsrt, "factor")
  expect_equal(as.character(kept$bsrt)[1:3], c("-6.4", "-9.2", "1.5"))

  out <- relabel(kept, keep_user_na = FALSE, to_numeric = FALSE)
  expect_equal(as.character(out$brmpf), c(NA, NA, "short version", NA, "interview terminated"))
  expect_false(any(c("valid score", "na, asked") %in% levels(out$brmpf)))
  expect_equal(as.character(out$bsrt)[1:3], c("-6.4", "-9.2", "1.5"))
  expect_true(all(is.na(out$bsrt[4:5])))
  expect_false(any(c("test not done", "non-valid, too many incomplete triplets") %in% levels(out$bsrt)))
})

test_that("a missing code shown as its own number is blanked, even in a signed variable", {
  expect_equal(
    .lasa_blank_missing_text(c("-6.4", "-22", "1.5", "-3"), character(0), missing_codes = -22, infer_negative = FALSE),
    c("-6.4", NA, "1.5", "-3")
  )
  expect_equal(
    .lasa_blank_missing_text(c("-6.4", "-22", "1.5", "-3"), character(0), missing_codes = -22),
    c(NA, NA, "1.5", NA)
  )
})

test_that("a code listed without wording gets its own number as level text", {
  out <- .lasa_convert_to_labelled_factor(c(1, 8, 2, 5.71), c(one = 1, two = 2, stats::setNames(8, NA)))
  expect_equal(as.character(out), c("one", "8", "two", "5.71"))
  expect_false(anyNA(levels(out)))
})

test_that("a code listed without wording is a labelled value named after its number", {
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tempfile(fileext = ".rds"))

  # LASAJ804 jqphyfem (a 0-10 rating) lists 0 and 10 without wording.
  path <- write_lasa_sav(data.frame(respnr = 1:4, jqphyfem = c(0, 5, 10, -1)), "LASAJ804.SAV")
  out <- read_lasa_sav(path, standardize = FALSE, keep_user_na = TRUE, to_factor = FALSE)
  expect_s3_class(out$jqphyfem, "haven_labelled_spss")
  expect_false(anyNA(names(attr(out$jqphyfem, "labels"))))
  expect_equal(as.character(haven::as_factor(out$jqphyfem))[1:3], c("0", "5", "10"))
})

test_that("a numeric variable's listed values are values, not value labels", {
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tempfile(fileext = ".rds"))

  # LASAB047 brandom's documentation lists 0, 59 and 99; LASAB016 bcjpresi
  # (a prestige score) the range 13-87.
  path <- write_lasa_sav(data.frame(respnr = 1:4, brandom = c(0, 30, 99, -1)), "LASAB047.SAV")
  out <- read_lasa_sav(path, standardize = FALSE, keep_user_na = TRUE)
  expect_equal(unname(attr(out$brandom, "labels_wave")), c(-6, -3, -1))
  expect_equal(as.vector(read_lasa_sav(path, standardize = FALSE)$brandom), c(0, 30, 99, NA))

  path <- write_lasa_sav(data.frame(respnr = 1:4, bcjpresi = c(13, 50, 87, -1)), "LASAB016.SAV")
  out <- read_lasa_sav(path, standardize = FALSE, to_numeric = FALSE)
  expect_false(any(c(13, 87) %in% attr(out$bcjpresi, "labels_wave")))
  expect_equal(as.character(out$bcjpresi), c("13", "50", "87", NA))
})

test_that("a local database saved without can_be_negative still labels", {
  local_negative_db()
  db <- .lasa_load_label_db()
  db$variables$can_be_negative <- NULL
  .lasa_save_label_db(db)

  out <- relabel(negative_fixture())
  expect_equal(as.vector(out$bsrt), c(NA, NA, 1.5, NA, NA))
  expect_equal(as.character(out$brmpf)[3], "short version")
})

test_that("negative_values() reaches the build, and listed values of numeric variables are refused", {
  helpers <- testthat::test_path("..", "..", "data-raw", "label_db_helpers.R")
  skip_if_not(file.exists(helpers), "data-raw/ is not shipped with the built package")
  env <- new.env(parent = environment())
  sys.source(helpers, envir = env)

  local({
    var_types_vec <- c(srt = "numeric")
    variable_labels(srt = "Speech-reception threshold (in dB)", .applies_to_waves = c("Z", "C"))
    negative_values("srt", .applies_to_waves = "C")
    value_labels(`-22` = "test not done", .applies_to_vars = "srt", .applies_to_waves = c("Z", "C"))
    fc <- .lasa_finalize_fc("998")
    expect_equal(fc$negative_values, data.frame(LASA_Wave = "C", canonical_name = "srt", stringsAsFactors = FALSE))

    var_types_vec <- c(srt = "numeric")
    variable_labels(srt = "Speech-reception threshold (in dB)", .applies_to_waves = c("Z", "C"))
    negative_values("srt", .applies_to_waves = "B")
    expect_error(.lasa_finalize_fc("997"), "doesn't cover it there")
  }, envir = env)

  local({
    var_types_vec <- c(score = "numeric", rating = "categorical")
    variable_labels(score = "A score", rating = "A rating", .applies_to_waves = c("Z", "C"))
    value_labels(`-1` = "na, asked", `-2` = NA_character_, .applies_to_vars = "score", .applies_to_waves = "C")
    value_labels(`0` = NA_character_, `10` = NA_character_, .applies_to_vars = "rating", .applies_to_waves = "C")
    expect_type(.lasa_finalize_fc("996"), "list")

    var_types_vec <- c(score = "numeric")
    variable_labels(score = "A score", .applies_to_waves = c("Z", "C"))
    value_labels(`-1` = "na, asked", `13` = NA_character_, `87` = NA_character_, .applies_to_vars = "score", .applies_to_waves = "C")
    expect_error(.lasa_finalize_fc("995"), "13, 87 without wording for numeric variable")

    var_types_vec <- c(rating = "categorical")
    variable_labels(rating = "A rating", .applies_to_waves = c("Z", "C"))
    value_labels(`98` = "NA", .applies_to_vars = "rating", .applies_to_waves = "C")
    expect_error(.lasa_finalize_fc("994"), "label text \"NA\"")
  }, envir = env)

  expect_error(env$negative_values("x", .applies_to_waves = "Z"), "real waves")
  expect_error(env$negative_values(c(a = "x"), .applies_to_waves = "B"), "bare canonical-name strings")
  env$.lasa_reset_dsl_state()
})

test_that("the bundled database treats codes as missing and keeps measurements", {
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tempfile(fileext = ".rds"))

  # "valid score": the score is valid, so its reason-missing value is missing.
  path <- write_lasa_sav(data.frame(respnr = 1:4, brmpf = c(-2, 1, -1, 2)), "LASAB034.SAV")
  out <- read_lasa_sav(path, standardize = FALSE)
  expect_s3_class(out$brmpf, "factor")
  expect_equal(as.character(out$brmpf), c(NA, "short version", NA, "interview terminated"))

  # A speech-reception threshold in dB: real values are negative, the
  # documented -22/-23/-24 are missing codes.
  path <- write_lasa_sav(
    data.frame(respnr = 1:6, emsrttn = c(-6.4, -9.2, 1.5, -22, -24, 5.71)),
    "LASAE193.SAV"
  )
  out <- read_lasa_sav(path, standardize = FALSE)
  expect_equal(as.vector(out$emsrttn), c(-6.4, -9.2, 1.5, NA, NA, 5.71))
  expect_equal(names(attr(out$emsrttn, "labels_wave")), c(
    "non-valid, too many incomplete triplets", "non-valid, aborted measurement", "test not done"
  ))
  expect_equal(
    as.character(read_lasa_sav(path, to_numeric = FALSE)$msrttn),
    c("-6.4", "-9.2", "1.5", NA, NA, "5.71")
  )

  kept <- read_lasa_sav(path, standardize = FALSE, keep_user_na = TRUE)
  expect_equal(sort(attr(kept$emsrttn, "na_values")), c(-24, -23, -22))

  # Retention as a difference is negative when words are forgotten; only
  # its documented -1/-2 codes are missing.
  path <- write_lasa_sav(data.frame(respnr = 1:4, dmret1pc = c(-5, -1, -2, 3)), "LASAD356.SAV")
  expect_equal(as.vector(read_lasa_sav(path)$mret1pc), c(-5, NA, NA, 3))
})
