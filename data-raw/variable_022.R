## LASA filecode 022 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mraabmis = "Medical interview: # of missing answers total test",
  mrava1 = "Medical interview C. Raven Section A: item 1",
  mrava10 = "Medical interview C. Raven Section A: item 10",
  mrava11 = "Medical interview C. Raven Section A: item 11",
  mrava12 = "Medical interview C. Raven Section A: item 12",
  mrava2 = "Medical interview C. Raven Section A: item 2",
  mrava3 = "Medical interview C. Raven Section A: item 3",
  mrava4 = "Medical interview C. Raven Section A: item 4",
  mrava5 = "Medical interview C. Raven Section A: item 5",
  mrava6 = "Medical interview C. Raven Section A: item 6",
  mrava7 = "Medical interview C. Raven Section A: item 7",
  mrava8 = "Medical interview C. Raven Section A: item 8",
  mrava9 = "Medical interview C. Raven Section A: item 9",
  mravamis = "Medical interview: # of missing answers first Raven test (A)",
  mravb1 = "Medical interview C. Raven Section B: item 1",
  mravb10 = "Medical interview C. Raven Section B: item 10",
  mravb11 = "Medical interview C. Raven Section B: item 11",
  mravb12 = "Medical interview C. Raven Section B: item 12",
  mravb2 = "Medical interview C. Raven Section B: item 2",
  mravb3 = "Medical interview C. Raven Section B: item 3",
  mravb4 = "Medical interview C. Raven Section B: item 4",
  mravb5 = "Medical interview C. Raven Section B: item 5",
  mravb6 = "Medical interview C. Raven Section B: item 6",
  mravb7 = "Medical interview C. Raven Section B: item 7",
  mravb8 = "Medical interview C. Raven Section B: item 8",
  mravb9 = "Medical interview C. Raven Section B: item 9",
  mravbmis = "Medical interview: # of missing answers second Raven test (B)",
  raabmis = "Main interview: # of missing answers total test",
  rava1 = "Main interview C. Raven Section A: item 1",
  rava10 = "Main interview C. Raven Section A: item 10",
  rava11 = "Main interview C. Raven Section A: item 11",
  rava12 = "Main interview C. Raven Section A: item 12",
  rava2 = "Main interview C. Raven Section A: item 2",
  rava3 = "Main interview C. Raven Section A: item 3",
  rava4 = "Main interview C. Raven Section A: item 4",
  rava5 = "Main interview C. Raven Section A: item 5",
  rava6 = "Main interview C. Raven Section A: item 6",
  rava7 = "Main interview C. Raven Section A: item 7",
  rava8 = "Main interview C. Raven Section A: item 8",
  rava9 = "Main interview C. Raven Section A: item 9",
  ravamis = "Main interview: # of missing answers first Raven test (A)",
  ravb1 = "Main interview C. Raven Section B: item 1",
  ravb10 = "Main interview C. Raven Section B: item 10",
  ravb11 = "Main interview C. Raven Section B: item 11",
  ravb12 = "Main interview C. Raven Section B: item 12",
  ravb2 = "Main interview C. Raven Section B: item 2",
  ravb3 = "Main interview C. Raven Section B: item 3",
  ravb4 = "Main interview C. Raven Section B: item 4",
  ravb5 = "Main interview C. Raven Section B: item 5",
  ravb6 = "Main interview C. Raven Section B: item 6",
  ravb7 = "Main interview C. Raven Section B: item 7",
  ravb8 = "Main interview C. Raven Section B: item 8",
  ravb9 = "Main interview C. Raven Section B: item 9",
  ravbmis = "Main interview: # of missing answers second Raven test (B)"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "raabmis",
    "rava1",
    "rava10",
    "rava11",
    "rava12",
    "rava2",
    "rava3",
    "rava4",
    "rava5",
    "rava6",
    "rava7",
    "rava8",
    "rava9",
    "ravamis",
    "ravb1",
    "ravb10",
    "ravb11",
    "ravb12",
    "ravb2",
    "ravb3",
    "ravb4",
    "ravb5",
    "ravb6",
    "ravb7",
    "ravb8",
    "ravb9",
    "ravbmis"
  ),
  `C` = c(
    "raabmis",
    "rava1",
    "rava10",
    "rava11",
    "rava12",
    "rava2",
    "rava3",
    "rava4",
    "rava5",
    "rava6",
    "rava7",
    "rava8",
    "rava9",
    "ravamis",
    "ravb1",
    "ravb10",
    "ravb11",
    "ravb12",
    "ravb2",
    "ravb3",
    "ravb4",
    "ravb5",
    "ravb6",
    "ravb7",
    "ravb8",
    "ravb9",
    "ravbmis"
  ),
  `D` = c(
    "raabmis",
    "rava1",
    "rava10",
    "rava11",
    "rava12",
    "rava2",
    "rava3",
    "rava4",
    "rava5",
    "rava6",
    "rava7",
    "rava8",
    "rava9",
    "ravamis",
    "ravb1",
    "ravb10",
    "ravb11",
    "ravb12",
    "ravb2",
    "ravb3",
    "ravb4",
    "ravb5",
    "ravb6",
    "ravb7",
    "ravb8",
    "ravb9",
    "ravbmis"
  ),
  `E` = c(
    "mraabmis",
    "mrava1",
    "mrava10",
    "mrava11",
    "mrava12",
    "mrava2",
    "mrava3",
    "mrava4",
    "mrava5",
    "mrava6",
    "mrava7",
    "mrava8",
    "mrava9",
    "mravamis",
    "mravb1",
    "mravb10",
    "mravb11",
    "mravb12",
    "mravb2",
    "mravb3",
    "mravb4",
    "mravb5",
    "mravb6",
    "mravb7",
    "mravb8",
    "mravb9",
    "mravbmis"
  ),
  `2B` = c(
    "mraabmis",
    "mrava1",
    "mrava10",
    "mrava11",
    "mrava12",
    "mrava2",
    "mrava3",
    "mrava4",
    "mrava5",
    "mrava6",
    "mrava7",
    "mrava8",
    "mrava9",
    "mravamis",
    "mravb1",
    "mravb10",
    "mravb11",
    "mravb12",
    "mravb2",
    "mravb3",
    "mravb4",
    "mravb5",
    "mravb6",
    "mravb7",
    "mravb8",
    "mravb9",
    "mravbmis"
  ),
  `F` = c(
    "mraabmis",
    "mrava1",
    "mrava10",
    "mrava11",
    "mrava12",
    "mrava2",
    "mrava3",
    "mrava4",
    "mrava5",
    "mrava6",
    "mrava7",
    "mrava8",
    "mrava9",
    "mravamis",
    "mravb1",
    "mravb10",
    "mravb11",
    "mravb12",
    "mravb2",
    "mravb3",
    "mravb4",
    "mravb5",
    "mravb6",
    "mravb7",
    "mravb8",
    "mravb9",
    "mravbmis"
  ),
  `G` = c(
    "mraabmis",
    "mrava1",
    "mrava10",
    "mrava11",
    "mrava12",
    "mrava2",
    "mrava3",
    "mrava4",
    "mrava5",
    "mrava6",
    "mrava7",
    "mrava8",
    "mrava9",
    "mravamis",
    "mravb1",
    "mravb10",
    "mravb11",
    "mravb12",
    "mravb2",
    "mravb3",
    "mravb4",
    "mravb5",
    "mravb6",
    "mravb7",
    "mravb8",
    "mravb9",
    "mravbmis"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    raabmis = "#N of missing answers total test",
    rava1 = "C. Raven Section A: item 1",
    rava10 = "C. Raven Section A: item 10",
    rava11 = "C. Raven Section A: item 11",
    rava12 = "C. Raven Section A: item 12",
    rava2 = "C. Raven Section A: item 2",
    rava3 = "C. Raven Section A: item 3",
    rava4 = "C. Raven Section A: item 4",
    rava5 = "C. Raven Section A: item 5",
    rava6 = "C. Raven Section A: item 6",
    rava7 = "C. Raven Section A: item 7",
    rava8 = "C. Raven Section A: item 8",
    rava9 = "C. Raven Section A: item 9",
    ravamis = "#N of missing answers first (A) Raven test",
    ravb1 = "C. Raven Section B: item 1",
    ravb10 = "C. Raven Section B: item 10",
    ravb11 = "C. Raven Section B: item 11",
    ravb12 = "C. Raven Section B: item 12",
    ravb2 = "C. Raven Section A: item 2",
    ravb3 = "C. Raven Section B: item 3",
    ravb4 = "C. Raven Section B: item 4",
    ravb5 = "C. Raven Section B: item 5",
    ravb6 = "C. Raven Section B: item 6",
    ravb7 = "C. Raven Section B: item 7",
    ravb8 = "C. Raven Section B: item 8",
    ravb9 = "C. Raven Section B: item 9",
    ravbmis = "#N of missing answers second (B) Raven test"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    raabmis = "# of missing answers total test",
    rava1 = "C. Raven Section A: item 1",
    rava10 = "C. Raven Section A: item 10",
    rava11 = "C. Raven Section A: item 11",
    rava12 = "C. Raven Section A: item 12",
    rava2 = "C. Raven Section A: item 2",
    rava3 = "C. Raven Section A: item 3",
    rava4 = "C. Raven Section A: item 4",
    rava5 = "C. Raven Section A: item 5",
    rava6 = "C. Raven Section A: item 6",
    rava7 = "C. Raven Section A: item 7",
    rava8 = "C. Raven Section A: item 8",
    rava9 = "C. Raven Section A: item 9",
    ravamis = "# of missing answers first Raven test (A)",
    ravb1 = "C. Raven Section B: item 1",
    ravb10 = "C. Raven Section B: item 10",
    ravb11 = "C. Raven Section B: item 11",
    ravb12 = "C. Raven Section B: item 12",
    ravb2 = "C. Raven Section A: item 2",
    ravb3 = "C. Raven Section B: item 3",
    ravb4 = "C. Raven Section B: item 4",
    ravb5 = "C. Raven Section B: item 5",
    ravb6 = "C. Raven Section B: item 6",
    ravb7 = "C. Raven Section B: item 7",
    ravb8 = "C. Raven Section B: item 8",
    ravb9 = "C. Raven Section B: item 9",
    ravbmis = "# of missing answers second Raven test (B)"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    raabmis = "# of missing answers total test",
    rava1 = "C. Raven Section A: item 1",
    rava10 = "C. Raven Section A: item 10",
    rava11 = "C. Raven Section A: item 11",
    rava12 = "C. Raven Section A: item 12",
    rava2 = "C. Raven Section A: item 2",
    rava3 = "C. Raven Section A: item 3",
    rava4 = "C. Raven Section A: item 4",
    rava5 = "C. Raven Section A: item 5",
    rava6 = "C. Raven Section A: item 6",
    rava7 = "C. Raven Section A: item 7",
    rava8 = "C. Raven Section A: item 8",
    rava9 = "C. Raven Section A: item 9",
    ravamis = "# of missing answers first Raven test (A)",
    ravb1 = "C. Raven Section B: item 1",
    ravb10 = "C. Raven Section B: item 10",
    ravb11 = "C. Raven Section B: item 11",
    ravb12 = "C. Raven Section B: item 12",
    ravb2 = "C. Raven Section A: item 2",
    ravb3 = "C. Raven Section B: item 3",
    ravb4 = "C. Raven Section B: item 4",
    ravb5 = "C. Raven Section B: item 5",
    ravb6 = "C. Raven Section B: item 6",
    ravb7 = "C. Raven Section B: item 7",
    ravb8 = "C. Raven Section B: item 8",
    ravb9 = "C. Raven Section B: item 9",
    ravbmis = "# of missing answers second Raven test (B)"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    mraabmis = "# of missing answers total test",
    mrava1 = "C. Raven Section A: item 1",
    mrava10 = "C. Raven Section A: item 10",
    mrava11 = "C. Raven Section A: item 11",
    mrava12 = "C. Raven Section A: item 12",
    mrava2 = "C. Raven Section A: item 2",
    mrava3 = "C. Raven Section A: item 3",
    mrava4 = "C. Raven Section A: item 4",
    mrava5 = "C. Raven Section A: item 5",
    mrava6 = "C. Raven Section A: item 6",
    mrava7 = "C. Raven Section A: item 7",
    mrava8 = "C. Raven Section A: item 8",
    mrava9 = "C. Raven Section A: item 9",
    mravamis = "# of missing answers first Raven test (A)",
    mravb1 = "C. Raven Section B: item 1",
    mravb10 = "C. Raven Section B: item 10",
    mravb11 = "C. Raven Section B: item 11",
    mravb12 = "C. Raven Section B: item 12",
    mravb2 = "C. Raven Section A: item 2",
    mravb3 = "C. Raven Section B: item 3",
    mravb4 = "C. Raven Section B: item 4",
    mravb5 = "C. Raven Section B: item 5",
    mravb6 = "C. Raven Section B: item 6",
    mravb7 = "C. Raven Section B: item 7",
    mravb8 = "C. Raven Section B: item 8",
    mravb9 = "C. Raven Section B: item 9",
    mravbmis = "# of missing answers second Raven test (B)"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    mraabmis = "# of missing answers total test",
    mrava1 = "C. Raven Section A: item 1",
    mrava10 = "C. Raven Section A: item 10",
    mrava11 = "C. Raven Section A: item 11",
    mrava12 = "C. Raven Section A: item 12",
    mrava2 = "C. Raven Section A: item 2",
    mrava3 = "C. Raven Section A: item 3",
    mrava4 = "C. Raven Section A: item 4",
    mrava5 = "C. Raven Section A: item 5",
    mrava6 = "C. Raven Section A: item 6",
    mrava7 = "C. Raven Section A: item 7",
    mrava8 = "C. Raven Section A: item 8",
    mrava9 = "C. Raven Section A: item 9",
    mravamis = "# of missing answers first Raven test (A)",
    mravb1 = "C. Raven Section B: item 1",
    mravb10 = "C. Raven Section B: item 10",
    mravb11 = "C. Raven Section B: item 11",
    mravb12 = "C. Raven Section B: item 12",
    mravb2 = "C. Raven Section A: item 2",
    mravb3 = "C. Raven Section B: item 3",
    mravb4 = "C. Raven Section B: item 4",
    mravb5 = "C. Raven Section B: item 5",
    mravb6 = "C. Raven Section B: item 6",
    mravb7 = "C. Raven Section B: item 7",
    mravb8 = "C. Raven Section B: item 8",
    mravb9 = "C. Raven Section B: item 9",
    mravbmis = "# of missing answers second Raven test (B)"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    mraabmis = "# of missing answers total test",
    mrava1 = "C. Raven Section A: item 1",
    mrava10 = "C. Raven Section A: item 10",
    mrava11 = "C. Raven Section A: item 11",
    mrava12 = "C. Raven Section A: item 12",
    mrava2 = "C. Raven Section A: item 2",
    mrava3 = "C. Raven Section A: item 3",
    mrava4 = "C. Raven Section A: item 4",
    mrava5 = "C. Raven Section A: item 5",
    mrava6 = "C. Raven Section A: item 6",
    mrava7 = "C. Raven Section A: item 7",
    mrava8 = "C. Raven Section A: item 8",
    mrava9 = "C. Raven Section A: item 9",
    mravamis = "# of missing answers first Raven test (A)",
    mravb1 = "C. Raven Section B: item 1",
    mravb10 = "C. Raven Section B: item 10",
    mravb11 = "C. Raven Section B: item 11",
    mravb12 = "C. Raven Section B: item 12",
    mravb2 = "C. Raven Section A: item 2",
    mravb3 = "C. Raven Section B: item 3",
    mravb4 = "C. Raven Section B: item 4",
    mravb5 = "C. Raven Section B: item 5",
    mravb6 = "C. Raven Section B: item 6",
    mravb7 = "C. Raven Section B: item 7",
    mravb8 = "C. Raven Section B: item 8",
    mravb9 = "C. Raven Section B: item 9",
    mravbmis = "# of missing answers second Raven test (B)"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    mraabmis = "# of missing answers total test",
    mrava1 = "C. Raven Section A: item 1",
    mrava10 = "C. Raven Section A: item 10",
    mrava11 = "C. Raven Section A: item 11",
    mrava12 = "C. Raven Section A: item 12",
    mrava2 = "C. Raven Section A: item 2",
    mrava3 = "C. Raven Section A: item 3",
    mrava4 = "C. Raven Section A: item 4",
    mrava5 = "C. Raven Section A: item 5",
    mrava6 = "C. Raven Section A: item 6",
    mrava7 = "C. Raven Section A: item 7",
    mrava8 = "C. Raven Section A: item 8",
    mrava9 = "C. Raven Section A: item 9",
    mravamis = "# of missing answers first Raven test (A)",
    mravb1 = "C. Raven Section B: item 1",
    mravb10 = "C. Raven Section B: item 10",
    mravb11 = "C. Raven Section B: item 11",
    mravb12 = "C. Raven Section B: item 12",
    mravb2 = "C. Raven Section A: item 2",
    mravb3 = "C. Raven Section B: item 3",
    mravb4 = "C. Raven Section B: item 4",
    mravb5 = "C. Raven Section B: item 5",
    mravb6 = "C. Raven Section B: item 6",
    mravb7 = "C. Raven Section B: item 7",
    mravb8 = "C. Raven Section B: item 8",
    mravb9 = "C. Raven Section B: item 9",
    mravbmis = "# of missing answers second Raven test (B)"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mraabmis = c(
    default_missing_labels[c("-2")]
  ),
  mrava1 = c(
    default_missing_labels[c("-2", "-1")],
    `4` = "correct"
  ),
  mrava10 = c(
    default_missing_labels[c("-2", "-1")],
    `3` = "correct"
  ),
  mrava11 = c(
    default_missing_labels[c("-2", "-1")],
    `4` = "correct"
  ),
  mrava12 = c(
    default_missing_labels[c("-2", "-1")],
    `5` = "correct"
  ),
  mrava2 = c(
    default_missing_labels[c("-2", "-1")],
    `5` = "correct"
  ),
  mrava3 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "correct"
  ),
  mrava4 = c(
    default_missing_labels[c("-2", "-1")],
    `2` = "correct"
  ),
  mrava5 = c(
    default_missing_labels[c("-2", "-1")],
    `6` = "correct"
  ),
  mrava6 = c(
    default_missing_labels[c("-2", "-1")],
    `3` = "correct"
  ),
  mrava7 = c(
    default_missing_labels[c("-2", "-1")],
    `6` = "correct"
  ),
  mrava8 = c(
    default_missing_labels[c("-2", "-1")],
    `2` = "correct"
  ),
  mrava9 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "correct"
  ),
  mravamis = c(
    default_missing_labels[c("-2")]
  ),
  mravb1 = c(
    default_missing_labels[c("-2", "-1")],
    `2` = "correct"
  ),
  mravb10 = c(
    default_missing_labels[c("-2", "-1")],
    `3` = "correct"
  ),
  mravb11 = c(
    default_missing_labels[c("-2", "-1")],
    `4` = "correct"
  ),
  mravb12 = c(
    default_missing_labels[c("-2", "-1")],
    `5` = "correct"
  ),
  mravb2 = c(
    default_missing_labels[c("-2", "-1")],
    `6` = "correct"
  ),
  mravb3 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "correct"
  ),
  mravb4 = c(
    default_missing_labels[c("-2", "-1")],
    `2` = "correct"
  ),
  mravb5 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "correct"
  ),
  mravb6 = c(
    default_missing_labels[c("-2", "-1")],
    `3` = "correct"
  ),
  mravb7 = c(
    default_missing_labels[c("-2", "-1")],
    `5` = "correct"
  ),
  mravb8 = c(
    default_missing_labels[c("-2", "-1")],
    `6` = "correct"
  ),
  mravb9 = c(
    default_missing_labels[c("-2", "-1")],
    `4` = "correct"
  ),
  mravbmis = c(
    default_missing_labels[c("-2")]
  ),
  raabmis = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")]
  ),
  rava1 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `4` = "correct"
  ),
  rava10 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `3` = "correct"
  ),
  rava11 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `4` = "correct"
  ),
  rava12 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `5` = "correct"
  ),
  rava2 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `5` = "correct"
  ),
  rava3 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `1` = "correct"
  ),
  rava4 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `2` = "correct"
  ),
  rava5 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `6` = "correct"
  ),
  rava6 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `3` = "correct"
  ),
  rava7 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `6` = "correct"
  ),
  rava8 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `2` = "correct"
  ),
  rava9 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `1` = "correct"
  ),
  ravamis = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")]
  ),
  ravb1 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `2` = "correct"
  ),
  ravb10 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `3` = "correct"
  ),
  ravb11 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `4` = "correct"
  ),
  ravb12 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `5` = "correct"
  ),
  ravb2 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `6` = "correct"
  ),
  ravb3 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `1` = "correct"
  ),
  ravb4 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `2` = "correct"
  ),
  ravb5 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `1` = "correct"
  ),
  ravb6 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `3` = "correct"
  ),
  ravb7 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `5` = "correct"
  ),
  ravb8 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `6` = "correct"
  ),
  ravb9 = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")],
    `4` = "correct"
  ),
  ravbmis = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-2", "-1")]
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    raabmis = .replace_labels(
    standardized_value_labels$raabmis,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    rava1 = .replace_labels(
    standardized_value_labels$rava1,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    rava10 = .replace_labels(
    standardized_value_labels$rava10,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    rava11 = .replace_labels(
    standardized_value_labels$rava11,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    rava12 = .replace_labels(
    standardized_value_labels$rava12,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    rava2 = .replace_labels(
    standardized_value_labels$rava2,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    rava3 = .replace_labels(
    standardized_value_labels$rava3,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    rava4 = .replace_labels(
    standardized_value_labels$rava4,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    rava5 = .replace_labels(
    standardized_value_labels$rava5,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    rava6 = .replace_labels(
    standardized_value_labels$rava6,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    rava7 = .replace_labels(
    standardized_value_labels$rava7,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    rava8 = .replace_labels(
    standardized_value_labels$rava8,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    rava9 = .replace_labels(
    standardized_value_labels$rava9,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravamis = .replace_labels(
    standardized_value_labels$ravamis,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravb1 = .replace_labels(
    standardized_value_labels$ravb1,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravb10 = .replace_labels(
    standardized_value_labels$ravb10,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravb11 = .replace_labels(
    standardized_value_labels$ravb11,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravb12 = .replace_labels(
    standardized_value_labels$ravb12,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravb2 = .replace_labels(
    standardized_value_labels$ravb2,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravb3 = .replace_labels(
    standardized_value_labels$ravb3,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravb4 = .replace_labels(
    standardized_value_labels$ravb4,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravb5 = .replace_labels(
    standardized_value_labels$ravb5,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravb6 = .replace_labels(
    standardized_value_labels$ravb6,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravb7 = .replace_labels(
    standardized_value_labels$ravb7,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravb8 = .replace_labels(
    standardized_value_labels$ravb8,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravb9 = .replace_labels(
    standardized_value_labels$ravb9,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  ),
    ravbmis = .replace_labels(
    standardized_value_labels$ravbmis,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-2` = "na, see BRMCRAV in LASAB222"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    raabmis = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222"),
    rava1 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `4` = "correct"),
    rava10 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `3` = "correct"),
    rava11 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `4` = "correct"),
    rava12 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `5` = "correct"),
    rava2 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `5` = "correct"),
    rava3 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `1` = "correct"),
    rava4 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `2` = "correct"),
    rava5 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `6` = "correct"),
    rava6 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `3` = "correct"),
    rava7 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `6` = "correct"),
    rava8 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `2` = "correct"),
    rava9 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `1` = "correct"),
    ravamis = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222"),
    ravb1 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `2` = "correct"),
    ravb10 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `3` = "correct"),
    ravb11 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `4` = "correct"),
    ravb12 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `5` = "correct"),
    ravb2 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `6` = "correct"),
    ravb3 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `1` = "correct"),
    ravb4 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `2` = "correct"),
    ravb5 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `1` = "correct"),
    ravb6 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `3` = "correct"),
    ravb7 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `5` = "correct"),
    ravb8 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `6` = "correct"),
    ravb9 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `4` = "correct"),
    ravbmis = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222")
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    raabmis = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222"),
    rava1 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `4` = "correct"),
    rava10 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `3` = "correct"),
    rava11 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `4` = "correct"),
    rava12 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `5` = "correct"),
    rava2 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `5` = "correct"),
    rava3 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `1` = "correct"),
    rava4 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `2` = "correct"),
    rava5 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `6` = "correct"),
    rava6 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `3` = "correct"),
    rava7 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `6` = "correct"),
    rava8 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `2` = "correct"),
    rava9 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `1` = "correct"),
    ravamis = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222"),
    ravb1 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `2` = "correct"),
    ravb10 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `3` = "correct"),
    ravb11 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `4` = "correct"),
    ravb12 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `5` = "correct"),
    ravb2 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `6` = "correct"),
    ravb3 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `1` = "correct"),
    ravb4 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `2` = "correct"),
    ravb5 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `1` = "correct"),
    ravb6 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `3` = "correct"),
    ravb7 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `5` = "correct"),
    ravb8 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `6` = "correct"),
    ravb9 = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `4` = "correct"),
    ravbmis = c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    mraabmis = .replace_labels(
    standardized_value_labels$mraabmis,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava1 = .replace_labels(
    standardized_value_labels$mrava1,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava10 = .replace_labels(
    standardized_value_labels$mrava10,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava11 = .replace_labels(
    standardized_value_labels$mrava11,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava12 = .replace_labels(
    standardized_value_labels$mrava12,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava2 = .replace_labels(
    standardized_value_labels$mrava2,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava3 = .replace_labels(
    standardized_value_labels$mrava3,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava4 = .replace_labels(
    standardized_value_labels$mrava4,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava5 = .replace_labels(
    standardized_value_labels$mrava5,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava6 = .replace_labels(
    standardized_value_labels$mrava6,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava7 = .replace_labels(
    standardized_value_labels$mrava7,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava8 = .replace_labels(
    standardized_value_labels$mrava8,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava9 = .replace_labels(
    standardized_value_labels$mrava9,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravamis = .replace_labels(
    standardized_value_labels$mravamis,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb1 = .replace_labels(
    standardized_value_labels$mravb1,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb10 = .replace_labels(
    standardized_value_labels$mravb10,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb11 = .replace_labels(
    standardized_value_labels$mravb11,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb12 = .replace_labels(
    standardized_value_labels$mravb12,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb2 = .replace_labels(
    standardized_value_labels$mravb2,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb3 = .replace_labels(
    standardized_value_labels$mravb3,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb4 = .replace_labels(
    standardized_value_labels$mravb4,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb5 = .replace_labels(
    standardized_value_labels$mravb5,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb6 = .replace_labels(
    standardized_value_labels$mravb6,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb7 = .replace_labels(
    standardized_value_labels$mravb7,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb8 = .replace_labels(
    standardized_value_labels$mravb8,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb9 = .replace_labels(
    standardized_value_labels$mravb9,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravbmis = .replace_labels(
    standardized_value_labels$mravbmis,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    mrava1 = .replace_labels(
    standardized_value_labels$mrava1,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mrava10 = .replace_labels(
    standardized_value_labels$mrava10,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mrava11 = .replace_labels(
    standardized_value_labels$mrava11,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mrava12 = .replace_labels(
    standardized_value_labels$mrava12,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mrava2 = .replace_labels(
    standardized_value_labels$mrava2,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mrava3 = .replace_labels(
    standardized_value_labels$mrava3,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mrava4 = .replace_labels(
    standardized_value_labels$mrava4,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mrava5 = .replace_labels(
    standardized_value_labels$mrava5,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mrava6 = .replace_labels(
    standardized_value_labels$mrava6,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mrava7 = .replace_labels(
    standardized_value_labels$mrava7,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mrava8 = .replace_labels(
    standardized_value_labels$mrava8,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mrava9 = .replace_labels(
    standardized_value_labels$mrava9,
    `-2` = "na, see C/DRMCRAV in LAS2B222"
  ),
    mravb1 = .replace_labels(
    standardized_value_labels$mravb1,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mravb10 = .replace_labels(
    standardized_value_labels$mravb10,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mravb11 = .replace_labels(
    standardized_value_labels$mravb11,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mravb12 = .replace_labels(
    standardized_value_labels$mravb12,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mravb2 = .replace_labels(
    standardized_value_labels$mravb2,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mravb3 = .replace_labels(
    standardized_value_labels$mravb3,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mravb4 = .replace_labels(
    standardized_value_labels$mravb4,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mravb5 = .replace_labels(
    standardized_value_labels$mravb5,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mravb6 = .replace_labels(
    standardized_value_labels$mravb6,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mravb7 = .replace_labels(
    standardized_value_labels$mravb7,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mravb8 = .replace_labels(
    standardized_value_labels$mravb8,
    `-2` = "na, see BRMCRAV in LAS2B222"
  ),
    mravb9 = .replace_labels(
    standardized_value_labels$mravb9,
    `-2` = "na, see BRMCRAV in LAS2B222"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    mraabmis = .replace_labels(
    standardized_value_labels$mraabmis,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava1 = .replace_labels(
    standardized_value_labels$mrava1,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava10 = .replace_labels(
    standardized_value_labels$mrava10,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava11 = .replace_labels(
    standardized_value_labels$mrava11,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava12 = .replace_labels(
    standardized_value_labels$mrava12,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava2 = .replace_labels(
    standardized_value_labels$mrava2,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava3 = .replace_labels(
    standardized_value_labels$mrava3,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava4 = .replace_labels(
    standardized_value_labels$mrava4,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava5 = .replace_labels(
    standardized_value_labels$mrava5,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava6 = .replace_labels(
    standardized_value_labels$mrava6,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava7 = .replace_labels(
    standardized_value_labels$mrava7,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava8 = .replace_labels(
    standardized_value_labels$mrava8,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava9 = .replace_labels(
    standardized_value_labels$mrava9,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravamis = .replace_labels(
    standardized_value_labels$mravamis,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb1 = .replace_labels(
    standardized_value_labels$mravb1,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb10 = .replace_labels(
    standardized_value_labels$mravb10,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb11 = .replace_labels(
    standardized_value_labels$mravb11,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb12 = .replace_labels(
    standardized_value_labels$mravb12,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb2 = .replace_labels(
    standardized_value_labels$mravb2,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb3 = .replace_labels(
    standardized_value_labels$mravb3,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb4 = .replace_labels(
    standardized_value_labels$mravb4,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb5 = .replace_labels(
    standardized_value_labels$mravb5,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb6 = .replace_labels(
    standardized_value_labels$mravb6,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb7 = .replace_labels(
    standardized_value_labels$mravb7,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb8 = .replace_labels(
    standardized_value_labels$mravb8,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb9 = .replace_labels(
    standardized_value_labels$mravb9,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravbmis = .replace_labels(
    standardized_value_labels$mravbmis,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    mraabmis = .replace_labels(
    standardized_value_labels$mraabmis,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava1 = .replace_labels(
    standardized_value_labels$mrava1,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava10 = .replace_labels(
    standardized_value_labels$mrava10,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava11 = .replace_labels(
    standardized_value_labels$mrava11,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava12 = .replace_labels(
    standardized_value_labels$mrava12,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava2 = .replace_labels(
    standardized_value_labels$mrava2,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava3 = .replace_labels(
    standardized_value_labels$mrava3,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava4 = .replace_labels(
    standardized_value_labels$mrava4,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava5 = .replace_labels(
    standardized_value_labels$mrava5,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava6 = .replace_labels(
    standardized_value_labels$mrava6,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava7 = .replace_labels(
    standardized_value_labels$mrava7,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava8 = .replace_labels(
    standardized_value_labels$mrava8,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mrava9 = .replace_labels(
    standardized_value_labels$mrava9,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravamis = .replace_labels(
    standardized_value_labels$mravamis,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb1 = .replace_labels(
    standardized_value_labels$mravb1,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb10 = .replace_labels(
    standardized_value_labels$mravb10,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb11 = .replace_labels(
    standardized_value_labels$mravb11,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb12 = .replace_labels(
    standardized_value_labels$mravb12,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb2 = .replace_labels(
    standardized_value_labels$mravb2,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb3 = .replace_labels(
    standardized_value_labels$mravb3,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb4 = .replace_labels(
    standardized_value_labels$mravb4,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb5 = .replace_labels(
    standardized_value_labels$mravb5,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb6 = .replace_labels(
    standardized_value_labels$mravb6,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb7 = .replace_labels(
    standardized_value_labels$mravb7,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb8 = .replace_labels(
    standardized_value_labels$mravb8,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravb9 = .replace_labels(
    standardized_value_labels$mravb9,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  ),
    mravbmis = .replace_labels(
    standardized_value_labels$mravbmis,
    `-2` = "na, see E/F/GMRMCRAV in LASAF/G222"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mraabmis = "numeric",
  mrava1 = "categorical",
  mrava10 = "categorical",
  mrava11 = "categorical",
  mrava12 = "categorical",
  mrava2 = "categorical",
  mrava3 = "categorical",
  mrava4 = "categorical",
  mrava5 = "categorical",
  mrava6 = "categorical",
  mrava7 = "categorical",
  mrava8 = "categorical",
  mrava9 = "categorical",
  mravamis = "numeric",
  mravb1 = "categorical",
  mravb10 = "categorical",
  mravb11 = "categorical",
  mravb12 = "categorical",
  mravb2 = "categorical",
  mravb3 = "categorical",
  mravb4 = "categorical",
  mravb5 = "categorical",
  mravb6 = "categorical",
  mravb7 = "categorical",
  mravb8 = "categorical",
  mravb9 = "categorical",
  mravbmis = "numeric",
  raabmis = "numeric",
  rava1 = "categorical",
  rava10 = "categorical",
  rava11 = "categorical",
  rava12 = "categorical",
  rava2 = "categorical",
  rava3 = "categorical",
  rava4 = "categorical",
  rava5 = "categorical",
  rava6 = "categorical",
  rava7 = "categorical",
  rava8 = "categorical",
  rava9 = "categorical",
  ravamis = "numeric",
  ravb1 = "categorical",
  ravb10 = "categorical",
  ravb11 = "categorical",
  ravb12 = "categorical",
  ravb2 = "categorical",
  ravb3 = "categorical",
  ravb4 = "categorical",
  ravb5 = "categorical",
  ravb6 = "categorical",
  ravb7 = "categorical",
  ravb8 = "categorical",
  ravb9 = "categorical",
  ravbmis = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "022", waves = .lasa_wave_rows()) |>
    .override_label(wave = "E", variable = "mraabmis", override_value = "emrabmis") |>
    .override_label(wave = "F", variable = "mraabmis", override_value = "fmrabmis") |>
    .override_label(wave = "G", variable = "mraabmis", override_value = "gmrabmis"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "022", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "022", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "022", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["mraabmis"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mravamis"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mravbmis"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)

.lasa_fc_022 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

