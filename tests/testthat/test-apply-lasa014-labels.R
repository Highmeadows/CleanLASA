test_that("apply_lasa014_labels has the shared LASA label-function interface", {
  expect_identical(
    names(formals(apply_lasa014_labels)),
    names(formals(apply_lasa046_labels))
  )
  expect_identical(
    formals(apply_lasa014_labels)[c(
      "name_corrections", "to_factor", "to_numeric", "standardize_names",
      "split_wavecode"
    )],
    formals(apply_lasa046_labels)[c(
      "name_corrections", "to_factor", "to_numeric", "standardize_names",
      "split_wavecode"
    )]
  )
})

test_that("LASAB014 variable and value labels are applied", {
  dat <- data.frame(
    BHINDEP = c(1, 2),
    BMOVED = c(1, 2),
    BMOMONTH = c(1, -1),
    BMOYEAR = c(1990, -1),
    BFDOORC = c(-3, -1)
  )

  out <- apply_lasa014_labels(dat, wave = "B")

  expect_identical(
    attr(out$BHINDEP, "label"),
    "OBSERVATION: type of housing"
  )
  expect_identical(unname(attr(out$BHINDEP, "labels")["independent"]), 1)
  expect_identical(unname(attr(out$BMOVED, "labels")["yes"]), 2)
  expect_identical(unname(attr(out$BMOMONTH, "labels")["January"]), 1)
  expect_identical(
    unname(attr(out$BFDOORC, "labels")["monastery"]),
    -3
  )
})

test_that("LASA014 reshaping and name standardization match shared behaviour", {
  dat <- data.frame(
    BHINDEP = c(1, 2),
    BMOMONTH = c(1, -1),
    BMOYEAR = c(1990, -1),
    BFDOORC = c(-3, -1)
  )

  out <- apply_lasa014_labels(
    dat,
    wave = "B",
    to_factor = TRUE,
    to_numeric = TRUE,
    standardize_names = TRUE
  )

  # standardize_names = TRUE always implies split_wavecode = TRUE, so the
  # wave code is stripped from the canonical name too.
  expect_true(is.factor(out$hindep))
  expect_true(is.factor(out$momonth))
  expect_equal(as.numeric(out$moyear), c(1990, NA_real_))
  expect_true(is.factor(out$fdoorc))
  expect_true(all(c("monastery", "unknown") %in% levels(out$fdoorc)))
  expect_identical(attr(out$moyear, "label"), "Moved since last interview: year")

  report <- lasa_label_report(out)
  expect_true(all(report$standardized_to[!is.na(report$matched_name)] %in% names(out)))
})

test_that("LASA014 wave-specific coding differences are retained", {
  moved_c <- apply_lasa014_labels(data.frame(CMOVED = 1), wave = "C")
  moved_f <- apply_lasa014_labels(data.frame(FMOVED = 3), wave = "F")
  expect_false("yes, temporarily living elsewhere" %in% names(attr(moved_c$CMOVED, "labels")))
  expect_identical(
    unname(attr(moved_f$FMOVED, "labels")["yes, temporarily living elsewhere"]),
    3
  )

  wave_2b <- apply_lasa014_labels(
    data.frame(BSPEC01 = 1, BOSPEC1 = 1),
    wave = "2B"
  )
  expect_identical(
    unname(attr(wave_2b$BSPEC01, "labels")["not mentioned"]),
    1
  )
  expect_identical(unname(attr(wave_2b$BOSPEC1, "labels")["yes"]), 1)

  wave_h <- apply_lasa014_labels(
    data.frame(HHOUSEM = 1, HSPEC7 = -5),
    wave = "H"
  )
  expect_identical(
    unname(attr(wave_h$HHOUSEM, "labels")["attached row or semi-detached"]),
    1
  )
  expect_identical(
    unname(attr(wave_h$HSPEC7, "labels")["na, see HHINDEP"]),
    -5
  )
  expect_identical(
    unname(attr(wave_h$HHOUSEM, "labels")["other (documented)"]),
    11
  )

  wave_k <- apply_lasa014_labels(
    data.frame(KHOUSTYP = -4, KSPEC9 = 1, KSPEC10 = 1),
    wave = "K"
  )
  expect_identical(
    unname(attr(wave_k$KHOUSTYP, "labels")["na, previous interview unknown"]),
    -4
  )
  expect_identical(
    attr(wave_k$KSPEC9, "label"),
    "Spec. adjust: sensors to monitor movement"
  )
  expect_identical(attr(wave_k$KSPEC10, "label"), "Spec. adjust: other")

  wave_mb <- apply_lasa014_labels(data.frame(BHINDEP = 7), wave = "MB")
  expect_identical(unname(attr(wave_mb$BHINDEP, "labels")["other"]), 7)
  expect_false("monastery" %in% names(attr(wave_mb$BHINDEP, "labels")))
})

