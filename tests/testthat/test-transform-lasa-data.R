## transform_lasa_data(): reshaping LASA data between wide format (one row
## per respondent, a column per variable per wave, as in Z files) and long
## format (one row per respondent per wave, with "Wave" and "Time").

write_transform_sav <- function(data, filename) {
  skip_if_not_installed("haven")
  # A directory of its own per file, so tests that reuse a LASA file name
  # (e.g. "LASAB046.SAV") never read each other's fixtures.
  dir <- tempfile("transform-")
  dir.create(dir)
  path <- file.path(dir, filename)
  haven::write_sav(data, path)
  path
}

read_fixture <- function(data, filename, ...) {
  read_lasa_sav(write_transform_sav(data, filename), ...)
}

oa_labels <- c(
  missing = -9, no = 0, possible = 1, yes = 2,
  dropout = 8, `dropout at previous waves` = 9
)

## Knee and hip osteoarthritis at waves B, C, and D, as in lasazoa1.SAV.
oa_fixture <- function(labelled = haven::labelled) {
  data.frame(
    RespNr = c(1, 2, 3),
    BOAK = labelled(c(0, 0, 2), oa_labels),
    BOAH = labelled(c(0, 1, 0), oa_labels),
    COAK = labelled(c(8, -9, 0), oa_labels),
    COAH = labelled(c(8, -9, 1), oa_labels),
    DOAK = labelled(c(9, 0, -9), oa_labels),
    DOAH = labelled(c(9, 0, -9), oa_labels)
  )
}

## Stable respondent characteristics, as in LASAZ004.SAV.
z004_fixture <- function() {
  data.frame(
    RespNr = c(1, 2, 3),
    SEX = haven::labelled(c(1, 2, 1), c(male = 1, female = 2)),
    BYEAR = c(1920, 1925, 1930)
  )
}

## A regular wave file of file code 046 or 030, with LASA's uppercase,
## wave-prefixed column names.
wave_fixture <- function(filecode, prefix, ids = 1:3) {
  variables <- switch(filecode,
    "046" = c("LPHYA01", "LPHYA07"),
    "030" = c("ADL1A", "ADL1B")
  )
  dat <- data.frame(RespNr = ids, x1 = c(1, 4, 2)[seq_along(ids)], x2 = c(1, 2, -1)[seq_along(ids)])
  names(dat)[2:3] <- paste0(prefix, variables)
  dat
}

## Adds y's columns to x, for data whose rows hold the same respondents in
## the same order (keeps every column attribute, unlike merge()).
bind_columns <- function(x, y) {
  stopifnot(identical(as.numeric(x$respnr), as.numeric(y$respnr)))
  for (name in setdiff(names(y), names(x))) x[[name]] <- y[[name]]
  x
}

## The columns of a data frame, as a plain named list (without the data
## frame's own attributes).
columns_of <- function(data) {
  stats::setNames(lapply(seq_along(data), function(j) data[[j]]), names(data))
}

## Columns without the bookkeeping attribute that lets transform_lasa_data()
## restore wide columns exactly.
without_store <- function(data) {
  for (name in names(data)) attr(data[[name]], "LASA_wide_columns") <- NULL
  data
}

