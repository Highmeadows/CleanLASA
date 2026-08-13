## ---- Filecode tokenizer ----

test_that("the filecode tokenizer separates codes run together with no whitespace", {
  expect_equal(.lasa_extract_filecodes("z010601701"), c("z010", "601", "701"))
  expect_equal(.lasa_extract_filecodes("ZFF1186605705"), c("ZFF1", "186", "605", "705"))
})

test_that("the filecode tokenizer still handles previously-working patterns", {
  expect_equal(.lasa_extract_filecodes("z010"), "z010")
  expect_equal(.lasa_extract_filecodes("zoa1"), "zoa1")
  expect_equal(.lasa_extract_filecodes("mb010"), "mb010")
  expect_equal(.lasa_extract_filecodes("z991z"), "z991z")
  expect_equal(.lasa_extract_filecodes("o41"), "o41")
  expect_equal(.lasa_extract_filecodes("880/881/882"), c("880", "881", "882"))
  expect_equal(.lasa_extract_filecodes("035 235 602 702 435"), c("035", "235", "602", "702", "435"))
  expect_equal(.lasa_extract_filecodes(""), character())
  expect_equal(.lasa_extract_filecodes(NA_character_), character())
  expect_equal(.lasa_extract_filecodes("-"), character())
})

## ---- Line-break preservation ----

test_that("line-break-separated topic names split apart instead of running together", {
  html <- paste0(
    "<html><body><table><tr><td>",
    "Blood collection and overview (routine) measurements<br>",
    "Response blood sampling / DNA Date blood sampling",
    "</td></tr></table></body></html>"
  )
  doc <- xml2::read_html(html)
  cell <- xml2::xml_find_first(doc, "//td")
  raw <- .lasa_node_text_with_breaks(cell)
  cleaned <- .lasa_clean_html_text(raw)
  segments <- .lasa_split_topic_segments(cleaned)

  expect_equal(
    segments,
    c(
      "Blood collection and overview (routine) measurements",
      "Response blood sampling / DNA Date blood sampling"
    )
  )
})

test_that("a plain cell without <br> is unaffected by break handling", {
  html <- "<html><body><table><tr><td>Physical activity</td></tr></table></body></html>"
  doc <- xml2::read_html(html)
  cell <- xml2::xml_find_first(doc, "//td")
  expect_equal(.lasa_clean_html_text(.lasa_node_text_with_breaks(cell)), "Physical activity")
})

test_that("the Blood collection / Response blood sampling row resolves correctly end-to-end", {
  ## Regression test for a real bug: the two filecodes here were entirely
  ## missing from the override table (a data-entry gap, not a matching
  ## bug), so filecode 851 silently kept the general algorithm's output -
  ## which itself has a known limitation for line-break-separated topics:
  ## it prefixes the second segment with the first ("A - B") the same way
  ## it would for a dash-separated modifier, which is wrong when the two
  ## line-break-separated names are independent topics, not a base and a
  ## qualifier. The override exists specifically to correct that.
  html <- paste0(
    "<html><body><table>",
    "<tr><th>LASA-WAVE</th><th>B</th></tr>",
    "<tr><td>THEME BIOMATERIAL</td><td></td></tr>",
    "<tr><td><a href=\"https://lasa-vu.nl/topics/blood-collection\">",
    "Blood collection and overview (routine) measurements<br>",
    "Response blood sampling / DNA Date blood sampling</a></td>",
    "<td><a href=\"https://lasa-vu.nl/x/LASA850_varinfo.pdf\"><strong>850</strong></a> ",
    "<a href=\"https://lasa-vu.nl/x/LASA851_varinfo.pdf\"><strong>851</strong></a></td>",
    "</tr></table></body></html>"
  )
  document <- xml2::read_html(html)
  result <- .lasa_topic_index(document = document)

  expect_equal(
    result$topic[result$filecode == "850"],
    "Blood collection and overview (routine) measurements"
  )
  expect_equal(
    result$topic[result$filecode == "851"],
    "Response blood sampling / DNA Date blood sampling"
  )
})

## ---- Single-filecode collapse rule ----

test_that("a single-filecode row collapses a compound label to its base topic", {
  resolved <- .lasa_resolve_topic_labels(
    label_text = paste(
      "Inflammation factors - Pro-inflammatory cytokine Interleukin-6 (IL-6)",
      "- Acute-phase proteins C-reactive protein (CRP) - A1-antichymotrypsin (ACT)"
    ),
    ref_order = "861",
    all_code_keys = "861"
  )
  expect_equal(unname(resolved[["861"]]), "Inflammation factors")
})

