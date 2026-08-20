## LASA filecode 175 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_175 <- list(
  variables = data.frame(
    wave = c("J", "J", "J", "J", "J", "J", "J", "J", "J", "K", "K", "K", "K", "K", "K", "K", "K", "K"),
    variable_name = c(
      "jmnh01",
      "jmnh02",
      "jmnh03",
      "jmnh04",
      "jmnh05",
      "jmnh06",
      "jmnh07",
      "jmnh08",
      "jmnh09",
      "kmnh01",
      "kmnh02",
      "kmnh03",
      "kmnh04",
      "kmnh05",
      "kmnh06",
      "kmnh07",
      "kmnh08",
      "kmnh09"
    ),
    canonical_name = c(
      "mnh01",
      "mnh02",
      "mnh03",
      "mnh04",
      "mnh05",
      "mnh06",
      "mnh07",
      "mnh08",
      "mnh09",
      "mnh01",
      "mnh02",
      "mnh03",
      "mnh04",
      "mnh05",
      "mnh06",
      "mnh07",
      "mnh08",
      "mnh09"
    ),
    variable_label = c(
      "Good quality nursing homes in Netherlands",
      "Enough privacy in nursing home",
      "Residents spend little to no time outside nursing home",
      "Fun being together with other residents of nursing home",
      "Control over toilet visits in nursing home",
      "Residents nursing home barely get visitors",
      "Treated with respect by staff nursing home",
      "Control over when to wake up in nursing home",
      "Good conversations with residents of nursing home",
      "Good quality nursing homes in Netherlands",
      "Enough privacy in nursing home",
      "Residents spend little to no time outside nursing home",
      "Fun being together with other residents of nursing home",
      "Control over toilet visits in nursing home",
      "Residents nursing home barely get visitors",
      "Treated with respect by staff nursing home",
      "Control over when to wake up in nursing home",
      "Good conversations with residents of nursing home"
    ),
    harmonized_var_label = c(
      "Good quality nursing homes in Netherlands",
      "Enough privacy in nursing home",
      "Residents spend little to no time outside nursing home",
      "Fun being together with other residents of nursing home",
      "Control over toilet visits in nursing home",
      "Residents nursing home barely get visitors",
      "Treated with respect by staff nursing home",
      "Control over when to wake up in nursing home",
      "Good conversations with residents of nursing home",
      "Good quality nursing homes in Netherlands",
      "Enough privacy in nursing home",
      "Residents spend little to no time outside nursing home",
      "Fun being together with other residents of nursing home",
      "Control over toilet visits in nursing home",
      "Residents nursing home barely get visitors",
      "Treated with respect by staff nursing home",
      "Control over when to wake up in nursing home",
      "Good conversations with residents of nursing home"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    mnh01 = list(
      J = completely_disagree_disagree_do_not_agree_disagree,
      K = completely_disagree_disagree_do_not_agree_disagree
    ),
    mnh02 = list(
      J = completely_disagree_disagree_do_not_agree_disagree,
      K = completely_disagree_disagree_do_not_agree_disagree
    ),
    mnh03 = list(
      J = completely_disagree_disagree_do_not_agree_disagree,
      K = completely_disagree_disagree_do_not_agree_disagree
    ),
    mnh04 = list(
      J = completely_disagree_disagree_do_not_agree_disagree,
      K = completely_disagree_disagree_do_not_agree_disagree
    ),
    mnh05 = list(
      J = completely_disagree_disagree_do_not_agree_disagree,
      K = completely_disagree_disagree_do_not_agree_disagree
    ),
    mnh06 = list(
      J = completely_disagree_disagree_do_not_agree_disagree,
      K = completely_disagree_disagree_do_not_agree_disagree
    ),
    mnh07 = list(
      J = completely_disagree_disagree_do_not_agree_disagree,
      K = completely_disagree_disagree_do_not_agree_disagree
    ),
    mnh08 = list(
      J = completely_disagree_disagree_do_not_agree_disagree,
      K = completely_disagree_disagree_do_not_agree_disagree
    ),
    mnh09 = list(
      J = completely_disagree_disagree_do_not_agree_disagree,
      K = completely_disagree_disagree_do_not_agree_disagree
    )
  ),

  value_labels_harmonized = list(
    mnh01 = completely_disagree_disagree_do_not_agree_disagree,
    mnh02 = completely_disagree_disagree_do_not_agree_disagree,
    mnh03 = completely_disagree_disagree_do_not_agree_disagree,
    mnh04 = completely_disagree_disagree_do_not_agree_disagree,
    mnh05 = completely_disagree_disagree_do_not_agree_disagree,
    mnh06 = completely_disagree_disagree_do_not_agree_disagree,
    mnh07 = completely_disagree_disagree_do_not_agree_disagree,
    mnh08 = completely_disagree_disagree_do_not_agree_disagree,
    mnh09 = completely_disagree_disagree_do_not_agree_disagree
  )
)
