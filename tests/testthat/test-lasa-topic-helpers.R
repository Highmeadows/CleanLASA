test_that("LASA file-code variations are normalized", {
  expect_equal(.lasa_normalize_filecode("046"), "046")
  expect_equal(.lasa_normalize_filecode("LASA046"), "046")
  expect_equal(.lasa_normalize_filecode("LASA 046"), "046")
  expect_equal(.lasa_normalize_filecode("lasa_046"), "046")
  expect_equal(.lasa_normalize_filecode("LASAz004"), "z004")
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
