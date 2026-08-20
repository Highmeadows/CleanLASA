## LASA filecode 141 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_141 <- list(
  variables = data.frame(
    wave = c("2B", "2B", "2B", "2B", "2B", "2B", "G", "G", "G", "G", "G", "G"),
    variable_name = c(
      "bqan1",
      "bqan10",
      "bqan4",
      "bqan6",
      "bqan8",
      "bqan9",
      "gqan1",
      "gqan10",
      "gqan4",
      "gqan6",
      "gqan8",
      "gqan9"
    ),
    canonical_name = c(
      "qan1",
      "qan10",
      "qan4",
      "qan6",
      "qan8",
      "qan9",
      "qan1",
      "qan10",
      "qan4",
      "qan6",
      "qan8",
      "qan9"
    ),
    variable_label = c(
      "want to talk about feelings",
      "when difficulties, like to lean on someone",
      "when in trouble I need support",
      "cope with sorrows on my own",
      "go to others when something bothers me",
      "my feelings are my own business",
      "want to talk about feelings",
      "when difficulties, like to lean on someone",
      "when in trouble I need support",
      "cope with sorrows on my own",
      "go to others when something bothers me",
      "my feelings are my own business"
    ),
    harmonized_var_label = c(
      "want to talk about feelings",
      "when difficulties, like to lean on someone",
      "when in trouble I need support",
      "cope with sorrows on my own",
      "go to others when something bothers me",
      "my feelings are my own business",
      "want to talk about feelings",
      "when difficulties, like to lean on someone",
      "when in trouble I need support",
      "cope with sorrows on my own",
      "go to others when something bothers me",
      "my feelings are my own business"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qan1 = list(
      `2B` = no_more_or_less_yes_3,
      G = no_more_or_less_yes_3
    ),
    qan10 = list(
      `2B` = no_more_or_less_yes_3,
      G = no_more_or_less_yes_3
    ),
    qan4 = list(
      `2B` = no_more_or_less_yes_3,
      G = no_more_or_less_yes_3
    ),
    qan6 = list(
      `2B` = no_more_or_less_yes_3,
      G = no_more_or_less_yes_3
    ),
    qan8 = list(
      `2B` = no_more_or_less_yes_3,
      G = no_more_or_less_yes_3
    ),
    qan9 = list(
      `2B` = no_more_or_less_yes_3,
      G = no_more_or_less_yes_3
    )
  ),

  value_labels_harmonized = list(
    qan1 = no_more_or_less_yes_7,
    qan10 = no_more_or_less_yes_7,
    qan4 = no_more_or_less_yes_7,
    qan6 = no_more_or_less_yes_7,
    qan8 = no_more_or_less_yes_7,
    qan9 = no_more_or_less_yes_7
  )
)
