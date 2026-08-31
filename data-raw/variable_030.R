## LASA filecode 030 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  adl1a = "Stairs: 15 steps without stopping",
  adl1b = "Stairs: using aid",
  adl1c = "Stairs: help from someone",
  adl1d = "Stairs: R receive help",
  adl1e = "Stairs: less than wanted",
  adl2a = "(Un)dress: self",
  adl2b = "(Un)dress: using aid",
  adl2c = "(Un)dress: help from someone",
  adl2d = "(Un)dress: R receive help",
  adl2e = "(Un)dress: less than wanted",
  adl3a = "Chair: sit and rise from",
  adl3b = "Chair: using aid",
  adl3c = "Chair: help from someone",
  adl3d = "Chair: R receive help",
  adl3e = "Chair: less than wanted",
  adl4a = "Toenails: cutting own",
  adl4b = "Toenails: using aid",
  adl4c = "Toenails: help from someone",
  adl4d = "Toenails: R receive help",
  adl4e = "Toenails: less than wanted",
  adl5a = "Walking: 5 min. outside the house",
  adl5b = "Walking: using aid",
  adl5c = "Walking: help from someone",
  adl5d = "Walking: R receive help",
  adl5e = "Walking: less than wanted",
  adl6a = "Transport: use of own or public",
  adl6b = "Transport: using aid",
  adl6c = "Transport: help from someone",
  adl6d = "Transport: R receive help",
  adl6e = "Transport: less than wanted",
  adl7a = "Take a bath/shower: self",
  adl7b = "Take a bath/shower: using aid",
  adl7c = "Take a bath/shower: help from someone",
  adl7d = "Take a bath/shower: R receive help",
  adl7e = "Take a bath/shower: less than wanted"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "adl1a",
    "adl1b",
    "adl1c",
    "adl1d",
    "adl4a",
    "adl4b",
    "adl4c",
    "adl4d",
    "adl6a",
    "adl6b",
    "adl6c",
    "adl6d"
  ),
  `C` = c(
    "adl1a",
    "adl1b",
    "adl1c",
    "adl1d",
    "adl1e",
    "adl2a",
    "adl2b",
    "adl2c",
    "adl2d",
    "adl2e",
    "adl3a",
    "adl3b",
    "adl3c",
    "adl3d",
    "adl3e",
    "adl4a",
    "adl4b",
    "adl4c",
    "adl4d",
    "adl4e",
    "adl5a",
    "adl5b",
    "adl5c",
    "adl5d",
    "adl5e",
    "adl6a",
    "adl6b",
    "adl6c",
    "adl6d",
    "adl6e"
  ),
  `D` = c(
    "adl1a",
    "adl1b",
    "adl1c",
    "adl1d",
    "adl1e",
    "adl2a",
    "adl2b",
    "adl2c",
    "adl2d",
    "adl2e",
    "adl3a",
    "adl3b",
    "adl3c",
    "adl3d",
    "adl3e",
    "adl4a",
    "adl4b",
    "adl4c",
    "adl4d",
    "adl4e",
    "adl5a",
    "adl5b",
    "adl5c",
    "adl5d",
    "adl5e",
    "adl6a",
    "adl6b",
    "adl6c",
    "adl6d",
    "adl6e"
  ),
  `E` = c(
    "adl1a",
    "adl1b",
    "adl1c",
    "adl1d",
    "adl1e",
    "adl2a",
    "adl2b",
    "adl2c",
    "adl2d",
    "adl2e",
    "adl3a",
    "adl3b",
    "adl3c",
    "adl3d",
    "adl3e",
    "adl4a",
    "adl4b",
    "adl4c",
    "adl4d",
    "adl4e",
    "adl5a",
    "adl5b",
    "adl5c",
    "adl5d",
    "adl5e",
    "adl6a",
    "adl6b",
    "adl6c",
    "adl6d",
    "adl6e"
  ),
  `2B` = c(
    "adl1a",
    "adl1b",
    "adl1c",
    "adl1d",
    "adl1e",
    "adl2a",
    "adl2b",
    "adl2c",
    "adl2d",
    "adl2e",
    "adl3a",
    "adl3b",
    "adl3c",
    "adl3d",
    "adl3e",
    "adl4a",
    "adl4b",
    "adl4c",
    "adl4d",
    "adl4e",
    "adl5a",
    "adl5b",
    "adl5c",
    "adl5d",
    "adl5e",
    "adl6a",
    "adl6b",
    "adl6c",
    "adl6d",
    "adl6e",
    "adl7a",
    "adl7b",
    "adl7c",
    "adl7d",
    "adl7e"
  ),
  `F` = c(
    "adl1a",
    "adl1b",
    "adl1c",
    "adl1d",
    "adl1e",
    "adl2a",
    "adl2b",
    "adl2c",
    "adl2d",
    "adl2e",
    "adl3a",
    "adl3b",
    "adl3c",
    "adl3d",
    "adl3e",
    "adl4a",
    "adl4b",
    "adl4c",
    "adl4d",
    "adl4e",
    "adl5a",
    "adl5b",
    "adl5c",
    "adl5d",
    "adl5e",
    "adl6a",
    "adl6b",
    "adl6c",
    "adl6d",
    "adl6e",
    "adl7a",
    "adl7b",
    "adl7c",
    "adl7d",
    "adl7e"
  ),
  `G` = c(
    "adl1a",
    "adl1b",
    "adl1c",
    "adl1d",
    "adl1e",
    "adl2a",
    "adl2b",
    "adl2c",
    "adl2d",
    "adl2e",
    "adl3a",
    "adl3b",
    "adl3c",
    "adl3d",
    "adl3e",
    "adl4a",
    "adl4b",
    "adl4c",
    "adl4d",
    "adl4e",
    "adl5a",
    "adl5b",
    "adl5c",
    "adl5d",
    "adl5e",
    "adl6a",
    "adl6b",
    "adl6c",
    "adl6d",
    "adl6e",
    "adl7a",
    "adl7b",
    "adl7c",
    "adl7d",
    "adl7e"
  ),
  `H` = c(
    "adl1a",
    "adl1b",
    "adl1c",
    "adl1d",
    "adl2a",
    "adl2b",
    "adl2c",
    "adl2d",
    "adl3a",
    "adl3b",
    "adl3c",
    "adl3d",
    "adl4a",
    "adl4b",
    "adl4c",
    "adl4d",
    "adl5a",
    "adl5b",
    "adl5c",
    "adl5d",
    "adl6a",
    "adl6b",
    "adl6c",
    "adl6d",
    "adl7a",
    "adl7b",
    "adl7c",
    "adl7d"
  ),
  `3B` = c(
    "adl1a",
    "adl1b",
    "adl1c",
    "adl1d",
    "adl2a",
    "adl2b",
    "adl2c",
    "adl2d",
    "adl3a",
    "adl3b",
    "adl3c",
    "adl3d",
    "adl4a",
    "adl4b",
    "adl4c",
    "adl4d",
    "adl5a",
    "adl5b",
    "adl5c",
    "adl5d",
    "adl6a",
    "adl6b",
    "adl6c",
    "adl6d",
    "adl7a",
    "adl7b",
    "adl7c",
    "adl7d"
  ),
  `MB` = c(
    "adl1a",
    "adl1b",
    "adl2a",
    "adl2b",
    "adl3a",
    "adl3b",
    "adl4a",
    "adl4b",
    "adl5a",
    "adl5b",
    "adl6a",
    "adl6b",
    "adl7a",
    "adl7b"
  ),
  `I` = c(
    "adl1a",
    "adl1b",
    "adl1c",
    "adl1d",
    "adl2a",
    "adl2b",
    "adl2c",
    "adl2d",
    "adl3a",
    "adl3b",
    "adl3c",
    "adl3d",
    "adl4a",
    "adl4b",
    "adl4c",
    "adl4d",
    "adl5a",
    "adl5b",
    "adl5c",
    "adl5d",
    "adl6a",
    "adl6b",
    "adl6c",
    "adl6d",
    "adl7a",
    "adl7b",
    "adl7c",
    "adl7d"
  ),
  `J` = c(
    "adl1a",
    "adl1b",
    "adl1c",
    "adl1d",
    "adl2a",
    "adl2b",
    "adl2c",
    "adl2d",
    "adl3a",
    "adl3b",
    "adl3c",
    "adl3d",
    "adl4a",
    "adl4b",
    "adl4c",
    "adl4d",
    "adl5a",
    "adl5b",
    "adl5c",
    "adl5d",
    "adl6a",
    "adl6b",
    "adl6c",
    "adl6d",
    "adl7a",
    "adl7b",
    "adl7c",
    "adl7d"
  ),
  `K` = c(
    "adl1a",
    "adl1b",
    "adl1c",
    "adl1d",
    "adl2a",
    "adl2b",
    "adl2c",
    "adl2d",
    "adl3a",
    "adl3b",
    "adl3c",
    "adl3d",
    "adl4a",
    "adl4b",
    "adl4c",
    "adl4d",
    "adl5a",
    "adl5b",
    "adl5c",
    "adl5d",
    "adl6a",
    "adl6b",
    "adl6c",
    "adl6d",
    "adl7a",
    "adl7b",
    "adl7c",
    "adl7d"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    adl1b = "Stairs: using aid (BADL1A > 1)",
    adl1c = "Stairs: help from someone (BADL1A = 3)",
    adl1d = "Stairs: R receive help (BADL1A = 2)",
    adl4b = "Toenails: using aid (BADL4A > 1)",
    adl4c = "Toenails: help from someone (BADL4A = 3)",
    adl4d = "Toenails: R receive help (BADL4A = 2)",
    adl6b = "Transport: using aid (BADL6A > 1)",
    adl6c = "Transport: help from someone (BADL6A = 3)",
    adl6d = "Transport: R receive help (BADL6A = 2)"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    adl1b = "Stairs: using aid (C/D/EADL1A > 1)",
    adl1c = "Stairs: help from someone (C/D/EADL1A > 2)",
    adl1d = "Stairs: R receive help (C/D/EADL1A = 2)",
    adl1e = "Stairs: less than wanted (C/D/EADL1A > 1)",
    adl2b = "(Un)dress: using aid (C/D/EADL2A > 1)",
    adl2c = "(Un)dress: help from someone (C/D/EADL2A > 2)",
    adl2d = "(Un)dress: R receive help (C/D/EADL2A = 2)",
    adl2e = "(Un)dress: less than wanted (C/D/EADL2A > 1)",
    adl3b = "Chair: using aid (C/D/EADL3A > 1)",
    adl3c = "Chair: help from someone (C/D/EADL3A > 2)",
    adl3d = "Chair: R receive help (C/D/EADL3A = 2)",
    adl3e = "Chair: less than wanted (C/D/EADL3A > 1)",
    adl4b = "Toenails: using aid (C/DADL4A > 1)",
    adl4c = "Toenails: help from someone (C/D/EADL4A > 2)",
    adl4d = "Toenails: R receive help (C/D/EADL4A = 2)",
    adl4e = "Toenails: less than wanted (C/D/EADL4A > 1)",
    adl5b = "Walking: using aid (C/D/EADL5A > 1)",
    adl5c = "Walking: help from someone (C/D/EADL5A > 2)",
    adl5d = "Walking: R receive help (C/D/EADL5A = 2)",
    adl5e = "Walking: less than wanted (C/D/EADL5A > 1)",
    adl6b = "Transport: using aid (C/D/EADL6A > 1)",
    adl6c = "Transport: help from someone (C/D/EADL6A > 2)",
    adl6d = "Transport: R receive help (C/D/EADL6A = 2)",
    adl6e = "Transport: less than wanted (C/D/EADL6A > 1)"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    adl1b = "Stairs: using aid (C/D/EADL1A > 1)",
    adl1c = "Stairs: help from someone (C/D/EADL1A > 2)",
    adl1d = "Stairs: R receive help (C/D/EADL1A = 2)",
    adl1e = "Stairs: less than wanted (C/D/EADL1A > 1)",
    adl2b = "(Un)dress: using aid (C/D/EADL2A > 1)",
    adl2c = "(Un)dress: help from someone (C/D/EADL2A > 2)",
    adl2d = "(Un)dress: R receive help (C/D/EADL2A = 2)",
    adl2e = "(Un)dress: less than wanted (C/D/EADL2A > 1)",
    adl3b = "Chair: using aid (C/D/EADL3A > 1)",
    adl3c = "Chair: help from someone (C/D/EADL3A > 2)",
    adl3d = "Chair: R receive help (C/D/EADL3A = 2)",
    adl3e = "Chair: less than wanted (C/D/EADL3A > 1)",
    adl4b = "Toenails: using aid (C/DADL4A > 1)",
    adl4c = "Toenails: help from someone (C/D/EADL4A > 2)",
    adl4d = "Toenails: R receive help (C/D/EADL4A = 2)",
    adl4e = "Toenails: less than wanted (C/D/EADL4A > 1)",
    adl5b = "Walking: using aid (C/D/EADL5A > 1)",
    adl5c = "Walking: help from someone (C/D/EADL5A > 2)",
    adl5d = "Walking: R receive help (C/D/EADL5A = 2)",
    adl5e = "Walking: less than wanted (C/D/EADL5A > 1)",
    adl6b = "Transport: using aid (C/D/EADL6A > 1)",
    adl6c = "Transport: help from someone (C/D/EADL6A > 2)",
    adl6d = "Transport: R receive help (C/D/EADL6A = 2)",
    adl6e = "Transport: less than wanted (C/D/EADL6A > 1)"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    adl1b = "Stairs: using aid (C/D/EADL1A > 1)",
    adl1c = "Stairs: help from someone (C/D/EADL1A > 2)",
    adl1d = "Stairs: R receive help (C/D/EADL1A = 2)",
    adl1e = "Stairs: less than wanted (C/D/EADL1A > 1)",
    adl2b = "(Un)dress: using aid (C/D/EADL2A > 1)",
    adl2c = "(Un)dress: help from someone (C/D/EADL2A > 2)",
    adl2d = "(Un)dress: R receive help (C/D/EADL2A = 2)",
    adl2e = "(Un)dress: less than wanted (C/D/EADL2A > 1)",
    adl3b = "Chair: using aid (C/D/EADL3A > 1)",
    adl3c = "Chair: help from someone (C/D/EADL3A > 2)",
    adl3d = "Chair: R receive help (C/D/EADL3A = 2)",
    adl3e = "Chair: less than wanted (C/D/EADL3A > 1)",
    adl4b = "Toenails: using aid (C/DADL4A > 1)",
    adl4c = "Toenails: help from someone (C/D/EADL4A > 2)",
    adl4d = "Toenails: R receive help (C/D/EADL4A = 2)",
    adl4e = "Toenails: less than wanted (C/D/EADL4A > 1)",
    adl5b = "Walking: using aid (C/D/EADL5A > 1)",
    adl5c = "Walking: help from someone (C/D/EADL5A > 2)",
    adl5d = "Walking: R receive help (C/D/EADL5A = 2)",
    adl5e = "Walking: less than wanted (C/D/EADL5A > 1)",
    adl6b = "Transport: using aid (C/D/EADL6A > 1)",
    adl6c = "Transport: help from someone (C/D/EADL6A > 2)",
    adl6d = "Transport: R receive help (C/D/EADL6A = 2)",
    adl6e = "Transport: less than wanted (C/D/EADL6A > 1)"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    adl1b = "Stairs: using aid (B/F/GADL1A > 1)",
    adl1c = "Stairs: help from someone (B/F/GADL1A > 2)",
    adl1d = "Stairs: R receive help (B/F/GADL1A = 2)",
    adl1e = "Stairs: less than wanted (B/F/GADL1A > 1)",
    adl2b = "(Un)dress: using aid (B/F/GADL2A > 1)",
    adl2c = "(Un)dress: help from someone (B/F/GADL2A > 2)",
    adl2d = "(Un)dress: R receive help (B/F/GADL2A = 2)",
    adl2e = "(Un)dress: less than wanted (B/F/GADL2A > 1)",
    adl3b = "Chair: using aid (B/F/GADL3A > 1)",
    adl3c = "Chair: help from someone (B/F/GADL3A > 2)",
    adl3d = "Chair: R receive help (B/F/GADL3A = 2)",
    adl3e = "Chair: less than wanted (B/F/GADL3A > 1)",
    adl4b = "Toenails: using aid (C/DADL4A > 1)",
    adl4c = "Toenails: help from someone (B/F/GADL4A > 2)",
    adl4d = "Toenails: R receive help (B/F/GADL4A = 2)",
    adl4e = "Toenails: less than wanted (B/F/GADL4A > 1)",
    adl5b = "Walking: using aid (B/F/GADL5A > 1)",
    adl5c = "Walking: help from someone (B/F/GADL5A > 2)",
    adl5d = "Walking: R receive help (B/F/GADL5A = 2)",
    adl5e = "Walking: less than wanted (B/F/GADL5A > 1)",
    adl6b = "Transport: using aid (B/F/GADL6A > 1)",
    adl6c = "Transport: help from someone (B/F/GADL6A > 2)",
    adl6d = "Transport: R receive help (B/F/GADL6A = 2)",
    adl6e = "Transport: less than wanted (B/F/GADL6A > 1)",
    adl7b = "Take a bath/shower: using aid (B/F/GADL7A > 1)",
    adl7c = "Take a bath/shower: help from someone (B/F/GADL7A > 2)",
    adl7d = "Take a bath/shower: R receive help (B/F/GADL7A = 2)",
    adl7e = "Take a bath/shower: less than wanted (B/F/GADL7A > 1)"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    adl1b = "Stairs: using aid (B/F/GADL1A > 1)",
    adl1c = "Stairs: help from someone (B/F/GADL1A > 2)",
    adl1d = "Stairs: R receive help (B/F/GADL1A = 2)",
    adl1e = "Stairs: less than wanted (B/F/GADL1A > 1)",
    adl2b = "(Un)dress: using aid (B/F/GADL2A > 1)",
    adl2c = "(Un)dress: help from someone (B/F/GADL2A > 2)",
    adl2d = "(Un)dress: R receive help (B/F/GADL2A = 2)",
    adl2e = "(Un)dress: less than wanted (B/F/GADL2A > 1)",
    adl3b = "Chair: using aid (B/F/GADL3A > 1)",
    adl3c = "Chair: help from someone (B/F/GADL3A > 2)",
    adl3d = "Chair: R receive help (B/F/GADL3A = 2)",
    adl3e = "Chair: less than wanted (B/F/GADL3A > 1)",
    adl4b = "Toenails: using aid (C/DADL4A > 1)",
    adl4c = "Toenails: help from someone (B/F/GADL4A > 2)",
    adl4d = "Toenails: R receive help (B/F/GADL4A = 2)",
    adl4e = "Toenails: less than wanted (B/F/GADL4A > 1)",
    adl5b = "Walking: using aid (B/F/GADL5A > 1)",
    adl5c = "Walking: help from someone (B/F/GADL5A > 2)",
    adl5d = "Walking: R receive help (B/F/GADL5A = 2)",
    adl5e = "Walking: less than wanted (B/F/GADL5A > 1)",
    adl6b = "Transport: using aid (B/F/GADL6A > 1)",
    adl6c = "Transport: help from someone (B/F/GADL6A > 2)",
    adl6d = "Transport: R receive help (B/F/GADL6A = 2)",
    adl6e = "Transport: less than wanted (B/F/GADL6A > 1)",
    adl7b = "Take a bath/shower: using aid (B/F/GADL7A > 1)",
    adl7c = "Take a bath/shower: help from someone (B/F/GADL7A > 2)",
    adl7d = "Take a bath/shower: R receive help (B/F/GADL7A = 2)",
    adl7e = "Take a bath/shower: less than wanted (B/F/GADL7A > 1)"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    adl1b = "Stairs: using aid (B/F/GADL1A > 1)",
    adl1c = "Stairs: help from someone (B/F/GADL1A > 2)",
    adl1d = "Stairs: R receive help (B/F/GADL1A = 2)",
    adl1e = "Stairs: less than wanted (B/F/GADL1A > 1)",
    adl2b = "(Un)dress: using aid (B/F/GADL2A > 1)",
    adl2c = "(Un)dress: help from someone (B/F/GADL2A > 2)",
    adl2d = "(Un)dress: R receive help (B/F/GADL2A = 2)",
    adl2e = "(Un)dress: less than wanted (B/F/GADL2A > 1)",
    adl3b = "Chair: using aid (B/F/GADL3A > 1)",
    adl3c = "Chair: help from someone (B/F/GADL3A > 2)",
    adl3d = "Chair: R receive help (B/F/GADL3A = 2)",
    adl3e = "Chair: less than wanted (B/F/GADL3A > 1)",
    adl4b = "Toenails: using aid (C/DADL4A > 1)",
    adl4c = "Toenails: help from someone (B/F/GADL4A > 2)",
    adl4d = "Toenails: R receive help (B/F/GADL4A = 2)",
    adl4e = "Toenails: less than wanted (B/F/GADL4A > 1)",
    adl5b = "Walking: using aid (B/F/GADL5A > 1)",
    adl5c = "Walking: help from someone (B/F/GADL5A > 2)",
    adl5d = "Walking: R receive help (B/F/GADL5A = 2)",
    adl5e = "Walking: less than wanted (B/F/GADL5A > 1)",
    adl6b = "Transport: using aid (B/F/GADL6A > 1)",
    adl6c = "Transport: help from someone (B/F/GADL6A > 2)",
    adl6d = "Transport: R receive help (B/F/GADL6A = 2)",
    adl6e = "Transport: less than wanted (B/F/GADL6A > 1)",
    adl7b = "Take a bath/shower: using aid (B/F/GADL7A > 1)",
    adl7c = "Take a bath/shower: help from someone (B/F/GADL7A > 2)",
    adl7d = "Take a bath/shower: R receive help (B/F/GADL7A = 2)",
    adl7e = "Take a bath/shower: less than wanted (B/F/GADL7A > 1)"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    adl1b = "Stairs: using aid (HADL1A > 1)",
    adl1c = "Stairs: help from someone (HADL1A > 2)",
    adl1d = "Stairs: R receive help (HADL1A = 2)",
    adl2b = "(Un)dress: using aid (HADL2A > 1)",
    adl2c = "(Un)dress: help from someone (HADL2A > 2)",
    adl2d = "(Un)dress: R receive help (HADL2A = 2)",
    adl3b = "Chair: using aid (HADL3A > 1)",
    adl3c = "Chair: help from someone (HADL3A > 2)",
    adl3d = "Chair: R receive help (HADL3A = 2)",
    adl4b = "Toenails: using aid (C/DADL4A > 1)",
    adl4c = "Toenails: help from someone (HADL4A > 2)",
    adl4d = "Toenails: R receive help (HADL4A = 2)",
    adl5b = "Walking: using aid (HADL5A > 1)",
    adl5c = "Walking: help from someone (HADL5A > 2)",
    adl5d = "Walking: R receive help (HADL5A = 2)",
    adl6b = "Transport: using aid (HADL6A > 1)",
    adl6c = "Transport: help from someone (HADL6A > 2)",
    adl6d = "Transport: R receive help (HADL6A = 2)",
    adl7b = "Take a bath/shower: using aid (HADL7A > 1)",
    adl7c = "Take a bath/shower: help from someone (HADL7A > 2)",
    adl7d = "Take a bath/shower: R receive help (HADL7A = 2)"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    adl1b = "Stairs: using aid (B/I/J/KADL1A > 1)",
    adl1c = "Stairs: help from someone (B/I/J/KADL1A > 2)",
    adl1d = "Stairs: R receive help (B/I/J/KADL1A = 2)",
    adl2b = "(Un)dress: using aid (B/I/J/KADL2A > 1)",
    adl2c = "(Un)dress: help from someone (B/I/J/KADL2A > 2)",
    adl2d = "(Un)dress: R receive help (B/I/J/KADL2A = 2)",
    adl3b = "Chair: using aid (B/I/J/KADL3A > 1)",
    adl3c = "Chair: help from someone (B/I/J/KADL3A > 2)",
    adl3d = "Chair: R receive help (B/I/J/KADL3A = 2)",
    adl4b = "Toenails: using aid (B/I/J/KADL4A > 1)",
    adl4c = "Toenails: help from someone (B/I/J/KADL4A > 2)",
    adl4d = "Toenails: R receive help (B/I/J/KADL4A = 2)",
    adl5b = "Walking: using aid (B/I/J/KADL5A > 1)",
    adl5c = "Walking: help from someone (B/I/J/KADL5A > 2)",
    adl5d = "Walking: R receive help (B/I/J/KADL5A = 2)",
    adl6b = "Transport: using aid (B/I/J/KADL6A > 1)",
    adl6c = "Transport: help from someone (B/I/J/KADL6A > 2)",
    adl6d = "Transport: R receive help (B/I/J/KADL6A = 2)",
    adl7b = "Take a bath/shower: using aid (B/I/J/KADL7A > 1)",
    adl7c = "Take a bath/shower: help from someone (B/I/J/KADL7A > 2)",
    adl7d = "Take a bath/shower: R receive help (B/I/J/KADL7A = 2)"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    adl1b = "Stairs: using aid (BADL1A > 1)",
    adl2b = "(Un)dress: using aid (BADL2A > 1)",
    adl3b = "Chair: using aid (BADL3A > 1)",
    adl4b = "Toenails: using aid (BADL4A > 1)",
    adl5b = "Walking: using aid (BADL5A > 1)",
    adl6b = "Transport: using aid (BADL6A > 1)",
    adl7b = "Take a bath/shower: using aid (BADL7A > 1)"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    adl1b = "Stairs: using aid (B/I/J/KADL1A > 1)",
    adl1c = "Stairs: help from someone (B/I/J/KADL1A > 2)",
    adl1d = "Stairs: R receive help (B/I/J/KADL1A = 2)",
    adl2b = "(Un)dress: using aid (B/I/J/KADL2A > 1)",
    adl2c = "(Un)dress: help from someone (B/I/J/KADL2A > 2)",
    adl2d = "(Un)dress: R receive help (B/I/J/KADL2A = 2)",
    adl3b = "Chair: using aid (B/I/J/KADL3A > 1)",
    adl3c = "Chair: help from someone (B/I/J/KADL3A > 2)",
    adl3d = "Chair: R receive help (B/I/J/KADL3A = 2)",
    adl4b = "Toenails: using aid (B/I/J/KADL4A > 1)",
    adl4c = "Toenails: help from someone (B/I/J/KADL4A > 2)",
    adl4d = "Toenails: R receive help (B/I/J/KADL4A = 2)",
    adl5b = "Walking: using aid (B/I/J/KADL5A > 1)",
    adl5c = "Walking: help from someone (B/I/J/KADL5A > 2)",
    adl5d = "Walking: R receive help (B/I/J/KADL5A = 2)",
    adl6b = "Transport: using aid (B/I/J/KADL6A > 1)",
    adl6c = "Transport: help from someone (B/I/J/KADL6A > 2)",
    adl6d = "Transport: R receive help (B/I/J/KADL6A = 2)",
    adl7b = "Take a bath/shower: using aid (B/I/J/KADL7A > 1)",
    adl7c = "Take a bath/shower: help from someone (B/I/J/KADL7A > 2)",
    adl7d = "Take a bath/shower: R receive help (B/I/J/KADL7A = 2)"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    adl1b = "Stairs: using aid (B/I/J/KADL1A > 1)",
    adl1c = "Stairs: help from someone (B/I/J/KADL1A > 2)",
    adl1d = "Stairs: R receive help (B/I/J/KADL1A = 2)",
    adl2b = "(Un)dress: using aid (B/I/J/KADL2A > 1)",
    adl2c = "(Un)dress: help from someone (B/I/J/KADL2A > 2)",
    adl2d = "(Un)dress: R receive help (B/I/J/KADL2A = 2)",
    adl3b = "Chair: using aid (B/I/J/KADL3A > 1)",
    adl3c = "Chair: help from someone (B/I/J/KADL3A > 2)",
    adl3d = "Chair: R receive help (B/I/J/KADL3A = 2)",
    adl4b = "Toenails: using aid (B/I/J/KADL4A > 1)",
    adl4c = "Toenails: help from someone (B/I/J/KADL4A > 2)",
    adl4d = "Toenails: R receive help (B/I/J/KADL4A = 2)",
    adl5b = "Walking: using aid (B/I/J/KADL5A > 1)",
    adl5c = "Walking: help from someone (B/I/J/KADL5A > 2)",
    adl5d = "Walking: R receive help (B/I/J/KADL5A = 2)",
    adl6b = "Transport: using aid (B/I/J/KADL6A > 1)",
    adl6c = "Transport: help from someone (B/I/J/KADL6A > 2)",
    adl6d = "Transport: R receive help (B/I/J/KADL6A = 2)",
    adl7b = "Take a bath/shower: using aid (B/I/J/KADL7A > 1)",
    adl7c = "Take a bath/shower: help from someone (B/I/J/KADL7A > 2)",
    adl7d = "Take a bath/shower: R receive help (B/I/J/KADL7A = 2)"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    adl1b = "Stairs: using aid (B/I/J/KADL1A > 1)",
    adl1c = "Stairs: help from someone (B/I/J/KADL1A > 2)",
    adl1d = "Stairs: R receive help (B/I/J/KADL1A = 2)",
    adl2b = "(Un)dress: using aid (B/I/J/KADL2A > 1)",
    adl2c = "(Un)dress: help from someone (B/I/J/KADL2A > 2)",
    adl2d = "(Un)dress: R receive help (B/I/J/KADL2A = 2)",
    adl3b = "Chair: using aid (B/I/J/KADL3A > 1)",
    adl3c = "Chair: help from someone (B/I/J/KADL3A > 2)",
    adl3d = "Chair: R receive help (B/I/J/KADL3A = 2)",
    adl4b = "Toenails: using aid (B/I/J/KADL4A > 1)",
    adl4c = "Toenails: help from someone (B/I/J/KADL4A > 2)",
    adl4d = "Toenails: R receive help (B/I/J/KADL4A = 2)",
    adl5b = "Walking: using aid (B/I/J/KADL5A > 1)",
    adl5c = "Walking: help from someone (B/I/J/KADL5A > 2)",
    adl5d = "Walking: R receive help (B/I/J/KADL5A = 2)",
    adl6b = "Transport: using aid (B/I/J/KADL6A > 1)",
    adl6c = "Transport: help from someone (B/I/J/KADL6A > 2)",
    adl6d = "Transport: R receive help (B/I/J/KADL6A = 2)",
    adl7b = "Take a bath/shower: using aid (B/I/J/KADL7A > 1)",
    adl7c = "Take a bath/shower: help from someone (B/I/J/KADL7A > 2)",
    adl7d = "Take a bath/shower: R receive help (B/I/J/KADL7A = 2)"
  ),
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

