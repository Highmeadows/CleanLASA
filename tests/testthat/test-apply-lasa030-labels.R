test_that("apply_lasa030_labels uses the LASA apply-function contract", {
  expect_identical(
    names(formals(apply_lasa030_labels)),
    names(formals(apply_lasa046_labels))
  )
  expect_identical(
    formals(apply_lasa030_labels)[-seq_len(2L)],
    formals(apply_lasa046_labels)[-seq_len(2L)]
  )
})

test_that("wave B receives its four-category coding and item subset", {
  data <- data.frame(
    BADL1A = c(-5, -1, 1, 4),
    BADL1C = c(-3, -2, -1, 1),
    BADL2A = c(1, 1, 1, 1)
  )

  out <- apply_lasa030_labels(data, wave = "b")

  expect_identical(
    attr(out$BADL1A, "label"),
    "Stairs: 15 steps without stopping"
  )
  expect_identical(
    attr(out$BADL1A, "labels"),
    c(
      "na, interview terminated" = -5,
      "na, asked" = -1,
      "no, I cannot" = 1,
      "only with help" = 2,
      "yes, with difficulty" = 3,
      "yes, without help" = 4
    )
  )
  expect_identical(
    attr(out$BADL1C, "labels"),
    c(
      "na, wrong skip" = -3,
      "na, see BADL1A" = -2,
      "na, asked" = -1,
      "never" = 1,
      "seldom" = 2,
      "occasionally" = 3,
      "often or always" = 4
    )
  )
  expect_null(attr(out$BADL2A, "label"))

  report <- attr(out, "label_report")
  # +1 for the always-recorded "respnr" audit row (see .lasa_label_engine()).
  expect_equal(nrow(report), 13L)
  expect_false("badl2a" %in% report$expected_name)
})

test_that("post-B waves receive the five-category coding", {
  data <- data.frame(
    CADL1A = c(1, 3, 4, 5),
    CADL2E = c(-3, -2, 1, 2)
  )

  out <- apply_lasa030_labels(data, wave = "C")

  expect_identical(
    attr(out$CADL1A, "labels"),
    c(
      "na, interview terminated" = -5,
      "na, asked" = -1,
      "no, I cannot" = 1,
      "only with help" = 2,
      "yes, with much difficulty" = 3,
      "yes, with some difficulty" = 4,
      "yes, without help" = 5
    )
  )
  expect_identical(
    attr(out$CADL2E, "label"),
    "(Un)dress: less than wanted (CADL2A > 1)"
  )
  expect_identical(
    attr(out$CADL2E, "labels"),
    c(
      "na, wrong skip" = -3,
      "na, see CADL2A" = -2,
      "na, asked" = -1,
      "no" = 1,
      "yes" = 2
    )
  )

  # Wave 3B shares the "b" variable prefix with B but uses the later coding.
  out_3b <- apply_lasa030_labels(data.frame(BADL1A = 5), wave = "3B")
  expect_identical(
    unname(attr(out_3b$BADL1A, "labels")),
    c(-5, -1, 1, 2, 3, 4, 5)
  )
})

test_that("each wave exposes the documented variable layout", {
  # +1 to every count for the always-recorded "respnr" audit row (see
  # .lasa_label_engine()).
  expected_counts <- c(
    B = 13L, C = 31L, D = 31L, E = 31L, `2B` = 36L,
    F = 36L, G = 36L, H = 29L, `3B` = 29L, MB = 15L,
    I = 29L, J = 29L, K = 29L
  )

  for (wave in names(expected_counts)) {
    out <- apply_lasa030_labels(data.frame(respnr = 1), wave = wave)
    report <- attr(out, "label_report")
    expect_equal(nrow(report), unname(expected_counts[[wave]]), info = wave)
  }

  h_report <- attr(
    apply_lasa030_labels(data.frame(respnr = 1), wave = "H"),
    "label_report"
  )
  expect_true("hadl7d" %in% h_report$expected_name)
  expect_false("hadl7e" %in% h_report$expected_name)

  mb_report <- attr(
    apply_lasa030_labels(data.frame(respnr = 1), wave = "MB"),
    "label_report"
  )
  mb_adl_names <- mb_report$expected_name[mb_report$suffix != "respnr"]
  expect_true(all(grepl("^badl[1-7][ab]$", mb_adl_names)))
})

