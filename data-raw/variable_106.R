## LASA filecode 106 -- variable names, variable labels, value labels,
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
  qworkd = "categorical",
  qworkd1 = "categorical",
  qworkd10 = "categorical",
  qworkd11 = "categorical",
  qworkd12 = "categorical",
  qworkd13 = "categorical",
  qworkd14 = "categorical",
  qworkd15 = "categorical",
  qworkd16 = "categorical",
  qworkd17 = "categorical",
  qworkd18 = "categorical",
  qworkd19 = "categorical",
  qworkd2 = "categorical",
  qworkd20 = "categorical",
  qworkd21 = "categorical",
  qworkd3 = "categorical",
  qworkd4 = "categorical",
  qworkd5 = "categorical",
  qworkd6 = "categorical",
  qworkd7 = "categorical",
  qworkd8 = "categorical",
  qworkd9 = "categorical",
  qworkn1 = "categorical",
  qworkn10 = "categorical",
  qworkn11 = "categorical",
  qworkn12 = "categorical",
  qworkn13 = "categorical",
  qworkn2 = "categorical",
  qworkn3 = "categorical",
  qworkn4 = "categorical",
  qworkn5 = "categorical",
  qworkn6 = "categorical",
  qworkn7 = "categorical",
  qworkn8 = "categorical",
  qworkn9 = "categorical",
  qworkp1 = "categorical",
  qworkp10 = "categorical",
  qworkp11 = "categorical",
  qworkp12 = "categorical",
  qworkp13 = "categorical",
  qworkp2 = "categorical",
  qworkp3 = "categorical",
  qworkp4 = "categorical",
  qworkp5 = "categorical",
  qworkp6 = "categorical",
  qworkp7 = "categorical",
  qworkp8 = "categorical",
  qworkp9 = "categorical",
  qworkyn = "categorical"
)

# define variable labels ----
variable_labels(
  qworkd = "work demands: ever had a job?",
  qworkd1 = "work demands: use of force",
  qworkd10 = "work demands: think of solutions",
  qworkd11 = "work demands: when to take time off",
  qworkd12 = "work demands: variation in tasks",
  qworkd13 = "work demands: learn new things",
  qworkd14 = "work demands: requires creativity",
  qworkd15 = "work demands: requires thinking intensively",
  qworkd16 = "work demands: requires focus",
  qworkd17 = "work demands: requires attention",
  qworkd18 = "work demands: help and support of colleagues",
  qworkd19 = "work demands: colleagues willing to listen to work related problems",
  qworkd2 = "work demands: using tools that cause vibration or shaking",
  qworkd20 = "work demands: help and support of supervisor",
  qworkd21 = "work demands: supervisor willing to listen to work related problems",
  qworkd3 = "work demands: uncomfortable position",
  qworkd4 = "work demands: standing for a long time",
  qworkd5 = "work demands: kneeling down or squatting",
  qworkd6 = "work demands: working very fast",
  qworkd7 = "work demands: a lot of work",
  qworkd8 = "work demands: control over how to do the job",
  qworkd9 = "work demands: control over sequence of tasks",
  qworkn1 = "work demands: use of force",
  qworkn10 = "work demands: variation in tasks",
  qworkn11 = "work demands: requires thinking intensively",
  qworkn12 = "work demands: colleagues willing to listen to work related problems",
  qworkn13 = "work demands: supervisor willing to listen to work related problems",
  qworkn2 = "work demands: using tools that cause vibration or shaking",
  qworkn3 = "work demands: uncomfortable position",
  qworkn4 = "work demands: standing for a long time",
  qworkn5 = "work demands: kneeling down or squatting",
  qworkn6 = "work demands: working very fast",
  qworkn7 = "work demands: a lot of work",
  qworkn8 = "work demands: control over how to do the job",
  qworkn9 = "work demands: control over sequence of tasks",
  qworkp1 = "work demanded: use of force",
  qworkp10 = "work demanded: variation in tasks",
  qworkp11 = "work demanded: requires thinking intensively",
  qworkp12 = "work demanded: colleagues willing to listen to work related problems",
  qworkp13 = "work demanded: supervisor willing to listen to work related problems",
  qworkp2 = "work demanded: using tools that cause vibration or shaking",
  qworkp3 = "work demanded: uncomfortable position",
  qworkp4 = "work demanded: standing for a long time",
  qworkp5 = "work demanded: kneeling down or squatting",
  qworkp6 = "work demanded: working very fast",
  qworkp7 = "work demanded: a lot of work",
  qworkp8 = "work demanded: control over how to do the job",
  qworkp9 = "work demanded: control over sequence of tasks",
  qworkyn = "work demands: ever had a job?",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qworkd", "qworkd1", "qworkd10", "qworkd11", "qworkd12", "qworkd13", "qworkd14", "qworkd15", "qworkd16", "qworkd17", "qworkd18", "qworkd19", "qworkd2", "qworkd20", "qworkd21", "qworkd3", "qworkd4", "qworkd5", "qworkd6", "qworkd7", "qworkd8", "qworkd9",
  .applies_to_waves = c("3B", "I", "J", "K")
)

