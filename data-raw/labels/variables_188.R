## LASA filecode 188 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_188 <- list(
  variables = data.frame(
    wave = c(
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E"
    ),
    variable_name = c(
      "empain1",
      "empain10",
      "empain11",
      "empain12",
      "empain13",
      "empain14",
      "empain15",
      "empain16",
      "empain17",
      "empain18",
      "empain19",
      "empain2",
      "empain3",
      "empain4",
      "empain5",
      "empain6",
      "empain7",
      "empain8",
      "empain9"
    ),
    canonical_name = c(
      "mpain1",
      "mpain10",
      "mpain11",
      "mpain12",
      "mpain13",
      "mpain14",
      "mpain15",
      "mpain16",
      "mpain17",
      "mpain18",
      "mpain19",
      "mpain2",
      "mpain3",
      "mpain4",
      "mpain5",
      "mpain6",
      "mpain7",
      "mpain8",
      "mpain9"
    ),
    variable_label = c(
      "Pain: past 3 month",
      "Pain: fixed on place and intensity",
      "Pain: suppress feelings of anger",
      "Pain: exercise or go to physiotherapy",
      "Pain: ignore the pain",
      "Pain: stay active",
      "Pain: banish troubling thoughts",
      "Pain: read",
      "Pain: do leisure activities",
      "Pain: try to divert attention",
      "Pain: drawing",
      "Pain: think pain wears me out",
      "Pain: tell others how bad",
      "Pain: pray for relief",
      "Pain: restrict social activities",
      "Pain: need help for daily duties",
      "Pain: think nothing helps for relief",
      "Pain: take medicine for relief",
      "Pain: call doctor or nurse"
    ),
    harmonized_var_label = c(
      "Pain: past 3 month",
      "Pain: fixed on place and intensity",
      "Pain: suppress feelings of anger",
      "Pain: exercise or go to physiotherapy",
      "Pain: ignore the pain",
      "Pain: stay active",
      "Pain: banish troubling thoughts",
      "Pain: read",
      "Pain: do leisure activities",
      "Pain: try to divert attention",
      "Pain: drawing",
      "Pain: think pain wears me out",
      "Pain: tell others how bad",
      "Pain: pray for relief",
      "Pain: restrict social activities",
      "Pain: need help for daily duties",
      "Pain: think nothing helps for relief",
      "Pain: take medicine for relief",
      "Pain: call doctor or nurse"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    mpain1 = list(
      E = no_yes
    ),
    mpain10 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain11 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain12 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain13 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain14 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain15 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain16 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain17 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain18 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain19 = list(
      E = c(
        `-2` = "na, see EMPAIN1",
        `-1` = "na, asked",
        `1` = "not applicable",
        `2` = "drawing filled in",
        `3` = "drawing partial filled in",
        `4` = "filling in failed",
        `5` = "interviewer filled in drawing"
      )
    ),
    mpain2 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain3 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain4 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain5 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain6 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain7 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain8 = list(
      E = never_seldom_sometimes_often_very_often
    ),
    mpain9 = list(
      E = never_seldom_sometimes_often_very_often
    )
  ),

  value_labels_harmonized = list(
    mpain1 = no_yes,
    mpain10 = never_seldom_sometimes_often_very_often,
    mpain11 = never_seldom_sometimes_often_very_often,
    mpain12 = never_seldom_sometimes_often_very_often,
    mpain13 = never_seldom_sometimes_often_very_often,
    mpain14 = never_seldom_sometimes_often_very_often,
    mpain15 = never_seldom_sometimes_often_very_often,
    mpain16 = never_seldom_sometimes_often_very_often,
    mpain17 = never_seldom_sometimes_often_very_often,
    mpain18 = never_seldom_sometimes_often_very_often,
    mpain19 = c(
      `-2` = "no valid data",
      `-1` = "na, asked",
      `1` = "not applicable",
      `2` = "drawing filled in",
      `3` = "drawing partial filled in",
      `4` = "filling in failed",
      `5` = "interviewer filled in drawing"
    ),
    mpain2 = never_seldom_sometimes_often_very_often,
    mpain3 = never_seldom_sometimes_often_very_often,
    mpain4 = never_seldom_sometimes_often_very_often,
    mpain5 = never_seldom_sometimes_often_very_often,
    mpain6 = never_seldom_sometimes_often_very_often,
    mpain7 = never_seldom_sometimes_often_very_often,
    mpain8 = never_seldom_sometimes_often_very_often,
    mpain9 = never_seldom_sometimes_often_very_often
  )
)
