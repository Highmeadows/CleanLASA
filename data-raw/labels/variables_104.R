## LASA filecode 104 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_104 <- list(
  variables = data.frame(
    wave = c(
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H"
    ),
    variable_name = c(
      "bqpss01",
      "bqpss02",
      "bqpss03",
      "bqpss04",
      "bqpss05",
      "bqpss06",
      "bqpss07",
      "bqpss08",
      "bqpss09",
      "bqpss10",
      "hqpss01",
      "hqpss02",
      "hqpss03",
      "hqpss04",
      "hqpss05",
      "hqpss06",
      "hqpss07",
      "hqpss08",
      "hqpss09",
      "hqpss10"
    ),
    canonical_name = c(
      "qpss01",
      "qpss02",
      "qpss03",
      "qpss04",
      "qpss05",
      "qpss06",
      "qpss07",
      "qpss08",
      "qpss09",
      "qpss10",
      "qpss01",
      "qpss02",
      "qpss03",
      "qpss04",
      "qpss05",
      "qpss06",
      "qpss07",
      "qpss08",
      "qpss09",
      "qpss10"
    ),
    variable_label = c(
      "upset because something unexpected",
      "felt unable to control things",
      "felt nervous and stressed",
      "felt confident",
      "felt things going your way",
      "felt could not cope with things",
      "been able to control irritations",
      "felt on top of things",
      "angered because things outside control",
      "felt difficulties piling up",
      "upset because something unexpected",
      "felt unable to control things",
      "felt nervous and stressed",
      "felt confident",
      "felt things going your way",
      "felt could not cope with things",
      "been able to control irritations",
      "felt on top of things",
      "angered because things outside control",
      "felt difficulties piling up"
    ),
    harmonized_var_label = c(
      "upset because something unexpected",
      "felt unable to control things",
      "felt nervous and stressed",
      "felt confident",
      "felt things going your way",
      "felt could not cope with things",
      "been able to control irritations",
      "felt on top of things",
      "angered because things outside control",
      "felt difficulties piling up",
      "upset because something unexpected",
      "felt unable to control things",
      "felt nervous and stressed",
      "felt confident",
      "felt things going your way",
      "felt could not cope with things",
      "been able to control irritations",
      "felt on top of things",
      "angered because things outside control",
      "felt difficulties piling up"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qpss01 = list(
      `3B` = never_almost_never_sometimes_often_very_often,
      H = never_almost_never_sometimes_often_very_often
    ),
    qpss02 = list(
      `3B` = never_almost_never_sometimes_often_very_often,
      H = never_almost_never_sometimes_often_very_often
    ),
    qpss03 = list(
      `3B` = never_almost_never_sometimes_often_very_often,
      H = never_almost_never_sometimes_often_very_often
    ),
    qpss04 = list(
      `3B` = never_almost_never_sometimes_often_very_often,
      H = never_almost_never_sometimes_often_very_often
    ),
    qpss05 = list(
      `3B` = never_almost_never_sometimes_often_very_often,
      H = never_almost_never_sometimes_often_very_often
    ),
    qpss06 = list(
      `3B` = never_almost_never_sometimes_often_very_often,
      H = never_almost_never_sometimes_often_very_often
    ),
    qpss07 = list(
      `3B` = never_almost_never_sometimes_often_very_often,
      H = never_almost_never_sometimes_often_very_often
    ),
    qpss08 = list(
      `3B` = never_almost_never_sometimes_often_very_often,
      H = never_almost_never_sometimes_often_very_often
    ),
    qpss09 = list(
      `3B` = never_almost_never_sometimes_often_very_often,
      H = never_almost_never_sometimes_often_very_often
    ),
    qpss10 = list(
      `3B` = never_almost_never_sometimes_often_very_often,
      H = never_almost_never_sometimes_often_very_often
    )
  ),

  value_labels_harmonized = list(
    qpss01 = never_almost_never_sometimes_often_very_often,
    qpss02 = never_almost_never_sometimes_often_very_often,
    qpss03 = never_almost_never_sometimes_often_very_often,
    qpss04 = never_almost_never_sometimes_often_very_often,
    qpss05 = never_almost_never_sometimes_often_very_often,
    qpss06 = never_almost_never_sometimes_often_very_often,
    qpss07 = never_almost_never_sometimes_often_very_often,
    qpss08 = never_almost_never_sometimes_often_very_often,
    qpss09 = never_almost_never_sometimes_often_very_often,
    qpss10 = never_almost_never_sometimes_often_very_often
  )
)
