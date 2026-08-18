codebook_pdf <- function(name) {
  path <- testthat::test_path("..", "..", "codebook", name)
  if (!file.exists(path)) {
    testthat::skip(paste("codebook fixture not available:", name))
  }
  path
}

local_empty_db <- function(env = parent.frame()) {
  tmp <- tempfile(fileext = ".rds")
  testthat::local_mocked_bindings(
    .lasa_label_db_path = function() tmp,
    .env = env
  )

  # Pre-seed an empty snapshot; otherwise .lasa_load_label_db() falls back
  # to the real bundled database when the local path does not exist.
  .lasa_save_label_db(.lasa_empty_label_db())
  tmp
}

test_that("first update inserts a new document", {
  local_empty_db()

  res <- update_lasa_labels(
    path = codebook_pdf("LASA046_varinfo.pdf"),
    strict = FALSE
  )

  expect_equal(res$status, "inserted")
  expect_true(res$pdf_changed)
  expect_true(res$parser_changed)
  expect_true("046" %in% res$filecodes)
  expect_gt(res$n_variables, 0L)

  db <- lasa_label_db()
  expect_equal(nrow(db$documents), 1L)
  expect_equal(db$documents$parser_version[[1L]], .lasa_parser_version)
})

test_that("re-running identical bytes with the current parser is a no-op", {
  local_empty_db()

  update_lasa_labels(
    path = codebook_pdf("LASA046_varinfo.pdf"),
    strict = FALSE
  )
  res2 <- update_lasa_labels(
    path = codebook_pdf("LASA046_varinfo.pdf"),
    strict = FALSE
  )

  expect_equal(res2$status, "no_op")
  expect_false(res2$pdf_changed)
  expect_false(res2$parser_changed)
})

test_that("an unchanged PDF is reparsed after a parser-version change", {
  local_empty_db()

  pdf <- codebook_pdf("LASA046_varinfo.pdf")
  update_lasa_labels(path = pdf, strict = FALSE)

  db <- lasa_label_db()
  original_hash <- db$documents$sha256[[1L]]
  db$documents$parser_version <- "0.9-test"
  .lasa_save_label_db(db)

  res <- update_lasa_labels(path = pdf, strict = FALSE)

  expect_equal(res$status, "updated")
  expect_false(res$pdf_changed)
  expect_true(res$parser_changed)

  db2 <- lasa_label_db()
  expect_identical(db2$documents$sha256[[1L]], original_hash)
  expect_identical(
    db2$documents$parser_version[[1L]],
    .lasa_parser_version
  )
})

test_that("dry_run parses and validates but never writes", {
  local_empty_db()

  res <- update_lasa_labels(
    path = codebook_pdf("LASA046_varinfo.pdf"),
    strict = FALSE,
    dry_run = TRUE
  )

  expect_gt(res$n_variables, 0L)
  expect_equal(nrow(lasa_label_db()$documents), 0L)
})

test_that("a document is replaced rather than duplicated", {
  local_empty_db()

  pdf <- codebook_pdf("LASA046_varinfo.pdf")
  update_lasa_labels(path = pdf, strict = FALSE)
  db1 <- lasa_label_db()
  n1 <- nrow(db1$variables)

  # Force a changed-document code path while keeping a valid database.
  db1$documents$sha256 <- "deadbeef"
  .lasa_save_label_db(db1)

  res <- update_lasa_labels(path = pdf, strict = FALSE)
  expect_equal(res$status, "updated")

  db2 <- lasa_label_db()
  expect_equal(nrow(db2$documents), 1L)
  expect_equal(nrow(db2$variables), n1)
})

test_that("strict = TRUE blocks unresolved rows for a requested filecode", {
  local_empty_db()

  expect_error(
    update_lasa_labels(
      filecode = "034",
      path = codebook_pdf("LASA034_varinfo.pdf"),
      strict = TRUE
    ),
    "could not be unambiguously"
  )

  expect_equal(nrow(lasa_label_db()$documents), 0L)
})

test_that("update_lasa_labels(path=) works fully offline", {
  local_empty_db()

  res <- update_lasa_labels(
    path = codebook_pdf("LASAz004_varinfo.pdf"),
    strict = FALSE
  )
  expect_true("004" %in% res$filecodes)
})

