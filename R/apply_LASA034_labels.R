# Apply LASA 034 (physical performance tests) SPSS variable and value labels
#
# Source: LASA034_varinfo_PhysicalPerformance.pdf (25-Aug-2023)

#' Apply LASA034 (physical performance tests) SPSS labels
#'
#' Attaches the documented SPSS variable labels (`attr(x, "label")`) and
#' value labels (`attr(x, "labels")`) to variables from a LASA034 physical
#' performance file. The implementation covers waves B, C, D, E, 2B, F, G,
#' H, 3B, MB, I, J, and K, including their wave-specific tests and codings.
#'
#' The shared reshaping arguments have the same names, defaults, and behavior
#' as in [apply_lasa046_labels()]. Column matching tries an explicit
#' `name_corrections` override, an exact match, and a case-insensitive exact
#' match, in that order. Results are recorded in the generic `label_report`
#' attribute and can be inspected with [lasa_label_report()].
#'
#' Regardless of `to_factor`/`to_numeric`, every matched column also keeps
#' its original SPSS value coding available as reference attributes --
#' `attr(x, "original_labels")` and `attr(x, "original_values")` -- and the
#' `"respnr"` column (in any capitalization) is matched and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA034 `.sav` file.
#' @param wave Character scalar identifying the LASA wave. One of `"B"`,
#'   `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`, `"G"`, `"H"`, `"3B"`, `"MB"`,
#'   `"I"`, `"J"`, or `"K"` (matched case-insensitively).
#' @param name_corrections Optional named character vector mapping canonical
#'   LASA034 suffixes (without a wave prefix), such as `walk04a`, to actual
#'   column names in `data`.
#' @param to_factor Logical. If `TRUE`, variables with substantive value
#'   labels are converted to factors. Observed but unlabelled values are
#'   retained as levels containing their numeric code.
#' @param to_numeric Logical. If `TRUE`, variables whose value labels consist
#'   only of negative missing-reason codes are converted to plain numeric and
#'   all negative values are replaced by `NA`. This takes precedence over
#'   `to_factor`.
#' @param standardize_names Logical. If `TRUE`, matched variables are renamed
#'   to their canonical lowercase LASA034 names with the wave code removed,
#'   `"respnr"` (in any capitalization) is renamed to `"respnr"`, and
#'   `split_wavecode` is always treated as `TRUE` as well, regardless of what
#'   was passed for `split_wavecode`.
#' @param split_wavecode Logical. If `TRUE`, matched columns are renamed with
#'   the wave-letter prefix removed (e.g. `bwalk04` becomes `walk04`), and a
#'   new `"LASA_wave"` column, filled with `wave`, is inserted right after
#'   `"respnr"`. Always treated as `TRUE` when `standardize_names = TRUE`.
#'
#' @return `data`, with labels applied and an audit in its `label_report`
#'   attribute, plus reference `original_labels`/`original_values`
#'   attributes preserving the original SPSS value coding regardless of
#'   `to_factor`/`to_numeric` reshaping. A new `"LASA_wave"` column is added
#'   after `"respnr"` when `standardize_names = TRUE` or `split_wavecode =
#'   TRUE`.
#'
#' @seealso [apply_lasa046_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(BWALK01 = c(1, 2), BWALK04 = c(8.2, -6))
#' dat <- apply_lasa034_labels(dat, wave = "B")
#' attr(dat$BWALK01, "label")
#' attr(dat$BWALK01, "labels")
#'
#' dat <- apply_lasa034_labels(
#'   dat, wave = "B", to_factor = TRUE, to_numeric = TRUE,
#'   standardize_names = TRUE
#' )
apply_lasa034_labels <- function(data,
                                 wave,
                                 name_corrections = NULL,
                                 to_factor = FALSE,
                                 to_numeric = FALSE,
                                 standardize_names = FALSE,
                                 split_wavecode = FALSE) {
  wave <- toupper(wave)
  wave_prefix <- c(
    B = "b", C = "c", D = "d", E = "e", `2B` = "b",
    F = "f", G = "g", H = "h", `3B` = "b", MB = "b",
    I = "i", J = "j", K = "k"
  )

  if (length(wave) != 1L || is.na(wave) || !wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 034 wave: ", paste(wave, collapse = ", "),
      ". Use one of: ", paste(names(wave_prefix), collapse = ", "), ".",
      call. = FALSE
    )
  }
  prefix <- unname(wave_prefix[[wave]])

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa034_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  value_labels <- function(labels, codes) {
    stats::setNames(as.numeric(codes), labels)
  }

  reference_name <- function(suffix) {
    toupper(paste0(prefix, suffix))
  }

  missing_codes <- function(ref = NULL,
                            wrong_skip = TRUE,
                            wrong_skip_code = -3,
                            wrong_skip_label = "na, wrong skip",
                            asked = TRUE,
                            asked_label = "na, asked",
                            minus6 = NULL,
                            technical_missing = FALSE) {
    out <- numeric(0)
    if (isTRUE(technical_missing)) {
      out <- c(out, value_labels("na, technical missing", -7))
    }
    if (!is.null(minus6)) {
      out <- c(out, value_labels(minus6, -6))
    }
    if (isTRUE(wrong_skip)) {
      out <- c(out, value_labels(wrong_skip_label, wrong_skip_code))
    }
    if (!is.null(ref)) {
      out <- c(out, value_labels(paste0("na, see ", ref), -2))
    }
    if (isTRUE(asked)) {
      out <- c(out, value_labels(asked_label, -1))
    }
    out
  }

  completed_codes <- function(missing) {
    c(
      missing,
      value_labels(
        c(
          "completed without help", "completed with help", "terminated",
          "not done"
        ),
        1:4
      )
    )
  }

  no_yes_codes <- function(missing, zero_based = FALSE) {
    if (zero_based) {
      c(missing, value_labels(c("no", "yes"), 0:1))
    } else {
      c(missing, value_labels(c("no", "yes"), 1:2))
    }
  }

  mentioned_codes <- function(missing) {
    c(missing, value_labels(c("not mentioned", "mentioned"), 0:1))
  }

  pain_scale_codes <- function(missing) {
    c(
      missing,
      value_labels(
        c(
          "no hurt", "hurts a little bit", "hurts a little more",
          "hurts even more", "hurts a whole lot", "hurts worst"
        ),
        c(0, 2, 4, 6, 8, 10)
      )
    )
  }

  # Wave B used an earlier performance-test protocol, including the button
  # test and a four-phase cardigan test.
  if (wave == "B") {
    label_variable(
      "cardig1", "Cardigan: phase 1 elbow",
      completed_codes(missing_codes(
        ref = reference_name("rmpf"), wrong_skip = FALSE,
        minus6 = "na, test not done"
      ))
    )
    label_variable(
      "cardig2", "Cardigan: phase 2 shoulder",
      completed_codes(missing_codes(ref = reference_name("cardig1")))
    )
    label_variable(
      "cardig3", "Cardigan: phase 3 other arm",
      completed_codes(missing_codes(ref = reference_name("cardig2")))
    )
    label_variable(
      "cardig4", "Cardigan: time 1 in seconds",
      missing_codes(
        ref = reference_name("cardig3"), minus6 = "na, no measuring"
      )
    )
    label_variable(
      "button1", "Button: phase 1 grasping",
      completed_codes(missing_codes(
        ref = reference_name("rmpf"), wrong_skip = FALSE
      ))
    )
    label_variable(
      "button2", "Button: phase 2 through",
      c(
        completed_codes(missing_codes(ref = reference_name("button1"))),
        value_labels("wrong buttonhole", 5)
      )
    )
    label_variable(
      "button3", "Button: time in seconds",
      missing_codes(
        ref = reference_name("button2"), minus6 = "na, no measuring"
      )
    )
    label_variable(
      "cardig7", "Cardigan: phase 4 out",
      completed_codes(missing_codes(ref = reference_name("cardig1")))
    )
    label_variable(
      "cardig8", "Cardigan: time 2 in seconds",
      missing_codes(ref = reference_name("cardig7"))
    )

    label_variable(
      "walk01", "Physical check",
      c(
        missing_codes(ref = reference_name("rmpf"), wrong_skip = FALSE),
        value_labels(
          c(
            "no restrictions", "in wheelchair", "recent surgery",
            "recent accident", "other"
          ),
          1:5
        )
      )
    )
    label_variable(
      "walk02", "Check walking ability",
      c(
        missing_codes(ref = reference_name("walk01")),
        value_labels(
          c(
            "respondent already walked", "can walk (with aid)",
            "can walk with aid not available", "cannot walk"
          ),
          1:4
        )
      )
    )
    label_variable(
      "walk03", "R walked alone",
      c(
        missing_codes(ref = paste0(reference_name("walk01"), " & 02")),
        value_labels(c("no", "yes", "terminated"), 1:3)
      )
    )
    b_walk_time <- missing_codes(
      ref = reference_name("walk03"), minus6 = "na, no measuring"
    )
    label_variable("walk04", "Walking: time in seconds", b_walk_time)
    label_variable("walk05", "Walking: number of steps", b_walk_time)
    label_variable(
      "walk06", "Walking aids during tests",
      c(
        missing_codes(ref = reference_name("walk02")),
        value_labels(c("walkingbar", "stick", "other", "none"), 1:4)
      )
    )
    label_variable(
      "walk07", "Walking: pain during test",
      no_yes_codes(missing_codes(ref = reference_name("walk02")))
    )
    label_variable(
      "walk08", "Walking: type of floor",
      c(
        missing_codes(ref = reference_name("walk02")),
        value_labels(
          c("parquet/tiles", "low carpet", "high carpet", "not done/terminated"),
          1:4
        )
      )
    )
    b_walk_observation <- no_yes_codes(
      missing_codes(ref = reference_name("walk03")), zero_based = TRUE
    )
    label_variable(
      "walk09", "Observation: particularities", b_walk_observation
    )
    b_walk_mentioned <- mentioned_codes(
      missing_codes(ref = reference_name("walk09"))
    )
    walk_observation_labels <- c(
      walk10 = "Observation: starting problems",
      walk11 = "Observation: unstable",
      walk12 = "Observation: walk with a limp",
      walk13 = "Observation: stiff legs",
      walk14 = "Observation: slides",
      walk15 = "Observation: one leg trains",
      walk16 = "Observation: unstable turn",
      walk17 = "Observation: walk irregular",
      walk18 = "Observation: other"
    )
    for (suffix in names(walk_observation_labels)) {
      label_variable(suffix, walk_observation_labels[[suffix]], b_walk_mentioned)
    }
    label_variable(
      "walk19", "Test terminated: reason",
      c(
        missing_codes(ref = reference_name("walk03")),
        value_labels(
          c(
            "not enough room/time", "R refused", "exercise not safe",
            "physically not capable", "R did not understand", "other"
          ),
          1:6
        )
      )
    )

    label_variable(
      "chair1", "Chair: R in wheelchair",
      no_yes_codes(missing_codes(
        ref = reference_name("rmpf"), wrong_skip = FALSE
      ))
    )
    label_variable(
      "chair2", "Chair: R without help from wheelchair",
      no_yes_codes(missing_codes(ref = reference_name("chair1")))
    )
    label_variable(
      "chair3", "Chair: sliding",
      c(
        missing_codes(ref = reference_name("chair2")),
        value_labels(
          c(
            "slides forward without using arms", "slides forward using arms",
            "cannot slide forward", "not done/terminated"
          ),
          1:4
        )
      )
    )
    label_variable(
      "chair4", "Chair: rising",
      c(
        missing_codes(ref = reference_name("chair2")),
        value_labels(
          c("succeeded without using arms", "succeeded using arms", "cannot"),
          1:3
        )
      )
    )
    label_variable(
      "chair5", "Chair: use of arms",
      c(
        missing_codes(ref = reference_name("chair4")),
        value_labels(
          c(
            "no: five times completed", "no: less than five times",
            "yes: less than five times"
          ),
          1:3
        )
      )
    )
    b_chair_count <- missing_codes(
      ref = reference_name("chair4"), minus6 = "na, no measuring"
    )
    label_variable("chair6", "Chair: number of times", b_chair_count)
    label_variable("chair7", "Chair: time in seconds", b_chair_count)
    label_variable(
      "chair8", "Chair: height in cm",
      missing_codes(ref = reference_name("chair4"))
    )
    label_variable(
      "chair9", "Observation: unstable during rise",
      no_yes_codes(missing_codes(ref = reference_name("chair4")))
    )
    label_variable(
      "rmpf", "Reason missing: performance test",
      value_labels(
        c("valid score", "short version", "interview terminated"),
        c(-2, 1, 2)
      )
    )
    return(engine$finalize())
  }

  # Cardigan test (not administered in wave MB; phases 2, 3, 6, and 7 were
  # no longer used from wave I onward).
  if (wave != "MB") {
    label_variable(
      "cardig1",
      if (wave %in% c("I", "J")) {
        "Cardigan: put on cardigan"
      } else {
        "Cardigan: put in 1st arm"
      },
      completed_codes(missing_codes(
        ref = reference_name("rmpf"), minus6 = "na, test not done",
        technical_missing = TRUE
      ))
    )
    if (!wave %in% c("I", "J", "K")) {
      label_variable(
        "cardig2", "Cardigan: pull over shoulder",
        completed_codes(missing_codes(ref = reference_name("cardig1")))
      )
      label_variable(
        "cardig3", "Cardigan: put in 2nd arm",
        completed_codes(missing_codes(ref = reference_name("cardig2")))
      )
    }
    label_variable(
      "cardig4", "Cardigan: time 1 in seconds",
      missing_codes(
        ref = reference_name("cardig1"), minus6 = "na, no measurement",
        asked_label = "no (valid) answer"
      )
    )
    label_variable(
      "cardig5",
      if (wave %in% c("I", "J")) {
        "Cardigan: take off cardigan"
      } else {
        "Cardigan: free 1st arm"
      },
      completed_codes(missing_codes(
        ref = reference_name("cardig1"), wrong_skip = FALSE
      ))
    )
    if (!wave %in% c("I", "J", "K")) {
      label_variable(
        "cardig6", "Cardigan: free 2nd arm",
        completed_codes(missing_codes(
          ref = reference_name("cardig5"), wrong_skip = FALSE
        ))
      )
      label_variable(
        "cardig7", "Cardigan: out",
        completed_codes(missing_codes(
          ref = reference_name("cardig6"), wrong_skip = FALSE
        ))
      )
    }
    label_variable(
      "cardig8", "Cardigan: time 2 in seconds",
      missing_codes(
        ref = reference_name("cardig5"), minus6 = "na, no measurement",
        asked_label = "no (valid) answer"
      )
    )

    cardig9_values <- c(
      missing_codes(ref = reference_name("cardig1")),
      value_labels(c("standing", "sitting"), 1:2)
    )
    if (wave %in% c("D", "E", "2B")) {
      cardig9_values <- c(cardig9_values, value_labels("otherway", 3))
    } else if (wave %in% c("F", "G", "H", "3B", "I", "J", "K")) {
      cardig9_values <- c(
        cardig9_values,
        value_labels(c("test not done", "other way"), c(3, 4))
      )
    }
    label_variable("cardig9", "Cardigan: sitting/standing", cardig9_values)
  }

  label_variable(
    "walk01", "Physical check",
    c(
      missing_codes(
        ref = reference_name("rmpf"), minus6 = "na, test not done"
      ),
      value_labels(
        c(
          "no restrictions", "in wheelchair", "recent surgery",
          "recent accident", "other"
        ),
        1:5
      )
    )
  )
  label_variable(
    "walk02", "Check walking ability",
    c(
      missing_codes(ref = reference_name("walk01")),
      value_labels(
        c(
          "respondent already walked", "can walk (with aid)",
          "can walk with aid not available", "cannot walk"
        ),
        1:4
      )
    )
  )
  label_variable(
    "walk03", "R walked alone",
    c(
      missing_codes(ref = paste0(reference_name("walk01"), "&02")),
      value_labels(c("no", "yes", "terminated"), 1:3)
    )
  )
  label_variable(
    "walk04", "Walking: time in seconds",
    missing_codes(
      ref = reference_name("walk03"), wrong_skip = FALSE,
      minus6 = "na, no measurement", asked_label = "no (valid) answer"
    )
  )
  if (wave %in% c("H", "3B", "MB", "I", "J")) {
    walk04a_missing <- missing_codes(
      ref = reference_name("walk03"), wrong_skip = FALSE,
      minus6 = "na, no measurement", asked_label = "no (valid) answer"
    )
    if (wave == "J") {
      walk04a_missing <- append(
        walk04a_missing,
        value_labels("na, born after 1940", -3),
        after = 1L
      )
    }
    label_variable(
      "walk04a", "Walking oneway: time in seconds", walk04a_missing
    )
  }
  if (wave %in% c("C", "D", "E", "2B", "F", "G")) {
    label_variable(
      "walk05", "Walking: number of steps",
      missing_codes(
        ref = reference_name("walk03"), wrong_skip = FALSE,
        minus6 = "na, no measurement", asked_label = "no (valid) answer"
      )
    )
  }

  walk06_missing <- missing_codes(
    ref = reference_name("walk03"),
    wrong_skip = wave %in% c("I", "J", "K")
  )
  walk06_values <- if (wave == "C") {
    value_labels(c("walkingbar", "stick", "other", "none"), 1:4)
  } else if (wave == "D") {
    value_labels(c("walkingbar", "stick", "rollator", "other", "none"), 1:5)
  } else {
    value_labels(
      c(
        "walkingbar", "stick", "rollator",
        "leaning on objects/interviewer", "other", "none"
      ),
      1:6
    )
  }
  label_variable(
    "walk06", "Walking aids during tests", c(walk06_missing, walk06_values)
  )

  if (wave %in% c("3B", "MB")) {
    walk07_values <- pain_scale_codes(missing_codes(
      ref = reference_name("walk03"), wrong_skip_code = -6
    ))
  } else {
    walk07_values <- no_yes_codes(missing_codes(
      ref = reference_name("walk03"),
      wrong_skip_code = if (wave %in% c("C", "D", "E", "2B", "F", "G", "H")) -6 else -3
    ))
  }
  label_variable("walk07", "Walking: pain during test", walk07_values)

  if (wave %in% c("C", "D", "E", "2B", "F", "G", "H")) {
    label_variable(
      "walk08", "Walking: type of floor",
      c(
        missing_codes(ref = reference_name("walk03")),
        value_labels(
          c("parquet/tiles", "low carpet", "high carpet", "not done/terminated"),
          1:4
        )
      )
    )
  }

  # The PDF omits H from both coding headings for WALK09. The H questionnaire
  # predates the 3B change, so its 0/1 coding follows C-G.
  walk09_values <- if (wave %in% c("3B", "MB", "I", "J", "K")) {
    no_yes_codes(missing_codes(ref = reference_name("walk03")))
  } else {
    no_yes_codes(
      missing_codes(ref = reference_name("walk03")), zero_based = TRUE
    )
  }
  label_variable("walk09", "Walking observ.: particularities", walk09_values)

  walk_mentioned <- mentioned_codes(
    missing_codes(ref = reference_name("walk09"))
  )
  walk_observation_labels <- c(
    walk10 = "Walking observ.: starting problems",
    walk11 = "Walking observ.: unstable",
    walk12 = "Walking observ.: walk with a limp",
    walk13 = "Walking observ.: stiff legs",
    walk14 = "Walking observ.: slides",
    walk15 = "Walking observ.: one leg trains",
    walk16 = "Walking observ.: unstable turn",
    walk17 = "Walking observ.: walk irregular"
  )
  for (suffix in names(walk_observation_labels)) {
    label_variable(suffix, walk_observation_labels[[suffix]], walk_mentioned)
  }
  if (wave %in% c("H", "3B", "MB", "I", "J", "K")) {
    label_variable(
      "walk17a", "Walking observ.: walk small steps", walk_mentioned
    )
  }
  label_variable("walk18", "Walking observ.: other", walk_mentioned)
  label_variable(
    "walk19", "Test terminated: reason",
    c(
      missing_codes(ref = reference_name("walk03")),
      value_labels(
        c(
          "not enough room/time", "R refused", "exercise not safe",
          "physically not capable", "R did not understand", "other"
        ),
        1:6
      )
    )
  )

  chair_test_missing <- missing_codes(
    ref = reference_name("rmpf"), minus6 = "na, test not done"
  )
  label_variable(
    "chair1", "Chair: R in wheelchair",
    no_yes_codes(chair_test_missing)
  )
  label_variable(
    "chair2", "Chair: R without help from wheelchair",
    no_yes_codes(missing_codes(ref = reference_name("chair1")))
  )
  chair12_ref <- paste0(reference_name("chair1"), "&2")
  label_variable(
    "chair3", "Chair: sliding",
    c(
      missing_codes(ref = chair12_ref),
      value_labels(
        c(
          "slides forward without using arms", "slides forward using arms",
          "cannot slide forward", "not done/terminated"
        ),
        1:4
      )
    )
  )
  chair4_substantive <- value_labels(
    c("succeeded without using arms", "succeeded using arms", "cannot"),
    1:3
  )
  if (wave %in% c("F", "G", "H", "3B", "MB", "I", "J", "K")) {
    chair4_substantive <- c(
      chair4_substantive, value_labels("not done/terminated", 4)
    )
  }
  label_variable(
    "chair4", "Chair: rising",
    c(missing_codes(ref = chair12_ref), chair4_substantive)
  )
  label_variable(
    "chair5", "Chair: use of arms",
    c(
      missing_codes(
        ref = reference_name("chair4"), minus6 = "na, test not done"
      ),
      value_labels(
        c(
          "no: five times completed", "no: less than five times",
          "yes: less than five times"
        ),
        1:3
      )
    )
  )
  chair_count_missing <- missing_codes(
    ref = reference_name("chair5"), minus6 = "na, no measurement"
  )
  label_variable("chair6", "Chair: number of times", chair_count_missing)
  label_variable("chair7", "Chair: time in seconds", chair_count_missing)
  if (wave %in% c("C", "D", "E", "2B", "F", "G", "H")) {
    label_variable(
      "chair8", "Chair: height in cm",
      missing_codes(
        ref = reference_name("chair5"), minus6 = "na, no measurement"
      )
    )
    label_variable(
      "chair9", "Observation: unstable during rise",
      no_yes_codes(missing_codes(ref = reference_name("chair5")))
    )
  }
  if (wave %in% c("3B", "MB")) {
    label_variable(
      "chair10", "Chair: pain during test",
      pain_scale_codes(missing_codes(
        ref = reference_name("chair5"), wrong_skip_code = -6
      ))
    )
  }

  if (!wave %in% c("2B")) {
    tandem1_values <- c(
      missing_codes(
        ref = reference_name("rmpf"), minus6 = "na, test not done"
      ),
      value_labels(c("normal test", "not capable"), 1:2),
      value_labels(
        if (wave %in% c("J", "K")) {
          "immediately steps out of position (in less than 1 second)"
        } else {
          "falls almost direct"
        },
        3
      )
    )
    if (!wave %in% c("J", "K")) {
      tandem1_values <- c(
        tandem1_values, value_labels("stops within 3 sec.", 4)
      )
    }
    tandem1_values <- c(
      tandem1_values, value_labels(c("refusal", "physical impossible"), 5:6)
    )
    label_variable("tandem1", "Tandem: able to", tandem1_values)

    # KTANDEM2 is not listed in the PDF's documented variable sequence.
    if (wave != "K") {
      label_variable(
        "tandem2", "Tandem: time in seconds",
        missing_codes(ref = reference_name("tandem1"))
      )
    }
  }
  if (wave %in% c("J", "K")) {
    label_variable(
      "tandem3", "Tandem: able to with eyes closed",
      c(
        missing_codes(ref = reference_name("tandem1")),
        value_labels(
          c(
            "normal test", "not capable",
            "immediately steps out of position (in less than 1 second)"
          ),
          1:3
        ),
        value_labels(c("refusal", "physical impossible"), 5:6)
      )
    )
    label_variable(
      "tandem4", "Tandem: time in seconds with eyes closed",
      missing_codes(ref = reference_name("tandem3"))
    )
  }

  rmpf_values <- if (wave == "C") {
    value_labels(
      c("valid score", "short version", "interview terminated"),
      c(-2, 1, 2)
    )
  } else {
    c(
      value_labels(
        c("valid data", "short interview", "interview terminated"),
        c(-2, 1, 2)
      ),
      if (wave %in% c("I", "J", "K")) {
        value_labels("PF not done, not able", 3)
      } else {
        numeric(0)
      }
    )
  }
  label_variable("rmpf", "Reason missing: Performance tests", rmpf_values)

  engine$finalize()
}
