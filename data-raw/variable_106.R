## LASA filecode 106 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
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

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `3B` = c(
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
  ),
  `MB` = c(
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
  ),
  `I` = c(
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
  ),
  `J` = c(
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
  ),
  `K` = c(
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
  )
)

variable_labels_list <- list(
  Wave_3B_labels = harmonized_labels,
  Wave_MB_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "never",
  `2` = "sometimes",
  `3` = "often",
  `4` = "all the time",
  `5` = "not applicable"
)

standardized_value_labels <- list(
  qworkd = c(
    default_missing_labels[c("-1")],
    `1` = "never had a job",
    `2` = "has/had a job"
  ),
  qworkd1 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd10 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd11 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd12 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd13 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd14 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd15 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd16 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd17 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd18 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd19 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd2 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd20 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd21 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd3 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd4 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd5 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd6 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd7 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd8 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkd9 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qworkn1 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkn10 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkn11 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkn12 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkn13 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkn2 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkn3 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkn4 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkn5 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkn6 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkn7 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkn8 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkn9 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkp1 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkp10 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkp11 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkp12 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkp13 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkp2 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkp3 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkp4 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkp5 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkp6 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkp7 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkp8 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkp9 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qworkyn = c(
    default_missing_labels[c("-1")],
    `1` = "never had a job",
    `2` = "had a job",
    `3` = "has a job"
  )
)