## ---- "main" role no longer capped at one match; role-default fallback ----

test_that("a second 'main' filecode with no distinguishing text gets the bare label", {
  resolved <- .lasa_resolve_topic_labels(
    label_text = "Advance Directives - tel. respondent",
    ref_order = c("093", "195", "709"),
    all_code_keys = c("093", "195", "709")
  )
  expect_equal(unname(resolved[["093"]]), "Advance Directives")
  expect_equal(unname(resolved[["195"]]), "Advance Directives")
  expect_equal(unname(resolved[["709"]]), "Advance Directives - tel. respondent")
})

test_that("a code with a known role but no segment text gets a role-named phrase", {
  resolved <- .lasa_resolve_topic_labels(
    label_text = "Sedentary behavior - scaled",
    ref_order = c("101", "301", "501"),
    all_code_keys = c("101", "301", "501")
  )
  expect_equal(unname(resolved[["101"]]), "Sedentary behavior")
  expect_equal(unname(resolved[["301"]]), "Sedentary behavior - scaled")
  expect_equal(unname(resolved[["501"]]), "Sedentary behavior - longitudinally cleaned")
})

## ---- Multi-link positional mapping ----

test_that(".lasa_topic_index() maps a multi-link row positionally when codes match link count", {  html <- paste0(
  "<html><body><table>",
  "<tr><th>LASA-WAVE</th><th>B</th></tr>",
  "<tr><td>THEME DEMOGRAPHICS</td><td></td></tr>",
  "<tr>",
  '<td><a href="https://lasa-vu.nl/topics/income">Income</a>; ',
  '<a href="https://lasa-vu.nl/topics/income-specification">- Income specification</a></td>',
  '<td><a href="https://lasa-vu.nl/wp-content/uploads/2021/03/LASA017_varinfo.pdf"><strong>017</strong></a> ',
  '<a href="https://lasa-vu.nl/wp-content/uploads/2021/03/LASA217_varinfo.pdf"><strong>217</strong></a></td>',
  "</tr>",
  "</table></body></html>"
)
document <- xml2::read_html(html)
result <- .lasa_scrape_topic_table(document)

expect_equal(result$topic[result$filecode == "017"], "Income")
expect_equal(result$topic[result$filecode == "217"], "Income specification")
})

## ---- Curation: overrides, aliases, wave-splits applied together ----

test_that(".lasa_apply_topic_curation() applies overrides, aliases, and wave-splits correctly", {
  synthetic <- data.frame(
    theme = c("Biomaterial", "Physical", "Social", "Social", "Emotional"),
    subtheme = c(NA, "Body composition", "Housing", "Housing", "Stress and stressors"),
    topic = c(
      "Inflammation factors - Pro-inflammatory cytokine IL-6 - Acute-phase proteins CRP",
      "Anthropometry",
      "Neighborhood characteristics",
      "Neighborhood characteristics",
      "(Negative) life events"
    ),
    filecode = c("861", "161", "015", "015z", "272"),
    filecode_type = c("other", "main", "main", "main", "processed"),
    waves = c(
      "B, C, 3B",
      "B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K",
      "B, C, D, E, 2B, F, G, H, 3B, I, J",
      "K",
      "C, D, E, F, G, H, I, J, K"
    ),
    has_varinfo = c(TRUE, TRUE, TRUE, FALSE, TRUE),
    varinfo_url = c(
      "https://x/LASA861.pdf", "https://x/LASA161.pdf", "https://x/LASA015.pdf",
      NA, "https://x/LASA272.pdf"
    ),
    topic_url = rep(NA_character_, 5),
    stringsAsFactors = FALSE
  )

  result <- .lasa_apply_topic_curation(synthetic)

  expect_equal(result$topic[result$filecode == "861"], "Inflammation factors")

  expect_equal(sum(result$filecode == "161"), 2L)
  expect_equal(
    result$waves[result$topic == "Anthropometry - Weight and height"],
    "B, C, D, E, 2B, F, G, H, 3B, MB"
  )
  expect_equal(result$waves[result$topic == "Anthropometry - Calf measurement"], "I, J, K")

  social_015 <- result[result$filecode == "015" & result$theme == "Social", ]
  expect_equal(nrow(social_015), 1L)
  expect_match(social_015$waves, "K")

  expect_equal(result$filecode_type[result$filecode == "272"], "main")
})

