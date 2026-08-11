test_that("LASA file-code variations are normalized", {
  expect_equal(.lasa_normalize_filecode("046"), "046")
  expect_equal(.lasa_normalize_filecode("LASA046"), "046")
  expect_equal(.lasa_normalize_filecode("LASA 046"), "046")
  expect_equal(.lasa_normalize_filecode("lasa_046"), "046")
  expect_equal(.lasa_normalize_filecode("LASAz004"), "z004")
})

test_that("file codes are extracted from LASA wave cells", {
  expect_equal(
    .lasa_extract_filecodes("030 230 603 703"),
    c("030", "230", "603", "703")
  )
  expect_equal(
    .lasa_extract_filecodes("zoa1 zoa2 zoa3"),
    c("zoa1", "zoa2", "zoa3")
  )
  expect_equal(.lasa_extract_filecodes("-"), character())
  expect_equal(.lasa_extract_filecodes("X"), character())
})

test_that("topic matching is case-insensitive, partial, and fuzzy", {
  candidates <- c(
    "Physical activity",
    "Daily Physical Activity",
    "Physical performance",
    "Memory"
  )

  partial <- .lasa_match_scores(
    "physical act",
    candidates,
    fuzzy_match = TRUE,
    max_edit_distance = 2L
  )
  expect_equal(which(partial$matched), c(1L, 2L))

  typo <- .lasa_best_match(
    "phisical activity",
    candidates,
    fuzzy_match = TRUE,
    max_edit_distance = 2L,
    label = "LASA topic"
  )
  expect_equal(typo, "Physical activity")
})

test_that("canonical PDF URLs are preferred for ambiguous file codes", {
  urls <- c(
    "https://lasa-vu.nl/uploads/LASA035_headtrauma_varinfo.pdf",
    "https://lasa-vu.nl/uploads/LASA035_varinfo.pdf"
  )

  expect_equal(
    .lasa_canonical_varinfo_url(urls, "035"),
    urls[[2L]]
  )
})