test_that("wide data become one row per respondent per wave, with Wave and Time", {
  wide <- data.frame(respnr = c(101, 102), sex = c(1, 2), boak = c(0, 2), coak = c(1, 8))
  long <- transform_lasa_data(wide)

  expect_s3_class(long, "data.frame")
  expect_named(long, c("respnr", "Wave", "Time", "sex", "oak"))
  expect_equal(long$respnr, c(101, 101, 102, 102))
  expect_equal(long$Wave, c("B", "C", "B", "C"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(1L, 2L, 1L, 2L))
  # The stable column is repeated on each of the respondent's rows.
  expect_equal(long$sex, c(1, 1, 2, 2))
  expect_equal(long$oak, c(0, 1, 2, 8), ignore_attr = TRUE)
  expect_equal(attr(long$Wave, "label"), "LASA measurement wave")
  expect_match(attr(long$Time, "label"), "calendar order")
})

test_that("Time numbers the waves in calendar order, with B = 1", {
  waves <- c("A", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
  long <- data.frame(respnr = 1, Wave = rev(tolower(waves)), score = seq_along(waves))
  out <- transform_lasa_data(long)

  expect_named(out, c("respnr", "Wave", "Time", "score"))
  expect_equal(out$Wave, rev(waves), ignore_attr = TRUE)
  expect_identical(as.vector(out$Time), rev(0:13))
  expect_equal(out$score, long$score)
})

test_that("format and prefix are validated, ignoring case", {
  wide <- data.frame(respnr = 1:2, boak = c(0, 2), coak = c(1, 8))
  expect_error(transform_lasa_data(as.list(wide)), "'data' must be a data frame")
  expect_error(transform_lasa_data(wide, format = "tall"), "'format' must be \"long\" or \"wide\"")
  expect_error(transform_lasa_data(wide, format = c("long", "wide")), "'format' must be")
  expect_error(
    transform_lasa_data(wide, format = "wide", prefix = "Year"),
    "'prefix' must be \"Wave\" or \"Time\""
  )
  expect_identical(transform_lasa_data(wide, format = "LONG"), transform_lasa_data(wide))
  expect_identical(
    transform_lasa_data(wide, format = "Wide", prefix = "time"),
    transform_lasa_data(wide, format = "wide", prefix = "Time")
  )
})

test_that("wide -> long -> wide gives a plain data frame back exactly", {
  wide <- data.frame(
    RespNr = c(101L, 102L, 103L),
    group = c("a", "b", "a"),
    boak = c(0, 2, NA),
    coak = c(1, NA, NA),
    doak = c(NA_real_, NA, NA)
  )
  back <- transform_lasa_data(transform_lasa_data(wide), format = "wide")
  expect_identical(columns_of(back), columns_of(wide))
  expect_identical(attr(back, "row.names"), attr(wide, "row.names"))
  expect_equal(attr(back, "LASA_wave"), "Z")
})

test_that("waves without any value get no row, unless a respondent has no value at all", {
  wide <- data.frame(
    respnr = 1:3,
    boak = c(0, 2, NA),
    coak = c(1, NA, NA),
    doak = c(NA_real_, NA, NA)
  )
  long <- transform_lasa_data(wide)
  expect_equal(long$respnr, c(1, 1, 2, 3, 3, 3))
  expect_equal(long$Wave, c("B", "C", "B", "B", "C", "D"), ignore_attr = TRUE)
  expect_equal(long$oak, c(0, 1, 2, NA, NA, NA), ignore_attr = TRUE)

  # A wave nobody has a value for leaves no rows, but transforming back
  # still restores its (empty) column.
  wide <- data.frame(respnr = 1:2, boak = c(0, 2), coak = c(NA_real_, NA))
  long <- transform_lasa_data(wide)
  expect_equal(long$Wave, c("B", "B"), ignore_attr = TRUE)
  expect_identical(columns_of(transform_lasa_data(long, format = "wide")), columns_of(wide))
})

test_that("prefix = \"Time\" names wide columns t<Time>_<variable>, and they convert back", {
  wide <- data.frame(respnr = c(101, 102), sex = c(1, 2), boak = c(0, 2), coak = c(1, 8))
  long <- transform_lasa_data(wide)

  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_named(time_wide, c("respnr", "sex", "t1_oak", "t2_oak"))
  expect_equal(time_wide$t2_oak, c(1, 8), ignore_attr = TRUE)

  long_again <- transform_lasa_data(time_wide)
  expect_identical(without_store(long_again), without_store(long))
  # ... and to wave prefixes again.
  expect_identical(columns_of(transform_lasa_data(long_again, format = "wide")), columns_of(wide))
})

test_that("a Z file read with read_lasa_sav() becomes long, with labels per wave", {
  zoa1 <- read_fixture(oa_fixture(), "lasazoa1.SAV")
  long <- transform_lasa_data(zoa1)

  expect_s3_class(long, "tbl_df")
  expect_named(long, c("respnr", "Wave", "Time", "oak", "oah"))
  expect_equal(long$respnr, rep(1:3, each = 3), ignore_attr = TRUE)
  expect_equal(long$Wave, rep(c("B", "C", "D"), 3), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), rep(1:3, 3))

  expect_s3_class(long$oak, "factor")
  expect_equal(levels(long$oak), levels(zoa1$boak))
  expect_equal(
    as.character(long$oak),
    c(
      "no", "dropout", "dropout at previous waves",
      "no", "missing", "no",
      "yes", "no", "missing"
    )
  )
  expect_equal(attr(long$oak, "label"), "Symptomatic knee osteoarthritis")
  expect_equal(attr(long$oak, "canonical_name"), "oak")
  expect_equal(
    attr(long$oak, "wave_label"),
    c(B = "symptomatic knee OA at B", C = "symptomatic knee OA at C", D = "symptomatic knee OA at D")
  )
  expect_named(attr(long$oak, "labels_wave"), c("B", "C", "D"))
  expect_equal(attr(long$oak, "labels_wave")$C, attr(zoa1$coak, "labels_wave"))

  # Provenance: still file code zoa1, but no longer a single wave.
  expect_equal(attr(long, "LASA_file_code"), "zoa1")
  expect_equal(attr(long, "LASA_source_file"), "lasazoa1.SAV")
  expect_null(attr(long, "LASA_wave"))
  expect_equal(unname(attr(long, "variable.labels")[["oak"]]), "Symptomatic knee osteoarthritis")
})

test_that("a Z file converts back to wide exactly as read_lasa_sav() returned it", {
  zoa1 <- read_fixture(oa_fixture(), "lasazoa1.SAV")
  original <- zoa1[setdiff(names(zoa1), "Wave")]

  back <- transform_lasa_data(transform_lasa_data(zoa1), format = "wide")
  expect_s3_class(back, "tbl_df")
  expect_identical(columns_of(back), columns_of(original))
  expect_equal(attr(back, "LASA_wave"), "Z")
  expect_equal(attr(back, "LASA_file_code"), "zoa1")

  # Labelled (not factor) columns round-trip too.
  labelled <- read_fixture(oa_fixture(), "lasazoa1.SAV", to_factor = FALSE)
  back <- transform_lasa_data(transform_lasa_data(labelled), format = "wide")
  expect_identical(columns_of(back), columns_of(labelled[setdiff(names(labelled), "Wave")]))
})

test_that("SPSS user-missing codes of several waves are combined when one definition fits them all", {
  oa <- function(x, ...) haven::labelled_spss(x, oa_labels, ...)
  wide <- data.frame(respnr = 1:3)
  wide$boak <- oa(c(0, -9, 2), na_values = -9)
  wide$coak <- oa(c(8, 1, 9), na_values = c(8, 9))
  long <- transform_lasa_data(wide)
  expect_equal(attr(long$oak, "na_values"), c(-9, 8, 9))
  expect_identical(columns_of(transform_lasa_data(long, format = "wide")), columns_of(wide))

  wide$boak <- oa(c(0, -9, 2), na_range = c(-10, -1))
  wide$coak <- oa(c(8, 1, 0), na_values = 8)
  long <- transform_lasa_data(wide)
  expect_equal(attr(long$oak, "na_values"), 8)
  expect_equal(attr(long$oak, "na_range"), c(-10, -1))
  expect_identical(columns_of(transform_lasa_data(long, format = "wide")), columns_of(wide))

  # -9 is missing at wave B but a value at wave C: no definition fits both.
  wide$boak <- oa(c(0, -9, 2), na_values = -9)
  wide$coak <- oa(c(-9, 1, 9), na_values = 9)
  expect_warning(long <- transform_lasa_data(wide), "user-missing codes \\(na_values/na_range\\) of oak differ")
  expect_null(attr(long$oak, "na_values"))
  expect_s3_class(long$oak, "haven_labelled")
  expect_identical(columns_of(transform_lasa_data(long, format = "wide")), columns_of(wide))
})

test_that("SPSS user-missing codes are values, so their rows are kept", {
  spss <- oa_fixture(function(x, labels) haven::labelled_spss(x, labels, na_values = c(-9, 8, 9)))
  wide <- read_fixture(spss, "lasazoa1.SAV", to_factor = FALSE, user_na = TRUE)
  expect_s3_class(wide$doak, "haven_labelled_spss")

  long <- transform_lasa_data(wide)
  expect_s3_class(long$oak, "haven_labelled_spss")
  expect_equal(nrow(long), 9L)
  expect_equal(as.vector(unclass(long$oak)), c(0, 8, 9, 0, -9, 0, 2, 0, -9), ignore_attr = TRUE)
  expect_equal(attr(long$oak, "na_values"), c(-9, 8, 9))

  back <- transform_lasa_data(long, format = "wide")
  expect_identical(columns_of(back), columns_of(wide[setdiff(names(wide), "Wave")]))
})

test_that("a Z file with only stable variables has no wave dimension", {
  z004 <- read_fixture(z004_fixture(), "LASAZ004.SAV")

  expect_message(out <- transform_lasa_data(z004), "no wave-specific columns")
  expect_named(out, c("respnr", "sex", "byear"))
  expect_identical(columns_of(out), columns_of(z004[c("respnr", "sex", "byear")]))
  expect_equal(attr(out, "LASA_wave"), "Z")

  expect_silent(out <- transform_lasa_data(z004, format = "wide"))
  expect_named(out, c("respnr", "sex", "byear"))
})

test_that("stable variables of a merged Z file are repeated on every wave's row", {
  z004 <- read_fixture(z004_fixture(), "LASAZ004.SAV")
  zoa1 <- read_fixture(oa_fixture(), "lasazoa1.SAV")
  merged <- bind_columns(z004, zoa1)

  long <- transform_lasa_data(merged)
  expect_named(long, c("respnr", "Wave", "Time", "sex", "byear", "oak", "oah"))
  expect_equal(nrow(long), 9L)
  expect_equal(as.character(long$sex), rep(c("male", "female", "male"), each = 3))
  expect_equal(long$byear, rep(c(1920, 1925, 1930), each = 3), ignore_attr = TRUE)
  expect_equal(attr(long$sex, "label"), attr(z004$sex, "label"))

  # Back to wide: the stable variables get one column again.
  back <- transform_lasa_data(long, format = "wide")
  expect_identical(columns_of(back), columns_of(merged[setdiff(names(merged), "Wave")]))
})

test_that("merged wave files of several file codes (046 + 030) become long", {
  read_wide <- function(filecode, wave, prefix = wave) {
    read_fixture(
      wave_fixture(filecode, prefix),
      paste0("LASA", wave, filecode, ".SAV"),
      standardize = FALSE
    )
  }
  wide <- Reduce(
    function(x, y) merge(x, y, by = "respnr"),
    list(read_wide("046", "B"), read_wide("046", "C"), read_wide("030", "B"), read_wide("030", "C"))
  )
  long <- transform_lasa_data(wide)
  expect_named(long, c("respnr", "Wave", "Time", "lphya01", "lphya07", "adl1a", "adl1b"))
  expect_equal(long$Wave, rep(c("B", "C"), 3), ignore_attr = TRUE)

  # The same values as reading the files straight into long format.
  read_long <- function(filecode, wave) {
    read_fixture(wave_fixture(filecode, wave), paste0("LASA", wave, filecode, ".SAV"))
  }
  expected <- merge(
    rbind(read_long("046", "B"), read_long("046", "C")),
    rbind(read_long("030", "B"), read_long("030", "C")),
    by = c("respnr", "Wave")
  )
  expected <- expected[order(expected$respnr, expected$Wave), ]
  for (name in c("respnr", "lphya01", "lphya07", "adl1a", "adl1b")) {
    expect_equal(as.character(long[[name]]), as.character(expected[[name]]), info = name)
  }
})

test_that("long-merged wave files (046 + 030) become wide and convert back", {
  read_long <- function(filecode, wave) {
    read_fixture(wave_fixture(filecode, wave), paste0("LASA", wave, filecode, ".SAV"))
  }
  long_046 <- rbind(read_long("046", "B"), read_long("046", "C"))
  long_030 <- rbind(read_long("030", "B"), read_long("030", "C"))
  long <- bind_columns(long_046, long_030)

  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c(
    "respnr", "blphya01", "blphya07", "badl1a", "badl1b",
    "clphya01", "clphya07", "cadl1a", "cadl1b"
  ))
  expect_equal(nrow(wide), 3L)
  expect_equal(as.character(wide$cadl1a), as.character(long$adl1a[long$Wave == "C"]))
  expect_equal(as.character(wide$blphya07), as.character(long$lphya07[long$Wave == "B"]))
  expect_equal(attr(wide$clphya01, "label"), attr(long$lphya01, "label"))

  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_named(time_wide, c(
    "respnr", "t1_lphya01", "t1_lphya07", "t1_adl1a", "t1_adl1b",
    "t2_lphya01", "t2_lphya07", "t2_adl1a", "t2_adl1b"
  ))

  for (back in list(transform_lasa_data(wide), transform_lasa_data(time_wide))) {
    expect_named(back, c("respnr", "Wave", "Time", "lphya01", "lphya07", "adl1a", "adl1b"))
    expect_equal(back$respnr, rep(1:3, each = 2), ignore_attr = TRUE)
    expect_equal(back$Wave, rep(c("B", "C"), 3), ignore_attr = TRUE)
    order <- order(long$respnr, long$Wave)
    for (name in c("lphya01", "lphya07", "adl1a", "adl1b")) {
      expect_equal(as.character(back[[name]]), as.character(long[[name]][order]), info = name)
    }
  }
})