test_that("path must exist", {
  local_empty_db()
  expect_error(
    update_lasa_labels(path = "does/not/exist.pdf"),
    "existing file path"
  )
})

test_that("exact duplicate parsed value-label rows are deduplicated", {
  x <- data.frame(
    filecode = c("046", "046"),
    wave = c("B", "B"),
    variable_name = c("blphya01", "blphya01"),
    value_raw = c("-3", "-3"),
    value_label = c("na, wrong skip", "na, wrong skip"),
    stringsAsFactors = FALSE
  )

  out <- .lasa_resolve_parsed_value_duplicates(x)
  expect_equal(nrow(out), 1L)
})

test_that("conflicting parsed value labels are never resolved by keeping the first", {
  x <- data.frame(
    filecode = c("046", "046"),
    wave = c("B", "B"),
    variable_name = c("blphya01", "blphya01"),
    value_raw = c("-3", "-3"),
    value_label = c("na, wrong skip", "not done, wrong skip"),
    stringsAsFactors = FALSE
  )

  expect_error(
    .lasa_resolve_parsed_value_duplicates(x),
    "conflicting value labels"
  )
})

test_that("conflicting parsed variable definitions are never silently chosen", {
  x <- data.frame(
    filecode = c("046", "046"),
    wave = c("B", "B"),
    variable_name = c("blphya01", "blphya01"),
    canonical_name = c("lphya01", "lphya01"),
    variable_label = c(
      "Physical condition respondent: observation",
      "LASAC246 Physical condition respondent: observation"
    ),
    stringsAsFactors = FALSE
  )

  expect_error(
    .lasa_resolve_parsed_variable_duplicates(x),
    "conflicting variable definitions"
  )
})

test_that("LASA046 update stores the verified wave-specific -3 labels", {
  local_empty_db()

  update_lasa_labels(
    path = codebook_pdf("LASA046_varinfo.pdf"),
    strict = FALSE
  )
  db <- lasa_label_db()

  early <- c("B", "C", "D", "E", "2B", "F", "G")
  late <- c("H", "3B", "I", "J", "K")

  for (wave in early) {
    variable_name <- paste0(.lasa_varinfo_wave_prefix(wave), "lphya01")
    row <- db$value_labels[
      db$value_labels$filecode == "046" &
        db$value_labels$wave == wave &
        db$value_labels$variable_name == variable_name &
        !is.na(db$value_labels$value_raw) &
        db$value_labels$value_raw == "-3",
      ,
      drop = FALSE
    ]
    expect_equal(nrow(row), 1L)
    expect_identical(row$value_label[[1L]], "na, wrong skip")
  }

  for (wave in late) {
    variable_name <- paste0(.lasa_varinfo_wave_prefix(wave), "lphya01")
    row <- db$value_labels[
      db$value_labels$filecode == "046" &
        db$value_labels$wave == wave &
        db$value_labels$variable_name == variable_name &
        !is.na(db$value_labels$value_raw) &
        db$value_labels$value_raw == "-3",
      ,
      drop = FALSE
    ]
    expect_equal(nrow(row), 1L)
    expect_identical(row$value_label[[1L]], "not done, wrong skip")
  }
})

test_that("semantic validation rejects wave-condition text left inside value labels", {
  vars <- data.frame(
    filecode = "046",
    wave = "B",
    variable_name = "blphya01",
    canonical_name = "lphya01",
    variable_label = "Physical condition respondent: observation",
    source_page = 1L,
    source_row = 1L,
    source_condition = NA_character_,
    parse_note = NA_character_,
    stringsAsFactors = FALSE
  )
  vals <- data.frame(
    filecode = "046",
    wave = "B",
    variable_name = "blphya01",
    value_raw = "-3",
    value_label = "na, (from wave H: not done,) wrong skip",
    stringsAsFactors = FALSE
  )

  problems <- .lasa_validate_parsed_label_semantics(vars, vals)
  expect_true(any(grepl("wave-condition text", problems, fixed = TRUE)))
})
