varinfo_fixture <- data.frame(
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
  varinfo_url = c(
    "https://lasa-vu.nl/wp-content/uploads/2021/03/LASA046_varinfo.pdf",
    "https://lasa-vu.nl/wp-content/uploads/2024/01/LASA162_varinfo.pdf",
    NA_character_
  ),
  topic_url = c(
    "https://lasa-vu.nl/topics/physical-activity/",
    "https://lasa-vu.nl/topics/daily-physical-activity/",
    "https://lasa-vu.nl/topics/undocumented-physical-measure/"
  ),
  stringsAsFactors = FALSE
)

test_that("lasa_var_info resolves file-code and filename variations", {
  local_mocked_bindings(
    .lasa_topic_index = function(...) varinfo_fixture
  )

  expected <- varinfo_fixture$varinfo_url[[1L]]
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
  local_mocked_bindings(
    .lasa_topic_index = function(...) varinfo_fixture
  )

  expected <- varinfo_fixture$varinfo_url[[1L]]

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
  local_mocked_bindings(
    .lasa_topic_index = function(...) varinfo_fixture
  )

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
  local_mocked_bindings(
    .lasa_topic_index = function(...) varinfo_fixture
  )

  expect_error(
    lasa_var_info("not a LASA topic", open = FALSE),
    "No LASA file code or topic matched"
  )
})

test_that("lasa_var_info prefers a canonical PDF for an exact file code", {
  fixture <- varinfo_fixture[1L, , drop = FALSE]
  fixture$varinfo_url <- paste(
    "https://lasa-vu.nl/uploads/LASA046_appendix_varinfo.pdf",
    "https://lasa-vu.nl/uploads/LASA046_varinfo.pdf",
    sep = "; "
  )

  local_mocked_bindings(
    .lasa_topic_index = function(...) fixture
  )

  expect_equal(
    lasa_var_info("046", open = FALSE),
    "https://lasa-vu.nl/uploads/LASA046_varinfo.pdf"
  )
})
