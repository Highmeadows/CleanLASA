## LASA filecode 157 -- variable names, variable labels, value labels,
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
  mcontra = "numeric",
  mctglas = "categorical",
  mctglcl = "categorical",
  mctinch = "categorical",
  mctley1 = "numeric",
  mctley2 = "numeric",
  mctley3 = "numeric",
  mctley4 = "numeric",
  mctley5 = "numeric",
  mctpart = "text",
  mctrey1 = "numeric",
  mctrey2 = "numeric",
  mctrey3 = "numeric",
  mctrey4 = "numeric",
  mctrey5 = "numeric",
  mctrm = "categorical",
  mctunde = "categorical",
  mdasig1 = "categorical",
  mdasig2 = "categorical",
  mdasig3 = "categorical",
  mdasig4 = "categorical",
  mdasig5 = "categorical",
  mdasig6 = "categorical",
  meyetes = "categorical",
  mlecont = "numeric",
  mricont = "numeric"
)

# define variable labels ----
variable_labels(
  mcontra = "contrast: total score low-high",
  mctglas = "during test: glasses or contact lenses",
  mctglcl = "contrast test: with glasses or contact lenses",
  mctinch = "contrast: inch",
  mctley1 = "contrast: left eye A",
  mctley2 = "contrast: left eye B",
  mctley3 = "contrast: left eye C",
  mctley4 = "contrast: left eye D",
  mctley5 = "contrast: left eye E",
  mctpart = "participation with contrast test",
  mctrey1 = "contrast: right eye A",
  mctrey2 = "contrast: right eye B",
  mctrey3 = "contrast: right eye C",
  mctrey4 = "contrast: right eye D",
  mctrey5 = "contrast: right eye E",
  mctrm = "reason contrast test not done",
  mctunde = "understanding of contrast test",
  mdasig1 = "Daily sight: see better cloudy vs sunny weather",
  mdasig2 = "Daily sight: blinded on clear day",
  mdasig3 = "Daily sight: blinded by indoor/outdoor",
  mdasig4 = "Daily sight: see bicycles and cars approaching",
  mdasig5 = "Daily sight: regularly do not see doors and chairs",
  mdasig6 = "Daily sight: regularly do not see floor related objects",
  meyetes = "Eye contrast test done: constructed",
  mlecont = "left eye: total score low-high",
  mricont = "right eye: total score low-high",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mcontra", "mlecont", "mricont",
  .applies_to_waves = c("B")
)

variable_labels(
  "mctinch", "mctley1", "mctley2", "mctley3", "mctley4", "mctley5", "mctrey1", "mctrey2", "mctrey3", "mctrey4", "mctrey5",
  .applies_to_waves = c("B", "C")
)

variable_labels(
  "mctpart", "mctunde",
  .applies_to_waves = c("B", "C", "D")
)

variable_labels(
  "mctglas", "mctrm", "meyetes",
  .applies_to_waves = c("C")
)

variable_labels(
  "mctglcl",
  .applies_to_waves = c("D")
)

variable_labels(
  "mdasig1", "mdasig2", "mdasig4", "mdasig5", "mdasig6",
  .applies_to_waves = c("D", "E", "2B", "F")
)

variable_labels(
  mdasig1 = "weather: cloudy",
  mdasig2 = "weather: clear sky",
  .applies_to_waves = c("B", "C")
)

variable_labels(
  mdasig3 = "sight: blinded by indoor/outdoor",
  .applies_to_waves = c("B")
)

variable_labels(
  mdasig3 = "weather: blinded by indoor/outdoor",
  .applies_to_waves = c("C")
)

variable_labels(
  mctinch = "contast test: inch",
  mctley1 = "contrast test: left eye A",
  mctley2 = "contrast test: left eye B",
  mctley3 = "contrast test: left eye C",
  mctley4 = "contrast test: left eye D",
  mctley5 = "contrast test: left eye E",
  mctrey1 = "contrast test: right eye A",
  mctrey2 = "contrast test: right eye B",
  mctrey3 = "contrast test: right eye C",
  mctrey4 = "contrast test: right eye D",
  mctrey5 = "contrast test: right eye E",
  .applies_to_waves = c("D")
)

variable_labels(
  mdasig3 = "Daily sight: blinded when indoor/outdoor",
  .applies_to_waves = c("D", "E", "2B", "F")
)

