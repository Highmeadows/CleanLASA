
# Define waves and their corresponding prefixes for variable identification
wave_prefix = c(
  # Wave-name = wave-prefix on variable names
  `B` = "b",
  `C` = "c",
  `D` = "d",
  `E` = "e",
  `2B` = "b",
  `F` = "f",
  `G` = "g",
  `H` = "h",
  `3B` = "b",
  `MB` = "b",
  `I` = "i",
  `J` = "j",
  `K` = "k",
  `all` = ""
  )

# Identifiers
## To match variable names, labels, and value labels to the dataset. Internal identifiers used for matching label databases
file_identifiers = c("filecode", "LASA_Wave")
## To match respondents over time and across datafiles. Real variables used in analyses
resp_identifiers = c("respnr", "Wave")

# list of ALL the potentially available variables across waves for this specific filecode, coded in their canonical/ wave-independent names
## Note these variables do not have to present in each wave, but are all the unque variabels when combining all waves.
canonical_name = c(
  "lphya01",
  "lphya02",
  "lphya03",
  "lphya04",
  "lphya05",
  "lphya06",
  "lphya07",
  "lphya08",
  "lphya09",
  "lphya10",
  "lphya11",
  "lphya12",
  "lphya13",
  "lphya14",
  "lphya15",
  "lphya16",
  "lphya17",
  "lphya18",
  "lphya19",
  "lphya20",
  "lphyasp",
  "lphya21",
  "lphya22",
  "lphya23",
  "lphya24",
  "lphya25",
  "lphya26",
  "lphya27",
  "lphya28",
  "lphya29",
  "lphya30",
  "lspin1",
  "lspin2",
  "lspin3",
  "lphya31",
  "lphya32",
  "lphya33",
  "lphya34",
  "lphya35",
  "lphya36",
  "lphya37",
  "lphya38",
  "lphya39",
  "lphya40",
  "lphya41",
  "lphya42",
  "lphya43",
  "lphya44",
  "lphya45",
  "lphya46",
  "lphya47",
  "lphya48",
  "lphya49",
  "lphya50"
)

# File identifiers, respondent identifiers, and canonical names are used to construct the different label data bases.
## File identifiers will be constant and used for matching the different databases to a real dataset for applying the labels
## The datasets will consist of one row for each wave, with an additional row for the artificial Z-wave
## The columns will consist of the file identifiers, respondent identifiers, and the canonical names
## Cells in the columns for respondent identifiers and canonical names will be filled with their corresponding wave-specific values.
## these values depend on the sub-database, and are either 1) variable names, 2) variable labels, or 3) value labels
## the artifical Z-wave presents the harmonized values that can be applied across all waves when standardizing names and/or labels.


# variable names ----
## create an empty dataset for the variable names
var_names = as.data.frame(matrix(
  nrow = length(wave_prefix),
  ncol = length(c(file_identifiers, resp_identifiers, canonical_name))
  ))
## set the column names
names(var_names) = c(file_identifiers, resp_identifiers, canonical_name)

# constant filecode identifiers
var_names["filecode"] = "046"
var_names["LASA_Wave"] = names(wave_prefix)
# respondent identifiers
var_names["respnr"] = "respnr"
var_names["Wave"] = names(wave_prefix)

# apply the expected wave-specific names
for (i in 1:length(wave_prefix)){
  var_names[i,canonical_name] <- c(
    paste0(wave_prefix[i], canonical_name) # wave-specific variable names
  )
}
# Exceptions / deviations of expected naming convention (Retrieved from the corresponding varinfo file)
.override_label <- function(database, wave, variable, override_value){
  database2 <- database
  row <- match(wave, database2$LASA_Wave)
  column <- match(variable, colnames(database2))
  database2[row, variable] <- override_value
  return(database2)
}

## Example override
var_names <- var_names |>
  .override_label(wave = "3B", variable = "respnr",
                 override_value = "RespNr")



# variable labels ----
# filecode-specific labels but standardized across waves (as we expect the labels to remain (mostly) the same over time)
harmonized_labels <- c(
  `lphya01` = "label1",
  `lphya02` = "label2",
  `lphya03` = "variable label",
  `lphya04` = "variable label",
  `lphya05` = "variable label",
  `lphya06` = "variable label",
  `lphya07` = "variable label",
  `lphya08` = "variable label",
  `lphya09` = "variable label",
  `lphya10` = "variable label",
  `lphya11` = "variable label",
  `lphya12` = "variable label",
  `lphya13` = "variable label",
  `lphya14` = "variable label",
  `lphya15` = "variable label",
  `lphya16` = "variable label",
  `lphya17` = "variable label",
  `lphya18` = "variable label",
  `lphya19` = "variable label",
  `lphya20` = "variable label",
  `lphyasp` = "variable label",
  `lphya21` = "variable label",
  `lphya22` = "variable label",
  `lphya23` = "variable label",
  `lphya24` = "variable label",
  `lphya25` = "variable label",
  `lphya26` = "variable label",
  `lphya27` = "variable label",
  `lphya28` = "variable label",
  `lphya29` = "variable label",
  `lphya30` = "variable label",
  `lspin1` = "variable label",
  `lspin2` = "variable label",
  `lspin3` = "variable label",
  `lphya31` = "variable label",
  `lphya32` = "variable label",
  `lphya33` = "variable label",
  `lphya34` = "variable label",
  `lphya35` = "variable label",
  `lphya36` = "variable label",
  `lphya37` = "variable label",
  `lphya38` = "variable label",
  `lphya39` = "variable label",
  `lphya40` = "variable label",
  `lphya41` = "variable label",
  `lphya42` = "variable label",
  `lphya43` = "variable label",
  `lphya44` = "variable label",
  `lphya45` = "variable label",
  `lphya46` = "variable label",
  `lphya47` = "variable label",
  `lphya48` = "variable label",
  `lphya49` = "variable label",
  `lphya50` = "final_label"
)

