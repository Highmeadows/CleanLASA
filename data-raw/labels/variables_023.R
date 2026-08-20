## LASA filecode 023 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_023 <- list(
  variables = data.frame(
    wave = c("B", "B", "B", "B", "B", "B", "B", "B", "B", "F"),
    variable_name = c(
      "bevmem01",
      "bevmem02",
      "bevmem03",
      "bevmem04",
      "bevmem05",
      "bevmem06",
      "bevmem07",
      "bevmem08",
      "ndays",
      "fevmem08"
    ),
    canonical_name = c(
      "evmem01",
      "evmem02",
      "evmem03",
      "evmem04",
      "evmem05",
      "evmem06",
      "evmem07",
      "evmem08",
      "ndays",
      "evmem08"
    ),
    variable_label = c(
      "Everyday memory 01: choice pencil",
      "Everyday memory 02: recognition photo",
      "Everyday memory 03: object",
      "Q about diabetes asked?",
      "Q about raising arm asked?",
      "Q about occupation father asked?",
      "Q about emotions asked?",
      "Respondent left/right handed",
      "day of interviewing",
      "Respondent left/right handed"
    ),
    harmonized_var_label = c(
      "Everyday memory 01: choice pencil",
      "Everyday memory 02: recognition photo",
      "Everyday memory 03: object",
      "Q about diabetes asked?",
      "Q about raising arm asked?",
      "Q about occupation father asked?",
      "Q about emotions asked?",
      "Respondent left/right handed",
      "Day of interviewing",
      "Respondent left/right handed"
    ),
    var_type = c(
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    evmem01 = list(
      B = c(
        `-5` = "na, various reasons",
        `-1` = "na, asked",
        `0` = "wrong",
        `1` = "right corrected",
        `2` = "right"
      )
    ),
    evmem02 = list(
      B = c(
        `-5` = "na, various reasons",
        `-1` = "na, asked",
        `0` = "wrong",
        `1` = "right (partial)",
        `2` = "right"
      )
    ),
    evmem03 = list(
      B = c(
        `-5` = "na, various reasons",
        `-1` = "na, asked",
        `0` = "wrong",
        `1` = "partially right",
        `2` = "right"
      )
    ),
    evmem04 = list(
      B = not_asked_asked_cannot_remember
    ),
    evmem05 = list(
      B = not_asked_asked_cannot_remember
    ),
    evmem06 = list(
      B = not_asked_asked_cannot_remember
    ),
    evmem07 = list(
      B = not_asked_asked_cannot_remember
    ),
    evmem08 = list(
      B = c(
        `-5` = "na, various reasons",
        `-1` = "na, asked",
        `1` = "left handed",
        `2` = "right handed",
        `3` = "left handed but right hand"
      ),
      F = c(
        `-3` = "na, interview terminated",
        `-1` = "no observation",
        `1` = "R writes left handed",
        `2` = "R writes right handed",
        `3` = "R cannot write / other remark"
      )
    ),
    ndays = list(
      B = c(`-5` = "na, various reasons", `0` = "one day", `1` = "two days", `2` = "three days")
    )
  ),

  value_labels_harmonized = list(
    evmem01 = c(
      `-5` = "not available, various reasons",
      `-1` = "not available, asked",
      `0` = "wrong",
      `1` = "right corrected",
      `2` = "right"
    ),
    evmem02 = c(
      `-5` = "not available, various reasons",
      `-1` = "not available, asked",
      `0` = "wrong",
      `1` = "right (partial)",
      `2` = "right"
    ),
    evmem03 = c(
      `-5` = "not available, various reasons",
      `-1` = "not available, asked",
      `0` = "wrong",
      `1` = "partially right",
      `2` = "right"
    ),
    evmem04 = not_asked_asked_cannot_remember_2,
    evmem05 = not_asked_asked_cannot_remember_2,
    evmem06 = not_asked_asked_cannot_remember_2,
    evmem07 = not_asked_asked_cannot_remember_2,
    evmem08 = c(
      `-5` = "not available, various reasons",
      `-3` = "not available, interview terminated",
      `-1` = "not available",
      `1` = "left handed",
      `2` = "right handed",
      `3` = "other handedness/writing category"
    ),
    ndays = c(
      `-5` = "not available, various reasons",
      `0` = "one day",
      `1` = "two days",
      `2` = "three days"
    )
  )
)
