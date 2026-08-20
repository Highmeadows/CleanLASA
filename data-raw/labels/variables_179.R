## LASA filecode 179 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_179 <- list(
  variables = data.frame(
    wave = c("G", "G", "G", "G", "G", "G", "G", "G", "G", "G"),
    variable_name = c(
      "gmad01",
      "gmad02",
      "gmad03",
      "gmad04",
      "gmad05",
      "gmad06",
      "gmad07",
      "gmad08",
      "gmad09",
      "gmad10"
    ),
    canonical_name = c("mad01", "mad02", "mad03", "mad04", "mad05", "mad06", "mad07", "mad08", "mad09", "mad10"),
    variable_label = c(
      "AD 01: easily distracted",
      "AD 02: impulsive decisions",
      "AD 03: difficult to stop activities",
      "AD 04: starting without instructions",
      "AD 05: does not keep promises",
      "AD 06: difficult to do things in order",
      "AD 07: speeding to much / difficult to relax",
      "AD 08: difficult to focus attention",
      "AD 09: difficult to organise activities",
      "AD 10: symptoms starting before 16"
    ),
    harmonized_var_label = c(
      "AD 01: easily distracted",
      "AD 02: impulsive decisions",
      "AD 03: difficult to stop activities",
      "AD 04: starting without instructions",
      "AD 05: does not keep promises",
      "AD 06: difficult to do things in order",
      "AD 07: speeding to much / difficult to relax",
      "AD 08: difficult to focus attention",
      "AD 09: difficult to organise activities",
      "AD 10: symptoms starting before 16"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    mad01 = list(
      G = no_yes_15
    ),
    mad02 = list(
      G = no_yes_15
    ),
    mad03 = list(
      G = no_yes_15
    ),
    mad04 = list(
      G = no_yes_15
    ),
    mad05 = list(
      G = no_yes_15
    ),
    mad06 = list(
      G = no_yes_15
    ),
    mad07 = list(
      G = no_yes_15
    ),
    mad08 = list(
      G = no_yes_15
    ),
    mad09 = list(
      G = no_yes_15
    ),
    mad10 = list(
      G = no_yes_347
    )
  ),

  value_labels_harmonized = list(
    mad01 = no_yes_15,
    mad02 = no_yes_15,
    mad03 = no_yes_15,
    mad04 = no_yes_15,
    mad05 = no_yes_15,
    mad06 = no_yes_15,
    mad07 = no_yes_15,
    mad08 = no_yes_15,
    mad09 = no_yes_15,
    mad10 = no_yes_347
  )
)
