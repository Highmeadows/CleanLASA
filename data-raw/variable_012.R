## LASA filecode 012 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  bird = "Pets: bird (s)",
  cat = "Pets: cat (s)",
  dog = "Pets: dog(s)",
  nspecie = "Pets: number of species",
  petothe = "Pets: other",
  pets = "Do you have pets",
  petsoth = "Pets: Other"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("bird", "cat", "dog", "nspecie", "pets", "petsoth")],
    bird = "pets: Bird(s)",
    cat = "pets: Cat(s)",
    dog = "pets: Dog(s)",
    nspecie = "pets: Number of species",
    pets = "Do you have pets?",
    petsoth = "pets: Other"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = "pets: Bird(s)",
    cat = "pets: Cat(s)",
    dog = "pets: Dog(s)",
    nspecie = "pets: Number of species",
    petothe = "pets: Other",
    pets = "Do you have pets?"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = "pets: Bird(s)",
    cat = "pets: Cat(s)",
    dog = "pets: Dog(s)",
    nspecie = "pets: Number of species",
    petothe = "pets: Other",
    pets = "Do you have pets?"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = "pets: Bird(s)",
    cat = "pets: Cat(s)",
    dog = "pets: Dog(s)",
    nspecie = "pets: Number of species",
    petothe = "pets: Other",
    pets = "Do you have pets?"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  bird = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  cat = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  dog = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  nspecie = c(`-2` = "not available, routing"),
  petothe = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  pets = c(
    `-4` = "not available, short version",
    `-2` = "not available, interview terminated",
    `-1` = "not available, asked",
    `0` = "no",
    `1` = "yes"
  ),
  petsoth = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("bird", "cat", "dog", "nspecie", "pets", "petsoth")],
    bird = .replace_labels(
    standardized_value_labels$bird,
    `-2` = "na, see BPETS"
  ),
    cat = .replace_labels(
    standardized_value_labels$cat,
    `-2` = "na, see BPETS"
  ),
    dog = .replace_labels(
    standardized_value_labels$dog,
    `-2` = "na, see BPETS"
  ),
    nspecie = .replace_labels(
    standardized_value_labels$nspecie,
    `-2` = "na, see BPETS"
  ),
    pets = c(`-4` = "na, short version", `0` = "no", `1` = "yes"),
    petsoth = .replace_labels(
    standardized_value_labels$petsoth,
    `-2` = "na, see BPETS"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = .replace_labels(
    standardized_value_labels$bird,
    `-2` = "na, see CPETS"
  ),
    cat = .replace_labels(
    standardized_value_labels$cat,
    `-2` = "na, see CPETS"
  ),
    dog = .replace_labels(
    standardized_value_labels$dog,
    `-2` = "na, see CPETS"
  ),
    nspecie = .replace_labels(
    standardized_value_labels$nspecie,
    `-2` = "na, see CPETS"
  ),
    petothe = .replace_labels(
    standardized_value_labels$petothe,
    `-2` = "na, see CPETS"
  ),
    pets = c(`0` = "no", `1` = "yes")
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = .replace_labels(
    standardized_value_labels$bird,
    `-2` = "na, see D/EPETS"
  ),
    cat = .replace_labels(
    standardized_value_labels$cat,
    `-2` = "na, see D/EPETS"
  ),
    dog = .replace_labels(
    standardized_value_labels$dog,
    `-2` = "na, see D/EPETS"
  ),
    nspecie = .replace_labels(
    standardized_value_labels$nspecie,
    `-2` = "na, see D/EPETS"
  ),
    petothe = .replace_labels(
    standardized_value_labels$petothe,
    `-2` = "na, see D/EPETS"
  ),
    pets = c(`-1` = "na, asked", `0` = "no", `1` = "yes")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = .replace_labels(
    standardized_value_labels$bird,
    `-2` = "na, see D/EPETS"
  ),
    cat = .replace_labels(
    standardized_value_labels$cat,
    `-2` = "na, see D/EPETS"
  ),
    dog = .replace_labels(
    standardized_value_labels$dog,
    `-2` = "na, see D/EPETS"
  ),
    nspecie = .replace_labels(
    standardized_value_labels$nspecie,
    `-2` = "na, see D/EPETS"
  ),
    petothe = .replace_labels(
    standardized_value_labels$petothe,
    `-2` = "na, see D/EPETS"
  ),
    pets = c(`-1` = "na, asked", `0` = "no", `1` = "yes")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = .replace_labels(
    standardized_value_labels$bird,
    `-2` = "na, see BPETS"
  ),
    cat = .replace_labels(
    standardized_value_labels$cat,
    `-2` = "na, see BPETS"
  ),
    dog = .replace_labels(
    standardized_value_labels$dog,
    `-2` = "na, see BPETS"
  ),
    nspecie = .replace_labels(
    standardized_value_labels$nspecie,
    `-2` = "na, see BPETS"
  ),
    petothe = .replace_labels(
    standardized_value_labels$petothe,
    `-2` = "na, see BPETS"
  ),
    pets = c(`-2` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes")
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = .replace_labels(
    standardized_value_labels$bird,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    cat = .replace_labels(
    standardized_value_labels$cat,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    dog = .replace_labels(
    standardized_value_labels$dog,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    nspecie = .replace_labels(
    standardized_value_labels$nspecie,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    petothe = .replace_labels(
    standardized_value_labels$petothe,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    pets = c(`-1` = "na, asked", `0` = "no", `1` = "yes")
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = .replace_labels(
    standardized_value_labels$bird,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    cat = .replace_labels(
    standardized_value_labels$cat,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    dog = .replace_labels(
    standardized_value_labels$dog,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    nspecie = .replace_labels(
    standardized_value_labels$nspecie,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    petothe = .replace_labels(
    standardized_value_labels$petothe,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    pets = c(`-1` = "na, asked", `0` = "no", `1` = "yes")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = .replace_labels(
    standardized_value_labels$bird,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    cat = .replace_labels(
    standardized_value_labels$cat,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    dog = .replace_labels(
    standardized_value_labels$dog,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    nspecie = .replace_labels(
    standardized_value_labels$nspecie,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    petothe = .replace_labels(
    standardized_value_labels$petothe,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    pets = c(`-1` = "na, asked", `0` = "no", `1` = "yes")
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = .replace_labels(
    standardized_value_labels$bird,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    cat = .replace_labels(
    standardized_value_labels$cat,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    dog = .replace_labels(
    standardized_value_labels$dog,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    nspecie = .replace_labels(
    standardized_value_labels$nspecie,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    petothe = .replace_labels(
    standardized_value_labels$petothe,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    pets = c(`-1` = "na, asked", `0` = "no", `1` = "yes")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = .replace_labels(
    standardized_value_labels$bird,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    cat = .replace_labels(
    standardized_value_labels$cat,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    dog = .replace_labels(
    standardized_value_labels$dog,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    nspecie = .replace_labels(
    standardized_value_labels$nspecie,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    petothe = .replace_labels(
    standardized_value_labels$petothe,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    pets = c(`-1` = "na, asked", `0` = "no", `1` = "yes")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = .replace_labels(
    standardized_value_labels$bird,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    cat = .replace_labels(
    standardized_value_labels$cat,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    dog = .replace_labels(
    standardized_value_labels$dog,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    nspecie = .replace_labels(
    standardized_value_labels$nspecie,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    petothe = .replace_labels(
    standardized_value_labels$petothe,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    pets = c(`-1` = "na, asked", `0` = "no", `1` = "yes")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c("bird", "cat", "dog", "nspecie", "petothe", "pets")],
    bird = .replace_labels(
    standardized_value_labels$bird,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    cat = .replace_labels(
    standardized_value_labels$cat,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    dog = .replace_labels(
    standardized_value_labels$dog,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    nspecie = .replace_labels(
    standardized_value_labels$nspecie,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    petothe = .replace_labels(
    standardized_value_labels$petothe,
    `-2` = "na, see F/G/H/B/I/JPTS"
  ),
    pets = c(`-1` = "na, asked", `0` = "no", `1` = "yes")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  bird = "categorical",
  cat = "categorical",
  dog = "categorical",
  nspecie = "numeric",
  petothe = "categorical",
  pets = "categorical",
  petsoth = "categorical"
)

.lasa_fc_012 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "012", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "012", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "012", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "012", waves = .lasa_wave_rows())
)
