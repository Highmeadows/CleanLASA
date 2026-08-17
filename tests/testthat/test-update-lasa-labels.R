codebook_pdf <- function(name) {
  path <- testthat::test_path("..", "..", "codebook", name)
  if (!file.exists(path)) testthat::skip(paste("codebook fixture not available:", name))
  path
}

local_empty_db <- function(env = parent.frame()) {
  tmp <- tempfile(fileext = ".rds")
  testthat::local_mocked_bindings(.lasa_label_db_path = function() tmp, .env = env)
  # .lasa_load_label_db() falls back to the bundled dataset when the
  # user-local path doesn't exist yet -- pre-seed an empty snapshot so
  # these isolated tests start from nothing, not the real bundled data.
  .lasa_save_label_db(.lasa_empty_label_db())
  tmp
}

test_that("first update inserts a new document", {
  local_empty_db()
  res <- update_lasa_labels(path = codebook_pdf("LASA046_varinfo.pdf"), strict = FALSE)
  expect_equal(res$status, "inserted")
  expect_true(res$pdf_changed)
  expect_true("046" %in% res$filecodes)
  expect_gt(res$n_variables, 0L)

  db <- lasa_label_db()
  expect_equal(nrow(db$documents), 1L)
})

test_that("re-running with an identical file is a no-op", {
  local_empty_db()
  update_lasa_labels(path = codebook_pdf("LASA046_varinfo.pdf"), strict = FALSE)
  res2 <- update_lasa_labels(path = codebook_pdf("LASA046_varinfo.pdf"), strict = FALSE)
  expect_equal(res2$status, "no_op")
  expect_false(res2$pdf_changed)
})

test_that("dry_run parses and validates but never writes", {
  path <- local_empty_db()
  res <- update_lasa_labels(path = codebook_pdf("LASA046_varinfo.pdf"), strict = FALSE, dry_run = TRUE)
  expect_gt(res$n_variables, 0L)
  # The pre-seeded empty snapshot must be untouched by a dry run.
  expect_equal(nrow(lasa_label_db()$documents), 0L)
})

test_that("a document is replaced, not duplicated, when re-inserted after being removed", {
  local_empty_db()
  update_lasa_labels(path = codebook_pdf("LASA046_varinfo.pdf"), strict = FALSE)
  db1 <- lasa_label_db()
  n1 <- nrow(db1$variables)

  # Force a "changed" re-processing by clearing the recorded hash.
  db1$documents$sha256 <- "deadbeef"
  .lasa_save_label_db(db1)

  res <- update_lasa_labels(path = codebook_pdf("LASA046_varinfo.pdf"), strict = FALSE)
  expect_equal(res$status, "updated")
  db2 <- lasa_label_db()
  expect_equal(nrow(db2$documents), 1L)
  expect_equal(nrow(db2$variables), n1)
})

test_that("strict = TRUE blocks an update with unresolved rows for the requested filecode", {
  local_empty_db()
  expect_error(
    update_lasa_labels(filecode = "034", path = codebook_pdf("LASA034_varinfo.pdf"), strict = TRUE),
    "could not be unambiguously"
  )
  db <- lasa_label_db()
  expect_equal(nrow(db$documents), 0L)
})

test_that("update_lasa_labels(path=) works fully offline (no network)", {
  local_empty_db()
  res <- update_lasa_labels(path = codebook_pdf("LASAz004_varinfo.pdf"), strict = FALSE)
  expect_true("004" %in% res$filecodes)
})

test_that("path must exist", {
  local_empty_db()
  expect_error(update_lasa_labels(path = "does/not/exist.pdf"), "existing file path")
})
