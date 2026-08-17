topic_index_fixture <- data.frame(
  theme = "Physical", subtheme = "Lifestyle", topic = "Physical activity",
  filecode = c("046", "zoa1", "zoa2", "zoa3"),
  waves = "B", has_varinfo = TRUE,
  varinfo_url = c(
    "https://lasa-vu.nl/wp-content/uploads/2021/03/LASA046_varinfo.pdf",
    "https://lasa-vu.nl/wp-content/uploads/2021/03/LASAzoa1_2_3_varinfo.pdf",
    "https://lasa-vu.nl/wp-content/uploads/2021/03/LASAzoa1_2_3_varinfo.pdf",
    "https://lasa-vu.nl/wp-content/uploads/2021/03/LASAzoa1_2_3_varinfo.pdf"
  ),
  stringsAsFactors = FALSE
)

test_that("resolves a direct filecode to its URL and sibling filecodes", {
  local_mocked_bindings(.lasa_topic_index = function(...) topic_index_fixture)
  res <- .lasa_resolve_varinfo_url(filecode = "046")
  expect_equal(res$source, "online")
  expect_identical(res$filecodes, "046")
  expect_match(res$varinfo_url, "LASA046_varinfo.pdf$")
})

test_that("shared-PDF siblings are all returned", {
  local_mocked_bindings(.lasa_topic_index = function(...) topic_index_fixture)
  res <- .lasa_resolve_varinfo_url(filecode = "zoa2")
  expect_setequal(res$filecodes, c("zoa1", "zoa2", "zoa3"))
})

test_that("a bare group prefix resolves when unambiguous", {
  local_mocked_bindings(.lasa_topic_index = function(...) topic_index_fixture)
  res <- .lasa_resolve_varinfo_url(filecode = "zoa")
  expect_setequal(res$filecodes, c("zoa1", "zoa2", "zoa3"))
})

test_that("explicit url bypasses resolution entirely", {
  res <- .lasa_resolve_varinfo_url(url = "https://example.com/LASA999_varinfo.pdf")
  expect_equal(res$source, "explicit")
  expect_equal(res$varinfo_url, "https://example.com/LASA999_varinfo.pdf")
  expect_equal(res$varinfo_file, "LASA999_varinfo.pdf")
})

test_that("falls back to the offline manifest when the live site errors", {
  local_mocked_bindings(.lasa_topic_index = function(...) stop("network unavailable"))
  res <- .lasa_resolve_varinfo_url(filecode = "046")
  expect_equal(res$source, "offline")
  expect_identical(res$filecodes, "046")
  expect_true(is.na(res$varinfo_url))
  expect_equal(res$varinfo_file, "LASA046_varinfo.pdf")
})

test_that("offline fallback also resolves shared-PDF siblings", {
  local_mocked_bindings(.lasa_topic_index = function(...) stop("network unavailable"))
  res <- .lasa_resolve_varinfo_url(filecode = "868")
  expect_setequal(res$filecodes, c("868", "878"))
})

test_that("an unknown filecode errors with a clear message", {
  local_mocked_bindings(.lasa_topic_index = function(...) stop("network unavailable"))
  expect_error(
    .lasa_resolve_varinfo_url(filecode = "nonexistent999"),
    "No variable-information PDF found"
  )
})

test_that("requires filecode or url", {
  expect_error(.lasa_resolve_varinfo_url(), "Either 'filecode' or 'url'")
})