test_that("factor conversion retains undocumented observed values", {
  data <- data.frame(KADL1A = c(-5, 1, 5, 99))
  out <- apply_lasa030_labels(data, wave = "K", to_factor = TRUE)

  expect_s3_class(out$KADL1A, "factor")
  expect_true("99" %in% levels(out$KADL1A))
  expect_identical(
    as.character(out$KADL1A),
    c("na, interview terminated", "no, I cannot", "yes, without help", "99")
  )
  expect_identical(
    attr(out$KADL1A, "label"),
    "Stairs: 15 steps without stopping"
  )
})

test_that("manual corrections and standardized names are audited", {
  data <- data.frame(B_ADL4A = c(1, 5), check.names = FALSE)
  out <- apply_lasa030_labels(
    data,
    wave = "2B",
    name_corrections = c(adl4a = "B_ADL4A"),
    standardize_names = TRUE
  )

  # standardize_names = TRUE always implies split_wavecode = TRUE, so the
  # wave code is stripped from the canonical name too.
  expect_true("adl4a" %in% names(out))
  expect_identical(attr(out$adl4a, "label"), "Toenails: cutting own")

  row <- attr(out, "label_report")
  row <- row[row$suffix == "adl4a", , drop = FALSE]
  expect_identical(row$method, "manual correction")
  expect_identical(row$standardized_to, "adl4a")
})

test_that("original SPSS value coding survives to_numeric/to_factor reshaping", {
  data <- data.frame(FADL1A = c(-5, 1, 5))

  out_numeric <- apply_lasa030_labels(data, wave = "F", to_numeric = TRUE)
  expect_identical(unname(attr(out_numeric$FADL1A, "original_values")), c(-5, 1, 5))
  expect_false(is.null(attr(out_numeric$FADL1A, "original_labels")))

  out_factor <- apply_lasa030_labels(data, wave = "F", to_factor = TRUE)
  expect_identical(unname(attr(out_factor$FADL1A, "original_values")), c(-5, 1, 5))
  expect_false(is.null(attr(out_factor$FADL1A, "original_labels")))
})

test_that("split_wavecode splits the wave code into LASA_wave", {
  data <- data.frame(RespNr = 1:2, `2BADL1A` = c(1, 4), check.names = FALSE)
  out <- apply_lasa030_labels(data, wave = "2B", split_wavecode = TRUE)

  expect_true("LASA_wave" %in% names(out))
  expect_true(all(out$LASA_wave == "2B"))
  expect_identical(names(out)[[2]], "LASA_wave")
  # respnr is matched (to position LASA_wave) but not renamed, since
  # standardize_names = FALSE.
  expect_true("RespNr" %in% names(out))
})

test_that("standardize_names standardizes respnr and adds LASA_wave", {
  data <- data.frame(RespNr = 1:2, BADL1A = c(1, 4))
  out <- apply_lasa030_labels(data, wave = "B", standardize_names = TRUE)

  expect_true("respnr" %in% names(out))
  expect_true("LASA_wave" %in% names(out))
  expect_identical(names(out)[[2]], "LASA_wave")
  expect_true(all(out$LASA_wave == "B"))
})

test_that("to_numeric does not strip categorical LASA030 labels", {
  out <- apply_lasa030_labels(
    data.frame(FADL1A = c(-5, 1, 5)),
    wave = "F",
    to_numeric = TRUE
  )

  expect_type(out$FADL1A, "double")
  expect_false(anyNA(out$FADL1A))
  expect_false(is.null(attr(out$FADL1A, "labels")))
})

test_that("read_lasa_sav dispatches LASA030 files", {
  path <- file.path(tempdir(), "LASAB030.SAV")
  haven::write_sav(data.frame(BADL1A = c(1, 4)), path)

  out <- read_lasa_sav(path)

  expect_identical(attr(out, "LASA_wave"), "B")
  expect_identical(attr(out, "LASA_file_code"), "030")
  expect_identical(
    attr(out, "LASA_label_function"),
    "apply_lasa030_labels"
  )
  expect_identical(
    attr(out$BADL1A, "label"),
    "Stairs: 15 steps without stopping"
  )
})

test_that("invalid waves are rejected", {
  expect_error(
    apply_lasa030_labels(data.frame(), wave = "L"),
    "Unknown LASA 030 wave"
  )
})
