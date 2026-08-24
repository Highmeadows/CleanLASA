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

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("nupers")],
    nupers = "Number of persons in household"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("nupers")],
    nupers = "# other persons in household (partner excluded)"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c("nupers")],
    nupers = "# other persons in household (partner excluded)"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c("nupers")],
    nupers = "# other persons in household (partner excluded)"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c("nupers")],
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
    harmonized_labels[c("nupers")],
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
  hhnch = c(`-2` = "not available, routing"),
  hhnnonk = c(`-2` = "not available, routing"),
  hhnothf = c(`-2` = "not available, routing"),
  hhnsib = c(`-2` = "not available, routing"),
  hhnstch = c(`-2` = "not available, routing"),
  hhpart = c(
    `-2` = "not available, routing",
    `0` = "no partner in household",
    `1` = "partner in household"
  ),
  nupers = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available",
    `-1` = "not available, asked",
    `0` = "none"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("nupers")],
    nupers = c(`-3` = "na, wrong skip", `-2` = "na, not liv independently", `0` = "none")
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("nupers")],
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/BHINDEP in LASA014",
    `-1` = "na, asked"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("nupers")],
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/BHINDEP in LASA014",
    `-1` = "na, asked"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("nupers")],
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/BHINDEP in LASA014",
    `-1` = "na, asked"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("nupers")],
    nupers = .replace_labels(
    standardized_value_labels$nupers,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/BHINDEP in LASA014",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014",
    `-1` = "na, asked"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c("nupers")],
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
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014",
    `-1` = "na, asked"
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

.lasa_fc_011 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "011", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "011", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "011", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "011", waves = .lasa_wave_rows())
)
