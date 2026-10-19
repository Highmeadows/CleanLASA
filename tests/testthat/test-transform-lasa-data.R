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

## Columns without the attributes that tell transform_lasa_data() which wave
## and variable a wide column holds when its name alone doesn't.
without_tags <- function(data) {
  for (name in names(data)) {
    for (tag in c("LASA_wave", "LASA_long_name", "LASA_wide_name")) attr(data[[name]], tag) <- NULL
  }
  data
}

## `data` without its data-level provenance attributes, as a merge leaves it.
without_provenance <- function(data) {
  for (name in c("LASA_file_code", "LASA_wave", "LASA_source_file", "label_report")) attr(data, name) <- NULL
  data
}

test_that("wide data become one row per respondent per wave, with Wave and Time", {
  wide <- data.frame(respnr = c(101, 102), sex = c(1, 2), boak = c(0, 2), coak = c(1, 8))
  long <- transform_lasa_data(wide)

  expect_s3_class(long, "data.frame")
  expect_named(long, c("respnr", "Wave", "Time", "sex", "oak"))
  expect_equal(long$respnr, c(101, 101, 102, 102))
  expect_equal(long$Wave, c("B", "C", "B", "C"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(0L, 1L, 0L, 1L))
  # The stable column is repeated on each of the respondent's rows.
  expect_equal(long$sex, c(1, 1, 2, 2))
  expect_equal(long$oak, c(0, 1, 2, 8), ignore_attr = TRUE)
  expect_equal(attr(long$Wave, "label"), "LASA measurement wave")
  expect_equal(attr(long$Time, "label"), "LASA waves since the respondent's baseline (baseline = 0)")
})

test_that("Time counts the waves since each respondent's baseline, which is 0", {
  # A respondent of each cohort at every wave it takes part in -- the first
  # cohort's also at wave A, the LSN pilot study, which has no Time -- in
  # reverse order, which long data keep.
  cohorts <- list(
    c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"),
    c("2B", "F", "G", "H", "I", "J", "K", "L"),
    c("3B", "I", "J", "K", "L"),
    c("MB", "I", "J", "K", "L"),
    c("4B", "L")
  )
  long <- data.frame(
    respnr = rep(seq_along(cohorts), lengths(cohorts)),
    Wave = tolower(unlist(cohorts))
  )
  long$score <- seq_len(nrow(long))
  long <- long[rev(seq_len(nrow(long))), ]
  expect_silent(out <- transform_lasa_data(long))

  expect_named(out, c("respnr", "Wave", "Time", "score"))
  expect_equal(out$Wave, toupper(long$Wave), ignore_attr = TRUE)
  expect_identical(as.vector(out$Time), rev(c(NA, 0:10, 0:7, 0:4, 0:4, 0:1)))
  expect_equal(out$score, long$score)
})

test_that("rows get no Time when the data don't show the respondent's cohort", {
  # Waves F onwards are shared by several cohorts, with a different Time in
  # each; wave A says nothing about the cohort.
  long <- data.frame(respnr = c(1, 1, 2, 3), Wave = c("A", "F", "G", "A"), score = 1:4)
  expect_message(out <- transform_lasa_data(long), "cohort of 2 respondent\\(s\\) \\(e.g. respondent 1 at wave F\\)")
  expect_identical(as.vector(out$Time), rep(NA_integer_, 4))

  # Waves only different cohorts take part in: a warning.
  long <- data.frame(respnr = c(1, 1, 2), Wave = c("C", "2B", "C"), score = 1:3)
  expect_warning(out <- transform_lasa_data(long), "1 respondent\\(s\\) at waves of different cohorts")
  expect_identical(as.vector(out$Time), c(NA, NA, 1L))
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
  # Respondent 103 keeps rows without any value, which don't show a cohort.
  expect_message(long <- transform_lasa_data(wide), "the cohort of 1 respondent\\(s\\) \\(e.g. respondent 103 at wave B\\)")
  back <- transform_lasa_data(long, format = "wide")
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

test_that("prefix = \"Time\" names wide columns t<Time>_<variable>, with a cohort column, and they convert back", {
  wide <- data.frame(respnr = c(101, 102), sex = c(1, 2), boak = c(0, 2), coak = c(1, 8))
  long <- transform_lasa_data(wide)

  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_named(time_wide, c("respnr", "cohort", "sex", "t0_oak", "t1_oak"))
  # The cohort column is LASA's cohort variable, as read_lasa_sav() reads
  # LASAZ002.SAV's.
  expect_identical(as.character(time_wide$cohort), c("cohort 1 (1992)", "cohort 1 (1992)"))
  expect_identical(levels(time_wide$cohort), c("cohort 1 (1992)", "cohort 2 (2002)", "cohort 3 (2012)"))
  expect_equal(attr(time_wide$cohort, "label"), "cohort sample")
  expect_equal(time_wide$t1_oak, c(1, 8), ignore_attr = TRUE)

  # Back in long format, the cohort column stays, as a column that holds
  # for every wave ...
  long_again <- transform_lasa_data(time_wide)
  expect_named(long_again, c("respnr", "Wave", "Time", "cohort", "sex", "oak"))
  expect_identical(columns_of(without_store(long_again))[names(long)], columns_of(without_store(long)))
  expect_identical(as.character(long_again$cohort), as.character(time_wide$cohort)[c(1, 1, 2, 2)])
  expect_identical(attributes(long_again$cohort), attributes(time_wide$cohort))
  # ... so Time-prefixed wide format gives the same columns again ...
  expect_identical(
    columns_of(transform_lasa_data(long_again, format = "wide", prefix = "Time")),
    columns_of(time_wide)
  )
  # ... and wave prefixes the original ones, with the cohort column.
  back <- transform_lasa_data(long_again, format = "wide")
  expect_named(back, c("respnr", "cohort", "sex", "boak", "coak"))
  expect_identical(columns_of(back)[names(wide)], columns_of(wide))
})

test_that("Time-prefixed columns of several cohorts are shared, and each respondent's go back to their own waves", {
  long <- data.frame(
    respnr = c(1, 1, 1, 2, 2, 3, 3, 4, 4),
    Wave = c("B", "C", "F", "2B", "F", "3B", "I", "MB", "I"),
    lphya01 = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
  )
  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_named(time_wide, c("respnr", "cohort", "t0_lphya01", "t1_lphya01", "t4_lphya01"))
  # The migrant cohort, which LASAZ002.SAV doesn't have, gets a level of its
  # own, after the fourth cohort's, so that its code is always 5.
  expect_identical(
    as.character(time_wide$cohort), c("cohort 1 (1992)", "cohort 2 (2002)", "cohort 3 (2012)", "migrant cohort")
  )
  expect_identical(
    levels(time_wide$cohort), c("cohort 1 (1992)", "cohort 2 (2002)", "cohort 3 (2012)", "4", "migrant cohort")
  )
  expect_equal(time_wide$t0_lphya01, c(1, 4, 6, 8), ignore_attr = TRUE)
  expect_equal(time_wide$t1_lphya01, c(2, 5, 7, 9), ignore_attr = TRUE)
  expect_equal(time_wide$t4_lphya01, c(3, NA, NA, NA), ignore_attr = TRUE)

  back <- transform_lasa_data(time_wide)
  expect_equal(back$Wave, long$Wave, ignore_attr = TRUE)
  expect_identical(as.vector(back$Time), c(0L, 1L, 4L, 0L, 1L, 0L, 1L, 0L, 1L))
  expect_equal(back$lphya01, long$lphya01, ignore_attr = TRUE)

  # Without the cohort column, the waves of Time-prefixed columns are
  # unknown: they are kept as they are, with a warning (and no second
  # message saying 'data' has no wave-specific columns).
  time_wide$cohort <- NULL
  expect_warning(
    out <- transform_lasa_data(time_wide),
    "t0_lphya01, t1_lphya01, t4_lphya01 look like the Time-prefixed columns"
  )
  expect_named(out, names(time_wide))

  # A value at a Time its respondent's cohort doesn't have is an error.
  time_wide <- data.frame(respnr = 1, cohort = "cohort 4", t2_lphya01 = 1)
  expect_error(
    transform_lasa_data(time_wide),
    "respondent 1, whose cohort \\('cohort 4' in the 'cohort' column\\) has no wave with Time 2"
  )
})

test_that("a Z file read with read_lasa_sav() becomes long, with labels per wave", {
  zoa1 <- read_fixture(oa_fixture(), "lasazoa1.SAV")
  long <- transform_lasa_data(zoa1)

  expect_s3_class(long, "tbl_df")
  expect_named(long, c("respnr", "Wave", "Time", "oak", "oah"))
  # read_lasa_sav() turned the missing-value code -9 into NA, so respondent
  # 2 has nothing at wave C, and respondent 3 nothing at D: no rows there.
  expect_equal(long$respnr, c(1, 1, 1, 2, 2, 3, 3), ignore_attr = TRUE)
  expect_equal(long$Wave, c("B", "C", "D", "B", "D", "B", "C"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(0:2, 0L, 2L, 0:1))

  expect_s3_class(long$oak, "factor")
  expect_equal(levels(long$oak), levels(zoa1$boak))
  expect_equal(
    as.character(long$oak),
    c(
      "no", "dropout", "dropout at previous waves",
      "no", "no",
      "yes", "no"
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
  # Kept with keep_user_na = TRUE, the missing-value codes LASA documents
  # are declared user-missing (-9 here; "dropout", 8 and 9, are answers,
  # whatever the file declares).
  spss <- oa_fixture(function(x, labels) haven::labelled_spss(x, labels, na_values = c(-9, 8, 9)))
  wide <- read_fixture(spss, "lasazoa1.SAV", to_factor = FALSE, keep_user_na = TRUE)
  expect_s3_class(wide$doak, "haven_labelled_spss")

  long <- transform_lasa_data(wide)
  expect_s3_class(long$oak, "haven_labelled_spss")
  expect_equal(nrow(long), 9L)
  expect_equal(as.vector(unclass(long$oak)), c(0, 8, 9, 0, -9, 0, 2, 0, -9), ignore_attr = TRUE)
  expect_equal(attr(long$oak, "na_values"), -9)
  # They are no evidence of taking part, but the waves of the first cohort
  # only show it anyway.
  expect_identical(as.vector(long$Time), rep(0:2, 3))

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
  # Respondents 2 and 3 have nothing but a missing-value code (now NA) at
  # one wave, so they have rows of two waves.
  expect_equal(nrow(long), 7L)
  expect_equal(as.character(long$sex), rep(c("male", "female", "male"), c(3, 2, 2)))
  expect_equal(long$byear, rep(c(1920, 1925, 1930), c(3, 2, 2)), ignore_attr = TRUE)
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
  # rbind() dropped the factors' labels; they come back from the label
  # database, each wave's own.
  expect_null(attr(long$lphya01, "label"))
  expect_equal(attr(wide$clphya01, "label"), "Physical condition respondent: observation")
  expect_equal(attr(wide$cadl1b, "wave_label"), "Stairs: using aid (C/D/EADL1A > 1)")
  expect_equal(attr(wide$badl1b, "wave_label"), "Stairs: using aid (BADL1A > 1)")

  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_named(time_wide, c(
    "respnr", "cohort", "t0_lphya01", "t0_lphya07", "t0_adl1a", "t0_adl1b",
    "t1_lphya01", "t1_lphya07", "t1_adl1a", "t1_adl1b"
  ))
  expect_identical(as.character(time_wide$cohort), rep("cohort 1 (1992)", 3))

  for (back in list(transform_lasa_data(wide), transform_lasa_data(time_wide))) {
    expect_equal(
      setdiff(names(back), "cohort"),
      c("respnr", "Wave", "Time", "lphya01", "lphya07", "adl1a", "adl1b")
    )
    expect_equal(back$respnr, rep(1:3, each = 2), ignore_attr = TRUE)
    expect_equal(back$Wave, rep(c("B", "C"), 3), ignore_attr = TRUE)
    expect_identical(as.vector(back$Time), rep(0:1, 3))
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
  # zoa1 adds wave D, which the 046 files don't have -- except for
  # respondent 3, who has nothing there but a missing-value code (now NA).
  expect_equal(long$Wave, c(rep(c("B", "C", "D"), 2), "B", "C"), ignore_attr = TRUE)
  expect_true(all(is.na(long$lphya01[long$Wave == "D"])))
  expect_equal(as.character(long$lphya01[long$Wave == "C"]), as.character(long_046$lphya01[long_046$Wave == "C"]))
  # A documented stable variable is filled in on the added rows.
  expect_equal(as.character(long$sex), rep(c("male", "female", "male"), c(3, 3, 2)))
  expect_equal(long$byear, rep(c(1920, 1925, 1930), c(3, 3, 2)), ignore_attr = TRUE)
  expect_equal(
    as.character(long$oak[long$Wave == "D"]),
    c("dropout at previous waves", "no")
  )

  wide <- transform_lasa_data(mixed, format = "wide")
  expect_true(all(c("boak", "coak", "doak", "blphya01", "clphya01", "sex", "byear") %in% names(wide)))
  expect_false(any(c("dlphya01", "Wave", "Time") %in% names(wide)))
})

test_that("respondents a merge with all = TRUE adds to long data get the rows their wide values need", {
  # 22001 dropped out after wave C, so the wave-F file lacks them; 23001 has
  # no value in the Z file either.
  lab <- c("never married" = 1, married = 2, "sample attrition" = -6)
  z <- data.frame(
    RespNr = c(21001, 22001, 41001, 23001),
    BMARST = haven::labelled(c(1, 2, NA, NA), lab), CMARST = haven::labelled(c(1, 2, NA, NA), lab),
    FMARST = haven::labelled(c(1, -6, 2, NA), lab)
  )
  f046 <- read_fixture(data.frame(RespNr = c(21001, 41001), FLPHYA09 = c(30, 31)), "LASAF046.SAV", format_as_long = TRUE)
  z_wide <- read_fixture(z, "LASAZ010.SAV", standardize = FALSE)
  merged <- merge(f046, z_wide, by = "respnr", all = TRUE)
  expect_identical(as.vector(merged$Wave), c("F", NA, NA, "F"))
  out <- transform_lasa_data(merged)
  # As with the Z file in long format, merged by respnr and Wave; 23001
  # keeps a row at every wave of the Z file's columns.
  z_long <- read_fixture(z, "LASAZ010.SAV", format_as_long = TRUE)
  expected <- transform_lasa_data(merge(f046, z_long, by = c("respnr", "Wave"), all = TRUE))
  expect_identical(
    paste(out$respnr, out$Wave, out$Time),
    c("21001 B 0", "21001 C 1", "21001 F 4", "22001 B 0", "22001 C 1", "23001 B 0", "23001 C 1", "23001 F 4", "41001 F 1")
  )
  expect_identical(paste(out$respnr, out$Wave, out$Time), paste(expected$respnr, expected$Wave, expected$Time))
  expect_identical(as.character(out$marst), as.character(expected$marst))
  expect_identical(as.vector(out$lphya09), as.vector(expected$lphya09))
  wide <- transform_lasa_data(merged, format = "wide")
  expect_identical(as.vector(wide$respnr), c(21001, 22001, 23001, 41001))
  expect_identical(as.character(wide$cmarst), c("never married", "married", NA, NA))
  skip_if_not_installed("dplyr")
  joined <- transform_lasa_data(dplyr::full_join(f046, z_wide, by = "respnr"))
  expect_identical(sort(paste(joined$respnr, joined$Wave, joined$Time)), sort(paste(out$respnr, out$Wave, out$Time)))

  # Stable variables fill the respondent's rows; with no wide columns,
  # those respondents have none.
  expect_message(
    z004 <- read_fixture(data.frame(RespNr = c(21001, 22001, 41001), SEX = c(1, 2, 1)), "LASAZ004.SAV", format_as_long = TRUE),
    "no wave dimension"
  )
  with_sex <- transform_lasa_data(merge(merge(f046, z004, by = "respnr", all = TRUE), z_wide, by = "respnr", all = TRUE))
  expect_identical(as.character(with_sex$sex[with_sex$respnr == 22001]), c("female", "female"))
  expect_message(
    out <- transform_lasa_data(merge(f046, z004, by = "respnr", all = TRUE)),
    "1 respondent\\(s\\) \\(e.g. respondent 22001\\) are only on rows without a wave"
  )
  expect_identical(paste(out$respnr, out$Wave, as.character(out$sex)), c("21001 F male", "41001 F male"))
  # A value of a column of the long data on such a row needs a wave.
  merged$lphya09[merged$respnr == 22001] <- 25
  expect_error(
    transform_lasa_data(merged),
    "'Wave' column has missing values, on rows holding values that need a wave \\(e.g. 'lphya09' for respondent 22001\\)"
  )
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
  expect_identical(as.vector(back$Time), rep(0L, 6))

  # A 2B wave file read without standardizing still names its columns
  # "b...": its provenance says which wave they belong to.
  wave_2b_raw <- read_fixture(wave_fixture("046", "B"), "LAS2B046.SAV", standardize = FALSE)
  long <- transform_lasa_data(wave_2b_raw)
  expect_equal(unique(long$Wave), "2B", ignore_attr = TRUE)
  expect_identical(unique(as.vector(long$Time)), 0L)
  expect_equal(attr(long, "LASA_wave"), "2B")

  # LASA's own cohort Z files use b2/b3 prefixes.
  zoa2 <- data.frame(respnr = 1:2, b2oak = c(0, 1), foak = c(1, 2))
  long <- transform_lasa_data(zoa2)
  expect_equal(long$Wave, c("2B", "F", "2B", "F"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(0L, 1L, 0L, 1L))
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

test_that("a baseline column of wide data reads back at its wave also without the other columns", {
  read_long <- function(prefix, filename, ids) {
    suppressMessages(read_fixture(wave_fixture("046", prefix, ids = ids), filename, format_as_long = TRUE))
  }
  long <- transform_lasa_data(rbind(
    read_long("B", "LASAB046.SAV", 1:3), read_long("C", "LASAC046.SAV", 1:3), read_long("B", "LAS2B046.SAV", 4:6)
  ))
  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c("respnr", "blphya01", "blphya07", "clphya01", "clphya07", "b2lphya01", "b2lphya07"))
  # Wave C's columns show respondents 1 to 3 are of the first cohort, but
  # "blphya01", every cohort's baseline name, says its wave itself.
  expect_equal(attr(wide$blphya01, "LASA_wave"), "B")
  expect_equal(attr(wide$blphya01, "LASA_long_name"), "lphya01")
  expect_null(attr(wide$clphya01, "LASA_wave"))
  expect_null(attr(wide$b2lphya01, "LASA_wave"))
  expect_silent(back <- transform_lasa_data(wide[c("respnr", "blphya01", "b2lphya01")]))
  expect_equal(paste(back$respnr, back$Wave, back$Time), c("1 B 0", "2 B 0", "3 B 0", "4 2B 0", "5 2B 0", "6 2B 0"))
  expect_equal(as.character(back$lphya01), as.character(long$lphya01[long$Wave != "C"]))

  # In a result with wave 4B, whose files use the baselines' "b" names, so
  # does a name of a single baseline (bcva02, wave B).
  read_035 <- function(filename, ids, values) {
    suppressMessages(read_fixture(data.frame(RespNr = ids, BCVA02 = values), filename, format_as_long = TRUE))
  }
  long <- suppressMessages(transform_lasa_data(merge(
    rbind(read_035("LASAB035.SAV", 1:2, c(60, 70)), read_035("LAS4B035.SAV", c(401, 402), c(55, 65))),
    read_long("C", "LASAC046.SAV", 1:2),
    by = c("respnr", "Wave"), all = TRUE
  )))
  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c("respnr", "bcva02", "clphya01", "clphya07", "b4cva02"))
  expect_equal(attr(wide$bcva02, "LASA_wave"), "B")
  expect_null(attr(wide$b4cva02, "LASA_wave"))
  expect_silent(back <- transform_lasa_data(wide[c("respnr", "bcva02", "b4cva02")]))
  expect_equal(paste(back$respnr, back$Wave, back$Time, back$cva02), c("1 B 0 60", "2 B 0 70", "401 4B 0 55", "402 4B 0 65"))
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
  expect_message(
    expect_message(long <- transform_lasa_data(wide), "placed at the wave shown: b_dm \\(B\\)"),
    "the cohort of 1 respondent\\(s\\) \\(e.g. respondent 3 at wave B\\)"
  )
  expect_equal(long$respnr, c(1, 1, 2, 3))
  expect_equal(long$Wave, c("B", "C", "2B", "B"), ignore_attr = TRUE)
  # A guessed wave doesn't show the respondent's cohort.
  expect_identical(as.vector(long$Time), c(0L, 1L, 0L, NA))
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

  # Without such evidence, the file's wave doesn't say where a column the
  # file doesn't have belongs: it is only the best guess, with a message.
  # Nor are rows holding nothing else that file's rows, which show the
  # cohort.
  only_dm <- with_provenance(data.frame(respnr = 1:2, b_dm = c(0, 1)), report)
  expect_message(
    expect_message(long <- transform_lasa_data(only_dm), "placed at the wave shown: b_dm \\(2B\\)"),
    "the cohort of 2 respondent"
  )
  expect_equal(long$Wave, c("2B", "2B"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(NA_integer_, NA_integer_))

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

  # As read from a wave I file without standardizing: wave I's mmse02. Only
  # documented variables show which waves a respondent took part in, and
  # wave I doesn't say which cohort they are of.
  attr(long$immse02, "canonical_name") <- "mmse02"
  expect_message(out <- transform_lasa_data(long), "shows the cohort of 2 respondent")
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
  expect_equal(long$Wave, c("B", "C", "B", "B", "C"), ignore_attr = TRUE)
  expect_equal(as.character(long$oak[long$Wave == "B"]), as.character(zoa1$boakk))
  # Back in wide format, the column gets the documented name read_lasa_sav()
  # matched it to: without the data's label report, which a merge drops,
  # boakk wouldn't say what it holds.
  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c("respnr", "boak", "coak"))
  expect_identical(unname(columns_of(wide)), unname(columns_of(zoa1)))
  expect_identical(
    columns_of(without_store(transform_lasa_data(without_provenance(wide)))),
    columns_of(without_store(long))
  )

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
  # Wave A, the LSN pilot study, isn't part of any cohort's waves.
  expect_identical(as.vector(long$Time), c(NA, 0L, 0L))
  expect_s3_class(long$t_dat, "Date")
  expect_equal(long$t_dat, as.Date(c("1992-05-01", "1993-01-10", "1993-02-11")), ignore_attr = TRUE)
  expect_identical(columns_of(transform_lasa_data(long, format = "wide")), columns_of(z008))

  # b_DM is documented for the baselines of all three cohorts (zdc1/2/3):
  # with nothing to say which, it is placed at wave B, with a message; with
  # provenance, at its file's wave.
  dm <- data.frame(respnr = 1:2, b_dm = c(0, 1))
  expect_message(
    expect_message(long <- transform_lasa_data(dm), "placed at the wave shown: b_dm \\(B\\)"),
    "the cohort of 2 respondent\\(s\\)"
  )
  expect_equal(long$Wave, c("B", "B"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(NA_integer_, NA_integer_))
  attr(dm, "LASA_file_code") <- "zdc2"
  expect_silent(long <- transform_lasa_data(dm))
  expect_named(long, c("respnr", "Wave", "Time", "dm"))
  expect_equal(long$Wave, c("2B", "2B"), ignore_attr = TRUE)
  # Back in wide format, the column gets wave 2B's own prefix: b_dm, the
  # name of three cohorts' baselines, wouldn't say which one it holds
  # without the data's provenance, which a merge drops.
  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c("respnr", "b2dm"))
  expect_identical(unname(columns_of(wide)), unname(columns_of(dm)))
  expect_silent(back <- transform_lasa_data(without_provenance(wide)))
  expect_equal(back$Wave, c("2B", "2B"), ignore_attr = TRUE)
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
  expect_identical(columns_of(out[c("respnr", "score", "group")]), columns_of(long[c("respnr", "score", "group")]))
  # A variable the label database documents gets the labels read_lasa_sav()
  # gives it at each of its waves.
  expect_equal(out$lphya01, long$lphya01, ignore_attr = TRUE)
  expect_equal(attr(out$lphya01, "label"), "Physical condition respondent: observation")
  expect_named(attr(out$lphya01, "wave_label"), c("B", "C"))

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
  expect_identical(as.vector(out$Time), c(1L, 1L, 0L, 0L))
  expect_equal(out$lphya01, 1:4, ignore_attr = TRUE)
})

test_that("wave 4B is the fourth cohort's baseline, with L its next wave", {
  long <- data.frame(respnr = c(1, 1), Wave = c("4B", "L"), lphya01 = c(1, 2))
  out <- transform_lasa_data(long)
  expect_identical(as.vector(out$Time), c(0L, 1L))
  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c("respnr", "b4lphya01", "llphya01"))
  expect_equal(transform_lasa_data(wide)$Wave, c("4B", "L"), ignore_attr = TRUE)

  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_named(time_wide, c("respnr", "cohort", "t0_lphya01", "t1_lphya01"))
  # The label database doesn't document LASAZ002.SAV's code of the fourth
  # cohort (4) yet: its level is "4", as read_lasa_sav() reads that code.
  expect_identical(as.character(time_wide$cohort), "4")
  expect_identical(levels(time_wide$cohort), c("cohort 1 (1992)", "cohort 2 (2002)", "cohort 3 (2012)", "4"))
  expect_equal(transform_lasa_data(time_wide)$Wave, c("4B", "L"), ignore_attr = TRUE)
})

test_that("a Time column in long data must match its waves, and tells the cohort", {
  long <- data.frame(respnr = c(1, 1), Wave = c("B", "C"), Time = c(0, 1), lphya01 = c(1, 2))
  out <- transform_lasa_data(long)
  expect_named(out, c("respnr", "Wave", "Time", "lphya01"))
  expect_identical(as.vector(out$Time), c(0L, 1L))

  long$Time <- c(0, 3)
  expect_error(
    transform_lasa_data(long),
    "'Time' column that doesn't match its waves \\(e.g. 3 at wave C, where Time is 1\\)"
  )

  # The copies merge() makes of matching Time columns are replaced too.
  long$Time <- NULL
  long$Time.x <- c(0, 1)
  long$Time.y <- c(NA, 1)
  expect_named(transform_lasa_data(long), c("respnr", "Wave", "Time", "lphya01"))
  long$Time.y <- c(5, 1)
  expect_error(transform_lasa_data(long), "'Time.y' column that doesn't match its waves")

  # At a wave several cohorts share, the Time says which cohort it is.
  long <- data.frame(respnr = c(1, 2), Wave = "F", Time = c(1, 4), lphya01 = c(1, 2))
  expect_silent(out <- transform_lasa_data(long))
  expect_identical(as.vector(out$Time), c(1L, 4L))
  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_identical(as.character(time_wide$cohort), c("cohort 2 (2002)", "cohort 1 (1992)"))
  expect_named(time_wide, c("respnr", "cohort", "t1_lphya01", "t4_lphya01"))

  # ... which must agree with the respondent's other waves.
  long <- data.frame(respnr = c(1, 1), Wave = c("C", "F"), Time = c(1, 1), lphya01 = c(1, 2))
  expect_error(transform_lasa_data(long), "for respondent 1, it contradicts the cohort the rest of the data show")
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
  expect_equal(long$Wave, c("B", "C", "D", "B", "D", "B", "C"), ignore_attr = TRUE)
  expect_named(transform_lasa_data(merged, format = "wide"), c("respnr", "sex", "byear", "boak", "boah", "coak", "coah", "doak", "doah"))

  # A third data set merged by respnr alone keeps its "Wave" column next to
  # the copies of the first two: its waves don't tell theirs either.
  three <- merge(
    merge(
      data.frame(respnr = 1:2, Wave = "B", lphya01 = 1:2),
      data.frame(respnr = 1:2, Wave = "C", adl1a = 1:2),
      by = "respnr"
    ),
    data.frame(respnr = 1:2, Wave = "D", lphya09 = 1:2),
    by = "respnr"
  )
  expect_named(three, c("respnr", "Wave.x", "lphya01", "Wave.y", "adl1a", "Wave", "lphya09"))
  expect_error(transform_lasa_data(three), "Wave, Wave.x, Wave.y instead of one 'Wave' column")

  # Copies that only hold the placeholder are dropped, also next to the
  # "Wave" column of long data merged in after them, or of a third Z file.
  long_data <- data.frame(respnr = c(1, 1, 2), Wave = c("B", "D", "B"), lphya01 = c(5, 6, 7))
  out <- transform_lasa_data(merge(long_data, merged, by = "respnr"))
  without <- transform_lasa_data(merge(long_data, merged[setdiff(names(merged), c("Wave.x", "Wave.y"))], by = "respnr"))
  expect_named(out, names(without))
  expect_equal(paste(out$respnr, out$Wave, out$Time), c("1 B 0", "1 C 1", "1 D 2", "2 B 0", "2 D 2"))
  expect_equal(out, without, ignore_attr = "LASA_wide_columns")
  z_first <- transform_lasa_data(merge(merged, long_data, by = "respnr"))
  expect_equal(as.list(z_first)[names(out)], as.list(out)[names(out)], ignore_attr = "LASA_wide_columns")
  third <- merge(merged, read_fixture(z004_fixture(), "LASAZ004.SAV")[c("respnr", "Wave")], by = "respnr")
  expect_named(transform_lasa_data(third), c("respnr", "Wave", "Time", "sex", "byear", "oak", "oah"))

  # Merged with all = TRUE, the copies have missing values, which come back
  # as blank text once saved to .sav.
  merged <- merge(
    read_fixture(z004_fixture()[1:2, ], "LASAZ004.SAV"),
    read_fixture(oa_fixture()[2:3, ], "lasazoa1.SAV"),
    by = "respnr", all = TRUE
  )
  saved <- haven::read_sav(write_transform_sav(merged, "merged.sav"))
  expect_equal(as.vector(saved$Wave.x), c("Z", "Z", ""))
  expect_equal(as.vector(saved$Wave.y), c("", "Z", "Z"))
  long <- transform_lasa_data(merged)
  # Respondent 1 has no value at any wave: a row at each of the file's.
  expect_equal(paste(long$respnr, long$Wave), c("1 B", "1 C", "1 D", "2 B", "2 D", "3 B", "3 C"))
  back <- transform_lasa_data(saved)
  expect_equal(paste(back$respnr, back$Wave, back$Time), paste(long$respnr, long$Wave, long$Time))
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
  # Also once merge() dropped that attribute (and the file's), as without
  # its "Wave" column merging such a file with a Z file does.
  b <- read_fixture(wave_fixture("046", "B", ids = 1:2), "LASAB046.SAV")
  b$Wave <- NULL
  merged <- merge(b, read_fixture(oa_fixture(), "lasazoa1.SAV", standardize = FALSE), by = "respnr")
  expect_null(attr(merged$lphya01, "canonical_name"))
  expect_warning(long <- transform_lasa_data(merged), "lphya01, lphya07 hold LASA variables measured at several waves")
  expect_equal(paste(long$respnr, long$Wave), c("1 B", "1 C", "1 D", "2 B", "2 D"))
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
    transform_lasa_data(data.frame(respnr = 1:2, Wave = c("B", NA), oak = 1:2)),
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
    transform_lasa_data(data.frame(respnr = 1, Wave = "F", lphya01 = 1), format = "wide", prefix = "Time"),
    "Time-prefixed wide format needs the Time of every value, but 1 respondent\\(s\\) have values at waves without one \\(e.g. respondent 1 at wave F\\)"
  )
  expect_error(
    transform_lasa_data(data.frame(respnr = 1, Cohort = 1920, lphya01 = 1, Wave = "B"), format = "wide", prefix = "Time"),
    "'data' has a column named 'Cohort' that doesn't hold LASA's cohorts"
  )
})

test_that("missing-value codes at waves before a respondent's cohort joined don't count as its waves", {
  # LASAZ010 gives the second cohort "no observation birth cohorts
  # 1938-1947" at waves A-E, which LASA marks as a missing-value code.
  z010_data <- data.frame(
    RespNr = c(2001, 2002), AMARST = -8, BMARST = -8, CMARST = -8, DMARST = -8, EMARST = -8,
    FMARST = c(2, 1)
  )
  # read_lasa_sav() turns the codes into NA unless keep_user_na = TRUE: the
  # respondents then simply have no rows before their cohort joined.
  # b2oak shows the respondents are of the second cohort.
  b2oak <- data.frame(respnr = c(2001, 2002), b2oak = c(0, 1))
  long <- transform_lasa_data(merge(read_fixture(z010_data, "LASAZ010.SAV"), b2oak, by = "respnr"))
  expect_equal(long$Wave, rep(c("2B", "F"), 2), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), rep(0:1, 2))

  z010 <- read_fixture(z010_data, "LASAZ010.SAV", keep_user_na = TRUE)
  expect_true(all(as.character(z010$cmarst) == "no observation birth cohorts 1938-1947"))
  wide <- merge(z010, b2oak, by = "respnr")
  expect_silent(long <- transform_lasa_data(wide))
  expect_equal(long$Wave, rep(c("A", "B", "C", "D", "E", "2B", "F"), 2), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), rep(c(NA, NA, NA, NA, NA, 0L, 1L), 2))
  expect_equal(as.character(long$marst[long$Wave == "F"]), c("married", "never married"))

  # Time-prefixed wide format has no column for the codes at waves without a
  # Time: they are left out, with a message; wave A keeps its own column.
  expect_message(
    time_wide <- transform_lasa_data(wide, format = "wide", prefix = "Time"),
    "8 row\\(s\\) hold nothing but missing-value codes"
  )
  expect_named(time_wide, c("respnr", "cohort", "amarst", "t0_oak", "t1_marst"))
  expect_identical(as.character(time_wide$cohort), c("cohort 2 (2002)", "cohort 2 (2002)"))

  # LASAZDC2 and LASAZ010 transformed to long format and merged by respnr
  # and Wave: b_dm is at the second cohort's baseline, and the Time each
  # file gives (none for wave F in LASAZ010) combine.
  zdc2 <- read_fixture(data.frame(RespNr = c(2001, 2002), B_DM = c(1, 0), F_DM = 1), "LASAZDC2.SAV")
  expect_message(long_010 <- transform_lasa_data(z010), "shows the cohort of 2 respondent")
  merged <- merge(long_010, transform_lasa_data(zdc2), by = c("respnr", "Wave"), all = TRUE)
  expect_silent(long <- transform_lasa_data(merged))
  # Long data keep their row order (merge() sorts "2B" before "A").
  expect_equal(long$Wave, merged$Wave, ignore_attr = TRUE)
  expect_identical(
    as.vector(long$Time),
    unname(c(`2B` = 0L, F = 1L)[as.character(long$Wave)])
  )
  expect_equal(as.character(long$dm[long$Wave == "2B"]), c("definite DM", "no DM"))
})

test_that("negative codes are missing-value codes, documented or not, except measurements that can be negative", {
  # -7 isn't one of oak's documented codes, but every negative LASA code
  # says why a value is missing: it doesn't show wave C (the first
  # cohort's), so b2oak's second cohort is the respondent's.
  expect_silent(out <- transform_lasa_data(data.frame(respnr = 1, coak = -7, b2oak = 1)))
  expect_equal(out$Wave, c("C", "2B"), ignore_attr = TRUE)
  expect_identical(as.vector(out$Time), c(NA, 0L))
  # The same as the factor level read_lasa_sav() gives such a code with
  # keep_user_na = TRUE, its own number.
  long <- data.frame(respnr = 1, Wave = c("C", "2B"), oak = factor(c("-7", "no")))
  expect_identical(as.vector(transform_lasa_data(long)$Time), c(NA, 0L))
  # A column the label database doesn't document keeps its negative values.
  expect_warning(
    transform_lasa_data(data.frame(respnr = 1, Wave = c("C", "2B"), score = c(-7, 1))),
    "at waves of different cohorts"
  )

  # A speech-reception threshold of -6.4 dB is a measurement, at wave E
  # (which only the first cohort takes part in); -22 is a documented code
  # ("test not done").
  expect_message(
    out <- transform_lasa_data(data.frame(respnr = 1:2, emsrttn = c(-6.4, -22))),
    "shows the cohort of 1 respondent\\(s\\) \\(e.g. respondent 2 at wave E\\)"
  )
  expect_identical(as.vector(out$Time), c(3L, NA))
  expect_identical(as.vector(transform_lasa_data(out[1, ], format = "wide", prefix = "Time")$t3_msrttn), -6.4)
  # Also as text.
  long <- data.frame(respnr = 1, Wave = "E", msrttn = factor("-6.4"))
  expect_identical(as.vector(transform_lasa_data(long)$Time), 3L)
  # Word-recall retention differences can be negative from wave D on; at
  # wave C, which documents retention as a ratio, -5 is a code.
  long <- data.frame(respnr = 1:2, Wave = c("C", "D"), mret1pc = c(-5, -5))
  expect_message(out <- transform_lasa_data(long), "e.g. respondent 1 at wave C")
  expect_identical(as.vector(out$Time), c(NA, 2L))
})

test_that("guessed waves don't count as a respondent's waves", {
  # Merged by respnr, LASAZDC2's b_dm could be any cohort's baseline: a
  # guess, which doesn't make the respondents first-cohort.
  z010 <- read_fixture(
    data.frame(RespNr = c(2001, 2002), EMARST = -8, FMARST = c(2, 1)), "LASAZ010.SAV",
    keep_user_na = TRUE
  )
  zdc2 <- read_fixture(data.frame(RespNr = c(2001, 2002), B_DM = c(1, 0), F_DM = 1), "LASAZDC2.SAV")
  wide <- merge(zdc2, z010, by = "respnr")
  messages <- character(0)
  long <- withCallingHandlers(
    transform_lasa_data(wide),
    message = function(m) {
      messages <<- c(messages, conditionMessage(m))
      invokeRestart("muffleMessage")
    }
  )
  expect_length(messages, 2L)
  expect_match(messages[[1L]], "placed at the wave shown: b_dm \\(B\\)")
  expect_match(messages[[2L]], "shows the cohort of 2 respondent\\(s\\) \\(e.g. respondent 2001 at wave F\\)")
  expect_equal(long$Wave, rep(c("B", "E", "F"), 2), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), rep(NA_integer_, 6))
})

test_that("LASA's names without a wave prefix are wave-specific too", {
  # totalalpha is wave H's (file 233), xcancer1 waves B's and C's (file 435).
  h233 <- data.frame(RespNr = 1:2, TOTALALPHA = c(3, 0))
  expect_message(
    long <- read_lasa_sav(write_transform_sav(h233, "LASAH233.SAV"), standardize = FALSE, format_as_long = TRUE),
    "shows the cohort of 2 respondent"
  )
  expect_named(long, c("respnr", "Wave", "Time", "totalalpha"))
  expect_equal(long$Wave, c("H", "H"), ignore_attr = TRUE)

  # Merged with wave G's file 046: totalalpha stays at H.
  g046 <- read_fixture(data.frame(RespNr = 1:2, GLPHYA01 = c(1, 2)), "LASAG046.SAV", standardize = FALSE)
  h233 <- read_fixture(h233, "LASAH233.SAV", standardize = FALSE)
  long <- suppressMessages(transform_lasa_data(merge(g046, h233, by = "respnr")))
  expect_equal(long$Wave, c("G", "H", "G", "H"), ignore_attr = TRUE)
  expect_equal(long$totalalpha, c(NA, 3, NA, 0), ignore_attr = TRUE)

  # LASAB435 read on its own: wave B.
  b435 <- data.frame(RespNr = 1:2, XCANCER1 = c(0, 1))
  expect_silent(long <- read_lasa_sav(write_transform_sav(b435, "LASAB435.SAV"), standardize = FALSE, format_as_long = TRUE))
  expect_equal(long$Wave, c("B", "B"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(0L, 0L))

  # Merged with the 046 files of waves B and C, nothing says whether
  # xcancer1 is wave B's or C's: a guess, with a message, rather than a
  # copy at both waves.
  read_raw <- function(data, filename) read_fixture(data, filename, standardize = FALSE)
  wide <- Reduce(function(x, y) merge(x, y, by = "respnr"), list(
    read_raw(data.frame(RespNr = 1:2, BLPHYA01 = c(1, 2)), "LASAB046.SAV"),
    read_raw(data.frame(RespNr = 1:2, CLPHYA01 = c(3, 4)), "LASAC046.SAV"),
    read_raw(b435, "LASAB435.SAV")
  ))
  expect_message(long <- transform_lasa_data(wide), "placed at the wave shown: xcancer1 \\(B\\)")
  expect_equal(long$Wave, c("B", "C", "B", "C"), ignore_attr = TRUE)
  expect_equal(as.character(long$xcancer1), c("no", NA, "yes", NA))
})

test_that("values on rows of waves the label database doesn't document stay at their row's wave", {
  read_raw <- function(filename, ids, values, name = "BLPHYA04") {
    data <- data.frame(RespNr = ids, x = values)
    names(data)[[2L]] <- name
    read_fixture(data, filename, standardize = FALSE, add_wavecode = TRUE)
  }
  # The label database documents nothing at wave 4B yet; its files use the
  # baselines' "b" names.
  stacked <- rbind(
    read_raw("LAS2B046.SAV", c(11, 12), c(60, 15)),
    read_raw("LAS4B046.SAV", c(401, 402), c(20, 10)),
    read_raw("LASAB046.SAV", c(1, 2), c(30, 45))
  )
  expect_silent(long <- transform_lasa_data(stacked))
  expect_equal(long$respnr, stacked$respnr)
  expect_equal(long$Wave, stacked$Wave, ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), rep(0L, 6))
  wide <- transform_lasa_data(stacked, format = "wide")
  expect_named(wide, c("respnr", "blphya04", "b2lphya04", "b4lphya04"))
  expect_equal(transform_lasa_data(wide)$Wave, stacked$Wave, ignore_attr = TRUE)

  # bcva02 is documented at wave B only.
  stacked <- rbind(
    read_raw("LAS4B035.SAV", c(401, 402), c(55, 65), "BCVA02"),
    read_raw("LASAB035.SAV", c(1, 2), c(60, 70), "BCVA02")
  )
  expect_silent(long <- transform_lasa_data(stacked))
  expect_named(long, c("respnr", "Wave", "Time", "cva02"))
  expect_equal(long$Wave, c("4B", "4B", "B", "B"), ignore_attr = TRUE)

  # bcancer1 is cancer1 at the first three cohorts' baselines, but rmch at
  # the migrant cohort's.
  stacked <- rbind(
    read_raw("LASAB035.SAV", c(1, 2), c(0, 1), "BCANCER1"),
    read_raw("LASMB035.SAV", c(101, 102), c(0, 1), "BCANCER1")
  )
  expect_silent(long <- transform_lasa_data(stacked))
  expect_named(long, c("respnr", "Wave", "Time", "cancer1", "rmch"))
  expect_equal(long$Wave, c("B", "B", "MB", "MB"), ignore_attr = TRUE)
  expect_equal(is.na(long$cancer1), c(FALSE, FALSE, TRUE, TRUE))
  expect_equal(is.na(long$rmch), c(TRUE, TRUE, FALSE, FALSE))

  # A 4B file read on its own, also without standardizing.
  b4 <- data.frame(RespNr = c(401, 402), BLPHYA04 = c(20, 10))
  for (standardize in c(TRUE, FALSE)) {
    expect_silent(
      long <- read_lasa_sav(write_transform_sav(b4, "LAS4B046.SAV"), standardize = standardize, format_as_long = TRUE)
    )
    expect_named(long, c("respnr", "Wave", "Time", "lphya04"))
    expect_equal(long$Wave, c("4B", "4B"), ignore_attr = TRUE)
    expect_identical(as.vector(long$Time), c(0L, 0L))
  }
})

test_that("a name LASA uses at a baseline and at a later wave goes where the respondent's cohort can be", {
  # File 122 names qvalu16 bqvalu16 at wave 3B and at wave J.
  b122 <- read_fixture(data.frame(RespNr = 1:2, BQVALU16 = c(1, 2)), "LAS3B122.SAV", standardize = FALSE)
  expect_silent(long <- transform_lasa_data(b122))
  expect_equal(long$Wave, c("3B", "3B"), ignore_attr = TRUE)

  # Respondents of the first cohort have no wave 3B: their value is wave J's.
  first_cohort <- data.frame(respnr = 1:2, clphya01 = c(1, 2))
  wide <- merge(first_cohort, b122[c("respnr", "bqvalu16")], by = "respnr")
  expect_silent(long <- transform_lasa_data(wide))
  expect_equal(long$Wave, c("C", "J", "C", "J"), ignore_attr = TRUE)
  expect_equal(as.character(long$qvalu16), c(NA, "yes", NA, "no"))

  # Respondents seen at wave J only may be of the third cohort or of
  # another: a guess.
  j046 <- read_fixture(data.frame(RespNr = 1:2, JLPHYA01 = c(1, 2)), "LASAJ046.SAV", standardize = FALSE)
  expect_message(
    expect_message(long <- transform_lasa_data(merge(b122, j046, by = "respnr")), "bqvalu16 \\(3B\\)"),
    "shows the cohort of 2 respondent"
  )
  expect_equal(long$Wave, c("3B", "J", "3B", "J"), ignore_attr = TRUE)

  # Merged into long data by respnr, it is on every row: kept at each
  # row's wave, with a warning.
  long <- data.frame(respnr = c(1, 1, 2, 2), Wave = c("3B", "J", "3B", "J"), lphya01 = 1:4)
  merged <- merge(long, b122[c("respnr", "bqvalu16")], by = "respnr")
  expect_warning(out <- transform_lasa_data(merged), "bqvalu16 hold the same value on every row of each respondent")
  expect_equal(as.character(out$qvalu16), c("yes", "yes", "no", "no"))
})

test_that("per-file long data of several cohorts' baselines, stacked in any order, get their own wide names", {
  read_long <- function(filename, ids, values) {
    read_lasa_sav(
      write_transform_sav(data.frame(RespNr = ids, BLPHYA04 = values), filename),
      standardize = FALSE, format_as_long = TRUE
    )
  }
  # list.files() sorts LAS2B046.SAV before LASAB046.SAV.
  stacked <- rbind(read_long("LAS2B046.SAV", c(11, 12), c(60, 15)), read_long("LASAB046.SAV", c(1, 2), c(30, 45)))
  wide <- transform_lasa_data(stacked, format = "wide")
  expect_named(wide, c("respnr", "b2lphya04", "blphya04"))
  expect_equal(wide$b2lphya04, c(60, 15, NA, NA), ignore_attr = TRUE)
  back <- transform_lasa_data(wide)
  expect_equal(back$Wave, stacked$Wave, ignore_attr = TRUE)
  expect_equal(back$lphya04, stacked$lphya04, ignore_attr = TRUE)
})

test_that("a column only one cohort's baseline has shows the cohort in long data too", {
  # bimmse02 is documented at wave MB only; bmmse02 at every baseline.
  long <- data.frame(respnr = c(1, 2), Wave = "I", lphya04 = c(30, 40))
  mb021 <- read_fixture(
    data.frame(RespNr = 1:2, BIMMSE02 = c(1, 0), BMMSE02 = c(1, 1)), "LASMB021.SAV",
    standardize = FALSE
  )
  merged <- merge(long, mb021[c("respnr", "bimmse02", "bmmse02")], by = "respnr")
  expect_silent(out <- transform_lasa_data(merged))
  expect_named(out, c("respnr", "Wave", "Time", "lphya04", "immse02", "mmse02"))
  expect_equal(out$Wave, c("MB", "I", "MB", "I"), ignore_attr = TRUE)
  expect_identical(as.vector(out$Time), c(0L, 1L, 0L, 1L))
  expect_equal(is.na(out$mmse02), c(FALSE, TRUE, FALSE, TRUE))
})

test_that("wide names are LASA's own where they are unambiguous, so values keep their wave without attributes", {
  # File 156 names m15wrth bm15twtrh at wave B, c15wtrth at C, and
  # bm15wrth at 2B.
  long <- data.frame(respnr = c(1, 1, 2, 2), Wave = c("B", "C", "B", "C"), m15wrth = c(1, 2, 3, 4))
  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c("respnr", "bm15twtrh", "c15wtrth"))
  expect_null(attr(wide$bm15twtrh, "LASA_wave"))
  # Base R's row subsetting drops column attributes.
  back <- transform_lasa_data(wide[1:2, ])
  expect_equal(back$Wave, long$Wave, ignore_attr = TRUE)
  expect_identical(as.vector(back$Time), c(0L, 1L, 0L, 1L))
})

test_that("a baseline column made wide reads back at its own baseline after a merge", {
  b2 <- read_fixture(data.frame(RespNr = 1:2, BLPHYA04 = c(30, 45)), "LAS2B046.SAV")
  wide <- transform_lasa_data(b2, format = "wide")
  expect_named(wide, c("respnr", "b2lphya04"))
  z004 <- read_fixture(data.frame(RespNr = 1:2, SEX = c(1, 2)), "LASAZ004.SAV")
  merged <- merge(wide, z004[c("respnr", "sex")], by = "respnr")
  expect_silent(back <- transform_lasa_data(merged))
  expect_equal(back$Wave, c("2B", "2B"), ignore_attr = TRUE)

  # LASA's own name, the same at every cohort's baseline, doesn't say which
  # baseline the column holds: the cohort's own prefix does.
  raw <- read_fixture(data.frame(RespNr = 1:2, BLPHYA04 = c(30, 45)), "LAS2B046.SAV", standardize = FALSE)
  wide <- transform_lasa_data(raw, format = "wide")
  expect_named(wide, c("respnr", "b2lphya04"))
  expect_null(attr(wide$b2lphya04, "LASA_wave"))
  merged <- merge(wide, z004[c("respnr", "sex")], by = "respnr")
  expect_silent(back <- transform_lasa_data(merged))
  expect_equal(back$Wave, c("2B", "2B"), ignore_attr = TRUE)

  # Wave 4B's too, though the label database documents nothing at 4B yet.
  raw <- read_fixture(data.frame(RespNr = 1:2, BLPHYA04 = c(30, 45)), "LAS4B046.SAV", standardize = FALSE)
  wide <- transform_lasa_data(raw, format = "wide")
  expect_named(wide, c("respnr", "b4lphya04"))
  expect_null(attr(wide$b4lphya04, "LASA_wave"))
  expect_silent(back <- transform_lasa_data(wide[1:2, ]))
  expect_equal(back$Wave, c("4B", "4B"), ignore_attr = TRUE)
})

test_that("a column computed from a wide column isn't taken for that variable", {
  long <- data.frame(respnr = c(1, 1, 2, 2), Wave = c("B", "C", "B", "C"), score = c(10, 12, 20, 18))
  wide <- transform_lasa_data(long, format = "wide")
  # R copies the attributes that say which wave and variable cscore holds.
  wide$score_change <- wide$cscore - wide$bscore
  expect_equal(attr(wide$score_change, "LASA_long_name"), "score")
  expect_silent(back <- transform_lasa_data(wide))
  expect_named(back, c("respnr", "Wave", "Time", "score", "score_change"))
  expect_equal(back$score, long$score, ignore_attr = TRUE)
  expect_equal(back$score_change, c(2, 2, -2, -2), ignore_attr = TRUE)
})

test_that("value labels of a wave without any value still make the long column labelled", {
  wide <- data.frame(respnr = 1:3)
  wide$boak <- haven::labelled(c(NA_real_, NA, NA), c(no = 0, yes = 1))
  wide$coak <- haven::labelled(c(0, 1, NA), c(no = 0, yes = 1))
  long <- transform_lasa_data(wide)
  expect_s3_class(long$oak, "haven_labelled")
  expect_equal(attr(long$oak, "labels"), c(no = 0, yes = 1))
  expect_identical(columns_of(transform_lasa_data(long, format = "wide")), columns_of(wide))

  # Next to plain numbers too, the empty wave converts back as it was.
  wide$coak <- c(0, 1, NA)
  long <- transform_lasa_data(wide)
  expect_identical(columns_of(transform_lasa_data(long, format = "wide")), columns_of(wide))
})

test_that("a long column and a wide column of the same variable keep their own user-missing codes", {
  long <- data.frame(respnr = 1:3, Wave = "B")
  long$lphya01 <- haven::labelled_spss(c(1, -3, 2), c(yes = 1, no = 2, `na, wrong skip` = -3), na_values = -3)
  long$dlphya01 <- haven::labelled_spss(c(4, 2, -1), c(yes = 1, no = 2, `na, asked` = -1), na_values = -1)
  out <- transform_lasa_data(long)
  expect_equal(out$Wave, rep(c("B", "D"), 3), ignore_attr = TRUE)
  expect_equal(attr(out$lphya01, "na_values"), c(-3, -1))
  wide <- without_tags(transform_lasa_data(out, format = "wide"))
  expect_identical(wide$blphya01, long$lphya01)
  expect_identical(wide$dlphya01, long$dlphya01)

  # -3 is a value at wave D: no definition fits both waves, so the long
  # column has none, but each wave's comes back in wide format.
  long$dlphya01 <- haven::labelled_spss(c(4, -3, -1), c(yes = 1, no = 2, `na, asked` = -1), na_values = -1)
  # Respondent 2 now has nothing but missing-value codes, which show no cohort.
  expect_message(
    expect_warning(out <- transform_lasa_data(long), "user-missing codes \\(na_values/na_range\\) of lphya01 differ"),
    "the cohort of 1 respondent\\(s\\) \\(e.g. respondent 2 at wave B\\)"
  )
  expect_null(attr(out$lphya01, "na_values"))
  wide <- without_tags(transform_lasa_data(out, format = "wide"))
  expect_identical(wide$blphya01, long$lphya01)
  expect_identical(wide$dlphya01, long$dlphya01)
})

test_that("a long column read from a wave file converts back as read when a wide column adds a wave", {
  long <- read_fixture(
    data.frame(RespNr = 1:3, BLPHYA01 = c(1, -3, 2)), "LASAB046.SAV",
    to_factor = FALSE, format_as_long = TRUE
  )
  long$dlphya01 <- c(4, 2, 3)
  out <- transform_lasa_data(long)
  expect_equal(out$Wave, rep(c("B", "D"), 3), ignore_attr = TRUE)
  # Labels of the wave file stay labels of its wave.
  expect_equal(attr(out$lphya01, "wave_label"), c(B = attr(long$lphya01, "wave_label")))
  wide <- without_tags(transform_lasa_data(out, format = "wide"))
  expect_named(wide, c("respnr", "blphya01", "dlphya01"))
  expect_identical(wide$blphya01, long$lphya01)
  expect_identical(wide$dlphya01, long$dlphya01)
})

test_that("dates, times and time spans that only combine as text convert back exactly", {
  round_trip <- function(wide) transform_lasa_data(transform_lasa_data(wide), format = "wide")
  wide <- data.frame(respnr = 1:2)
  wide$boak <- as.POSIXct(c("1993-01-10 10:30:00", "1993-02-11 14:00:00"), tz = "UTC")
  wide$coak <- factor(c("no", "yes"))
  wide$doak <- as.difftime(c(1, 2), units = "hours")
  expect_warning(long <- transform_lasa_data(wide), "types that don't combine")
  expect_equal(long$oak[long$Wave == "B"], c("1993-01-10 10:30:00+0000", "1993-02-11 14:00:00+0000"), ignore_attr = TRUE)
  expect_identical(columns_of(suppressWarnings(round_trip(wide))), columns_of(wide))

  # Time-prefixed columns too.
  wide <- data.frame(respnr = 1:2)
  wide$t1_dat <- as.Date(c("1992-05-01", NA))
  wide$t2_dat <- as.POSIXct(c("1993-01-10 10:30:00", NA), tz = "UTC")
  expect_identical(columns_of(suppressWarnings(round_trip(wide))), columns_of(wide))
})

test_that("values convert between types only where the conversion is exact", {
  round_trip <- function(wide) transform_lasa_data(transform_lasa_data(wide), format = "wide")
  # A third of a minute isn't a whole number of hours' worth of doubles:
  # the time spans keep minutes.
  wide <- data.frame(respnr = 1:3)
  wide$boak <- as.difftime(c(1, 2, 3), units = "hours")
  wide$coak <- as.difftime(c(31, 62, 1 / 3), units = "mins")
  long <- transform_lasa_data(wide)
  expect_equal(attr(long$oak, "units"), "mins")
  expect_equal(as.numeric(long$oak[long$Wave == "C"]), c(31, 62, 1 / 3))
  expect_identical(columns_of(round_trip(wide)), columns_of(wide))

  # Numbers kept as text keep every digit.
  wide <- data.frame(respnr = 1:2, boak = c(1 / 3, 0.1 + 0.2), coak = factor(c("a", "b")))
  expect_warning(long <- transform_lasa_data(wide), "types that don't combine")
  expect_identical(as.numeric(long$oak[long$Wave == "B"]), c(1 / 3, 0.1 + 0.2))
  expect_identical(columns_of(suppressWarnings(round_trip(wide))), columns_of(wide))
})

test_that("variable labels survive base R's row subsetting, which drops column attributes", {
  zoa1 <- read_fixture(oa_fixture(), "lasazoa1.SAV")
  subset <- as.data.frame(zoa1)[1:2, ]
  expect_null(attr(subset$boak, "label"))
  long <- transform_lasa_data(subset)
  expect_equal(unname(attr(long, "variable.labels")[["oak"]]), "Symptomatic knee osteoarthritis")
  expect_equal(unname(attr(long, "variable.labels")[["Time"]]), "LASA waves since the respondent's baseline (baseline = 0)")
})

test_that("wide data made wide again get no warnings meant for long format", {
  oa <- function(x, ...) haven::labelled_spss(x, oa_labels, ...)
  # User-missing codes that don't fit one definition in long format.
  wide <- data.frame(respnr = 1:3)
  wide$boak <- oa(c(0, -9, 2), na_values = -9)
  wide$coak <- oa(c(-9, 1, 9), na_values = 9)
  expect_silent(time_wide <- transform_lasa_data(wide, format = "wide", prefix = "Time"))
  expect_identical(time_wide$t0_oak, wide$boak)
  expect_identical(time_wide$t1_oak, wide$coak)
  expect_silent(again <- transform_lasa_data(wide, format = "wide"))
  expect_identical(columns_of(without_tags(again)), columns_of(wide))

  # Types that combine only as text in long format.
  wide <- data.frame(respnr = 1:2, boak = factor(c("no", "yes")), coak = c(1, 2))
  expect_silent(time_wide <- transform_lasa_data(wide, format = "wide", prefix = "Time"))
  expect_identical(time_wide$t0_oak, wide$boak)
  expect_identical(time_wide$t1_oak, wide$coak)
})

test_that("046 and 030 files of two cohorts, read in long format and merged, convert to wide and back", {
  read_long <- function(filecode, wave, ids) {
    variables <- switch(filecode, "046" = c("LPHYA01", "LPHYA07"), "030" = c("ADL1A", "ADL1B"))
    values <- seq_along(ids) + 10 * match(wave, c("B", "C", "2B", "F"))
    data <- data.frame(RespNr = ids, x1 = values, x2 = values + 100)
    # The second cohort's baseline files use the baselines' "b" names.
    names(data)[2:3] <- paste0(if (wave == "2B") "B" else wave, variables)
    filename <- paste0(if (wave == "2B") "LAS" else "LASA", wave, filecode, ".SAV")
    suppressMessages(read_fixture(data, filename, format_as_long = TRUE))
  }
  first <- 1:3
  second <- 2001:2003
  waves <- list(B = first, C = first, `2B` = second, F = c(first, second))
  stack <- function(filecode) do.call(rbind, lapply(names(waves), function(w) read_long(filecode, w, waves[[w]])))
  # Wave F's files alone don't show the respondents' cohorts; together with
  # the baselines, the Time of every row is known.
  merged <- merge(stack("046"), stack("030"), by = c("respnr", "Wave"), all = TRUE)
  expect_named(merged, c("respnr", "Wave", "Time.x", "lphya01", "lphya07", "Time.y", "adl1a", "adl1b"))

  expect_silent(long <- transform_lasa_data(merged))
  expect_named(long, c("respnr", "Wave", "Time", "lphya01", "lphya07", "adl1a", "adl1b"))
  expect_equal(long$Wave, merged$Wave, ignore_attr = TRUE)
  wave <- as.character(long$Wave)
  expected_time <- ifelse(long$respnr %in% second, c(`2B` = 0L, F = 1L)[wave], c(B = 0L, C = 1L, F = 4L)[wave])
  expect_identical(as.vector(long$Time), unname(expected_time))
  for (name in c("lphya01", "lphya07", "adl1a", "adl1b")) {
    expect_equal(as.character(long[[name]]), as.character(merged[[name]]), info = name)
  }

  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c(
    "respnr",
    paste0(rep(c("b", "c", "b2", "f"), each = 4), c("lphya01", "lphya07", "adl1a", "adl1b"))
  ))
  expect_equal(as.character(wide$b2adl1a), c(NA, NA, "31", "32", "33", NA))
  expect_equal(as.character(wide$fadl1b), c("141", "142", "144", "145", "146", "143"))

  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_named(time_wide, c(
    "respnr", "cohort",
    paste0(rep(c("t0_", "t1_", "t4_"), each = 4), c("lphya01", "lphya07", "adl1a", "adl1b"))
  ))
  expect_identical(as.character(time_wide$cohort), paste("cohort", c(1, 1, 2, 2, 2, 1), c("(1992)", "(2002)")[c(1, 1, 2, 2, 2, 1)]))
  # Time 1 is wave C for the first cohort, wave F for the second.
  expect_equal(as.character(time_wide$t1_lphya01), c("21", "22", "44", "45", "46", "23"))

  for (wide_data in list(wide, time_wide)) {
    back <- transform_lasa_data(wide_data)
    expect_equal(setdiff(names(back), "cohort"), names(long))
    for (name in names(long)) {
      expect_equal(as.character(back[[name]]), as.character(long[[name]]), info = name)
    }
  }
})

test_that("in long data without documented wave-specific columns, values that differ between a respondent's rows show the waves", {
  # Rows B and C hold nothing: they don't make respondent 2001 first-cohort ...
  long <- data.frame(respnr = 2001, Wave = c("B", "C", "F", "G"), married = c(NA, NA, TRUE, TRUE))
  expect_message(out <- transform_lasa_data(long), "nothing in 'data' shows the cohort of 1 respondent")
  expect_true(all(is.na(out$Time)))
  # ... nor wipe a Time the data have.
  long <- data.frame(respnr = 2001, Wave = c("B", "2B", "F"), Time = c(NA, 0, 1), married = c(NA, FALSE, TRUE))
  expect_silent(out <- transform_lasa_data(long))
  expect_identical(as.vector(out$Time), c(NA, 0L, 1L))
  # A column with one value per respondent says nothing about the waves.
  long <- data.frame(respnr = 1, Wave = c("B", "C", "F"), score = c(1, NA, 3), group = "x")
  expect_identical(as.vector(transform_lasa_data(long)$Time), c(0L, 1L, 4L))
  # Without any columns but the keys, every row shows its wave.
  long <- data.frame(respnr = c(1, 1, 2), Wave = c("B", "C", "2B"))
  expect_identical(as.vector(transform_lasa_data(long)$Time), c(0L, 1L, 0L))
})

test_that("every row of one LASA file of a wave only one cohort takes part in gets its Time, codes or not", {
  # Respondent 12 holds nothing but 'na, asked' codes in the second
  # cohort's baseline file (kept with keep_user_na = TRUE).
  b2 <- read_fixture(
    data.frame(RespNr = c(11, 12), BADL1A = c(4, -1), BADL1B = c(1, -1)), "LAS2B030.SAV",
    keep_user_na = TRUE, format_as_long = TRUE
  )
  expect_equal(b2$Wave, c("2B", "2B"), ignore_attr = TRUE)
  expect_identical(as.vector(b2$Time), c(0L, 0L))
  # A file of a wave several cohorts take part in doesn't show the cohort,
  expect_message(
    f <- read_fixture(
      data.frame(RespNr = c(11, 12), FADL1A = c(4, -1)), "LASAF030.SAV",
      keep_user_na = TRUE, format_as_long = TRUE
    ),
    "nothing in 'data' shows the cohort of 2 respondent"
  )
  expect_true(all(is.na(f$Time)))
  # but stacked with the baseline file, the baseline rows' Time does.
  long <- transform_lasa_data(rbind(b2[c("respnr", "Wave", "Time", "adl1a")], f))
  expect_identical(as.vector(long$Time), c(0L, 0L, 1L, 1L))
})

test_that("LASA's cohort column gives each respondent's baseline", {
  # LASAZ002.SAV's cohort (here with the file's own wording): cohort 1's
  # baseline is B, cohort 2's 2B, and cohort 3's 3B.
  cohorts <- c("Cohort 1 (1992/1993)" = 1, "Cohort 2 (2002/2003)" = 2, "Cohort 3 (2012/2013)" = 3)
  z002 <- read_fixture(
    data.frame(RespNr = 1:4, COHORT = haven::labelled(c(1, 2, 3, 3), cohorts)), "LASAZ002.SAV"
  )
  expect_equal(as.character(z002$cohort), c("cohort 1 (1992)", "cohort 2 (2002)", "cohort 3 (2012)", "cohort 3 (2012)"))
  # Waves F and I, which several cohorts share, don't show the cohort.
  read_long <- function(wave, ids, values) {
    dat <- data.frame(RespNr = ids, x = values)
    names(dat)[[2L]] <- paste0(wave, "ADL1A")
    suppressMessages(read_fixture(dat, paste0("LASA", wave, "030.SAV"), format_as_long = TRUE))
  }
  long <- rbind(read_long("F", 1:2, c(4, 2)), read_long("I", 1:4, 1:4))
  expect_true(all(is.na(long$Time)))
  merged <- merge(long, z002[c("respnr", "cohort")], by = "respnr")
  expect_silent(out <- transform_lasa_data(merged))
  expect_equal(out$Wave, c("F", "I", "F", "I", "I", "I"), ignore_attr = TRUE)
  expect_identical(as.vector(out$Time), c(4L, 7L, 1L, 4L, 1L, 1L))
  # The cohort column stays, with the labels merge() dropped.
  expect_null(attr(merged$cohort, "label"))
  expect_identical(as.character(out$cohort), as.character(merged$cohort))
  expect_identical(attributes(out$cohort), attributes(z002$cohort))

  # Its wording may vary, and its codes say it too.
  for (cohort in list(
    c("cohort 1", "Cohort 2", "COHORT 3 (2012/2013)", "cohort 3"),
    factor(c("Cohort 1", "Cohort 2", "Cohort 3", "Cohort 3")),
    haven::labelled(c(1, 2, 3, 3), cohorts),
    c(1, 2, 3, 3)
  )) {
    merged$cohort <- cohort[merged$respnr]
    expect_identical(as.vector(transform_lasa_data(merged)$Time), c(4L, 7L, 1L, 4L, 1L, 1L))
  }

  # Time-prefixed wide format replaces it with its own cohort column, coded
  # as read_lasa_sav() reads LASAZ002.SAV's, which transforming back reads.
  time_wide <- transform_lasa_data(merged, format = "wide", prefix = "Time")
  expect_named(time_wide, c("respnr", "cohort", "t1_adl1a", "t4_adl1a", "t7_adl1a"))
  expect_identical(time_wide$cohort, z002$cohort)
  expect_identical(as.vector(transform_lasa_data(time_wide)$Time), c(4L, 7L, 1L, 4L, 1L, 1L))

  # It must fit the waves the data show, and give a respondent one cohort.
  merged$cohort <- c("cohort 1", "cohort 3", "cohort 2", "cohort 3")[merged$respnr]
  expect_error(
    transform_lasa_data(merged),
    "'cohort' column that doesn't match its waves: for respondent 2 it says 'cohort 3' \\(baseline 3B\\)"
  )
  merged$cohort <- c("cohort 1", "cohort 2", "cohort 3", "cohort 3")[merged$respnr]
  merged$cohort[[1L]] <- "cohort 2"
  expect_error(transform_lasa_data(merged), "gives respondent 1 several cohorts \\('cohort 2' and 'cohort 1'\\)")

  # A column named cohort that names no LASA cohort is an ordinary column.
  merged$cohort <- c(1920, 1925, 1930, 1935)[merged$respnr]
  expect_message(out <- transform_lasa_data(merged), "nothing in 'data' shows the cohort of 4 respondent")
  expect_identical(out$cohort, merged$cohort)
})

test_that("a Z file's own cohort column gives its rows their Time", {
  # LASAZ002.SAV marks the waves before a respondent's cohort joined with a
  # code naming their cohort ("cohort 2", -3 for result).
  z002 <- data.frame(RespNr = 1:3, COHORT = 1:3, BRESULT = c(5, -3, -4), FRESULT = c(5, 5, -4), IRESULT = 5)
  expect_silent(long <- transform_lasa_data(read_fixture(z002, "LASAZ002.SAV")))
  expect_named(long, c("respnr", "Wave", "Time", "cohort", "result"))
  expect_equal(long$Wave, c("B", "F", "I", "F", "I", "I"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(0L, 4L, 7L, 1L, 4L, 1L))
  # Kept with keep_user_na = TRUE, the codes get rows of their own, without
  # a Time.
  kept <- transform_lasa_data(read_fixture(z002, "LASAZ002.SAV", keep_user_na = TRUE))
  expect_equal(kept$Wave, rep(c("B", "F", "I"), 3), ignore_attr = TRUE)
  expect_identical(as.vector(kept$Time), c(0L, 4L, 7L, NA, 1L, 4L, NA, NA, 1L))
  expect_equal(as.character(kept$result[kept$Wave == "B"]), c("data", "cohort 2", "cohort 3"))
})

test_that("a cohort column names the fourth and the migrant cohort too, and values that name none say nothing", {
  long <- data.frame(
    respnr = c(1, 1, 2, 3), Wave = c("I", "J", "L", "F"), cohort = c("migrant cohort", NA, "Cohort 4", "unknown"),
    lphya01 = 1:4
  )
  expect_message(out <- transform_lasa_data(long), "nothing in 'data' shows the cohort of 1 respondent\\(s\\) \\(e.g. respondent 3")
  expect_identical(as.vector(out$Time), c(1L, 2L, 1L, NA))
  # Time-prefixed wide format gives them levels of their own.
  time_wide <- suppressMessages(transform_lasa_data(long[1:3, ], format = "wide", prefix = "Time"))
  expect_identical(as.character(time_wide$cohort), c("migrant cohort", "4"))
  expect_identical(
    levels(time_wide$cohort), c("cohort 1 (1992)", "cohort 2 (2002)", "cohort 3 (2012)", "4", "migrant cohort")
  )
  expect_identical(as.vector(transform_lasa_data(time_wide)$Time), c(1L, 2L, 1L))
  # Plain numbers are LASA's codes, as long as they are nothing else.
  long$cohort <- c(2, 2, 1, NA)
  expect_identical(suppressMessages(as.vector(transform_lasa_data(long)$Time)), c(4L, 5L, 10L, NA))
  long$cohort <- c(2, 2, 1, 7)
  expect_message(out <- transform_lasa_data(long), "nothing in 'data' shows the cohort of 3 respondent")
  expect_identical(out$cohort, long$cohort)
})

test_that("a LASA respondent number gives the respondent's cohort", {
  # Five digits, the first of which says the cohort: 1 to 3 the first, 4 to
  # 6 the second, and 7 to 9 the third. Rows at waves F and I, which several
  # cohorts share, get their Time from it.
  long <- data.frame(
    respnr = c(21001, 21001, 45001, 45001, 78001, 1234),
    Wave = c("F", "I", "F", "I", "I", "I"),
    lphya01 = 1:6
  )
  expect_message(
    out <- transform_lasa_data(long),
    "nothing in 'data' shows the cohort of 1 respondent\\(s\\) \\(e.g. respondent 1234 at wave I\\)"
  )
  expect_identical(as.vector(out$Time), c(4L, 7L, 1L, 4L, 1L, NA))
  # Held as text too. Numbers of other lengths say nothing, also six digits,
  # which the fourth cohort's may have.
  long$respnr <- c("21001", "21001", "45001", "45001", "78001", "100001")
  expect_message(out <- transform_lasa_data(long), "e.g. respondent 100001 at wave I")
  expect_identical(as.vector(out$Time), c(4L, 7L, 1L, 4L, 1L, NA))

  # So one LASA file of such a wave read in long format has its Time, and
  # Time-prefixed wide format the respondents' cohort.
  i046 <- read_fixture(
    data.frame(RespNr = c(21001, 45001, 78001), ILPHYA09 = c(30, 20, 10)), "LASAI046.SAV", format_as_long = TRUE
  )
  expect_identical(as.vector(i046$Time), c(7L, 4L, 1L))
  time_wide <- transform_lasa_data(i046, format = "wide", prefix = "Time")
  expect_named(time_wide, c("respnr", "cohort", "t1_lphya09", "t4_lphya09", "t7_lphya09"))
  expect_identical(as.character(time_wide$cohort), c("cohort 1 (1992)", "cohort 2 (2002)", "cohort 3 (2012)"))

  # A column of a cohort's baseline goes to each respondent's own.
  wide <- data.frame(respnr = c(21001, 45001, 78001), blphya01 = 1:3, ilphya01 = 4:6)
  expect_silent(long <- transform_lasa_data(wide))
  expect_identical(
    paste(long$respnr, long$Wave, long$Time),
    c("21001 B 0", "21001 I 7", "45001 2B 0", "45001 I 4", "78001 3B 0", "78001 I 1")
  )
  expect_equal(long$lphya01, c(1, 4, 2, 5, 3, 6), ignore_attr = TRUE)
})

test_that("the rest of the data decide the cohort of a respondent whose number says another, with a warning", {
  says_cohort_2 <- paste0(
    "say a cohort the rest of the data rule out, so their cohort and Time come from the rest of the data ",
    "alone \\(e.g. respondent 41001, whose number says cohort 2\\)"
  )
  long <- data.frame(respnr = 41001, Wave = c("B", "C", "F"), lphya01 = 1:3)
  expect_warning(out <- transform_lasa_data(long), says_cohort_2)
  expect_identical(as.vector(out$Time), c(0L, 1L, 4L))
  # LASA's cohort column too.
  long <- data.frame(respnr = 41001, Wave = "I", cohort = "cohort 1 (1992)", lphya01 = 1)
  expect_warning(out <- transform_lasa_data(long), says_cohort_2)
  expect_identical(as.vector(out$Time), 7L)

  # The migrant cohort's numbers aren't known. Read in long format, a file of
  # a wave several cohorts share gives the Time the number gives, which the
  # migrant cohort's own wave then corrects.
  expect_warning(
    mb <- read_fixture(data.frame(RespNr = 41001, BLPHYA09 = 20), "LASMB046.SAV", format_as_long = TRUE),
    says_cohort_2
  )
  i046 <- read_fixture(data.frame(RespNr = 41001, ILPHYA09 = 25), "LASAI046.SAV", format_as_long = TRUE)
  expect_identical(as.vector(i046$Time), 4L)
  expect_warning(out <- transform_lasa_data(rbind(mb, i046)), says_cohort_2)
  expect_identical(paste(out$Wave, out$Time), c("MB 0", "I 1"))
  # A Time that follows neither the number nor the rest of the data (the
  # first cohort's) is still an error.
  i046$Time <- 7L
  expect_error(
    transform_lasa_data(rbind(mb, i046)),
    "'Time' column that doesn't match its waves: for respondent 41001"
  )
})

test_that("a file of a wave only one cohort takes part in puts each respondent at its wave, whatever their number", {
  # The migrant and the fourth cohort's numbers aren't known yet, so a
  # number in their baseline files that says another cohort gives way to the
  # file, with a warning -- also in LASA's own names (standardize = FALSE).
  says_other <- "The respondent numbers of 3 respondent\\(s\\) say a cohort the rest of the data rule out"
  baseline <- data.frame(RespNr = c(21001, 41001, 71001, 900001), BLPHYA09 = c(20, 25, 30, 35))
  for (standardize in c(TRUE, FALSE)) {
    expect_warning(
      mb <- read_fixture(baseline, "LASMB046.SAV", standardize = standardize, format_as_long = TRUE), says_other
    )
    expect_identical(paste(mb$Wave, mb$Time), rep("MB 0", 4))
    expect_warning(
      b4 <- read_fixture(baseline, "LAS4B046.SAV", standardize = standardize, format_as_long = TRUE), says_other
    )
    expect_identical(paste(b4$Wave, b4$Time), rep("4B 0", 4))
  }
  # So the migrant cohort's later waves get its Time.
  i046 <- read_fixture(data.frame(RespNr = 41001, ILPHYA09 = 26), "LASAI046.SAV", format_as_long = TRUE)
  expect_identical(as.vector(i046$Time), 4L)
  expect_warning(out <- transform_lasa_data(rbind(mb[mb$respnr == 41001, ], i046)), "The respondent numbers of 1")
  expect_identical(paste(out$Wave, out$Time), c("MB 0", "I 1"))
  # Read in wide format and transformed later, too.
  mb <- read_fixture(baseline, "LASMB046.SAV", standardize = FALSE)
  expect_warning(out <- transform_lasa_data(mb), says_other)
  expect_identical(paste(out$Wave, out$Time), rep("MB 0", 4))
  # A migrant cohort's file whose `b` names LASA's Z files use for wave B.
  expect_warning(
    mb010 <- read_fixture(
      data.frame(RespNr = c(21001, 41001), BMARST = c(1, 2)), "LASMB010.SAV",
      standardize = FALSE, format_as_long = TRUE
    ),
    "The respondent numbers of 2 respondent\\(s\\)"
  )
  expect_identical(paste(mb010$Wave, mb010$Time), c("MB 0", "MB 0"))
  # And the first cohort's: 41001's number says the second.
  expect_warning(
    b046 <- read_fixture(
      data.frame(RespNr = c(21001, 41001), BLPHYA09 = c(20, 25)), "LASAB046.SAV",
      standardize = FALSE, format_as_long = TRUE
    ),
    "The respondent numbers of 1 respondent\\(s\\)"
  )
  expect_identical(paste(b046$Wave, b046$Time), c("B 0", "B 0"))
})

test_that("a merged Time column that follows the respondent number gives way to the rest of the data", {
  says_cohort_2 <- "say a cohort the rest of the data rule out.*respondent 41001, whose number says cohort 2"
  # 41001: a migrant whose number says the second cohort. Long data that
  # show the migrant cohort, merged with a wave-I file read on its own
  # (Time 4, the second cohort's, from the number), in either order.
  known <- data.frame(respnr = 41001, Wave = c("MB", "I"), Time = c(0L, 1L), lphya09 = c(20, 25))
  i030 <- data.frame(respnr = 41001, Wave = "I", Time = 4L, adl1a = 1)
  for (merged in list(
    merge(known, i030, by = c("respnr", "Wave"), all = TRUE),
    merge(i030, known, by = c("respnr", "Wave"), all = TRUE)
  )) {
    expect_warning(out <- transform_lasa_data(merged), says_cohort_2)
    expect_identical(sort(paste(out$Wave, out$Time)), c("I 1", "MB 0"))
  }
  # A Time that follows neither (the first cohort's) is still an error.
  i030$Time <- 7L
  expect_error(
    transform_lasa_data(merge(known, i030, by = c("respnr", "Wave"), all = TRUE)),
    "for respondent 41001 at wave I, 'Time.x' says 1 and 'Time.y' says 7"
  )
  # LASA's cohort column shows the cohort too.
  i030$Time <- 4L
  long <- data.frame(respnr = 41001, Wave = "I", cohort = "cohort 1 (1992)", lphya09 = 1)
  expect_warning(long <- transform_lasa_data(long), says_cohort_2)
  expect_warning(out <- transform_lasa_data(merge(long, i030, by = c("respnr", "Wave"), all = TRUE)), says_cohort_2)
  expect_identical(as.vector(out$Time), 7L)

  # LASA files read in long format: a Z file whose wave-B value shows the
  # first cohort, and a wave-F file read on its own.
  expect_warning(
    z002 <- read_fixture(
      data.frame(RespNr = 41001, BRESULT = 5, FRESULT = 5), "LASAZ002.SAV", format_as_long = TRUE
    ),
    says_cohort_2
  )
  f030 <- read_fixture(data.frame(RespNr = 41001, FADL1A = 2), "LASAF030.SAV", format_as_long = TRUE)
  expect_identical(as.vector(f030$Time), 1L)
  expect_warning(out <- transform_lasa_data(merge(z002, f030, by = c("respnr", "Wave"), all = TRUE)), says_cohort_2)
  expect_identical(paste(out$Wave, out$Time), c("B 0", "F 4"))

  # At a wave of one cohort too: a row holding nothing but missing-value
  # codes gets the Time of the cohort the respondent number says (21001's
  # code at wave B in a Z file: Time 0, the first cohort's), which gives way
  # to a migrant baseline file.
  says_cohort_1 <- "respondent 21001, whose number says cohort 1"
  lab <- c(married = 2, "no observation birth cohorts 1938-1947" = -8)
  z010 <- read_fixture(
    data.frame(RespNr = 21001, BMARST = haven::labelled(-8, lab)), "LASAZ010.SAV",
    keep_user_na = TRUE, format_as_long = TRUE
  )
  expect_identical(paste(z010$Wave, z010$Time), "B 0")
  expect_warning(
    mb046 <- read_fixture(data.frame(RespNr = 21001, BLPHYA09 = 20), "LASMB046.SAV", format_as_long = TRUE),
    says_cohort_1
  )
  expect_warning(out <- transform_lasa_data(merge(z010, mb046, by = c("respnr", "Wave"), all = TRUE)), says_cohort_1)
  expect_identical(paste(out$Wave, out$Time), c("B NA", "MB 0"))
  # Stacked, such a Time looks the same as one a file of that wave gave (a
  # 2B file gives every row Time 0), which gives way as well -- here to a
  # cohort column; a Time no number gave contradicting it is an error.
  for (id in c(41001, 100001)) {
    long <- data.frame(
      respnr = id, Wave = c("2B", "I"), Time = c(0L, if (id == 41001) 4L else NA),
      lphya09 = c(NA, 30), cohort = "cohort 3 (2012)"
    )
    if (id == 41001) {
      expect_warning(out <- transform_lasa_data(long), says_cohort_2)
      expect_identical(paste(out$Wave, out$Time), c("2B NA", "I 1"))
    } else {
      expect_error(
        transform_lasa_data(long),
        "'Time' column that doesn't match its waves: for respondent 100001, it contradicts the cohort"
      )
    }
  }
})

test_that("Time-prefixed columns of a respondent without a cohort aren't read back by their number", {
  # 71001: the third cohort; 41001: a migrant whose number says the second.
  long <- suppressWarnings(transform_lasa_data(data.frame(
    respnr = c(71001, 71001, 71001, 41001, 41001, 41001),
    Wave = c("3B", "I", "J", "MB", "I", "J"), cesd01 = c(0, 1, 2, 3, 0, 1)
  )))
  # Without the baselines, the data leave 41001's cohort open between the
  # third and the migrant cohort, which give waves I and J the same Times.
  followup <- long[long$Wave %in% c("I", "J"), ]
  warnings <- capture_warnings(time_wide <- transform_lasa_data(followup, format = "wide", prefix = "Time"))
  expect_length(warnings, 2L)
  expect_match(warnings[[1L]], "respondent 41001, whose number says cohort 2")
  expect_match(warnings[[2L]], "no baseline wave for 1 respondent\\(s\\) whose rows have a Time")
  expect_identical(as.character(time_wide$cohort), c("cohort 3 (2012)", NA))
  # Their number, which the data ruled out, doesn't place their values.
  expect_error(
    transform_lasa_data(time_wide),
    "'t1_cesd01' holds values for 1 respondent\\(s\\) whose cohort 'data' don't show \\(e.g. respondent 41001"
  )
})

test_that("a respondent number starting with 1 only says the first cohort of respondents at LASA's waves", {
  # 1 also numbers the LSN pilot study's respondents (wave A), some of whom
  # never joined LASA.
  long <- data.frame(respnr = c(12345, 12345, 13000), Wave = c("A", "B", "A"), lphya01 = c(1, 2, 3))
  expect_silent(time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time"))
  expect_identical(as.character(time_wide$cohort), c("cohort 1 (1992)", NA))
  out <- transform_lasa_data(data.frame(respnr = 13000, Wave = c("A", "F"), lphya01 = 1:2))
  expect_identical(as.vector(out$Time), c(NA, 4L))
})

test_that("Time-prefixed data merged with LASAZ002.SAV keeping every respondent transform back", {
  # LASAZ002.SAV has no migrant cohort, so 100001 isn't in it.
  long <- data.frame(respnr = c(21001, 21001, 100001, 100001), Wave = c("B", "I", "MB", "I"), lphya09 = 1:4)
  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  labs <- c("cohort 1 (1992)" = 1, "cohort 2 (2002)" = 2, "cohort 3 (2012)" = 3)
  z002 <- read_fixture(
    data.frame(RespNr = 21001, COHORT = haven::labelled(1, labs), BSELFR = 1), "LASAZ002.SAV"
  )
  # The rows the merge adds miss the file's "Z" placeholder in "Wave".
  merged <- merge(time_wide, z002, by = c("respnr", "cohort"), all.x = TRUE)
  expect_identical(as.vector(merged$Wave), c("Z", NA))
  out <- transform_lasa_data(merged)
  expected <- c("21001 B 0", "21001 I 7", "100001 MB 0", "100001 I 1")
  expect_identical(paste(out$respnr, out$Wave, out$Time), expected)
  expect_identical(as.character(out$cohort), rep(c("cohort 1 (1992)", "migrant cohort"), each = 2))
  expect_identical(as.vector(out$lphya09), 1:4)
  skip_if_not_installed("dplyr")
  out <- transform_lasa_data(dplyr::left_join(time_wide, z002, by = "respnr"))
  expect_identical(paste(out$respnr, out$Wave, out$Time), expected)
})

test_that("each cohort has the same code in the cohort column of Time-prefixed data", {
  long <- data.frame(
    respnr = c(21001, 21001, 100001, 100001), Wave = c("B", "C", "MB", "I"), lphya09 = c(10, 11, 20, 21)
  )
  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  all_levels <- c("cohort 1 (1992)", "cohort 2 (2002)", "cohort 3 (2012)", "4", "migrant cohort")
  expect_identical(levels(time_wide$cohort), all_levels)
  expect_identical(as.integer(time_wide$cohort), c(1L, 5L))
  # So the codes read back as the same cohorts: as numbers, and from a .sav
  # file without its labels.
  expected <- c("21001 B 0", "21001 C 1", "100001 MB 0", "100001 I 1")
  codes <- time_wide
  codes$cohort <- as.integer(time_wide$cohort)
  out <- transform_lasa_data(codes)
  expect_identical(paste(out$respnr, out$Wave, out$Time), expected)
  path <- tempfile(fileext = ".sav")
  haven::write_sav(time_wide, path)
  out <- transform_lasa_data(haven::zap_labels(haven::read_sav(path)))
  expect_identical(paste(out$respnr, out$Wave, out$Time), expected)

  # Data with the fourth cohort, merged in either way.
  other <- data.frame(respnr = c(21001, 21001, 120001, 120001), Wave = c("B", "C", "4B", "L"), nupers = 5:8)
  other_wide <- transform_lasa_data(other, format = "wide", prefix = "Time")
  expect_identical(levels(other_wide$cohort), all_levels[1:4])
  for (by in list(c("respnr", "cohort"), "respnr")) {
    out <- transform_lasa_data(merge(time_wide, other_wide, by = by, all = TRUE))
    expect_identical(levels(out$cohort), all_levels)
    expect_identical(as.character(unique(out$cohort)), c("cohort 1 (1992)", "migrant cohort", "4"))
  }
})

test_that("a labelled cohort column whose value labels name no LASA cohort is an ordinary column", {
  births <- c("born 1908-1917" = 1, "born 1918-1927" = 2, "born 1928-1937" = 3)
  long <- data.frame(respnr = c(1, 1, 2, 2), Wave = c("F", "G", "F", "G"), lphya09 = c(10, 11, 20, 21))
  long$cohort <- haven::labelled(c(1, 1, 2, 2), births)
  expect_message(out <- transform_lasa_data(long), "nothing in 'data' shows the cohort of 2 respondent\\(s\\)")
  expect_identical(as.vector(out$Time), rep(NA_integer_, 4))
  expect_identical(out$cohort, long$cohort)
  expect_error(
    transform_lasa_data(long, format = "wide", prefix = "Time"),
    "has a column named 'cohort' that doesn't hold LASA's cohorts"
  )
  # Value labels for missing-value codes only leave its codes LASA's.
  long$cohort <- haven::labelled(c(1, 1, 2, -1), c(missing = -1))
  expect_identical(as.vector(transform_lasa_data(long)$Time), c(4L, 5L, 1L, 2L))
})

test_that("cohort columns in several capitalizations are combined, and must agree", {
  labs <- c("Cohort 1 (1992/1993)" = 1, "Cohort 2 (2002/2003)" = 2, "Cohort 3 (2012/2013)" = 3)
  long <- data.frame(respnr = c(1, 2), Wave = "F", lphya09 = c(10, 20))
  long$cohort <- factor(c("cohort 1 (1992)", NA))
  long$COHORT <- haven::labelled(c(1, 2), labs)
  out <- transform_lasa_data(long)
  expect_named(out, c("respnr", "Wave", "Time", "lphya09", "cohort"))
  expect_identical(as.vector(out$Time), c(4L, 1L))
  expect_identical(as.character(out$cohort), c("cohort 1 (1992)", "cohort 2 (2002)"))
  long$COHORT <- haven::labelled(c(2, 2), labs)
  expect_error(
    transform_lasa_data(long),
    "for respondent 1, 'cohort' says 'cohort 1 \\(1992\\)' and 'COHORT' says 'Cohort 2 \\(2002/2003\\)'"
  )

  # LASAZ002.SAV as haven::read_sav() reads it ("RespNr", "COHORT"), merged
  # with Time-prefixed data.
  path <- write_transform_sav(
    data.frame(RespNr = c(21001, 41001), COHORT = haven::labelled(c(1, 2), labs), BSELFR = c(1, -5)),
    "LASAZ002.SAV"
  )
  long <- data.frame(respnr = c(21001, 21001, 41001, 41001), Wave = c("B", "I", "2B", "I"), lphya09 = 1:4)
  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  out <- transform_lasa_data(merge(time_wide, haven::read_sav(path), by.x = "respnr", by.y = "RespNr"))
  expect_named(out, c("respnr", "Wave", "Time", "cohort", "lphya09", "selfr"))
  # (41001's missing-value code at wave B, before their cohort joined, keeps a row there.)
  expect_identical(paste(out$Wave, out$Time), c("B 0", "I 7", "B NA", "2B 0", "I 4"))

  # A column named "cohort" that holds something else, next to LASA's, is
  # an error; two such columns are ordinary ones, but Time-prefixed wide
  # format needs the name.
  long <- data.frame(respnr = 1, Wave = c("B", "C"), lphya01 = 1:2, cohort = "cohort 1 (1992)", Cohort = 1920)
  expect_error(
    transform_lasa_data(long),
    "'data' has a 'Cohort' column that doesn't hold LASA's cohorts next to LASA's cohort column \\(cohort\\)"
  )
  long$cohort <- 1925
  expect_identical(as.vector(transform_lasa_data(long)$Time), 0:1)
  expect_error(
    transform_lasa_data(long, format = "wide", prefix = "Time"),
    "'data' has columns named 'cohort' and 'Cohort' that don't hold LASA's cohorts"
  )
})

test_that("LASA's code 4 is the fourth cohort, as read_lasa_sav() reads it from LASAZ002.SAV", {
  # The label database doesn't document the fourth cohort's code yet, so
  # read_lasa_sav() reads it by its own number.
  labs4 <- c("cohort 1 (1992)" = 1, "cohort 2 (2002)" = 2, "cohort 3 (2012)" = 3, "cohort 4 (2022)" = 4)
  z <- data.frame(RespNr = c(21001, 120001), COHORT = haven::labelled(c(1, 4), labs4))
  z002 <- read_fixture(z, "LASAZ002.SAV")
  expect_identical(as.character(z002$cohort), c("cohort 1 (1992)", "4"))
  long <- data.frame(respnr = c(21001, 120001), Wave = "L", lphya09 = c(5, 6))
  expect_identical(as.vector(transform_lasa_data(merge(long, z002[c("respnr", "cohort")]))$Time), c(10L, 1L))
  z002_codes <- read_fixture(z, "LASAZ002.SAV", to_factor = FALSE)
  expect_false(4 %in% attr(z002_codes$cohort, "labels"))
  expect_identical(as.vector(transform_lasa_data(merge(long, z002_codes[c("respnr", "cohort")]))$Time), c(10L, 1L))
  # A factor of the codes.
  long$cohort <- factor(c(1, 4))
  expect_identical(as.vector(transform_lasa_data(long)$Time), c(10L, 1L))

  # Time-prefixed data name it the same way, so they merge with that file by
  # respondent and cohort.
  long <- data.frame(respnr = c(21001, 21001, 120001, 120001), Wave = c("B", "L", "4B", "L"), lphya01 = 1:4)
  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_identical(as.character(time_wide$cohort), c("cohort 1 (1992)", "4"))
  expect_identical(nrow(merge(time_wide, z002, by = c("respnr", "cohort"))), 2L)
})

test_that("Time-prefixed wide format warns about respondent numbers the data rule out", {
  long <- data.frame(respnr = 41001, Wave = c("B", "C", "F"), lphya01 = 1:3)
  expect_warning(
    time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time"),
    "respondent 41001, whose number says cohort 2"
  )
  expect_identical(as.character(time_wide$cohort), "cohort 1 (1992)")
  expect_named(time_wide, c("respnr", "cohort", "t0_lphya01", "t1_lphya01", "t4_lphya01"))
  # Wave-prefixed wide format, which doesn't keep the cohort, needn't.
  expect_silent(transform_lasa_data(long, format = "wide"))
})

test_that("a Time-prefixed value at a Time the respondent's cohort lacks names what shows the cohort", {
  time_wide <- transform_lasa_data(
    data.frame(respnr = 1, Wave = c("B", "C"), lphya01 = 1:2), format = "wide", prefix = "Time"
  )
  # Respondent 2's wave-3B value shows the third cohort, which has no Time 5.
  time_wide <- data.frame(respnr = c(1, 2), cohort = time_wide$cohort[c(1, NA)], b3lphya01 = c(NA, 1), t5_lphya01 = 3:4)
  expect_error(
    transform_lasa_data(time_wide),
    "'t5_lphya01' holds a value for respondent 2, whose cohort \\(as the rest of the data show it\\) has no wave with Time 5"
  )
})

test_that("the respondents of a file of a wave only one cohort takes part in keep its cohort when other data are joined on", {
  # Read on its own, also a respondent whose missing-value codes became NA.
  c046 <- data.frame(RespNr = c(21001, 13000, 100001), CLPHYA01 = c(1, -1, -1))
  for (standardize in c(FALSE, TRUE)) {
    out <- read_fixture(c046, "LASAC046.SAV", standardize = standardize, format_as_long = TRUE)
    expect_identical(paste(out$respnr, out$Wave, out$Time), c("21001 C 1", "13000 C 1", "100001 C 1"))
  }
  skip_if_not_installed("dplyr")
  says_other <- "The respondent numbers of 2 respondent\\(s\\) say a cohort the rest of the data rule out"
  # The migrant cohort's baseline file, in which 41001 holds only a
  # missing-value code; a wave-I file joined on keeps its attributes.
  baseline <- data.frame(RespNr = c(41001, 41002), BLPHYA09 = c(-1, 30))
  i046 <- read_fixture(data.frame(RespNr = c(41001, 41002), ILPHYA09 = c(25, 26)), "LASAI046.SAV", standardize = FALSE)
  expected <- c("41001 MB 0", "41001 I 1", "41002 MB 0", "41002 I 1")
  for (format_as_long in c(FALSE, TRUE)) {
    for (standardize in c(FALSE, TRUE)) {
      mb <- suppressWarnings(read_fixture(
        baseline, "LASMB046.SAV", standardize = standardize, keep_user_na = TRUE, format_as_long = format_as_long
      ))
      joined <- dplyr::left_join(mb, i046, by = "respnr")
      expect_identical(attr(joined, "LASA_wave"), "MB")
      expect_warning(out <- transform_lasa_data(joined), says_other)
      expect_identical(paste(out$respnr, out$Wave, out$Time), expected)
    }
  }
  # Also joined onto long data: the wave-I file read in long format.
  mb <- read_fixture(baseline, "LASMB046.SAV", standardize = FALSE, keep_user_na = TRUE)
  i046 <- read_fixture(data.frame(RespNr = c(41001, 41002), ILPHYA09 = c(25, 26)), "LASAI046.SAV")
  expect_identical(as.vector(i046$Wave), c("I", "I"))
  expect_warning(out <- transform_lasa_data(dplyr::left_join(mb, i046, by = "respnr")), says_other)
  expect_identical(paste(out$respnr, out$Wave, out$Time), expected)
  expect_identical(as.vector(out$lphya09), c(-1, 25, 30, 26))

  # Respondents of other cohorts that a join with another file adds aren't
  # the file's: only their own data (here, their number) show their cohort.
  mb <- read_fixture(data.frame(RespNr = c(900001, 900002), BLPHYA09 = c(30, 31)), "LASMB046.SAV", standardize = FALSE)
  z004 <- data.frame(RespNr = c(900001, 21001, 41001, 300001), SEX = c(1, 2, 1, 2), BYEAR = c(1950, 1930, 1940, 1945))
  for (standardize in c(FALSE, TRUE)) {
    joined <- dplyr::full_join(mb, read_fixture(z004, "LASAZ004.SAV", standardize = standardize), by = "respnr")
    expect_silent(out <- transform_lasa_data(joined))
    expect_identical(paste(out$respnr, out$Wave, out$Time), c(
      "900001 MB 0", "900002 MB 0", "21001 MB NA", "41001 MB NA", "300001 MB NA"
    ))
    time_wide <- transform_lasa_data(joined, format = "wide", prefix = "Time")
    expect_identical(
      as.character(time_wide$cohort),
      c("migrant cohort", "migrant cohort", "cohort 1 (1992)", "cohort 2 (2002)", NA)
    )
  }

  # The names wide format gives the file's columns (mblphya09) are the
  # file's own too: transformed to wide format and back, every respondent
  # stays at its wave, also one holding nothing but a missing-value code.
  file <- data.frame(RespNr = c(900001, 900002, 41001), BLPHYA09 = c(30, -1, 25))
  for (filename in c("LASMB046.SAV", "LAS4B046.SAV")) {
    wave <- if (filename == "LASMB046.SAV") "MB" else "4B"
    for (keep_user_na in c(FALSE, TRUE)) {
      long <- suppressWarnings(read_fixture(file, filename, keep_user_na = keep_user_na, format_as_long = TRUE))
      wide <- transform_lasa_data(long, format = "wide")
      expect_named(wide, c("respnr", if (wave == "MB") "mblphya09" else "b4lphya09"))
      expect_warning(out <- transform_lasa_data(wide), "The respondent numbers of 1 respondent\\(s\\)")
      expect_identical(paste(out$respnr, out$Wave, out$Time), paste(c(900001, 900002, 41001), wave, 0))
    }
  }
  # Joined with other data then, as above.
  z004 <- read_fixture(data.frame(RespNr = c(900001, 21001), SEX = c(1, 2)), "LASAZ004.SAV", standardize = FALSE)
  expect_warning(
    out <- transform_lasa_data(dplyr::full_join(wide, z004, by = "respnr")),
    "The respondent numbers of 1 respondent\\(s\\)"
  )
  expect_identical(paste(out$respnr, out$Wave, out$Time), c("900001 4B 0", "900002 4B 0", "41001 4B 0", "21001 4B NA"))
})

test_that("a respondent number starting with 1 only counts for respondents the data show at LASA's waves", {
  # 13000 took part in the LSN pilot study (wave A) only: a row that holds
  # nothing, or nothing but missing-value codes, at another wave doesn't
  # show them in LASA.
  long <- data.frame(respnr = c(13000, 13000, 21001, 21001), Wave = c("A", "F", "B", "F"), oak = c(1, NA, 2, 3))
  out <- transform_lasa_data(long)
  expect_identical(paste(out$respnr, out$Wave, out$Time), c("13000 A NA", "13000 F NA", "21001 B 0", "21001 F 4"))
  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_identical(as.character(time_wide$cohort), c(NA, "cohort 1 (1992)"))
  code <- function(x) haven::labelled_spss(x, c("no observation" = -5), na_values = -5)
  long <- data.frame(respnr = 13000, Wave = c("A", "B", "F"), lphya01 = code(c(1, -5, -5)))
  # The message says why the number doesn't count.
  expect_message(
    out <- transform_lasa_data(long),
    paste0(
      "nothing in 'data' shows the cohort of 1 respondent\\(s\\) \\(e.g. respondent 13000 at wave B\\).*",
      "a 1 also numbers the LSN pilot study's respondents, so it only counts for a respondent the data show ",
      "at another wave than A, by a value there other than a missing-value code\\)\\."
    )
  )
  expect_identical(as.vector(out$Time), rep(NA_integer_, 3))
  # A Z file holding LASA's "sample attrition" code at waves B and C.
  lab <- c("sample attrition" = -6, "never married" = 1, married = 2)
  z <- data.frame(
    RespNr = 12345, AMARST = haven::labelled(2, lab), BMARST = haven::labelled(-6, lab),
    CMARST = haven::labelled(-6, lab)
  )
  expect_message(out <- read_fixture(z, "LASAZ010.SAV", keep_user_na = TRUE, format_as_long = TRUE), "nothing in 'data'")
  expect_identical(paste(out$Wave, out$Time), c("A NA", "B NA", "C NA"))
  # A value in a column of LASA's waves does show them there, also where
  # the column's name doesn't say which wave -- or its waves (xcancer1, at
  # waves B and C) leave the wave to a guess.
  out <- transform_lasa_data(data.frame(respnr = 12345, blphya01 = 5))
  expect_identical(paste(out$Wave, out$Time), "B 0")
  wide <- data.frame(respnr = c(13000, 21001), xcancer1 = 1)
  expect_message(out <- transform_lasa_data(wide), "placed at the wave shown: xcancer1 \\(B\\)")
  expect_identical(paste(out$respnr, out$Wave, out$Time), c("13000 B 0", "21001 B 0"))
  time_wide <- suppressMessages(transform_lasa_data(wide, format = "wide", prefix = "Time"))
  expect_identical(as.character(time_wide$cohort), rep("cohort 1 (1992)", 2))
  # Also once the long result, which remembers the guess, is transformed
  # again without its Time.
  out$Time <- NULL
  expect_silent(out <- transform_lasa_data(out))
  expect_identical(paste(out$respnr, out$Wave, out$Time), c("13000 B 0", "21001 B 0"))
})

test_that("Time-prefixed data with the fourth cohort read back from a .sav file with their labels", {
  long <- data.frame(respnr = c(21001, 21001, 120001, 120001), Wave = c("B", "L", "4B", "L"), lphya01 = 1:4)
  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  path <- write_transform_sav(time_wide, "time_wide.sav")
  saved <- haven::read_sav(path)
  expect_identical(attr(saved$cohort, "labels")[["4"]], 4)
  out <- transform_lasa_data(saved)
  expect_identical(paste(out$respnr, out$Wave, out$Time), c("21001 B 0", "21001 L 10", "120001 4B 0", "120001 L 1"))
  expect_identical(as.vector(out$cohort), c(1, 1, 4, 4))
  # So do the long rows of wave L alone, whose cohort column is all that
  # shows the fourth cohort.
  followup <- out[out$Wave == "L", c("respnr", "Wave", "cohort", "lphya01")]
  out <- transform_lasa_data(haven::read_sav(write_transform_sav(followup, "followup.sav")))
  expect_identical(paste(out$respnr, out$Wave, out$Time), c("21001 L 10", "120001 L 1"))
})

test_that("Time-prefixed data merged with LASAZ002.SAV holding none of their respondents transform back", {
  # LASAZ002.SAV has no migrant cohort.
  time_wide <- transform_lasa_data(
    data.frame(respnr = 100001, Wave = c("MB", "I"), lphya09 = 1:2), format = "wide", prefix = "Time"
  )
  labs <- c("cohort 1 (1992)" = 1, "cohort 2 (2002)" = 2, "cohort 3 (2012)" = 3)
  z002 <- read_fixture(data.frame(RespNr = 21001, COHORT = haven::labelled(1, labs), BSELFR = 1), "LASAZ002.SAV")
  merged <- merge(time_wide, z002, by = c("respnr", "cohort"), all.x = TRUE)
  expect_identical(as.vector(merged$Wave), NA_character_)
  out <- transform_lasa_data(merged)
  expect_identical(paste(out$respnr, out$Wave, out$Time), c("100001 MB 0", "100001 I 1"))
  expect_identical(as.vector(out$lphya09), 1:2)
  # Long data, with several rows per respondent, still need their waves.
  expect_error(
    transform_lasa_data(data.frame(respnr = c(1, 1), Wave = NA, oak = 1:2)),
    "'Wave' column has missing values"
  )
})

test_that("data merged by respnr and cohort that give a respondent different cohorts say so", {
  labs <- c("cohort 1 (1992)" = 1, "cohort 2 (2002)" = 2, "cohort 3 (2012)" = 3)
  z002 <- read_fixture(data.frame(RespNr = 71001, COHORT = haven::labelled(4, labs), BSELFR = 1), "LASAZ002.SAV")
  # 71001's number says the third cohort, LASAZ002.SAV the fourth: merged
  # by respnr and cohort, they get a row for each.
  time_wide <- transform_lasa_data(
    data.frame(respnr = 71001, Wave = "L", lphya01 = 1), format = "wide", prefix = "Time"
  )
  merged <- merge(time_wide, z002, by = c("respnr", "cohort"), all = TRUE)
  expect_identical(as.vector(merged$Wave), c(NA, "Z"))
  expect_error(
    transform_lasa_data(merged),
    paste0(
      "respondent 71001, on 2 rows\\), but 'data' has no waves \\(its 'Wave' column holds nothing but a Z ",
      "file's placeholder .* different values in the 'cohort' column \\('cohort 3 \\(2012\\)' and '4'\\)"
    )
  )
  expect_error(
    transform_lasa_data(merge(time_wide, z002, by = "respnr", all = TRUE)),
    "cohort columns that disagree: for respondent 71001"
  )
  # Without a 'Wave' column.
  expect_error(
    transform_lasa_data(data.frame(respnr = c(1, 1), oak = 1:2)),
    "duplicated values \\(e.g. respondent 1, on 2 rows\\), but 'data' has no 'Wave' column: wide data"
  )
})

test_that("a Time-prefixed value of a respondent the data show at waves of different cohorts says so", {
  time_wide <- transform_lasa_data(
    data.frame(respnr = 1, Wave = c("B", "C"), lphya01 = 1:2), format = "wide", prefix = "Time"
  )
  # Respondent 2's wave-C value shows the first cohort, their wave-3B value
  # the third: both have a Time 1.
  time_wide <- data.frame(
    respnr = c(1, 2), cohort = time_wide$cohort[c(1, NA)], clphya01 = c(NA, 1), b3lphya01 = c(NA, 2), t1_lphya01 = 3:4
  )
  expect_error(
    transform_lasa_data(time_wide),
    "'t1_lphya01' holds a value for respondent 2, whom the rest of the data show at waves of different cohorts"
  )
})

test_that("a Time column of text holds no value where it is blank, as SPSS stores missing text", {
  long <- data.frame(respnr = c(21001, 21001, 100001), Wave = c("B", "C", "F"), Time = c("0", "1", NA), lphya01 = 1:3)
  saved <- haven::read_sav(write_transform_sav(long, "long.sav"))
  expect_identical(as.vector(saved$Time), c("0", "1", ""))
  expect_message(out <- transform_lasa_data(saved), "nothing in 'data' shows the cohort of 1 respondent\\(s\\)")
  expect_identical(as.vector(out$Time), c(0L, 1L, NA))
})

test_that("the Time columns of four or more merged long data sets are read, and must agree", {
  one <- function(name) {
    data <- data.frame(respnr = 1, Wave = c("B", "C"), Time = 0:1)
    data[[name]] <- 1:2
    data
  }
  parts <- lapply(c("lphya01", "adl1b", "cesd01", "chair1"), one)
  # base R's merge() names two columns Time.x and two Time.y.
  merged <- suppressWarnings(Reduce(function(x, y) merge(x, y, by = c("respnr", "Wave")), parts))
  expect_equal(sum(names(merged) == "Time.x"), 2L)
  out <- transform_lasa_data(merged)
  expect_named(out, c("respnr", "Wave", "Time", "lphya01", "adl1b", "cesd01", "chair1"))
  expect_identical(as.vector(out$Time), c(0L, 1L))

  a <- data.frame(respnr = 1, Wave = c("2B", "F"), Time = c(0, 1), lphya01 = 1:2)
  b <- data.frame(respnr = 1, Wave = "F", Time = 4, adl1a = 3)
  expect_error(
    transform_lasa_data(merge(a, b, by = c("respnr", "Wave"), all = TRUE)),
    "for respondent 1 at wave F, 'Time.x' says 1 and 'Time.y' says 4"
  )

  skip_if_not_installed("dplyr")
  # dplyr names further copies Time.x.x, Time.y.y, ...
  joined <- Reduce(function(x, y) dplyr::full_join(x, y, by = c("respnr", "Wave")), parts)
  expect_true("Time.x.x" %in% names(joined))
  expect_named(transform_lasa_data(joined), names(out))
})

test_that("Time-prefixed wide data sets merged by respnr convert back with their cohort columns", {
  pa <- transform_lasa_data(
    data.frame(respnr = c(1, 1), Wave = c("B", "C"), lphya09 = c(30, 20)),
    format = "wide", prefix = "Time"
  )
  adl <- transform_lasa_data(
    data.frame(respnr = c(1, 1), Wave = c("B", "C"), nupers = c(1, 2)),
    format = "wide", prefix = "Time"
  )
  merged <- merge(pa, adl, by = "respnr")
  expect_named(merged, c("respnr", "cohort.x", "t0_lphya09", "t1_lphya09", "cohort.y", "t0_nupers", "t1_nupers"))
  expect_silent(out <- transform_lasa_data(merged))
  expect_named(out, c("respnr", "Wave", "Time", "cohort", "lphya09", "nupers"))
  expect_equal(out$Wave, c("B", "C"), ignore_attr = TRUE)
  expect_equal(out$nupers, c(1, 2), ignore_attr = TRUE)
  expect_identical(as.character(out$cohort), as.character(pa$cohort)[c(1, 1)])
  expect_identical(attributes(out$cohort), attributes(pa$cohort))
  # By respnr and cohort, there is one cohort column to begin with.
  expect_named(merge(pa, adl, by = c("respnr", "cohort")), c("respnr", "cohort", "t0_lphya09", "t1_lphya09", "t0_nupers", "t1_nupers"))
  adl$cohort <- factor("cohort 2 (2002)", levels = levels(adl$cohort))
  expect_error(
    transform_lasa_data(merge(pa, adl, by = "respnr")),
    "'cohort.x' says 'cohort 1 \\(1992\\)' and 'cohort.y' says 'cohort 2 \\(2002\\)'"
  )
})

test_that("Time-prefixed wide data merge with LASAZ002.SAV by respnr and cohort", {
  z002 <- read_fixture(data.frame(RespNr = c(21001, 41001, 71001), COHORT = c(1, 2, 3), BSELFR = c(1, -5, -6)), "LASAZ002.SAV")
  long <- data.frame(respnr = c(21001, 41001, 71001), Wave = "I", lphya09 = c(30, 20, 10))
  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_identical(time_wide$cohort, z002$cohort)
  expect_identical(attributes(time_wide$cohort), attributes(z002$cohort))
  merged <- merge(time_wide, z002, by = c("respnr", "cohort"))
  expect_named(merged, c("respnr", "cohort", "t1_lphya09", "t4_lphya09", "t7_lphya09", "Wave", "bselfr"))
  expect_equal(nrow(merged), 3L)
  back <- transform_lasa_data(merged)
  expect_named(back, c("respnr", "Wave", "Time", "cohort", "lphya09", "selfr"))
  expect_identical(as.character(back$cohort), as.character(z002$cohort)[c(1, 1, 2, 3)])
  expect_identical(attributes(back$cohort), attributes(z002$cohort))
  expect_equal(paste(back$Wave, back$Time), c("B 0", "I 7", "I 4", "I 1"))
  # Merged by respnr alone, the two cohort columns become one again.
  expect_identical(transform_lasa_data(merge(time_wide, z002, by = "respnr")), back)
})

test_that("Time-prefixed wide format warns when the data don't give a respondent with a Time their baseline", {
  long <- transform_lasa_data(data.frame(
    respnr = c(301, 301, 301, 501, 501, 501),
    Wave = c("3B", "I", "J", "MB", "I", "J"),
    cesd01 = c(0, 1, 2, 3, 0, 1)
  ))
  # Without the baseline rows, Time 1 and 2 may be the third cohort's or
  # the migrant cohort's.
  followup <- long[long$Wave %in% c("I", "J"), ]
  expect_warning(
    wide <- transform_lasa_data(followup, format = "wide", prefix = "Time"),
    "no baseline wave for 2 respondent\\(s\\) whose rows have a Time \\(e.g. respondent 301 at wave I\\)"
  )
  expect_identical(as.character(wide$cohort), c(NA_character_, NA_character_))
})

test_that("a LASA file's own columns stay at its wave, also where the label database doesn't document them there", {
  # drinking is file 152's name at waves G to K; files of waves 4B and L
  # aren't documented yet.
  long <- read_fixture(
    data.frame(RespNr = c(401, 402), DRINKING = c(1, 0), BLPHYA04 = c(20, 10)), "LAS4B152.SAV",
    format_as_long = TRUE
  )
  expect_equal(long$Wave, c("4B", "4B"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(0L, 0L))
  expect_equal(long$drinking, c(1, 0), ignore_attr = TRUE)
  expect_message(
    long <- read_fixture(data.frame(RespNr = 1:2, DRINKING = c(1, 0)), "LASAL152.SAV", format_as_long = TRUE),
    "nothing in 'data' shows the cohort"
  )
  expect_equal(long$Wave, c("L", "L"), ignore_attr = TRUE)
  # seh_reden is documented at wave J only, afstand at MB only.
  long <- suppressMessages(read_fixture(
    data.frame(RespNr = 1:2, SEH_REDEN = c(3, 1)), "LASAK045.SAV",
    format_as_long = TRUE
  ))
  expect_equal(long$Wave, c("K", "K"), ignore_attr = TRUE)
  long <- read_fixture(data.frame(RespNr = 1:2, AFSTAND = c(5, 10)), "LAS4B048.SAV", format_as_long = TRUE)
  expect_equal(long$Wave, c("4B", "4B"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(0L, 0L))
  # "b" names the label database documents at B, 2B and 3B but not at MB.
  long <- read_fixture(
    data.frame(RespNr = c(31, 32), BLPHYA01 = c(1, 2), BLPHYA04 = c(30, 40)), "LASMB046.SAV",
    format_as_long = TRUE
  )
  expect_equal(long$Wave, c("MB", "MB"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(0L, 0L))
  # Stacked in long format, each file's rows keep their own wave.
  stacked <- do.call(rbind, lapply(1:3, function(k) {
    suppressMessages(read_fixture(
      data.frame(RespNr = 1:2, DRINKING = c(k, k - 1)), paste0("LASA", c("J", "K", "L")[[k]], "152.SAV"),
      format_as_long = TRUE, to_factor = FALSE
    ))
  }))
  long <- suppressMessages(transform_lasa_data(stacked))
  expect_equal(long$Wave, rep(c("J", "K", "L"), each = 2), ignore_attr = TRUE)
  expect_equal(as.vector(unclass(long$drinking)), c(1, 0, 2, 1, 3, 2))
})

test_that("a column read_lasa_sav() matched to another wave's name goes to the matched wave by every route", {
  # Wave D's lphya01 still carries wave C's name.
  d046 <- data.frame(RespNr = c(1, 2), CLPHYA01 = c(1, 2), DLPHYA04 = c(30, 40))
  read_d <- function(...) read_fixture(d046, "LASAD046.SAV", name_corrections = c(dlphya01 = "clphya01"), ...)
  for (long in list(
    transform_lasa_data(read_d(standardize = FALSE)),
    read_d(standardize = FALSE, format_as_long = TRUE),
    read_d(format_as_long = TRUE)
  )) {
    expect_equal(long$Wave, c("D", "D"), ignore_attr = TRUE)
    expect_identical(as.vector(long$Time), c(2L, 2L))
  }
  # A fuzzy match likewise: wave C's file with wave B's name.
  c046 <- read_fixture(
    data.frame(RespNr = 1:2, BLPHYA01 = c(3, 4), CLPHYA07 = c(1, 2)), "LASAC046.SAV",
    standardize = FALSE
  )
  expect_equal(transform_lasa_data(c046)$Wave, c("C", "C"), ignore_attr = TRUE)
})

test_that("wave I's MMSE items, named like the migrant cohort's long columns, go to wave I", {
  # immse02 is wave I's name for mmse02, and the long name of MB's bimmse02.
  long_3b <- read_fixture(data.frame(RespNr = c(1, 2), BMMSE01 = c(1, 1)), "LAS3B021.SAV")
  i021 <- read_fixture(data.frame(RespNr = c(1, 2), IMMSE02 = c(1, 2)), "LASAI021.SAV", standardize = FALSE)
  # base R's merge() drops the factor's canonical_name.
  long <- transform_lasa_data(merge(long_3b, i021, by = "respnr"))
  expect_named(long, c("respnr", "Wave", "Time", "mmse01", "mmse02"))
  expect_equal(long$Wave, c("3B", "I", "3B", "I"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(0L, 1L, 0L, 1L))
  # Wide format keeps LASA's name, and tags the column; merged into long
  # data, which drops the tags, it still goes to wave I.
  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c("respnr", "immse02", "b3mmse01"))
  expect_equal(attr(wide$immse02, "LASA_wave"), "I")
  other <- data.frame(respnr = c(1, 2), Wave = "3B", lphya01 = c(1, 2))
  out <- transform_lasa_data(merge(other, wide[c("respnr", "immse02")], by = "respnr"))
  expect_named(out, c("respnr", "Wave", "Time", "lphya01", "mmse02"))
  expect_equal(out$Wave, c("3B", "I", "3B", "I"), ignore_attr = TRUE)
})

test_that("a name LASA uses for two variables at a wave is taken as the one it stands for at its other waves, with a message", {
  # At MB, bmmsesc1 is file 221's mmsesc and file 421's mmsesc1, which
  # bmmsesc1 is at the other baselines.
  mb021 <- read_fixture(data.frame(RespNr = c(31, 32), BIMMSE02 = c(1, 2)), "LASMB021.SAV", standardize = FALSE)
  mb421 <- read_fixture(data.frame(RespNr = c(31, 32), BMMSESC1 = c(24, 28)), "LASMB421.SAV", standardize = FALSE)
  expect_message(
    long <- transform_lasa_data(merge(mb021, mb421, by = "respnr")),
    "bmmsesc1 at wave MB \\(mmsesc or mmsesc1; taken as mmsesc1\\)"
  )
  expect_equal(long$mmsesc1, c(24, 28), ignore_attr = TRUE)
  # The file on its own says which.
  expect_silent(long <- transform_lasa_data(mb421))
  expect_named(long, c("respnr", "Wave", "Time", "mmsesc1"))
})

test_that("a wave file's own column named like another file's long column isn't a stripped wave-specific name", {
  # partner is MB file 048's own name, and Z file z010's long name of
  # apartner, bpartner, ...
  mb048 <- data.frame(RespNr = c(31, 32), PARTNER = c(1, 2), AFSTAND = c(3, 4))
  expect_silent(long <- read_fixture(mb048, "LASMB048.SAV", standardize = FALSE, format_as_long = TRUE))
  expect_equal(long$Wave, c("MB", "MB"), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), c(0L, 0L))
})

test_that("wide format uses LASA's own name of a variable of one wave without a wave prefix", {
  long <- suppressMessages(read_fixture(
    data.frame(RespNr = c(1, 2), TOTALALPHA = c(3, 1)), "LASAH233.SAV",
    format_as_long = TRUE
  ))
  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c("respnr", "totalalpha"))
  back <- suppressMessages(transform_lasa_data(wide))
  expect_equal(back$Wave, c("H", "H"), ignore_attr = TRUE)
})

test_that("a guessed wave stays a guess in later transformations", {
  b2 <- read_fixture(data.frame(RespNr = c(11, 12), BLPHYA04 = c(30, 45)), "LAS2B046.SAV", standardize = FALSE)
  f <- read_fixture(data.frame(RespNr = c(11, 12), FLPHYA04 = c(25, 40)), "LASAF046.SAV", standardize = FALSE)
  expect_message(
    expect_message(
      long <- transform_lasa_data(merge(b2, f, by = "respnr")),
      "placed at the wave shown: blphya04 \\(B\\)"
    ),
    "nothing in 'data' shows the cohort of 2 respondent"
  )
  expect_true(all(is.na(long$Time)))
  # Transformed again, the values placed at B still don't show the first
  # cohort ...
  expect_message(again <- transform_lasa_data(long), "nothing in 'data' shows the cohort of 2 respondent")
  expect_true(all(is.na(again$Time)))
  # ... and wide format keeps the name that doesn't say the wave, without
  # tags, so reading it back guesses again.
  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c("respnr", "blphya04", "flphya04"))
  expect_null(attr(wide$blphya04, "LASA_wave"))
  expect_message(
    expect_message(back <- transform_lasa_data(wide), "placed at the wave shown: blphya04 \\(B\\)"),
    "nothing in 'data' shows the cohort"
  )
  expect_true(all(is.na(back$Time)))

  # Saved as an SPSS file and read back, too: a factor's missing-value
  # codes then are the numbers of its levels, which still don't count.
  z010 <- read_fixture(data.frame(RespNr = c(2001, 2002), EMARST = -8, FMARST = c(2, 1)), "LASAZ010.SAV")
  zdc2 <- read_fixture(data.frame(RespNr = c(2001, 2002), B_DM = c(1, 0), F_DM = 1), "LASAZDC2.SAV")
  long <- suppressMessages(transform_lasa_data(merge(zdc2, z010, by = "respnr")))
  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c("respnr", "b_dm", "f_dm", "emarst", "fmarst"))
  saved <- haven::read_sav(write_transform_sav(wide, "wide.sav"))
  back <- suppressMessages(transform_lasa_data(saved))
  expect_true(all(is.na(back$Time)))
})

test_that("Time-prefixed columns combining several cohorts' waves keep those waves' own types, labels and codes", {
  lab <- c(no = 0, yes = 1, refused = 99)
  wide <- data.frame(respnr = c(1, 2, 2001, 2002))
  wide$boak <- haven::labelled_spss(c(0, 99, NA, NA), lab, na_values = 99)
  wide$coak <- haven::labelled(c(99, 1, NA, NA), c(no = 0, yes = 1, `99 or more` = 99))
  wide$b2oak <- haven::labelled_spss(c(NA, NA, 1, 0), lab, na_values = 99)
  expect_silent(time_wide <- transform_lasa_data(wide, format = "wide", prefix = "Time"))
  # t0_oak holds waves B and 2B, which agree: 99 is a missing value there.
  expect_identical(attr(time_wide$t0_oak, "labels"), lab)
  expect_identical(is.na(time_wide$t0_oak), c(FALSE, TRUE, FALSE, FALSE))
  expect_identical(attr(time_wide$t1_oak, "labels"), c(no = 0, yes = 1, `99 or more` = 99))
  # Through long format, the Time-prefixed columns come back exactly.
  expect_warning(long <- transform_lasa_data(time_wide), "user-missing codes")
  expect_identical(transform_lasa_data(long, format = "wide", prefix = "Time"), time_wide)

  levels_b <- c("missing", "no", "possible", "yes")
  wide <- data.frame(respnr = c(1, 2, 2001, 2002))
  wide$boak <- factor(c("no", "yes", NA, NA), levels = levels_b, ordered = TRUE)
  wide$coak <- factor(c("no", "dropout", NA, NA), levels = c(levels_b, "dropout"), ordered = TRUE)
  wide$b2oak <- factor(c(NA, NA, "possible", "yes"), levels = levels_b, ordered = TRUE)
  time_wide <- transform_lasa_data(wide, format = "wide", prefix = "Time")
  expect_true(is.ordered(time_wide$t0_oak))
  expect_identical(levels(time_wide$t0_oak), levels_b)

  # Waves whose user-missing codes no single definition fits.
  wide <- data.frame(respnr = c(1, 2001))
  wide$boak <- haven::labelled_spss(c(8, NA), c(no = 0, dropout = 8), na_values = 8)
  wide$b2oak <- haven::labelled_spss(c(NA, 8), c(no = 0, eight = 8))
  expect_warning(
    transform_lasa_data(wide, format = "wide", prefix = "Time"),
    "share a Time in a way no single definition can represent"
  )
})

test_that("Time-prefixed columns give each wave its own wording back in long format", {
  wide <- data.frame(respnr = c(1, 2001))
  wide$boak <- structure(c(0, NA), wave_label = "oak at B")
  wide$b2oak <- structure(c(NA, 1), wave_label = "oak at 2B")
  time_wide <- transform_lasa_data(wide, format = "wide", prefix = "Time")
  expect_identical(attr(time_wide$t0_oak, "wave_label"), c(B = "oak at B", `2B` = "oak at 2B"))
  long <- transform_lasa_data(time_wide)
  expect_identical(attr(long$oak, "wave_label"), c(B = "oak at B", `2B` = "oak at 2B"))
  expect_identical(attr(transform_lasa_data(long, format = "wide")$b2oak, "wave_label"), "oak at 2B")
})

test_that("date-times held as text are written in UTC, so they come back as the same moment", {
  wide <- data.frame(respnr = 1:2)
  # 02:30 summer time and 02:30 winter time on 2021-10-31 in Amsterdam.
  wide$boak <- as.POSIXct(c(1635640200, 1635643800), origin = "1970-01-01", tz = "Europe/Amsterdam")
  wide$coak <- factor(c("a", "b"))
  expect_warning(long <- transform_lasa_data(wide), "types that don't combine")
  expect_equal(
    long$oak[long$Wave == "B"], c("2021-10-31 00:30:00+0000", "2021-10-31 01:30:00+0000"),
    ignore_attr = TRUE
  )
  expect_identical(transform_lasa_data(long, format = "wide")$boak, wide$boak)

  # Also Amsterdam's local mean time (until 1937), 19 minutes and 32 seconds
  # ahead of UTC, which an offset in the text can't give exactly.
  wide$boak <- as.POSIXct(c("1900-06-01 12:00:00", "1930-03-15 08:30:15"), tz = "Europe/Amsterdam")
  expect_warning(long <- transform_lasa_data(wide), "types that don't combine")
  expect_identical(transform_lasa_data(long, format = "wide")$boak, wide$boak)
})

test_that("long data stacked and merged the documented way get back the labels rbind() and merge() drop", {
  yn <- c("na, asked" = -1, no = 1, yes = 2)
  ids <- c(10001, 10002)
  read_long <- function(data, filename, ...) {
    suppressMessages(read_fixture(data, filename, format_as_long = TRUE, ...))
  }
  b030 <- data.frame(RespNr = ids, BADL1B = haven::labelled(c(1, 2), yn))
  c030 <- data.frame(RespNr = ids, CADL1B = haven::labelled(c(2, 2), yn))
  adl <- rbind(read_long(b030, "LASAB030.SAV"), read_long(c030, "LASAC030.SAV"))
  pa <- rbind(
    read_long(data.frame(RespNr = ids, BLPHYA09 = c(30, 45)), "LASAB046.SAV"),
    read_long(data.frame(RespNr = ids, CLPHYA09 = c(20, 15)), "LASAC046.SAV")
  )
  expect_null(attr(adl$adl1b, "label"))
  long <- transform_lasa_data(merge(pa, adl, by = c("respnr", "Wave"), all = TRUE))
  wording <- c(B = "Stairs: using aid (BADL1A > 1)", C = "Stairs: using aid (C/D/EADL1A > 1)")
  expect_equal(attr(long$adl1b, "label"), "Stairs: using aid")
  expect_identical(attr(long$adl1b, "wave_label"), wording)
  expect_named(attr(long$adl1b, "labels_wave"), c("B", "C"))
  expect_equal(attr(long$lphya09, "label"), "Walking: time in minutes")
  expect_equal(attr(long, "variable.labels")[["adl1b"]], "Stairs: using aid")

  # rbind() of labelled columns keeps the first file's labels for both
  # waves' rows: each wave gets its own back.
  adl <- rbind(read_long(b030, "LASAB030.SAV", to_factor = FALSE), read_long(c030, "LASAC030.SAV", to_factor = FALSE))
  expect_equal(attr(adl$adl1b, "wave_label"), wording[["B"]])
  expect_identical(attr(transform_lasa_data(adl)$adl1b, "wave_label"), wording)
})

test_that("the migrant cohort's file of stable variables has no wave dimension, and its variables hold for every wave", {
  ids <- c(4001, 4002)
  z <- data.frame(RespNr = ids, SEX = c(1, 2), BYEAR = c(1950, 1955))
  expect_message(mb004 <- read_fixture(z, "LASMB004.SAV", format_as_long = TRUE), "no wave dimension")
  expect_named(mb004, c("respnr", "sex", "byear"))
  long <- transform_lasa_data(rbind(
    read_fixture(data.frame(RespNr = ids, BLPHYA09 = c(20, 30)), "LASMB046.SAV", format_as_long = TRUE),
    suppressMessages(read_fixture(data.frame(RespNr = ids, ILPHYA09 = c(25, 35)), "LASAI046.SAV", format_as_long = TRUE))
  ))
  out <- transform_lasa_data(merge(long, mb004, by = "respnr"))
  expect_equal(as.character(out$sex), c("male", "male", "female", "female"))
  # Read without format_as_long, it has a 'Wave' column: merged by respnr
  # and Wave, its variables still hold for the respondents' other rows.
  mb004 <- read_fixture(z, "LASMB004.SAV")
  expect_error(transform_lasa_data(merge(long, mb004, by = "respnr")), "merge it by respnr alone")
  out <- transform_lasa_data(merge(long, mb004, by = c("respnr", "Wave"), all = TRUE))
  expect_equal(as.character(out$sex), c("male", "male", "female", "female"))
  expect_equal(out$byear, c(1950, 1950, 1955, 1955), ignore_attr = TRUE)
})

test_that("answers that share their label text with a missing-value code still show the respondent's cohort", {
  # xcancer1's harmonized value labels name 0 and 1 "Cancer status", as
  # they do the missing-value code -5: still answers.
  b <- read_fixture(data.frame(RespNr = c(21, 22), XCANCER1 = c(0, 1)), "LASAB435.SAV", to_factor = FALSE)
  c435 <- read_fixture(data.frame(RespNr = c(21, 22), XCANCER1 = c(0, 3)), "LASAC435.SAV", to_factor = FALSE)
  long <- transform_lasa_data(rbind(b, c435))
  expect_equal(as.vector(long$Time), c(0, 0, 1, 1))
  # A speech-reception threshold of 8 dB is a measurement, whatever the
  # value labels of other codes say.
  e <- read_fixture(data.frame(RespNr = c(1, 2), EMSRTTN = c(8, 4.5)), "LASAE193.SAV")
  f <- read_fixture(data.frame(RespNr = 2, FMSRTTN = 3), "LASAF193.SAV")
  long <- transform_lasa_data(rbind(e, f))
  expect_equal(as.vector(long$Time), c(3, 3, 4))
  wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_equal(as.vector(wide$t3_msrttn), c(8, 4.5))
})

test_that("a variable placed at several waves by guesses keeps one column that doesn't say the wave", {
  long0 <- data.frame(
    respnr = c(101, 301), Wave = c("F", "I"), Time = c(NA, 1), cesd01 = c(1, 2), bmastery = c(20, 25)
  )
  expect_message(
    expect_message(long <- transform_lasa_data(long0), "placed at the wave shown: bmastery \\(B/3B\\)"),
    "the cohort of 2 respondent"
  )
  expect_equal(long$Wave, c("B", "F", "3B", "I"), ignore_attr = TRUE)
  wide <- transform_lasa_data(long, format = "wide")
  expect_named(wide, c("respnr", "bmastery", "fcesd01", "icesd01"))
  expect_null(attr(wide$bmastery, "LASA_wave"))
  expect_equal(as.vector(wide$bmastery), c(20, 25))
  # Read back, the column is placed by a guess again, and shows no cohort.
  expect_message(
    expect_message(back <- transform_lasa_data(wide), "placed at the wave shown: bmastery \\(B\\)"),
    "the cohort of 2 respondent"
  )
  expect_true(all(is.na(back$Time)))

  # A single wave's guesses: the wide data's own "LASA_wave" (B) is no LASA
  # file's, so it doesn't place them either.
  b2 <- read_fixture(data.frame(RespNr = c(2001, 2002), BLPHYA01 = c(4, 1)), "LAS2B046.SAV", standardize = FALSE)
  b2_030 <- read_fixture(data.frame(RespNr = c(2001, 2002), BADL1B = c(1, 2)), "LAS2B030.SAV", standardize = FALSE)
  long <- suppressMessages(transform_lasa_data(merge(b2, b2_030, by = "respnr", all = TRUE)))
  wide <- transform_lasa_data(long, format = "wide")
  expect_equal(attr(wide, "LASA_wave"), "B")
  expect_message(
    expect_message(back <- transform_lasa_data(wide), "placed at the wave shown: blphya01 \\(B\\), badl1b \\(B\\)"),
    "the cohort of 2 respondent"
  )
  expect_true(all(is.na(back$Time)))
})

test_that("rows of a LASA file's respondents placed only by a guess get no Time from the file", {
  # A join that keeps the first file's provenance (wave B): the second
  # cohort's respondents of the 2B file only have values placed at wave B
  # by a guess, which doesn't make them first-cohort respondents.
  b <- read_fixture(data.frame(RespNr = c(1001, 1002), BLPHYA01 = c(4, 1)), "LASAB046.SAV", standardize = FALSE)
  b2 <- read_fixture(data.frame(RespNr = c(2001, 2002), BADL1B = c(1, 2)), "LAS2B030.SAV", standardize = FALSE)
  joined <- merge(b, b2, by = "respnr", all = TRUE)
  for (name in c("LASA_file_code", "LASA_wave", "label_report")) attr(joined, name) <- attr(b, name)
  expect_message(
    expect_message(long <- transform_lasa_data(joined), "placed at the wave shown: badl1b \\(B\\)"),
    "the cohort of 2 respondent"
  )
  expect_equal(as.vector(long$Time), c(0, 0, NA, NA))
})

test_that("a guess goes to a wave the respondent's cohort takes part in, also one the label database doesn't document", {
  b4_046 <- read_fixture(data.frame(RespNr = c(401, 402), BLPHYA04 = c(20, 10)), "LAS4B046.SAV", standardize = FALSE)
  b4_152 <- read_fixture(data.frame(RespNr = c(401, 402), DRINKING = c(1, 0)), "LAS4B152.SAV", standardize = FALSE)
  # drinking is documented at waves G to K, which the fourth cohort, shown
  # by the 4B file's values, doesn't take part in.
  expect_message(long <- transform_lasa_data(bind_columns(b4_046, b4_152)), "placed at the wave shown: drinking \\(4B\\)")
  expect_equal(long$Wave, c("4B", "4B"), ignore_attr = TRUE)
  expect_equal(as.vector(long$Time), c(0, 0))
  expect_equal(as.vector(long$drinking), c(1, 0))
})

test_that("values at waves the label database doesn't document for them read back without attributes", {
  # Wave L's files (lhhnch), read with or without standardizing.
  l011 <- data.frame(RespNr = c(1001, 3001), LHHNCH = c(2, 3))
  for (standardize in c(FALSE, TRUE)) {
    expect_message(l <- read_fixture(l011, "LASAL011.SAV", standardize = standardize, format_as_long = TRUE), "the cohort of 2")
    expect_named(l, c("respnr", "Wave", "Time", "hhnch"))
    expect_equal(l$Wave, c("L", "L"), ignore_attr = TRUE)
  }
  # seh_reden at wave K (documented at J only), and drinking at 4B and L:
  # their wide names say the wave, so a .sav file, or a merge, which drop
  # the columns' attributes, don't lose it.
  j <- suppressMessages(read_fixture(data.frame(RespNr = c(1, 2), SEH_REDEN = c(3, 1)), "LASAJ045.SAV", format_as_long = TRUE))
  k <- suppressMessages(read_fixture(data.frame(RespNr = c(1, 2), SEH_REDEN = c(2, 2)), "LASAK045.SAV", format_as_long = TRUE))
  wide <- suppressMessages(transform_lasa_data(rbind(j, k), format = "wide"))
  expect_named(wide, c("respnr", "seh_reden", "kseh_reden"))
  saved <- haven::read_sav(write_transform_sav(wide, "wide.sav"))
  expect_null(attr(saved$kseh_reden, "LASA_wave"))
  back <- suppressMessages(transform_lasa_data(saved))
  expect_equal(back$Wave, c("J", "K", "J", "K"), ignore_attr = TRUE)
  expect_equal(as.vector(back$seh_reden), c(3, 2, 1, 2))
  b4 <- suppressMessages(read_fixture(data.frame(RespNr = c(401, 402), DRINKING = c(1, 0)), "LAS4B152.SAV", format_as_long = TRUE))
  l <- suppressMessages(read_fixture(data.frame(RespNr = c(401, 402), DRINKING = c(0, 0)), "LASAL152.SAV", format_as_long = TRUE))
  wide <- transform_lasa_data(rbind(b4, l), format = "wide")
  expect_named(wide, c("respnr", "b4drinking", "ldrinking"))
  back <- transform_lasa_data(haven::read_sav(write_transform_sav(wide, "wide.sav")))
  expect_equal(back$Wave, c("4B", "L", "4B", "L"), ignore_attr = TRUE)
  expect_equal(as.vector(back$Time), c(0, 1, 0, 1))
})

test_that("a file's waves stacked keep their values at waves the label database documents nothing of the file at", {
  # seh_reden, a name file 045 uses without a wave prefix, is documented at
  # wave J only, and the label database documents nothing of file 045 at
  # wave K. Values the same at J and K, as a column merged in by respnr
  # would hold them, stay at their rows' waves, whichever file comes first.
  read_045 <- function(wave, ids, values) {
    suppressMessages(read_fixture(data.frame(RespNr = ids, SEH_REDEN = values), paste0("LASA", wave, "045.SAV"), format_as_long = TRUE))
  }
  j <- read_045("J", c(1, 2), c(3, 1))
  k <- read_045("K", c(1, 2), c(3, 1))
  for (stacked in list(rbind(j, k), rbind(k, j))) {
    expect_warning(long <- suppressMessages(transform_lasa_data(stacked)), "seh_reden hold the same value on every row")
    expect_equal(paste(long$respnr, long$Wave, long$seh_reden), paste(stacked$respnr, stacked$Wave, stacked$seh_reden))
  }
  # Respondents only at K stay at K.
  stacked <- rbind(read_045("J", 1:3, c(3, 1, 2)), read_045("K", c(1, 4, 5), c(3, 2, 1)))
  long <- suppressWarnings(suppressMessages(transform_lasa_data(stacked)))
  expect_equal(paste(long$respnr, long$Wave, long$seh_reden), c("1 J 3", "2 J 1", "3 J 2", "1 K 3", "4 K 2", "5 K 1"))
})

test_that("a wide file joined first onto long data keeps its columns at its wave, also names without a wave prefix", {
  # A join that keeps the wide file's attributes, as dplyr's joins do with
  # it first: the rows are the long data's, not the file's.
  join_onto <- function(wide, long) {
    joined <- merge(wide, long, by = "respnr")
    for (name in c("LASA_file_code", "LASA_wave", "label_report")) attr(joined, name) <- attr(wide, name)
    joined
  }
  # File 045 also has a wave K, which the label database doesn't document.
  j045 <- read_fixture(
    data.frame(RespNr = 1:3, JHOSP = c(1, 0, 1), SEH_REDEN = c(3, 1, 2), ZIEKAN = c(1, 2, 1)), "LASAJ045.SAV",
    standardize = FALSE
  )
  k046 <- suppressMessages(read_fixture(wave_fixture("046", "K"), "LASAK046.SAV", format_as_long = TRUE))
  long <- suppressMessages(transform_lasa_data(join_onto(j045, k046)))
  expect_equal(paste(long$respnr, long$Wave), c("1 J", "1 K", "2 J", "2 K", "3 J", "3 K"))
  expect_equal(as.vector(long$seh_reden), c(3, NA, 1, NA, 2, NA))
  expect_equal(as.vector(long$ziekan), c(1, NA, 2, NA, 1, NA))

  # File 878 has wave G only: its columns go to G, and the first cohort's
  # rows keep their Time.
  read_long <- function(prefix, filename) {
    suppressMessages(read_fixture(wave_fixture("046", prefix, ids = 1:2), filename, format_as_long = TRUE))
  }
  long046 <- transform_lasa_data(rbind(
    read_long("B", "LASAB046.SAV"), read_long("C", "LASAC046.SAV"), read_long("G", "LASAG046.SAV")
  ))
  g878 <- read_fixture(
    data.frame(RespNr = 1:2, GMSE_SELECTIN = c(10.5, 12.1), SELG878 = c(1, 1)), "LASAG878.SAV",
    standardize = FALSE
  )
  expect_silent(long <- transform_lasa_data(join_onto(g878, long046)))
  expect_equal(paste(long$respnr, long$Wave, long$Time), c("1 B 0", "1 C 1", "1 G 5", "2 B 0", "2 C 1", "2 G 5"))
  expect_equal(!is.na(long$selg878), rep(c(FALSE, FALSE, TRUE), 2))
  expect_named(transform_lasa_data(long, format = "wide"), c(
    "respnr", "gmse_selectin", "selg878", "blphya01", "blphya07", "clphya01", "clphya07", "glphya01", "glphya07"
  ))
})

test_that("blank text, as SPSS stores missing text, holds no value", {
  lab <- c("na, asked" = -1, "no, I cannot" = 1, "only with help" = 2, "yes, without help" = 5)
  read_long <- function(data, filename) suppressMessages(read_fixture(data, filename, format_as_long = TRUE))
  long <- transform_lasa_data(rbind(
    read_long(data.frame(RespNr = c(10001, 10002), BADL1A = haven::labelled(c(5, 2), lab)), "LASAB030.SAV"),
    read_long(data.frame(RespNr = 10001, CADL1A = haven::labelled(5, lab)), "LASAC030.SAV"),
    read_long(data.frame(RespNr = 40001, BADL1A = haven::labelled(5, lab)), "LAS2B030.SAV")
  ))
  expect_type(long$adl1a, "character")
  for (prefix in c("Wave", "Time")) {
    wide <- transform_lasa_data(long, format = "wide", prefix = prefix)
    saved <- haven::read_sav(write_transform_sav(wide, "wide.sav"))
    expect_true(any(vapply(saved, function(x) is.character(x) && any(x == "", na.rm = TRUE), logical(1))))
    back <- suppressMessages(transform_lasa_data(saved))
    expect_equal(paste(back$respnr, back$Wave), c("10001 B", "10001 C", "10002 B", "40001 2B"))
  }
})

test_that("blank text holds no value also as a factor level", {
  # As haven::as_factor(only_labelled = FALSE) gives text read from a .sav
  # file, or read.csv(stringsAsFactors = TRUE).
  text <- data.frame(
    respnr = c(21001, 41001), boak = c("yes", ""), b2oak = c("", "yes"), foak = c("no", "yes"),
    stringsAsFactors = FALSE
  )
  factors <- text
  factors[-1] <- lapply(text[-1], factor)
  expect_equal(levels(factors$b2oak), c("", "yes"))
  long <- transform_lasa_data(factors)
  expect_equal(paste(long$respnr, long$Wave, long$Time), c("21001 B 0", "21001 F 4", "41001 2B 0", "41001 F 1"))
  expect_equal(as.character(long$oak), c("yes", "no", "yes", "yes"))
  from_text <- transform_lasa_data(text)
  expect_equal(paste(from_text$respnr, from_text$Wave, from_text$Time), paste(long$respnr, long$Wave, long$Time))
})

test_that("long columns made of merged wide files get the database's labels back, and the wide files theirs", {
  b <- read_fixture(wave_fixture("046", "B", ids = 1:2), "LASAB046.SAV", standardize = FALSE)
  cc <- read_fixture(wave_fixture("046", "C", ids = 1:2), "LASAC046.SAV", standardize = FALSE)
  wide <- merge(b, cc, by = "respnr")
  expect_null(attr(wide$blphya07, "label"))
  long <- transform_lasa_data(wide)
  expect_named(attr(long$lphya07, "wave_label"), c("B", "C"))
  expect_false(is.null(attr(long$lphya07, "label")))
  expect_false(is.null(attr(long$lphya07, "labels")))
  expect_identical(columns_of(without_tags(transform_lasa_data(long, format = "wide"))), columns_of(wide))
})

test_that("codes listed without wording keep their number as label when labels come back", {
  # File 047's random lists 0, 59 and 99 without wording; read_lasa_sav()
  # names them after their number. rbind() keeps wave B's labels for wave
  # D's rows too, and the database gives each wave its own back.
  b <- read_fixture(data.frame(RespNr = 1:2, BRANDOM = c(0, 59)), "LASAB047.SAV")
  d <- read_fixture(data.frame(RespNr = 1:2, DRANDOM = c(99, 0)), "LASAD047.SAV")
  expect_true(all(c("0", "59", "99") %in% names(attr(d$random, "labels"))))
  long <- transform_lasa_data(rbind(b, d))
  expect_identical(attr(long$random, "labels_wave"), list(B = attr(b$random, "labels_wave"), D = attr(d$random, "labels_wave")))
  wide <- transform_lasa_data(long, format = "wide")
  expect_identical(attr(wide$drandom, "labels_wave"), attr(d$random, "labels_wave"))
  expect_identical(attr(wide$drandom, "wave_label"), attr(d$random, "wave_label"))
})

test_that("labels a user gave a variable are kept, not mixed with the database's", {
  d <- data.frame(respnr = c(1, 1, 2, 2), Wave = c("B", "C", "B", "C"))
  d$lphya01 <- haven::labelled(c(1, 2, 2, 1), c(fit = 1, unfit = 2))
  out <- transform_lasa_data(d)
  expect_identical(attr(out$lphya01, "labels"), c(fit = 1, unfit = 2))
  expect_null(attr(out$lphya01, "wave_label"))

  # Time-prefixed data sets of two cohort groups, with wordings of their
  # own, stacked with rbind(), which keeps the first set's: wave 3B's own is
  # lost, and gets none (not the first set's, nor the database's).
  w12 <- data.frame(respnr = c(1, 2001))
  w12$boak <- structure(c(0, NA), wave_label = "oak at B", label = "oak")
  w12$b2oak <- structure(c(NA, 1), wave_label = "oak at 2B", label = "oak")
  w3 <- data.frame(respnr = 3001)
  w3$b3oak <- structure(1, wave_label = "oak at 3B", label = "oak")
  time_wide <- rbind(
    suppressMessages(transform_lasa_data(w12, format = "wide", prefix = "Time")),
    suppressMessages(transform_lasa_data(w3, format = "wide", prefix = "Time"))
  )
  long <- transform_lasa_data(time_wide)
  expect_identical(attr(long$oak, "wave_label"), c(B = "oak at B", `2B` = "oak at 2B"))
  wide <- transform_lasa_data(long, format = "wide")
  expect_null(attr(wide$b3oak, "wave_label"))
})

test_that("a variable documented with different wordings in several files of a wave gets none of them back", {
  mb010 <- read_fixture(data.frame(RespNr = c(31, 32), BMARST = c(2, 1), BPARTNER = c(1, 0)), "LASMB010.SAV", format_as_long = TRUE)
  mb046 <- read_fixture(data.frame(RespNr = c(31, 32), BLPHYA01 = c(1, 2)), "LASMB046.SAV", format_as_long = TRUE)
  merged <- merge(mb046, mb010, by = c("respnr", "Wave"))
  long <- transform_lasa_data(merged)
  expect_null(attr(long$partner, "label"))
  expect_null(attr(long$partner, "wave_label"))
})

test_that("the cohort columns of four or more merged Time-prefixed data sets are combined, or say what's wrong", {
  time_wide <- function(var, values) {
    d <- data.frame(respnr = c(1, 1, 2, 2), Wave = c("B", "C", "2B", "F"))
    d[[var]] <- values
    transform_lasa_data(d, format = "wide", prefix = "Time")
  }
  sets <- list(
    time_wide("lphya09", c(30, 20, 40, 35)), time_wide("nupers", c(1, 2, 0, 1)),
    time_wide("cesd01", c(0, 1, 2, 3)), time_wide("adl1a", c(1, 1, 2, 2))
  )
  merged <- suppressWarnings(Reduce(function(x, y) merge(x, y, by = "respnr"), sets))
  expect_equal(sum(names(merged) == "cohort.x"), 2L)
  long <- transform_lasa_data(merged)
  expect_named(long, c("respnr", "Wave", "Time", "cohort", "lphya09", "nupers", "cesd01", "adl1a"))
  expect_equal(as.vector(long$Time), c(0, 1, 0, 1))
  expect_identical(as.character(long$cohort), rep(c("cohort 1 (1992)", "cohort 2 (2002)"), each = 2))

  # Copies that disagree are an error naming them by their position ...
  four <- merged
  four[[which(names(four) == "cohort.y")[[2L]]]][[1L]] <- "cohort 2 (2002)"
  expect_error(transform_lasa_data(four), "'cohort.y' \\(column [0-9]+\\) says 'cohort 2 \\(2002\\)'")
  # ... and a copy that names no cohort is another data set's own column.
  own <- merge(sets[[1]], data.frame(respnr = c(1, 2), cohort = c(1920, 1925)), by = "respnr")
  long <- transform_lasa_data(own)
  expect_named(long, c("respnr", "Wave", "Time", "cohort", "lphya09", "cohort.y"))
  expect_equal(long$cohort.y, c(1920, 1920, 1925, 1925))

  # Time columns of four merged long data sets that disagree are named by
  # their position, as several have the same name.
  one <- function(v, time_f) {
    d <- data.frame(respnr = 1, Wave = c("2B", "F"), Time = c(0, time_f))
    d[[v]] <- 1:2
    d
  }
  m <- suppressWarnings(Reduce(
    function(x, y) merge(x, y, by = c("respnr", "Wave")),
    list(one("lphya01", 1), one("adl1b", 1), one("cesd01", 4), one("chair1", 1))
  ))
  expect_error(transform_lasa_data(m), "'Time.x' \\(column 3\\) says 1 and 'Time.x' \\(column 7\\) says 4")
})

test_that("long data that merge() gave copies of a variable warn, as wide data do", {
  b <- suppressMessages(read_fixture(wave_fixture("046", "B", ids = 1), "LASAB046.SAV", format_as_long = TRUE))
  b2 <- suppressMessages(read_fixture(wave_fixture("046", "B", ids = 2001), "LAS2B046.SAV", format_as_long = TRUE))
  merged <- merge(b, b2, by = c("respnr", "Wave"), all = TRUE)
  expect_warning(transform_lasa_data(merged), "lphya01.x, lphya07.x, lphya01.y, lphya07.y look like wave-specific LASA variables renamed by a merge")
})

test_that("the migrant cohort's file of stable variables with a column of its own still has no wave dimension", {
  z <- data.frame(RespNr = c(40001, 40002), SEX = c(1, 2), BYEAR = c(1950, 1955), WEIGHT = c(1.2, 0.8))
  expect_message(mb004 <- read_fixture(z, "LASMB004.SAV", format_as_long = TRUE), "no wave dimension")
  expect_named(mb004, c("respnr", "sex", "byear", "weight"))
})