test_that("a Z file's columns merged into long data move to their wave's rows", {
  read_long <- function(wave) read_fixture(wave_fixture("046", wave), paste0("LASA", wave, "046.SAV"))
  long_046 <- rbind(read_long("B"), read_long("C"))
  z_files <- bind_columns(
    read_fixture(z004_fixture(), "LASAZ004.SAV"),
    read_fixture(oa_fixture(), "lasazoa1.SAV")
  )
  mixed <- merge(long_046, z_files[setdiff(names(z_files), "Wave")], by = "respnr")

  long <- transform_lasa_data(mixed)
  expect_named(long, c("respnr", "Wave", "Time", "lphya01", "lphya07", "sex", "byear", "oak", "oah"))
  # zoa1 adds wave D, which the 046 files don't have.
  expect_equal(long$Wave, rep(c("B", "C", "D"), 3), ignore_attr = TRUE)
  expect_true(all(is.na(long$lphya01[long$Wave == "D"])))
  expect_equal(as.character(long$lphya01[long$Wave == "C"]), as.character(long_046$lphya01[long_046$Wave == "C"]))
  # A documented stable variable is filled in on the added rows.
  expect_equal(as.character(long$sex), rep(c("male", "female", "male"), each = 3))
  expect_equal(long$byear, rep(c(1920, 1925, 1930), each = 3), ignore_attr = TRUE)
  expect_equal(
    as.character(long$oak[long$Wave == "D"]),
    c("dropout at previous waves", "no", "missing")
  )

  wide <- transform_lasa_data(mixed, format = "wide")
  expect_true(all(c("boak", "coak", "doak", "blphya01", "clphya01", "sex", "byear") %in% names(wide)))
  expect_false(any(c("dlphya01", "Wave", "Time") %in% names(wide)))
})

