## LASA filecode 165 -- variable names, variable labels, value labels,
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
  Acor = "numeric",
  Adub = "numeric",
  Anot = "categorical",
  Aoth = "numeric",
  Arm = "text",
  SWcor = "numeric",
  SWdub = "numeric",
  SWnot = "categorical",
  SWoth = "numeric",
  SWpa_0 = "categorical",
  SWpa_1 = "categorical",
  SWpa_2 = "categorical",
  SWpa_3 = "categorical",
  SWpa_4 = "categorical",
  SWpa_5 = "categorical",
  SWpa_5sp = "text",
  SWrm = "text",
  mAcor = "numeric",
  mAdub = "numeric",
  mAnot = "categorical",
  mAoth = "numeric",
  mApa_0 = "categorical",
  mApa_1 = "categorical",
  mApa_2 = "categorical",
  mApa_3 = "categorical",
  mApa_4 = "categorical",
  mApa_5 = "categorical",
  mApa_5sp = "text",
  mArm = "text",
  mDWcor = "numeric",
  mDWdub = "numeric",
  mDWnot = "categorical",
  mDWoth = "numeric",
  mDWpa_0 = "categorical",
  mDWpa_1 = "categorical",
  mDWpa_2 = "categorical",
  mDWpa_3 = "categorical",
  mDWpa_4 = "categorical",
  mDWpa_5 = "categorical",
  mDWpa_5sp = "text",
  mDWrem = "text"
)

