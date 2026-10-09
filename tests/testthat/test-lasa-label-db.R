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
  db$value_labels$value_numeric <- 1
  problems <- .lasa_validate_label_db(db)
  expect_true(any(grepl("not present in 'variables'", problems)))
})

test_that("validation catches value_labels_harmonized rows with no matching variable", {
  db <- .lasa_empty_label_db()
  db$value_labels_harmonized <- db$value_labels_harmonized[0, ][1, ]
  db$value_labels_harmonized$filecode <- "046"
  db$value_labels_harmonized$canonical_name <- "lphya01"
  db$value_labels_harmonized$value_numeric <- 1
  problems <- .lasa_validate_label_db(db)
  expect_true(any(grepl("value_labels_harmonized.*not present in 'variables'", problems)))
})

test_that("manual_overrides compose on top of base rows: merge vs. replace", {
  db <- .lasa_empty_label_db()
  db$variables <- rbind(db$variables, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    canonical_name = "lphya01", variable_label = "orig label",
    harmonized_var_label = "Physical condition respondent",
    var_type = "categorical", stringsAsFactors = FALSE
  ))
  db$value_labels <- rbind(db$value_labels, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    value_numeric = c(0, 1, 2),
    value_label = c("Don't know", "No", "Yes"), is_missing = FALSE,
    stringsAsFactors = FALSE
  ))

  db$manual_overrides$variables <- rbind(db$manual_overrides$variables, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    variable_label = NA_character_, replace_value_labels = FALSE,
    applied_at = Sys.time(), note = NA_character_, stringsAsFactors = FALSE
  ))
  db$manual_overrides$value_labels <- rbind(db$manual_overrides$value_labels, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    value_numeric = -5, value_label = "NA, wrong, skip",
    is_missing = TRUE, applied_at = Sys.time(), note = NA_character_,
    stringsAsFactors = FALSE
  ))

  merged <- .lasa_get_labels(db, "046", "B")
  expect_setequal(merged$value_labels$value_numeric, c(0, 1, 2, -5))

  db$manual_overrides$variables$replace_value_labels <- TRUE
  replaced <- .lasa_get_labels(db, "046", "B")
  expect_identical(replaced$value_labels$value_numeric, -5)
})

test_that("manual variable_label override wins and is flagged manual_override", {
  db <- .lasa_empty_label_db()
  db$variables <- rbind(db$variables, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    canonical_name = "lphya01", variable_label = "orig label",
    harmonized_var_label = "Physical condition respondent",
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

test_that(".lasa_get_labels() scopes value_labels_harmonized by filecode only (not wave)", {
  db <- .lasa_empty_label_db()
  db$variables <- rbind(db$variables, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    canonical_name = "lphya01", variable_label = "l", harmonized_var_label = "h",
    var_type = "categorical", stringsAsFactors = FALSE
  ))
  db$value_labels_harmonized <- rbind(db$value_labels_harmonized, data.frame(
    filecode = "046", canonical_name = "lphya01",
    value_numeric = c(1, 2), value_label = c("No", "Yes"), is_missing = FALSE,
    stringsAsFactors = FALSE
  ))
  out <- .lasa_get_labels(db, "046", "B")
  expect_equal(nrow(out$value_labels_harmonized), 2L)
})

test_that("lasa_label_db() returns the currently active (bundled) database", {
  db <- lasa_label_db()
  expect_true(.lasa_is_label_db_shaped(db))
  expect_gt(nrow(db$variables), 0L)
  expect_gt(nrow(db$value_labels), 0L)
})

test_that("filecode/wave normalization is applied when looking up labels", {
  db <- .lasa_empty_label_db()
  db$variables <- rbind(db$variables, data.frame(
    filecode = "046", wave = "B", variable_name = "blphya01",
    canonical_name = "lphya01", variable_label = "l", harmonized_var_label = "h",
    var_type = "categorical", stringsAsFactors = FALSE
  ))
  out <- .lasa_get_labels(db, "LASA046", "b")
  expect_equal(nrow(out$variables), 1L)
})

test_that("the bundled database is found without library(CleanLASA)", {
  # An installed package keeps lazy data out of reach of a bare get() unless
  # it is attached, so `CleanLASA::read_lasa_sav()` used to see an empty
  # database. Only meaningful against the installed copy under test.
  skip_on_cran()
  skip_if(
    exists(".__DEVTOOLS__", envir = asNamespace("CleanLASA"), inherits = FALSE),
    "needs the installed package under test, not a load_all() copy"
  )
  out <- system2(
    file.path(R.home("bin"), "Rscript"),
    c("-e", shQuote("cat(nrow(CleanLASA::lasa_label_db()$variables))")),
    stdout = TRUE
  )
  expect_gt(as.numeric(utils::tail(out, 1L)), 0)
})

test_that(".lasa_bundled_label_db() returns the bundled snapshot", {
  db <- .lasa_bundled_label_db()
  expect_true(.lasa_is_label_db_shaped(db))
  expect_gt(nrow(db$variables), 0L)
})

test_that("the bundled database documents wave K for filecodes 046 and 161", {
  db <- .lasa_bundled_label_db()
  v <- db$variables
  expect_true("K" %in% v$wave[v$filecode == "046"])
  expect_true("K" %in% v$wave[v$filecode == "161"])
  k046 <- v[v$filecode == "046" & v$wave == "K", ]
  expect_equal(k046$canonical_name[k046$variable_name == "klphya01"], "lphya01")

  vl <- db$value_labels
  na_see <- vl$value_label[vl$filecode == "046" & vl$wave == "K" &
    vl$variable_name == "klphya02" & vl$value_numeric == -2]
  expect_equal(na_see, "na, see B/C/D/E/B/F/G/H/B/I/J/KLPHYA01")
  expect_false(any(grepl("I/JLPHYA", vl$value_label[vl$filecode == "046"], fixed = TRUE)))

  # K reworded the hand-strength particularities; item 2 is a new question.
  k161 <- v[v$filecode == "161" & v$wave == "K", ]
  expect_equal(k161$canonical_name[k161$variable_name == "kmgriprp2"], "mgriprpnorm")
  expect_equal(k161$canonical_name[k161$variable_name == "kweightself"], "mweightself")
})

test_that("codebook typos are corrected in the bundled database", {
  db <- .lasa_bundled_label_db()
  v <- db$variables
  h <- db$value_labels_harmonized

  # 016 wave K "kkob1" is job1 (the codebook's own routing says KJOB1).
  expect_false("kob1" %in% v$canonical_name[v$filecode == "016"])
  expect_equal(v$canonical_name[v$filecode == "016" & v$variable_name == "kjob1"], "job1")

  # 035 choutd -2 means "no chronic disease", not generic missingness.
  expect_equal(
    h$value_label[h$filecode == "035" & h$canonical_name == "choutd" & h$value_numeric == -2],
    "na, not any chronic disease"
  )

  # z004 bycohort code 6 is 1928-32, not a second 1923-27.
  expect_equal(
    h$value_label[h$filecode == "z004" & h$canonical_name == "bycohort" & h$value_numeric == 6],
    "1928-32"
  )
})