test_that("an override that no longer matches exactly one row is skipped, not guessed", {
  synthetic <- data.frame(
    theme = c("Biomaterial", "Biomaterial"),
    subtheme = c(NA, NA),
    topic = c("Cortisol variant A", "Cortisol variant B"),
    filecode = c("880", "880"),
    filecode_type = c("other", "other"),
    waves = c("E", "F"),
    has_varinfo = c(TRUE, TRUE),
    varinfo_url = c("https://x/1.pdf", "https://x/2.pdf"),
    topic_url = c(NA_character_, NA_character_),
    stringsAsFactors = FALSE
  )
  ## Two rows now match filecode 880 in Biomaterial - the override expects
  ## exactly one, so it should leave both untouched rather than picking one.
  result <- .lasa_apply_topic_overrides(synthetic)
  expect_equal(result$topic, c("Cortisol variant A", "Cortisol variant B"))
})

test_that("every curated override actually matches exactly one row of a realistic table", {
  ## Regression test for a real bug: an override can be syntactically fine
  ## and simply never fire, e.g. because the matching row's subtheme was
  ## NA in the source table but the override forgot to leave it NA too.
  ## Build one row per override, in the shape a scrape would produce
  ## (as if each override's own `new_topic` had *not* already been
  ## applied), and confirm the curation step changes every single one.
  synthetic <- data.frame(
    theme = lasa_topic_overrides$theme,
    subtheme = lasa_topic_overrides$subtheme,
    topic = paste0("UNRESOLVED PLACEHOLDER ", seq_len(nrow(lasa_topic_overrides))),
    filecode = lasa_topic_overrides$filecode,
    filecode_type = "other",
    waves = "B",
    has_varinfo = FALSE,
    varinfo_url = NA_character_,
    topic_url = NA_character_,
    stringsAsFactors = FALSE
  )
  ## Overrides that key off old_topic_contains need that text present to
  ## match at all - put it in the placeholder topic for those rows.
  has_filter <- !is.na(lasa_topic_overrides$old_topic_contains)
  synthetic$topic[has_filter] <- paste(
    synthetic$topic[has_filter], lasa_topic_overrides$old_topic_contains[has_filter]
  )

  result <- .lasa_apply_topic_overrides(synthetic)
  unresolved <- grepl("^UNRESOLVED PLACEHOLDER", result$topic)
  if (any(unresolved)) {
    fail(paste(
      "These overrides did not match their synthetic row and were silently skipped:",
      paste(
        sprintf(
          "filecode=%s theme=%s subtheme=%s",
          lasa_topic_overrides$filecode[unresolved],
          lasa_topic_overrides$theme[unresolved],
          lasa_topic_overrides$subtheme[unresolved]
        ),
        collapse = "; "
      )
    ))
  }
  expect_false(any(unresolved))
})

## ---- lasa_topics() drops URL columns; lasa_var_info() still resolves URLs ----

test_that("lasa_topics() output has no URL columns but lasa_var_info() still works", {
  fixture <- data.frame(
    theme = "Physical", subtheme = NA_character_, topic = "Physical activity",
    filecode = "046", filecode_type = "main", waves = "B, C",
    has_varinfo = TRUE, varinfo_url = "https://lasa-vu.nl/x/LASA046_varinfo.pdf",
    topic_url = "https://lasa-vu.nl/topics/physical-activity",
    stringsAsFactors = FALSE
  )
  local_mocked_bindings(.lasa_topic_index = function(...) fixture, .package = "CleanLASA")

  out <- lasa_topics(topic = "all")
  expect_false("varinfo_url" %in% names(out))
  expect_false("topic_url" %in% names(out))
  expect_true("has_varinfo" %in% names(out))

  expect_equal(lasa_var_info("046", open = FALSE), "https://lasa-vu.nl/x/LASA046_varinfo.pdf")
})

## ---- Disk cache ----

test_that("the topic table persists to a disk cache and survives a cleared memory cache", {
  cache_root <- withr::local_tempdir()
  withr::local_envvar(R_USER_CACHE_DIR = cache_root)

  scrape_count <- 0
  fake_table <- data.frame(
    theme = "Physical", subtheme = NA_character_, topic = "Fake topic",
    filecode = "999", filecode_type = "main", waves = "B",
    has_varinfo = FALSE, varinfo_url = NA_character_, topic_url = NA_character_,
    stringsAsFactors = FALSE
  )
  local_mocked_bindings(
    .lasa_scrape_topic_table = function(...) {
      scrape_count <<- scrape_count + 1
      fake_table
    },
    .package = "CleanLASA"
  )

  withr::defer(rm(list = ls(envir = .lasa_topic_cache), envir = .lasa_topic_cache))

  result1 <- .lasa_topic_index()
  expect_equal(scrape_count, 1L)
  expect_true(file.exists(.lasa_cache_file()))

  result2 <- .lasa_topic_index()
  expect_equal(scrape_count, 1L)

  rm(list = ls(envir = .lasa_topic_cache), envir = .lasa_topic_cache)
  expect_message(.lasa_topic_index(), "Using the LASA topic table cached")
  rm(list = ls(envir = .lasa_topic_cache), envir = .lasa_topic_cache)
  result3 <- suppressMessages(.lasa_topic_index())
  expect_equal(scrape_count, 1L)
  expect_equal(result3, fake_table)

  result4 <- .lasa_topic_index(refresh = TRUE)
  expect_equal(scrape_count, 2L)
})

