test_that("the live LASA table exposes physical activity", {
  skip_if(
    !identical(Sys.getenv("RUN_LASA_LIVE_TESTS"), "true"),
    "Set RUN_LASA_LIVE_TESTS=true to run website integration tests"
  )

  topics <- lasa_topics(topic = "Physical activity", refresh = TRUE)
  physical_activity <- topics[
    topics$topic == "Physical activity" & topics$filecode == "046",
    ,
    drop = FALSE
  ]

  expect_equal(nrow(physical_activity), 1L)
  expect_true(physical_activity$has_varinfo)
  expect_match(physical_activity$waves, "B")
  expect_match(physical_activity$waves, "K")
  expect_match(physical_activity$varinfo_url, "LASA046_varinfo[.]pdf$")

  expect_match(
    lasa_var_info("lasa_046", open = FALSE),
    "LASA046_varinfo[.]pdf$"
  )
  expect_match(
    lasa_var_info("Physical activity", open = FALSE),
    "LASA046_varinfo[.]pdf$"
  )
})

test_that("the live LASA table splits compound chronic-diseases labels by filecode", {
  skip_if(
    !identical(Sys.getenv("RUN_LASA_LIVE_TESTS"), "true"),
    "Set RUN_LASA_LIVE_TESTS=true to run website integration tests"
  )

  topics <- lasa_topics(topic = "chronic diseases", refresh = TRUE)
  chronic <- topics[
    topics$filecode %in% c("035", "235", "435", "602", "702"),
    ,
    drop = FALSE
  ]

  expect_equal(nrow(chronic), 5L)
  expect_equal(
    chronic$topic[chronic$filecode == "035"],
    "Self-report of chronic diseases"
  )
  expect_equal(
    chronic$topic[chronic$filecode == "235"],
    "Self-report of chronic diseases - nr. of diseases reported"
  )
  expect_equal(
    chronic$topic[chronic$filecode == "602"],
    "Self-report of chronic diseases - tel. proxy"
  )
  expect_equal(
    chronic$topic[chronic$filecode == "702"],
    "Self-report of chronic diseases - tel. respondent"
  )
  expect_equal(
    chronic$topic[chronic$filecode == "435"],
    "Self-report of chronic diseases - longitudinally cleaned"
  )

  expect_match(
    lasa_var_info("chronic diseases tel proxy", open = FALSE),
    "LASA602_varinfo[.]pdf$"
  )
})
