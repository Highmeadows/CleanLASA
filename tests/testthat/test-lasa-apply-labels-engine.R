# .lasa_apply_labels() / apply_lasa_labels() exercised against a small,
# fully synthetic label database, so these tests are independent of
# lasa_label_db_bundled's actual coverage.

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

test_that("label/labels/wave_label/labels_wave are attached", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B", standardize = FALSE, to_factor = FALSE, to_numeric = FALSE)

  expect_equal(attr(out$BFOO01, "label"), "Question one")
  expect_equal(attr(out$BFOO01, "wave_label"), "Question one")
  expect_equal(unname(attr(out$BFOO01, "labels")), c(1, 2))
  expect_equal(unname(attr(out$BFOO01, "labels_wave")), c(1, 2))
})

test_that("canonical_name/harmonized_label/labels_harmonized are attached", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B", standardize = FALSE, to_factor = FALSE, to_numeric = FALSE)

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
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B", standardize = FALSE, to_numeric = TRUE, to_factor = FALSE)
  expect_true(is.na(out$BFOO02[[1]]))
  expect_equal(out$BFOO02[2:3], c(5, 10))
})

test_that("to_factor converts categorical variables using value labels as levels", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B", standardize = FALSE, to_factor = TRUE, to_numeric = FALSE)
  expect_true(is.factor(out$BFOO01))
  expect_equal(as.character(out$BFOO01), c("no", "yes", "no"))
})

test_that(".standardize_names implies add_wavecode and renames to canonical names", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B", .standardize_names = TRUE)
  expect_true(all(c("respnr", "Wave", "foo01", "foo02") %in% names(out)))
  expect_false("bfoo01" %in% names(out))
})

test_that("add_wavecode alone inserts a Wave column without renaming other columns", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B", .standardize_names = FALSE, add_wavecode = TRUE)
  expect_true("RespNr" %in% names(out))
  expect_true("Wave" %in% names(out))
  expect_true(all(out$Wave == "B"))
  # inserted right after respnr
  expect_equal(match("Wave", names(out)), match("RespNr", names(out)) + 1L)
})

test_that("add_wavecode = FALSE with standardize = FALSE adds no Wave column", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B", standardize = FALSE, add_wavecode = FALSE)
  expect_false("Wave" %in% names(out))
  expect_true("BFOO01" %in% names(out))
})

test_that(".standardize_var_labels/.standardize_val_labels are independent switches", {
  local_synthetic_db()
  out_default <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B", .standardize_names = FALSE)
  expect_equal(attr(out_default$BFOO01, "label"), "Harmonized question one")
  expect_equal(unname(attr(out_default$BFOO01, "labels")), c(1, 2))
  expect_equal(names(attr(out_default$BFOO01, "labels")), c("harmonized no", "harmonized yes"))

  out_mixed <- .lasa_apply_labels(
    fixture(), filecode = "999", wave = "B", .standardize_names = FALSE,
    .standardize_var_labels = FALSE, .standardize_val_labels = TRUE
  )
  expect_equal(attr(out_mixed$BFOO01, "label"), "Question one")
  expect_equal(names(attr(out_mixed$BFOO01, "labels")), c("harmonized no", "harmonized yes"))

  out_none <- .lasa_apply_labels(
    fixture(), filecode = "999", wave = "B", .standardize_names = FALSE,
    standardize = TRUE, .standardize_var_labels = FALSE, .standardize_val_labels = FALSE
  )
  expect_equal(attr(out_none$BFOO01, "label"), "Question one")
  expect_equal(names(attr(out_none$BFOO01, "labels")), c("no", "yes"))
})

test_that("name_corrections overrides automatic matching", {
  local_synthetic_db()
  dat <- fixture()
  names(dat)[names(dat) == "BFOO01"] <- "TYPO_COL"
  out <- .lasa_apply_labels(dat, filecode = "999", wave = "B", standardize = FALSE, name_corrections = c(foo01 = "TYPO_COL"))
  expect_equal(attr(out$TYPO_COL, "label"), "Question one")
})

test_that("respnr is matched through the normal chain and reported", {
  local_synthetic_db()
  dat <- fixture()
  names(dat)[[1]] <- "RESPNR"
  out <- .lasa_apply_labels(dat, filecode = "999", wave = "B", .standardize_names = TRUE)
  expect_true("respnr" %in% names(out))
  report <- lasa_label_report(out)
  respnr_row <- report[report$suffix == "respnr" & !is.na(report$suffix), ]
  expect_equal(nrow(respnr_row), 1L)
  expect_equal(respnr_row$direction, "matched")
})

test_that("an unmatched documented variable is left untouched and reported", {
  local_synthetic_db()
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B")
  report <- lasa_label_report(out)
  foo03_row <- report[report$suffix == "bfoo03" & !is.na(report$suffix), ]
  expect_equal(nrow(foo03_row), 1L)
  expect_equal(foo03_row$method, "not found")
  expect_equal(foo03_row$direction, "documented_not_in_data")
})

