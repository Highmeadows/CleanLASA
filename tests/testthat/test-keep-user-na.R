## keep_user_na: missing-value codes are handled the same way for every
## variable type. Fixture: LASAB014 variables of each var_type the database
## knows (categorical, date, text, numeric), each holding
##   row 1: -2 (a documented missing code),
##   row 2: a real answer,
##   row 3: -1 (a documented missing code),
##   row 4: -7 (an undocumented negative value -- still missing).

lasa014_vars <- c(
  categorical = "bhindep", categorical2 = "blrooms", date = "bmomonth",
  text = "bhousem", text2 = "bspec01", numeric = "bfdoor", numeric2 = "bnrooms"
)

lasa014_fixture <- function() {
  vl <- lasa_label_db()$value_labels
  dat <- data.frame(RespNr = 1:4)
  for (v in lasa014_vars) {
    rows <- vl[vl$filecode == "014" & vl$wave == "B" & vl$variable_name == v, ]
    labels <- stats::setNames(rows$value_numeric, rows$value_label)
    answer <- c(rows$value_numeric[rows$value_numeric >= 0], 3)[[1L]]
    dat[[toupper(v)]] <- haven::labelled(c(-2, answer, -1, -7), labels)
  }
  # An SPSS-declared user-missing column the database doesn't document.
  dat$BEXTRA <- haven::labelled_spss(c(1, -9, 2, 3), c(missing = -9), na_values = -9)
  dat
}

read_014 <- function(...) {
  skip_if_not_installed("haven")
  path <- write_lasa_sav(lasa014_fixture(), "LASAB014.SAV")
  read_lasa_sav(path, ...)
}

canonical <- function(v) sub("^b", "", v)

test_that("keep_user_na = FALSE turns every missing code into NA, for every variable type", {
  dat <- read_014()
  for (v in canonical(lasa014_vars)) {
    expect_equal(is.na(dat[[v]]), c(TRUE, FALSE, TRUE, TRUE), info = v)
  }
  expect_true(is.factor(dat$hindep))
  expect_true(is.factor(dat$lrooms))
  expect_true(is.character(dat$housem))
  expect_identical(class(dat$fdoor), "numeric")
  expect_identical(class(dat$nrooms), "numeric")
})

test_that("keep_user_na = FALSE leaves no factor level for a missing code", {
  dat <- read_014()
  vl <- lasa_label_db()$value_labels_harmonized
  for (v in c("hindep", "lrooms")) {
    missing_text <- vl$value_label[vl$filecode == "014" & vl$canonical_name == v & vl$is_missing]
    expect_length(intersect(levels(dat[[v]]), missing_text), 0L)
    expect_false("-7" %in% levels(dat[[v]]), info = v)
  }
})

test_that("keep_user_na = TRUE keeps every missing code, for every variable type", {
  dat <- read_014(keep_user_na = TRUE)

  # Factors and label text: the missing code's label, never NA.
  for (v in c("hindep", "lrooms", "momonth", "housem", "spec01")) {
    expect_false(anyNA(as.character(dat[[v]])), info = v)
  }
  harmonized <- lasa_label_db()$value_labels_harmonized
  na_asked <- harmonized$value_label[
    harmonized$filecode == "014" & harmonized$canonical_name == "hindep" & harmonized$value_numeric == -1
  ]
  expect_equal(as.character(dat$hindep)[[3L]], na_asked)
  # An undocumented negative code is still kept, as its own number.
  expect_equal(as.character(dat$hindep)[[4L]], "-7")
  wave_labels <- lasa_label_db()$value_labels
  see_bmoved <- wave_labels$value_label[
    wave_labels$filecode == "014" & wave_labels$wave == "B" &
      wave_labels$variable_name == "bhousem" & wave_labels$value_numeric == -2
  ]
  expect_equal(dat$housem[[1L]], see_bmoved)

  # Numeric variables can't hold text: the raw code, declared user-missing.
  for (v in c("fdoor", "nrooms")) {
    x <- dat[[v]]
    expect_s3_class(x, "haven_labelled_spss")
    expect_equal(as.vector(unclass(x))[c(1L, 3L, 4L)], c(-2, -1, -7), info = v)
    expect_equal(is.na(x), c(TRUE, FALSE, TRUE, TRUE), info = v)
    expect_true(all(c(-2, -1, -7) %in% attr(x, "na_values")), info = v)
    expect_equal(is.na(haven::zap_missing(x)), c(TRUE, FALSE, TRUE, TRUE), info = v)
  }
})

test_that("keep_user_na applies when to_factor/to_numeric are off", {
  off <- read_014(to_factor = FALSE, to_numeric = FALSE)
  kept <- read_014(to_factor = FALSE, to_numeric = FALSE, keep_user_na = TRUE)
  for (v in canonical(lasa014_vars)) {
    expect_equal(is.na(off[[v]]), c(TRUE, FALSE, TRUE, TRUE), info = v)
    expect_false(inherits(off[[v]], "haven_labelled_spss"), info = v)
    expect_s3_class(kept[[v]], "haven_labelled_spss")
    expect_equal(as.vector(unclass(kept[[v]]))[c(1L, 3L, 4L)], c(-2, -1, -7), info = v)
  }
})

