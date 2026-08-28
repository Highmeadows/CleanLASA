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
  filecode = c("046", "162", "999"),
  varinfo_url = c(
    "https://lasa-vu.nl/wp-content/uploads/2021/03/LASA046_varinfo.pdf",
    "https://lasa-vu.nl/wp-content/uploads/2024/01/LASA162_varinfo.pdf",
    NA_character_
  ),
  web_url = c(
    "https://lasa-vu.nl/topics/physical-activity/",
    "https://lasa-vu.nl/topics/daily-physical-activity/",
    "https://lasa-vu.nl/topics/undocumented-physical-measure/"
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

test_that("lasa_var_info detours to the LASA webpage when no varinfo PDF is linked", {
  local_var_info_mocks()

  expected_web <- varinfo_index_fixture$web_url[[3L]]

  expect_message(
    result <- lasa_var_info("999", open = FALSE),
    "No variable-information PDF is linked.*opening its LASA webpage instead"
  )
  expect_equal(result, expected_web)

  expect_message(
    result <- lasa_var_info("Undocumented physical measure", open = FALSE),
    "No variable-information PDF is linked.*opening its LASA webpage instead"
  )
  expect_equal(result, expected_web)
})

test_that("lasa_var_info errors when neither a PDF nor a webpage is linked", {
  local_mocked_bindings(
    .lasa_topic_database = function() {
      rbind(topic_db_fixture, data.frame(
        theme = "Physical",
        subtheme = "Lifestyle",
        topic = "Totally missing measure",
        filecode = "888",
        waves = "K",
        has_varinfo = FALSE,
        stringsAsFactors = FALSE
      ))
    },
    .lasa_varinfo_index = function(...) varinfo_index_fixture
  )

  expect_error(
    lasa_var_info("888", open = FALSE),
    "No LASA topic webpage is linked on the LASA website"
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

test_that("lasa_var_info() has a target argument", {
  expect_true("target" %in% names(formals(lasa_var_info)))
})

test_that("lasa_var_info's target argument accepts every alias, case-insensitively", {
  local_var_info_mocks()

  pdf_expected <- varinfo_index_fixture$varinfo_url[[1L]]
  web_expected <- varinfo_index_fixture$web_url[[1L]]

  pdf_aliases <- c(
    "pdf", "PDF", "Pdf",
    "varinfo", "Varinfo", "VARINFO",
    "doc", "DOC",
    "documentation", "Documentation"
  )
  web_aliases <- c(
    "web", "WEB", "Web",
    "webpage", "Webpage", "WEBPAGE",
    "website", "Website",
    "browser", "Browser",
    "online", "Online"
  )

  for (alias in pdf_aliases) {
    expect_equal(
      lasa_var_info("046", target = alias, open = FALSE),
      pdf_expected,
      info = alias
    )
  }
  for (alias in web_aliases) {
    expect_equal(
      lasa_var_info("046", target = alias, open = FALSE),
      web_expected,
      info = alias
    )
  }
})

test_that("lasa_var_info rejects an invalid target", {
  local_var_info_mocks()

  expect_error(
    lasa_var_info("046", target = "epub", open = FALSE),
    "`target` must be one of"
  )
})

test_that("lasa_var_info(target = 'web') resolves the topic webpage directly", {
  local_var_info_mocks()

  expect_equal(
    lasa_var_info("046", target = "web", open = FALSE),
    varinfo_index_fixture$web_url[[1L]]
  )
})

test_that("lasa_var_info(target = 'web') errors normally when no web link exists (no reverse fallback)", {
  local_mocked_bindings(
    .lasa_topic_database = function() topic_db_fixture[1L, , drop = FALSE],
    .lasa_varinfo_index = function(...) {
      data.frame(
        filecode = "046",
        varinfo_url = "https://lasa-vu.nl/uploads/LASA046_varinfo.pdf",
        web_url = NA_character_,
        stringsAsFactors = FALSE
      )
    }
  )

  # No reverse fallback to the PDF happens for this direction -- it's a
  # normal "no webpage linked" error, even though a PDF is linked.
  expect_error(
    lasa_var_info("046", target = "web", open = FALSE),
    "No LASA topic webpage is linked on the LASA website"
  )
})

test_that("lasa_var_info reports multiple matching webpages as ambiguous", {
  local_mocked_bindings(
    .lasa_topic_database = function() topic_db_fixture[1L, , drop = FALSE],
    .lasa_varinfo_index = function(...) {
      data.frame(
        filecode = "046",
        varinfo_url = "https://lasa-vu.nl/uploads/LASA046_varinfo.pdf",
        web_url = paste(
          "https://lasa-vu.nl/topics/physical-activity/",
          "https://lasa-vu.nl/topics/physical-activity-2/",
          sep = "; "
        ),
        stringsAsFactors = FALSE
      )
    }
  )

  expect_error(
    lasa_var_info("046", target = "web", open = FALSE),
    "Multiple LASA topic webpages match"
  )
})

test_that(".lasa_scrape_topic_links captures a topic-cell web link alongside its wave-cell pdf link", {
  html <- xml2::read_html('<html><body><table>
    <tr><td>LASA-wave</td><td>B</td></tr>
    <tr><td><a href="/topics/physical-activity/">Physical activity</a></td>
        <td>046 <a href="/uploads/LASA046_varinfo.pdf">varinfo</a></td></tr>
  </table></body></html>')

  result <- .lasa_scrape_topic_links(document = html)
  row <- result[result$filecode == "046", ]

  expect_equal(nrow(row), 1L)
  expect_match(row$web_url, "topics/physical-activity", fixed = TRUE)
  expect_match(row$varinfo_url, "LASA046_varinfo.pdf", fixed = TRUE)
})

test_that(".lasa_scrape_topic_links falls back to NA web_url when the topic cell has no link", {
  html <- xml2::read_html('<html><body><table>
    <tr><td>LASA-wave</td><td>B</td></tr>
    <tr><td>Physical activity</td>
        <td>046 <a href="/uploads/LASA046_varinfo.pdf">varinfo</a></td></tr>
  </table></body></html>')

  result <- .lasa_scrape_topic_links(document = html)
  row <- result[result$filecode == "046", ]

  expect_true(is.na(row$web_url))
  expect_match(row$varinfo_url, "LASA046_varinfo.pdf", fixed = TRUE)
})

test_that(".lasa_scrape_topic_links records a filecode with only a web link (no pdf)", {
  html <- xml2::read_html('<html><body><table>
    <tr><td>LASA-wave</td><td>B</td></tr>
    <tr><td><a href="/topics/example/">Example</a></td><td>777</td></tr>
  </table></body></html>')

  result <- .lasa_scrape_topic_links(document = html)
  row <- result[result$filecode == "777", ]

  expect_equal(nrow(row), 1L)
  expect_true(is.na(row$varinfo_url))
  expect_match(row$web_url, "topics/example", fixed = TRUE)
})

test_that(".lasa_read_varinfo_disk_cache ignores a legacy (pre-web_url) cache file", {
  cache_dir <- tempfile("lasa-cache-")
  dir.create(cache_dir)
  on.exit(unlink(cache_dir, recursive = TRUE), add = TRUE)
  cache_file <- file.path(cache_dir, "legacy.rds")

  local_mocked_bindings(
    .lasa_varinfo_cache_file = function() cache_file
  )
  saveRDS(
    data.frame(
      filecode = "046",
      varinfo_url = "https://example.com/x.pdf",
      stringsAsFactors = FALSE
    ),
    cache_file
  )

  expect_null(.lasa_read_varinfo_disk_cache())
})