test_that("a wide column adds its wave's values to a long column of the same variable", {
  long <- data.frame(respnr = c(1, 1, 2), Wave = c("B", "C", "B"), lphya01 = c(1, 2, 3))
  long$dlphya01 <- c(4, 4, NA)
  out <- transform_lasa_data(long)
  expect_named(out, c("respnr", "Wave", "Time", "lphya01"))
  expect_equal(out$Wave, c("B", "C", "D", "B"), ignore_attr = TRUE)
  expect_equal(out$lphya01, c(1, 2, 4, 3), ignore_attr = TRUE)

  long$blphya01 <- c(9, 9, 3)
  expect_error(transform_lasa_data(long), "hold different values")

  # Types that don't combine become text, with a warning; the wide column
  # converts back to its own type.
  long <- data.frame(respnr = c(1, 1, 2), Wave = c("B", "C", "B"), lphya01 = factor(c("a", "b", "c")))
  long$dlphya01 <- c(4, 4, NA)
  expect_warning(out <- transform_lasa_data(long), "lphya01 have types that don't combine")
  expect_equal(out$lphya01, c("a", "b", "4", "c"), ignore_attr = TRUE)
  expect_identical(transform_lasa_data(out, format = "wide")$dlphya01, c(4, NA))
})

test_that("columns the label database doesn't know stay one column when wide columns add rows", {
  long <- data.frame(
    respnr = c(1, 1, 2), Wave = c("B", "C", "B"), lphya01 = c(1, 2, 3), group = c("x", "x", "y")
  )
  # doak adds a wave D row for respondent 1, where group wasn't measured.
  long$doak <- c(1, 1, NA)
  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c("respnr", "group", "doak", "blphya01", "clphya01"))
  expect_equal(wide$group, c("x", "y"))
})

test_that("baselines of later cohorts (2B, 3B, MB) keep their own wide prefix", {
  wave_b <- read_fixture(wave_fixture("046", "B", ids = 1:3), "LASAB046.SAV")
  wave_2b <- read_fixture(wave_fixture("046", "B", ids = 4:6), "LAS2B046.SAV")
  long <- rbind(wave_b, wave_2b)

  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c("respnr", "blphya01", "blphya07", "b2lphya01", "b2lphya07"))
  expect_true(all(is.na(wide$b2lphya01[1:3])))
  expect_true(all(is.na(wide$blphya01[4:6])))

  back <- transform_lasa_data(wide)
  expect_equal(back$respnr, 1:6, ignore_attr = TRUE)
  expect_equal(back$Wave, rep(c("B", "2B"), each = 3), ignore_attr = TRUE)
  expect_identical(as.vector(back$Time), rep(c(1L, 5L), each = 3))

  # A 2B wave file read without standardizing still names its columns
  # "b...": its provenance says which wave they belong to.
  wave_2b_raw <- read_fixture(wave_fixture("046", "B"), "LAS2B046.SAV", standardize = FALSE)
  long <- transform_lasa_data(wave_2b_raw)
  expect_equal(unique(long$Wave), "2B", ignore_attr = TRUE)
  expect_identical(unique(as.vector(long$Time)), 5L)
  expect_equal(attr(long, "LASA_wave"), "2B")

  # LASA's own cohort Z files use b2/b3 prefixes.
  zoa2 <- data.frame(respnr = 1:2, b2oak = c(0, 1), foak = c(1, 2))
  long <- transform_lasa_data(zoa2)
  expect_equal(long$Wave, c("2B", "F", "2B", "F"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(5L, 6L, 5L, 6L))
})

