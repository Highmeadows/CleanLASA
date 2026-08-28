# restore_lasa_labels(): the inverse of manual_update_lasa_labels() -- strips
# recorded overrides (entirely, or scoped) and/or rebuilds the cached base
# tables from the real bundled database. Two synthetic filecodes ("997",
# "998") so scoping behavior can be told apart.

local_two_filecode_db <- function(env = parent.frame()) {
  tmp <- tempfile(fileext = ".rds")
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tmp, .env = env)

  db <- .lasa_empty_label_db()
  db$variables <- rbind(db$variables, data.frame(
    filecode = c("997", "997", "998"),
    wave = c("B", "C", "B"),
    variable_name = c("bfoo01", "cfoo01", "bfoo02"),
    canonical_name = c("foo01", "foo01", "foo02"),
    variable_label = c("Question one (B)", "Question one (C)", "Question two"),
    harmonized_var_label = c("Harmonized one", "Harmonized one", "Harmonized two"),
    var_type = c("categorical", "categorical", "categorical"),
    stringsAsFactors = FALSE
  ))
  db$value_labels <- rbind(db$value_labels, data.frame(
    filecode = c("997", "997", "998"),
    wave = c("B", "C", "B"),
    variable_name = c("bfoo01", "cfoo01", "bfoo02"),
    value_numeric = c(1, 1, 1),
    value_label = c("yes", "yes", "yes"), is_missing = FALSE,
    stringsAsFactors = FALSE
  ))
  .lasa_save_label_db(db)
  tmp
}

test_that("no cache file: messages and no-ops without creating one", {
  tmp <- tempfile(fileext = ".rds")
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tmp)

  expect_message(result <- restore_lasa_labels(), "No local override cache")
  expect_false(file.exists(tmp))
  expect_equal(result$overrides_removed, 0L)
  expect_false(result$rebuilt)
  expect_false(result$cache_deleted)
})

test_that("a bare call strips every override, leaving base tables untouched", {
  tmp <- local_two_filecode_db()
  manual_update_lasa_labels(filecode = "997", wave = "B", variable = "bfoo01", val_labels = c(`-5` = "x"))
  manual_update_lasa_labels(filecode = "998", wave = "B", variable = "foo02", val_labels = c(`-5` = "y"))
  db_before <- readRDS(tmp)

  expect_message(result <- restore_lasa_labels(), "4 manual override row")
  expect_equal(result$overrides_removed, 4L)
  expect_false(result$rebuilt)
  expect_false(result$cache_deleted)
  expect_true(file.exists(tmp))

  db_after <- lasa_label_db()
  expect_equal(nrow(db_after$manual_overrides$variables), 0L)
  expect_equal(nrow(db_after$manual_overrides$value_labels), 0L)
  expect_identical(db_after$variables, db_before$variables)
  expect_identical(db_after$value_labels, db_before$value_labels)
})

test_that("filecode scope strips only that filecode's overrides", {
  local_two_filecode_db()
  manual_update_lasa_labels(filecode = "997", wave = "B", variable = "bfoo01", val_labels = c(`-5` = "x"))
  manual_update_lasa_labels(filecode = "998", wave = "B", variable = "foo02", val_labels = c(`-5` = "y"))

  restore_lasa_labels(filecode = "997")

  db <- lasa_label_db()
  expect_false(any(db$manual_overrides$variables$filecode == "997"))
  expect_true(any(db$manual_overrides$variables$filecode == "998"))
  out998 <- .lasa_get_labels(db, "998", "B")
  expect_true(-5 %in% out998$value_labels$value_numeric)
})

test_that("filecode+variable scope removes a wave = 'all' override in full, leaves a sibling variable", {
  local_two_filecode_db()
  # foo01 spans waves B and C in filecode 997 -- wave = "all" writes one row per wave.
  manual_update_lasa_labels(filecode = "997", wave = "all", variable = "foo01", val_labels = c(`-5` = "x"))
  manual_update_lasa_labels(filecode = "998", wave = "B", variable = "foo02", val_labels = c(`-5` = "y"))

  restore_lasa_labels(filecode = "997", variable = "foo01")

  db <- lasa_label_db()
  expect_false(any(db$manual_overrides$variables$filecode == "997"))
  out_c <- .lasa_get_labels(db, "997", "C")
  expect_false(-5 %in% out_c$value_labels$value_numeric)
  out998 <- .lasa_get_labels(db, "998", "B")
  expect_true(-5 %in% out998$value_labels$value_numeric)
})

test_that("rebuild = TRUE with no remaining overrides deletes the cache file entirely", {
  tmp <- local_two_filecode_db()
  manual_update_lasa_labels(filecode = "997", wave = "B", variable = "bfoo01", val_labels = c(`-5` = "x"))

  result <- restore_lasa_labels(rebuild = TRUE)
  expect_true(result$rebuilt)
  expect_true(result$cache_deleted)
  expect_false(file.exists(tmp))

  db <- lasa_label_db()
  expect_identical(db, lasa_label_db_bundled)
})

test_that("rebuild = TRUE with a surviving override keeps the cache, refreshes base tables", {
  tmp <- local_two_filecode_db()
  manual_update_lasa_labels(filecode = "997", wave = "B", variable = "bfoo01", val_labels = c(`-5` = "x"))
  manual_update_lasa_labels(filecode = "998", wave = "B", variable = "foo02", val_labels = c(`-5` = "y"))

  result <- restore_lasa_labels(filecode = "997", rebuild = TRUE)
  expect_true(result$rebuilt)
  expect_false(result$cache_deleted)
  expect_true(file.exists(tmp))

  db <- lasa_label_db()
  expect_identical(db$variables, lasa_label_db_bundled$variables)
  expect_identical(db$value_labels, lasa_label_db_bundled$value_labels)
  out998 <- .lasa_get_labels(db, "998", "B")
  expect_true(-5 %in% out998$value_labels$value_numeric)
})

test_that("rebuild = FALSE never deletes the cache file, even with zero overrides left", {
  tmp <- local_two_filecode_db()
  manual_update_lasa_labels(filecode = "997", wave = "B", variable = "bfoo01", val_labels = c(`-5` = "x"))

  result <- restore_lasa_labels(rebuild = FALSE)
  expect_false(result$cache_deleted)
  expect_true(file.exists(tmp))

  db <- lasa_label_db()
  expect_equal(nrow(db$manual_overrides$variables), 0L)
  # base tables preserved as-is, not silently swapped for bundled data
  expect_equal(nrow(db$variables), 3L)
})
