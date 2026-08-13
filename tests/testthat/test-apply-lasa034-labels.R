test_that("LASA034 has the same parameter contract as LASA046", {
  expect_identical(
    names(formals(apply_lasa034_labels)),
    names(formals(apply_lasa046_labels))
  )
  expect_identical(
    lapply(formals(apply_lasa034_labels), deparse),
    lapply(formals(apply_lasa046_labels), deparse)
  )
})

test_that("wave B variable and value labels follow the LASA034 codebook", {
  data <- data.frame(
    BCARDIG1 = c(-6, 1),
    BBUTTON2 = c(5, 1),
    BWALK04 = c(8.2, -6),
    BCHAIR9 = c(1, 2),
    BRMPF = c(-2, 1)
  )

  labelled <- apply_lasa034_labels(data, wave = "b")

  expect_identical(attr(labelled$BCARDIG1, "label"), "Cardigan: phase 1 elbow")
  expect_identical(unname(attr(labelled$BCARDIG1, "labels")[["na, test not done"]]), -6)
  expect_identical(unname(attr(labelled$BBUTTON2, "labels")[["wrong buttonhole"]]), 5)
  expect_identical(attr(labelled$BWALK04, "label"), "Walking: time in seconds")
  expect_identical(unname(attr(labelled$BCHAIR9, "labels")[["yes"]]), 2)
  expect_identical(unname(attr(labelled$BRMPF, "labels")[["valid score"]]), -2)

  report <- lasa_label_report(labelled)
  expect_true(all(c("suffix", "expected_name", "matched_name", "method") %in% names(report)))
  expect_equal(nrow(report), 38L)
})

test_that("LASA034 applies wave-specific performance-test codings", {
  wave_h <- apply_lasa034_labels(
    data.frame(HWALK07 = -6, HWALK09 = 0, HTANDEM1 = 3),
    wave = "H"
  )
  expect_identical(unname(attr(wave_h$HWALK07, "labels")[["na, wrong skip"]]), -6)
  expect_identical(unname(attr(wave_h$HWALK09, "labels")[["no"]]), 0)
  expect_identical(unname(attr(wave_h$HTANDEM1, "labels")[["falls almost direct"]]), 3)

  wave_3b <- apply_lasa034_labels(
    data.frame(BWALK07 = 10, BCHAIR10 = 8, BCARDIG9 = 4),
    wave = "3B"
  )
  expect_identical(unname(attr(wave_3b$BWALK07, "labels")[["hurts worst"]]), 10)
  expect_identical(unname(attr(wave_3b$BCHAIR10, "labels")[["hurts a whole lot"]]), 8)
  expect_identical(unname(attr(wave_3b$BCARDIG9, "labels")[["other way"]]), 4)

  wave_j <- apply_lasa034_labels(
    data.frame(JWALK04A = -3, JCHAIR4 = 4, JTANDEM3 = 3, JRMPF = 3),
    wave = "J"
  )
  expect_identical(unname(attr(wave_j$JWALK04A, "labels")[["na, born after 1940"]]), -3)
  expect_identical(unname(attr(wave_j$JCHAIR4, "labels")[["not done/terminated"]]), 4)
  expect_identical(
    unname(attr(wave_j$JTANDEM3, "labels")[[
      "immediately steps out of position (in less than 1 second)"
    ]]),
    3
  )
  expect_identical(unname(attr(wave_j$JRMPF, "labels")[["PF not done, not able"]]), 3)
})

test_that("LASA034 only audits variables documented for the selected wave", {
  empty_data <- data.frame(respnr = integer())

  wave_mb <- apply_lasa034_labels(empty_data, wave = "MB")
  mb_suffixes <- attr(wave_mb, "label_report")$suffix
  expect_false(any(grepl("^cardig", mb_suffixes)))
  expect_true(all(c("walk04a", "chair10", "tandem1", "tandem2") %in% mb_suffixes))

  wave_k <- apply_lasa034_labels(empty_data, wave = "K")
  k_suffixes <- attr(wave_k, "label_report")$suffix
  expect_false(any(c("walk04a", "walk05", "walk08", "tandem2") %in% k_suffixes))
  expect_true(all(c("tandem1", "tandem3", "tandem4") %in% k_suffixes))
  expect_equal(length(k_suffixes), 34L)
})

test_that("LASA034 supports reshaping, standardization, and manual corrections", {
  data <- data.frame(
    CARDIG = c(1, 4),
    BWALK04 = c(12.5, -6),
    check.names = FALSE
  )

  labelled <- apply_lasa034_labels(
    data,
    wave = "B",
    name_corrections = c(cardig1 = "CARDIG"),
    to_factor = TRUE,
    to_numeric = TRUE,
    standardize_names = TRUE
  )

  expect_true(is.factor(labelled$bcardig1))
  expect_true(all(c("completed without help", "not done") %in% levels(labelled$bcardig1)))
  expect_type(labelled$bwalk04, "double")
  expect_equal(labelled$bwalk04, c(12.5, NA_real_))
  expect_identical(attr(labelled$bwalk04, "label"), "Walking: time in seconds")

  report <- attr(labelled, "label_report")
  expect_identical(
    report$method[report$suffix == "cardig1"],
    "manual correction"
  )
  expect_identical(
    report$standardized_to[report$suffix == "cardig1"],
    "bcardig1"
  )
})

test_that("LASA034 validates its wave and shared arguments", {
  expect_error(
    apply_lasa034_labels(data.frame(), wave = "A"),
    "Unknown LASA 034 wave"
  )
  expect_error(
    apply_lasa034_labels(data.frame(), wave = "B", to_factor = NA),
    "'to_factor' must be TRUE or FALSE"
  )
  expect_error(
    apply_lasa034_labels(
      data.frame(), wave = "B", name_corrections = "BCARDIG1"
    ),
    "'name_corrections' must be NULL or a named character vector"
  )
})