test_that("a data column not documented for this filecode/wave is never touched, and reported in reverse", {
  local_synthetic_db()
  dat <- fixture()
  dat$my_derived_column <- 1:3
  out <- .lasa_apply_labels(dat, filecode = "999", wave = "B")
  expect_identical(out$my_derived_column, 1:3)
  expect_null(attr(out$my_derived_column, "label"))

  report <- lasa_label_report(out)
  extra_row <- report[report$matched_name == "my_derived_column" & !is.na(report$matched_name) & is.na(report$suffix), ]
  expect_equal(nrow(extra_row), 1L)
  expect_equal(extra_row$method, "undocumented column")
  expect_equal(extra_row$direction, "data_not_documented")
})

test_that("label_report records manual overrides distinctly", {
  local_synthetic_db()
  manual_update_lasa_labels(filecode = "999", wave = "B", variable = "foo01", var_label = "corrected")
  out <- .lasa_apply_labels(fixture(), filecode = "999", wave = "B", .standardize_names = FALSE, .standardize_var_labels = FALSE)
  expect_equal(attr(out$BFOO01, "label"), "corrected")
  report <- lasa_label_report(out)
  row <- report[report$suffix == "bfoo01" & !is.na(report$suffix), ]
  expect_match(row$method, "manual override")
})

test_that("problems_only surfaces both directions plus fuzzy/ambiguous methods", {
  local_synthetic_db()
  dat <- fixture()
  dat$extra_col <- 1:3
  out <- .lasa_apply_labels(dat, filecode = "999", wave = "B")
  problems <- lasa_label_report(out, problems_only = TRUE)
  expect_true(all(problems$direction %in% c("documented_not_in_data", "data_not_documented")))
  expect_true("bfoo03" %in% problems$suffix)
  expect_true("extra_col" %in% problems$matched_name)
  expect_false("bfoo01" %in% problems$suffix)
})

## -- Fuzzy matching -----------------------------------------------------

local_fuzzy_db <- function(env = parent.frame()) {
  tmp <- tempfile(fileext = ".rds")
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tmp, .env = env)

  db <- .lasa_empty_label_db()
  db$variables <- rbind(db$variables, data.frame(
    filecode = "998", wave = c("B", "B"),
    variable_name = c("bfoo04", "bfoo05"),
    canonical_name = c("foo04", "foo05"),
    variable_label = c("Question four", "Question five"),
    harmonized_var_label = c(NA_character_, NA_character_),
    var_type = c("categorical", "categorical"),
    stringsAsFactors = FALSE
  ))
  .lasa_save_label_db(db)
  tmp
}

test_that("fuzzy_matching resolves a unique near match and records edit_distance", {
  local_fuzzy_db()
  dat <- data.frame(RespNr = 1:3, BFOO4 = c(1, 2, 1), stringsAsFactors = FALSE) # missing the "0"
  out <- .lasa_apply_labels(dat, filecode = "998", wave = "B", fuzzy_matching = TRUE, standardize = FALSE)
  expect_false(is.null(attr(out$BFOO4, "canonical_name")))
  report <- lasa_label_report(out)
  row <- report[report$suffix == "bfoo04" & !is.na(report$suffix), ]
  expect_equal(row$method, "fuzzy")
  expect_equal(row$edit_distance, 1L)
})

test_that("a fuzzy tie is left unmatched as ambiguous fuzzy", {
  local_fuzzy_db()
  # Both candidates are equidistant from the expected "bfoo05"/"foo05" names.
  dat <- data.frame(RespNr = 1:3, BFOO5A = c(1, 2, 1), BFOO5B = c(2, 1, 2), stringsAsFactors = FALSE)
  out <- .lasa_apply_labels(dat, filecode = "998", wave = "B", fuzzy_matching = TRUE, standardize = FALSE)
  report <- lasa_label_report(out)
  row <- report[report$suffix == "bfoo05" & !is.na(report$suffix), ]
  expect_equal(row$method, "ambiguous fuzzy")
  expect_true(is.na(row$matched_name))
  # Neither candidate column was touched.
  expect_null(attr(out$BFOO5A, "canonical_name"))
  expect_null(attr(out$BFOO5B, "canonical_name"))
})

test_that("fuzzy_matching = FALSE disables the fuzzy step", {
  local_fuzzy_db()
  dat <- data.frame(RespNr = 1:3, BFOO4 = c(1, 2, 1), stringsAsFactors = FALSE)
  out <- .lasa_apply_labels(dat, filecode = "998", wave = "B", fuzzy_matching = FALSE, standardize = FALSE)
  report <- lasa_label_report(out)
  row <- report[report$suffix == "bfoo04" & !is.na(report$suffix), ]
  expect_equal(row$method, "not found")
  expect_null(attr(out$BFOO4, "canonical_name"))
})

