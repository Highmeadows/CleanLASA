## LASA filecode 126 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_126 <- list(
  variables = data.frame(
    wave = c(
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K"
    ),
    variable_name = c(
      "iqorh1",
      "iqorh2a",
      "iqorh2b",
      "iqorh3a",
      "iqorh3b",
      "iqorh3c",
      "iqorh4",
      "iqorh5a",
      "iqorh5b",
      "iqorh5c",
      "iqorh6a",
      "iqorh6b",
      "iqorh7",
      "iqorh8a",
      "iqorh8b",
      "iqorh8c",
      "iqorh8d",
      "iqorh8e",
      "iqorh8f",
      "iqorh8g",
      "iqorh8h",
      "iqorh8i",
      "jqorh1",
      "jqorh2a",
      "jqorh2b",
      "jqorh3",
      "jqorh3d",
      "jqorh7",
      "jqorh8f",
      "jqorh8i",
      "kqorh1",
      "kqorh2a",
      "kqorh2b",
      "kqorh3",
      "kqorh3d",
      "kqorh7",
      "kqorh8f",
      "kqorh8i"
    ),
    canonical_name = c(
      "qorh1",
      "qorh2a",
      "qorh2b",
      "qorh3a",
      "qorh3b",
      "qorh3c",
      "qorh4",
      "qorh5a",
      "qorh5b",
      "qorh5c",
      "qorh6a",
      "qorh6b",
      "qorh7",
      "qorh8a",
      "qorh8b",
      "qorh8c",
      "qorh8d",
      "qorh8e",
      "qorh8f",
      "qorh8g",
      "qorh8h",
      "qorh8i",
      "qorh1",
      "qorh2a",
      "qorh2b",
      "qorh3",
      "qorh3d",
      "qorh7",
      "qorh8f",
      "qorh8i",
      "qorh1",
      "qorh2a",
      "qorh2b",
      "qorh3",
      "qorh3d",
      "qorh7",
      "qorh8f",
      "qorh8i"
    ),
    variable_label = c(
      "Oral health 1: general self-evaluation",
      "Oral health 2A: number of own teeth and molars upper jaw",
      "Oral health 2B: number of own teeth and molars lower jaw",
      "Oral health 3A: wearing dentures upper jaw",
      "Oral health 3B: wearing dentures lower jaw",
      "Oral health 3C: when wearing dentures",
      "Oral health 4: how often brushing teeth",
      "Oral health 5A: use of dental floss",
      "Oral health 5B: use of dental sticks",
      "Oral health 5C: use of interdental brushes",
      "Oral health 6A: past 2 years dental check",
      "Oral health 6B: past 2 years dental cleaning",
      "Oral health 7: past 2 years gum inflammation (gingivitis)",
      "Oral health 8A: past half year: cavities",
      "Oral health 8B: past half year: bleeding gums",
      "Oral health 8C: past half year: red or swollen gums",
      "Oral health 8D: past half year: blisters or sores in the mouth",
      "Oral health 8E: past half year: toothache caused by hot/cold drinks",
      "Oral health 8F: past half year: toothache when chewing",
      "Oral health 8G: past half year: loose, broken teeth",
      "Oral health 8H: past half year: bad breath (halitosis)",
      "Oral health 8I: past half year: dry mouth",
      "Oral health 1: general self evaluation",
      "Oral health 2A: number of own teeth and molars upper jaw",
      "Oral health 2B: number of own teeth and molars lower jaw",
      "Oral health 3: wearing dentures",
      "Oral health 3D: past half year: dentures did not fit properly",
      "Oral health 7: past 2 years gum inflammation (gingivitis)",
      "Oral health 8F: past half year: toothache when chewing",
      "Oral health 8I: past half year: dry mouth",
      "Oral health 1: general self evaluation",
      "Oral health 2A: number of own teeth and molars upper jaw",
      "Oral health 2B: number of own teeth and molars lower jaw",
      "Oral health 3: wearing dentures",
      "Oral health 3D: past half year: dentures did not fit properly",
      "Oral health 7: past 2 years gum inflammation (gingivitis)",
      "Oral health 8F: past half year: toothache when chewing",
      "Oral health 8I: past half year: dry mouth"
    ),
    harmonized_var_label = c(
      "Oral health 1: general self evaluation",
      "Oral health 2A: number of own teeth and molars upper jaw",
      "Oral health 2B: number of own teeth and molars lower jaw",
      "Oral health 3A: wearing dentures upper jaw",
      "Oral health 3B: wearing dentures lower jaw",
      "Oral health 3C: when wearing dentures",
      "Oral health 4: how often brushing teeth",
      "Oral health 5A: use of dental floss",
      "Oral health 5B: use of dental sticks",
      "Oral health 5C: use of interdental brushes",
      "Oral health 6A: past 2 years dental check",
      "Oral health 6B: past 2 years dental cleaning",
      "Oral health 7: past 2 years gum inflammation (gingivitis)",
      "Oral health 8A: past half year: cavities",
      "Oral health 8B: past half year: bleeding gums",
      "Oral health 8C: past half year: red or swollen gums",
      "Oral health 8D: past half year: blisters or sores in the mouth",
      "Oral health 8E: past half year: toothache caused by hot/cold drinks",
      "Oral health 8F: past half year: toothache when chewing",
      "Oral health 8G: past half year: loose, broken teeth",
      "Oral health 8H: past half year: bad breath (halitosis)",
      "Oral health 8I: past half year: dry mouth",
      "Oral health 1: general self evaluation",
      "Oral health 2A: number of own teeth and molars upper jaw",
      "Oral health 2B: number of own teeth and molars lower jaw",
      "Oral health 3: wearing dentures",
      "Oral health 3D: past half year: dentures did not fit properly",
      "Oral health 7: past 2 years gum inflammation (gingivitis)",
      "Oral health 8F: past half year: toothache when chewing",
      "Oral health 8I: past half year: dry mouth",
      "Oral health 1: general self evaluation",
      "Oral health 2A: number of own teeth and molars upper jaw",
      "Oral health 2B: number of own teeth and molars lower jaw",
      "Oral health 3: wearing dentures",
      "Oral health 3D: past half year: dentures did not fit properly",
      "Oral health 7: past 2 years gum inflammation (gingivitis)",
      "Oral health 8F: past half year: toothache when chewing",
      "Oral health 8I: past half year: dry mouth"
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
    qorh1 = list(
      I = very_unhealthy_unhealthy_not_unhealthy_healthy_healthy,
      J = very_unhealthy_unhealthy_not_unhealthy_healthy_healthy,
      K = very_unhealthy_unhealthy_not_unhealthy_healthy_healthy
    ),
    qorh2a = list(
      I = none_1_7_more_than_7,
      J = none_1_7_more_than_7,
      K = none_1_7_more_than_7
    ),
    qorh2b = list(
      I = none_1_7_more_than_7,
      J = none_1_7_more_than_7,
      K = none_1_7_more_than_7
    ),
    qorh3a = list(
      I = yes_complete_dentures_yes_partial_dentures_no
    ),
    qorh3b = list(
      I = yes_complete_dentures_yes_partial_dentures_no
    ),
    qorh3c = list(
      I = c(
        `-2` = "na, see IQORH3A & IQORH3B",
        `-1` = "no answer",
        `1` = "day and night",
        `2` = "always during the day",
        `3` = "occasionally"
      )
    ),
    qorh4 = list(
      I = c(
        `-1` = "no answer",
        `1` = "never",
        `2` = "sometimes, not every day",
        `3` = "once a day",
        `4` = "twice a day",
        `5` = "more than twice a day"
      )
    ),
    qorh5a = list(
      I = never_1_3_times_a_month_1_3_times_a_week
    ),
    qorh5b = list(
      I = never_1_3_times_a_month_1_3_times_a_week
    ),
    qorh5c = list(
      I = never_1_3_times_a_month_1_3_times_a_week
    ),
    qorh6a = list(
      I = never_1_2_times_3_times_or_more
    ),
    qorh6b = list(
      I = never_1_2_times_3_times_or_more
    ),
    qorh7 = list(
      I = yes_no,
      J = yes_no,
      K = yes_no
    ),
    qorh8a = list(
      I = yes_no
    ),
    qorh8b = list(
      I = yes_no
    ),
    qorh8c = list(
      I = yes_no
    ),
    qorh8d = list(
      I = yes_no
    ),
    qorh8e = list(
      I = yes_no
    ),
    qorh8f = list(
      I = yes_no,
      J = never_rarely_occasionally_rather_often_very_often,
      K = never_rarely_occasionally_rather_often_very_often
    ),
    qorh8g = list(
      I = yes_no
    ),
    qorh8h = list(
      I = yes_no
    ),
    qorh8i = list(
      I = yes_no,
      J = never_rarely_occasionally_rather_often_very_often,
      K = never_rarely_occasionally_rather_often_very_often
    ),
    qorh3 = list(
      J = yes_no,
      K = yes_no
    ),
    qorh3d = list(
      J = never_rarely_occasionally_rather_often_very_often_2,
      K = never_rarely_occasionally_rather_often_very_often_2
    )
  ),

  value_labels_harmonized = list(
    qorh1 = c(
      `-1` = "not available",
      `1` = "very unhealthy",
      `2` = "unhealthy",
      `3` = "not unhealthy/healthy",
      `4` = "healthy",
      `5` = "very healthy"
    ),
    qorh2a = none_1_7_more_than_7_2,
    qorh2b = none_1_7_more_than_7_2,
    qorh3 = yes_no_2,
    qorh3a = yes_complete_dentures_yes_partial_dentures_no_2,
    qorh3b = yes_complete_dentures_yes_partial_dentures_no_2,
    qorh3c = c(
      `-2` = "not available, routing",
      `-1` = "not available",
      `1` = "day and night",
      `2` = "always during the day",
      `3` = "occasionally"
    ),
    qorh3d = c(
      `-2` = "not available, routing",
      `-1` = "not available",
      `1` = "never",
      `2` = "rarely",
      `3` = "occasionally",
      `4` = "rather often",
      `5` = "very often"
    ),
    qorh4 = c(
      `-1` = "not available",
      `1` = "never",
      `2` = "sometimes, not every day",
      `3` = "once a day",
      `4` = "twice a day",
      `5` = "more than twice a day"
    ),
    qorh5a = never_1_3_times_a_month_1_3_times_a_week_2,
    qorh5b = never_1_3_times_a_month_1_3_times_a_week_2,
    qorh5c = never_1_3_times_a_month_1_3_times_a_week_2,
    qorh6a = never_1_2_times_3_times_or_more_2,
    qorh6b = never_1_2_times_3_times_or_more_2,
    qorh7 = yes_no_2,
    qorh8a = yes_no_2,
    qorh8b = yes_no_2,
    qorh8c = yes_no_2,
    qorh8d = yes_no_2,
    qorh8e = yes_no_2,
    qorh8f = coding_category_1_coding_category_2_occasionally,
    qorh8g = yes_no_2,
    qorh8h = yes_no_2,
    qorh8i = coding_category_1_coding_category_2_occasionally
  )
)