.replace_labels <- function(original_labels, ...){
  list.args = c(...)
  targets = names(list.args)
  replacements = c(paste(list.args))
  updated_labels <- replace(x = original_labels,
                            list = match(targets, names(original_labels)),
                            values = replacements
                            )
  return(updated_labels)
}

# make a list of all the wave-specific labels.
# should be in the same order and of same length as wave-prefix
variable_labels_list <- list(
  Wave_B_labels = .replace_labels(harmonized_labels,
                          `lphya01` = "B-wave specific variation of lphya01",
                          `lphya02` = "Another wave-specific variation",
                          `lphya50` = "B-wave specific variation of lphya50"
                          ),
  Wave_C_labels = harmonized_labels, # when no adjustments are needed
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Wave_2B_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Wave_MB_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels # always end with all the harmonized/standardized labels for the artificial Z-wave
)


# apply the labels to a dataframe
## create ampty dataframe for the variable labels
var_labels = as.data.frame(matrix(
  nrow = length(wave_prefix),
  ncol = length(c(file_identifiers, resp_identifiers, canonical_name))
))
names(var_labels) = c(file_identifiers, resp_identifiers, canonical_name)

# filecode identifiers
var_labels["filecode"] = "046"
var_labels["LASA_Wave"] = names(wave_prefix)

# respondent identifiers
var_labels["respnr"] = "Respondent ID"
var_labels["Wave"] = "LASA measurement wave"

# wave-varying variable labels
for (i in 1:length(wave_prefix)){
  var_labels[i,canonical_name] <- variable_labels_list[[i]] # wave-specific variable labels
}


# value labels ----
## value labels database will have the same structure as variable names and variable label databases
## So one row per wave, with an additional 'z-wave', and one column for each existing variable in the filecode, with addition of the identifier columns

# data labels will consist of two 'sets' for each variable; a missing data set, and a observed values set
## harmonized answer options:

## missing data labels ----
missing_labels_5_levels <- c(
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-3` = "no answer, wrong skip",
  `-2` = "no answer, routing", # covers all varaints of "na, see {variable_name}"
  `-1` = "no answer, asked"
)

## observed data labels ----
no1_yes2 <- c(
  `1` = "no",
  `2` = "yes"
)


# build the list of variable specific values

standardized_value_labels <- list(
  `lphya01` = c(missing_labels_5_levels,
                no1_yes2
                ),
  `lphya02` = c(missing_labels_5_levels,
                `0` = "Don't know",
                no1_yes2
                )
  #"..." # all other variables with their standardized value labels
)


.replace_in_list <- function(original_list, ...){
  # args = c(...)
  # args.names = unique(gsub("\\.[^.]*$", "", names(args)))

  list.args = substitute(c(...))
  # list.args = x

  updated_list <- original_list

  for (i in 2:length(list.args)) {
    target = match(names(list.args)[i], names(original_list))

    updated_list[[target]] <- eval(parse(text=list.args[i]))
  }
  return(updated_list)
}




value_labels_list <- list(
  Wave_B_labels = .replace_in_list(standardized_value_labels,
                                  `lphya01` = .replace_labels(standardized_value_labels$lphya01,
                                                             `-3` = "B-wave specific missing-label",
                                                             `2` = "B-wave specific value-label"  ),
                                  `lphya02` = .replace_labels(standardized_value_labels$lphya02,
                                                             `-3` = "test3",
                                                             `2` = "test2")
  ),
  Wave_C_labels = standardized_value_labels, # when no adjustments are needed
  Wave_D_labels = standardized_value_labels,
  Wave_E_labels = standardized_value_labels,
  Wave_2B_labels = standardized_value_labels,
  Wave_F_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Wave_3B_labels = standardized_value_labels,
  Wave_MB_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

# empty dataframe

val_labels = as.data.frame(matrix(
  nrow = length(wave_prefix),
  ncol = length(c(file_identifiers, resp_identifiers, canonical_name))
))
names(val_labels) = c(file_identifiers, resp_identifiers, canonical_name)

# filecode identifiers - should always be the same for looking up correct values
val_labels["filecode"] = "046"
val_labels["LASA_Wave"] = names(wave_prefix)

# respondent identifiers
## can be left empty, respnr and wave do not have value labels

# wave-varying variable labels
for (i in 1:length(wave_prefix)){
  for(j in 1:length(value_labels_list[[1]])){
    col <- match( names(value_labels_list[[i]])[j] , names(val_labels))
    val_labels[i,col] <- as.character(value_labels_list[[i]][j]) # wave-specific variable labels
  }
}


# combine the filecode specific datsets into a new dataset for later application to a datafile.
.lasa_fc_046 <- list(
  variables = var_names,
  variable_labels = var_labels,
  value_labels = val_labels
)
