## LASA filecode 128 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_128 <- list(
  variables = data.frame(
    wave = c("I", "I", "I", "I", "I", "I", "I", "I", "J", "J", "J", "J", "J"),
    variable_name = c(
      "iqdona1",
      "iqdona2",
      "iqdona3",
      "iqdona4",
      "iqdona5",
      "iqdona6",
      "iqdona7",
      "iqdona8",
      "jqdona1",
      "jqdona1_2",
      "jqdona1_3",
      "jqdona1_4",
      "jqdona1_5"
    ),
    canonical_name = c(
      "qdona1",
      "qdona2",
      "qdona3",
      "qdona4",
      "qdona5",
      "qdona6",
      "qdona7",
      "qdona8",
      "qdona1",
      "qdona1_2",
      "qdona1_3",
      "qdona1_4",
      "qdona1_5"
    ),
    variable_label = c(
      "registered as a blood or plasma donor",
      "ever registered as a blood or plasma donor",
      "former blood or plasma donor: until which year registered",
      "former blood or plasma donor: reason stopped",
      "former blood or plasma donor: from which year first registration",
      "current blood or plasma donor: how often donation past 12 months",
      "received form from ministry about organ donation",
      "decision about organ donation",
      "registered as a blood or plasma donor",
      "New donor law: returned form about organ donation",
      "Previous decision about organ donation",
      "Choice changed since the new donor law",
      "Current decision about organ donation"
    ),
    harmonized_var_label = c(
      "registered as a blood or plasma donor",
      "ever registered as a blood or plasma donor",
      "former blood or plasma donor: until which year registered",
      "former blood or plasma donor: reason stopped",
      "former blood or plasma donor: from which year first registration",
      "current blood or plasma donor: how often donation past 12 months",
      "received form from ministry about organ donation",
      "decision about organ donation",
      "registered as a blood or plasma donor",
      "New donor law: returned form about organ donation",
      "Previous decision about organ donation",
      "Choice changed since the new donor law",
      "Current decision about organ donation"
    ),
    var_type = c(
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "numeric",
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
    qdona1 = list(
      I = yes_blood_yes_plasma_no,
      J = yes_blood_yes_plasma_no
    ),
    qdona2 = list(
      I = c(`-2` = "na, see IQDONA1", `1` = "yes, blood", `2` = "yes, plasma", `3` = "no")
    ),
    qdona3 = list(
      I = na_see_iqdona2_na_asked
    ),
    qdona4 = list(
      I = c(
        `-2` = "na, see IQDONA2",
        `-1` = "na, asked",
        `1` = "disapproved based on age",
        `2` = "disapproved for health reasons",
        `3` = "no time anymore",
        `4` = "not interested anymore",
        `5` = "other reason"
      )
    ),
    qdona5 = list(
      I = na_see_iqdona2_na_asked
    ),
    qdona6 = list(
      I = c(
        `-2` = "na, see IQDONA1",
        `-1` = "na, asked",
        `1` = "more than once a month",
        `2` = "once a month",
        `3` = "2-3 times",
        `4` = "once",
        `5` = "not at all",
        `6` = "R does not know"
      )
    ),
    qdona7 = list(
      I = c(`-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "R does not know anymore")
    ),
    qdona8 = list(
      I = c(
        `-2` = "na, see IQDONA7",
        `-1` = "na, asked",
        `1` = "I do not make my organs available",
        `2` = "I make all my organs available",
        `3` = "I make some organs available",
        `4` = "I leave the choice to my next of kin",
        `5` = "I do not know / do not want to say it"
      )
    ),
    qdona1_2 = list(
      J = c(`-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "do not know")
    ),
    qdona1_3 = list(
      J = c(
        `-2` = "na, see JQDONA1_2",
        `-1` = "na, asked",
        `1` = "I do not make my organs available",
        `2` = "I make all my organs available",
        `3` = "I make some organs available",
        `4` = "I leave the choice to my next of kin",
        `5` = "I do not know / do not want to say it"
      )
    ),
    qdona1_4 = list(
      J = c(`-2` = "na, see JQDONA1_2", `-1` = "na, asked", `1` = "yes", `2` = "no")
    ),
    qdona1_5 = list(
      J = c(
        `-2` = "na, see JQDONA1_4",
        `-1` = "na, asked",
        `1` = "I do not make my organs available",
        `2` = "I make all my organs available",
        `3` = "I make some organs available",
        `4` = "I leave the choice to my next of kin",
        `5` = "I do not know / do not want to say it"
      )
    )
  ),

  value_labels_harmonized = list(
    qdona1 = c(`-1` = "not available", `1` = "yes, blood", `2` = "yes, plasma", `3` = "no"),
    qdona1_2 = c(`-1` = "not available", `1` = "yes", `2` = "no", `3` = "do not know"),
    qdona1_3 = i_do_not_make_my_organs_available,
    qdona1_4 = c(`-2` = "not available, routing", `-1` = "not available", `1` = "yes", `2` = "no"),
    qdona1_5 = i_do_not_make_my_organs_available,
    qdona2 = c(`-2` = "not available, routing", `1` = "yes, blood", `2` = "yes, plasma", `3` = "no"),
    qdona3 = not_available_routing_not_available,
    qdona4 = c(
      `-2` = "not available, routing",
      `-1` = "not available",
      `1` = "disapproved based on age",
      `2` = "disapproved for health reasons",
      `3` = "no time anymore",
      `4` = "not interested anymore",
      `5` = "other reason"
    ),
    qdona5 = not_available_routing_not_available,
    qdona6 = c(
      `-2` = "not available, routing",
      `-1` = "not available",
      `1` = "more than once a month",
      `2` = "once a month",
      `3` = "2-3 times",
      `4` = "once",
      `5` = "not at all",
      `6` = "R does not know"
    ),
    qdona7 = c(`-1` = "not available", `1` = "yes", `2` = "no", `3` = "R does not know anymore"),
    qdona8 = i_do_not_make_my_organs_available
  )
)
