## LASA filecode 071 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_071 <- list(
  variables = data.frame(
    wave = c("B", "B", "B", "B", "K", "K", "K", "K"),
    variable_name = c("beval01", "beval02", "beval03", "beval04", "kbeval03", "keval01", "keval02", "keval04"),
    canonical_name = c("eval01", "eval02", "eval03", "eval04", "eval03", "eval01", "eval02", "eval04"),
    variable_label = c(
      "Evaluation age norms: daily pursuits",
      "Evaluation age norms: financial situation",
      "Evaluation age norms: contact with family/friends",
      "Evaluation age norms: current affairs",
      "Evaluation age norms: contact with family/friends",
      "Evaluation age norms: daily pursuits",
      "Evaluation age norms: financial situation",
      "Evaluation age norms: current affairs"
    ),
    harmonized_var_label = c(
      "Evaluation age norms: daily pursuits",
      "Evaluation age norms: financial situation",
      "Evaluation age norms: contact with family/friends",
      "Evaluation age norms: current affairs",
      "Evaluation age norms: contact with family/friends",
      "Evaluation age norms: daily pursuits",
      "Evaluation age norms: financial situation",
      "Evaluation age norms: current affairs"
    ),
    var_type = c(
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
    eval01 = list(
      B = no_more_or_less_yes_8,
      K = no_more_or_less_yes_9
    ),
    eval02 = list(
      B = no_more_or_less_yes_8,
      K = no_more_or_less_yes_9
    ),
    eval03 = list(
      B = no_more_or_less_yes_8,
      K = no_more_or_less_yes_9
    ),
    eval04 = list(
      B = no_more_or_less_yes_8,
      K = no_more_or_less_yes_9
    )
  ),

  value_labels_harmonized = list(
    eval01 = no_more_or_less_yes_10,
    eval02 = no_more_or_less_yes_10,
    eval03 = no_more_or_less_yes_10,
    eval04 = no_more_or_less_yes_10
  )
)
