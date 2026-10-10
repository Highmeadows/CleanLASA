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
  # without provenance it is read as wave B, with it as its file's wave.
  dm <- data.frame(respnr = 1:2, b_dm = c(0, 1))
  expect_equal(transform_lasa_data(dm)$Wave, c("B", "B"), ignore_attr = TRUE)
  attr(dm, "LASA_file_code") <- "zdc2"
  long <- transform_lasa_data(dm)
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
  expect_null(attr(wide$blphya01, "LASA_wave"))

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
