# These tests parse real LASA varinfo PDFs from codebook/, which is
# development/bootstrap material (see data-raw/build_lasa_label_db.R) and
# is not guaranteed to exist once the package's bundled lasa_label_db is
# built -- so every test here skips gracefully when the folder is absent,
# rather than depending on codebook/ shipping with the package long-term.

codebook_pdf <- function(name) {
  path <- testthat::test_path("..", "..", "codebook", name)
  if (!file.exists(path)) testthat::skip(paste("codebook fixture not available:", name))
  path
}

test_that("parses a standard multi-wave document (046) with high fidelity", {
  res <- .lasa_parse_varinfo(codebook_pdf("LASA046_varinfo.pdf"))

  expect_gt(nrow(res$variables), 400L)
  unresolved_share <- mean(!is.na(res$variables$parse_note))
  expect_lt(unresolved_share, 0.06)

  lphya01 <- res$variables[res$variables$canonical_name == "lphya01", ]
  expect_setequal(lphya01$wave, c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J"))
  expect_true(all(lphya01$variable_name == paste0(
    tolower(sub(".*([A-Za-z])$", "\\1", lphya01$wave)), "lphya01"
  )))

  b_row <- res$value_labels[
    res$value_labels$variable_name == "blphya01" & !is.na(res$value_labels$value_raw),
  ]
  expect_true("respondent bedridden" %in% b_row$value_label)
  expect_true("1" %in% b_row$value_raw)
})

test_that("a document with an implicit multi-wave section (z004/mb004) splits into two sections", {
  res <- .lasa_parse_varinfo(codebook_pdf("LASAz004_varinfo.pdf"))

  expect_setequal(unique(res$variables$wave), c("Z", "MB"))
  expect_true(all(res$variables$filecode == "004"))
  expect_true("byear" %in% res$variables$canonical_name)
})

test_that("a document with several short back-to-back sections on one page (868/878) splits correctly", {
  res <- .lasa_parse_varinfo(codebook_pdf("LASA868-878_varinfo.pdf"))

  # A variable applicable to more than one of this section's file codes may
  # carry a ";"-joined combined filecode (see .lasa_parse_varinfo()) --
  # every part of it must still be one of this document's own file codes.
  parts <- strsplit(res$variables$filecode, ";", fixed = TRUE)
  expect_true(all(vapply(parts, function(p) all(p %in% c("868", "878")), logical(1L))))
  expect_gt(nrow(res$variables), 3L)
})

test_that("wave-condition qualifiers narrow wave-prefix expansion (034)", {
  res <- .lasa_parse_varinfo(codebook_pdf("LASA034_varinfo.pdf"))
  unresolved_share <- mean(!is.na(res$variables$parse_note))
  expect_lt(unresolved_share, 0.25)
  expect_true(any(!is.na(res$variables$source_condition)))
})

test_that("unresolved rows carry a parse_note rather than fabricated data", {
  res <- .lasa_parse_varinfo(codebook_pdf("LASA046_varinfo.pdf"))
  bad <- res$variables[!is.na(res$variables$parse_note), ]
  if (nrow(bad) > 0L) {
    expect_true(all(is.na(bad$wave) | nzchar(bad$parse_note)))
  }
})

test_that("value-label parsing splits '<label>(<code>)' pairs and flags unparseable trailers", {
  vl <- .lasa_varinfo_split_value_labels("no(1), yes(2)")
  expect_equal(vl$value_raw, c("1", "2"))
  expect_equal(vl$value_label, c("no", "yes"))

  vl2 <- .lasa_varinfo_split_value_labels("see table Foo *")
  expect_true(is.na(vl2$value_raw))
  expect_match(vl2$parse_note, "external reference")
})

