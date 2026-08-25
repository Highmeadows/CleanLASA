test_that("lasa_var_info resolves the live varinfo PDF for a known file code and topic", {
  skip_if(
    !identical(Sys.getenv("RUN_LASA_LIVE_TESTS"), "true"),
    "Set RUN_LASA_LIVE_TESTS=true to run website integration tests"
  )

  expect_match(
    lasa_var_info("lasa_046", open = FALSE, refresh = TRUE),
    "LASA046_varinfo[.]pdf$"
  )
  expect_match(
    lasa_var_info("Physical activity", open = FALSE),
    "LASA046_varinfo[.]pdf$"
  )
  expect_match(
    lasa_var_info("chronic diseases tel proxy", open = FALSE),
    "LASA602_varinfo[.]pdf$"
  )
})
