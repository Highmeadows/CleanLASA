topic_db_fixture <- data.frame(
  theme = c("Physical", "Physical", "Physical"),
  subtheme = c("Lifestyle", "Lifestyle", "Lifestyle"),
  topic = c(
    "Physical activity",
    "Daily Physical Activity",
    "Undocumented physical measure"
  ),
  filecode = c("046", "162", "999"),
  waves = c("B, C, D", "J", "K"),
  has_varinfo = c(TRUE, TRUE, FALSE),
  stringsAsFactors = FALSE
)

varinfo_index_fixture <- data.frame(
  filecode = c("046", "162"),
  varinfo_url = c(
    "https://lasa-vu.nl/wp-content/uploads/2021/03/LASA046_varinfo.pdf",
    "https://lasa-vu.nl/wp-content/uploads/2024/01/LASA162_varinfo.pdf"
  ),
  stringsAsFactors = FALSE
)

local_var_info_mocks <- function() {
  local_mocked_bindings(
    .lasa_topic_database = function() topic_db_fixture,
    .lasa_varinfo_index = function(...) varinfo_index_fixture,
    .env = parent.frame()
  )
}

test_that("file codes are extracted from LASA wave cells", {
  expect_equal(
    .lasa_extract_filecodes("030 230 603 703"),
    c("030", "230", "603", "703")
  )
  expect_equal(
    .lasa_extract_filecodes("zoa1 zoa2 zoa3"),
    c("zoa1", "zoa2", "zoa3")
  )
  expect_equal(.lasa_extract_filecodes("-"), character())
  expect_equal(.lasa_extract_filecodes("X"), character())
})

test_that("lasa_var_info resolves file-code and filename variations", {
  local_var_info_mocks()

  expected <- varinfo_index_fixture$varinfo_url[[1L]]
  inputs <- c(
    "046",
    "LASA046",
    "LASA 046",
    "lasa_046",
    "LASA046.sav",
    "LASA046_varinfo.pdf"
  )

  for (input in inputs) {
    expect_equal(
      lasa_var_info(input, open = FALSE),
      expected,
      info = input
    )
  }
})

test_that("lasa_var_info resolves exact, incomplete, and fuzzy topic names", {
  local_var_info_mocks()

  expected <- varinfo_index_fixture$varinfo_url[[1L]]

  expect_equal(
    lasa_var_info("Physical activity", open = FALSE),
    expected
  )
  expect_equal(
    lasa_var_info("physical activity", open = FALSE),
    expected
  )
  expect_equal(
    lasa_var_info("physical act", open = FALSE),
    expected
  )
  expect_equal(
    lasa_var_info("phisical activity", open = FALSE),
    expected
  )
})

test_that("lasa_var_info reports missing online documentation", {
  local_var_info_mocks()

  expect_error(
    lasa_var_info("999", open = FALSE),
    "No variable-information PDF is linked on the LASA website"
  )
  expect_error(
    lasa_var_info(
      "Undocumented physical measure",
      open = FALSE
    ),
    "No variable-information PDF is linked on the LASA website"
  )
})

test_that("lasa_var_info rejects an unknown topic or file code", {
  local_var_info_mocks()

  expect_error(
    lasa_var_info("not a LASA topic", open = FALSE),
    "No LASA file code or topic matched"
  )
})

test_that("lasa_var_info prefers a canonical PDF for an exact file code", {
  local_mocked_bindings(
    .lasa_topic_database = function() topic_db_fixture[1L, , drop = FALSE],
    .lasa_varinfo_index = function(...) {
      data.frame(
        filecode = "046",
        varinfo_url = paste(
          "https://lasa-vu.nl/uploads/LASA046_appendix_varinfo.pdf",
          "https://lasa-vu.nl/uploads/LASA046_varinfo.pdf",
          sep = "; "
        ),
        stringsAsFactors = FALSE
      )
    }
  )

  expect_equal(
    lasa_var_info("046", open = FALSE),
    "https://lasa-vu.nl/uploads/LASA046_varinfo.pdf"
  )
})

test_that("lasa_var_info() no longer has a viewer argument", {
  expect_false("viewer" %in% names(formals(lasa_var_info)))
})