test_that("baseline files of several cohorts stacked with LASA's own names keep each row's wave", {
  read_raw <- function(filename, ids) {
    read_fixture(wave_fixture("046", "B", ids = ids), filename, standardize = FALSE, add_wavecode = TRUE)
  }
  wave_b <- read_raw("LASAB046.SAV", 1:3)
  wave_2b <- read_raw("LAS2B046.SAV", 4:6)
  expect_named(wave_b, c("respnr", "Wave", "blphya01", "blphya07"))

  for (stacked in list(rbind(wave_b, wave_2b), rbind(wave_2b, wave_b))) {
    expect_silent(long <- transform_lasa_data(stacked))
    expect_named(long, c("respnr", "Wave", "Time", "lphya01", "lphya07"))
    expect_equal(long$respnr, stacked$respnr)
    expect_equal(long$Wave, stacked$Wave, ignore_attr = TRUE)
    expect_equal(as.character(long$lphya01), as.character(stacked$blphya01))
  }

  wide <- transform_lasa_data(rbind(wave_b, wave_2b), format = "wide")
  expect_named(wide, c("respnr", "blphya01", "b2lphya01", "blphya07", "b2lphya07"))
  # "blphya01" is every cohort's baseline name, and nothing else in the wide
  # data says these respondents are of the first cohort: the column says so.
  expect_equal(attr(wide$blphya01, "LASA_wave"), "B")
  expect_null(attr(wide$b2lphya01, "LASA_wave"))
  expect_silent(back <- transform_lasa_data(wide))
  expect_equal(back$Wave, rep(c("B", "2B"), each = 3), ignore_attr = TRUE)
})

test_that("a baseline column merged into long data goes to each respondent's own baseline", {
  # Respondent 1 (first cohort) has rows at B and C, respondent 2 (second
  # cohort) at 2B and F, and respondent 3 only at C, a first-cohort wave.
  long <- data.frame(respnr = c(1, 1, 2, 2, 3), Wave = c("B", "C", "2B", "F", "C"), lphya01 = 1:5)
  dm <- data.frame(respnr = 1:3, b_dm = c(0, 1, 1), f_dm = c(NA, 1, NA))
  mixed <- merge(long, dm, by = "respnr")
  # Provenance attributes saying otherwise don't override the rows.
  attr(mixed, "LASA_file_code") <- "zdc3"
  attr(mixed, "LASA_wave") <- "3B"

  expect_silent(out <- transform_lasa_data(mixed))
  expect_named(out, c("respnr", "Wave", "Time", "lphya01", "dm"))
  expect_equal(out$respnr, c(1, 1, 2, 2, 3, 3))
  expect_equal(out$Wave, c("B", "C", "2B", "F", "B", "C"), ignore_attr = TRUE)
  expect_equal(out$dm, c(0, NA, 1, 1, 1, NA), ignore_attr = TRUE)
  expect_equal(out$lphya01, c(1, 2, 3, 4, NA, 5), ignore_attr = TRUE)
})

test_that("a baseline column of wide data is placed by the respondent's other waves", {
  # c_DM shows respondent 1 is of the first cohort, b2oak that respondent 2
  # is of the second; nothing shows respondent 3's cohort.
  wide <- data.frame(respnr = 1:3, b_dm = c(0, 1, 1), c_dm = c(0, NA, NA), b2oak = c(NA, 2, NA))
  expect_message(long <- transform_lasa_data(wide), "placed at the wave shown: b_dm \\(B\\)")
  expect_equal(long$respnr, c(1, 1, 2, 3))
  expect_equal(long$Wave, c("B", "C", "2B", "B"), ignore_attr = TRUE)
  expect_equal(long$dm, c(0, 0, 1, 1), ignore_attr = TRUE)
  expect_equal(long$oak, c(NA, NA, 2, NA), ignore_attr = TRUE)
})

test_that("the data's provenance places only the columns its label report lists", {
  report <- data.frame(
    suffix = "blphya01", expected_name = "blphya01", matched_name = "blphya01",
    method = "exact", direction = "matched", edit_distance = NA, standardized_to = NA
  )
  # Data of wave 2B's file 046 (read with standardize = FALSE), with a b_dm
  # column merged in from another file.
  with_provenance <- function(data, report = NULL) {
    attr(data, "LASA_file_code") <- "046"
    attr(data, "LASA_wave") <- "2B"
    attr(data, "label_report") <- report
    data
  }
  wide <- with_provenance(data.frame(respnr = 1:2, blphya01 = c(1, 2), b_dm = c(0, 1)), report)

  # blphya01 is the file's own column: wave 2B. Those respondents are then
  # of the second cohort, so their b_dm is too.
  expect_silent(long <- transform_lasa_data(wide))
  expect_equal(long$Wave, c("2B", "2B"), ignore_attr = TRUE)
  expect_equal(long$dm, c(0, 1), ignore_attr = TRUE)

  # Without such evidence, the file's wave isn't applied to a column the
  # file doesn't have: a guess, with a message.
  only_dm <- with_provenance(data.frame(respnr = 1:2, b_dm = c(0, 1)), report)
  expect_message(long <- transform_lasa_data(only_dm), "b_dm \\(B\\)")
  expect_equal(long$Wave, c("B", "B"), ignore_attr = TRUE)

  # Without a label report, the provenance describes every column.
  only_dm <- with_provenance(data.frame(respnr = 1:2, b_dm = c(0, 1)))
  expect_silent(long <- transform_lasa_data(only_dm))
  expect_equal(long$Wave, c("2B", "2B"), ignore_attr = TRUE)
})

