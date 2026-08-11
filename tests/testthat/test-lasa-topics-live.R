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
