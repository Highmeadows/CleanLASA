## Value codes harmonized across waves (issue #27): answer labels that
## differ between waves make a variable text, a missing-value code whose
## meaning differs between waves moves to a free code (-9, -99, ...) for
## its later meaning, and kept missing codes are SPSS user-missing values
## with their own labels.

db_rows <- function(table, ...) {
  keep <- Reduce(`&`, Map(function(col, value) table[[col]] %in% value, names(list(...)), list(...)))
  table[keep, , drop = FALSE]
}

test_that("a missing code whose meaning changes between waves moves to -9 for its later meaning", {
  db <- lasa_label_db()
  h <- db_rows(db$value_labels_harmonized, filecode = "272", canonical_name = "fadied")
  expect_equal(h$value_label[h$value_numeric == -4], "short version")
  expect_equal(h$value_label[h$value_numeric == -9], "do not know")
  expect_true(h$is_missing[h$value_numeric == -9])
  cw <- db_rows(db$value_labels_crosswalk, filecode = "272", variable_name = "dfadied", value_numeric = -4)
  expect_equal(cw$harmonized_numeric, -9)
  # No harmonized label joins several waves' labels any more.
  expect_false(any(grepl(" / ", db_rows(db$value_labels_harmonized, filecode = "161")$value_label)))
})

test_that("answers coded differently between waves make the variable text", {
  v <- lasa_label_db()$variables
  for (cn in c("mheightp", "mheightp2", "mweightp", "mhipp", "mgriplp")) {
    expect_equal(unique(v$var_type[v$filecode == "161" & v$canonical_name == cn]), "text", info = cn)
  }
})

test_that("categorical items no longer typed numeric", {
  v <- unique(lasa_label_db()$variables[c("filecode", "canonical_name", "var_type")])
  type_of <- function(fc, cn) v$var_type[v$filecode == fc & v$canonical_name == cn]
  for (cn in c("incon9", "incon10", "cva02", "cva02b", "hart06", "kneep5", "kneep9")) {
    expect_true(type_of("035", cn) %in% c("categorical", "text"), info = cn)
  }
  for (cn in c("mgriplp3", "mgriplp4", "mgriprp3", "mgriprp4", "mweightp7", "rm161")) {
    expect_true(type_of("161", cn) %in% c("categorical", "text"), info = cn)
  }
  # Years of education, with each number of years' level as its label.
  expect_equal(type_of("z004", "aedu"), "numeric")
})

test_that("standardize reads a moved missing code in the harmonized coding", {
  d <- data.frame(respnr = 1:4, dfadied = c(1, 2, -4, -5))
  coded <- apply_lasa_labels(d, filecode = "272", wave = "D", to_factor = FALSE, keep_user_na = TRUE)
  expect_s3_class(coded$fadied, "haven_labelled_spss")
  expect_equal(as.vector(unclass(coded$fadied)), c(1, 2, -9, -4))
  expect_equal(names(attr(coded$fadied, "labels"))[attr(coded$fadied, "labels") == -9], "do not know")
  expect_equal(is.na(coded$fadied), c(FALSE, FALSE, TRUE, TRUE))

  # Without standardize, the wave's own codes and labels.
  own <- apply_lasa_labels(d, filecode = "272", wave = "D", standardize = FALSE, to_factor = FALSE, keep_user_na = TRUE)
  expect_equal(as.vector(unclass(own$dfadied)), c(1, 2, -4, -5))
  expect_equal(names(attr(own$dfadied, "labels"))[attr(own$dfadied, "labels") == -4], "do not know")
})

test_that("keep_user_na = TRUE keeps a to_factor variable's missing labels as user-missing text", {
  cc <- apply_lasa_labels(data.frame(respnr = 1:4, cfadied = c(1, 2, -4, -1)), filecode = "272", wave = "C", keep_user_na = TRUE)
  d <- apply_lasa_labels(data.frame(respnr = 1:4, dfadied = c(1, 2, -4, -5)), filecode = "272", wave = "D", keep_user_na = TRUE)
  expect_s3_class(d$fadied, "haven_labelled_spss")
  expect_equal(as.character(cc$fadied), c("not died", "died", "short version", "na, asked"))
  expect_equal(as.character(d$fadied), c("not died", "died", "do not know", "short version"))
  expect_equal(is.na(d$fadied), c(FALSE, FALSE, TRUE, TRUE))
  # The missing labels can still be had as categories, or as NA.
  skip_if_not_installed("labelled")
  expect_equal(as.character(labelled::to_factor(d$fadied)), c("not died", "died", "do not know", "short version"))
  expect_equal(levels(labelled::to_factor(d$fadied))[1:2], c("not died", "died"))
  expect_equal(as.character(labelled::to_factor(d$fadied, user_na_to_na = TRUE)), c("not died", "died", NA, NA))
  expect_equal(levels(labelled::to_factor(d$fadied, user_na_to_na = TRUE)), c("not died", "died"))
})

