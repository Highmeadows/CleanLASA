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
