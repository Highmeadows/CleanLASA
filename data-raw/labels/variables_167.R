## LASA filecode 167 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_167 <- list(
  variables = data.frame(
    wave = c(
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB"
    ),
    variable_name = c(
      "bmnwctf1",
      "bmnwctf2",
      "bmnwctf3",
      "bmnwctf4",
      "bmnwctf6",
      "bmnwctf8",
      "imnwctf1",
      "imnwctf2",
      "imnwctf3",
      "imnwctf4",
      "imnwctf6",
      "imnwctf8",
      "bnwctf1",
      "bnwctf2",
      "bnwctf3",
      "bnwctf4",
      "bnwctf5",
      "bnwctf6",
      "bnwctf7",
      "bnwctf8",
      "breschild",
      "bresinlaws",
      "bresotherkin",
      "bressibs"
    ),
    canonical_name = c(
      "mnwctf1",
      "mnwctf2",
      "mnwctf3",
      "mnwctf4",
      "mnwctf6",
      "mnwctf8",
      "mnwctf1",
      "mnwctf2",
      "mnwctf3",
      "mnwctf4",
      "mnwctf6",
      "mnwctf8",
      "nwctf1",
      "nwctf2",
      "nwctf3",
      "nwctf4",
      "nwctf5",
      "nwctf6",
      "nwctf7",
      "nwctf8",
      "reschild",
      "resinlaws",
      "resotherkin",
      "ressibs"
    ),
    variable_label = c(
      "contact frequency children (not co-residing)",
      "contact frequency grandchildren (not co-residing)",
      "contact frequency children-in-law",
      "contact frequency uncles, aunts, siblings, in-laws",
      "contact frequency friends, acquaintances",
      "contact frequency neighbors",
      "contact frequency children (not co-residing)",
      "contact frequency grandchildren (not co-residing)",
      "contact frequency children-in-law",
      "contact frequency uncles, aunts, siblings, in-laws",
      "contact frequency friends, acquaintances",
      "contact frequency neighbors",
      "contact frequency children (not co-residing)",
      "contact frequency grandchildren (not co-residing)",
      "contact frequency children-in-law",
      "contact frequency uncles, aunts, siblings, in-laws",
      "contact frequency MT friends, acquaintances",
      "contact frequency NL/other friends, acquaintances",
      "contact frequency MT neighbors",
      "contact frequency NL/other neighbors",
      "residence children (in-law): in NL or abroad",
      "residence in-laws: in NL or abroad",
      "residence other kin: in NL or abroad",
      "residence siblings: in NL or abroad"
    ),
    harmonized_var_label = c(
      "contact frequency children (not co-residing)",
      "contact frequency grandchildren (not co-residing)",
      "contact frequency children-in-law",
      "contact frequency uncles, aunts, siblings, in-laws",
      "contact frequency friends, acquaintances",
      "contact frequency neighbors",
      "contact frequency children (not co-residing)",
      "contact frequency grandchildren (not co-residing)",
      "contact frequency children-in-law",
      "contact frequency uncles, aunts, siblings, in-laws",
      "contact frequency friends, acquaintances",
      "contact frequency neighbors",
      "contact frequency children (not co-residing)",
      "contact frequency grandchildren (not co-residing)",
      "contact frequency children-in-law",
      "contact frequency uncles, aunts, siblings, in-laws",
      "contact frequency MT friends, acquaintances",
      "contact frequency NL/other friends, acquaintances",
      "contact frequency MT neighbors",
      "contact frequency NL/other neighbors",
      "residence of children (in-law): Netherlands or abroad",
      "residence of in-laws: Netherlands or abroad",
      "residence of other kin: Netherlands or abroad",
      "residence of siblings: Netherlands or abroad"
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
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
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
    mnwctf1 = list(
      `3B` = never_or_less_than_once_a_year_once_or_few_times_a_year,
      I = never_or_less_than_once_a_year_once_or_few_times_a_year
    ),
    mnwctf2 = list(
      `3B` = never_or_less_than_once_a_year_once_or_few_times_a_year,
      I = never_or_less_than_once_a_year_once_or_few_times_a_year
    ),
    mnwctf3 = list(
      `3B` = never_or_less_than_once_a_year_once_or_few_times_a_year,
      I = never_or_less_than_once_a_year_once_or_few_times_a_year
    ),
    mnwctf4 = list(
      `3B` = never_or_less_than_once_a_year_once_or_few_times_a_year,
      I = never_or_less_than_once_a_year_once_or_few_times_a_year
    ),
    mnwctf6 = list(
      `3B` = never_or_less_than_once_a_year_once_or_few_times_a_year,
      I = never_or_less_than_once_a_year_once_or_few_times_a_year
    ),
    mnwctf8 = list(
      `3B` = never_or_less_than_once_a_year_once_or_few_times_a_year,
      I = never_or_less_than_once_a_year_once_or_few_times_a_year
    ),
    nwctf1 = list(
      MB = not_asked_interview_terminated_skip
    ),
    nwctf2 = list(
      MB = not_asked_interview_terminated_skip
    ),
    nwctf3 = list(
      MB = not_asked_interview_terminated_skip
    ),
    nwctf4 = list(
      MB = not_asked_interview_terminated_skip
    ),
    nwctf5 = list(
      MB = not_asked_interview_terminated_skip
    ),
    nwctf6 = list(
      MB = not_asked_interview_terminated_skip
    ),
    nwctf7 = list(
      MB = not_asked_interview_terminated_skip
    ),
    nwctf8 = list(
      MB = not_asked_interview_terminated_skip
    ),
    reschild = list(
      MB = in_netherlands_in_morocco_turkey_elsewhere
    ),
    resinlaws = list(
      MB = in_netherlands_in_morocco_turkey_elsewhere
    ),
    resotherkin = list(
      MB = in_netherlands_in_morocco_turkey_elsewhere
    ),
    ressibs = list(
      MB = in_netherlands_in_morocco_turkey_elsewhere
    )
  ),

  value_labels_harmonized = list(
    mnwctf1 = never_or_less_than_once_a_year_once_or_few_times_a_year,
    mnwctf2 = never_or_less_than_once_a_year_once_or_few_times_a_year,
    mnwctf3 = never_or_less_than_once_a_year_once_or_few_times_a_year,
    mnwctf4 = never_or_less_than_once_a_year_once_or_few_times_a_year,
    mnwctf6 = never_or_less_than_once_a_year_once_or_few_times_a_year,
    mnwctf8 = never_or_less_than_once_a_year_once_or_few_times_a_year,
    nwctf1 = not_asked_interview_terminated_skip,
    nwctf2 = not_asked_interview_terminated_skip,
    nwctf3 = not_asked_interview_terminated_skip,
    nwctf4 = not_asked_interview_terminated_skip,
    nwctf5 = not_asked_interview_terminated_skip,
    nwctf6 = not_asked_interview_terminated_skip,
    nwctf7 = not_asked_interview_terminated_skip,
    nwctf8 = not_asked_interview_terminated_skip,
    reschild = in_netherlands_in_morocco_turkey_elsewhere,
    resinlaws = in_netherlands_in_morocco_turkey_elsewhere,
    resotherkin = in_netherlands_in_morocco_turkey_elsewhere,
    ressibs = in_netherlands_in_morocco_turkey_elsewhere
  )
)