test_that("a wave-specific name that is also another variable's canonical name follows its canonical_name", {
  # immse02 is wave I's name for mmse02, and also the canonical name of
  # wave MB's bimmse02.
  long <- data.frame(respnr = c(1, 2), Wave = "MB", bmi = c(20, 25))
  long$immse02 <- c(1, 0)
  expect_named(transform_lasa_data(long), c("respnr", "Wave", "Time", "bmi", "immse02"))

  # As read from a wave I file without standardizing: wave I's mmse02.
  attr(long$immse02, "canonical_name") <- "mmse02"
  out <- transform_lasa_data(long)
  expect_named(out, c("respnr", "Wave", "Time", "bmi", "mmse02"))
  expect_equal(out$Wave, c("MB", "I", "MB", "I"), ignore_attr = TRUE)
  expect_equal(out$mmse02, c(NA, 1, NA, 0), ignore_attr = TRUE)
})

test_that("columns read_lasa_sav() matched by fuzzy matching or name_corrections are wave-specific too", {
  typo <- oa_fixture()[c("RespNr", "BOAK", "COAK")]
  names(typo)[[2]] <- "BOAKK"
  zoa1 <- read_fixture(typo, "lasazoa1.SAV", standardize = FALSE)
  expect_named(zoa1, c("respnr", "boakk", "coak"))
  long <- transform_lasa_data(zoa1)
  expect_named(long, c("respnr", "Wave", "Time", "oak"))
  expect_equal(long$Wave, rep(c("B", "C"), 3), ignore_attr = TRUE)
  expect_equal(as.character(long$oak[long$Wave == "B"]), as.character(zoa1$boakk))
  expect_identical(columns_of(transform_lasa_data(long, format = "wide")), columns_of(zoa1))

  names(typo)[[2]] <- "BOAK_X"
  zoa1 <- read_fixture(typo, "lasazoa1.SAV", standardize = FALSE, name_corrections = c(boak = "boak_x"))
  long <- transform_lasa_data(zoa1)
  expect_named(long, c("respnr", "Wave", "Time", "oak"))
  expect_equal(as.character(long$oak[long$Wave == "B"]), as.character(zoa1$boak_x))
})