variable_labels(
  "qworkn1", "qworkn10", "qworkn11", "qworkn12", "qworkn13", "qworkn2", "qworkn3", "qworkn4", "qworkn5", "qworkn6", "qworkn7", "qworkn8", "qworkn9", "qworkp1", "qworkp10", "qworkp11", "qworkp12", "qworkp13", "qworkp2", "qworkp3", "qworkp4", "qworkp5", "qworkp6", "qworkp7", "qworkp8", "qworkp9", "qworkyn",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("qworkd1", "qworkd10", "qworkd11", "qworkd12", "qworkd13", "qworkd14", "qworkd15", "qworkd16", "qworkd17", "qworkd18", "qworkd19", "qworkd2", "qworkd20", "qworkd21", "qworkd3", "qworkd4", "qworkd5", "qworkd6", "qworkd7", "qworkd8", "qworkd9", "qworkn1", "qworkn10", "qworkn11", "qworkn12", "qworkn13", "qworkn2", "qworkn3", "qworkn4", "qworkn5", "qworkn6", "qworkn7", "qworkn8", "qworkn9", "qworkp1", "qworkp10", "qworkp11", "qworkp12", "qworkp13", "qworkp2", "qworkp3", "qworkp4", "qworkp5", "qworkp6", "qworkp7", "qworkp8", "qworkp9"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "never had a job", `2` = "has/had a job",
  .applies_to_vars = c("qworkd"),
  .applies_to_waves = c("Z", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "never", `2` = "sometimes", `3` = "often", `4` = "all the time", `5` = "not applicable",
  .applies_to_vars = c("qworkd1", "qworkd10", "qworkd11", "qworkd12", "qworkd13", "qworkd14", "qworkd15", "qworkd16", "qworkd17", "qworkd2", "qworkd3", "qworkd4", "qworkd5", "qworkd6", "qworkd7", "qworkd8", "qworkd9"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `-1` = "na, asked", `1` = "never", `2` = "sometimes", `3` = "often", `4` = "all the time", `5` = "not applicable",
  .applies_to_vars = c("qworkd18", "qworkd19", "qworkd20", "qworkd21"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "never", `2` = "sometimes", `3` = "often", `4` = "all the time",
  .applies_to_vars = c("qworkn1", "qworkn10", "qworkn11", "qworkn12", "qworkn13", "qworkn2", "qworkn3", "qworkn4", "qworkn5", "qworkn6", "qworkn7", "qworkn8", "qworkn9", "qworkp1", "qworkp10", "qworkp11", "qworkp12", "qworkp13", "qworkp2", "qworkp3", "qworkp4", "qworkp5", "qworkp6", "qworkp7", "qworkp8", "qworkp9"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-1` = "na, asked", `1` = "never had a job", `2` = "had a job", `3` = "has a job",
  .applies_to_vars = c("qworkyn"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-2` = "na, see BQWORKD",
  .applies_to_vars = c("qworkd1", "qworkd10", "qworkd11", "qworkd12", "qworkd13", "qworkd14", "qworkd15", "qworkd16", "qworkd17", "qworkd18", "qworkd19", "qworkd2", "qworkd20", "qworkd21", "qworkd3", "qworkd4", "qworkd5", "qworkd6", "qworkd7", "qworkd8", "qworkd9"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-1` = "na, asked", `1` = "never", `2` = "sometimes", `3` = "often", `4` = "all the time",
  .applies_to_vars = c("qworkd1", "qworkd10", "qworkd11", "qworkd12", "qworkd13", "qworkd14", "qworkd15", "qworkd16", "qworkd17", "qworkd2", "qworkd3", "qworkd4", "qworkd5", "qworkd6", "qworkd7", "qworkd8", "qworkd9"),
  .applies_to_waves = c("3B", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "never", `2` = "sometimes", `3` = "often", `4` = "all the time",
  .applies_to_vars = c("qworkd18", "qworkd19", "qworkd20", "qworkd21"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BQWORKYN",
  .applies_to_vars = c("qworkn1", "qworkn10", "qworkn11", "qworkn12", "qworkn13", "qworkn2", "qworkn3", "qworkn4", "qworkn5", "qworkn6", "qworkn7", "qworkn8", "qworkn9", "qworkp1", "qworkp10", "qworkp11", "qworkp12", "qworkp13", "qworkp2", "qworkp3", "qworkp4", "qworkp5", "qworkp6", "qworkp7", "qworkp8", "qworkp9"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see IQWORKD",
  .applies_to_vars = c("qworkd1", "qworkd10", "qworkd11", "qworkd12", "qworkd13", "qworkd14", "qworkd15", "qworkd16", "qworkd17", "qworkd18", "qworkd19", "qworkd2", "qworkd20", "qworkd21", "qworkd3", "qworkd4", "qworkd5", "qworkd6", "qworkd7", "qworkd8", "qworkd9"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see JQWORKD",
  .applies_to_vars = c("qworkd1", "qworkd10", "qworkd11", "qworkd12", "qworkd13", "qworkd14", "qworkd15", "qworkd16", "qworkd17", "qworkd18", "qworkd19", "qworkd2", "qworkd20", "qworkd21", "qworkd3", "qworkd4", "qworkd5", "qworkd6", "qworkd7", "qworkd8", "qworkd9"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see KQWORKD",
  .applies_to_vars = c("qworkd1", "qworkd10", "qworkd11", "qworkd12", "qworkd13", "qworkd14", "qworkd15", "qworkd16", "qworkd17", "qworkd18", "qworkd19", "qworkd2", "qworkd20", "qworkd21", "qworkd3", "qworkd4", "qworkd5", "qworkd6", "qworkd7", "qworkd8", "qworkd9"),
  .applies_to_waves = c("K")
)

.lasa_fc_106 <- .lasa_finalize_fc("106")

