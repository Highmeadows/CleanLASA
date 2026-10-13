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

test_that("prefix = \"Time\" names wide columns t<Time>_<variable>, with a Baseline column, and they convert back", {
  wide <- data.frame(respnr = c(101, 102), sex = c(1, 2), boak = c(0, 2), coak = c(1, 8))
  long <- transform_lasa_data(wide)

  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_named(time_wide, c("respnr", "Baseline", "sex", "t0_oak", "t1_oak"))
  expect_equal(time_wide$Baseline, c("B", "B"), ignore_attr = TRUE)
  expect_equal(attr(time_wide$Baseline, "label"), "LASA baseline wave of the respondent's cohort")
  expect_equal(time_wide$t1_oak, c(1, 8), ignore_attr = TRUE)

  # Back in long format, the Baseline column stays, as a column that holds
  # for every wave ...
  long_again <- transform_lasa_data(time_wide)
  expect_named(long_again, c("respnr", "Wave", "Time", "Baseline", "sex", "oak"))
  expect_identical(columns_of(without_store(long_again))[names(long)], columns_of(without_store(long)))
  expect_equal(long_again$Baseline, rep("B", 4), ignore_attr = TRUE)
  # ... so Time-prefixed wide format gives the same columns again ...
  expect_identical(
    columns_of(transform_lasa_data(long_again, format = "wide", prefix = "Time")),
    columns_of(time_wide)
  )
  # ... and wave prefixes the original ones, with the Baseline column.
  back <- transform_lasa_data(long_again, format = "wide")
  expect_named(back, c("respnr", "Baseline", "sex", "boak", "coak"))
  expect_identical(columns_of(back)[names(wide)], columns_of(wide))
})

test_that("Time-prefixed columns of several cohorts are shared, and each respondent's go back to their own waves", {
  long <- data.frame(
    respnr = c(1, 1, 1, 2, 2, 3, 3, 4, 4),
    Wave = c("B", "C", "F", "2B", "F", "3B", "I", "MB", "I"),
    lphya01 = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
  )
  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_named(time_wide, c("respnr", "Baseline", "t0_lphya01", "t1_lphya01", "t4_lphya01"))
  expect_equal(time_wide$Baseline, c("B", "2B", "3B", "MB"), ignore_attr = TRUE)
  expect_equal(time_wide$t0_lphya01, c(1, 4, 6, 8), ignore_attr = TRUE)
  expect_equal(time_wide$t1_lphya01, c(2, 5, 7, 9), ignore_attr = TRUE)
  expect_equal(time_wide$t4_lphya01, c(3, NA, NA, NA), ignore_attr = TRUE)

  back <- transform_lasa_data(time_wide)
  expect_equal(back$Wave, long$Wave, ignore_attr = TRUE)
  expect_identical(as.vector(back$Time), c(0L, 1L, 4L, 0L, 1L, 0L, 1L, 0L, 1L))
  expect_equal(back$lphya01, long$lphya01, ignore_attr = TRUE)

  # Without the Baseline column, the waves of Time-prefixed columns are
  # unknown: they are kept as they are, with a warning (and no second
  # message saying 'data' has no wave-specific columns).
  time_wide$Baseline <- NULL
  expect_warning(
    out <- transform_lasa_data(time_wide),
    "t0_lphya01, t1_lphya01, t4_lphya01 look like the Time-prefixed columns"
  )
  expect_named(out, names(time_wide))

  # A value at a Time its respondent's cohort doesn't have is an error.
  time_wide <- data.frame(respnr = 1, Baseline = "4B", t2_lphya01 = 1)
  expect_error(transform_lasa_data(time_wide), "cohort \\(see the 'Baseline' column\\) has no wave with Time 2")
})

