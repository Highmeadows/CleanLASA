## LASA filecode 011 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  hhnch = "Number of children in household",
  hhnnonk = "Number of nonkin persons in household",
  hhnothf = "Number of other family members in household",
  hhnsib = "Number of siblings in household",
  hhnstch = "Number of stepchildren in household",
  hhpart = "Partner in household",
  nupers = "Number of other persons in household"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "nupers"
  ),
  `C` = c(
    "nupers"
  ),
  `D` = c(
    "nupers"
  ),
  `E` = c(
    "nupers"
  ),
  `2B` = c(
    "nupers"
  ),
  `F` = c(
    "hhnch",
    "hhnnonk",
    "hhnothf",
    "hhnsib",
    "hhnstch",
    "hhpart",
    "nupers"
  ),
  `G` = c(
    "hhnch",
    "hhnnonk",
    "hhnothf",
    "hhnsib",
    "hhnstch",
    "hhpart",
    "nupers"
  ),
  `H` = c(
    "hhnch",
    "hhnnonk",
    "hhnothf",
    "hhnsib",
    "hhnstch",
    "hhpart",
    "nupers"
  ),
  `3B` = c(
    "hhnch",
    "hhnnonk",
    "hhnothf",
    "hhnsib",
    "hhnstch",
    "hhpart",
    "nupers"
  ),
  `MB` = c(
    "nupers"
  ),
  `I` = c(
    "hhnch",
    "hhnnonk",
    "hhnothf",
    "hhnsib",
    "hhnstch",
    "hhpart",
    "nupers"
  ),
  `J` = c(
    "hhnch",
    "hhnnonk",
    "hhnothf",
    "hhnsib",
    "hhnstch",
    "hhpart",
    "nupers"
  ),
  `K` = c(
    "hhnch",
    "hhnnonk",
    "hhnothf",
    "hhnsib",
    "hhnstch",
    "hhpart",
    "nupers"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    nupers = "Number of persons in household"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    nupers = "# other persons in household (partner excluded)"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    nupers = "# other persons in household (partner excluded)"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    nupers = "# other persons in household (partner excluded)"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    nupers = "# other persons in household (partner excluded)"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    hhnch = "number of children in household",
    hhnnonk = "number of nonkin persons in household",
    hhnothf = "number of other family members in household",
    hhnsib = "number of siblings in household",
    hhnstch = "number of stepchildren in household",
    hhpart = "partner in household",
    nupers = "# other persons in household"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    hhnch = "number of children in household",
    hhnnonk = "number of nonkin persons in household",
    hhnothf = "number of other family members in household",
    hhnsib = "number of siblings in household",
    hhnstch = "number of stepchildren in household",
    hhpart = "partner in household",
    nupers = "# other persons in household"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    hhnch = "number of children in household",
    hhnnonk = "number of nonkin persons in household",
    hhnothf = "number of other family members in household",
    hhnsib = "number of siblings in household",
    hhnstch = "number of stepchildren in household",
    hhpart = "partner in household",
    nupers = "# other persons in household"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    hhnch = "number of children in household",
    hhnnonk = "number of nonkin persons in household",
    hhnothf = "number of other family members in household",
    hhnsib = "number of siblings in household",
    hhnstch = "number of stepchildren in household",
    hhpart = "partner in household",
    nupers = "# other persons in household"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    nupers = "# other persons in household"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    hhnch = "number of children in household",
    hhnnonk = "number of nonkin persons in household",
    hhnothf = "number of other family members in household",
    hhnsib = "number of siblings in household",
    hhnstch = "number of stepchildren in household",
    hhpart = "partner in household",
    nupers = "# other persons in household"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    hhnch = "number of children in household",
    hhnnonk = "number of nonkin persons in household",
    hhnothf = "number of other family members in household",
    hhnsib = "number of siblings in household",
    hhnstch = "number of stepchildren in household",
    hhpart = "partner in household",
    nupers = "# other persons in household"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    hhnch = "number of children in household",
    hhnnonk = "number of nonkin persons in household",
    hhnothf = "number of other family members in household",
    hhnsib = "number of siblings in household",
    hhnstch = "number of stepchildren in household",
    hhpart = "partner in household",
    nupers = "# other persons in household"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  hhnch = c(
    default_missing_labels[c("-2")]
  ),
  hhnnonk = c(
    default_missing_labels[c("-2")]
  ),
  hhnothf = c(
    default_missing_labels[c("-2")]
  ),
  hhnsib = c(
    default_missing_labels[c("-2")]
  ),
  hhnstch = c(
    default_missing_labels[c("-2")]
  ),
  hhpart = c(
    default_missing_labels[c("-2")],
    `0` = "no partner in household",
    `1` = "partner in household"
  ),
  nupers = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "none"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    nupers = c(`-3` = "na, wrong skip", `-2` = "na, not liv independently", `0` = "none")
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-2` = "na, see C/D/E/BHINDEP in LASA014"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-2` = "na, see C/D/E/BHINDEP in LASA014"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-2` = "na, see C/D/E/BHINDEP in LASA014"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-2` = "na, see C/D/E/BHINDEP in LASA014"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    hhnch = .replace_labels(
    standardized_value_labels$hhnch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnnonk = .replace_labels(
    standardized_value_labels$hhnnonk,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnothf = .replace_labels(
    standardized_value_labels$hhnothf,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnsib = .replace_labels(
    standardized_value_labels$hhnsib,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnstch = .replace_labels(
    standardized_value_labels$hhnstch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhpart = .replace_labels(
    standardized_value_labels$hhpart,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    hhnch = .replace_labels(
    standardized_value_labels$hhnch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnnonk = .replace_labels(
    standardized_value_labels$hhnnonk,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnothf = .replace_labels(
    standardized_value_labels$hhnothf,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnsib = .replace_labels(
    standardized_value_labels$hhnsib,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnstch = .replace_labels(
    standardized_value_labels$hhnstch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhpart = .replace_labels(
    standardized_value_labels$hhpart,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    hhnch = .replace_labels(
    standardized_value_labels$hhnch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnnonk = .replace_labels(
    standardized_value_labels$hhnnonk,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnothf = .replace_labels(
    standardized_value_labels$hhnothf,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnsib = .replace_labels(
    standardized_value_labels$hhnsib,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnstch = .replace_labels(
    standardized_value_labels$hhnstch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhpart = .replace_labels(
    standardized_value_labels$hhpart,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    hhnch = .replace_labels(
    standardized_value_labels$hhnch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnnonk = .replace_labels(
    standardized_value_labels$hhnnonk,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnothf = .replace_labels(
    standardized_value_labels$hhnothf,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnsib = .replace_labels(
    standardized_value_labels$hhnsib,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnstch = .replace_labels(
    standardized_value_labels$hhnstch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhpart = .replace_labels(
    standardized_value_labels$hhpart,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    nupers = c(`-3` = "na, wrong skip", `-1` = "na, asked", `0` = "none")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    hhnch = .replace_labels(
    standardized_value_labels$hhnch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnnonk = .replace_labels(
    standardized_value_labels$hhnnonk,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnothf = .replace_labels(
    standardized_value_labels$hhnothf,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnsib = .replace_labels(
    standardized_value_labels$hhnsib,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnstch = .replace_labels(
    standardized_value_labels$hhnstch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhpart = .replace_labels(
    standardized_value_labels$hhpart,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    hhnch = .replace_labels(
    standardized_value_labels$hhnch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnnonk = .replace_labels(
    standardized_value_labels$hhnnonk,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnothf = .replace_labels(
    standardized_value_labels$hhnothf,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnsib = .replace_labels(
    standardized_value_labels$hhnsib,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnstch = .replace_labels(
    standardized_value_labels$hhnstch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhpart = .replace_labels(
    standardized_value_labels$hhpart,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    hhnch = .replace_labels(
    standardized_value_labels$hhnch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnnonk = .replace_labels(
    standardized_value_labels$hhnnonk,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnothf = .replace_labels(
    standardized_value_labels$hhnothf,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnsib = .replace_labels(
    standardized_value_labels$hhnsib,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhnstch = .replace_labels(
    standardized_value_labels$hhnstch,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    hhpart = .replace_labels(
    standardized_value_labels$hhpart,
    `-2` = "na, see F/G/H/B/I/J/KNUPERS"
  ),
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  hhnch = "numeric",
  hhnnonk = "numeric",
  hhnothf = "numeric",
  hhnsib = "numeric",
  hhnstch = "numeric",
  hhpart = "categorical",
  nupers = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "011", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "011", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "011", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "011", waves = .lasa_wave_rows())
)

.lasa_fc_011 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