standardized_value_labels <- list(
  adl1a = c(
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-1")],
    `1` = "no, I cannot",
    `2` = "only with help",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "yes, without help"
  ),
  adl1b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  adl1c = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl1d = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl1e = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  adl2a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no, I cannot",
    `2` = "only with help",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty",
    `5` = "yes, without help"
  ),
  adl2b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  adl2c = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl2d = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl2e = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  adl3a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no, I cannot",
    `2` = "only with help",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty",
    `5` = "yes, without help"
  ),
  adl3b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  adl3c = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl3d = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl3e = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  adl4a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no, I cannot",
    `2` = "only with help",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "yes, without help"
  ),
  adl4b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  adl4c = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl4d = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl4e = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  adl5a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no, I cannot",
    `2` = "only with help",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty",
    `5` = "yes, without help"
  ),
  adl5b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  adl5c = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl5d = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl5e = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  adl6a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no, I cannot",
    `2` = "only with help",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "yes, without help"
  ),
  adl6b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  adl6c = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl6d = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl6e = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  adl7a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no, I cannot",
    `2` = "only with help",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty",
    `5` = "yes, without help"
  ),
  adl7b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  adl7c = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl7d = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  adl7e = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    adl1a = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no, I cannot",
    `2` = "only with help",
    `3` = "yes, with difficulty",
    `4` = "yes, without help"
  ),
    adl1b = .replace_labels(
    standardized_value_labels$adl1b,
    `-2` = "na, see BADL1A"
  ),
    adl1c = .replace_labels(
    standardized_value_labels$adl1c,
    `-2` = "na, see BADL1A"
  ),
    adl1d = .replace_labels(
    standardized_value_labels$adl1d,
    `-2` = "na, see BADL1A"
  ),
    adl4a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BADL1A",
    `-1` = "na, asked",
    `1` = "no, I cannot",
    `2` = "only with help",
    `3` = "yes, with difficulty",
    `4` = "yes, without help"
  ),
    adl4b = .replace_labels(
    standardized_value_labels$adl4b,
    `-2` = "na, see BADL4A"
  ),
    adl4c = .replace_labels(
    standardized_value_labels$adl4c,
    `-2` = "na, see BADL4A"
  ),
    adl4d = .replace_labels(
    standardized_value_labels$adl4d,
    `-2` = "na, see BADL4A"
  ),
    adl6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BADL1A",
    `-1` = "na, asked",
    `1` = "no, I cannot",
    `2` = "only with help",
    `3` = "yes, with difficulty",
    `4` = "yes, without help"
  ),
    adl6b = .replace_labels(
    standardized_value_labels$adl6b,
    `-2` = "na, see BADL6A"
  ),
    adl6c = .replace_labels(
    standardized_value_labels$adl6c,
    `-2` = "na, see BADL6A"
  ),
    adl6d = .replace_labels(
    standardized_value_labels$adl6d,
    `-2` = "na, see BADL6A"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    adl1a = .replace_labels(
    standardized_value_labels$adl1a,
    `-5` = "na, interview terminated",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl1b = .replace_labels(
    standardized_value_labels$adl1b,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl1c = .replace_labels(
    standardized_value_labels$adl1c,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl1d = .replace_labels(
    standardized_value_labels$adl1d,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl1e = .replace_labels(
    standardized_value_labels$adl1e,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl2a = .replace_labels(
    standardized_value_labels$adl2a,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl2b = .replace_labels(
    standardized_value_labels$adl2b,
    `-2` = "na, see C/D/EADL2A"
  ),
    adl2c = .replace_labels(
    standardized_value_labels$adl2c,
    `-2` = "na, see C/D/EADL2A"
  ),
    adl2d = .replace_labels(
    standardized_value_labels$adl2d,
    `-2` = "na, see C/D/EADL2A"
  ),
    adl2e = .replace_labels(
    standardized_value_labels$adl2e,
    `-2` = "na, see C/D/EADL2A"
  ),
    adl3a = .replace_labels(
    standardized_value_labels$adl3a,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl3b = .replace_labels(
    standardized_value_labels$adl3b,
    `-2` = "na, see C/D/EADL3A"
  ),
    adl3c = .replace_labels(
    standardized_value_labels$adl3c,
    `-2` = "na, see C/D/EADL3A"
  ),
    adl3d = .replace_labels(
    standardized_value_labels$adl3d,
    `-2` = "na, see C/D/EADL3A"
  ),
    adl3e = .replace_labels(
    standardized_value_labels$adl3e,
    `-2` = "na, see C/D/EADL3A"
  ),
    adl4a = .replace_labels(
    standardized_value_labels$adl4a,
    `-2` = "na, see C/D/EADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl4b = .replace_labels(
    standardized_value_labels$adl4b,
    `-2` = "na, see C/D/EADL4A"
  ),
    adl4c = .replace_labels(
    standardized_value_labels$adl4c,
    `-2` = "na, see C/D/EADL4A"
  ),
    adl4d = .replace_labels(
    standardized_value_labels$adl4d,
    `-2` = "na, see C/D/EADL4A"
  ),
    adl4e = .replace_labels(
    standardized_value_labels$adl4e,
    `-2` = "na, see C/D/EADL4A"
  ),
    adl5a = .replace_labels(
    standardized_value_labels$adl5a,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl5b = .replace_labels(
    standardized_value_labels$adl5b,
    `-2` = "na, see C/D/EADL5A"
  ),
    adl5c = .replace_labels(
    standardized_value_labels$adl5c,
    `-2` = "na, see C/D/EADL5A"
  ),
    adl5d = .replace_labels(
    standardized_value_labels$adl5d,
    `-2` = "na, see C/D/EADL5A"
  ),
    adl5e = .replace_labels(
    standardized_value_labels$adl5e,
    `-2` = "na, see C/D/EADL5A"
  ),
    adl6a = .replace_labels(
    standardized_value_labels$adl6a,
    `-2` = "na, see C/D/EADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl6b = .replace_labels(
    standardized_value_labels$adl6b,
    `-2` = "na, see C/D/EADL6A"
  ),
    adl6c = .replace_labels(
    standardized_value_labels$adl6c,
    `-2` = "na, see C/D/EADL6A"
  ),
    adl6d = .replace_labels(
    standardized_value_labels$adl6d,
    `-2` = "na, see C/D/EADL6A"
  ),
    adl6e = .replace_labels(
    standardized_value_labels$adl6e,
    `-2` = "na, see C/D/EADL6A"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    adl1a = .replace_labels(
    standardized_value_labels$adl1a,
    `-5` = "na, interview terminated",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl1b = .replace_labels(
    standardized_value_labels$adl1b,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl1c = .replace_labels(
    standardized_value_labels$adl1c,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl1d = .replace_labels(
    standardized_value_labels$adl1d,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl1e = .replace_labels(
    standardized_value_labels$adl1e,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl2a = .replace_labels(
    standardized_value_labels$adl2a,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl2b = .replace_labels(
    standardized_value_labels$adl2b,
    `-2` = "na, see C/D/EADL2A"
  ),
    adl2c = .replace_labels(
    standardized_value_labels$adl2c,
    `-2` = "na, see C/D/EADL2A"
  ),
    adl2d = .replace_labels(
    standardized_value_labels$adl2d,
    `-2` = "na, see C/D/EADL2A"
  ),
    adl2e = .replace_labels(
    standardized_value_labels$adl2e,
    `-2` = "na, see C/D/EADL2A"
  ),
    adl3a = .replace_labels(
    standardized_value_labels$adl3a,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl3b = .replace_labels(
    standardized_value_labels$adl3b,
    `-2` = "na, see C/D/EADL3A"
  ),
    adl3c = .replace_labels(
    standardized_value_labels$adl3c,
    `-2` = "na, see C/D/EADL3A"
  ),
    adl3d = .replace_labels(
    standardized_value_labels$adl3d,
    `-2` = "na, see C/D/EADL3A"
  ),
    adl3e = .replace_labels(
    standardized_value_labels$adl3e,
    `-2` = "na, see C/D/EADL3A"
  ),
    adl4a = .replace_labels(
    standardized_value_labels$adl4a,
    `-2` = "na, see C/D/EADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl4b = .replace_labels(
    standardized_value_labels$adl4b,
    `-2` = "na, see C/D/EADL4A"
  ),
    adl4c = .replace_labels(
    standardized_value_labels$adl4c,
    `-2` = "na, see C/D/EADL4A"
  ),
    adl4d = .replace_labels(
    standardized_value_labels$adl4d,
    `-2` = "na, see C/D/EADL4A"
  ),
    adl4e = .replace_labels(
    standardized_value_labels$adl4e,
    `-2` = "na, see C/D/EADL4A"
  ),
    adl5a = .replace_labels(
    standardized_value_labels$adl5a,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl5b = .replace_labels(
    standardized_value_labels$adl5b,
    `-2` = "na, see C/D/EADL5A"
  ),
    adl5c = .replace_labels(
    standardized_value_labels$adl5c,
    `-2` = "na, see C/D/EADL5A"
  ),
    adl5d = .replace_labels(
    standardized_value_labels$adl5d,
    `-2` = "na, see C/D/EADL5A"
  ),
    adl5e = .replace_labels(
    standardized_value_labels$adl5e,
    `-2` = "na, see C/D/EADL5A"
  ),
    adl6a = .replace_labels(
    standardized_value_labels$adl6a,
    `-2` = "na, see C/D/EADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl6b = .replace_labels(
    standardized_value_labels$adl6b,
    `-2` = "na, see C/D/EADL6A"
  ),
    adl6c = .replace_labels(
    standardized_value_labels$adl6c,
    `-2` = "na, see C/D/EADL6A"
  ),
    adl6d = .replace_labels(
    standardized_value_labels$adl6d,
    `-2` = "na, see C/D/EADL6A"
  ),
    adl6e = .replace_labels(
    standardized_value_labels$adl6e,
    `-2` = "na, see C/D/EADL6A"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    adl1a = .replace_labels(
    standardized_value_labels$adl1a,
    `-5` = "na, interview terminated",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl1b = .replace_labels(
    standardized_value_labels$adl1b,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl1c = .replace_labels(
    standardized_value_labels$adl1c,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl1d = .replace_labels(
    standardized_value_labels$adl1d,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl1e = .replace_labels(
    standardized_value_labels$adl1e,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl2a = .replace_labels(
    standardized_value_labels$adl2a,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl2b = .replace_labels(
    standardized_value_labels$adl2b,
    `-2` = "na, see C/D/EADL2A"
  ),
    adl2c = .replace_labels(
    standardized_value_labels$adl2c,
    `-2` = "na, see C/D/EADL2A"
  ),
    adl2d = .replace_labels(
    standardized_value_labels$adl2d,
    `-2` = "na, see C/D/EADL2A"
  ),
    adl2e = .replace_labels(
    standardized_value_labels$adl2e,
    `-2` = "na, see C/D/EADL2A"
  ),
    adl3a = .replace_labels(
    standardized_value_labels$adl3a,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl3b = .replace_labels(
    standardized_value_labels$adl3b,
    `-2` = "na, see C/D/EADL3A"
  ),
    adl3c = .replace_labels(
    standardized_value_labels$adl3c,
    `-2` = "na, see C/D/EADL3A"
  ),
    adl3d = .replace_labels(
    standardized_value_labels$adl3d,
    `-2` = "na, see C/D/EADL3A"
  ),
    adl3e = .replace_labels(
    standardized_value_labels$adl3e,
    `-2` = "na, see C/D/EADL3A"
  ),
    adl4a = .replace_labels(
    standardized_value_labels$adl4a,
    `-2` = "na, see C/D/EADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl4b = .replace_labels(
    standardized_value_labels$adl4b,
    `-2` = "na, see C/D/EADL4A"
  ),
    adl4c = .replace_labels(
    standardized_value_labels$adl4c,
    `-2` = "na, see C/D/EADL4A"
  ),
    adl4d = .replace_labels(
    standardized_value_labels$adl4d,
    `-2` = "na, see C/D/EADL4A"
  ),
    adl4e = .replace_labels(
    standardized_value_labels$adl4e,
    `-2` = "na, see C/D/EADL4A"
  ),
    adl5a = .replace_labels(
    standardized_value_labels$adl5a,
    `-2` = "na, see C/D/EADL1A"
  ),
    adl5b = .replace_labels(
    standardized_value_labels$adl5b,
    `-2` = "na, see C/D/EADL5A"
  ),
    adl5c = .replace_labels(
    standardized_value_labels$adl5c,
    `-2` = "na, see C/D/EADL5A"
  ),
    adl5d = .replace_labels(
    standardized_value_labels$adl5d,
    `-2` = "na, see C/D/EADL5A"
  ),
    adl5e = .replace_labels(
    standardized_value_labels$adl5e,
    `-2` = "na, see C/D/EADL5A"
  ),
    adl6a = .replace_labels(
    standardized_value_labels$adl6a,
    `-2` = "na, see C/D/EADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl6b = .replace_labels(
    standardized_value_labels$adl6b,
    `-2` = "na, see C/D/EADL6A"
  ),
    adl6c = .replace_labels(
    standardized_value_labels$adl6c,
    `-2` = "na, see C/D/EADL6A"
  ),
    adl6d = .replace_labels(
    standardized_value_labels$adl6d,
    `-2` = "na, see C/D/EADL6A"
  ),
    adl6e = .replace_labels(
    standardized_value_labels$adl6e,
    `-2` = "na, see C/D/EADL6A"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    adl1a = .replace_labels(
    standardized_value_labels$adl1a,
    `-5` = "na, interview terminated",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl1b = .replace_labels(
    standardized_value_labels$adl1b,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl1c = .replace_labels(
    standardized_value_labels$adl1c,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl1d = .replace_labels(
    standardized_value_labels$adl1d,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl1e = .replace_labels(
    standardized_value_labels$adl1e,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl2a = .replace_labels(
    standardized_value_labels$adl2a,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl2b = .replace_labels(
    standardized_value_labels$adl2b,
    `-2` = "na, see B/F/GADL2A"
  ),
    adl2c = .replace_labels(
    standardized_value_labels$adl2c,
    `-2` = "na, see B/F/GADL2A"
  ),
    adl2d = .replace_labels(
    standardized_value_labels$adl2d,
    `-2` = "na, see B/F/GADL2A"
  ),
    adl2e = .replace_labels(
    standardized_value_labels$adl2e,
    `-2` = "na, see B/F/GADL2A"
  ),
    adl3a = .replace_labels(
    standardized_value_labels$adl3a,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl3b = .replace_labels(
    standardized_value_labels$adl3b,
    `-2` = "na, see B/F/GADL3A"
  ),
    adl3c = .replace_labels(
    standardized_value_labels$adl3c,
    `-2` = "na, see B/F/GADL3A"
  ),
    adl3d = .replace_labels(
    standardized_value_labels$adl3d,
    `-2` = "na, see B/F/GADL3A"
  ),
    adl3e = .replace_labels(
    standardized_value_labels$adl3e,
    `-2` = "na, see B/F/GADL3A"
  ),
    adl4a = .replace_labels(
    standardized_value_labels$adl4a,
    `-2` = "na, see B/F/GADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl4b = .replace_labels(
    standardized_value_labels$adl4b,
    `-2` = "na, see B/F/GADL4A"
  ),
    adl4c = .replace_labels(
    standardized_value_labels$adl4c,
    `-2` = "na, see B/F/GADL4A"
  ),
    adl4d = .replace_labels(
    standardized_value_labels$adl4d,
    `-2` = "na, see B/F/GADL4A"
  ),
    adl4e = .replace_labels(
    standardized_value_labels$adl4e,
    `-2` = "na, see B/F/GADL4A"
  ),
    adl5a = .replace_labels(
    standardized_value_labels$adl5a,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl5b = .replace_labels(
    standardized_value_labels$adl5b,
    `-2` = "na, see B/F/GADL5A"
  ),
    adl5c = .replace_labels(
    standardized_value_labels$adl5c,
    `-2` = "na, see B/F/GADL5A"
  ),
    adl5d = .replace_labels(
    standardized_value_labels$adl5d,
    `-2` = "na, see B/F/GADL5A"
  ),
    adl5e = .replace_labels(
    standardized_value_labels$adl5e,
    `-2` = "na, see B/F/GADL5A"
  ),
    adl6a = .replace_labels(
    standardized_value_labels$adl6a,
    `-2` = "na, see B/F/GADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl6b = .replace_labels(
    standardized_value_labels$adl6b,
    `-2` = "na, see B/F/GADL6A"
  ),
    adl6c = .replace_labels(
    standardized_value_labels$adl6c,
    `-2` = "na, see B/F/GADL6A"
  ),
    adl6d = .replace_labels(
    standardized_value_labels$adl6d,
    `-2` = "na, see B/F/GADL6A"
  ),
    adl6e = .replace_labels(
    standardized_value_labels$adl6e,
    `-2` = "na, see B/F/GADL6A"
  ),
    adl7a = .replace_labels(
    standardized_value_labels$adl7a,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl7b = .replace_labels(
    standardized_value_labels$adl7b,
    `-2` = "na, see B/F/GADL7A"
  ),
    adl7c = .replace_labels(
    standardized_value_labels$adl7c,
    `-2` = "na, see B/F/GADL7A"
  ),
    adl7d = .replace_labels(
    standardized_value_labels$adl7d,
    `-2` = "na, see B/F/GADL7A"
  ),
    adl7e = .replace_labels(
    standardized_value_labels$adl7e,
    `-2` = "na, see B/F/GADL7A"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    adl1a = .replace_labels(
    standardized_value_labels$adl1a,
    `-5` = "na, interview terminated",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl1b = .replace_labels(
    standardized_value_labels$adl1b,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl1c = .replace_labels(
    standardized_value_labels$adl1c,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl1d = .replace_labels(
    standardized_value_labels$adl1d,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl1e = .replace_labels(
    standardized_value_labels$adl1e,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl2a = .replace_labels(
    standardized_value_labels$adl2a,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl2b = .replace_labels(
    standardized_value_labels$adl2b,
    `-2` = "na, see B/F/GADL2A"
  ),
    adl2c = .replace_labels(
    standardized_value_labels$adl2c,
    `-2` = "na, see B/F/GADL2A"
  ),
    adl2d = .replace_labels(
    standardized_value_labels$adl2d,
    `-2` = "na, see B/F/GADL2A"
  ),
    adl2e = .replace_labels(
    standardized_value_labels$adl2e,
    `-2` = "na, see B/F/GADL2A"
  ),
    adl3a = .replace_labels(
    standardized_value_labels$adl3a,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl3b = .replace_labels(
    standardized_value_labels$adl3b,
    `-2` = "na, see B/F/GADL3A"
  ),
    adl3c = .replace_labels(
    standardized_value_labels$adl3c,
    `-2` = "na, see B/F/GADL3A"
  ),
    adl3d = .replace_labels(
    standardized_value_labels$adl3d,
    `-2` = "na, see B/F/GADL3A"
  ),
    adl3e = .replace_labels(
    standardized_value_labels$adl3e,
    `-2` = "na, see B/F/GADL3A"
  ),
    adl4a = .replace_labels(
    standardized_value_labels$adl4a,
    `-2` = "na, see B/F/GADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl4b = .replace_labels(
    standardized_value_labels$adl4b,
    `-2` = "na, see B/F/GADL4A"
  ),
    adl4c = .replace_labels(
    standardized_value_labels$adl4c,
    `-2` = "na, see B/F/GADL4A"
  ),
    adl4d = .replace_labels(
    standardized_value_labels$adl4d,
    `-2` = "na, see B/F/GADL4A"
  ),
    adl4e = .replace_labels(
    standardized_value_labels$adl4e,
    `-2` = "na, see B/F/GADL4A"
  ),
    adl5a = .replace_labels(
    standardized_value_labels$adl5a,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl5b = .replace_labels(
    standardized_value_labels$adl5b,
    `-2` = "na, see B/F/GADL5A"
  ),
    adl5c = .replace_labels(
    standardized_value_labels$adl5c,
    `-2` = "na, see B/F/GADL5A"
  ),
    adl5d = .replace_labels(
    standardized_value_labels$adl5d,
    `-2` = "na, see B/F/GADL5A"
  ),
    adl5e = .replace_labels(
    standardized_value_labels$adl5e,
    `-2` = "na, see B/F/GADL5A"
  ),
    adl6a = .replace_labels(
    standardized_value_labels$adl6a,
    `-2` = "na, see B/F/GADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl6b = .replace_labels(
    standardized_value_labels$adl6b,
    `-2` = "na, see B/F/GADL6A"
  ),
    adl6c = .replace_labels(
    standardized_value_labels$adl6c,
    `-2` = "na, see B/F/GADL6A"
  ),
    adl6d = .replace_labels(
    standardized_value_labels$adl6d,
    `-2` = "na, see B/F/GADL6A"
  ),
    adl6e = .replace_labels(
    standardized_value_labels$adl6e,
    `-2` = "na, see B/F/GADL6A"
  ),
    adl7a = .replace_labels(
    standardized_value_labels$adl7a,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl7b = .replace_labels(
    standardized_value_labels$adl7b,
    `-2` = "na, see B/F/GADL7A"
  ),
    adl7c = .replace_labels(
    standardized_value_labels$adl7c,
    `-2` = "na, see B/F/GADL7A"
  ),
    adl7d = .replace_labels(
    standardized_value_labels$adl7d,
    `-2` = "na, see B/F/GADL7A"
  ),
    adl7e = .replace_labels(
    standardized_value_labels$adl7e,
    `-2` = "na, see B/F/GADL7A"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    adl1a = .replace_labels(
    standardized_value_labels$adl1a,
    `-5` = "na, interview terminated",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl1b = .replace_labels(
    standardized_value_labels$adl1b,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl1c = .replace_labels(
    standardized_value_labels$adl1c,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl1d = .replace_labels(
    standardized_value_labels$adl1d,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl1e = .replace_labels(
    standardized_value_labels$adl1e,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl2a = .replace_labels(
    standardized_value_labels$adl2a,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl2b = .replace_labels(
    standardized_value_labels$adl2b,
    `-2` = "na, see B/F/GADL2A"
  ),
    adl2c = .replace_labels(
    standardized_value_labels$adl2c,
    `-2` = "na, see B/F/GADL2A"
  ),
    adl2d = .replace_labels(
    standardized_value_labels$adl2d,
    `-2` = "na, see B/F/GADL2A"
  ),
    adl2e = .replace_labels(
    standardized_value_labels$adl2e,
    `-2` = "na, see B/F/GADL2A"
  ),
    adl3a = .replace_labels(
    standardized_value_labels$adl3a,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl3b = .replace_labels(
    standardized_value_labels$adl3b,
    `-2` = "na, see B/F/GADL3A"
  ),
    adl3c = .replace_labels(
    standardized_value_labels$adl3c,
    `-2` = "na, see B/F/GADL3A"
  ),
    adl3d = .replace_labels(
    standardized_value_labels$adl3d,
    `-2` = "na, see B/F/GADL3A"
  ),
    adl3e = .replace_labels(
    standardized_value_labels$adl3e,
    `-2` = "na, see B/F/GADL3A"
  ),
    adl4a = .replace_labels(
    standardized_value_labels$adl4a,
    `-2` = "na, see B/F/GADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl4b = .replace_labels(
    standardized_value_labels$adl4b,
    `-2` = "na, see B/F/GADL4A"
  ),
    adl4c = .replace_labels(
    standardized_value_labels$adl4c,
    `-2` = "na, see B/F/GADL4A"
  ),
    adl4d = .replace_labels(
    standardized_value_labels$adl4d,
    `-2` = "na, see B/F/GADL4A"
  ),
    adl4e = .replace_labels(
    standardized_value_labels$adl4e,
    `-2` = "na, see B/F/GADL4A"
  ),
    adl5a = .replace_labels(
    standardized_value_labels$adl5a,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl5b = .replace_labels(
    standardized_value_labels$adl5b,
    `-2` = "na, see B/F/GADL5A"
  ),
    adl5c = .replace_labels(
    standardized_value_labels$adl5c,
    `-2` = "na, see B/F/GADL5A"
  ),
    adl5d = .replace_labels(
    standardized_value_labels$adl5d,
    `-2` = "na, see B/F/GADL5A"
  ),
    adl5e = .replace_labels(
    standardized_value_labels$adl5e,
    `-2` = "na, see B/F/GADL5A"
  ),
    adl6a = .replace_labels(
    standardized_value_labels$adl6a,
    `-2` = "na, see B/F/GADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl6b = .replace_labels(
    standardized_value_labels$adl6b,
    `-2` = "na, see B/F/GADL6A"
  ),
    adl6c = .replace_labels(
    standardized_value_labels$adl6c,
    `-2` = "na, see B/F/GADL6A"
  ),
    adl6d = .replace_labels(
    standardized_value_labels$adl6d,
    `-2` = "na, see B/F/GADL6A"
  ),
    adl6e = .replace_labels(
    standardized_value_labels$adl6e,
    `-2` = "na, see B/F/GADL6A"
  ),
    adl7a = .replace_labels(
    standardized_value_labels$adl7a,
    `-2` = "na, see B/F/GADL1A"
  ),
    adl7b = .replace_labels(
    standardized_value_labels$adl7b,
    `-2` = "na, see B/F/GADL7A"
  ),
    adl7c = .replace_labels(
    standardized_value_labels$adl7c,
    `-2` = "na, see B/F/GADL7A"
  ),
    adl7d = .replace_labels(
    standardized_value_labels$adl7d,
    `-2` = "na, see B/F/GADL7A"
  ),
    adl7e = .replace_labels(
    standardized_value_labels$adl7e,
    `-2` = "na, see B/F/GADL7A"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    adl1a = .replace_labels(
    standardized_value_labels$adl1a,
    `-5` = "na, interview terminated",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl1b = .replace_labels(
    standardized_value_labels$adl1b,
    `-2` = "na, see HADL1A"
  ),
    adl1c = .replace_labels(
    standardized_value_labels$adl1c,
    `-2` = "na, see HADL1A"
  ),
    adl1d = .replace_labels(
    standardized_value_labels$adl1d,
    `-2` = "na, see HADL1A"
  ),
    adl2a = .replace_labels(
    standardized_value_labels$adl2a,
    `-2` = "na, see HADL1A"
  ),
    adl2b = .replace_labels(
    standardized_value_labels$adl2b,
    `-2` = "na, see HADL2A"
  ),
    adl2c = .replace_labels(
    standardized_value_labels$adl2c,
    `-2` = "na, see HADL2A"
  ),
    adl2d = .replace_labels(
    standardized_value_labels$adl2d,
    `-2` = "na, see HADL2A"
  ),
    adl3a = .replace_labels(
    standardized_value_labels$adl3a,
    `-2` = "na, see HADL1A"
  ),
    adl3b = .replace_labels(
    standardized_value_labels$adl3b,
    `-2` = "na, see HADL3A"
  ),
    adl3c = .replace_labels(
    standardized_value_labels$adl3c,
    `-2` = "na, see HADL3A"
  ),
    adl3d = .replace_labels(
    standardized_value_labels$adl3d,
    `-2` = "na, see HADL3A"
  ),
    adl4a = .replace_labels(
    standardized_value_labels$adl4a,
    `-2` = "na, see HADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl4b = .replace_labels(
    standardized_value_labels$adl4b,
    `-2` = "na, see HADL4A"
  ),
    adl4c = .replace_labels(
    standardized_value_labels$adl4c,
    `-2` = "na, see HADL4A"
  ),
    adl4d = .replace_labels(
    standardized_value_labels$adl4d,
    `-2` = "na, see HADL4A"
  ),
    adl5a = .replace_labels(
    standardized_value_labels$adl5a,
    `-2` = "na, see HADL1A"
  ),
    adl5b = .replace_labels(
    standardized_value_labels$adl5b,
    `-2` = "na, see HADL5A"
  ),
    adl5c = .replace_labels(
    standardized_value_labels$adl5c,
    `-2` = "na, see HADL5A"
  ),
    adl5d = .replace_labels(
    standardized_value_labels$adl5d,
    `-2` = "na, see HADL5A"
  ),
    adl6a = .replace_labels(
    standardized_value_labels$adl6a,
    `-2` = "na, see HADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl6b = .replace_labels(
    standardized_value_labels$adl6b,
    `-2` = "na, see HADL6A"
  ),
    adl6c = .replace_labels(
    standardized_value_labels$adl6c,
    `-2` = "na, see HADL6A"
  ),
    adl6d = .replace_labels(
    standardized_value_labels$adl6d,
    `-2` = "na, see HADL6A"
  ),
    adl7a = .replace_labels(
    standardized_value_labels$adl7a,
    `-2` = "na, see HADL1A"
  ),
    adl7b = .replace_labels(
    standardized_value_labels$adl7b,
    `-2` = "na, see HADL7A"
  ),
    adl7c = .replace_labels(
    standardized_value_labels$adl7c,
    `-2` = "na, see HADL7A"
  ),
    adl7d = .replace_labels(
    standardized_value_labels$adl7d,
    `-2` = "na, see HADL7A"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    adl1a = .replace_labels(
    standardized_value_labels$adl1a,
    `-5` = "na, interview terminated",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl1b = .replace_labels(
    standardized_value_labels$adl1b,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl1c = .replace_labels(
    standardized_value_labels$adl1c,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl1d = .replace_labels(
    standardized_value_labels$adl1d,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl2a = .replace_labels(
    standardized_value_labels$adl2a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl2b = .replace_labels(
    standardized_value_labels$adl2b,
    `-2` = "na, see B/I/J/KADL2A"
  ),
    adl2c = .replace_labels(
    standardized_value_labels$adl2c,
    `-2` = "na, see B/I/J/KADL2A"
  ),
    adl2d = .replace_labels(
    standardized_value_labels$adl2d,
    `-2` = "na, see B/I/J/KADL2A"
  ),
    adl3a = .replace_labels(
    standardized_value_labels$adl3a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl3b = .replace_labels(
    standardized_value_labels$adl3b,
    `-2` = "na, see B/I/J/KADL3A"
  ),
    adl3c = .replace_labels(
    standardized_value_labels$adl3c,
    `-2` = "na, see B/I/J/KADL3A"
  ),
    adl3d = .replace_labels(
    standardized_value_labels$adl3d,
    `-2` = "na, see B/I/J/KADL3A"
  ),
    adl4a = .replace_labels(
    standardized_value_labels$adl4a,
    `-2` = "na, see B/I/J/KADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl4b = .replace_labels(
    standardized_value_labels$adl4b,
    `-2` = "na, see B/I/J/KADL4A"
  ),
    adl4c = .replace_labels(
    standardized_value_labels$adl4c,
    `-2` = "na, see B/I/J/KADL4A"
  ),
    adl4d = .replace_labels(
    standardized_value_labels$adl4d,
    `-2` = "na, see B/I/J/KADL4A"
  ),
    adl5a = .replace_labels(
    standardized_value_labels$adl5a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl5b = .replace_labels(
    standardized_value_labels$adl5b,
    `-2` = "na, see B/I/J/KADL5A"
  ),
    adl5c = .replace_labels(
    standardized_value_labels$adl5c,
    `-2` = "na, see B/I/J/KADL5A"
  ),
    adl5d = .replace_labels(
    standardized_value_labels$adl5d,
    `-2` = "na, see B/I/J/KADL5A"
  ),
    adl6a = .replace_labels(
    standardized_value_labels$adl6a,
    `-2` = "na, see B/I/J/KADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl6b = .replace_labels(
    standardized_value_labels$adl6b,
    `-2` = "na, see B/I/J/KADL6A"
  ),
    adl6c = .replace_labels(
    standardized_value_labels$adl6c,
    `-2` = "na, see B/I/J/KADL6A"
  ),
    adl6d = .replace_labels(
    standardized_value_labels$adl6d,
    `-2` = "na, see B/I/J/KADL6A"
  ),
    adl7a = .replace_labels(
    standardized_value_labels$adl7a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl7b = .replace_labels(
    standardized_value_labels$adl7b,
    `-2` = "na, see B/I/J/KADL7A"
  ),
    adl7c = .replace_labels(
    standardized_value_labels$adl7c,
    `-2` = "na, see B/I/J/KADL7A"
  ),
    adl7d = .replace_labels(
    standardized_value_labels$adl7d,
    `-2` = "na, see B/I/J/KADL7A"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    adl1a = .replace_labels(
    standardized_value_labels$adl1a,
    `-5` = "na, interview terminated",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl1b = .replace_labels(
    standardized_value_labels$adl1b,
    `-2` = "na, see BADL1A"
  ),
    adl2a = .replace_labels(
    standardized_value_labels$adl2a,
    `-2` = "na, see BADL1A"
  ),
    adl2b = .replace_labels(
    standardized_value_labels$adl2b,
    `-2` = "na, see BADL2A"
  ),
    adl3a = .replace_labels(
    standardized_value_labels$adl3a,
    `-2` = "na, see BADL1A"
  ),
    adl3b = .replace_labels(
    standardized_value_labels$adl3b,
    `-2` = "na, see BADL3A"
  ),
    adl4a = .replace_labels(
    standardized_value_labels$adl4a,
    `-2` = "na, see BADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl4b = .replace_labels(
    standardized_value_labels$adl4b,
    `-2` = "na, see BADL4A"
  ),
    adl5a = .replace_labels(
    standardized_value_labels$adl5a,
    `-2` = "na, see BADL1A"
  ),
    adl5b = .replace_labels(
    standardized_value_labels$adl5b,
    `-2` = "na, see BADL5A"
  ),
    adl6a = .replace_labels(
    standardized_value_labels$adl6a,
    `-2` = "na, see BADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl6b = .replace_labels(
    standardized_value_labels$adl6b,
    `-2` = "na, see BADL6A"
  ),
    adl7a = .replace_labels(
    standardized_value_labels$adl7a,
    `-2` = "na, see BADL1A"
  ),
    adl7b = .replace_labels(
    standardized_value_labels$adl7b,
    `-2` = "na, see BADL7A"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    adl1a = .replace_labels(
    standardized_value_labels$adl1a,
    `-5` = "na, interview terminated",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl1b = .replace_labels(
    standardized_value_labels$adl1b,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl1c = .replace_labels(
    standardized_value_labels$adl1c,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl1d = .replace_labels(
    standardized_value_labels$adl1d,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl2a = .replace_labels(
    standardized_value_labels$adl2a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl2b = .replace_labels(
    standardized_value_labels$adl2b,
    `-2` = "na, see B/I/J/KADL2A"
  ),
    adl2c = .replace_labels(
    standardized_value_labels$adl2c,
    `-2` = "na, see B/I/J/KADL2A"
  ),
    adl2d = .replace_labels(
    standardized_value_labels$adl2d,
    `-2` = "na, see B/I/J/KADL2A"
  ),
    adl3a = .replace_labels(
    standardized_value_labels$adl3a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl3b = .replace_labels(
    standardized_value_labels$adl3b,
    `-2` = "na, see B/I/J/KADL3A"
  ),
    adl3c = .replace_labels(
    standardized_value_labels$adl3c,
    `-2` = "na, see B/I/J/KADL3A"
  ),
    adl3d = .replace_labels(
    standardized_value_labels$adl3d,
    `-2` = "na, see B/I/J/KADL3A"
  ),
    adl4a = .replace_labels(
    standardized_value_labels$adl4a,
    `-2` = "na, see B/I/J/KADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl4b = .replace_labels(
    standardized_value_labels$adl4b,
    `-2` = "na, see B/I/J/KADL4A"
  ),
    adl4c = .replace_labels(
    standardized_value_labels$adl4c,
    `-2` = "na, see B/I/J/KADL4A"
  ),
    adl4d = .replace_labels(
    standardized_value_labels$adl4d,
    `-2` = "na, see B/I/J/KADL4A"
  ),
    adl5a = .replace_labels(
    standardized_value_labels$adl5a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl5b = .replace_labels(
    standardized_value_labels$adl5b,
    `-2` = "na, see B/I/J/KADL5A"
  ),
    adl5c = .replace_labels(
    standardized_value_labels$adl5c,
    `-2` = "na, see B/I/J/KADL5A"
  ),
    adl5d = .replace_labels(
    standardized_value_labels$adl5d,
    `-2` = "na, see B/I/J/KADL5A"
  ),
    adl6a = .replace_labels(
    standardized_value_labels$adl6a,
    `-2` = "na, see B/I/J/KADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl6b = .replace_labels(
    standardized_value_labels$adl6b,
    `-2` = "na, see B/I/J/KADL6A"
  ),
    adl6c = .replace_labels(
    standardized_value_labels$adl6c,
    `-2` = "na, see B/I/J/KADL6A"
  ),
    adl6d = .replace_labels(
    standardized_value_labels$adl6d,
    `-2` = "na, see B/I/J/KADL6A"
  ),
    adl7a = .replace_labels(
    standardized_value_labels$adl7a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl7b = .replace_labels(
    standardized_value_labels$adl7b,
    `-2` = "na, see B/I/J/KADL7A"
  ),
    adl7c = .replace_labels(
    standardized_value_labels$adl7c,
    `-2` = "na, see B/I/J/KADL7A"
  ),
    adl7d = .replace_labels(
    standardized_value_labels$adl7d,
    `-2` = "na, see B/I/J/KADL7A"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    adl1a = .replace_labels(
    standardized_value_labels$adl1a,
    `-5` = "na, interview terminated",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl1b = .replace_labels(
    standardized_value_labels$adl1b,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl1c = .replace_labels(
    standardized_value_labels$adl1c,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl1d = .replace_labels(
    standardized_value_labels$adl1d,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl2a = .replace_labels(
    standardized_value_labels$adl2a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl2b = .replace_labels(
    standardized_value_labels$adl2b,
    `-2` = "na, see B/I/J/KADL2A"
  ),
    adl2c = .replace_labels(
    standardized_value_labels$adl2c,
    `-2` = "na, see B/I/J/KADL2A"
  ),
    adl2d = .replace_labels(
    standardized_value_labels$adl2d,
    `-2` = "na, see B/I/J/KADL2A"
  ),
    adl3a = .replace_labels(
    standardized_value_labels$adl3a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl3b = .replace_labels(
    standardized_value_labels$adl3b,
    `-2` = "na, see B/I/J/KADL3A"
  ),
    adl3c = .replace_labels(
    standardized_value_labels$adl3c,
    `-2` = "na, see B/I/J/KADL3A"
  ),
    adl3d = .replace_labels(
    standardized_value_labels$adl3d,
    `-2` = "na, see B/I/J/KADL3A"
  ),
    adl4a = .replace_labels(
    standardized_value_labels$adl4a,
    `-2` = "na, see B/I/J/KADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl4b = .replace_labels(
    standardized_value_labels$adl4b,
    `-2` = "na, see B/I/J/KADL4A"
  ),
    adl4c = .replace_labels(
    standardized_value_labels$adl4c,
    `-2` = "na, see B/I/J/KADL4A"
  ),
    adl4d = .replace_labels(
    standardized_value_labels$adl4d,
    `-2` = "na, see B/I/J/KADL4A"
  ),
    adl5a = .replace_labels(
    standardized_value_labels$adl5a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl5b = .replace_labels(
    standardized_value_labels$adl5b,
    `-2` = "na, see B/I/J/KADL5A"
  ),
    adl5c = .replace_labels(
    standardized_value_labels$adl5c,
    `-2` = "na, see B/I/J/KADL5A"
  ),
    adl5d = .replace_labels(
    standardized_value_labels$adl5d,
    `-2` = "na, see B/I/J/KADL5A"
  ),
    adl6a = .replace_labels(
    standardized_value_labels$adl6a,
    `-2` = "na, see B/I/J/KADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl6b = .replace_labels(
    standardized_value_labels$adl6b,
    `-2` = "na, see B/I/J/KADL6A"
  ),
    adl6c = .replace_labels(
    standardized_value_labels$adl6c,
    `-2` = "na, see B/I/J/KADL6A"
  ),
    adl6d = .replace_labels(
    standardized_value_labels$adl6d,
    `-2` = "na, see B/I/J/KADL6A"
  ),
    adl7a = .replace_labels(
    standardized_value_labels$adl7a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl7b = .replace_labels(
    standardized_value_labels$adl7b,
    `-2` = "na, see B/I/J/KADL7A"
  ),
    adl7c = .replace_labels(
    standardized_value_labels$adl7c,
    `-2` = "na, see B/I/J/KADL7A"
  ),
    adl7d = .replace_labels(
    standardized_value_labels$adl7d,
    `-2` = "na, see B/I/J/KADL7A"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    adl1a = .replace_labels(
    standardized_value_labels$adl1a,
    `-5` = "na, interview terminated",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl1b = .replace_labels(
    standardized_value_labels$adl1b,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl1c = .replace_labels(
    standardized_value_labels$adl1c,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl1d = .replace_labels(
    standardized_value_labels$adl1d,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl2a = .replace_labels(
    standardized_value_labels$adl2a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl2b = .replace_labels(
    standardized_value_labels$adl2b,
    `-2` = "na, see B/I/J/KADL2A"
  ),
    adl2c = .replace_labels(
    standardized_value_labels$adl2c,
    `-2` = "na, see B/I/J/KADL2A"
  ),
    adl2d = .replace_labels(
    standardized_value_labels$adl2d,
    `-2` = "na, see B/I/J/KADL2A"
  ),
    adl3a = .replace_labels(
    standardized_value_labels$adl3a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl3b = .replace_labels(
    standardized_value_labels$adl3b,
    `-2` = "na, see B/I/J/KADL3A"
  ),
    adl3c = .replace_labels(
    standardized_value_labels$adl3c,
    `-2` = "na, see B/I/J/KADL3A"
  ),
    adl3d = .replace_labels(
    standardized_value_labels$adl3d,
    `-2` = "na, see B/I/J/KADL3A"
  ),
    adl4a = .replace_labels(
    standardized_value_labels$adl4a,
    `-2` = "na, see B/I/J/KADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl4b = .replace_labels(
    standardized_value_labels$adl4b,
    `-2` = "na, see B/I/J/KADL4A"
  ),
    adl4c = .replace_labels(
    standardized_value_labels$adl4c,
    `-2` = "na, see B/I/J/KADL4A"
  ),
    adl4d = .replace_labels(
    standardized_value_labels$adl4d,
    `-2` = "na, see B/I/J/KADL4A"
  ),
    adl5a = .replace_labels(
    standardized_value_labels$adl5a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl5b = .replace_labels(
    standardized_value_labels$adl5b,
    `-2` = "na, see B/I/J/KADL5A"
  ),
    adl5c = .replace_labels(
    standardized_value_labels$adl5c,
    `-2` = "na, see B/I/J/KADL5A"
  ),
    adl5d = .replace_labels(
    standardized_value_labels$adl5d,
    `-2` = "na, see B/I/J/KADL5A"
  ),
    adl6a = .replace_labels(
    standardized_value_labels$adl6a,
    `-2` = "na, see B/I/J/KADL1A",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty"
  ),
    adl6b = .replace_labels(
    standardized_value_labels$adl6b,
    `-2` = "na, see B/I/J/KADL6A"
  ),
    adl6c = .replace_labels(
    standardized_value_labels$adl6c,
    `-2` = "na, see B/I/J/KADL6A"
  ),
    adl6d = .replace_labels(
    standardized_value_labels$adl6d,
    `-2` = "na, see B/I/J/KADL6A"
  ),
    adl7a = .replace_labels(
    standardized_value_labels$adl7a,
    `-2` = "na, see B/I/J/KADL1A"
  ),
    adl7b = .replace_labels(
    standardized_value_labels$adl7b,
    `-2` = "na, see B/I/J/KADL7A"
  ),
    adl7c = .replace_labels(
    standardized_value_labels$adl7c,
    `-2` = "na, see B/I/J/KADL7A"
  ),
    adl7d = .replace_labels(
    standardized_value_labels$adl7d,
    `-2` = "na, see B/I/J/KADL7A"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  adl1a = "categorical",
  adl1b = "categorical",
  adl1c = "categorical",
  adl1d = "categorical",
  adl1e = "categorical",
  adl2a = "categorical",
  adl2b = "categorical",
  adl2c = "categorical",
  adl2d = "categorical",
  adl2e = "categorical",
  adl3a = "categorical",
  adl3b = "categorical",
  adl3c = "categorical",
  adl3d = "categorical",
  adl3e = "categorical",
  adl4a = "categorical",
  adl4b = "categorical",
  adl4c = "categorical",
  adl4d = "categorical",
  adl4e = "categorical",
  adl5a = "categorical",
  adl5b = "categorical",
  adl5c = "categorical",
  adl5d = "categorical",
  adl5e = "categorical",
  adl6a = "categorical",
  adl6b = "categorical",
  adl6c = "categorical",
  adl6d = "categorical",
  adl6e = "categorical",
  adl7a = "categorical",
  adl7b = "categorical",
  adl7c = "categorical",
  adl7d = "categorical",
  adl7e = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "030", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "030", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "030", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "030", waves = .lasa_wave_rows())
)

.lasa_fc_030 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

