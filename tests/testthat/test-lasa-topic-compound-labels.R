test_that("filecode roles follow the LASA numbering convention", {
  expect_equal(.lasa_filecode_role("035"), "main")
  expect_equal(.lasa_filecode_role("112"), "main")
  expect_equal(.lasa_filecode_role("235"), "processed")
  expect_equal(.lasa_filecode_role("332"), "processed")
  expect_equal(.lasa_filecode_role("435"), "cleaned")
  expect_equal(.lasa_filecode_role("532"), "cleaned")
  expect_equal(.lasa_filecode_role("602"), "proxy")
  expect_equal(.lasa_filecode_role("702"), "respondent")
  expect_equal(.lasa_filecode_role("878"), "other")
  expect_equal(.lasa_filecode_role("zoa1"), "other")
  expect_true(is.na(.lasa_filecode_role(NA_character_)))
})

test_that("topic labels split on dashes but not on hyphenated words", {
  expect_equal(
    .lasa_split_topic_segments(
      "Self-report of chronic diseases \u2013 nr. of diseases reported \u2013 tel. proxy"
    ),
    c("Self-report of chronic diseases", "nr. of diseases reported", "tel. proxy")
  )
  expect_equal(
    .lasa_split_topic_segments("Use of personal/household care - tel. proxy - tel. respondent"),
    c("Use of personal/household care", "tel. proxy", "tel. respondent")
  )
  expect_equal(.lasa_split_topic_segments("Physical activity"), "Physical activity")
  expect_equal(.lasa_split_topic_segments(NA_character_), character())
})

test_that("segment keywords are classified correctly", {
  expect_equal(.lasa_segment_role("tel. proxy"), "proxy")
  expect_equal(.lasa_segment_role("tel. respondent"), "respondent")
  expect_equal(.lasa_segment_role("longitudinally cleaned"), "cleaned")
  expect_equal(.lasa_segment_role("revised version"), "cleaned")
  expect_equal(.lasa_segment_role("nr. of diseases reported"), "processed")
})

test_that("the reference code order follows the most fully populated wave cell", {
  order <- .lasa_reference_code_order(list(
    c("035", "235", "435"),
    c("035", "235", "602", "702", "435")
  ))
  expect_equal(order, c("035", "235", "602", "702", "435"))
})

test_that("resolving topic labels reproduces the chronic-diseases example exactly", {
  ref_order <- c("035", "235", "602", "702", "435")
  all_codes <- c("035", "235", "602", "702", "435")
  resolved <- .lasa_resolve_topic_labels(
    label_text = paste0(
      "Self-report of chronic diseases \u2013 nr. of diseases reported \u2013 ",
      "tel. proxy \u2013 tel. respondent \u2013 longitudinally cleaned"
    ),
    ref_order = ref_order,
    all_code_keys = all_codes
  )

  expect_equal(unname(resolved["035"]), "Self-report of chronic diseases")
  expect_equal(
    unname(resolved["235"]),
    "Self-report of chronic diseases - nr. of diseases reported"
  )
  expect_equal(
    unname(resolved["602"]),
    "Self-report of chronic diseases - tel. proxy"
  )
  expect_equal(
    unname(resolved["702"]),
    "Self-report of chronic diseases - tel. respondent"
  )
  expect_equal(
    unname(resolved["435"]),
    "Self-report of chronic diseases - longitudinally cleaned"
  )
})

test_that("resolving topic labels falls back gracefully without dash segments", {
  resolved <- .lasa_resolve_topic_labels(
    label_text = "Attitudes about care",
    ref_order = c("032", "112"),
    all_code_keys = c("032", "112", "175")
  )
  expect_true(all(unname(resolved) == "Attitudes about care"))
})

test_that("resolving topic labels collapses a single-code row's compound label to the base topic", {
  ## When only one filecode exists for a row, any further dash-separated
  ## qualifiers in the label are just describing sub-parts of that one
  ## file (not distinguishing separate files), so they are dropped -
  ## e.g. a single-file "Inflammation factors - Pro-inflammatory cytokine
  ## IL-6 - Acute-phase proteins CRP - ACT" row is just "Inflammation
  ## factors".
  resolved <- .lasa_resolve_topic_labels(
    label_text = "Anthropometry \u2013 Weight and height \u2013 Calf measurement",
    ref_order = "161",
    all_code_keys = "161"
  )
  expect_equal(unname(resolved["161"]), "Anthropometry")
})

test_that("resolving topic labels leaves a single-code, single-segment row untouched", {
  resolved <- .lasa_resolve_topic_labels(
    label_text = "Physical activity",
    ref_order = "046",
    all_code_keys = "046"
  )
  expect_equal(unname(resolved["046"]), "Physical activity")
})

test_that(".lasa_topic_index() splits compound rows correctly end-to-end", {
  html <- paste0(
    "<html><body><table>",
    "<tr><th>LASA-WAVE</th><th>B</th><th>C</th></tr>",
    "<tr><td>THEME PHYSICAL</td><td></td><td></td></tr>",
    "<tr>",
    '<td><a href="https://lasa-vu.nl/topics/self-report-chronic-diseases">',
    "Self-report of chronic diseases \u2013 nr. of diseases reported \u2013 ",
    "tel. proxy \u2013 tel. respondent \u2013 longitudinally cleaned</a></td>",
    "<td>",
    '<a href="https://lasa-vu.nl/wp-content/uploads/2021/03/LASA035_varinfo.pdf">',
    "<strong>035 235</strong></a> \u2013 \u2013 ",
    '<a href="https://lasa-vu.nl/wp-content/uploads/2021/03/LASA035_varinfo.pdf">',
    "<strong>435</strong></a>",
    "</td>",
    "<td>",
    '<a href="https://lasa-vu.nl/wp-content/uploads/2021/03/LASA035_varinfo.pdf">',
    "<strong>035 235</strong></a> ",
    '<a href="https://lasa-vu.nl/wp-content/uploads/2021/03/LASA602_varinfo.pdf">',
    "<strong>602</strong></a> ",
    '<a href="https://lasa-vu.nl/wp-content/uploads/2021/03/LASA702_varinfo.pdf">',
    "<strong>702</strong></a>",
    '<a href="https://lasa-vu.nl/wp-content/uploads/2021/03/LASA035_varinfo.pdf">',
    "<strong>435</strong></a>",
    "</td>",
    "</tr>",
    "</table></body></html>"
  )

  document <- xml2::read_html(html)
  result <- .lasa_topic_index(document = document)

  expect_equal(nrow(result), 5L)
  expect_equal(
    sort(result$topic),
    sort(c(
      "Self-report of chronic diseases",
      "Self-report of chronic diseases - nr. of diseases reported",
      "Self-report of chronic diseases - tel. proxy",
      "Self-report of chronic diseases - tel. respondent",
      "Self-report of chronic diseases - longitudinally cleaned"
    ))
  )
  expect_equal(
    result$topic[result$filecode == "602"],
    "Self-report of chronic diseases - tel. proxy"
  )
  expect_equal(result$filecode_type[result$filecode == "602"], "proxy")
  expect_equal(result$filecode_type[result$filecode == "435"], "cleaned")
  expect_equal(result$filecode_type[result$filecode == "035"], "main")
  expect_match(
    result$varinfo_url[result$filecode == "435"],
    "LASA035_varinfo[.]pdf$"
  )
})