test_that("an undocumented column follows its own SPSS user-missing declaration", {
  dropped <- read_014()$bextra
  expect_false(inherits(dropped, "haven_labelled_spss"))
  expect_equal(as.vector(unclass(dropped)), c(1, NA, 2, 3))
  kept <- read_014(keep_user_na = TRUE)$bextra
  expect_s3_class(kept, "haven_labelled_spss")
  expect_equal(as.vector(unclass(kept)), c(1, -9, 2, 3))
})

test_that("apply_lasa_labels() takes keep_user_na too", {
  raw <- lasa014_fixture()
  names(raw) <- tolower(names(raw))
  dropped <- apply_lasa_labels(raw, filecode = "014", wave = "B")
  kept <- apply_lasa_labels(raw, filecode = "014", wave = "B", keep_user_na = TRUE)
  expect_equal(is.na(dropped$lrooms), c(TRUE, FALSE, TRUE, TRUE))
  expect_false(anyNA(kept$lrooms))
  expect_error(
    apply_lasa_labels(raw, filecode = "014", wave = "B", keep_user_na = NA),
    "'keep_user_na' must be TRUE or FALSE"
  )
})

test_that("re-labelling kept output with keep_user_na = FALSE blanks its missing codes", {
  kept <- read_014(keep_user_na = TRUE)
  direct <- read_014()
  for (to_factor in c(TRUE, FALSE)) {
    relabelled <- apply_lasa_labels(kept, keep_user_na = FALSE, to_factor = to_factor)
    # Factors and label text: the same result as reading with FALSE
    # directly -- real answers unchanged, every missing code (documented or
    # an undocumented "-7") blanked, and no level left for it.
    for (v in c("hindep", "lrooms", "momonth", "housem", "spec01")) {
      expect_identical(as.character(relabelled[[v]]), as.character(direct[[v]]), info = v)
    }
    for (v in c("hindep", "lrooms", "momonth")) {
      expect_identical(levels(relabelled[[v]]), levels(direct[[v]]), info = v)
    }
    for (v in c("fdoor", "nrooms")) {
      expect_equal(is.na(relabelled[[v]]), c(TRUE, FALSE, TRUE, TRUE), info = v)
    }
  }
})

test_that("re-labelling converted output never re-codes it", {
  for (keep in c(FALSE, TRUE)) {
    first <- read_014(keep_user_na = keep)
    again <- apply_lasa_labels(first, keep_user_na = keep)
    for (v in c("hindep", "lrooms", "momonth", "housem")) {
      expect_identical(as.character(again[[v]]), as.character(first[[v]]), info = paste(v, keep))
    }
  }
})

test_that("keep_user_na = TRUE keeps a column's SPSS variable label and format", {
  raw <- lasa014_fixture()
  names(raw) <- tolower(names(raw))
  raw$bfdoor <- haven::labelled(c(-2, 3, -1, -7), c(`na, asked` = -1), label = "Floor of front door")
  attr(raw$bfdoor, "format.spss") <- "F2.0"
  for (to_numeric in c(TRUE, FALSE)) {
    kept <- apply_lasa_labels(
      raw, filecode = "014", wave = "B", standardize = FALSE,
      to_factor = FALSE, to_numeric = to_numeric, keep_user_na = TRUE
    )
    expect_s3_class(kept$bfdoor, "haven_labelled_spss")
    expect_identical(attr(kept$bfdoor, "format.spss"), "F2.0")
    expect_false(is.null(attr(kept$bfdoor, "label")))
  }
})

test_that("blanking keeps an integer column integer", {
  raw <- data.frame(respnr = 1:3)
  raw$blrooms <- haven::labelled(c(-1L, 1L, 0L), c(no = 0L, yes = 1L, `na, asked` = -1L))
  out <- apply_lasa_labels(raw, filecode = "014", wave = "B", standardize = FALSE, to_factor = FALSE)
  expect_type(unclass(out$blrooms), "integer")
  expect_equal(as.vector(unclass(out$blrooms)), c(NA, 1L, 0L))
})

test_that("a date column is never treated as missing-coded", {
  raw <- data.frame(respnr = 1:2)
  raw$bmomonth <- as.Date(c("1965-03-01", "1993-01-01"))
  for (keep in c(FALSE, TRUE)) {
    out <- apply_lasa_labels(raw, filecode = "014", wave = "B", standardize = FALSE, keep_user_na = keep)
    expect_s3_class(out$bmomonth, "Date")
    expect_equal(as.vector(unclass(out$bmomonth)), as.vector(unclass(raw$bmomonth)))
  }
})

test_that("the deprecated user_na argument still works, with a warning", {
  skip_if_not_installed("haven")
  path <- write_lasa_sav(lasa014_fixture(), "LASAB014.SAV")
  expect_warning(
    old <- read_lasa_sav(path, user_na = TRUE),
    "'user_na' is deprecated; use 'keep_user_na'"
  )
  expect_identical(old$lrooms, read_lasa_sav(path, keep_user_na = TRUE)$lrooms)
  expect_error(
    read_lasa_sav(path, read_sav_args = list(user_na = FALSE)),
    "keep_user_na"
  )
})
