topic_db_fixture <- data.frame(
  theme = c("Physical", "Physical", "Physical", "Cognitive"),
  subtheme = c("Lifestyle", "Lifestyle", "Body composition", "Memory"),
  topic = c(
    "Physical activity",
    "Daily Physical Activity",
    "Exome Chip",
    "Everyday memory"
  ),
  filecode = c("046", "162", NA_character_, "023"),
  waves = c(
    "B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K",
    "J",
    NA_character_,
    "B, F"
  ),
  has_varinfo = c(TRUE, TRUE, FALSE, TRUE),
  stringsAsFactors = FALSE
)

test_that("lasa_topics() with no arguments returns the complete database", {
  local_mocked_bindings(.lasa_topic_database = function() topic_db_fixture)

  topics <- lasa_topics()
  expect_equal(nrow(topics), nrow(topic_db_fixture))
  expect_equal(
    sort(names(topics)),
    sort(c("theme", "subtheme", "topic", "filecode", "waves", "has_varinfo"))
  )
})

test_that("lasa_topics() searches by topic name, exactly and fuzzily", {
  local_mocked_bindings(.lasa_topic_database = function() topic_db_fixture)

  exact <- lasa_topics(topic = "Physical activity")
  expect_equal(exact$topic, c("Physical activity", "Daily Physical Activity"))

  partial <- suppressMessages(lasa_topics(topic = "physical act"))
  expect_setequal(
    partial$topic,
    c("Physical activity", "Daily Physical Activity")
  )

  typo <- lasa_topics(topic = "phisical activity")
  expect_true("Physical activity" %in% typo$topic)
})

test_that("lasa_topics() searches by theme and subtheme", {
  local_mocked_bindings(.lasa_topic_database = function() topic_db_fixture)

  by_theme <- lasa_topics(theme = "Physical")
  expect_setequal(by_theme$topic, c("Physical activity", "Daily Physical Activity", "Exome Chip"))

  by_subtheme <- lasa_topics(theme = "Memory")
  expect_equal(by_subtheme$topic, "Everyday memory")
})

test_that("a topic with no file code and no varinfo PDF is still returned", {
  local_mocked_bindings(.lasa_topic_database = function() topic_db_fixture)

  topics <- lasa_topics(topic = "Exome Chip")
  expect_equal(nrow(topics), 1L)
  expect_true(is.na(topics$filecode))
  expect_false(topics$has_varinfo)
})

test_that("lasa_topics() errors when nothing matches", {
  local_mocked_bindings(.lasa_topic_database = function() topic_db_fixture)

  expect_error(
    lasa_topics(topic = "not a real LASA topic"),
    "No LASA topics matched"
  )
})

test_that("the bundled topic database exposes physical activity", {
  physical_activity <- lasa_topics(topic = "Physical activity")
  physical_activity <- physical_activity[
    physical_activity$topic == "Physical activity" & physical_activity$filecode == "046",
    ,
    drop = FALSE
  ]

  expect_equal(nrow(physical_activity), 1L)
  expect_true(physical_activity$has_varinfo)
  expect_match(physical_activity$waves, "B")
  expect_match(physical_activity$waves, "K")
})

test_that("lasa_topics() searches by file code", {
  local_mocked_bindings(.lasa_topic_database = function() topic_db_fixture)

  by_code <- lasa_topics("046")
  expect_equal(nrow(by_code), 1L)
  expect_equal(by_code$topic, "Physical activity")

  by_code_prefixed <- lasa_topics("LASA046")
  expect_equal(by_code_prefixed$topic, "Physical activity")
})

test_that("lasa_topics() by file code returns every matching row and suppresses the theme/subtheme message", {
  duplicate_code_fixture <- rbind(
    topic_db_fixture,
    data.frame(
      theme = "Biomaterial",
      subtheme = NA_character_,
      topic = "Salivary cortisol (non)response",
      filecode = "046",
      waves = "E",
      has_varinfo = TRUE,
      stringsAsFactors = FALSE
    )
  )
  local_mocked_bindings(.lasa_topic_database = function() duplicate_code_fixture)

  expect_no_message(result <- lasa_topics("046"))
  expect_equal(nrow(result), 2L)
  expect_setequal(result$theme, c("Physical", "Biomaterial"))
})

test_that("lasa_topics() file code search respects an active theme filter", {
  duplicate_code_fixture <- rbind(
    topic_db_fixture,
    data.frame(
      theme = "Biomaterial",
      subtheme = NA_character_,
      topic = "Salivary cortisol (non)response",
      filecode = "046",
      waves = "E",
      has_varinfo = TRUE,
      stringsAsFactors = FALSE
    )
  )
  local_mocked_bindings(.lasa_topic_database = function() duplicate_code_fixture)

  result <- lasa_topics("046", theme = "Physical")
  expect_equal(nrow(result), 1L)
  expect_equal(result$theme, "Physical")
})

test_that("lasa_topics() also matches processed/scaled variants sharing the same final two digits", {
  family_fixture <- rbind(
    topic_db_fixture,
    data.frame(
      theme = "Physical",
      subtheme = "Lifestyle",
      topic = "Physical activity (scaled)",
      filecode = "245",
      waves = "K",
      has_varinfo = TRUE,
      stringsAsFactors = FALSE
    )
  )
  local_mocked_bindings(.lasa_topic_database = function() family_fixture)

  # "045" itself isn't in the fixture, but its family member "245" is.
  by_family_only <- lasa_topics("045")
  expect_equal(by_family_only$filecode, "245")

  by_family_member <- lasa_topics("245")
  expect_equal(by_family_member$filecode, "245")
})

test_that("lasa_topics() returns both an exact file code and its family members, exact first", {
  family_fixture <- rbind(
    topic_db_fixture,
    data.frame(
      theme = c("Physical", "Physical"),
      subtheme = c("Lifestyle", "Lifestyle"),
      topic = c("Base measure", "Scaled measure"),
      filecode = c("045", "245"),
      waves = c("B", "K"),
      has_varinfo = c(TRUE, TRUE),
      stringsAsFactors = FALSE
    )
  )
  local_mocked_bindings(.lasa_topic_database = function() family_fixture)

  result <- lasa_topics("045")
  expect_setequal(result$filecode, c("045", "245"))
  expect_equal(result$filecode[[1L]], "045")
})

test_that("lasa_topics() file code family-matching never applies to letter-prefixed codes", {
  letter_fixture <- rbind(
    topic_db_fixture,
    data.frame(
      theme = "Biomaterial",
      subtheme = NA_character_,
      topic = "Some ancillary measure",
      filecode = "z010",
      waves = "C",
      has_varinfo = TRUE,
      stringsAsFactors = FALSE
    )
  )
  local_mocked_bindings(.lasa_topic_database = function() letter_fixture)

  result <- lasa_topics("z010")
  expect_equal(nrow(result), 1L)
  expect_equal(result$filecode, "z010")
})
