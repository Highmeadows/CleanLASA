# Negative values that are measurements, not missing codes. A discrete
# negative code is always a missing-value code, even when its label names
# a valid answer (`-2` = "valid score" explains why a "reason missing"
# value is missing). The exceptions are a measurement the documentation
# lists among the codes, such as a `-9.2` dB threshold (database
# is_missing = FALSE), and a variable whose genuine values can be negative
# (database can_be_negative), so an undocumented negative number in it is
# a measurement.

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
    variable_name = c(rep("brmpf", 4), rep("bsrt", 3), "bcount"),
    value_numeric = c(-2, -1, 1, 2, -24, -22, -9.2, -1),
    value_label = c(
      "valid score", "na, asked", "short version", "interview terminated",
      "non-valid, too many incomplete triplets", "test not done", NA, "na, asked"
    ),
    is_missing = c(TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE),
    stringsAsFactors = FALSE
  ))
  # The harmonized labels call -9.2 a missing code; wave B documents it as
  # a measurement.
  db$value_labels_harmonized <- rbind(db$value_labels_harmonized, data.frame(
    filecode = "998", canonical_name = "srt",
    value_numeric = c(-24, -22, -9.2),
    value_label = "not available",
    is_missing = TRUE,
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

test_that("a discrete negative code is missing, even when its label names a valid answer", {
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
  # undocumented values are levels named after their own number. -9.2 is
  # documented without wording, so its level is its own number too.
  expect_s3_class(kept$bsrt, "factor")
  expect_equal(as.character(kept$bsrt)[1:3], c("-6.4", "-9.2", "1.5"))

  out <- relabel(kept, keep_user_na = FALSE, to_numeric = FALSE)
  expect_equal(as.character(out$brmpf), c(NA, NA, "short version", NA, "interview terminated"))
  expect_false(any(c("valid score", "na, asked") %in% levels(out$brmpf)))
  expect_equal(as.character(out$bsrt)[1:3], c("-6.4", "-9.2", "1.5"))
  expect_true(all(is.na(out$bsrt[4:5])))
  expect_false(any(c("test not done", "non-valid, too many incomplete triplets") %in% levels(out$bsrt)))
})

test_that("a wave's measurement keeps its own label text under harmonized value labels", {
  local_negative_db()
  out <- .lasa_apply_labels(negative_fixture(), filecode = "998", wave = "B", to_numeric = FALSE)

  expect_equal(as.character(out$srt), c("-6.4", "-9.2", "1.5", NA, NA))
  expect_false("not available" %in% levels(out$srt))
  # The reference attribute still shows the harmonized labels as documented.
  expect_true(-9.2 %in% attr(out$srt, "labels_harmonized"))

  kept <- .lasa_apply_labels(negative_fixture(), filecode = "998", wave = "B", to_numeric = FALSE, keep_user_na = TRUE)
  expect_equal(
    as.character(kept$srt),
    c("-6.4", "-9.2", "1.5", "not available [-22]", "not available [-24]")
  )
})

test_that("a manual label correction keeps a documented code's meaning", {
  local_negative_db()
  fixture <- data.frame(respnr = 1:4, bsrt = c(-9.2, -23, -9.4, 2))

  manual_update_lasa_labels(
    filecode = "998", wave = "B", variable = "bsrt",
    val_labels = c(`-9.2` = "-9.2 dB", `-23` = "aborted", `-9.4` = "-9.4 dB")
  )
  # -9.2 stays a measurement; the new -23 and -9.4 are missing codes.
  expect_equal(as.vector(relabel(fixture)$bsrt), c(-9.2, NA, NA, 2))

  manual_update_lasa_labels(
    filecode = "998", wave = "B", variable = "bsrt",
    val_labels = c(`-9.4` = "-9.4 dB"), not_missing = -9.4
  )
  expect_equal(as.vector(relabel(fixture)$bsrt), c(-9.2, NA, -9.4, 2))

  # A later text-only correction keeps the earlier correction's meaning.
  manual_update_lasa_labels(filecode = "998", wave = "B", variable = "bsrt", val_labels = c(`-9.4` = "-9.4 dB SNR"))
  expect_equal(as.vector(relabel(fixture)$bsrt), c(-9.2, NA, -9.4, 2))

  expect_error(
    manual_update_lasa_labels(filecode = "998", wave = "B", variable = "bsrt", val_labels = c(`-1` = "na"), not_missing = -3),
    "negative codes that 'val_labels' labels"
  )
  expect_error(
    manual_update_lasa_labels(filecode = "998", wave = "B", variable = "bsrt", val_labels = c(`1` = "one"), not_missing = 1),
    "negative codes that 'val_labels' labels"
  )
})

test_that("the documented missing/real split comes from the database's is_missing flag", {
  documented <- .lasa_documented_codes(
    data.frame(
      variable_name = "bx", value_numeric = c(-9.2, -1, 1), value_label = c(NA, "na", "one"),
      is_missing = c(FALSE, TRUE, FALSE)
    ),
    "bx",
    data.frame(canonical_name = character(0), value_numeric = numeric(0), value_label = character(0), is_missing = logical(0)),
    "x"
  )
  expect_equal(documented$missing, -1)
  expect_equal(sort(documented$real), c(-9.2, 1))

  # The wave's own documentation wins over the harmonized labels.
  wave_first <- .lasa_documented_codes(
    data.frame(variable_name = "ex", value_numeric = -9.2, value_label = NA, is_missing = FALSE),
    "ex",
    data.frame(canonical_name = "x", value_numeric = c(-9.2, -3), value_label = "not available", is_missing = TRUE),
    "x"
  )
  expect_equal(wave_first$missing, -3)
  expect_equal(wave_first$real, -9.2)

  expect_equal(.lasa_is_missing_number(c(-5, -9.2, -1, 3, NA), documented), c(TRUE, FALSE, TRUE, FALSE, FALSE))
  expect_equal(
    .lasa_is_missing_number(c(-5, -9.2, -1, 3, NA), documented, infer_negative = FALSE),
    c(FALSE, FALSE, TRUE, FALSE, FALSE)
  )
})

test_that("a local database saved without can_be_negative still labels", {
  local_negative_db()
  db <- .lasa_load_label_db()
  db$variables$can_be_negative <- NULL
  .lasa_save_label_db(db)

  out <- relabel(negative_fixture())
  expect_equal(as.vector(out$bsrt), c(NA, -9.2, 1.5, NA, NA))
  expect_equal(as.character(out$brmpf)[3], "short version")
})

test_that("value_labels(.not_missing) and negative_values() reach the build", {
  helpers <- testthat::test_path("..", "..", "data-raw", "label_db_helpers.R")
  skip_if_not(file.exists(helpers), "data-raw/ is not shipped with the built package")
  env <- new.env(parent = environment())
  sys.source(helpers, envir = env)

  local({
    var_types_vec <- c(rmpf = "categorical", srt = "numeric")
    variable_labels(rmpf = "Reason missing", .applies_to_waves = c("Z", "B", "C"))
    variable_labels(srt = "Speech-reception threshold (in dB)", .applies_to_waves = c("Z", "C"))
    negative_values("srt", .applies_to_waves = "C")
    value_labels(
      `-24` = "non-valid", `-22` = "test not done", `-9.2` = NA_character_,
      .applies_to_vars = "srt", .applies_to_waves = c("Z", "C"), .not_missing = -9.2
    )
    value_labels(`-2` = "valid score", `-1` = "na, asked", .applies_to_vars = "rmpf", .applies_to_waves = c("Z", "B", "C"))
    fc <- .lasa_finalize_fc("998")
    expect_equal(fc$not_missing$canonical_name, c("srt", "srt"))
    expect_setequal(fc$not_missing$LASA_Wave, c("all", "C"))
    expect_equal(fc$not_missing$code, c(-9.2, -9.2))
    expect_equal(fc$negative_values, data.frame(LASA_Wave = "C", canonical_name = "srt", stringsAsFactors = FALSE))

    var_types_vec <- c(srt = "numeric")
    variable_labels(srt = "Speech-reception threshold (in dB)", .applies_to_waves = c("Z", "C"))
    negative_values("srt", .applies_to_waves = "B")
    expect_error(.lasa_finalize_fc("997"), "doesn't cover it there")
  }, envir = env)

  expect_error(
    env$value_labels(`-1` = "na", `1` = "yes", .applies_to_vars = "x", .applies_to_waves = "B", .not_missing = 1),
    "negative codes the same call declares"
  )
  expect_error(
    env$value_labels(`-1` = "na", .applies_to_vars = "x", .applies_to_waves = "B", .not_missing = -3),
    "negative codes the same call declares"
  )
  expect_error(env$negative_values("x", .applies_to_waves = "Z"), "real waves")
  env$.lasa_reset_dsl_state()
})

test_that("the bundled database treats discrete codes as missing and keeps measurements", {
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tempfile(fileext = ".rds"))

  # "valid score" explains why a performance-test score is missing.
  path <- write_lasa_sav(data.frame(respnr = 1:4, brmpf = c(-2, 1, -1, 2)), "LASAB034.SAV")
  out <- read_lasa_sav(path, standardize = FALSE)
  expect_s3_class(out$brmpf, "factor")
  expect_equal(as.character(out$brmpf), c(NA, "short version", NA, "interview terminated"))

  path <- write_lasa_sav(data.frame(respnr = 1:3, gqeoldt1 = c(-1, 0, -2)), "LASAG148.SAV")
  expect_equal(as.character(read_lasa_sav(path)$qeoldt1), c(NA, "not mentioned", NA))

  # A speech-reception threshold in dB: real values are negative, the
  # documented -22/-23/-24 are missing codes, and the listed -9.2 is a
  # measured threshold.
  path <- write_lasa_sav(
    data.frame(respnr = 1:5, emsrttn = c(-6.4, -9.2, 1.5, -22, -24)),
    "LASAE193.SAV"
  )
  out <- read_lasa_sav(path, standardize = FALSE)
  expect_equal(as.vector(out$emsrttn), c(-6.4, -9.2, 1.5, NA, NA))
  expect_equal(as.character(read_lasa_sav(path, to_numeric = FALSE)$msrttn), c("-6.4", "-9.2", "1.5", NA, NA))

  kept <- read_lasa_sav(path, standardize = FALSE, keep_user_na = TRUE)
  expect_equal(sort(attr(kept$emsrttn, "na_values")), c(-24, -23, -22))

  # Retention as a difference is negative when words are forgotten; only
  # its documented -1/-2 codes are missing.
  path <- write_lasa_sav(data.frame(respnr = 1:4, dmret1pc = c(-5, -1, -2, 3)), "LASAD356.SAV")
  expect_equal(as.vector(read_lasa_sav(path)$mret1pc), c(-5, NA, NA, 3))
})
