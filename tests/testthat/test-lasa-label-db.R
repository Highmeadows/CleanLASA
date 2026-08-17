test_that("an empty database is valid and correctly shaped", {
  db <- .lasa_empty_label_db()
  expect_identical(.lasa_validate_label_db(db), character(0))
  expect_true(.lasa_is_label_db_shaped(db))
})

test_that("validation catches duplicate variable keys", {
  db <- .lasa_empty_label_db()
  db$variables <- rbind(
    db$variables[0, ][1, ], db$variables[0, ][1, ]
  )
  db$variables$filecode <- "046"
  db$variables$wave <- "B"
  db$variables$variable_name <- "blphya01"
  problems <- .lasa_validate_label_db(db)
  expect_true(any(grepl("duplicate.*variables", problems)))
})

test_that("validation catches value_labels rows with no matching variable", {
  db <- .lasa_empty_label_db()
  db$value_labels <- db$value_labels[0, ][1, ]
  db$value_labels$filecode <- "046"
  db$value_labels$wave <- "B"
  db$value_labels$variable_name <- "blphya01"
  db$value_labels$value_raw <- "1"
  problems <- .lasa_validate_label_db(db)
  expect_true(any(grepl("not present in 'variables'", problems)))
})

test_that("manual_overrides compose on top of base rows: merge vs. replace", {
  db <- .lasa_empty_label_db()
  db$variables <- rbind(db$variables, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    canonical_name = "lphya01", variable_label = "orig label",
    document_id = "doc1", source_page = 1L, source_row = 1L,
    source_condition = NA_character_, parse_note = NA_character_,
    var_type = "categorical", stringsAsFactors = FALSE
  ))
  db$value_labels <- rbind(db$value_labels, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    value_raw = c("0", "1", "2"), value_numeric = c(0, 1, 2),
    value_label = c("Don't know", "No", "Yes"), is_missing = FALSE,
    document_id = "doc1", source_page = 1L, source_row = 1L,
    source_condition = NA_character_, parse_note = NA_character_,
    stringsAsFactors = FALSE
  ))

  db$manual_overrides$variables <- rbind(db$manual_overrides$variables, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    variable_label = NA_character_, replace_value_labels = FALSE,
    applied_at = Sys.time(), note = NA_character_, stringsAsFactors = FALSE
  ))
  db$manual_overrides$value_labels <- rbind(db$manual_overrides$value_labels, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    value_raw = "-5", value_numeric = -5, value_label = "NA, wrong, skip",
    is_missing = TRUE, applied_at = Sys.time(), note = NA_character_,
    stringsAsFactors = FALSE
  ))

  merged <- .lasa_get_labels(db, "046", "B")
  expect_setequal(merged$value_labels$value_raw, c("0", "1", "2", "-5"))

  db$manual_overrides$variables$replace_value_labels <- TRUE
  replaced <- .lasa_get_labels(db, "046", "B")
  expect_identical(replaced$value_labels$value_raw, "-5")
})

test_that("manual variable_label override wins and is flagged manual_override", {
  db <- .lasa_empty_label_db()
  db$variables <- rbind(db$variables, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    canonical_name = "lphya01", variable_label = "orig label",
    document_id = "doc1", source_page = 1L, source_row = 1L,
    source_condition = NA_character_, parse_note = NA_character_,
    var_type = "categorical", stringsAsFactors = FALSE
  ))
  db$manual_overrides$variables <- rbind(db$manual_overrides$variables, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    variable_label = "corrected label", replace_value_labels = FALSE,
    applied_at = Sys.time(), note = NA_character_, stringsAsFactors = FALSE
  ))

  out <- .lasa_get_labels(db, "046", "B")
  expect_equal(out$variables$variable_label, "corrected label")
  expect_true(out$variables$manual_override)
})

test_that("lasa_label_db() returns the currently active (bundled) database", {
  db <- lasa_label_db()
  expect_true(.lasa_is_label_db_shaped(db))
  expect_gt(nrow(db$variables), 0L)
})

test_that("filecode/wave normalization is applied when looking up labels", {
  db <- .lasa_empty_label_db()
  db$variables <- rbind(db$variables, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    canonical_name = "lphya01", variable_label = "l",
    document_id = "doc1", source_page = 1L, source_row = 1L,
    source_condition = NA_character_, parse_note = NA_character_,
    var_type = "categorical", stringsAsFactors = FALSE
  ))
  out <- .lasa_get_labels(db, "LASA046", "b")
  expect_equal(nrow(out$variables), 1L)
})
