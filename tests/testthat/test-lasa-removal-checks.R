# Confirms the 117 hand-written apply_lasa<code>_labels() functions and
# their supporting dispatch machinery were fully removed by the
# database-driven label-system overhaul, and that apply_lasa_labels()
# (the new, generic replacement) has taken their place cleanly.

package_root <- function() {
  # tests/testthat/ -> package root
  normalizePath(testthat::test_path("..", ".."))
}

# These checks inspect the source repository layout (R/, man/, NAMESPACE,
# README.md as files on disk) -- meaningful when testing a source checkout,
# but that layout isn't present when tests run against an installed/checked
# copy of the package (e.g. under R CMD check), so they skip gracefully
# there instead of failing on an assumption that doesn't apply.
skip_if_not_source_checkout <- function() {
  testthat::skip_if_not(
    file.exists(file.path(package_root(), "DESCRIPTION")) &&
      dir.exists(file.path(package_root(), "R")) &&
      file.exists(file.path(package_root(), "NAMESPACE")),
    "not running against a source checkout"
  )
}

grep_files <- function(pattern, dirs) {
  root <- package_root()
  files <- unlist(lapply(dirs, function(d) {
    full <- file.path(root, d)
    if (!dir.exists(full)) return(character(0))
    list.files(full, recursive = TRUE, full.names = TRUE)
  }))
  files <- files[!grepl("test-lasa-removal-checks\\.R$", files)]
  hits <- character(0)
  for (f in files) {
    lines <- tryCatch(readLines(f, warn = FALSE), error = function(e) character(0))
    matched <- grep(pattern, lines, perl = TRUE, value = TRUE)
    if (length(matched) > 0L) hits <- c(hits, paste0(f, ": ", matched))
  }
  hits
}

test_that("no apply_lasa<code>_labels symbols remain in R/, man/, tests/, or README", {
  skip_if_not_source_checkout()
  # Matches the old per-filecode convention (apply_lasa046_labels,
  # apply_lasa_oa_labels, apply_lasaz004_labels, ...) -- requires at least
  # one character between "apply_lasa" and the trailing "_labels" so the
  # new generic apply_lasa_labels() itself is never matched.
  pattern <- "apply_lasa[a-zA-Z0-9_]+_labels\\b"
  hits <- grep_files(pattern, c("R", "man", "tests", "README.md", "vignettes"))
  expect_identical(hits, character(0))
})

test_that("NAMESPACE exports the new generic functions and no old ones", {
  skip_if_not_source_checkout()
  namespace_path <- file.path(package_root(), "NAMESPACE")
  lines <- readLines(namespace_path)
  exports <- sub("^export\\((.*)\\)$", "\\1", grep("^export\\(", lines, value = TRUE))

  expect_true("apply_lasa_labels" %in% exports)
  expect_true("manual_update_lasa_labels" %in% exports)
  expect_true("lasa_label_db" %in% exports)
  expect_true("read_lasa_sav" %in% exports)
  expect_false("update_lasa_labels" %in% exports)

  stale <- grep("^apply_lasa[a-zA-Z0-9_]*_labels$", exports, perl = TRUE, value = TRUE)
  stale <- setdiff(stale, "apply_lasa_labels")
  expect_identical(stale, character(0))
})

test_that("apply_lasa_labels and .lasa_apply_labels are distinct with correct export status", {
  expect_true(is.function(apply_lasa_labels))
  expect_true("apply_lasa_labels" %in% getNamespaceExports("CleanLASA"))
  expect_false(".lasa_apply_labels" %in% getNamespaceExports("CleanLASA"))
  expect_true(exists(".lasa_apply_labels", envir = asNamespace("CleanLASA"), inherits = FALSE))
})

test_that("no R/apply_LASA*.R files remain", {
  skip_if_not_source_checkout()
  root <- package_root()
  leftover <- list.files(file.path(root, "R"), pattern = "^apply_LASA.*\\.R$")
  expect_identical(leftover, character(0))
})
