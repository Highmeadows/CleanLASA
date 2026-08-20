## LASA filecode 148 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_148 <- list(
  variables = data.frame(
    wave = c("G", "G", "G", "G", "G", "G", "G", "G", "G", "G", "G", "G", "G", "G", "G"),
    variable_name = c(
      "gqeoldt1",
      "gqeoldt2",
      "gqeoldt3",
      "gqeoldt4",
      "gqeoldt5",
      "gqvgcan1",
      "gqvgcan2",
      "gqvgcan3",
      "gqvgcan4",
      "gqvgcan5",
      "gqvgdem1",
      "gqvgdem2",
      "gqvgdem3",
      "gqvgdem4",
      "gqvgdem5"
    ),
    canonical_name = c(
      "qeoldt1",
      "qeoldt2",
      "qeoldt3",
      "qeoldt4",
      "qeoldt5",
      "qvgcan1",
      "qvgcan2",
      "qvgcan3",
      "qvgcan4",
      "qvgcan5",
      "qvgdem1",
      "qvgdem2",
      "qvgdem3",
      "qvgdem4",
      "qvgdem5"
    ),
    variable_label = c(
      "EOL: dec. treatm.: R self",
      "EOL: dec. treatm.: R self after consulting GP",
      "EOL: dec. treatm.: R self and GP",
      "EOL: dec. treatm.: GP after consulting R self",
      "EOL: dec. treatm.: GP",
      "vignet cancer: nasal gastric tube",
      "vignet cancer: antibiotics",
      "vignet cancer: resuscitation",
      "vignet cancer: mechanical respiration",
      "vignet cancer: euthanasia",
      "vignet dementia: nasal gastric tube",
      "vignet dementia: antibiotics",
      "vignet dementia: resuscitation",
      "vignet dementia: mechanical respiration",
      "vignet dementia: euthanasia"
    ),
    harmonized_var_label = c(
      "EOL: dec. treatm.: R self",
      "EOL: dec. treatm.: R self after consulting GP",
      "EOL: dec. treatm.: R self and GP",
      "EOL: dec. treatm.: GP after consulting R self",
      "EOL: dec. treatm.: GP",
      "vignet cancer: nasal gastric tube",
      "vignet cancer: antibiotics",
      "vignet cancer: resuscitation",
      "vignet cancer: mechanical respiration",
      "vignet cancer: euthanasia",
      "vignet dementia: nasal gastric tube",
      "vignet dementia: antibiotics",
      "vignet dementia: resuscitation",
      "vignet dementia: mechanical respiration",
      "vignet dementia: euthanasia"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qeoldt1 = list(
      G = not_mentioned
    ),
    qeoldt2 = list(
      G = not_mentioned
    ),
    qeoldt3 = list(
      G = not_mentioned
    ),
    qeoldt4 = list(
      G = not_mentioned
    ),
    qeoldt5 = list(
      G = not_mentioned
    ),
    qvgcan1 = list(
      G = yes_probably_yes_probably_not_no
    ),
    qvgcan2 = list(
      G = yes_probably_yes_probably_not_no
    ),
    qvgcan3 = list(
      G = yes_probably_yes_probably_not_no
    ),
    qvgcan4 = list(
      G = yes_probably_yes_probably_not_no
    ),
    qvgcan5 = list(
      G = yes_probably_yes_probably_not_no
    ),
    qvgdem1 = list(
      G = yes_probably_yes_probably_not_no
    ),
    qvgdem2 = list(
      G = yes_probably_yes_probably_not_no
    ),
    qvgdem3 = list(
      G = yes_probably_yes_probably_not_no
    ),
    qvgdem4 = list(
      G = yes_probably_yes_probably_not_no
    ),
    qvgdem5 = list(
      G = yes_probably_yes_probably_not_no
    )
  ),

  value_labels_harmonized = list(
    qeoldt1 = not_mentioned_2,
    qeoldt2 = not_mentioned_2,
    qeoldt3 = not_mentioned_2,
    qeoldt4 = not_mentioned_2,
    qeoldt5 = not_mentioned_2,
    qvgcan1 = yes_probably_yes_probably_not_no_2,
    qvgcan2 = yes_probably_yes_probably_not_no_2,
    qvgcan3 = yes_probably_yes_probably_not_no_2,
    qvgcan4 = yes_probably_yes_probably_not_no_2,
    qvgcan5 = yes_probably_yes_probably_not_no_2,
    qvgdem1 = yes_probably_yes_probably_not_no_2,
    qvgdem2 = yes_probably_yes_probably_not_no_2,
    qvgdem3 = yes_probably_yes_probably_not_no_2,
    qvgdem4 = yes_probably_yes_probably_not_no_2,
    qvgdem5 = yes_probably_yes_probably_not_no_2
  )
)