# define variable labels ----
variable_labels(
  Acor = "number of animals correct",
  Adub = "number of duplicate animal words",
  Anot = "animal fluency test status",
  Aoth = "number of non-animal words",
  Arm = "reason no animal fluency trial",
  SWcor = "number of supermarket words correct",
  SWdub = "number of duplicate supermarket words",
  SWnot = "supermarket-word fluency test status",
  SWoth = "number of non-supermarket words",
  SWpa_0 = "supermarket-word test particularities present",
  SWpa_1 = "supermarket-word particularity: others present",
  SWpa_2 = "supermarket-word particularity: auditory handicap",
  SWpa_3 = "supermarket-word particularity: radio or television noise",
  SWpa_4 = "supermarket-word particularity: interrupted",
  SWpa_5 = "supermarket-word particularity: other reason",
  SWpa_5sp = "supermarket-word particularity: other reason specification",
  SWrm = "reason no supermarket-word fluency trial",
  mAcor = "number of animals correct",
  mAdub = "number of duplicate animal words",
  mAnot = "animal fluency test status",
  mAoth = "number of non-animal words",
  mApa_0 = "animal test particularities present",
  mApa_1 = "animal particularity: others present",
  mApa_2 = "animal particularity: sensory handicap",
  mApa_3 = "animal particularity: radio or television noise",
  mApa_4 = "animal particularity: interrupted",
  mApa_5 = "animal particularity: other reason",
  mApa_5sp = "animal particularity: other reason specification",
  mArm = "reason no animal fluency trial",
  mDWcor = "number of D-words correct",
  mDWdub = "number of duplicate D-words",
  mDWnot = "D-word fluency test status",
  mDWoth = "number of non-D words",
  mDWpa_0 = "D-word test particularities present",
  mDWpa_1 = "D-word particularity: others present",
  mDWpa_2 = "D-word particularity: sensory handicap",
  mDWpa_3 = "D-word particularity: radio or television noise",
  mDWpa_4 = "D-word particularity: interrupted",
  mDWpa_5 = "D-word particularity: other reason",
  mDWpa_5sp = "D-word particularity: other reason specification",
  mDWrem = "reason no D-word fluency trial",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mAcor", "mDWcor",
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

variable_labels(
  mAdub = "number of animals double",
  mAnot = "fluency animals done?",
  mAoth = "number of other Animals",
  mApa_0 = "Animals particularities",
  mApa_1 = "Animals particularities: others present",
  mApa_3 = "Animals particularities: radio or tv noise",
  mApa_4 = "Animals particularities: interrupted",
  mApa_5 = "Animals particularities: other reason",
  mDWdub = "number of D-words double",
  mDWnot = "fluency D-words done?",
  mDWoth = "number of other than D-words",
  mDWpa_0 = "D-words particularities",
  mDWpa_1 = "D-words particularities: others present",
  mDWpa_3 = "D-words particularities: radio or tv noise",
  mDWpa_4 = "D-words particularities: interrupted",
  mDWpa_5 = "D-words particularities: other reason",
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

variable_labels(
  mApa_2 = "Animals particularities: auditory handicap",
  mDWpa_2 = "D-words particularities: auditory handicap",
  .applies_to_waves = c("H", "I", "J", "K")
)

variable_labels(
  mApa_2 = "Animals particularities: visually handicapped",
  mDWpa_2 = "D-words particularities: visually handicapped",
  .applies_to_waves = c("3B")
)

variable_labels(
  Acor = "number of Animals correct",
  Adub = "number of Animals double",
  Anot = "fluency Animals done?",
  Aoth = "number of other Animals",
  Arm = "fluency: reason no Animals trial",
  SWcor = "number of Supermarket-words correct",
  SWdub = "number of Supermarket-words double",
  SWnot = "fluency Supermarket-words done?",
  SWoth = "number of other than Supermarket-words",
  SWpa_0 = "Supermarket words particularities",
  SWpa_1 = "Supermarket words part.: others present",
  SWpa_2 = "Supermarket words part.: auditory handicap",
  SWpa_3 = "Supermarket words part.: radio or tv noise",
  SWpa_4 = "Supermarket words part.: interrupted",
  SWpa_5 = "Supermarket words part.: other reason",
  SWpa_5sp = "specification part.: other reason",
  SWrm = "fluency: reason no Supermarket-words trial",
  .applies_to_waves = c("MB")
)

variable_labels(
  mApa_5sp = "Animals particularities: other reason specification",
  mArm = "fluency: reason no Animals trial",
  mDWpa_5sp = "D-words particularities: other reason specification",
  mDWrem = "fluency: reason no D-words trial",
  .applies_to_waves = c("I")
)

# define value labels ----
value_labels(
  `-1` = "missing/interview terminated",
  .applies_to_vars = c("mAnot", "mDWnot"),
  .applies_to_waves = c("Z", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "no",
  .applies_to_vars = c("SWpa_1", "SWpa_2", "SWpa_3", "SWpa_4", "SWpa_5", "mApa_1", "mApa_2", "mApa_3", "mApa_4", "mApa_5", "mDWpa_1", "mDWpa_2", "mDWpa_3", "mDWpa_4", "mDWpa_5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no trial",
  .applies_to_vars = c("Acor", "Adub", "Aoth", "SWcor", "SWdub", "SWoth"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-1` = "missing", `0` = "test not done", `1` = "test done", `2` = "test done, score 0",
  .applies_to_vars = c("Anot", "SWnot"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-3` = "no test", `0` = "no", `1` = "yes",
  .applies_to_vars = c("SWpa_0"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-3` = "no test", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("SWpa_1", "SWpa_2", "SWpa_3", "SWpa_4", "SWpa_5", "mApa_1", "mApa_2", "mApa_3", "mApa_4", "mApa_5", "mDWpa_1", "mDWpa_2", "mDWpa_3", "mDWpa_4", "mDWpa_5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no trial",
  .applies_to_vars = c("mAcor", "mAdub", "mAoth", "mDWcor", "mDWdub", "mDWoth"),
  .applies_to_waves = c("Z", "H", "3B", "I", "J", "K")
)

value_labels(
  `0` = "test not done", `1` = "test done", `2` = "test done, score 0",
  .applies_to_vars = c("mAnot", "mDWnot"),
  .applies_to_waves = c("Z", "H", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "no test", `0` = "no", `1` = "yes",
  .applies_to_vars = c("mApa_0", "mDWpa_0"),
  .applies_to_waves = c("Z", "H", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "no test", `-2` = "no particularities", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mApa_1", "mApa_2", "mApa_3", "mApa_4", "mApa_5", "mDWpa_1", "mDWpa_2", "mDWpa_3", "mDWpa_4", "mDWpa_5"),
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "no test", `-2` = "no particularities", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("SWpa_1", "SWpa_2", "SWpa_3", "SWpa_4", "SWpa_5"),
  .applies_to_waves = c("MB")
)

.lasa_fc_165 <- .lasa_finalize_fc("165")

