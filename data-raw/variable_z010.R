## LASA filecode z010 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: give it its own variable_labels()/value_labels() calls
## (or add it to .applies_to_waves of an existing call sharing its text).
## To add a new variable: add it to var_types_vec, then declare its
## text/codes below.

# define variable types ----
## Every canonical variable name this filecode declares, and its
## collapsed type ("numeric"/"categorical"/"text"/"date"). Free order --
## matched by name everywhere below, never by position.
var_types_vec <- c(
  marst = "categorical",
  partner = "categorical",
  partst = "categorical",
  separ = "categorical"
)

# define variable labels ----
variable_labels(
  marst = "marital status",
  partner = "partner status (none, co-residing, outside household)",
  partst = "partner status",
  separ = "reason not living with spouse/registered partner",
  .applies_to_waves = c("Z")
)

variable_labels(
  marst = "marstA: marital status",
  partner = "partnerA: partner status (none, co-residing, residing outside the household)",
  partst = "partstA: partner status",
  separ = "separA: why not living with spouse (for married or with registered partnership)",
  .applies_to_waves = c("A")
)

variable_labels(
  marst = "marstB: marital status",
  partner = "partnerB: partner status (none, co-residing, residing outside the household)",
  partst = "partstB: partner status",
  separ = "separB: why not living with spouse (for married or with registered partnership)",
  .applies_to_waves = c("B")
)

variable_labels(
  marst = "marstC: marital status",
  partner = "partnerC: partner status (none, co-residing, residing outside the household)",
  partst = "partstC: partner status",
  separ = "separC: why not living with spouse (for married or with registered partnership)",
  .applies_to_waves = c("C")
)

variable_labels(
  marst = "marstD: marital status",
  partner = "partnerD: partner status (none, co-residing, residing outside the household)",
  partst = "partstD: partner status",
  separ = "separD: why not living with spouse (for married or with registered partnership)",
  .applies_to_waves = c("D")
)

variable_labels(
  marst = "marstE: marital status",
  partner = "partnerE: partner status (none, co-residing, residing outside the household)",
  partst = "partstE: partner status",
  separ = "separE: why not living with spouse (for married or with registered partnership)",
  .applies_to_waves = c("E")
)

variable_labels(
  marst = "marstF: marital status",
  partner = "partnerF: partner status (none, co-residing, residing outside the household)",
  partst = "partstF: partner status",
  separ = "separF: why not living with spouse (for married or with registered partnership)",
  .applies_to_waves = c("F")
)

variable_labels(
  marst = "marstG: marital status",
  partner = "partnerG: partner status (none, co-residing, residing outside the household)",
  partst = "partstG: partner status",
  separ = "separG: why not living with spouse (for married or with registered partnership)",
  .applies_to_waves = c("G")
)

variable_labels(
  marst = "marstH: marital status",
  partner = "partnerH: partner status (none, co-residing, residing outside the household)",
  partst = "partstH: partner status",
  separ = "separH: why not living with spouse (for married or with registered partnership)",
  .applies_to_waves = c("H")
)

variable_labels(
  marst = "marstI: marital status",
  partner = "partnerI: partner status (none, co-residing, residing outside the household)",
  partst = "partstI: partner status",
  separ = "separI: why not living with spouse (for married or with registered partnership)",
  .applies_to_waves = c("I")
)

variable_labels(
  marst = "marstJ: marital status",
  partner = "partnerJ: partner status (none, co-residing, residing outside the household)",
  partst = "partstJ: partner status",
  separ = "separJ: why not living with spouse (for married or with registered partnership)",
  .applies_to_waves = c("J")
)

variable_labels(
  marst = "marstK: marital status",
  partner = "partnerK: partner status (none, co-residing, residing outside the household)",
  partst = "partstK: partner status",
  separ = "separK: why not living with spouse (for married or with registered partnership)",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-1` = "unknown",
  .applies_to_vars = c("marst", "partner", "partst"),
  .applies_to_waves = c("Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-5` = "not married", `-4` = "not separated (i.e. living with spouse)", `-1` = "unknown (not asked in phone/proxy interview, or no answer)",
  .applies_to_vars = c("separ"),
  .applies_to_waves = c("Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-9` = "no observation birth cohorts 1948-1957", `-8` = "no observation birth cohorts 1938-1947", `-7` = "no observation birth cohorts 1903-1908", `-6` = "sample attrition",
  .applies_to_vars = c("marst", "partner", "partst", "separ"),
  .applies_to_waves = c("Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `1` = "never married", `2` = "married", `3` = "divorced", `4` = "widowhood", `5` = "registered partnership (~married)",
  .applies_to_vars = c("marst"),
  .applies_to_waves = c("Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `0` = "no partner", `1` = "partner (co-residence)", `2` = "partner (outside household)",
  .applies_to_vars = c("partner"),
  .applies_to_waves = c("Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `0` = "no partner", `1` = "lives with spouse (married or registered partnership) (opposite sex)", `2` = "lives with opposite sex (not married)", `3` = "lives with same sex (not married)", `4` = "partner opposite sex outside household (not married)", `5` = "partner same sex outside household (not married)", `6` = "spouse outside household (married or registered partnership; relationship sometimes broken; see SEPAR)", `7` = "combination 4 & 6 (married/separated but LAT with other partner)", `8` = "combination 1 & 4 (married/not-separated but LAT with other partner)", `9` = "combination 2 & 6 (married/separated but coresiding with other partner)", `10` = "lives with spouse (married or registered partnership) (same sex)",
  .applies_to_vars = c("partst"),
  .applies_to_waves = c("Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `1` = "partner in hospital | nursing home", `2` = "R in hospital/nursing home", `3` = "partner elsewhere (e.g. employment; practical reasons)", `4` = "R elsewhere (e.g. employment; practical reasons)", `5` = "other (relationship exists)", `6` = "relationship broken", `7` = "other", `8` = "wants to live alone / values individual privacy", `9` = "political refugee", `10` = "wife abroad, no house", `11` = "wife abroad, waiting for reunification",
  .applies_to_vars = c("separ"),
  .applies_to_waves = c("Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

.lasa_fc_z010 <- .lasa_finalize_fc("z010")

