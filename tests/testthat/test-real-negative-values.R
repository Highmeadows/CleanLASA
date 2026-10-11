# Negative codes that LASA's documentation shows are real values, not
# missing codes: a documented code such as `-2` = "valid score" (database
# is_missing = FALSE), and a numeric variable whose documented values can
# be negative, so an undocumented negative number in it is a measurement.

local_negative_db <- function(env = parent.frame()) {
  tmp <- tempfile(fileext = ".rds")
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tmp, .env = env)

  db <- .lasa_empty_label_db()
  db$variables <- rbind(db$variables, data.frame(
    filecode = "998", wave = "B",
    variable_name = c("brmpf", "bsrt", "bcount", "bwords"),
    canonical_name = c("rmpf", "srt", "count", "words"),
    variable_label = c(
      "Reason missing: performance test", "Speech-reception threshold (in dB)", "Number of visits",
      "Number of words correct"
    ),
    harmonized_var_label = c(
      "Reason missing: performance test", "Speech-reception threshold (in dB)", "Number of visits",
      "Number of words correct"
    ),
    var_type = c("categorical", "numeric", "numeric", "numeric"),
    stringsAsFactors = FALSE
  ))
  db$value_labels <- rbind(db$value_labels, data.frame(
    filecode = "998", wave = "B",
    variable_name = c(rep("brmpf", 4), rep("bsrt", 3), "bcount", "bwords"),
    value_numeric = c(-2, -1, 1, 2, -24, -22, -9.2, -1, -2),
    value_label = c(
      "valid score", "na, asked", "short version", "interview terminated",
      "non-valid, too many incomplete triplets", "test not done", NA, "na, asked", "zero on trial"
    ),
    is_missing = c(FALSE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
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
    bwords = c(-2, -5, 3, 0, 10),
    stringsAsFactors = FALSE
  )
}

relabel <- function(data, ...) {
  .lasa_apply_labels(data, filecode = "998", wave = "B", standardize = FALSE, ...)
}

test_that("a documented real negative code stays a value; the other negatives are missing", {
  local_negative_db()
  out <- relabel(negative_fixture())

  expect_s3_class(out$brmpf, "factor")
  expect_equal(
    as.character(out$brmpf),
    c("valid score", NA, "short version", NA, "interview terminated")
  )
  expect_equal(levels(out$brmpf), c("valid score", "short version", "interview terminated"))
  # bcount documents no real negative value, so an undocumented -7 is
  # still an undocumented missing code.
  expect_equal(as.vector(out$bcount), c(NA, 3, NA, 0, 2))
  # bwords' -2 = "zero on trial" is a real code, kept as documented; its
  # undocumented -5 is still a missing code.
  expect_equal(as.vector(out$bwords), c(-2, NA, 3, 0, 10))
})

test_that("a numeric variable documented with real negative values keeps undocumented negatives", {
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

test_that("the labelled (to_factor/to_numeric off) form keeps real negative values", {
  local_negative_db()
  out <- relabel(negative_fixture(), to_factor = FALSE, to_numeric = FALSE)

  expect_equal(as.vector(unclass(out$brmpf)), c(-2, NA, 1, NA, 2))
  expect_equal(as.vector(unclass(out$bsrt)), c(-6.4, -9.2, 1.5, NA, NA))
})

test_that("re-labelling already-converted output keeps real negative values", {
  local_negative_db()
  kept <- relabel(negative_fixture(), keep_user_na = TRUE, to_numeric = FALSE)
  # bsrt has value labels, so to_numeric = FALSE makes it a factor whose
  # undocumented values are levels named after their own number.
  expect_s3_class(kept$bsrt, "factor")

  out <- relabel(kept, keep_user_na = FALSE, to_numeric = FALSE)
  expect_equal(
    as.character(out$brmpf),
    c("valid score", NA, "short version", NA, "interview terminated")
  )
  expect_false("na, asked" %in% levels(out$brmpf))
  expect_equal(as.character(out$bsrt)[c(1, 3)], c("-6.4", "1.5"))
  expect_true(all(is.na(out$bsrt[4:5])))
  expect_false(any(c("test not done", "non-valid, too many incomplete triplets") %in% levels(out$bsrt)))
})

test_that("the documented missing/real split comes from the database's is_missing flag", {
  documented <- .lasa_documented_codes(
    data.frame(
      variable_name = "bx", value_numeric = c(-2, -1, 1), value_label = c("zero on trial", "na", "one"),
      is_missing = c(FALSE, TRUE, FALSE)
    ),
    "bx",
    data.frame(canonical_name = character(0), value_numeric = numeric(0), value_label = character(0), is_missing = logical(0)),
    "x"
  )
  expect_equal(documented$missing, -1)
  expect_equal(sort(documented$real), c(-2, 1))
  # A worded real code (`-2` = "zero on trial") doesn't make the variable's
  # other negative values real; a value listed without wording does.
  expect_false(.lasa_can_be_negative(documented, "numeric"))
  measured <- list(missing = -22, real = c(-9.2, 8), unworded = c(-9.2, 8))
  expect_true(.lasa_can_be_negative(measured, "numeric"))
  expect_false(.lasa_can_be_negative(measured, "categorical"))
  expect_false(.lasa_can_be_negative(list(missing = -1, real = c(0, 1), unworded = 1), "numeric"))

  # The wave's own documentation wins over the harmonized labels.
  wave_first <- .lasa_documented_codes(
    data.frame(variable_name = "ex", value_numeric = -1, value_label = "normal test", is_missing = FALSE),
    "ex",
    data.frame(canonical_name = "x", value_numeric = c(-1, -3), value_label = "na", is_missing = TRUE),
    "x"
  )
  expect_equal(wave_first$missing, -3)
  expect_equal(wave_first$real, -1)

  expect_equal(.lasa_is_missing_number(c(-5, -2, -1, 3, NA), documented), c(TRUE, FALSE, TRUE, FALSE, FALSE))
  expect_equal(
    .lasa_is_missing_number(c(-5, -2, -1, 3, NA), documented, infer_negative = FALSE),
    c(FALSE, FALSE, TRUE, FALSE, FALSE)
  )
})

test_that("value_labels(.not_missing) marks negative codes as real values in the build", {
  helpers <- testthat::test_path("..", "..", "data-raw", "label_db_helpers.R")
  skip_if_not(file.exists(helpers), "data-raw/ is not shipped with the built package")
  env <- new.env(parent = environment())
  sys.source(helpers, envir = env)

  local({
    var_types_vec <- c(rmpf = "categorical", walk = "numeric")
    variable_labels(rmpf = "Reason missing", walk = "Walking time", .applies_to_waves = c("Z", "B", "C"))
    value_labels(
      `-2` = "valid score", `-1` = "na, asked", `1` = "short version",
      .applies_to_vars = "rmpf", .applies_to_waves = c("Z", "B"), .not_missing = -2
    )
    value_labels(`-2` = "na, see WALK03", .applies_to_vars = "walk", .applies_to_waves = c("Z", "B", "C"))
    fc <- .lasa_finalize_fc("998")
    expect_equal(fc$not_missing$canonical_name, c("rmpf", "rmpf"))
    expect_setequal(fc$not_missing$LASA_Wave, c("all", "B"))
    expect_equal(fc$not_missing$code, c(-2, -2))
  }, envir = env)

  expect_error(
    env$value_labels(`-1` = "na", `1` = "yes", .applies_to_vars = "x", .applies_to_waves = "B", .not_missing = 1),
    "negative codes the same call declares"
  )
  expect_error(
    env$value_labels(`-1` = "na", .applies_to_vars = "x", .applies_to_waves = "B", .not_missing = -3),
    "negative codes the same call declares"
  )
})
