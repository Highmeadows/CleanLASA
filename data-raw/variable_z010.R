## LASA filecode z010 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  marst = "marital status",
  partner = "partner status (none, co-residing, outside household)",
  partst = "partner status",
  separ = "reason not living with spouse/registered partner"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `A` = c(
    "marst",
    "partner",
    "partst",
    "separ"
  ),
  `B` = c(
    "marst",
    "partner",
    "partst",
    "separ"
  ),
  `C` = c(
    "marst",
    "partner",
    "partst",
    "separ"
  ),
  `D` = c(
    "marst",
    "partner",
    "partst",
    "separ"
  ),
  `E` = c(
    "marst",
    "partner",
    "partst",
    "separ"
  ),
  `F` = c(
    "marst",
    "partner",
    "partst",
    "separ"
  ),
  `G` = c(
    "marst",
    "partner",
    "partst",
    "separ"
  ),
  `H` = c(
    "marst",
    "partner",
    "partst",
    "separ"
  ),
  `I` = c(
    "marst",
    "partner",
    "partst",
    "separ"
  ),
  `J` = c(
    "marst",
    "partner",
    "partst",
    "separ"
  ),
  `K` = c(
    "marst",
    "partner",
    "partst",
    "separ"
  )
)

variable_labels_list <- list(
  Wave_A_labels = .replace_labels(
    harmonized_labels,
    marst = "marstA: marital status",
    partner = "partnerA: partner status (none, co-residing, residing outside the household)",
    partst = "partstA: partner status",
    separ = "separA: why not living with spouse (for married or with registered partnership)"
  ),
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    marst = "marstB: marital status",
    partner = "partnerB: partner status (none, co-residing, residing outside the household)",
    partst = "partstB: partner status",
    separ = "separB: why not living with spouse (for married or with registered partnership)"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    marst = "marstC: marital status",
    partner = "partnerC: partner status (none, co-residing, residing outside the household)",
    partst = "partstC: partner status",
    separ = "separC: why not living with spouse (for married or with registered partnership)"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    marst = "marstD: marital status",
    partner = "partnerD: partner status (none, co-residing, residing outside the household)",
    partst = "partstD: partner status",
    separ = "separD: why not living with spouse (for married or with registered partnership)"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    marst = "marstE: marital status",
    partner = "partnerE: partner status (none, co-residing, residing outside the household)",
    partst = "partstE: partner status",
    separ = "separE: why not living with spouse (for married or with registered partnership)"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    marst = "marstF: marital status",
    partner = "partnerF: partner status (none, co-residing, residing outside the household)",
    partst = "partstF: partner status",
    separ = "separF: why not living with spouse (for married or with registered partnership)"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    marst = "marstG: marital status",
    partner = "partnerG: partner status (none, co-residing, residing outside the household)",
    partst = "partstG: partner status",
    separ = "separG: why not living with spouse (for married or with registered partnership)"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    marst = "marstH: marital status",
    partner = "partnerH: partner status (none, co-residing, residing outside the household)",
    partst = "partstH: partner status",
    separ = "separH: why not living with spouse (for married or with registered partnership)"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    marst = "marstI: marital status",
    partner = "partnerI: partner status (none, co-residing, residing outside the household)",
    partst = "partstI: partner status",
    separ = "separI: why not living with spouse (for married or with registered partnership)"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    marst = "marstJ: marital status",
    partner = "partnerJ: partner status (none, co-residing, residing outside the household)",
    partst = "partstJ: partner status",
    separ = "separJ: why not living with spouse (for married or with registered partnership)"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    marst = "marstK: marital status",
    partner = "partnerK: partner status (none, co-residing, residing outside the household)",
    partst = "partstK: partner status",
    separ = "separK: why not living with spouse (for married or with registered partnership)"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  marst = c(
    `-9` = "no observation birth cohorts 1948-1957",
    `-8` = "no observation birth cohorts 1938-1947",
    `-7` = "no observation birth cohorts 1903-1908",
    `-6` = "sample attrition",
    `-1` = "unknown",
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowhood",
    `5` = "registered partnership (~married)"
  ),
  partner = c(
    `-9` = "no observation birth cohorts 1948-1957",
    `-8` = "no observation birth cohorts 1938-1947",
    `-7` = "no observation birth cohorts 1903-1908",
    `-6` = "sample attrition",
    `-1` = "unknown",
    `0` = "no partner",
    `1` = "partner (co-residence)",
    `2` = "partner (outside household)"
  ),
  partst = c(
    `-9` = "no observation birth cohorts 1948-1957",
    `-8` = "no observation birth cohorts 1938-1947",
    `-7` = "no observation birth cohorts 1903-1908",
    `-6` = "sample attrition",
    `-1` = "unknown",
    `0` = "no partner",
    `1` = "lives with spouse (married or registered partnership) (opposite sex)",
    `2` = "lives with opposite sex (not married)",
    `3` = "lives with same sex (not married)",
    `4` = "partner opposite sex outside household (not married)",
    `5` = "partner same sex outside household (not married)",
    `6` = "spouse outside household (married or registered partnership; relationship sometimes broken; see SEPAR)",
    `7` = "combination 4 & 6 (married/separated but LAT with other partner)",
    `8` = "combination 1 & 4 (married/not-separated but LAT with other partner)",
    `9` = "combination 2 & 6 (married/separated but coresiding with other partner)",
    `10` = "lives with spouse (married or registered partnership) (same sex)"
  ),
  separ = c(
    `-9` = "no observation birth cohorts 1948-1957",
    `-8` = "no observation birth cohorts 1938-1947",
    `-7` = "no observation birth cohorts 1903-1908",
    `-6` = "sample attrition",
    `-5` = "not married",
    `-4` = "not separated (i.e. living with spouse)",
    `-1` = "unknown (not asked in phone/proxy interview, or no answer)",
    `1` = "partner in hospital | nursing home",
    `2` = "R in hospital/nursing home",
    `3` = "partner elsewhere (e.g. employment; practical reasons)",
    `4` = "R elsewhere (e.g. employment; practical reasons)",
    `5` = "other (relationship exists)",
    `6` = "relationship broken",
    `7` = "other",
    `8` = "wants to live alone / values individual privacy",
    `9` = "political refugee",
    `10` = "wife abroad, no house",
    `11` = "wife abroad, waiting for reunification"
  )
)

value_labels_list <- list(
  Wave_A_labels = standardized_value_labels,
  Wave_B_labels = standardized_value_labels,
  Wave_C_labels = standardized_value_labels,
  Wave_D_labels = standardized_value_labels,
  Wave_E_labels = standardized_value_labels,
  Wave_F_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(marst = "categorical", partner = "categorical", partst = "categorical", separ = "categorical")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "z010", waves = .lasa_wave_rows(has_wave_a = TRUE)),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "z010", waves = .lasa_wave_rows(has_wave_a = TRUE)),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "z010", waves = .lasa_wave_rows(has_wave_a = TRUE)),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "z010", waves = .lasa_wave_rows(has_wave_a = TRUE))
)

.lasa_fc_z010 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

