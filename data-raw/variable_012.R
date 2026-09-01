## LASA filecode 012 -- variable names, variable labels, value labels,
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
  bird = "categorical",
  cat = "categorical",
  dog = "categorical",
  nspecie = "numeric",
  petothe = "categorical",
  pets = "categorical",
  petsoth = "categorical"
)

# define variable labels ----
variable_labels(
  bird = "Pets: bird (s)",
  cat = "Pets: cat (s)",
  dog = "Pets: dog(s)",
  nspecie = "Pets: number of species",
  petothe = "Pets: other",
  pets = "Do you have pets",
  petsoth = "Pets: Other",
  .applies_to_waves = c("Z")
)

variable_labels(
  bird = "pets: Bird(s)",
  cat = "pets: Cat(s)",
  dog = "pets: Dog(s)",
  nspecie = "pets: Number of species",
  pets = "Do you have pets?",
  .applies_to_waves = c("B", "C", "D", "E")
)

variable_labels(
  petsoth = "pets: Other",
  .applies_to_waves = c("B")
)

variable_labels(
  petothe = "pets: Other",
  .applies_to_waves = c("C", "D", "E")
)

variable_labels(
  bird = "pets: bird (s)",
  cat = "pets: cat (s)",
  dog = "pets: dog(s)",
  nspecie = "pets: number of species",
  petothe = "pets: other",
  pets = "do you have pets?",
  .applies_to_waves = c("2B", "F", "G", "H", "3B", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("pets"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("bird", "cat", "dog", "petothe", "petsoth"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("nspecie"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-2` = "not available, interview terminated", `0` = "no", `1` = "yes",
  .applies_to_vars = c("pets"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see BPETS", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("bird", "cat", "dog"),
  .applies_to_waves = c("B", "2B")
)

value_labels(
  `-2` = "na, see BPETS",
  .applies_to_vars = c("nspecie"),
  .applies_to_waves = c("B", "2B")
)

value_labels(
  `-4` = "na, short version", `0` = "no", `1` = "yes",
  .applies_to_vars = c("pets"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPETS", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("petsoth"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see CPETS", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("bird", "cat", "dog", "petothe"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CPETS",
  .applies_to_vars = c("nspecie"),
  .applies_to_waves = c("C")
)

value_labels(
  `0` = "no", `1` = "yes",
  .applies_to_vars = c("pets"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see D/EPETS",
  .applies_to_vars = c("bird", "cat", "dog", "nspecie", "petothe"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("bird", "cat", "dog", "petothe"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see BPETS", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("petothe"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, interview terminated", `0` = "no", `1` = "yes",
  .applies_to_vars = c("pets"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see F/G/H/B/I/JPTS",
  .applies_to_vars = c("bird", "cat", "dog", "nspecie", "petothe"),
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J", "K")
)

.lasa_fc_012 <- .lasa_finalize_fc("012")

