test_that("apply_lasa011_labels has the LASA046 parameter contract", {
  expect_identical(
    formals(apply_lasa011_labels),
    formals(apply_lasa046_labels)
  )
})

test_that("wave B receives its documented LASA011 labels", {
  data <- data.frame(BNUPERS = c(-3, -2, 0, 2))
  out <- apply_lasa011_labels(data, wave = "b")

  expect_identical(
    attr(out$BNUPERS, "label"),
    "Number of persons in household"
  )
  expect_equal(
    attr(out$BNUPERS, "labels"),
    c(
      "na, wrong skip" = -3,
      "na, not liv independently" = -2,
      "none" = 0
    )
  )
  expect_identical(attr(out, "LASA_wave"), "B")
})

test_that("waves C through 2B use the partner-excluded coding", {
  cases <- list(C = "CHINDEP", D = "DHINDEP", E = "EHINDEP", `2B` = "BHINDEP")

  for (wave in names(cases)) {
    prefix <- if (wave == "2B") "B" else wave
    data <- setNames(data.frame(c(-3, -2, -1, 0, 2)), paste0(prefix, "NUPERS"))
    out <- apply_lasa011_labels(data, wave = wave)
    x <- out[[1L]]

    expect_identical(
      attr(x, "label"),
      "# other persons in household (partner excluded)"
    )
    expect_equal(
      attr(x, "labels"),
      c(
        "na, wrong skip" = -3,
        setNames(-2, paste0("na, see ", cases[[wave]], " in LASA014")),
        "na, asked" = -1,
        "none" = 0
      ),
      info = wave
    )
  }
})

test_that("wave MB receives its documented LASA011 labels", {
  data <- data.frame(bnupers = c(-3, -1, 0, 3))
  out <- apply_lasa011_labels(data, wave = "MB")

  expect_identical(attr(out$bnupers, "label"), "# other persons in household")
  expect_equal(
    attr(out$bnupers, "labels"),
    c("na, wrong skip" = -3, "na, asked" = -1, "none" = 0)
  )
})

test_that("waves F onward receive all seven household-composition labels", {
  data <- data.frame(
    FNUPERS = c(2, -2),
    FHHPART = c(1, -2),
    FHHNCH = c(1, -2),
    FHHNSTCH = c(0, -2),
    FHHNSIB = c(0, -2),
    FHHNOTHF = c(0, -2),
    FHHNNONK = c(0, -2)
  )
  out <- apply_lasa011_labels(data, wave = "F")

  expect_identical(
    vapply(out, attr, character(1), which = "label"),
    c(
      FNUPERS = "# other persons in household",
      FHHPART = "partner in household",
      FHHNCH = "number of children in household",
      FHHNSTCH = "number of stepchildren in household",
      FHHNSIB = "number of siblings in household",
      FHHNOTHF = "number of other family members in household",
      FHHNNONK = "number of nonkin persons in household"
    )
  )
  expect_equal(
    attr(out$FNUPERS, "labels"),
    c(
      "na, wrong skip" = -3,
      "na, see FHINDEP in LASA014" = -2,
      "na, asked" = -1,
      "none" = 0
    )
  )
  expect_equal(
    attr(out$FHHPART, "labels"),
    c(
      "na, see FNUPERS" = -2,
      "no partner in household" = 0,
      "partner in household" = 1
    )
  )
  expect_equal(
    attr(out$FHHNCH, "labels"),
    c("na, see FNUPERS" = -2)
  )
  expect_equal(nrow(lasa_label_report(out)), 7L)
  expect_false(any(lasa_label_report(out)$method == "not found"))
})

test_that("modern b-prefix waves use their own LASA011 schema", {
  data <- data.frame(
    BNUPERS = c(1, -2),
    BHHPART = c(1, -2),
    BHHNCH = c(0, -2),
    BHHNSTCH = c(0, -2),
    BHHNSIB = c(0, -2),
    BHHNOTHF = c(0, -2),
    BHHNNONK = c(0, -2)
  )
  out <- apply_lasa011_labels(data, wave = "3B")

  expect_identical(attr(out$BNUPERS, "label"), "# other persons in household")
  expect_equal(
    attr(out$BNUPERS, "labels")[["na, see BHINDEP in LASA014"]],
    -2
  )
  expect_equal(attr(out$BHHPART, "labels")[["na, see BNUPERS"]], -2)
})

test_that("count and categorical conversions follow their declared types", {
  data <- data.frame(
    FNUPERS = c(-3, -2, -1, 0, 4),
    FHHPART = c(-2, 0, 1, 2, NA),
    FHHNCH = c(-2, 0, 1, 3, NA)
  )
  out <- apply_lasa011_labels(
    data,
    wave = "F",
    to_factor = TRUE,
    to_numeric = TRUE
  )

  expect_identical(
    as.numeric(out$FNUPERS),
    c(NA_real_, NA_real_, NA_real_, 0, 4)
  )
  expect_identical(
    as.numeric(out$FHHNCH),
    c(NA_real_, 0, 1, 3, NA_real_)
  )
  expect_s3_class(out$FHHPART, "factor")
  expect_true("no partner in household" %in% levels(out$FHHPART))
  expect_true("partner in household" %in% levels(out$FHHPART))
  expect_true("2" %in% levels(out$FHHPART))
  expect_identical(attr(out$FNUPERS, "label"), "# other persons in household")
  expect_null(attr(out$FNUPERS, "labels"))
})

test_that("matching, corrections, and standardization mirror LASA046", {
  data <- data.frame(
    Respondent = 1:2,
    NUPERS_WRONG = c(1, 2),
    FHHPart = c(1, 0),
    check.names = FALSE
  )
  out <- apply_lasa011_labels(
    data,
    wave = "F",
    name_corrections = c(nupers = "NUPERS_WRONG"),
    standardize_names = TRUE
  )
  report <- lasa_label_report(out)

  expect_true(all(c("fnupers", "fhhpart") %in% names(out)))
  expect_equal(
    report$method[report$suffix == "nupers"],
    "manual correction"
  )
  expect_equal(
    report$method[report$suffix == "hhpart"],
    "case-insensitive exact"
  )
  expect_equal(
    report$standardized_to[report$suffix == "nupers"],
    "fnupers"
  )
})

test_that("unmatched and invalid LASA011 inputs are reported", {
  out <- apply_lasa011_labels(data.frame(other = 1), wave = "K")
  expect_equal(nrow(lasa_label_report(out, problems_only = TRUE)), 7L)

  manual <- apply_lasa011_labels(
    data.frame(other = 1),
    wave = "B",
    name_corrections = c(nupers = "missing_column")
  )
  expect_equal(lasa_label_report(manual)$method, "manual_not_found")

  expect_error(
    apply_lasa011_labels(data.frame(), wave = "A"),
    "Unknown LASA 011 wave"
  )
})

test_that("read_lasa_sav dispatches LASA011 files", {
  path <- file.path(tempdir(), "LASAF011.sav")
  haven::write_sav(
    data.frame(FNUPERS = c(1, -2), FHHPART = c(1, 0)),
    path
  )

  out <- read_lasa_sav(path, standardize_names = TRUE)

  expect_identical(attr(out, "LASA_file_code"), "011")
  expect_identical(attr(out, "LASA_label_function"), "apply_lasa011_labels")
  expect_true(all(c("fnupers", "fhhpart") %in% names(out)))
  expect_identical(attr(out$fnupers, "label"), "# other persons in household")
})