value_labels_list <- list(
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
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
    standardized_value_labels,
    qworkn1 = .replace_labels(
    standardized_value_labels$qworkn1,
    `-2` = "na, see BQWORKYN"
  ),
    qworkn10 = .replace_labels(
    standardized_value_labels$qworkn10,
    `-2` = "na, see BQWORKYN"
  ),
    qworkn11 = .replace_labels(
    standardized_value_labels$qworkn11,
    `-2` = "na, see BQWORKYN"
  ),
    qworkn12 = .replace_labels(
    standardized_value_labels$qworkn12,
    `-2` = "na, see BQWORKYN"
  ),
    qworkn13 = .replace_labels(
    standardized_value_labels$qworkn13,
    `-2` = "na, see BQWORKYN"
  ),
    qworkn2 = .replace_labels(
    standardized_value_labels$qworkn2,
    `-2` = "na, see BQWORKYN"
  ),
    qworkn3 = .replace_labels(
    standardized_value_labels$qworkn3,
    `-2` = "na, see BQWORKYN"
  ),
    qworkn4 = .replace_labels(
    standardized_value_labels$qworkn4,
    `-2` = "na, see BQWORKYN"
  ),
    qworkn5 = .replace_labels(
    standardized_value_labels$qworkn5,
    `-2` = "na, see BQWORKYN"
  ),
    qworkn6 = .replace_labels(
    standardized_value_labels$qworkn6,
    `-2` = "na, see BQWORKYN"
  ),
    qworkn7 = .replace_labels(
    standardized_value_labels$qworkn7,
    `-2` = "na, see BQWORKYN"
  ),
    qworkn8 = .replace_labels(
    standardized_value_labels$qworkn8,
    `-2` = "na, see BQWORKYN"
  ),
    qworkn9 = .replace_labels(
    standardized_value_labels$qworkn9,
    `-2` = "na, see BQWORKYN"
  ),
    qworkp1 = .replace_labels(
    standardized_value_labels$qworkp1,
    `-2` = "na, see BQWORKYN"
  ),
    qworkp10 = .replace_labels(
    standardized_value_labels$qworkp10,
    `-2` = "na, see BQWORKYN"
  ),
    qworkp11 = .replace_labels(
    standardized_value_labels$qworkp11,
    `-2` = "na, see BQWORKYN"
  ),
    qworkp12 = .replace_labels(
    standardized_value_labels$qworkp12,
    `-2` = "na, see BQWORKYN"
  ),
    qworkp13 = .replace_labels(
    standardized_value_labels$qworkp13,
    `-2` = "na, see BQWORKYN"
  ),
    qworkp2 = .replace_labels(
    standardized_value_labels$qworkp2,
    `-2` = "na, see BQWORKYN"
  ),
    qworkp3 = .replace_labels(
    standardized_value_labels$qworkp3,
    `-2` = "na, see BQWORKYN"
  ),
    qworkp4 = .replace_labels(
    standardized_value_labels$qworkp4,
    `-2` = "na, see BQWORKYN"
  ),
    qworkp5 = .replace_labels(
    standardized_value_labels$qworkp5,
    `-2` = "na, see BQWORKYN"
  ),
    qworkp6 = .replace_labels(
    standardized_value_labels$qworkp6,
    `-2` = "na, see BQWORKYN"
  ),
    qworkp7 = .replace_labels(
    standardized_value_labels$qworkp7,
    `-2` = "na, see BQWORKYN"
  ),
    qworkp8 = .replace_labels(
    standardized_value_labels$qworkp8,
    `-2` = "na, see BQWORKYN"
  ),
    qworkp9 = .replace_labels(
    standardized_value_labels$qworkp9,
    `-2` = "na, see BQWORKYN"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    qworkd1 = .replace_labels(
    standardized_value_labels$qworkd1,
    `-2` = "na, see IQWORKD"
  ),
    qworkd10 = .replace_labels(
    standardized_value_labels$qworkd10,
    `-2` = "na, see IQWORKD"
  ),
    qworkd11 = .replace_labels(
    standardized_value_labels$qworkd11,
    `-2` = "na, see IQWORKD"
  ),
    qworkd12 = .replace_labels(
    standardized_value_labels$qworkd12,
    `-2` = "na, see IQWORKD"
  ),
    qworkd13 = .replace_labels(
    standardized_value_labels$qworkd13,
    `-2` = "na, see IQWORKD"
  ),
    qworkd14 = .replace_labels(
    standardized_value_labels$qworkd14,
    `-2` = "na, see IQWORKD"
  ),
    qworkd15 = .replace_labels(
    standardized_value_labels$qworkd15,
    `-2` = "na, see IQWORKD"
  ),
    qworkd16 = .replace_labels(
    standardized_value_labels$qworkd16,
    `-2` = "na, see IQWORKD"
  ),
    qworkd17 = .replace_labels(
    standardized_value_labels$qworkd17,
    `-2` = "na, see IQWORKD"
  ),
    qworkd18 = .replace_labels(
    standardized_value_labels$qworkd18,
    `-2` = "na, see IQWORKD"
  ),
    qworkd19 = .replace_labels(
    standardized_value_labels$qworkd19,
    `-2` = "na, see IQWORKD"
  ),
    qworkd2 = .replace_labels(
    standardized_value_labels$qworkd2,
    `-2` = "na, see IQWORKD"
  ),
    qworkd20 = .replace_labels(
    standardized_value_labels$qworkd20,
    `-2` = "na, see IQWORKD"
  ),
    qworkd21 = .replace_labels(
    standardized_value_labels$qworkd21,
    `-2` = "na, see IQWORKD"
  ),
    qworkd3 = .replace_labels(
    standardized_value_labels$qworkd3,
    `-2` = "na, see IQWORKD"
  ),
    qworkd4 = .replace_labels(
    standardized_value_labels$qworkd4,
    `-2` = "na, see IQWORKD"
  ),
    qworkd5 = .replace_labels(
    standardized_value_labels$qworkd5,
    `-2` = "na, see IQWORKD"
  ),
    qworkd6 = .replace_labels(
    standardized_value_labels$qworkd6,
    `-2` = "na, see IQWORKD"
  ),
    qworkd7 = .replace_labels(
    standardized_value_labels$qworkd7,
    `-2` = "na, see IQWORKD"
  ),
    qworkd8 = .replace_labels(
    standardized_value_labels$qworkd8,
    `-2` = "na, see IQWORKD"
  ),
    qworkd9 = .replace_labels(
    standardized_value_labels$qworkd9,
    `-2` = "na, see IQWORKD"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
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
    `-2` = "na, see JQWORKD"
  ),
    qworkd19 = .replace_labels(
    standardized_value_labels$qworkd19,
    `-2` = "na, see JQWORKD"
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
    `-2` = "na, see JQWORKD"
  ),
    qworkd21 = .replace_labels(
    standardized_value_labels$qworkd21,
    `-2` = "na, see JQWORKD"
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
    standardized_value_labels,
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
    `-2` = "na, see KQWORKD"
  ),
    qworkd19 = .replace_labels(
    standardized_value_labels$qworkd19,
    `-2` = "na, see KQWORKD"
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
    `-2` = "na, see KQWORKD"
  ),
    qworkd21 = .replace_labels(
    standardized_value_labels$qworkd21,
    `-2` = "na, see KQWORKD"
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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "106", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "106", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "106", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "106", waves = .lasa_wave_rows())
)

.lasa_fc_106 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

