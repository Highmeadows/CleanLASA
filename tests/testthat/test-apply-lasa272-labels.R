lasa272_suffixes <- c(
  "fadied", "modied", "brodied", "sisdied", "sondied", "daudied",
  "gcdied", "illpart", "illoth", "crime", "conflic", "financ"
)

make_lasa272_data <- function(wave, values = c(-1, 1, 2)) {
  columns <- rep(list(values), length(lasa272_suffixes))
  names(columns) <- paste0(tolower(wave), lasa272_suffixes)
  as.data.frame(columns, check.names = FALSE)
}

test_that("LASA272 has the same parameter contract as LASA046", {
  expect_identical(
    formals(apply_lasa272_labels),
    formals(apply_lasa046_labels)
  )
})

test_that("LASA272 labels every documented variable in every supported wave", {
  for (wave in c("C", "D", "E", "F", "G", "H", "I", "J", "K")) {
    out <- apply_lasa272_labels(make_lasa272_data(wave), wave)
    prefix <- tolower(wave)

    for (suffix in lasa272_suffixes) {
      x <- out[[paste0(prefix, suffix)]]
      expect_true(nzchar(attr(x, "label", exact = TRUE)), info = paste(wave, suffix))
      expect_true(
        length(attr(x, "labels", exact = TRUE)) > 0L,
        info = paste(wave, suffix)
      )
    }

    report <- attr(out, "label_report", exact = TRUE)
    expect_equal(nrow(report), 12L, info = wave)
    expect_true(all(report$method == "exact"), info = wave)
    expect_equal(report$expected_name, paste0(prefix, lasa272_suffixes), info = wave)
  }
})

test_that("wave C uses the documented LASA272 labels and value codes", {
  out <- apply_lasa272_labels(make_lasa272_data("C"), "c")

  expect_identical(attr(out$cfadied, "label"), "father died")
  expect_identical(
    attr(out$cfadied, "labels"),
    c(
      "refusal/skip by I" = -6,
      "terminated interview" = -5,
      "short version Q" = -4,
      "not asked" = -2,
      "no answer" = -1,
      "not died" = 1,
      "died" = 2
    )
  )
  expect_identical(unname(attr(out$csisdied, "labels")[["answ:no sisters"]]), -2)
  expect_false("do not know" %in% names(attr(out$cfadied, "labels")))
  expect_false(-2 %in% unname(attr(out$cgcdied, "labels")))
})

test_that("waves D and E-H use their distinct parent and partner routing labels", {
  out_d <- apply_lasa272_labels(make_lasa272_data("D"), "D")
  out_e <- apply_lasa272_labels(make_lasa272_data("E"), "E")
  out_h <- apply_lasa272_labels(make_lasa272_data("H"), "H")

  expect_identical(unname(attr(out_d$dfadied, "labels")[["not asked"]]), -2)
  expect_identical(unname(attr(out_e$efadied, "labels")[["na:died earlier"]]), -2)
  expect_identical(unname(attr(out_h$hfadied, "labels")[["na:died earlier"]]), -2)

  expect_identical(unname(attr(out_d$dillpart, "labels")[["not asked"]]), -2)
  expect_identical(unname(attr(out_e$eillpart, "labels")[["na:no partner"]]), -2)
  expect_identical(unname(attr(out_h$hillpart, "labels")[["na:no partner"]]), -2)
})

test_that("waves I-J include the expanded technical and routing codes", {
  out_i <- apply_lasa272_labels(make_lasa272_data("I"), "I")
  out_j <- apply_lasa272_labels(make_lasa272_data("J"), "J")

  expect_identical(
    unname(attr(out_i$ifadied, "labels")[["not asked: no data available"]]),
    -10
  )
  expect_identical(
    unname(attr(out_j$jbrodied, "labels")[["not asked: no brothers (alive)"]]),
    -3
  )
  expect_identical(
    unname(
      attr(out_i$iillpart, "labels")[[
        "not asked: partner not identified in demographic part"
      ]]
    ),
    -3
  )
  expect_identical(unname(attr(out_j$jbrodied, "labels")[["not died"]]), 1)
  expect_false(-10 %in% unname(attr(out_i$igcdied, "labels")))
})

