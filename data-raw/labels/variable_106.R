## LASA filecode 106 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  qworkyn = "work demands: ever had a job?"
)

variable_labels_list <- list(
  Wave_3B_labels = harmonized_labels[c(
    "qworkd",
    "qworkd1",
    "qworkd10",
    "qworkd11",
    "qworkd12",
    "qworkd13",
    "qworkd14",
    "qworkd15",
    "qworkd16",
    "qworkd17",
    "qworkd18",
    "qworkd19",
    "qworkd2",
    "qworkd20",
    "qworkd21",
    "qworkd3",
    "qworkd4",
    "qworkd5",
    "qworkd6",
    "qworkd7",
    "qworkd8",
    "qworkd9"
  )],
  Wave_MB_labels = harmonized_labels[c(
    "qworkn1",
    "qworkn10",
    "qworkn11",
    "qworkn12",
    "qworkn13",
    "qworkn2",
    "qworkn3",
    "qworkn4",
    "qworkn5",
    "qworkn6",
    "qworkn7",
    "qworkn8",
    "qworkn9",
    "qworkp1",
    "qworkp10",
    "qworkp11",
    "qworkp12",
    "qworkp13",
    "qworkp2",
    "qworkp3",
    "qworkp4",
    "qworkp5",
    "qworkp6",
    "qworkp7",
    "qworkp8",
    "qworkp9",
    "qworkyn"
  )],
  Wave_I_labels = harmonized_labels[c(
    "qworkd",
    "qworkd1",
    "qworkd10",
    "qworkd11",
    "qworkd12",
    "qworkd13",
    "qworkd14",
    "qworkd15",
    "qworkd16",
    "qworkd17",
    "qworkd18",
    "qworkd19",
    "qworkd2",
    "qworkd20",
    "qworkd21",
    "qworkd3",
    "qworkd4",
    "qworkd5",
    "qworkd6",
    "qworkd7",
    "qworkd8",
    "qworkd9"
  )],
  Wave_J_labels = harmonized_labels[c(
    "qworkd",
    "qworkd1",
    "qworkd10",
    "qworkd11",
    "qworkd12",
    "qworkd13",
    "qworkd14",
    "qworkd15",
    "qworkd16",
    "qworkd17",
    "qworkd18",
    "qworkd19",
    "qworkd2",
    "qworkd20",
    "qworkd21",
    "qworkd3",
    "qworkd4",
    "qworkd5",
    "qworkd6",
    "qworkd7",
    "qworkd8",
    "qworkd9"
  )],
  Wave_K_labels = harmonized_labels[c(
    "qworkd",
    "qworkd1",
    "qworkd10",
    "qworkd11",
    "qworkd12",
    "qworkd13",
    "qworkd14",
    "qworkd15",
    "qworkd16",
    "qworkd17",
    "qworkd18",
    "qworkd19",
    "qworkd2",
    "qworkd20",
    "qworkd21",
    "qworkd3",
    "qworkd4",
    "qworkd5",
    "qworkd6",
    "qworkd7",
    "qworkd8",
    "qworkd9"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qworkd = c(`-1` = "not available, asked", `1` = "never had a job", `2` = "has/had a job"),
  qworkd1 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd10 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd11 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd12 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd13 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd14 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd15 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd16 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd17 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd18 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd19 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd2 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd20 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd21 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd3 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd4 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd5 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd6 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd7 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd8 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkd9 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time",
    `5` = "not applicable"
  ),
  qworkn1 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkn10 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkn11 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkn12 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkn13 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkn2 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkn3 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkn4 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkn5 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkn6 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkn7 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkn8 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkn9 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkp1 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkp10 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkp11 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkp12 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkp13 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkp2 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkp3 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkp4 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkp5 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkp6 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkp7 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkp8 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkp9 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
  qworkyn = c(`-1` = "not available, asked", `1` = "never had a job", `2` = "had a job", `3` = "has a job")
)

value_labels_list <- list(
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "qworkd",
    "qworkd1",
    "qworkd10",
    "qworkd11",
    "qworkd12",
    "qworkd13",
    "qworkd14",
    "qworkd15",
    "qworkd16",
    "qworkd17",
    "qworkd18",
    "qworkd19",
    "qworkd2",
    "qworkd20",
    "qworkd21",
    "qworkd3",
    "qworkd4",
    "qworkd5",
    "qworkd6",
    "qworkd7",
    "qworkd8",
    "qworkd9"
  )],
    qworkd = .replace_labels(
    standardized_value_labels$qworkd,
    `-1` = "na, asked"
  ),
    qworkd1 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd10 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd11 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd12 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd13 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd14 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd15 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd16 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd17 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd18 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd19 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd2 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd20 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd21 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd3 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd4 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd5 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd6 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd7 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd8 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd9 = c(
    `-2` = "na, see BQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c(
    "qworkn1",
    "qworkn10",
    "qworkn11",
    "qworkn12",
    "qworkn13",
    "qworkn2",
    "qworkn3",
    "qworkn4",
    "qworkn5",
    "qworkn6",
    "qworkn7",
    "qworkn8",
    "qworkn9",
    "qworkp1",
    "qworkp10",
    "qworkp11",
    "qworkp12",
    "qworkp13",
    "qworkp2",
    "qworkp3",
    "qworkp4",
    "qworkp5",
    "qworkp6",
    "qworkp7",
    "qworkp8",
    "qworkp9",
    "qworkyn"
  )],
    qworkn1 = .replace_labels(
    standardized_value_labels$qworkn1,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkn10 = .replace_labels(
    standardized_value_labels$qworkn10,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkn11 = .replace_labels(
    standardized_value_labels$qworkn11,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkn12 = .replace_labels(
    standardized_value_labels$qworkn12,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkn13 = .replace_labels(
    standardized_value_labels$qworkn13,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkn2 = .replace_labels(
    standardized_value_labels$qworkn2,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkn3 = .replace_labels(
    standardized_value_labels$qworkn3,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkn4 = .replace_labels(
    standardized_value_labels$qworkn4,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkn5 = .replace_labels(
    standardized_value_labels$qworkn5,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkn6 = .replace_labels(
    standardized_value_labels$qworkn6,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkn7 = .replace_labels(
    standardized_value_labels$qworkn7,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkn8 = .replace_labels(
    standardized_value_labels$qworkn8,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkn9 = .replace_labels(
    standardized_value_labels$qworkn9,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkp1 = .replace_labels(
    standardized_value_labels$qworkp1,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkp10 = .replace_labels(
    standardized_value_labels$qworkp10,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkp11 = .replace_labels(
    standardized_value_labels$qworkp11,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkp12 = .replace_labels(
    standardized_value_labels$qworkp12,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkp13 = .replace_labels(
    standardized_value_labels$qworkp13,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkp2 = .replace_labels(
    standardized_value_labels$qworkp2,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkp3 = .replace_labels(
    standardized_value_labels$qworkp3,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkp4 = .replace_labels(
    standardized_value_labels$qworkp4,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkp5 = .replace_labels(
    standardized_value_labels$qworkp5,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkp6 = .replace_labels(
    standardized_value_labels$qworkp6,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkp7 = .replace_labels(
    standardized_value_labels$qworkp7,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkp8 = .replace_labels(
    standardized_value_labels$qworkp8,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkp9 = .replace_labels(
    standardized_value_labels$qworkp9,
    `-2` = "na, see BQWORKYN",
    `-1` = "na, asked"
  ),
    qworkyn = .replace_labels(
    standardized_value_labels$qworkyn,
    `-1` = "na, asked"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "qworkd",
    "qworkd1",
    "qworkd10",
    "qworkd11",
    "qworkd12",
    "qworkd13",
    "qworkd14",
    "qworkd15",
    "qworkd16",
    "qworkd17",
    "qworkd18",
    "qworkd19",
    "qworkd2",
    "qworkd20",
    "qworkd21",
    "qworkd3",
    "qworkd4",
    "qworkd5",
    "qworkd6",
    "qworkd7",
    "qworkd8",
    "qworkd9"
  )],
    qworkd = .replace_labels(
    standardized_value_labels$qworkd,
    `-1` = "na, asked"
  ),
    qworkd1 = .replace_labels(
    standardized_value_labels$qworkd1,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd10 = .replace_labels(
    standardized_value_labels$qworkd10,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd11 = .replace_labels(
    standardized_value_labels$qworkd11,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd12 = .replace_labels(
    standardized_value_labels$qworkd12,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd13 = .replace_labels(
    standardized_value_labels$qworkd13,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd14 = .replace_labels(
    standardized_value_labels$qworkd14,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd15 = .replace_labels(
    standardized_value_labels$qworkd15,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd16 = .replace_labels(
    standardized_value_labels$qworkd16,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd17 = .replace_labels(
    standardized_value_labels$qworkd17,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd18 = .replace_labels(
    standardized_value_labels$qworkd18,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd19 = .replace_labels(
    standardized_value_labels$qworkd19,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd2 = .replace_labels(
    standardized_value_labels$qworkd2,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd20 = .replace_labels(
    standardized_value_labels$qworkd20,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd21 = .replace_labels(
    standardized_value_labels$qworkd21,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd3 = .replace_labels(
    standardized_value_labels$qworkd3,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd4 = .replace_labels(
    standardized_value_labels$qworkd4,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd5 = .replace_labels(
    standardized_value_labels$qworkd5,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd6 = .replace_labels(
    standardized_value_labels$qworkd6,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd7 = .replace_labels(
    standardized_value_labels$qworkd7,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd8 = .replace_labels(
    standardized_value_labels$qworkd8,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  ),
    qworkd9 = .replace_labels(
    standardized_value_labels$qworkd9,
    `-2` = "na, see IQWORKD",
    `-1` = "na, asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "qworkd",
    "qworkd1",
    "qworkd10",
    "qworkd11",
    "qworkd12",
    "qworkd13",
    "qworkd14",
    "qworkd15",
    "qworkd16",
    "qworkd17",
    "qworkd18",
    "qworkd19",
    "qworkd2",
    "qworkd20",
    "qworkd21",
    "qworkd3",
    "qworkd4",
    "qworkd5",
    "qworkd6",
    "qworkd7",
    "qworkd8",
    "qworkd9"
  )],
    qworkd = .replace_labels(
    standardized_value_labels$qworkd,
    `-1` = "na, asked"
  ),
    qworkd1 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd10 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd11 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd12 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd13 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd14 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd15 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd16 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd17 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd18 = .replace_labels(
    standardized_value_labels$qworkd18,
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked"
  ),
    qworkd19 = .replace_labels(
    standardized_value_labels$qworkd19,
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked"
  ),
    qworkd2 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd20 = .replace_labels(
    standardized_value_labels$qworkd20,
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked"
  ),
    qworkd21 = .replace_labels(
    standardized_value_labels$qworkd21,
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked"
  ),
    qworkd3 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd4 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd5 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd6 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd7 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd8 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd9 = c(
    `-2` = "na, see JQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "qworkd",
    "qworkd1",
    "qworkd10",
    "qworkd11",
    "qworkd12",
    "qworkd13",
    "qworkd14",
    "qworkd15",
    "qworkd16",
    "qworkd17",
    "qworkd18",
    "qworkd19",
    "qworkd2",
    "qworkd20",
    "qworkd21",
    "qworkd3",
    "qworkd4",
    "qworkd5",
    "qworkd6",
    "qworkd7",
    "qworkd8",
    "qworkd9"
  )],
    qworkd = .replace_labels(
    standardized_value_labels$qworkd,
    `-1` = "na, asked"
  ),
    qworkd1 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd10 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd11 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd12 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd13 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd14 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd15 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd16 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd17 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd18 = .replace_labels(
    standardized_value_labels$qworkd18,
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked"
  ),
    qworkd19 = .replace_labels(
    standardized_value_labels$qworkd19,
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked"
  ),
    qworkd2 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd20 = .replace_labels(
    standardized_value_labels$qworkd20,
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked"
  ),
    qworkd21 = .replace_labels(
    standardized_value_labels$qworkd21,
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked"
  ),
    qworkd3 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd4 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd5 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd6 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd7 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd8 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  ),
    qworkd9 = c(
    `-2` = "na, see KQWORKD",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "all the time"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

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

.lasa_fc_106 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "106", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "106", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "106", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "106", waves = .lasa_wave_rows())
)
