## LASA filecode 126 -- variable names, variable labels, value labels,
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
  qorh1 = "categorical",
  qorh2a = "categorical",
  qorh2b = "categorical",
  qorh3 = "categorical",
  qorh3a = "categorical",
  qorh3b = "categorical",
  qorh3c = "categorical",
  qorh3d = "categorical",
  qorh4 = "categorical",
  qorh5a = "categorical",
  qorh5b = "categorical",
  qorh5c = "categorical",
  qorh6a = "categorical",
  qorh6b = "categorical",
  qorh7 = "categorical",
  qorh8a = "categorical",
  qorh8b = "categorical",
  qorh8c = "categorical",
  qorh8d = "categorical",
  qorh8e = "categorical",
  qorh8f = "categorical",
  qorh8g = "categorical",
  qorh8h = "categorical",
  qorh8i = "categorical"
)

# define variable labels ----
variable_labels(
  qorh1 = "Oral health 1: general self evaluation",
  qorh2a = "Oral health 2A: number of own teeth and molars upper jaw",
  qorh2b = "Oral health 2B: number of own teeth and molars lower jaw",
  qorh3 = "Oral health 3: wearing dentures",
  qorh3a = "Oral health 3A: wearing dentures upper jaw",
  qorh3b = "Oral health 3B: wearing dentures lower jaw",
  qorh3c = "Oral health 3C: when wearing dentures",
  qorh3d = "Oral health 3D: past half year: dentures did not fit properly",
  qorh4 = "Oral health 4: how often brushing teeth",
  qorh5a = "Oral health 5A: use of dental floss",
  qorh5b = "Oral health 5B: use of dental sticks",
  qorh5c = "Oral health 5C: use of interdental brushes",
  qorh6a = "Oral health 6A: past 2 years dental check",
  qorh6b = "Oral health 6B: past 2 years dental cleaning",
  qorh7 = "Oral health 7: past 2 years gum inflammation (gingivitis)",
  qorh8a = "Oral health 8A: past half year: cavities",
  qorh8b = "Oral health 8B: past half year: bleeding gums",
  qorh8c = "Oral health 8C: past half year: red or swollen gums",
  qorh8d = "Oral health 8D: past half year: blisters or sores in the mouth",
  qorh8e = "Oral health 8E: past half year: toothache caused by hot/cold drinks",
  qorh8f = "Oral health 8F: past half year: toothache when chewing",
  qorh8g = "Oral health 8G: past half year: loose, broken teeth",
  qorh8h = "Oral health 8H: past half year: bad breath (halitosis)",
  qorh8i = "Oral health 8I: past half year: dry mouth",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qorh2a", "qorh2b", "qorh7", "qorh8f", "qorh8i",
  .applies_to_waves = c("I", "J", "K")
)

variable_labels(
  "qorh3a", "qorh3b", "qorh3c", "qorh4", "qorh5a", "qorh5b", "qorh5c", "qorh6a", "qorh6b", "qorh8a", "qorh8b", "qorh8c", "qorh8d", "qorh8e", "qorh8g", "qorh8h",
  .applies_to_waves = c("I")
)