test_that("keep_user_na = FALSE gives a factor without missing levels, as before", {
  d <- apply_lasa_labels(data.frame(respnr = 1:4, dfadied = c(1, 2, -4, -5)), filecode = "272", wave = "D")
  expect_s3_class(d$fadied, "factor")
  expect_equal(levels(d$fadied), c("not died", "died"))
  expect_equal(as.character(d$fadied), c("not died", "died", NA, NA))
})

test_that("re-labelling kept text with keep_user_na = FALSE drops its missing labels", {
  kept <- apply_lasa_labels(data.frame(respnr = 1:4, dfadied = c(1, 2, -4, -5)), filecode = "272", wave = "D", keep_user_na = TRUE)
  again <- apply_lasa_labels(kept, keep_user_na = TRUE)
  expect_identical(unclass(again$fadied), unclass(kept$fadied))
  dropped <- apply_lasa_labels(kept, keep_user_na = FALSE)
  expect_s3_class(dropped$fadied, "factor")
  expect_equal(as.character(dropped$fadied), c("not died", "died", NA, NA))
  expect_equal(levels(dropped$fadied), c("not died", "died"))
})

test_that("a text variable's levels are every wave's answers, the same at every wave", {
  b2 <- apply_lasa_labels(data.frame(respnr = 1:3, bmheightp2 = c(1, 2, -1)), filecode = "161", wave = "2B")
  cc <- apply_lasa_labels(data.frame(respnr = 1:3, cmheightp2 = c(1, 2, -1)), filecode = "161", wave = "C")
  # 2B codes 1 = "yes", 2 = "no"; C the other way round.
  expect_equal(as.character(b2$mheightp2), c("yes", "no", NA))
  expect_equal(as.character(cc$mheightp2), c("no", "yes", NA))
  expect_identical(levels(b2$mheightp2), levels(cc$mheightp2))
  expect_true(all(c("yes", "no") %in% levels(cc$mheightp2)))
  # With standardize = FALSE, the wave's own labels.
  own <- apply_lasa_labels(data.frame(respnr = 1:3, cmheightp2 = c(1, 2, -1)), filecode = "161", wave = "C", standardize = FALSE)
  expect_equal(levels(own$cmheightp2), c("no", "yes"))
  # to_factor = FALSE under standardize: plain text.
  txt <- apply_lasa_labels(data.frame(respnr = 1:3, cmheightp2 = c(1, 2, -1)), filecode = "161", wave = "C", to_factor = FALSE)
  expect_equal(as.vector(txt$mheightp2), c("no", "yes", NA))
})

test_that("codes sharing one label are one factor level", {
  z <- apply_lasa_labels(data.frame(respnr = 1:4, anation = c(19, 23, 8, 31)), filecode = "z004", wave = "B")
  expect_equal(as.character(z$anation), c("Italian", "Italian", "US", "US"))
  expect_equal(sum(levels(z$anation) == "Italian"), 1L)
  expect_false(any(grepl("\\[", levels(z$anation))))
})

test_that("a missing label and an answer that share text stay apart", {
  levels <- .lasa_code_levels(c(-1, 1), c(no = -1, no = 1), missing_codes = -1)
  expect_equal(levels$text, c("no [-1]", "no [1]"))
})

test_that("waves stacked in long format keep their user-missing text", {
  read_long <- function(data, filename) {
    suppressMessages(read_lasa_sav(write_lasa_sav(data, filename), format_as_long = TRUE, keep_user_na = TRUE))
  }
  skip_if_not_installed("haven")
  long <- transform_lasa_data(rbind(
    read_long(data.frame(RespNr = 1:2, CFADIED = c(1, -4)), "LASAC272.SAV"),
    read_long(data.frame(RespNr = 1:2, DFADIED = c(2, -4)), "LASAD272.SAV")
  ))
  expect_s3_class(long$fadied, "haven_labelled_spss")
  got <- stats::setNames(as.character(long$fadied), paste(long$respnr, long$Wave))
  expect_equal(got[c("1 C", "1 D", "2 C", "2 D")], c(`1 C` = "not died", `1 D` = "died", `2 C` = "short version", `2 D` = "do not know"))
  expect_equal(is.na(long$fadied), long$respnr == 2)
})