test_that("wave K adds error-routing codes and full bilingual question labels", {
  out <- apply_lasa272_labels(make_lasa272_data("K"), "K")

  expect_identical(
    attr(out$kfadied, "label"),
    paste(
      "Did your father pass away after previous interview / Is uw vader",
      "na Maand Jaar overleden"
    )
  )
  expect_identical(
    attr(out$killoth, "label"),
    paste(
      "After Month Year, has any of your family members been seriously ill",
      "or had a serious accident / Is één van uw familieleden na Maand Jaar",
      "ernstig ziek geweest of heeft een familielid een ernstig ongeluk gehad"
    )
  )
  expect_identical(
    unname(attr(out$kfadied, "labels")[["not asked (error routing)"]]),
    -11
  )
  expect_identical(
    unname(attr(out$ksisdied, "labels")[["not asked (error routing)"]]),
    -11
  )
  expect_false(-11 %in% unname(attr(out$kgcdied, "labels")))
  expect_false(-11 %in% unname(attr(out$killpart, "labels")))
})

test_that("LASA272 matching, corrections, and standardized names mirror LASA046", {
  data <- data.frame(
    CFADIED = c(1, 2),
    partner_event = c(2, 1),
    unrelated = c(10, 20),
    check.names = FALSE
  )

  out <- apply_lasa272_labels(
    data,
    wave = "C",
    name_corrections = c(illpart = "partner_event"),
    standardize_names = TRUE
  )

  expect_true(all(c("cfadied", "cillpart", "unrelated") %in% names(out)))
  expect_identical(attr(out$cfadied, "label"), "father died")
  expect_identical(attr(out$cillpart, "label"), "illness partner/spouse")

  report <- attr(out, "label_report", exact = TRUE)
  expect_identical(report$method[report$suffix == "fadied"], "case-insensitive exact")
  expect_identical(report$method[report$suffix == "illpart"], "manual correction")
  expect_identical(report$standardized_to[report$suffix == "illpart"], "cillpart")
  expect_equal(sum(report$method == "not found"), 10L)
})

test_that("LASA272 factor conversion retains undocumented observed values", {
  data <- data.frame(cfadied = c(-1, 1, 2, 99))
  out <- apply_lasa272_labels(
    data,
    wave = "C",
    to_factor = TRUE,
    to_numeric = TRUE
  )

  expect_s3_class(out$cfadied, "factor")
  expect_true("99" %in% levels(out$cfadied))
  expect_identical(attr(out$cfadied, "label"), "father died")
})

test_that("LASA272 rejects unsupported waves and invalid shared arguments", {
  expect_error(
    apply_lasa272_labels(data.frame(), "B"),
    "Unknown LASA 272 wave"
  )
  expect_error(
    apply_lasa272_labels(data.frame(), "C", to_factor = NA),
    "'to_factor' must be TRUE or FALSE"
  )
  expect_error(
    apply_lasa272_labels(data.frame(), "C", name_corrections = "cfadied"),
    "'name_corrections' must be NULL or a named character vector"
  )
})

test_that("read_lasa_sav dispatches LASA272 files automatically", {
  skip_if_not_installed("haven")

  path <- file.path(tempdir(), "LASAC272.SAV")
  on.exit(unlink(path), add = TRUE)
  haven::write_sav(data.frame(cfadied = c(1, 2)), path)

  out <- read_lasa_sav(path)

  expect_identical(attr(out$cfadied, "label"), "father died")
  expect_identical(attr(out, "LASA_wave", exact = TRUE), "C")
  expect_identical(attr(out, "LASA_file_code", exact = TRUE), "272")
  expect_identical(
    attr(out, "LASA_label_function", exact = TRUE),
    "apply_lasa272_labels"
  )
})
