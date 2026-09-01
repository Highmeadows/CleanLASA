## LASA filecode 710 -- variable names, variable labels, value labels,
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
  tradapt = "categorical",
  trappli = "categorical",
  trdisth = "numeric",
  trdistr = "categorical",
  trdomch = "numeric",
  trdomec = "categorical",
  trelddn = "categorical",
  treldeh = "numeric",
  trelder = "categorical",
  trhomec = "categorical",
  trmeal = "categorical",
  trmealn = "numeric",
  trnurdn = "categorical",
  trnursd = "categorical",
  trnursh = "numeric",
  trnursi = "categorical",
  trperch = "numeric",
  trpersc = "categorical",
  trrioot = "categorical",
  trrioyn = "categorical",
  truf24c = "categorical",
  trufdac = "categorical",
  trufgui = "categorical",
  trufntc = "categorical",
  trufssc = "categorical",
  trurgyn = "categorical"
)

# define variable labels ----
variable_labels(
  tradapt = "Indication for adaptations",
  trappli = "Indication for an appliance",
  trdisth = "District nurse: number of hours/week",
  trdistr = "Indication for district nurse",
  trdomch = "Domestic tasks: number of hours/week",
  trdomec = "Home care: domestic tasks",
  trelddn = "Day/night treatment in home for the elderly",
  treldeh = "Home for the elderly: number of hours/week",
  trelder = "Stay in home for the elderly",
  trhomec = "Indication for home care",
  trmeal = "Indication for meals",
  trmealn = "Number of meals per week",
  trnurdn = "Day/night treatment in nursing home",
  trnursd = "Nursing home: department",
  trnursh = "Nursing home: number of hours/week",
  trnursi = "Stay in nursing home",
  trperch = "Personal care: number of hours/week",
  trpersc = "Home care: personal care",
  trrioot = "Other indication",
  trrioyn = "Indication (on medical grounds)",
  truf24c = "Use of facilities past half year: 24 hours care (at home or residential)",
  trufdac = "Use of facilities past half year: daytime activities (group)",
  trufgui = "Use of facilities past half year: guidance (one on one)",
  trufntc = "Use of facilities past half year: night treatment residential care",
  trufssc = "Use of facilities past half year: short stay residential care",
  trurgyn = "Urgent indication",
  .applies_to_waves = c("Z")
)

variable_labels(
  "tradapt", "trappli", "trdisth", "trdistr", "trdomch", "trdomec", "trelddn", "treldeh", "trelder", "trhomec", "trmeal", "trmealn", "trnurdn", "trnursd", "trnursh", "trnursi", "trperch", "trpersc", "trrioot", "trrioyn", "trurgyn",
  .applies_to_waves = c("E", "F")
)

variable_labels(
  "truf24c", "trufdac", "trufgui", "trufntc", "trufssc",
  .applies_to_waves = c("I", "J", "K")
)

# define value labels ----
value_labels(
  `-2` = "na, see TRRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tradapt", "trappli", "trdistr", "trelder", "trhomec", "trmeal", "trnursi", "trrioot"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRDISTR", `-1` = "na, asked",
  .applies_to_vars = c("trdisth"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRDOMEC", `-1` = "na, asked",
  .applies_to_vars = c("trdomch"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRHOMEC", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trdomec", "trpersc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRELDER", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both: day and night treatment",
  .applies_to_vars = c("trelddn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRELDER", `-1` = "na, asked",
  .applies_to_vars = c("treldeh"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRMEAL", `-1` = "na, asked",
  .applies_to_vars = c("trmealn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRNURSI", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both: day and night treatment",
  .applies_to_vars = c("trnurdn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRNURSI", `-1` = "na, asked", `1` = "somatic", `2` = "psychogeriatric",
  .applies_to_vars = c("trnursd"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRNURSI", `-1` = "na, asked",
  .applies_to_vars = c("trnursh"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRPERSC", `-1` = "na, asked",
  .applies_to_vars = c("trperch"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "no, but expect one soon", `3` = "yes", `4` = "answer 2 + 3",
  .applies_to_vars = c("trrioyn"),
  .applies_to_waves = c("Z", "E", "F")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("truf24c", "trufdac", "trufgui", "trufntc", "trufssc"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-2` = "na, see TRRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes, urgent", `3` = "yes, very urgent",
  .applies_to_vars = c("trurgyn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see ETRRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tradapt", "trappli", "trdistr", "trelder", "trhomec", "trmeal", "trnursi", "trrioot"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETRDISTR", `-1` = "na, asked",
  .applies_to_vars = c("trdisth"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETRDOMEC", `-1` = "na, asked",
  .applies_to_vars = c("trdomch"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETRHOMEC", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trdomec", "trpersc"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETRELDER", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both: day and night treatment",
  .applies_to_vars = c("trelddn"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETRELDER", `-1` = "na, asked",
  .applies_to_vars = c("treldeh"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETRMEAL", `-1` = "na, asked",
  .applies_to_vars = c("trmealn"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETRNURSI", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both: day and night treatment",
  .applies_to_vars = c("trnurdn"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETRNURSI", `-1` = "na, asked", `1` = "somatic", `2` = "psychogeriatric",
  .applies_to_vars = c("trnursd"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETRNURSI", `-1` = "na, asked",
  .applies_to_vars = c("trnursh"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETRPERSC", `-1` = "na, asked",
  .applies_to_vars = c("trperch"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see FTRRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes, urgent", `3` = "yes, very urgent",
  .applies_to_vars = c("trurgyn"),
  .applies_to_waves = c("E", "F")
)

value_labels(
  `-2` = "na, see FTRRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tradapt", "trappli", "trdistr", "trelder", "trhomec", "trmeal", "trnursi", "trrioot"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTRDISTR", `-1` = "na, asked",
  .applies_to_vars = c("trdisth"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTRDOMEC", `-1` = "na, asked",
  .applies_to_vars = c("trdomch"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTRHOMEC", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trdomec", "trpersc"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTRELDER", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both: day and night treatment",
  .applies_to_vars = c("trelddn"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTRELDER", `-1` = "na, asked",
  .applies_to_vars = c("treldeh"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTRMEAL", `-1` = "na, asked",
  .applies_to_vars = c("trmealn"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTRNURSI", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both: day and night treatment",
  .applies_to_vars = c("trnurdn"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTRNURSI", `-1` = "na, asked", `1` = "somatic", `2` = "psychogeriatric",
  .applies_to_vars = c("trnursd"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTRNURSI", `-1` = "na, asked",
  .applies_to_vars = c("trnursh"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTRPERSC", `-1` = "na, asked",
  .applies_to_vars = c("trperch"),
  .applies_to_waves = c("F")
)

.lasa_fc_710 <- .lasa_finalize_fc("710")