test_that("a Z file read with read_lasa_sav() becomes long, with labels per wave", {
  zoa1 <- read_fixture(oa_fixture(), "lasazoa1.SAV")
  long <- transform_lasa_data(zoa1)

  expect_s3_class(long, "tbl_df")
  expect_named(long, c("respnr", "Wave", "Time", "oak", "oah"))
  expect_equal(long$respnr, rep(1:3, each = 3), ignore_attr = TRUE)
  expect_equal(long$Wave, rep(c("B", "C", "D"), 3), ignore_attr = TRUE)
  expect_identical(as.vector(long$Time), rep(0:2, 3))

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
  # rbind() dropped the factors' labels; they come back from the label
  # database, each wave's own.
  expect_null(attr(long$lphya01, "label"))
  expect_equal(attr(wide$clphya01, "label"), "Physical condition respondent: observation")
  expect_equal(attr(wide$cadl1b, "wave_label"), "Stairs: using aid (C/D/EADL1A > 1)")
  expect_equal(attr(wide$badl1b, "wave_label"), "Stairs: using aid (BADL1A > 1)")

  time_wide <- transform_lasa_data(long, format = "wide", prefix = "Time")
  expect_named(time_wide, c(
    "respnr", "Baseline", "t0_lphya01", "t0_lphya07", "t0_adl1a", "t0_adl1b",
    "t1_lphya01", "t1_lphya07", "t1_adl1a", "t1_adl1b"
  ))
  expect_equal(time_wide$Baseline, rep("B", 3), ignore_attr = TRUE)

  for (back in list(transform_lasa_data(wide), transform_lasa_data(time_wide))) {
    expect_equal(
      setdiff(names(back), "Baseline"),
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
  expect_equal(long$Wave, rep(c("B", "C"), 3), ignore_attr = TRUE)
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
  expect_named(time_wide, c("respnr", "Baseline", "t0_lphya01", "t1_lphya01"))
  expect_equal(time_wide$Baseline, "4B", ignore_attr = TRUE)
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
  expect_equal(time_wide$Baseline, c("2B", "B"), ignore_attr = TRUE)
  expect_named(time_wide, c("respnr", "Baseline", "t1_lphya01", "t4_lphya01"))

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
    transform_lasa_data(data.frame(respnr = 1, Wave = "F", lphya01 = 1), format = "wide", prefix = "Time"),
    "Time-prefixed wide format needs the Time of every value, but 1 respondent\\(s\\) have values at waves without one \\(e.g. respondent 1 at wave F\\)"
  )
  expect_error(
    transform_lasa_data(data.frame(respnr = 1, Baseline = "C", lphya01 = 1, Wave = "B"), format = "wide", prefix = "Time"),
    "'Baseline' column of its own"
  )
})

test_that("missing-value codes at waves before a respondent's cohort joined don't count as its waves", {
  # LASAZ010 gives the second cohort "no observation birth cohorts
  # 1938-1947" at waves A-E, which LASA marks as a missing-value code.
  z010 <- read_fixture(
    data.frame(
      RespNr = c(2001, 2002), AMARST = -8, BMARST = -8, CMARST = -8, DMARST = -8, EMARST = -8,
      FMARST = c(2, 1)
    ),
    "LASAZ010.SAV"
  )
  expect_true(all(as.character(z010$cmarst) == "no observation birth cohorts 1938-1947"))
  # b2oak shows the respondents are of the second cohort.
  wide <- merge(z010, data.frame(respnr = c(2001, 2002), b2oak = c(0, 1)), by = "respnr")
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
  expect_named(time_wide, c("respnr", "Baseline", "amarst", "t0_oak", "t1_marst"))
  expect_equal(time_wide$Baseline, c("2B", "2B"), ignore_attr = TRUE)

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

test_that("guessed waves don't count as a respondent's waves", {
  # Merged by respnr, LASAZDC2's b_dm could be any cohort's baseline: a
  # guess, which doesn't make the respondents first-cohort.
  z010 <- read_fixture(data.frame(RespNr = c(2001, 2002), EMARST = -8, FMARST = c(2, 1)), "LASAZ010.SAV")
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
    "respnr", "Baseline",
    paste0(rep(c("t0_", "t1_", "t4_"), each = 4), c("lphya01", "lphya07", "adl1a", "adl1b"))
  ))
  expect_equal(time_wide$Baseline, c("B", "B", "2B", "2B", "2B", "B"), ignore_attr = TRUE)
  # Time 1 is wave C for the first cohort, wave F for the second.
  expect_equal(as.character(time_wide$t1_lphya01), c("21", "22", "44", "45", "46", "23"))

  for (wide_data in list(wide, time_wide)) {
    back <- transform_lasa_data(wide_data)
    expect_equal(setdiff(names(back), "Baseline"), names(long))
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
  # cohort's baseline file.
  b2 <- read_fixture(
    data.frame(RespNr = c(11, 12), BADL1A = c(4, -1), BADL1B = c(1, -1)), "LAS2B030.SAV",
    format_as_long = TRUE
  )
  expect_equal(b2$Wave, c("2B", "2B"), ignore_attr = TRUE)
  expect_identical(as.vector(b2$Time), c(0L, 0L))
  # A file of a wave several cohorts take part in doesn't show the cohort,
  expect_message(
    f <- read_fixture(data.frame(RespNr = c(11, 12), FADL1A = c(4, -1)), "LASAF030.SAV", format_as_long = TRUE),
    "nothing in 'data' shows the cohort of 2 respondent"
  )
  expect_true(all(is.na(f$Time)))
  # but stacked with the baseline file, the baseline rows' Time does.
  long <- transform_lasa_data(rbind(b2[c("respnr", "Wave", "Time", "adl1a")], f))
  expect_identical(as.vector(long$Time), c(0L, 0L, 1L, 1L))
})

test_that("a 'Baseline' column must give each respondent one baseline wave", {
  long <- data.frame(
    respnr = c(1, 1, 2, 2), Wave = c("F", "G", "F", "G"), Baseline = c("2B", "2B", "B", NA), lphya01 = 1:4
  )
  expect_identical(as.vector(transform_lasa_data(long)$Time), c(1L, 2L, 4L, 5L))
  long$Baseline[[3L]] <- "B2"
  expect_error(transform_lasa_data(long), "it says 'B2' for respondent 2")
  long$Baseline <- c("2B", "B", NA, NA)
  expect_error(transform_lasa_data(long), "gives respondent 1 several baseline waves \\(2B and B\\)")
  # A column named Baseline that holds something else is an ordinary column.
  long$Baseline <- c(5, 6, 7, 8)
  expect_message(out <- transform_lasa_data(long), "nothing in 'data' shows the cohort")
  expect_equal(out$Baseline, c(5, 6, 7, 8))
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

test_that("Time-prefixed wide data sets merged by respnr convert back with their Baseline columns", {
  pa <- transform_lasa_data(
    data.frame(respnr = c(1, 1), Wave = c("B", "C"), lphya09 = c(30, 20)),
    format = "wide", prefix = "Time"
  )
  adl <- transform_lasa_data(
    data.frame(respnr = c(1, 1), Wave = c("B", "C"), nupers = c(1, 2)),
    format = "wide", prefix = "Time"
  )
  merged <- merge(pa, adl, by = "respnr")
  expect_named(merged, c("respnr", "Baseline.x", "t0_lphya09", "t1_lphya09", "Baseline.y", "t0_nupers", "t1_nupers"))
  expect_silent(out <- transform_lasa_data(merged))
  expect_named(out, c("respnr", "Wave", "Time", "Baseline", "lphya09", "nupers"))
  expect_equal(out$Wave, c("B", "C"), ignore_attr = TRUE)
  expect_equal(out$nupers, c(1, 2), ignore_attr = TRUE)
  adl$Baseline[] <- "2B"
  expect_error(
    transform_lasa_data(merge(pa, adl, by = "respnr")),
    "'Baseline.x' says B and 'Baseline.y' says 2B"
  )
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
  expect_equal(wide$Baseline, c(NA_character_, NA_character_), ignore_attr = TRUE)
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
  ids <- c(40001, 40002)
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
  b2 <- read_fixture(data.frame(RespNr = c(20001, 20002), BLPHYA01 = c(4, 1)), "LAS2B046.SAV", standardize = FALSE)
  b2_030 <- read_fixture(data.frame(RespNr = c(20001, 20002), BADL1B = c(1, 2)), "LAS2B030.SAV", standardize = FALSE)
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
  b <- read_fixture(data.frame(RespNr = c(10001, 10002), BLPHYA01 = c(4, 1)), "LASAB046.SAV", standardize = FALSE)
  b2 <- read_fixture(data.frame(RespNr = c(20001, 20002), BADL1B = c(1, 2)), "LAS2B030.SAV", standardize = FALSE)
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
  l011 <- data.frame(RespNr = c(10001, 30001), LHHNCH = c(2, 3))
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

test_that("blank text, as SPSS stores missing text, holds no value", {
  lab <- c("na, asked" = -1, "no, I cannot" = 1, "only with help" = 2, "yes, without help" = 5)
  read_long <- function(data, filename) suppressMessages(read_fixture(data, filename, format_as_long = TRUE))
  long <- transform_lasa_data(rbind(
    read_long(data.frame(RespNr = c(10001, 10002), BADL1A = haven::labelled(c(5, 2), lab)), "LASAB030.SAV"),
    read_long(data.frame(RespNr = 10001, CADL1A = haven::labelled(5, lab)), "LASAC030.SAV"),
    read_long(data.frame(RespNr = 20001, BADL1A = haven::labelled(5, lab)), "LAS2B030.SAV")
  ))
  expect_type(long$adl1a, "character")
  for (prefix in c("Wave", "Time")) {
    wide <- transform_lasa_data(long, format = "wide", prefix = prefix)
    saved <- haven::read_sav(write_transform_sav(wide, "wide.sav"))
    expect_true(any(vapply(saved, function(x) is.character(x) && any(x == "", na.rm = TRUE), logical(1))))
    back <- suppressMessages(transform_lasa_data(saved))
    expect_equal(paste(back$respnr, back$Wave), c("10001 B", "10001 C", "10002 B", "20001 2B"))
  }
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

test_that("the Baseline columns of four or more merged Time-prefixed data sets are combined, or say what's wrong", {
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
  expect_equal(sum(names(merged) == "Baseline.x"), 2L)
  long <- transform_lasa_data(merged)
  expect_named(long, c("respnr", "Wave", "Time", "Baseline", "lphya09", "nupers", "cesd01", "adl1a"))
  expect_equal(as.vector(long$Time), c(0, 1, 0, 1))

  # A copy with a value that is no baseline wave is an error naming it ...
  two <- merge(sets[[1]], sets[[2]], by = "respnr")
  two$Baseline.y[[1]] <- "B2"
  expect_error(transform_lasa_data(two), "'Baseline.y' column of baseline waves, but it says 'B2' for respondent 1")
  # ... and one without any baseline wave another data set's own column.
  own <- merge(sets[[1]], data.frame(respnr = c(1, 2), Baseline = c(12, 17)), by = "respnr")
  long <- transform_lasa_data(own)
  expect_named(long, c("respnr", "Wave", "Time", "Baseline", "lphya09", "Baseline.y"))
  expect_equal(long$Baseline.y, c(12, 12, 17, 17))

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
