# Regression tests for LASA varinfo PDF parsing.
#
# Real-PDF tests use development fixtures under codebook/ when available.
# Synthetic helper tests always run and cover the wave-scoping logic that
# previously contaminated LASA046 value labels.

codebook_pdf <- function(name) {
  path <- testthat::test_path(
    "..", "..", "codebook", name
  )
  if (!file.exists(path)) {
    testthat::skip(
      paste("codebook fixture not available:", name)
    )
  }
  path
}

test_that("inline value conditions are wave-scoped, not flattened", {
  waves <- c(
    "B", "C", "D", "E", "2B", "F", "G",
    "H", "3B", "I", "J", "K"
  )

  parsed <- .lasa_varinfo_parse_scoped_value_labels(
    c(
      "na, interview terminated(-5),",
      "na, short interview(-4),",
      "For B/C/D/E/2B/F/G: na, wrong skip(-3),",
      "From H onwards: not done, wrong skip(-3),",
      "na, asked(-1),",
      "respondent bedridden(1),",
      "respondent in elec. wheelchair(2), respondent",
      "in mech. wheelchair(3),",
      "not 1, 2 or 3(4)"
    ),
    waves
  )

  early <- parsed[
    parsed$value_raw == "-3" &
      parsed$wave %in% c(
        "B", "C", "D", "E", "2B", "F", "G"
      ),
    ,
    drop = FALSE
  ]
  late <- parsed[
    parsed$value_raw == "-3" &
      parsed$wave %in% c(
        "H", "3B", "I", "J", "K"
      ),
    ,
    drop = FALSE
  ]

  expect_equal(nrow(early), 7L)
  expect_true(all(early$value_label == "na, wrong skip"))

  expect_equal(nrow(late), 5L)
  expect_true(
    all(late$value_label == "not done, wrong skip")
  )

  asked <- parsed[parsed$value_raw == "-1", , drop = FALSE]
  expect_setequal(asked$wave, waves)
  expect_true(all(asked$value_label == "na, asked"))
})

test_that("standalone value conditions persist until the next condition", {
  waves <- c("B", "C", "D", "E", "2B", "F", "G")

  parsed <- .lasa_varinfo_parse_scoped_value_labels(
    c(
      "distance walking(1),",
      "winter sports(16),",
      "Only in waves B, C, D, E:",
      "other sports(17)",
      "Only in waves 2B, F, G:",
      "golf(17),",
      "other sports(18)"
    ),
    waves
  )

  code17 <- parsed[
    parsed$value_raw == "17",
    ,
    drop = FALSE
  ]

  expect_true(
    all(
      code17$value_label[
        code17$wave %in% c("B", "C", "D", "E")
      ] == "other sports"
    )
  )
  expect_true(
    all(
      code17$value_label[
        code17$wave %in% c("2B", "F", "G")
      ] == "golf"
    )
  )
})

test_that("an external table reference does not discard earlier codes", {
  parsed <- .lasa_varinfo_split_value_labels(
    paste(
      "na, wrong skip(-3),",
      "na, asked(-1),",
      "see *Table Sports and activities"
    )
  )

  expect_true("-3" %in% parsed$value_raw)
  expect_true("-1" %in% parsed$value_raw)

  unresolved <- parsed[is.na(parsed$value_raw), , drop = FALSE]
  expect_equal(nrow(unresolved), 1L)
  expect_match(
    unresolved$parse_note,
    "external reference"
  )
})

test_that("canonical-name repair distinguishes a shared prefix from an invariant name", {
  vars <- data.frame(
    filecode = c("046", "046", "004", "004"),
    wave = c("B", "MB", "Z", "MB"),
    variable_name = c(
      "blphya07", "blphya07", "byear", "byear"
    ),
    canonical_name = c(
      "blphya07", "blphya07", "byear", "byear"
    ),
    variable_label = NA_character_,
    source_page = 1L,
    source_row = 1:4,
    source_condition = NA_character_,
    parse_note = NA_character_,
    stringsAsFactors = FALSE
  )

  repaired <- .lasa_varinfo_repair_canonical_names(vars)

  expect_equal(
    repaired$canonical_name[1:2],
    c("lphya07", "lphya07")
  )
  expect_equal(
    repaired$canonical_name[3:4],
    c("byear", "byear")
  )
})

test_that("parses LASA046 with wave-specific -3 labels and clean names", {
  res <- .lasa_parse_varinfo(
    codebook_pdf("LASA046_varinfo.pdf")
  )

  expect_gt(nrow(res$variables), 400L)

  lphya01 <- res$variables[
    res$variables$canonical_name == "lphya01",
    ,
    drop = FALSE
  ]
  expect_setequal(
    lphya01$wave,
    c(
      "B", "C", "D", "E", "2B", "F", "G",
      "H", "3B", "I", "J", "K"
    )
  )
  expect_true(
    all(
      lphya01$variable_name ==
        paste0(
          .lasa_varinfo_wave_prefix(lphya01$wave),
          "lphya01"
        )
    )
  )
  expect_true(
    all(
      lphya01$variable_label ==
        "Physical condition respondent: observation"
    )
  )

  early_waves <- c(
    "B", "C", "D", "E", "2B", "F", "G"
  )
  late_waves <- c("H", "3B", "I", "J", "K")

  for (wave in early_waves) {
    variable_name <- paste0(
      .lasa_varinfo_wave_prefix(wave),
      "lphya01"
    )
    hit <- res$value_labels[
      res$value_labels$wave == wave &
        res$value_labels$variable_name == variable_name &
        !is.na(res$value_labels$value_raw) &
        res$value_labels$value_raw == "-3",
      ,
      drop = FALSE
    ]
    expect_equal(nrow(hit), 1L)
    expect_equal(
      hit$value_label,
      "na, wrong skip"
    )
  }

  for (wave in late_waves) {
    variable_name <- paste0(
      .lasa_varinfo_wave_prefix(wave),
      "lphya01"
    )
    hit <- res$value_labels[
      res$value_labels$wave == wave &
        res$value_labels$variable_name == variable_name &
        !is.na(res$value_labels$value_raw) &
        res$value_labels$value_raw == "-3",
      ,
      drop = FALSE
    ]
    expect_equal(nrow(hit), 1L)
    expect_equal(
      hit$value_label,
      "not done, wrong skip"
    )
  }

  expect_false(
    any(
      grepl(
        "(?i)\\bLAS(?:A|2B|3B|4B|MB)[A-Za-z0-9]{2,4}\\b",
        stats::na.omit(res$variables$variable_label),
        perl = TRUE
      )
    )
  )
})

