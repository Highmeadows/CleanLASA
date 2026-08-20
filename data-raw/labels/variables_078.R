## LASA filecode 078 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_078 <- list(
  variables = data.frame(
    wave = c("B", "B", "B", "B", "B", "B", "E", "E", "E", "E", "E", "E"),
    variable_name = c(
      "ban1",
      "ban10",
      "ban4",
      "ban6",
      "ban8",
      "ban9",
      "ean1",
      "ean10",
      "ean4",
      "ean6",
      "ean8",
      "ean9"
    ),
    canonical_name = c("an1", "an10", "an4", "an6", "an8", "an9", "an1", "an10", "an4", "an6", "an8", "an9"),
    variable_label = c(
      "want to talk about feelings",
      "when difficulties, like to lean on someone",
      "when in trouble, I need support",
      "cope with sorrows on my own",
      "go to others when something bothers me",
      "my feelings are my own business",
      "want to talk about feelings",
      "when difficulties, like to lean on someone",
      "when in trouble, I need support",
      "cope with sorrows on my own",
      "go to others when something bothers me",
      "my feelings are my own business"
    ),
    harmonized_var_label = c(
      "want to talk about feelings",
      "when difficulties, like to lean on someone",
      "when in trouble, I need support",
      "cope with sorrows on my own",
      "go to others when something bothers me",
      "my feelings are my own business",
      "want to talk about feelings",
      "when difficulties, like to lean on someone",
      "when in trouble, I need support",
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
    an1 = list(
      B = no_more_or_less_yes_4,
      E = no_more_or_less_yes_5
    ),
    an10 = list(
      B = no_more_or_less_yes_4,
      E = no_more_or_less_yes_5
    ),
    an4 = list(
      B = no_more_or_less_yes_4,
      E = no_more_or_less_yes_5
    ),
    an6 = list(
      B = no_more_or_less_yes_4,
      E = no_more_or_less_yes_5
    ),
    an8 = list(
      B = no_more_or_less_yes_4,
      E = no_more_or_less_yes_5
    ),
    an9 = list(
      B = no_more_or_less_yes_4,
      E = no_more_or_less_yes_5
    )
  ),

  value_labels_harmonized = list(
    an1 = no_more_or_less_yes_6,
    an10 = no_more_or_less_yes_6,
    an4 = no_more_or_less_yes_6,
    an6 = no_more_or_less_yes_6,
    an8 = no_more_or_less_yes_6,
    an9 = no_more_or_less_yes_6
  )
)
