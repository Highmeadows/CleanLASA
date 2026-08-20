# .lasa_apply_labels() / apply_lasa_labels() exercised against a small,
# fully synthetic label database, so these tests are independent of
# lasa_label_db_bundled's actual PDF-derived coverage.

local_synthetic_db <- function(env = parent.frame()) {
  tmp <- tempfile(fileext = ".rds")
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tmp, .env = env)

  db <- .lasa_empty_label_db()
  db$variables <- rbind(db$variables, data.frame(
    filecode = "999", wave = c("B", "B", "B"),
    variable_name = c("bfoo01", "bfoo02", "bfoo03"),
    canonical_name = c("foo01", "foo02", "foo03"),
    variable_label = c("Question one", "Question two (numeric)", "Question three"),
    harmonized_var_label = c("Harmonized question one", "Harmonized question two", "Harmonized question three"),
    var_type = c("categorical", "numeric", "categorical"),
    stringsAsFactors = FALSE
  ))
  db$value_labels <- rbind(db$value_labels, data.frame(
    filecode = "999", wave = c("B", "B", "B"),
    variable_name = c("bfoo01", "bfoo01", "bfoo02"),
    value_numeric = c(1, 2, -1),
    value_label = c("no", "yes", "na, asked"), is_missing = c(FALSE, FALSE, TRUE),
    stringsAsFactors = FALSE
  ))
  db$value_labels_harmonized <- rbind(db$value_labels_harmonized, data.frame(
    filecode = "999", canonical_name = c("foo01", "foo01"),
    value_numeric = c(1, 2),
    value_label = c("harmonized no", "harmonized yes"), is_missing = FALSE,
    stringsAsFactors = FALSE
  ))
  .lasa_save_label_db(db)
  tmp
}

fixture <- function() {
  data.frame(
    RespNr = 1:3,
    BFOO01 = c(1, 2, 1),
    BFOO02 = c(-1, 5, 10),
    stringsAsFactors = FALSE
  )
}

test_that("label/labels/original_labels/original_values are attached", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B")

  expect_equal(attr(out$BFOO01, "label"), "Question one")
  expect_equal(unname(attr(out$BFOO01, "labels")), c(1, 2))
  expect_equal(unname(attr(out$BFOO01, "original_values")), c(1, 2, 1))
  expect_false(is.null(attr(out$BFOO01, "original_labels")))
})

test_that("canonical_name/harmonized_label/labels_harmonized are attached", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B")

  expect_equal(attr(out$BFOO01, "canonical_name"), "foo01")
  expect_equal(attr(out$BFOO01, "harmonized_label"), "Harmonized question one")
  expect_equal(
    unname(attr(out$BFOO01, "labels_harmonized")),
    c(1, 2)
  )
  expect_equal(
    names(attr(out$BFOO01, "labels_harmonized")),
    c("harmonized no", "harmonized yes")
  )
  # foo02 has no value_labels_harmonized rows at all -- attribute is absent, not an empty vector.
  expect_null(attr(out$BFOO02, "labels_harmonized"))
  expect_equal(attr(out$BFOO02, "canonical_name"), "foo02")
})

test_that("to_numeric restores numeric-classified variables and converts negatives to NA", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B", to_numeric = TRUE)
  expect_true(is.na(out$BFOO02[[1]]))
  expect_equal(out$BFOO02[2:3], c(5, 10))
  expect_equal(unname(attr(out$BFOO02, "original_values")), c(-1, 5, 10))
})

test_that("to_factor converts categorical variables using value labels as levels", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B", to_factor = TRUE)
  expect_true(is.factor(out$BFOO01))
  expect_equal(as.character(out$BFOO01), c("no", "yes", "no"))
})

test_that("standardize_names implies split_wavecode and renames to canonical names", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B", standardize_names = TRUE)
  expect_true(all(c("respnr", "LASA_wave", "foo01", "foo02") %in% names(out)))
  expect_false("bfoo01" %in% names(out))
})

test_that("split_wavecode alone renames columns but leaves respnr untouched", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B", split_wavecode = TRUE)
  expect_true("RespNr" %in% names(out))
  expect_true("LASA_wave" %in% names(out))
  expect_true(all(out$LASA_wave == "B"))
})

test_that("name_corrections overrides automatic matching", {
  local_synthetic_db()
  dat <- fixture()
  names(dat)[names(dat) == "BFOO01"] <- "TYPO_COL"
  out <- .lasa_apply_labels(dat, filecode = "999", wave = "B", name_corrections = c(foo01 = "TYPO_COL"))
  expect_equal(attr(out$TYPO_COL, "label"), "Question one")
})

test_that("respnr is standardized and reported", {
  local_synthetic_db()
  dat <- fixture()
  names(dat)[[1]] <- "RESPNR"
  out <- .lasa_apply_labels(dat, filecode = "999", wave = "B", standardize_names = TRUE)
  expect_true("respnr" %in% names(out))
  report <- lasa_label_report(out)
  expect_true("respnr" %in% report$suffix)
})

test_that("an unmatched documented variable is left untouched and reported as not found", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B")
  report <- lasa_label_report(out)
  foo03_row <- report[report$suffix == "bfoo03", ]
  expect_equal(nrow(foo03_row), 1L)
  expect_equal(foo03_row$method, "not found")
})

test_that("a derived column not documented for this filecode/wave is never touched", {
  local_synthetic_db()
  dat <- fixture()
  dat$my_derived_column <- 1:3
  out <- .lasa_apply_labels(dat, filecode = "999", wave = "B")
  expect_identical(out$my_derived_column, 1:3)
  expect_null(attr(out$my_derived_column, "label"))
})

test_that("label_report records manual overrides distinctly", {
  local_synthetic_db()
  manual_update_lasa_labels(filecode = "999", wave = "B", variable = "foo01", var_label = "corrected")
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B")
  expect_equal(attr(out$BFOO01, "label"), "corrected")
  report <- lasa_label_report(out)
  row <- report[report$suffix == "bfoo01", ]
  expect_match(row$method, "manual override")
})