test_that("LASA046 sport code 17 is correctly wave-specific", {
  res <- .lasa_parse_varinfo(
    codebook_pdf("LASA046_varinfo.pdf")
  )

  get_code17 <- function(wave) {
    variable_name <- paste0(
      .lasa_varinfo_wave_prefix(wave),
      "lphya22"
    )
    res$value_labels[
      res$value_labels$wave == wave &
        res$value_labels$variable_name == variable_name &
        res$value_labels$value_raw == "17",
      "value_label",
      drop = TRUE
    ]
  }

  expect_equal(get_code17("B"), "other sports")
  expect_equal(get_code17("C"), "other sports")
  expect_equal(get_code17("D"), "other sports")
  expect_equal(get_code17("E"), "other sports")

  expect_equal(get_code17("2B"), "golf")
  expect_equal(get_code17("F"), "golf")
  expect_equal(get_code17("G"), "golf")
})

test_that("LASAz004/MB004 keeps invariant canonical names", {
  res <- .lasa_parse_varinfo(
    codebook_pdf("LASAz004_varinfo.pdf")
  )

  expect_setequal(
    unique(res$variables$wave),
    c("Z", "MB")
  )
  expect_true(all(res$variables$filecode == "004"))

  byear <- res$variables[
    res$variables$variable_name == "byear",
    ,
    drop = FALSE
  ]
  expect_setequal(byear$wave, c("Z", "MB"))
  expect_true(all(byear$canonical_name == "byear"))
})

test_that("back-to-back 868/878 sections remain separated", {
  res <- .lasa_parse_varinfo(
    codebook_pdf("LASA868-878_varinfo.pdf")
  )

  expect_false(any(grepl(";", res$variables$filecode, fixed = TRUE)))
  expect_true(all(res$variables$filecode %in% c("868", "878")))
  expect_true(all(c("868", "878") %in% unique(res$variables$filecode)))
  expect_gt(nrow(res$variables), 3L)
})

test_that("unresolved rows carry parse notes rather than fabricated waves", {
  res <- .lasa_parse_varinfo(
    codebook_pdf("LASA046_varinfo.pdf")
  )

  bad <- res$variables[
    !is.na(res$variables$parse_note),
    ,
    drop = FALSE
  ]

  if (nrow(bad) > 0L) {
    expect_true(
      all(is.na(bad$wave) | nzchar(bad$parse_note))
    )
  }
})

test_that("LASA046 Not in/Only in value scopes are materialized by wave", {
  res <- .lasa_parse_varinfo(
    codebook_pdf("LASA046_varinfo.pdf")
  )

  early <- res$value_labels[
    res$value_labels$variable_name == "blphya15" &
      res$value_labels$wave == "B" &
      res$value_labels$value_raw == "-2",
    ,
    drop = FALSE
  ]
  late <- res$value_labels[
    res$value_labels$variable_name == "ilphya15" &
      res$value_labels$wave == "I" &
      res$value_labels$value_raw == "-2",
    ,
    drop = FALSE
  ]

  expect_equal(nrow(early), 1L)
  expect_equal(nrow(late), 1L)
  expect_match(early$value_label, "BLPHYA14", ignore.case = TRUE)
  expect_match(late$value_label, "I/J/KLPHYA01", ignore.case = TRUE)
  expect_false(grepl("Only in|Not in", early$value_label, ignore.case = TRUE))
  expect_false(grepl("Only in|Not in", late$value_label, ignore.case = TRUE))
})

test_that("LASA046 In-waves and Only-in-K code scopes are retained", {
  res <- .lasa_parse_varinfo(
    codebook_pdf("LASA046_varinfo.pdf")
  )

  # lphya46 code 0 is documented only for D, E and 2B.
  code0 <- res$value_labels[
    res$value_labels$variable_name %in% c("dlphya46", "elphya46", "blphya46") &
      res$value_labels$value_raw == "0",
    ,
    drop = FALSE
  ]
  expect_setequal(code0$wave, c("D", "E", "2B"))
  expect_true(all(code0$value_label == "-to be coded-"))

  # lphya50 value 11 (COVID19) is documented only in wave K.
  covid <- res$value_labels[
    res$value_labels$value_raw == "11" &
      grepl("COVID19", res$value_labels$value_label, fixed = TRUE),
    ,
    drop = FALSE
  ]
  expect_equal(nrow(covid), 1L)
  expect_equal(covid$wave, "K")
  expect_equal(covid$variable_name, "klphya50")
})
