## LASA filecode 610 -- variable names, variable labels, value labels,
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
  tpadapt = "categorical",
  tpappli = "categorical",
  tpdisth = "numeric",
  tpdistr = "categorical",
  tpdomch = "numeric",
  tpdomec = "categorical",
  tpelddn = "categorical",
  tpeldeh = "numeric",
  tpelder = "categorical",
  tphomec = "categorical",
  tpmeal = "categorical",
  tpmealn = "numeric",
  tpnurdn = "categorical",
  tpnursd = "categorical",
  tpnursh = "numeric",
  tpnursi = "categorical",
  tpperch = "numeric",
  tppersc = "categorical",
  tprioot = "categorical",
  tprioyn = "categorical",
  tpuf24c = "categorical",
  tpufdac = "categorical",
  tpufgui = "categorical",
  tpufntc = "categorical",
  tpufssc = "categorical",
  tpurgyn = "categorical"
)

# define variable labels ----
variable_labels(
  tpadapt = "Indication for adaptations",
  tpappli = "Indication for an appliance",
  tpdisth = "District nurse: number of hours/week",
  tpdistr = "Indication for district nurse",
  tpdomch = "Domestic tasks: number of hours/week",
  tpdomec = "Home care: domestic tasks",
  tpelddn = "Day/night treatment in home for the elderly",
  tpeldeh = "Home for the elderly: number of hours/week",
  tpelder = "Stay in home for the elderly",
  tphomec = "Indication for home care",
  tpmeal = "Indication for meals",
  tpmealn = "Number of meals per week",
  tpnurdn = "Day/night treatment in nursing home",
  tpnursd = "Nursing home: department",
  tpnursh = "Nursing home: number of hours/week",
  tpnursi = "Stay in nursing home",
  tpperch = "Personal care: number of hours/week",
  tppersc = "Home care: personal care",
  tprioot = "Other indication",
  tprioyn = "Indication (on medical grounds)",
  tpuf24c = "Use of facilities past half year: 24 hours care (at home or residential)",
  tpufdac = "Use of facilities past half year: daytime activities (group)",
  tpufgui = "Use of facilities past half year: guidance (one on one)",
  tpufntc = "Use of facilities past half year: night treatment residential care",
  tpufssc = "Use of facilities past half year: short stay residential care",
  tpurgyn = "Urgent indication",
  .applies_to_waves = c("Z")
)

variable_labels(
  "tpadapt", "tpappli", "tpdisth", "tpdistr", "tpdomch", "tpdomec", "tpelddn", "tpeldeh", "tpelder", "tphomec", "tpmeal", "tpmealn", "tpnurdn", "tpnursd", "tpnursh", "tpnursi", "tpperch", "tppersc", "tprioot", "tprioyn", "tpurgyn",
  .applies_to_waves = c("E", "F")
)

variable_labels(
  "tpuf24c", "tpufdac", "tpufgui", "tpufntc", "tpufssc",
  .applies_to_waves = c("J", "K")
)

# define value labels ----
value_labels(
  `-2` = "na, see TPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpadapt", "tpappli", "tpdistr", "tpelder", "tphomec", "tpmeal", "tpnursi", "tprioot"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TPDISTR", `-1` = "na, asked",
  .applies_to_vars = c("tpdisth"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TPDOMEC", `-1` = "na, asked",
  .applies_to_vars = c("tpdomch"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TPHOMEC", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpdomec", "tppersc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TPELDER", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both: day and night treatment",
  .applies_to_vars = c("tpelddn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TPELDER", `-1` = "na, asked",
  .applies_to_vars = c("tpeldeh"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TPMEAL", `-1` = "na, asked",
  .applies_to_vars = c("tpmealn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TPNURSI", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both: day and night treatment",
  .applies_to_vars = c("tpnurdn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TPNURSI", `-1` = "na, asked", `1` = "somatic", `2` = "psychogeriatric",
  .applies_to_vars = c("tpnursd"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TPNURSI", `-1` = "na, asked",
  .applies_to_vars = c("tpnursh"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TPPERSC", `-1` = "na, asked",
  .applies_to_vars = c("tpperch"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "no, but expect one soon", `3` = "yes", `4` = "answer 2 + 3",
  .applies_to_vars = c("tprioyn"),
  .applies_to_waves = c("Z", "E", "F")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpuf24c", "tpufdac", "tpufgui", "tpufntc", "tpufssc"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-2` = "na, see TPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes, urgent", `3` = "yes, very urgent",
  .applies_to_vars = c("tpurgyn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see ETPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpadapt", "tpappli", "tpdistr", "tpelder", "tphomec", "tpmeal", "tpnursi", "tprioot"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETPDISTR", `-1` = "na, asked",
  .applies_to_vars = c("tpdisth"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETPDOMEC", `-1` = "na, asked",
  .applies_to_vars = c("tpdomch"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETPHOMEC", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpdomec", "tppersc"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETPELDER", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both: day and night treatment",
  .applies_to_vars = c("tpelddn"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETPELDER", `-1` = "na, asked",
  .applies_to_vars = c("tpeldeh"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETPMEAL", `-1` = "na, asked",
  .applies_to_vars = c("tpmealn"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETPNURSI", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both: day and night treatment",
  .applies_to_vars = c("tpnurdn"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETPNURSI", `-1` = "na, asked", `1` = "somatic", `2` = "psychogeriatric",
  .applies_to_vars = c("tpnursd"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETPNURSI", `-1` = "na, asked",
  .applies_to_vars = c("tpnursh"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETPPERSC", `-1` = "na, asked",
  .applies_to_vars = c("tpperch"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes, urgent", `3` = "yes, very urgent",
  .applies_to_vars = c("tpurgyn"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see FTPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpadapt", "tpappli", "tpdistr", "tpelder", "tphomec", "tpmeal", "tpnursi", "tprioot"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTPDISTR", `-1` = "na, asked",
  .applies_to_vars = c("tpdisth"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTPDOMEC", `-1` = "na, asked",
  .applies_to_vars = c("tpdomch"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTPHOMEC", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpdomec", "tppersc"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTPELDER", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both: day and night treatment",
  .applies_to_vars = c("tpelddn"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTPELDER", `-1` = "na, asked",
  .applies_to_vars = c("tpeldeh"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTPMEAL", `-1` = "na, asked",
  .applies_to_vars = c("tpmealn"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTPNURSI", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both: day and night treatment",
  .applies_to_vars = c("tpnurdn"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTPNURSI", `-1` = "na, asked", `1` = "somatic", `2` = "psychogeriatric",
  .applies_to_vars = c("tpnursd"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTPNURSI", `-1` = "na, asked",
  .applies_to_vars = c("tpnursh"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTPPERSC", `-1` = "na, asked",
  .applies_to_vars = c("tpperch"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes, urgent", `3` = "yes, very urgent",
  .applies_to_vars = c("tpurgyn"),
  .applies_to_waves = c("F")
)

.lasa_fc_610 <- .lasa_finalize_fc("610")

