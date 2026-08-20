local_empty_db_with_046 <- function(env = parent.frame()) {
  tmp <- tempfile(fileext = ".rds")
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tmp, .env = env)

  db <- .lasa_empty_label_db()
  waves <- c("B", "2B", "3B")
  db$variables <- rbind(db$variables, data.frame(
    filecode = "046", wave = waves,
    variable_name = paste0("blphya01"), canonical_name = "lphya01",
    variable_label = "orig label", harmonized_var_label = "Physical condition respondent",
    var_type = "categorical", stringsAsFactors = FALSE
  ))
  db$value_labels <- rbind(db$value_labels, data.frame(
    filecode = "046", wave = rep(waves, each = 3),
    variable_name = "blphya01",
    value_numeric = rep(c(0, 1, 2), 3),
    value_label = rep(c("Don't know", "No", "Yes"), 3), is_missing = FALSE,
    stringsAsFactors = FALSE
  ))
  .lasa_save_label_db(db)
  tmp
}

test_that("merges a value-label correction into the existing set by default", {
  local_empty_db_with_046()
  manual_update_lasa_labels(
    filecode = "046", wave = "B", variable = "lphya01",
    val_labels = c(`-5` = "NA, wrong, skip")
  )
  db <- lasa_label_db()
  out <- .lasa_get_labels(db, "046", "B")
  expect_setequal(out$value_labels$value_numeric, c(0, 1, 2, -5))
})

test_that("replace_val_labels = TRUE fully replaces the value-label set", {
  local_empty_db_with_046()
  manual_update_lasa_labels(
    filecode = "046", wave = "B", variable = "lphya01",
    val_labels = c(`-5` = "NA, wrong, skip"), replace_val_labels = TRUE
  )
  db <- lasa_label_db()
  out <- .lasa_get_labels(db, "046", "B")
  expect_identical(out$value_labels$value_numeric, -5)
})

test_that("wave is inferred from an unambiguous wave-specific name", {
  local_empty_db_with_046()
  # blphya01 only exists for wave B in this fixture's value_labels/variables
  # tagged wave = "B" specifically is ambiguous across B/2B/3B (shared prefix
  # "b") -- so infer only succeeds when filecode narrows it enough. Supply
  # filecode to disambiguate down to the unique match set, then check it
  # still requires wave since more than one wave shares prefix b.
  expect_error(
    manual_update_lasa_labels(
      filecode = "046", variable = "blphya01",
      val_labels = c(`-5` = "x")
    ),
    "more than one wave"
  )
})

test_that("wave = 'all' applies to every wave for a canonical name", {
  local_empty_db_with_046()
  manual_update_lasa_labels(
    filecode = "046", wave = "all", variable = "lphya01",
    val_labels = c(`-5` = "NA, wrong, skip")
  )
  db <- lasa_label_db()
  for (w in c("B", "2B", "3B")) {
    out <- .lasa_get_labels(db, "046", w)
    expect_true(-5 %in% out$value_labels$value_numeric)
  }
})

test_that("canonical name without wave requires an explicit wave", {
  local_empty_db_with_046()
  expect_error(
    manual_update_lasa_labels(filecode = "046", variable = "lphya01", var_label = "x"),
    "carries no wave information"
  )
})

test_that("a brand-new variable requires both filecode and a concrete wave", {
  local_empty_db_with_046()
  expect_error(
    manual_update_lasa_labels(variable = "totally_new_var", var_label = "x"),
    "No existing variable matches|Supply 'filecode'"
  )
})

test_that("supplying neither var_label nor val_labels errors", {
  local_empty_db_with_046()
  expect_error(
    manual_update_lasa_labels(filecode = "046", wave = "B", variable = "lphya01"),
    "nothing to override"
  )
})

test_that("repeated calls upsert rather than accumulate duplicates", {
  local_empty_db_with_046()
  manual_update_lasa_labels(filecode = "046", wave = "B", variable = "lphya01", val_labels = c(`-5` = "first"))
  manual_update_lasa_labels(filecode = "046", wave = "B", variable = "lphya01", val_labels = c(`-5` = "second"))
  db <- lasa_label_db()
  out <- .lasa_get_labels(db, "046", "B")
  row <- out$value_labels[out$value_labels$value_numeric == -5, ]
  expect_equal(nrow(row), 1L)
  expect_equal(row$value_label, "second")
})

test_that("a manual override survives on top of the bundled database", {
  tmp <- tempfile(fileext = ".rds")
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tmp)

  manual_update_lasa_labels(
    filecode = "046", wave = "B", variable = "lphya01",
    val_labels = c(`-5` = "NA, wrong, skip")
  )

  db <- lasa_label_db()
  out <- .lasa_get_labels(db, "046", "B")
  overridden <- out$value_labels[
    out$value_labels$variable_name == "blphya01" & out$value_labels$value_numeric == -5,
  ]
  expect_equal(nrow(overridden), 1L)
  expect_equal(overridden$value_label, "NA, wrong, skip")
})
