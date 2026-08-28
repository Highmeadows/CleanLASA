## LASA filecode 012 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
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

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "bird",
    "cat",
    "dog",
    "nspecie",
    "pets",
    "petsoth"
  ),
  `C` = c(
    "bird",
    "cat",
    "dog",
    "nspecie",
    "petothe",
    "pets"
  ),
  `D` = c(
    "bird",
    "cat",
    "dog",
    "nspecie",
    "petothe",
    "pets"
  ),
  `E` = c(
    "bird",
    "cat",
    "dog",
    "nspecie",
    "petothe",
    "pets"
  ),
  `2B` = c(
    "bird",
    "cat",
    "dog",
    "nspecie",
    "petothe",
    "pets"
  ),
  `F` = c(
    "bird",
    "cat",
    "dog",
    "nspecie",
    "petothe",
    "pets"
  ),
  `G` = c(
    "bird",
    "cat",
    "dog",
    "nspecie",
    "petothe",
    "pets"
  ),
  `H` = c(
    "bird",
    "cat",
    "dog",
    "nspecie",
    "petothe",
    "pets"
  ),
  `3B` = c(
    "bird",
    "cat",
    "dog",
    "nspecie",
    "petothe",
    "pets"
  ),
  `I` = c(
    "bird",
    "cat",
    "dog",
    "nspecie",
    "petothe",
    "pets"
  ),
  `J` = c(
    "bird",
    "cat",
    "dog",
    "nspecie",
    "petothe",
    "pets"
  ),
  `K` = c(
    "bird",
    "cat",
    "dog",
    "nspecie",
    "petothe",
    "pets"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    bird = "pets: Bird(s)",
    cat = "pets: Cat(s)",
    dog = "pets: Dog(s)",
    nspecie = "pets: Number of species",
    pets = "Do you have pets?",
    petsoth = "pets: Other"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    bird = "pets: Bird(s)",
    cat = "pets: Cat(s)",
    dog = "pets: Dog(s)",
    nspecie = "pets: Number of species",
    petothe = "pets: Other",
    pets = "Do you have pets?"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    bird = "pets: Bird(s)",
    cat = "pets: Cat(s)",
    dog = "pets: Dog(s)",
    nspecie = "pets: Number of species",
    petothe = "pets: Other",
    pets = "Do you have pets?"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    bird = "pets: Bird(s)",
    cat = "pets: Cat(s)",
    dog = "pets: Dog(s)",
    nspecie = "pets: Number of species",
    petothe = "pets: Other",
    pets = "Do you have pets?"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    bird = "pets: bird (s)",
    cat = "pets: cat (s)",
    dog = "pets: dog(s)",
    nspecie = "pets: number of species",
    petothe = "pets: other",
    pets = "do you have pets?"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
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
  bird = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  cat = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  dog = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  nspecie = c(
    default_missing_labels[c("-2")]
  ),
  petothe = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  pets = c(
    default_missing_labels[c("-4", "-1")],
    `-2` = "not available, interview terminated",
    `0` = "no",
    `1` = "yes"
  ),
  petsoth = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    `1` = "mentioned"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
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
    standardized_value_labels,
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
    standardized_value_labels,
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
    standardized_value_labels,
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
    standardized_value_labels,
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
    standardized_value_labels,
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
    standardized_value_labels,
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
    standardized_value_labels,
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
    standardized_value_labels,
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
    standardized_value_labels,
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
    standardized_value_labels,
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
    standardized_value_labels,
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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "012", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "012", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "012", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "012", waves = .lasa_wave_rows())
)

.lasa_fc_012 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