# define value labels ----
value_labels(
  `-1` = "na, asked / no measurement",
  .applies_to_vars = c("mctley1", "mctley2", "mctley3", "mctley4", "mctley5", "mctrey1", "mctrey2", "mctrey3", "mctrey4", "mctrey5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("mcontra", "mlecont", "mricont"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMEYETES", `-1` = "na, asked", `1` = "none", `2` = "glasses", `3` = "contact lenses",
  .applies_to_vars = c("mctglas"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "na, asked", `1` = "none", `2` = "glasses", `3` = "contact lenses",
  .applies_to_vars = c("mctglcl"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-3` = "no valid data / na, wrong skip", `-2` = "no measurement done / na, see CMEYETES", `-1` = "no answer, asked / no measurement", `1` = "30cm", `2` = "32cm", `3` = "40cm", `4` = "18inch [ca 46 cm]",
  .applies_to_vars = c("mctinch"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMEYETES",
  .applies_to_vars = c("mctley1", "mctley2", "mctley3", "mctley4", "mctley5", "mctrey1", "mctrey2", "mctrey3", "mctrey4", "mctrey5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see CMEYETES", `4` = "refused", `5` = "not able to [cognitive]", `6` = "not able to [physical]", `7` = "technical problems", `8` = "unknown",
  .applies_to_vars = c("mctrm"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "no valid data / na, wrong skip", `-2` = "no measurement done / na, see CMEYETES", `-1` = "na, asked", `1` = "excellent", `2` = "good", `3` = "moderate", `4` = "bad", `5` = "refused", `6` = "other reason", `10` = "other: not done", `20` = "other: not able to: phys", `30` = "other: not able to: cogn", `40` = "other: not done: technical",
  .applies_to_vars = c("mctunde"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no valid data", `-2` = "no measurement done", `-1` = "na, asked", `1` = "rarely", `2` = "sometimes", `3` = "often", `4` = "almost always",
  .applies_to_vars = c("mdasig1", "mdasig2", "mdasig3"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-1` = "na, asked", `1` = "rarely", `2` = "sometimes", `3` = "often", `4` = "almost always",
  .applies_to_vars = c("mdasig4", "mdasig5", "mdasig6"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F")
)

value_labels(
  `1` = "done", `2` = "not done", `3` = "no right eye", `4` = "no left eye", `5` = "terminated",
  .applies_to_vars = c("meyetes"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "no valid data", `-2` = "no measurement done", `-1` = "no answer, asked",
  .applies_to_vars = c("mctinch"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no valid data", `-2` = "no measurement done", `-1` = "no answer, asked", `1` = "excellent", `2` = "good", `3` = "moderate", `4` = "bad", `5` = "refused", `6` = "other reason",
  .applies_to_vars = c("mctunde"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMEYETES", `1` = "30cm", `2` = "32cm", `3` = "40cm", `4` = "18inch [ca 46 cm]",
  .applies_to_vars = c("mctinch"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMEYETES", `-1` = "na, asked",
  .applies_to_vars = c("mctley1", "mctley2", "mctley3", "mctley4", "mctley5", "mctrey1", "mctrey2", "mctrey3", "mctrey4", "mctrey5"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMEYETES", `-1` = "na, asked", `1` = "excellent", `2` = "good", `3` = "moderate", `4` = "bad", `10` = "other: not done", `20` = "other: not able to: phys", `30` = "other: not able to: cogn", `40` = "other: not done: technical",
  .applies_to_vars = c("mctunde"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "no valid data", `-1` = "no answer, asked", `1` = "rarely", `2` = "sometimes", `3` = "often", `4` = "almost always",
  .applies_to_vars = c("mdasig1", "mdasig2", "mdasig3"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "no measurement",
  .applies_to_vars = c("mctinch", "mctley1", "mctley2", "mctley3", "mctley4", "mctley5", "mctrey1", "mctrey2", "mctrey3", "mctrey4", "mctrey5"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "no measurement done", `-1` = "no answer, asked", `1` = "excellent", `2` = "good", `3` = "moderate", `4` = "bad", `5` = "refused", `6` = "other reason",
  .applies_to_vars = c("mctunde"),
  .applies_to_waves = c("D")
)

value_labels(
  `-1` = "no answer, asked", `1` = "rarely", `2` = "sometimes", `3` = "often", `4` = "almost always",
  .applies_to_vars = c("mdasig1", "mdasig2", "mdasig3"),
  .applies_to_waves = c("D", "E", "2B", "F")
)

.lasa_fc_157 <- .lasa_finalize_fc("157")