test_that("LASA's irregular wave-specific names are recognized and restored", {
  z008 <- data.frame(
    respnr = 1:2,
    t1_dat = as.Date(c("1992-05-01", NA)),
    t2_dat = as.Date(c("1993-01-10", "1993-02-11")),
    t2m_dat = as.Date(c("1993-03-01", "1993-03-05"))
  )
  long <- transform_lasa_data(z008)
  expect_named(long, c("respnr", "Wave", "Time", "t_dat", "tm_dat"))
  expect_equal(long$Wave, c("A", "B", "B"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(0L, 1L, 1L))
  expect_s3_class(long$t_dat, "Date")
  expect_equal(long$t_dat, as.Date(c("1992-05-01", "1993-01-10", "1993-02-11")), ignore_attr = TRUE)
  expect_identical(columns_of(transform_lasa_data(long, format = "wide")), columns_of(z008))

  # b_DM is documented for the baselines of all three cohorts (zdc1/2/3):
  # with nothing to say which, it is placed at wave B, with a message; with
  # provenance, at its file's wave.
  dm <- data.frame(respnr = 1:2, b_dm = c(0, 1))
  expect_message(long <- transform_lasa_data(dm), "placed at the wave shown: b_dm \\(B\\)")
  expect_equal(long$Wave, c("B", "B"), ignore_attr = TRUE)
  attr(dm, "LASA_file_code") <- "zdc2"
  expect_silent(long <- transform_lasa_data(dm))
  expect_named(long, c("respnr", "Wave", "Time", "dm"))
  expect_equal(long$Wave, c("2B", "2B"), ignore_attr = TRUE)
  expect_identical(columns_of(transform_lasa_data(long, format = "wide")), columns_of(dm))
})

test_that("columns the label database doesn't know are handled by their values", {
  long <- data.frame(
    respnr = c(1, 1, 2),
    Wave = c("B", "C", "B"),
    lphya01 = c(1, 2, 3),
    score = c(5, 6, 7),
    group = c("a", "a", "b")
  )
  out <- transform_lasa_data(long)
  expect_named(out, c("respnr", "Wave", "Time", "lphya01", "score", "group"))
  expect_identical(columns_of(out[c("respnr", "lphya01", "score", "group")]), columns_of(long[c("respnr", "lphya01", "score", "group")]))

  wide <- transform_lasa_data(long, format = "wide")
  # "group" has one value per respondent, so it stays one column; "score"
  # differs between waves, so it is spread like documented variables.
  expect_named(wide, c("respnr", "group", "blphya01", "bscore", "clphya01", "cscore"))
  expect_equal(wide$cscore, c(6, NA), ignore_attr = TRUE)
  # Names the label database doesn't document carry where they came from.
  expect_equal(attr(wide$bscore, "LASA_wave"), "B")
  expect_equal(attr(wide$bscore, "LASA_long_name"), "score")
  expect_null(attr(wide$clphya01, "LASA_wave"))

  back <- transform_lasa_data(wide)
  expect_named(back, c("respnr", "Wave", "Time", "group", "lphya01", "score"))
  expect_equal(back$Wave, c("B", "C", "B"), ignore_attr = TRUE)
  expect_equal(back$score, c(5, 6, 7), ignore_attr = TRUE)
})

test_that("factor levels are combined and incompatible types fall back to text", {
  wide <- data.frame(
    respnr = 1:2,
    boak = factor(c("no", "yes")),
    coak = factor(c("possible", "no"), levels = c("no", "possible"))
  )
  long <- transform_lasa_data(wide)
  expect_s3_class(long$oak, "factor")
  expect_equal(levels(long$oak), c("no", "yes", "possible"))
  expect_equal(as.character(long$oak), c("no", "possible", "yes", "no"))
  expect_identical(columns_of(transform_lasa_data(long, format = "wide")), columns_of(wide))

  wide$coak <- c(1, 2)
  expect_warning(long <- transform_lasa_data(wide), "types that don't combine")
  expect_type(long$oak, "character")
  expect_equal(long$oak, c("no", "1", "yes", "2"), ignore_attr = TRUE)
})

test_that("wide columns of different types at different waves convert back exactly", {
  round_trip <- function(wide) transform_lasa_data(transform_lasa_data(wide), format = "wide")

  # Plain numbers at one wave, labelled numbers at another.
  wide <- data.frame(respnr = 1:2, boak = c(0, 1))
  wide$coak <- haven::labelled(c(1, 2), c(no = 0, possible = 1, yes = 2))
  expect_s3_class(transform_lasa_data(wide)$oak, "haven_labelled")
  expect_identical(columns_of(round_trip(wide)), columns_of(wide))

  # Labelled whole numbers and labelled decimals.
  wide$boak <- haven::labelled(c(0L, 1L), c(no = 0L, yes = 1L))
  expect_identical(columns_of(round_trip(wide)), columns_of(wide))

  # TRUE/FALSE next to numbers.
  wide <- data.frame(respnr = 1:2, boak = c(TRUE, FALSE), coak = c(1, 2))
  expect_identical(columns_of(round_trip(wide)), columns_of(wide))

  # Time spans in different units get the first wave's unit.
  wide <- data.frame(respnr = 1:2)
  wide$boak <- as.difftime(c(1, 2), units = "hours")
  wide$coak <- as.difftime(c(30, 90), units = "mins")
  long <- transform_lasa_data(wide)
  expect_s3_class(long$oak, "difftime")
  expect_equal(as.numeric(long$oak, units = "mins"), c(60, 30, 120, 90))
  expect_identical(columns_of(round_trip(wide)), columns_of(wide))

  # Types that only combine as text; value labels don't apply to text.
  wide <- data.frame(respnr = 1:2, boak = factor(c("no", "yes")))
  wide$coak <- haven::labelled(c(1, 2), c(no = 0, possible = 1, yes = 2))
  wide$doak <- as.Date(c("2020-01-01", NA))
  expect_warning(long <- transform_lasa_data(wide), "types that don't combine")
  expect_equal(long$oak, c("no", "1", "2020-01-01", "yes", "2"), ignore_attr = TRUE)
  expect_null(attr(long$oak, "labels"))
  expect_identical(columns_of(suppressWarnings(round_trip(wide))), columns_of(wide))
})

test_that("a code labelled differently at different waves loses its value labels in long format", {
  wide <- data.frame(respnr = 1:2)
  wide$boak <- haven::labelled(c(0, 1), c(no = 0, yes = 1))
  wide$coak <- haven::labelled(c(1, 0), c(yes = 0, no = 1))
  long <- transform_lasa_data(wide)
  expect_s3_class(long$oak, "haven_labelled")
  expect_null(attr(long$oak, "labels"))
  expect_identical(columns_of(transform_lasa_data(long, format = "wide")), columns_of(wide))

  # ... or gets the harmonized ones, if there are.
  attr(wide$boak, "labels_harmonized") <- c(`answer 0` = 0, `answer 1` = 1)
  expect_equal(attr(transform_lasa_data(wide)$oak, "labels"), c(`answer 0` = 0, `answer 1` = 1))
})

test_that("value labels that disagree between waves are not merged into a wrong set", {
  expect_equal(
    .lasa_union_value_labels(list(c(no = 0, yes = 1), c(no = 0, yes = 1, unknown = 9))),
    c(no = 0, yes = 1, unknown = 9)
  )
  expect_null(.lasa_union_value_labels(list(c(no = 0), c(yes = 0))))
  expect_equal(
    .lasa_union_value_labels(list(c(no = 0), c(yes = 0)), harmonized = c(answer = 0)),
    c(answer = 0)
  )
})

test_that("filtering long data to some waves keeps the wide result to those waves", {
  zoa1 <- read_fixture(oa_fixture(), "lasazoa1.SAV")
  long <- transform_lasa_data(zoa1)
  wide <- transform_lasa_data(long[long$Wave == "B", ], format = "wide")
  expect_named(wide, c("respnr", "boak", "boah"))
  expect_equal(attr(wide, "LASA_wave"), "B")
})

test_that("the respondent identifier keeps its name and type", {
  wide <- data.frame(RESPNR = c("a1", "a2"), boak = c(0, 2), coak = c(1, 8))
  long <- transform_lasa_data(wide)
  expect_named(long, c("RESPNR", "Wave", "Time", "oak"))
  expect_equal(long$RESPNR, c("a1", "a1", "a2", "a2"))
})

test_that("long data without wide columns keep their row order", {
  long <- data.frame(respnr = c(2, 1, 2, 1), Wave = c("C", "C", "B", "B"), lphya01 = 1:4)
  out <- transform_lasa_data(long)
  expect_equal(out$respnr, long$respnr)
  expect_equal(out$Wave, long$Wave, ignore_attr = TRUE)
  expect_identical(as.vector(out$Time), c(2L, 2L, 1L, 1L))
  expect_equal(out$lphya01, 1:4, ignore_attr = TRUE)
})

test_that("waves 4B and L have no Time number yet", {
  long <- data.frame(respnr = c(1, 1), Wave = c("4B", "L"), lphya01 = c(1, 2))
  out <- transform_lasa_data(long)
  expect_identical(as.vector(out$Time), c(NA_integer_, NA_integer_))
  expect_named(transform_lasa_data(long, format = "wide"), c("respnr", "b4lphya01", "llphya01"))
})

test_that("a Time column in long data must match its waves", {
  long <- data.frame(respnr = c(1, 1), Wave = c("B", "C"), Time = c(1, 2), lphya01 = c(1, 2))
  out <- transform_lasa_data(long)
  expect_named(out, c("respnr", "Wave", "Time", "lphya01"))
  expect_identical(as.vector(out$Time), c(1L, 2L))

  long$Time <- c(1, 3)
  expect_error(
    transform_lasa_data(long),
    "'Time' column that doesn't match its waves \\(e.g. 3 at wave C, which has Time 2\\)"
  )

  # The copies merge() makes of matching Time columns are replaced too.
  long$Time <- NULL
  long$Time.x <- c(1, 2)
  long$Time.y <- c(NA, 2)
  expect_named(transform_lasa_data(long), c("respnr", "Wave", "Time", "lphya01"))
  long$Time.y <- c(5, 2)
  expect_error(transform_lasa_data(long), "'Time.y' column that doesn't match its waves")
})

test_that("the wave column may be capitalized any way, but not be split by a merge", {
  long <- data.frame(respnr = c(1, 1), wave = c("b", "c"), lphya01 = c(1, 2))
  out <- transform_lasa_data(long)
  expect_named(out, c("respnr", "Wave", "Time", "lphya01"))
  expect_equal(out$Wave, c("B", "C"), ignore_attr = TRUE)

  # Two long data sets merged by respnr alone.
  merged <- merge(
    data.frame(respnr = 1:2, Wave = "B", lphya01 = 1:2),
    data.frame(respnr = 1:2, Wave = "C", adl1a = 1:2),
    by = "respnr"
  )
  expect_error(transform_lasa_data(merged), "Wave.x, Wave.y instead of one 'Wave' column")

  # Z files read with read_lasa_sav() and merged by respnr only have the
  # placeholder "Z" in both copies.
  merged <- merge(
    read_fixture(z004_fixture(), "LASAZ004.SAV"),
    read_fixture(oa_fixture(), "lasazoa1.SAV"),
    by = "respnr"
  )
  expect_true(all(c("Wave.x", "Wave.y") %in% names(merged)))
  long <- transform_lasa_data(merged)
  expect_named(long, c("respnr", "Wave", "Time", "sex", "byear", "oak", "oah"))
  expect_equal(long$Wave, rep(c("B", "C", "D"), 3), ignore_attr = TRUE)
})

test_that("columns that look wave-specific but can't be placed are kept, with a warning", {
  # merge() suffixed the same column of two files.
  wide <- data.frame(respnr = 1:2, boak.x = c(1, 2), boak.y = c(1, 3), coak = c(0, 1))
  expect_warning(
    long <- transform_lasa_data(wide),
    "boak.x, boak.y look like wave-specific LASA variables renamed by a merge"
  )
  expect_named(long, c("respnr", "Wave", "Time", "boak.x", "boak.y", "oak"))

  # A wave file read with standardize = TRUE lost the wave from its names.
  wide <- data.frame(respnr = 1:2, boak = c(0, 1), lphya01 = c(1, 2))
  attr(wide$lphya01, "canonical_name") <- "lphya01"
  expect_warning(long <- transform_lasa_data(wide), "lphya01 hold LASA variables measured at several waves")
  expect_equal(long$lphya01, c(1, 2), ignore_attr = TRUE)
})

test_that("data that can't be reshaped give a clear error", {
  expect_error(
    transform_lasa_data(data.frame(id = 1, boak = 1)),
    "respondent identifier column named 'respnr'"
  )
  expect_error(
    transform_lasa_data(data.frame(respnr = 1, RespNr = 2, boak = 1)),
    "more than one respondent identifier column"
  )
  expect_error(
    transform_lasa_data(data.frame(respnr = c(1, NA), boak = 1:2)),
    "'respnr' has missing values"
  )
  expect_error(
    transform_lasa_data(data.frame(respnr = c(1, 1), boak = 1:2)),
    "one row per respondent"
  )
  expect_error(
    transform_lasa_data(data.frame(respnr = c(1, 1), Wave = "B", oak = 1:2)),
    "one row per respondent per wave"
  )
  expect_error(
    transform_lasa_data(data.frame(respnr = 1, Wave = "X", oak = 1)),
    "Unknown LASA wave code\\(s\\) in the 'Wave' column: X"
  )
  expect_error(
    transform_lasa_data(data.frame(respnr = 1, Wave = NA, oak = 1)),
    "'Wave' column has missing values"
  )
  expect_error(
    transform_lasa_data(data.frame(respnr = 1:2, Wave = c("B", "Z"), oak = 1:2)),
    "mixes \"Z\""
  )
  expect_error(
    transform_lasa_data(data.frame(respnr = 1, Time = 1, boak = 1)),
    "already has a 'Time' column"
  )
  expect_error(
    transform_lasa_data(data.frame(respnr = 1, oak = 1, boak = 1)),
    "both a column named oak and wave-specific columns"
  )
  expect_error(
    transform_lasa_data(data.frame(respnr = 1, boak = 1, BOAK = 2)),
    "Several columns hold the same variable for the same wave: oak at wave B \\(boak, BOAK\\)"
  )
  with_list <- data.frame(respnr = 1:2)
  with_list$values <- list(1, 2)
  expect_error(transform_lasa_data(with_list), "plain vector columns only")
  expect_error(
    transform_lasa_data(data.frame(respnr = 1, Wave = "4B", lphya01 = 1), format = "wide", prefix = "Time"),
    "Wave 4B has no Time number yet"
  )
})