variable_labels(
  "qorh1", "qorh3", "qorh3d",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  qorh1 = "Oral health 1: general self-evaluation",
  .applies_to_waves = c("I")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qorh1", "qorh2a", "qorh2b", "qorh3", "qorh3a", "qorh3b", "qorh3c", "qorh3d", "qorh4", "qorh5a", "qorh5b", "qorh5c", "qorh6a", "qorh6b", "qorh7", "qorh8a", "qorh8b", "qorh8c", "qorh8d", "qorh8e", "qorh8f", "qorh8g", "qorh8h", "qorh8i"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "very unhealthy", `2` = "unhealthy", `3` = "not unhealthy/healthy", `4` = "healthy", `5` = "very healthy",
  .applies_to_vars = c("qorh1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "none", `2` = "1-7", `3` = "more than 7",
  .applies_to_vars = c("qorh2a", "qorh2b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes", `2` = "no",
  .applies_to_vars = c("qorh3", "qorh7", "qorh8a", "qorh8b", "qorh8c", "qorh8d", "qorh8e", "qorh8g", "qorh8h"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes, complete dentures", `2` = "yes, partial dentures", `3` = "no",
  .applies_to_vars = c("qorh3a", "qorh3b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `1` = "day and night", `2` = "always during the day", `3` = "occasionally",
  .applies_to_vars = c("qorh3c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `1` = "never", `2` = "rarely", `3` = "occasionally", `4` = "rather often", `5` = "very often",
  .applies_to_vars = c("qorh3d"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "never", `2` = "sometimes, not every day", `3` = "once a day", `4` = "twice a day", `5` = "more than twice a day",
  .applies_to_vars = c("qorh4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "never", `2` = "1-3 times a month", `3` = "1-3 times a week", `4` = "more than 3 times a week",
  .applies_to_vars = c("qorh5a", "qorh5b", "qorh5c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "never", `2` = "1-2 times", `3` = "3 times or more",
  .applies_to_vars = c("qorh6a", "qorh6b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "label varies by wave", `2` = "label varies by wave", `3` = "occasionally", `4` = "rather often", `5` = "very often",
  .applies_to_vars = c("qorh8f", "qorh8i"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer", `1` = "very unhealthy", `2` = "unhealthy", `3` = "not unhealthy/healthy", `4` = "healthy", `5` = "very healthy",
  .applies_to_vars = c("qorh1"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-1` = "no answer", `1` = "none", `2` = "1-7", `3` = "more than 7",
  .applies_to_vars = c("qorh2a", "qorh2b"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-1` = "no answer", `1` = "yes, complete dentures", `2` = "yes, partial dentures", `3` = "no",
  .applies_to_vars = c("qorh3a", "qorh3b"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IQORH3A & IQORH3B", `-1` = "no answer", `1` = "day and night", `2` = "always during the day", `3` = "occasionally",
  .applies_to_vars = c("qorh3c"),
  .applies_to_waves = c("I")
)

value_labels(
  `-1` = "no answer", `1` = "never", `2` = "sometimes, not every day", `3` = "once a day", `4` = "twice a day", `5` = "more than twice a day",
  .applies_to_vars = c("qorh4"),
  .applies_to_waves = c("I")
)

value_labels(
  `-1` = "no answer", `1` = "never", `2` = "1-3 times a month", `3` = "1-3 times a week", `4` = "more than 3 times a week",
  .applies_to_vars = c("qorh5a", "qorh5b", "qorh5c"),
  .applies_to_waves = c("I")
)

value_labels(
  `-1` = "no answer", `1` = "never", `2` = "1-2 times", `3` = "3 times or more",
  .applies_to_vars = c("qorh6a", "qorh6b"),
  .applies_to_waves = c("I")
)

value_labels(
  `-1` = "no answer", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qorh7"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-1` = "no answer", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qorh8a", "qorh8b", "qorh8c", "qorh8d", "qorh8e", "qorh8f", "qorh8g", "qorh8h", "qorh8i"),
  .applies_to_waves = c("I")
)

value_labels(
  `-1` = "no answer", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qorh3"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-2` = "na, see J/KQORH3", `-1` = "no answer", `1` = "never", `2` = "rarely", `3` = "occasionally", `4` = "rather often", `5` = "very often",
  .applies_to_vars = c("qorh3d"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-1` = "no answer", `1` = "never", `2` = "rarely", `3` = "occasionally", `4` = "rather often", `5` = "very often",
  .applies_to_vars = c("qorh8f", "qorh8i"),
  .applies_to_waves = c("J", "K")
)

.lasa_fc_126 <- .lasa_finalize_fc("126")

