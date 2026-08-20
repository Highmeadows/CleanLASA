## LASA filecode 248 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_248 <- list(
  variables = data.frame(
    wave = c(
      "2B",
      "2B",
      "2B",
      "2B",
      "2B",
      "2B",
      "2B",
      "2B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "E",
      "F",
      "MB",
      "MB"
    ),
    variable_name = c(
      "b048stat",
      "bch_aliv",
      "bchild",
      "bchoth",
      "bchown",
      "bchstep",
      "bnc_volu",
      "bnchild",
      "b048stat",
      "bch_aliv",
      "bchild",
      "bchoth",
      "bchown",
      "bchstep",
      "bnc_volu",
      "bnchild",
      "edata048",
      "fdata048",
      "bnchild",
      "bnrecs048"
    ),
    canonical_name = c(
      "048stat",
      "ch_aliv",
      "child",
      "choth",
      "chown",
      "chstep",
      "nc_volu",
      "nchild",
      "048stat",
      "ch_aliv",
      "child",
      "choth",
      "chown",
      "chstep",
      "nc_volu",
      "nchild",
      "data048",
      "data048",
      "nchild",
      "nrecs048"
    ),
    variable_label = c(
      "status data collected b048",
      "number of children alive",
      "parental status (based on b048)",
      "# other (type unknown, adopt, foster) (alive)",
      "# own children (alive)",
      "# step children (alive)",
      "reason for childlessness",
      "number of children",
      "status data collected b048",
      "number of children alive (biological, step, adoptive, foster)",
      "parental status (based on b048)",
      "# other (type unknown, adopt, foster) (alive)",
      "# own children (alive)",
      "# step children (alive)",
      "reason for childlessness",
      "number of children ever (biological, step, adoptive, foster)",
      "availability data 048",
      "availability data 048",
      "number of children (questions in demographic part f-t-f interview)",
      "number of children (questions in medical interview)"
    ),
    harmonized_var_label = c(
      "Status of children data collection (048)",
      "Number of children alive",
      "Parental status based on children data",
      "Number of other children alive (unknown/adoptive/foster)",
      "Number of own children alive",
      "Number of stepchildren alive",
      "Reason for childlessness",
      "Number of children",
      "Status of children data collection (048)",
      "Number of children alive",
      "Parental status based on children data",
      "Number of other children alive (unknown/adoptive/foster)",
      "Number of own children alive",
      "Number of stepchildren alive",
      "Reason for childlessness",
      "Number of children",
      "Availability/status of children data (048)",
      "Availability/status of children data (048)",
      "Number of children",
      "Number of children (medical interview)"
    ),
    var_type = c(
      "categorical",
      "numeric",
      "categorical",
      "numeric",
      "numeric",
      "numeric",
      "categorical",
      "numeric",
      "categorical",
      "numeric",
      "categorical",
      "numeric",
      "numeric",
      "numeric",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "numeric"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    `048stat` = list(
      `2B` = c(
        `-3` = "terminated",
        `-2` = "refusal",
        `-1` = "no children",
        `1` = "children in a048",
        `2` = "children in b048, incomplete: type unknown",
        `3` = "children in b048, incomplete: foster children"
      ),
      `3B` = c(
        `-3` = "interview terminated",
        `-2` = "refusal on question about number of children",
        `-1` = "no children",
        `1` = "children in b048",
        `2` = "children in b048, incomplete: reason/type unknown",
        `4` = "children in b048, incomplete: refusal questions on children",
        `5` = "children in b048, incomplete: refusal questions on stepchildren"
      )
    ),
    ch_aliv = list(
      `2B` = blank,
      `3B` = no_answer
    ),
    child = list(
      `2B` = c(
        `-1` = "children?",
        `0` = "childless",
        `1` = "yes; no specific information",
        `2` = "yes, own",
        `3` = "yes, step",
        `4` = "yes, own + step",
        `5` = "yes, only other"
      ),
      `3B` = c(
        `-1` = "children? (no answer)",
        `0` = "childless",
        `1` = "yes; no specific information",
        `2` = "yes, own",
        `3` = "yes, step",
        `4` = "yes, own + step",
        `5` = "yes, only other"
      )
    ),
    choth = list(
      `2B` = no_specific_information,
      `3B` = children_in_this_category_number_unknown
    ),
    chown = list(
      `2B` = no_specific_information,
      `3B` = children_in_this_category_number_unknown
    ),
    chstep = list(
      `2B` = no_specific_information,
      `3B` = children_in_this_category_number_unknown
    ),
    nc_volu = list(
      `2B` = c(
        `-2` = "not childless",
        `-1` = "no answer",
        `1` = "choice",
        `2` = "no partner available",
        `3` = "inadequate life circumstances",
        `4` = "medical reasons",
        `5` = "no choice other"
      ),
      `3B` = c(
        `-3` = "not childless (answer)",
        `-2` = "not childless (not asked)",
        `-1` = "no answer",
        `1` = "choice",
        `2` = "no or not right partner available",
        `3` = "inadequate life circumstances",
        `4` = "medical reasons (fertility, illness)",
        `5` = "no choice other",
        `6` = "homosexual"
      )
    ),
    nchild = list(
      `2B` = blank,
      `3B` = no_answer,
      MB = c(
        `-3` = "skip questions children",
        `-1` = "no answer question no/yes children",
        `0` = NA_character_,
        `1` = NA_character_,
        `13` = NA_character_
      )
    ),
    data048 = list(
      E = c(
        `-5` = "all children died",
        `-4` = "no children",
        `-3` = "refusal",
        `-2` = "short/terminated interview",
        `-1` = "LSAdc",
        `1` = "data children"
      ),
      F = c(
        `-3` = "terminated interview",
        `-2` = "short version",
        `1` = "questions asked",
        `2` = "no children",
        `3` = "refusal",
        `4` = "short version",
        `5` = "born < 1938"
      )
    ),
    nrecs048 = list(
      MB = questions_048_not_asked_no_answer
    )
  ),

  value_labels_harmonized = list(
    `048stat` = c(
      `-3` = "interview terminated",
      `-2` = "refusal",
      `-1` = "no children",
      `1` = "children in b048",
      `2` = "children in b048, incomplete/unknown",
      `3` = "children in b048, incomplete: foster children",
      `4` = "children in b048, incomplete: refusal questions on children",
      `5` = "children in b048, incomplete: refusal questions on stepchildren"
    ),
    ch_aliv = c(
      `-1` = "no answer",
      `0` = NA_character_,
      `4` = NA_character_,
      `6` = NA_character_,
      `10` = NA_character_
    ),
    child = c(
      `-1` = "no answer on children",
      `0` = "childless",
      `1` = "yes; no specific information",
      `2` = "yes, own children",
      `3` = "yes, stepchildren",
      `4` = "yes, own and stepchildren",
      `5` = "yes, only other children"
    ),
    choth = number_unknown_no_specific_information,
    chown = number_unknown_no_specific_information,
    chstep = number_unknown_no_specific_information,
    data048 = c(
      `-5` = "all children died",
      `-4` = "no children",
      `-3` = "data unavailable due refusal/interview outcome",
      `-2` = "short/nonstandard interview",
      `-1` = "LSAdc",
      `1` = "children data/questions available",
      `2` = "no children",
      `3` = "refusal",
      `4` = "short version",
      `5` = "born < 1938"
    ),
    nc_volu = c(
      `-3` = "not childless (answer)",
      `-2` = "not childless / not asked",
      `-1` = "no answer",
      `1` = "choice",
      `2` = "no suitable partner available",
      `3` = "inadequate life circumstances",
      `4` = "medical reasons",
      `5` = "no choice other",
      `6` = "homosexual"
    ),
    nchild = c(
      `-3` = "skip questions children",
      `-1` = "no answer",
      `0` = NA_character_,
      `1` = NA_character_,
      `4` = NA_character_,
      `6` = NA_character_,
      `10` = NA_character_,
      `13` = NA_character_
    ),
    nrecs048 = questions_048_not_asked_no_answer
  )
)