test_that("LASA014 matching audit is complete and has no duplicate variables", {
  waves <- c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")

  expected_suffixes <- list(
    B = c(
      "hindep", "moved", "momonth", "moyear", "housem", "houstyp",
      "fdoor", "fdoorc", "rfdoor", "nrooms", "nroomsc", "lrooms",
      "specadj", sprintf("spec%02d", 1:17), "satis",
      sprintf("satis%02d", 1:9)
    ),
    C = c(
      "hindep", "moved", "momonth", "moyear", "housem", "houstyp",
      "fdoor", "fdoorc", "rfdoor", "nrooms", "nroomsc", "lrooms",
      "specadj", sprintf("spec%02d", 1:17), "satis"
    ),
    `2B` = c(
      "hindep", "momonth", "moyear", "houstyp", "fdoor", "rfdoor",
      "nrooms", "lrooms", "specadj", sprintf("spec%02d", 1:17),
      paste0("ospec", 1:6), "satis"
    ),
    H = c(
      "hindep", "moved", "momonth", "moyear", "housem", "houstyp",
      "hwhacc", "nrooms", "nroomsc", "lrooms", "specadj",
      paste0("spec", 1:9), "specwho", "satis"
    ),
    `3B` = c(
      "hindep", "houstyp", "momonth", "moyear", "hwhacc", "specadj",
      paste0("spec", 1:9), "specwho", "satis"
    ),
    MB = "hindep",
    I = c(
      "hindep", "moved", "momonth", "moyear", "housem", "houstyp",
      "hwhacc", "nrooms", "lrooms", "specadj", paste0("spec", 1:9),
      "specwho", "satis"
    ),
    J = c(
      "hindep", "moved", "momonth", "moyear", "housem", "houstyp",
      "hwhacc", "specadj", paste0("spec", 1:9), "specwho", "satis"
    ),
    K = c(
      "hindep", "moved", "momonth", "moyear", "housem", "houstyp",
      "hwhacc", "specadj", paste0("spec", 1:10), "specwho", "satis"
    )
  )
  expected_suffixes$D <- expected_suffixes$C
  expected_suffixes$E <- expected_suffixes$C
  expected_suffixes$F <- expected_suffixes$C
  expected_suffixes$G <- expected_suffixes$C

  for (wave in waves) {
    out <- apply_lasa014_labels(data.frame(respnr = integer()), wave = wave)
    report <- lasa_label_report(out)
    expect_gt(nrow(report), 0L)
    expect_false(anyDuplicated(report$expected_name) > 0L, info = wave)
    # "respnr" is always audited too (see .lasa_label_engine()) but is not
    # part of LASA014's own documented variable layout.
    documented_suffixes <- report$suffix[report$suffix != "respnr"]
    expect_setequal(documented_suffixes, expected_suffixes[[wave]])
  }
})

test_that("LASA014 supports manual corrections and dispatcher naming", {
  dat <- data.frame(BMOMNTH = 1)
  out <- apply_lasa014_labels(
    dat,
    wave = "B",
    name_corrections = c(momonth = "BMOMNTH"),
    standardize_names = TRUE
  )

  # standardize_names = TRUE always implies split_wavecode = TRUE, so the
  # wave code is stripped from the canonical name too.
  expect_true("momonth" %in% names(out))
  report <- lasa_label_report(out)
  row <- report[report$suffix == "momonth", , drop = FALSE]
  expect_identical(row$method, "manual correction")
  expect_identical(.lasa_apply_function_name("014"), "apply_lasa014_labels")
  expect_identical(
    .lasa_parse_filename("LAS3B014.SAV")$apply_function,
    "apply_lasa014_labels"
  )
})

test_that("original SPSS value coding survives to_numeric/to_factor reshaping", {
  # BFDOORC's codes are all negative but are substantive "constructed"
  # categories, not missing-reason codes, so LASA014's stricter
  # is_codebook_numeric() keeps it categorical even with to_numeric = TRUE.
  data <- data.frame(BFDOORC = c(-3, -2, -1))
  out <- apply_lasa014_labels(data, wave = "B", to_numeric = TRUE, to_factor = TRUE)

  expect_true(is.factor(out$BFDOORC))
  expect_identical(unname(attr(out$BFDOORC, "original_values")), c(-3, -2, -1))
  expect_false(is.null(attr(out$BFDOORC, "original_labels")))
})

test_that("split_wavecode splits the wave code into LASA_wave", {
  data <- data.frame(RespNr = 1:2, BHINDEP = c(1, 2))
  out <- apply_lasa014_labels(data, wave = "B", split_wavecode = TRUE)

  expect_true("LASA_wave" %in% names(out))
  expect_true(all(out$LASA_wave == "B"))
  expect_identical(names(out)[[2]], "LASA_wave")
  expect_true("hindep" %in% names(out))
  # respnr is matched (to position LASA_wave) but not renamed, since
  # standardize_names = FALSE.
  expect_true("RespNr" %in% names(out))
})

test_that("LASA014 validates its wave and shared arguments", {
  expect_error(
    apply_lasa014_labels(data.frame(), wave = "A"),
    "Unknown LASA 014 wave"
  )
  expect_error(
    apply_lasa014_labels(data.frame(), wave = "B", to_factor = NA),
    "'to_factor' must be TRUE or FALSE"
  )
  expect_error(
    apply_lasa014_labels(
      data.frame(), wave = "B", name_corrections = "BMOMONTH"
    ),
    "'name_corrections' must be NULL or a named character vector"
  )
})
