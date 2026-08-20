## LASA filecode 149 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_149 <- list(
  variables = data.frame(
    wave = c(
      "G",
      "G",
      "G",
      "G",
      "G",
      "G",
      "G",
      "G",
      "G",
      "G",
      "G",
      "G",
      "G",
      "G",
      "H",
      "H",
      "H",
      "H",
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
      "gqgsr01",
      "gqgsr02",
      "gqgsr03",
      "gqgsr04",
      "gqgsr05",
      "gqgsr06",
      "gqgsr07",
      "gqgsr08",
      "gqgsr09",
      "gqgsr10",
      "gqgsr11",
      "gqgsr12",
      "gqgsr13",
      "gqgsr14",
      "hqgsr01",
      "hqgsr02",
      "hqgsr03",
      "hqgsr04",
      "hqgsr05",
      "hqgsr06",
      "hqgsr07",
      "hqgsr08",
      "hqgsr09",
      "hqgsr10",
      "hqgsr11",
      "hqgsr12",
      "hqgsr13",
      "hqgsr14"
    ),
    canonical_name = c(
      "qgsr01",
      "qgsr02",
      "qgsr03",
      "qgsr04",
      "qgsr05",
      "qgsr06",
      "qgsr07",
      "qgsr08",
      "qgsr09",
      "qgsr10",
      "qgsr11",
      "qgsr12",
      "qgsr13",
      "qgsr14",
      "qgsr01",
      "qgsr02",
      "qgsr03",
      "qgsr04",
      "qgsr05",
      "qgsr06",
      "qgsr07",
      "qgsr08",
      "qgsr09",
      "qgsr10",
      "qgsr11",
      "qgsr12",
      "qgsr13",
      "qgsr14"
    ),
    variable_label = c(
      "MK2: exhausting to pursue goal, search a new goal",
      "SU3: harder to get same results, keep trying harder",
      "MK3: try to pursue several goals",
      "SU1: effort to achieve a given goal",
      "SU2: set goals clearly, stick to them",
      "AP3: for goals detailed plans how to implement them",
      "CP1: have a backup plan in case something goes wrong",
      "MK1: if difficulty try to achieve goal by other means",
      "MK4: goal difficult to reach, find alternative route",
      "CP3: plan for things other people consider unlikely",
      "AP1: always make detailed plans for my goals",
      "SU4: cannot do something the way before look for new goal",
      "CP2: plan for difficult situations according my intentions",
      "AP2: for my goals make detailed plans when to implement",
      "MK2: exhausting to pursue goal, search a new goal",
      "SU3: harder to get same results, keep trying harder",
      "MK3: try to pursue several goals",
      "SU1: effort to achieve a given goal",
      "SU2: set goals clearly, stick to them",
      "AP3: for goals detailed plans how to implement them",
      "CP1: have a backup plan in case something goes wrong",
      "MK1: if difficulty try to achieve goal by other means",
      "MK4: goal difficult to reach, find alternative route",
      "CP3: plan for things other people consider unlikely",
      "AP1: always make detailed plans for my goals",
      "SU4: cannot do something the way before look for new goal",
      "CP2: plan for difficult situations according my intentions",
      "AP2: for my goals make detailed plans when to implement"
    ),
    harmonized_var_label = c(
      "MK2: exhausting to pursue goal, search a new goal",
      "SU3: harder to get same results, keep trying harder",
      "MK3: try to pursue several goals",
      "SU1: effort to achieve a given goal",
      "SU2: set goals clearly, stick to them",
      "AP3: for goals detailed plans how to implement them",
      "CP1: have a backup plan in case something goes wrong",
      "MK1: if difficulty try to achieve goal by other means",
      "MK4: goal difficult to reach, find alternative route",
      "CP3: plan for things other people consider unlikely",
      "AP1: always make detailed plans for my goals",
      "SU4: cannot do something the way before look for new goal",
      "CP2: plan for difficult situations according my intentions",
      "AP2: for my goals make detailed plans when to implement",
      "MK2: exhausting to pursue goal, search a new goal",
      "SU3: harder to get same results, keep trying harder",
      "MK3: try to pursue several goals",
      "SU1: effort to achieve a given goal",
      "SU2: set goals clearly, stick to them",
      "AP3: for goals detailed plans how to implement them",
      "CP1: have a backup plan in case something goes wrong",
      "MK1: if difficulty try to achieve goal by other means",
      "MK4: goal difficult to reach, find alternative route",
      "CP3: plan for things other people consider unlikely",
      "AP1: always make detailed plans for my goals",
      "SU4: cannot do something the way before look for new goal",
      "CP2: plan for difficult situations according my intentions",
      "AP2: for my goals make detailed plans when to implement"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qgsr01 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    ),
    qgsr02 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    ),
    qgsr03 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    ),
    qgsr04 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    ),
    qgsr05 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    ),
    qgsr06 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    ),
    qgsr07 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    ),
    qgsr08 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    ),
    qgsr09 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    ),
    qgsr10 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    ),
    qgsr11 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    ),
    qgsr12 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    ),
    qgsr13 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    ),
    qgsr14 = list(
      G = strongly_disagree_disagree_slightly_disagree,
      H = strongly_disagree_disagree_slightly_disagree
    )
  ),

  value_labels_harmonized = list(
    qgsr01 = strongly_disagree_disagree_slightly_disagree_2,
    qgsr02 = strongly_disagree_disagree_slightly_disagree_2,
    qgsr03 = strongly_disagree_disagree_slightly_disagree_2,
    qgsr04 = strongly_disagree_disagree_slightly_disagree_2,
    qgsr05 = strongly_disagree_disagree_slightly_disagree_2,
    qgsr06 = strongly_disagree_disagree_slightly_disagree_2,
    qgsr07 = strongly_disagree_disagree_slightly_disagree_2,
    qgsr08 = strongly_disagree_disagree_slightly_disagree_2,
    qgsr09 = strongly_disagree_disagree_slightly_disagree_2,
    qgsr10 = strongly_disagree_disagree_slightly_disagree_2,
    qgsr11 = strongly_disagree_disagree_slightly_disagree_2,
    qgsr12 = strongly_disagree_disagree_slightly_disagree_2,
    qgsr13 = strongly_disagree_disagree_slightly_disagree_2,
    qgsr14 = strongly_disagree_disagree_slightly_disagree_2
  )
)
