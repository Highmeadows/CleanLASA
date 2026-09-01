## LASA filecode 093 -- variable names, variable labels, value labels,
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
  eol01 = "numeric",
  eol02 = "numeric",
  eol03 = "categorical",
  eol04 = "categorical",
  eol05 = "categorical",
  eol07 = "categorical",
  eol11 = "categorical",
  eol12 = "categorical",
  eol13 = "categorical",
  eol14 = "categorical",
  eol15 = "categorical",
  eol16 = "categorical",
  eol21 = "categorical",
  eol22 = "categorical",
  eol23 = "categorical",
  eol24 = "categorical",
  eol25 = "categorical",
  eol26 = "categorical",
  eol261 = "categorical",
  eol262 = "categorical",
  eol263 = "categorical",
  eol264 = "categorical",
  eol265 = "categorical",
  eol266 = "categorical",
  eol267 = "categorical",
  eol268 = "categorical",
  eol601 = "numeric",
  eol602 = "categorical",
  eol603 = "categorical",
  eol604 = "categorical",
  eol605 = "categorical",
  eol606 = "categorical",
  eol607 = "categorical",
  eol608 = "categorical",
  eol609 = "categorical",
  eol610 = "categorical",
  eol611 = "categorical",
  eol612 = "categorical",
  eol612s = "categorical"
)

# define variable labels ----
variable_labels(
  eol01 = "# end-of-life declarations",
  eol02 = "# persons informed about EOL-declaration",
  eol03 = "Indication (verbal/written)",
  eol04 = "Discussed EOL-choices with family physician",
  eol05 = "Imagine: request for euthanasia",
  eol07 = "Trust in doctors/nurses",
  eol11 = "No treatment declaration",
  eol12 = "No reanimation declaration",
  eol13 = "Euthanasia declaration",
  eol14 = "Care declaration",
  eol15 = "Credo declaration",
  eol16 = "Declaration, not specified",
  eol21 = "Informed: partner",
  eol22 = "Informed: children",
  eol23 = "Informed: caretaker",
  eol24 = "Informed: family physician",
  eol25 = "Informed: district nurse",
  eol26 = "Informed: other",
  eol261 = "Informed: other family member",
  eol262 = "Informed: nobody",
  eol263 = "Informed: friend",
  eol264 = "Informed: household member",
  eol265 = "Informed: free euthanasia association",
  eol266 = "Informed: spiritual adviser",
  eol267 = "Informed: notary",
  eol268 = "Informed: not specified",
  eol601 = "# reasons EOL-requests",
  eol602 = "Reason: unbearable suffering (not pain)",
  eol603 = "Reason: loss of dignity",
  eol604 = "Reason: meaningless suffering",
  eol605 = "Reason: weariness of life",
  eol606 = "Reason: nuisance for family/daily environment",
  eol607 = "Reason: prevent pain",
  eol608 = "Reason: prevent further suffering",
  eol609 = "Reason: prevent humiliation/decay",
  eol610 = "Reason: hopeless suffering",
  eol611 = "Reason: mental retardation or dementia",
  eol612 = "Reason: other",
  eol612s = "Reason: other specified",
  .applies_to_waves = c("Z")
)

variable_labels(
  "eol01", "eol02", "eol03", "eol04", "eol05", "eol07", "eol11", "eol12", "eol13", "eol14", "eol15", "eol16", "eol21", "eol22", "eol23", "eol24", "eol25", "eol26", "eol261", "eol262", "eol263", "eol264", "eol265", "eol266", "eol267", "eol268", "eol601", "eol602", "eol603", "eol604", "eol605", "eol606", "eol607", "eol608", "eol609", "eol610", "eol611", "eol612", "eol612s",
  .applies_to_waves = c("D")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("eol01", "eol02", "eol03", "eol04", "eol05", "eol07", "eol601"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("eol02", "eol11", "eol12", "eol13", "eol14", "eol15", "eol16", "eol21", "eol22", "eol23", "eol24", "eol25", "eol26", "eol261", "eol262", "eol263", "eol264", "eol265", "eol266", "eol267", "eol268", "eol601", "eol602", "eol603", "eol604", "eol605", "eol606", "eol607", "eol608", "eol609", "eol610", "eol611", "eol612", "eol612s"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "interview terminated",
  .applies_to_vars = c("eol01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "interview terminated", `1` = "yes, written", `2` = "yes, verbal", `3` = "yes, written and verbal", `4` = "yes, not specified", `5` = "no", `6` = "R does not know",
  .applies_to_vars = c("eol03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "interview terminated", `1` = "yes", `2` = "no", `3` = "R does not know",
  .applies_to_vars = c("eol04", "eol05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "interview terminated", `1` = "trust: very strong", `2` = "trust: quite strong", `3` = "trust not much", `4` = "rust: not at all", `5` = "trust: no opinion",
  .applies_to_vars = c("eol07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("eol11", "eol12", "eol13", "eol14", "eol15", "eol16", "eol21", "eol22", "eol23", "eol24", "eol25", "eol26", "eol261", "eol262", "eol263", "eol264", "eol265", "eol266", "eol267", "eol268"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("eol602", "eol603", "eol604", "eol605", "eol606", "eol607", "eol608", "eol609", "eol610", "eol611", "eol612"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `1` = "-to be coded-",
  .applies_to_vars = c("eol612s"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see DEOL05",
  .applies_to_vars = c("eol601", "eol602", "eol603", "eol604", "eol605", "eol606", "eol607", "eol608", "eol609", "eol610", "eol611", "eol612"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, terminated interview",
  .applies_to_vars = c("eol01"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DEOL01",
  .applies_to_vars = c("eol02"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, terminated interview", `1` = "yes, written", `2` = "yes, verbal", `3` = "yes, written and verbal", `4` = "yes, not specified", `5` = "no", `6` = "R does not know",
  .applies_to_vars = c("eol03"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, terminated interview", `1` = "yes", `2` = "no", `3` = "R does not know",
  .applies_to_vars = c("eol04", "eol05"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, terminated interview", `1` = "trust: very strong", `2` = "trust: quite strong", `3` = "trust not much", `4` = "rust: not at all", `5` = "trust: no opinion",
  .applies_to_vars = c("eol07"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DEOL01", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("eol11", "eol12", "eol13", "eol14", "eol15", "eol16"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DEOL02", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("eol21", "eol22", "eol23", "eol24", "eol25", "eol26"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DEOL26", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("eol261", "eol262", "eol263", "eol264", "eol265", "eol266", "eol267", "eol268"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DEOL612", `1` = "-to be coded-",
  .applies_to_vars = c("eol612s"),
  .applies_to_waves = c("D")
)

.lasa_fc_093 <- .lasa_finalize_fc("093")