## -- var_type == "text" (inconsistent harmonized coding) ----------------

## Two waves of the same canonical name, "foo06", coded with different (and
## deliberately flipped) numeric->meaning mappings -- 0=no/1=yes in wave B,
## 1=no/2=yes in wave C -- modelling the real scenario this fallback exists
## for (see data-raw/build_lasa_label_db.R's placeholder-label detection):
## var_type == "text" and zero value_labels_harmonized rows for "foo06".
local_text_fallback_db <- function(env = parent.frame()) {
  tmp <- tempfile(fileext = ".rds")
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tmp, .env = env)

  db <- .lasa_empty_label_db()
  db$variables <- rbind(db$variables, data.frame(
    filecode = "997", wave = c("B", "C"),
    variable_name = c("bfoo06", "cfoo06"),
    canonical_name = c("foo06", "foo06"),
    variable_label = c("Question six (B)", "Question six (C)"),
    harmonized_var_label = c(NA_character_, NA_character_),
    var_type = c("text", "text"),
    stringsAsFactors = FALSE
  ))
  db$value_labels <- rbind(db$value_labels, data.frame(
    filecode = "997", wave = c("B", "B", "C", "C"),
    variable_name = c("bfoo06", "bfoo06", "cfoo06", "cfoo06"),
    value_numeric = c(0, 1, 1, 2),
    value_label = c("no", "yes", "no", "yes"), is_missing = FALSE,
    stringsAsFactors = FALSE
  ))
  # No value_labels_harmonized rows at all for "foo06" -- this is the
  # build-time-suppressed state a placeholder-labelled variable ends up in.
  .lasa_save_label_db(db)
  tmp
}

test_that("var_type == \"text\" recodes to wave-specific label text, never a factor", {
  local_text_fallback_db()
  dat <- data.frame(RespNr = 1:3, BFOO06 = c(0, 1, 0), stringsAsFactors = FALSE)
  out <- .lasa_apply_labels(dat, filecode = "997", wave = "B", standardize = FALSE, to_factor = TRUE)

  expect_type(out$BFOO06, "character")
  expect_false(is.factor(out$BFOO06))
  expect_equal(as.vector(out$BFOO06), c("no", "yes", "no"))
  expect_null(attr(out$BFOO06, "labels_harmonized"))
  expect_null(attr(out$BFOO06, "harmonized_label"))
})

test_that("var_type == \"text\" ignores .standardize_val_labels/standardize (nothing harmonized exists)", {
  local_text_fallback_db()
  dat <- data.frame(RespNr = 1:3, BFOO06 = c(0, 1, 0), stringsAsFactors = FALSE)
  out <- .lasa_apply_labels(
    dat, filecode = "997", wave = "B", standardize = TRUE,
    .standardize_names = FALSE, .standardize_val_labels = TRUE
  )
  expect_equal(unname(attr(out$BFOO06, "labels")), c(0, 1))
  expect_equal(names(attr(out$BFOO06, "labels")), c("no", "yes"))
  expect_equal(as.vector(out$BFOO06), c("no", "yes", "no"))
})

test_that("var_type == \"text\" with to_factor = FALSE leaves the original numeric codes untouched", {
  local_text_fallback_db()
  dat <- data.frame(RespNr = 1:3, BFOO06 = c(0, 1, 0), stringsAsFactors = FALSE)
  out <- .lasa_apply_labels(dat, filecode = "997", wave = "B", standardize = FALSE, to_factor = FALSE)
  expect_equal(as.vector(out$BFOO06), c(0, 1, 0))
})

test_that("two waves with disagreeing numeric codes merge correctly once recoded to text", {
  local_text_fallback_db()
  dat_b <- data.frame(RespNr = 1:3, BFOO06 = c(0, 1, 0), stringsAsFactors = FALSE) # 0=no, 1=yes
  dat_c <- data.frame(RespNr = 4:6, CFOO06 = c(1, 2, 1), stringsAsFactors = FALSE) # 1=no, 2=yes

  out_b <- .lasa_apply_labels(dat_b, filecode = "997", wave = "B", .standardize_names = TRUE)
  out_c <- .lasa_apply_labels(dat_c, filecode = "997", wave = "C", .standardize_names = TRUE)

  expect_equal(as.vector(out_b$foo06), c("no", "yes", "no"))
  expect_equal(as.vector(out_c$foo06), c("no", "yes", "no"))
  # Same conceptual answers, opposite numeric codes -- combining on the
  # text values (not the original codes) is exactly the point.
  expect_equal(as.vector(c(out_b$foo06, out_c$foo06)), rep(c("no", "yes", "no"), 2))
})