test_that("a wave-split only assigns waves the row actually has, not the override's static list", {
  ## Regression test for a real bug: the split used to assign
  ## `waves_for_first` verbatim from the override, even for waves the row
  ## didn't actually have (e.g. if a table snapshot only goes up to wave I
  ## and the override's list includes J and K).
  synthetic <- data.frame(
    theme = "Physical", subtheme = "Body composition", topic = "Anthropometry",
    filecode = "161", filecode_type = "main", waves = "B, C, I",
    has_varinfo = TRUE, varinfo_url = "https://x/161.pdf", topic_url = NA_character_,
    stringsAsFactors = FALSE
  )
  result <- .lasa_apply_wave_splits(synthetic)
  expect_equal(sum(result$filecode == "161"), 2L)
  expect_equal(result$waves[result$topic == "Anthropometry - Calf measurement"], "I")
  expect_equal(result$waves[result$topic == "Anthropometry - Weight and height"], "B, C")
})

test_that("a run of several consecutive dashes collapses to a single delimiter", {
  ## Regression test for a real bug: a source label with a double-dash
  ## artifact (e.g. "Vision (self-report) - - tel. proxy") left a stray
  ## leading dash on the second segment, which then showed up doubled
  ## once build_label() added its own " - " separator.
  segments <- .lasa_split_topic_segments("Vision (self-report) \u2013 \u2013 tel. proxy")
  expect_equal(segments, c("Vision (self-report)", "tel. proxy"))

  resolved <- .lasa_resolve_topic_labels(
    label_text = "Vision (self-report) \u2013 \u2013 tel. proxy",
    ref_order = c("031", "604"),
    all_code_keys = c("031", "604")
  )
  expect_equal(unname(resolved[["604"]]), "Vision (self-report) - tel. proxy")
})

test_that("the break marker never leaks into theme or subtheme text", {
  ## Regression test for a real bug: a subtheme header cell with a <br>
  ## used purely to wrap a narrow column (e.g. "Medication/<br>supplements")
  ## left the marker character sitting in the final subtheme text, since
  ## only `.lasa_split_topic_segments()` (used for `topic`, not
  ## theme/subtheme) consumed it.
  html <- paste0(
    "<html><body><table>",
    "<tr><th>LASA-WAVE</th><th>I</th></tr>",
    "<tr><td>THEME PHYSICAL</td><td></td></tr>",
    "<tr><td>Medication/<br>supplements</td><td>I</td></tr>",
    "<tr><td><a href=\"https://lasa-vu.nl/topics/food-supplement\">Food supplement use</a></td>",
    "<td><a href=\"https://lasa-vu.nl/x/LASA174_varinfo.pdf\"><strong>174</strong></a></td></tr>",
    "</table></body></html>"
  )
  document <- xml2::read_html(html)
  result <- .lasa_topic_index(document = document)

  expect_equal(result$subtheme, "Medication/ supplements")
  expect_false(grepl("\u241E", result$topic, fixed = TRUE))
  expect_false(grepl("\u241E", result$subtheme, fixed = TRUE))
  expect_false(grepl("\u241E", result$theme, fixed = TRUE))
})

test_that("lasa_topics() no longer returns filecode_type", {
  fixture <- data.frame(
    theme = "Physical", subtheme = NA_character_, topic = "Physical activity",
    filecode = "046", filecode_type = "main", waves = "B, C",
    has_varinfo = TRUE, varinfo_url = "https://lasa-vu.nl/x/LASA046_varinfo.pdf",
    topic_url = NA_character_,
    stringsAsFactors = FALSE
  )
  local_mocked_bindings(.lasa_topic_index = function(...) fixture, .package = "CleanLASA")

  out <- lasa_topics(topic = "all")
  expect_false("filecode_type" %in% names(out))
})
