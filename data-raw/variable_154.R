## LASA filecode 154 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  msmokbef = NA_character_,
  msmokebef = "Did you smoke before",
  msmokecig = "do you smoke (self-rolled) cigarettes",
  msmokeciga = "do you smoke pipe/cigars",
  msmokeciganw = "Number of pipes/cigars a week",
  msmokecignw = "Number of (self-rolled) cigarettes a week",
  msmokecignwp = "(past) number of (self-rolled) cigarettes a week",
  msmokecigp = "(past) did you smoke (self\002rolled) cigarettes",
  msmokecigpnw = "(past) number of (self-rolled) cigarettes a week",
  msmokeecig = "Do you ever use an electronic cigarette",
  msmokeecigd = "Dosage electronic cigarette",
  msmokeecigf = "How often do you use the electronic cigarette",
  msmokeecigp = "(past) did you ever use an electronic cigarette",
  msmokeecigpf = "(past) how often did you use the electronic cigarette",
  msmokepipe = "Do you smoke pipe",
  msmokepm = "Number of packs (50 gr.) of pipe tobacco a month",
  msmokeqage = "At what age did you stop smoking",
  msmokesage = "At what age did you start smoking",
  msmokesh = "do you smoke self-rolled cigarettes",
  msmokeshnw = "Number of self-rolled cigarettes a week",
  msmokeyn = "Do you smoke"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c(
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokepipe",
    "msmokepm",
    "msmokeqage",
    "msmokesage",
    "msmokesh",
    "msmokeshnw",
    "msmokeyn"
  )],
    msmokecig = "Do you smoke cigarettes",
    msmokeciga = "Do you smoke cigars",
    msmokeciganw = "Number of cigars a week",
    msmokecignw = "Number of cigarettes a week",
    msmokepm = "Number of packets a month",
    msmokeqage = "When did you stop smoking: age",
    msmokesage = "When did you start smoking: age",
    msmokesh = "Do you smoke shag",
    msmokeshnw = "Number of shags a week"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c(
    "msmokebef",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokepipe",
    "msmokepm",
    "msmokeqage",
    "msmokesage",
    "msmokesh",
    "msmokeyn"
  )],
    msmokeciga = "smoking: cigars",
    msmokeciganw = "Number of cigars a week",
    msmokecignw = "Number of cigarettes or self-rolled a week",
    msmokesh = "smoking: cigarettes or shag"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c(
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokepipe",
    "msmokepm",
    "msmokeqage",
    "msmokesage",
    "msmokesh",
    "msmokeshnw",
    "msmokeyn"
  )],
    msmokecig = "do you smoke cigarettes",
    msmokeciga = "do you smoke cigars",
    msmokeciganw = "Number of cigars a week",
    msmokecignw = "Number of cigarettes a week",
    msmokepipe = "do you smoke pipe"
  ),
  Wave_E_labels = harmonized_labels[c(
    "msmokbef",
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecigp",
    "msmokecigpnw",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
  Wave_2B_labels = harmonized_labels[c(
    "msmokbef",
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecigp",
    "msmokecigpnw",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
  Wave_F_labels = harmonized_labels[c(
    "msmokbef",
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecigp",
    "msmokecigpnw",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
  Wave_G_labels = harmonized_labels[c(
    "msmokbef",
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecigp",
    "msmokecigpnw",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
  Wave_H_labels = harmonized_labels[c(
    "msmokbef",
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecigp",
    "msmokecigpnw",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
  Wave_MB_labels = .replace_labels(
    harmonized_labels[c("msmokebef", "msmokecignw", "msmokeqage", "msmokeyn")],
    msmokecignw = "Number of cigarettes a day",
    msmokeqage = "at what age did you stop smoking"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c(
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecignwp",
    "msmokecigp",
    "msmokeecig",
    "msmokeecigd",
    "msmokeecigf",
    "msmokeecigp",
    "msmokeecigpf",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
    msmokecig = "Do you smoke (self-rolled) cigarettes",
    msmokeciga = "Do you smoke pipe/cigars",
    msmokecigp = "(past) Did you smoke (self-rolled) cigarettes"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c(
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecignwp",
    "msmokecigp",
    "msmokeecig",
    "msmokeecigd",
    "msmokeecigf",
    "msmokeecigp",
    "msmokeecigpf",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
    msmokecig = "Do you smoke (self-rolled) cigarettes",
    msmokeciga = "Do you smoke pipe/cigars",
    msmokecigp = "(past) Did you smoke (self-rolled) cigarettes"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c(
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecignwp",
    "msmokecigp",
    "msmokeecig",
    "msmokeecigd",
    "msmokeecigf",
    "msmokeecigp",
    "msmokeecigpf",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
    msmokecig = "Do you smoke (self-rolled) cigarettes",
    msmokeciga = "Do you smoke pipe/cigars",
    msmokecigp = "(past) Did you smoke (self-rolled) cigarettes"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  msmokbef = c(`-1` = "na, asked"),
  msmokebef = c(
    `-4` = "no valid data",
    `-3` = "na, wrong skip",
    `-2` = "R smokes / na, see CMSMOKEYN",
    `-1` = "no answer, asked / na, short interview",
    `1` = "no",
    `2` = "yes"
  ),
  msmokecig = c(
    `-5` = "na, interview terminated",
    `-4` = "no valid data",
    `-3` = "na, wrong skip",
    `-2` = "R does not smoke / na, see DMSMOKEYN",
    `-1` = "no answer, asked",
    `1` = "no / yes",
    `2` = "yes / no"
  ),
  msmokeciga = c(
    `-5` = "na, interview terminated",
    `-4` = "no valid data",
    `-3` = "na, wrong skip",
    `-2` = "R does not smoke / na, see DMSMOKEYN",
    `-1` = "no answer, asked",
    `1` = "no / yes",
    `2` = "yes / no"
  ),
  msmokeciganw = c(
    `-4` = "no valid data",
    `-3` = "R does not smoke / na, wrong skip",
    `-2` = "R smokes, but not cigars / na, see CMSMOKECIGA / na, see",
    `-1` = "no answer, asked",
    `0` = "< 1 a week"
  ),
  msmokecignw = c(
    `-4` = "no valid data",
    `-3` = "R does not smoke / na, wrong skip",
    `-2` = "R smokes, but not cig / na, see CMSMOKESH",
    `-1` = "no answer, asked",
    `0` = "less than 1 a week",
    `1` = "1 or less a week / 1-20 cigarettes a day",
    `2` = "more than 20 cigarettes a day"
  ),
  msmokecignwp = c(`-2` = "na, see I/J/KMSMOKECIGP", `-1` = "na, asked", `0` = "< 1 a week"),
  msmokecigp = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see E/B/F/G/HMSMOKEYN",
    `-1` = "na, asked",
    `1` = "no / yes",
    `2` = "yes / no"
  ),
  msmokecigpnw = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  msmokeecig = c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  msmokeecigd = c(
    `-2` = "na, see I/J/KMSMOKEECIG",
    `1` = "no nicotine",
    `2` = "1-10 mg nicotine",
    `3` = "11-20 mg nicotine",
    `4` = "21-35 mg nicotine",
    `5` = ">36 mg nicotine"
  ),
  msmokeecigf = c(
    `-2` = "na, see I/J/KMSMOKEECIG",
    `1` = "most of the day",
    `2` = "a few times a day",
    `3` = "a few times a week",
    `4` = "a few times a month",
    `5` = "a few times a year"
  ),
  msmokeecigp = c(`-2` = "na, see I/J/KMSMOKEBEF / SMOKECIGP", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  msmokeecigpf = c(
    `-2` = "na, see I/J/KMSMOKEECIGP",
    `-1` = "na, asked",
    `1` = "most of the day",
    `2` = "a few times a day",
    `3` = "a few times a week",
    `4` = "a few times a month",
    `5` = "a few times a year"
  ),
  msmokepipe = c(
    `-5` = "na, interview terminated",
    `-4` = "no valid data",
    `-2` = "R does not smoke / na, see DMSMOKEYN",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
  msmokepm = c(
    `-4` = "no valid data",
    `-3` = "R does not smoke / na, wrong skip",
    `-2` = "R smokes, but not pipe / na, see CMSMOKEPIPE",
    `-1` = "no answer, asked"
  ),
  msmokeqage = c(
    `-4` = "no valid data",
    `-3` = "R smokes / na, wrong skip",
    `-2` = "R never smoked / na ,see CMSMOKEBEF / na, see DMSMOKEBEF / na, see",
    `-1` = "no answer, asked"
  ),
  msmokesage = c(
    `-4` = "no valid data",
    `-3` = "R smokes / na, wrong skip",
    `-2` = "R never smoked / na, see CMSMOKEYN /",
    `-1` = "no answer, asked"
  ),
  msmokesh = c(
    `-4` = "no valid data",
    `-3` = "na, wrong skip",
    `-2` = "R does not smoke / na, see CMSMOKEYN /",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
  msmokeshnw = c(
    `-4` = "no valid data",
    `-3` = "R does not smoke",
    `-2` = "R smokes, but not shag / na, see DMSMOKESH",
    `-1` = "no answer, asked"
  ),
  msmokeyn = c(
    `-5` = "na, interview terminated",
    `-4` = "no valid data",
    `-2` = "no answer, skipped",
    `-1` = "no answer, asked / na, short interview",
    `1` = "no",
    `2` = "yes"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokepipe",
    "msmokepm",
    "msmokeqage",
    "msmokesage",
    "msmokesh",
    "msmokeshnw",
    "msmokeyn"
  )],
    msmokebef = c(`-4` = "no valid data", `-2` = "R smokes", `-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    msmokecig = c(
    `-4` = "no valid data",
    `-2` = "R does not smoke",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    msmokeciga = c(
    `-4` = "no valid data",
    `-2` = "R does not smoke",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    msmokeciganw = c(
    `-4` = "no valid data",
    `-3` = "R does not smoke",
    `-2` = "R smokes, but not cigars",
    `-1` = "no answer, asked"
  ),
    msmokecignw = c(
    `-4` = "no valid data",
    `-3` = "R does not smoke",
    `-2` = "R smokes, but not cig",
    `-1` = "no answer, asked"
  ),
    msmokepipe = c(
    `-4` = "no valid data",
    `-2` = "R does not smoke",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    msmokepm = .replace_labels(
    standardized_value_labels$msmokepm,
    `-3` = "R does not smoke",
    `-2` = "R smokes, but not pipe"
  ),
    msmokeqage = .replace_labels(
    standardized_value_labels$msmokeqage,
    `-3` = "R smokes",
    `-2` = "R never smoked"
  ),
    msmokesage = .replace_labels(
    standardized_value_labels$msmokesage,
    `-3` = "R smokes",
    `-2` = "R never smoked"
  ),
    msmokesh = c(
    `-4` = "no valid data",
    `-2` = "R does not smoke",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    msmokeshnw = .replace_labels(
    standardized_value_labels$msmokeshnw,
    `-2` = "R smokes, but not shag"
  ),
    msmokeyn = c(
    `-4` = "no valid data",
    `-2` = "no answer, skipped",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "msmokebef",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokepipe",
    "msmokepm",
    "msmokeqage",
    "msmokesage",
    "msmokesh",
    "msmokeyn"
  )],
    msmokebef = c(`-3` = "na, wrong skip", `-2` = "na, see CMSMOKEYN", `1` = "no", `2` = "yes"),
    msmokeciga = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeciganw = c(`-3` = "na, wrong skip", `-2` = "na, see CMSMOKECIGA", `-1` = "na, asked"),
    msmokecignw = c(`-3` = "na, wrong skip", `-2` = "na, see CMSMOKESH", `-1` = "na, asked"),
    msmokepipe = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokepm = c(`-3` = "na, wrong skip", `-2` = "na, see CMSMOKEPIPE", `-1` = "na, asked"),
    msmokeqage = c(`-3` = "na, wrong skip", `-2` = "na ,see CMSMOKEBEF", `-1` = "na, asked"),
    msmokesage = c(`-3` = "na, wrong skip", `-2` = "na, see CMSMOKEYN /"),
    msmokesh = c(`-3` = "na, wrong skip", `-2` = "na, see CMSMOKEYN /"),
    msmokeyn = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokepipe",
    "msmokepm",
    "msmokeqage",
    "msmokesage",
    "msmokesh",
    "msmokeshnw",
    "msmokeyn"
  )],
    msmokebef = c(`-2` = "na, see DMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokecig = c(`-2` = "na, see DMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeciga = c(`-2` = "na, see DMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeciganw = c(`-2` = "na, see DMSMOKECIGA", `-1` = "na, asked"),
    msmokecignw = c(`-2` = "na, see DMSMOKECIG", `-1` = "na, asked"),
    msmokepipe = c(`-2` = "na, see DMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokepm = c(`-2` = "na, see DMSMOKEPIPE", `-1` = "na, asked"),
    msmokeqage = c(`-2` = "na, see DMSMOKEBEF", `-1` = "na, asked"),
    msmokesage = c(`-2` = "na, see DMSMOKEYN /"),
    msmokesh = c(`-2` = "na, see DMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeshnw = c(`-2` = "na, see DMSMOKESH", `-1` = "na, asked"),
    msmokeyn = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "msmokbef",
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecigp",
    "msmokecigpnw",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
    msmokebef = c(`-2` = "na, see E/B/F/G/HMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokecig = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeciga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see E/B/F/G/HMSMOKEYN",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
    msmokeciganw = c(`-2` = "na, see"),
    msmokecignw = c(
    `-2` = "na, see E/B/F/GMSMOKECIG",
    `-1` = "na, asked",
    `0` = "less than 1 a week",
    `1` = "1 or less a week"
  ),
    msmokecigp = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokecigpnw = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeqage = c(`-2` = "na, see"),
    msmokesage = c(`-2` = "na, see E/B/F/G/HSMOKEYN /SMOKEBEF", `-1` = "na, asked"),
    msmokeyn = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "msmokbef",
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecigp",
    "msmokecigpnw",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
    msmokebef = c(`-2` = "na, see E/B/F/G/HMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokecig = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeciga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see E/B/F/G/HMSMOKEYN",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
    msmokeciganw = c(`-2` = "na, see"),
    msmokecignw = c(
    `-2` = "na, see E/B/F/GMSMOKECIG",
    `-1` = "na, asked",
    `0` = "less than 1 a week",
    `1` = "1 or less a week"
  ),
    msmokecigp = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokecigpnw = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeqage = c(`-2` = "na, see"),
    msmokesage = c(`-2` = "na, see E/B/F/G/HSMOKEYN /SMOKEBEF", `-1` = "na, asked"),
    msmokeyn = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "msmokbef",
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecigp",
    "msmokecigpnw",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
    msmokebef = c(`-2` = "na, see E/B/F/G/HMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokecig = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeciga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see E/B/F/G/HMSMOKEYN",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
    msmokeciganw = c(`-2` = "na, see"),
    msmokecignw = c(`-2` = "na, see E/B/F/GMSMOKECIG", `-1` = "na, asked"),
    msmokecigp = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokecigpnw = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeqage = c(`-2` = "na, see"),
    msmokesage = c(`-2` = "na, see E/B/F/G/HSMOKEYN /SMOKEBEF", `-1` = "na, asked"),
    msmokeyn = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "msmokbef",
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecigp",
    "msmokecigpnw",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
    msmokebef = c(`-2` = "na, see E/B/F/G/HMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokecig = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeciga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see E/B/F/G/HMSMOKEYN",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
    msmokeciganw = c(`-2` = "na, see"),
    msmokecignw = c(`-2` = "na, see E/B/F/GMSMOKECIG", `-1` = "na, asked"),
    msmokecigp = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokecigpnw = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeqage = c(`-2` = "na, see"),
    msmokesage = c(`-2` = "na, see E/B/F/G/HSMOKEYN /SMOKEBEF", `-1` = "na, asked"),
    msmokeyn = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "msmokbef",
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecigp",
    "msmokecigpnw",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
    msmokebef = c(`-2` = "na, see E/B/F/G/HMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokecig = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see E/B/F/GSMOKEYN",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
    msmokeciga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see E/B/F/G/HMSMOKEYN",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
    msmokeciganw = c(`-2` = "na, see"),
    msmokecigp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see E/B/F/G/HMSMOKEYN",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
    msmokecigpnw = c(`-3` = "na, wrong skip", `-2` = "na, see"),
    msmokeqage = c(`-2` = "na, see"),
    msmokesage = c(`-2` = "na, see E/B/F/G/HSMOKEYN /SMOKEBEF", `-1` = "na, asked"),
    msmokeyn = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c("msmokebef", "msmokecignw", "msmokeqage", "msmokeyn")],
    msmokebef = c(`-2` = "na, see BMSMOKEYN /"),
    msmokecignw = c(
    `-2` = "na, see BMSMOKEYN",
    `-1` = "na, asked",
    `1` = "1-20 cigarettes a day",
    `2` = "more than 20 cigarettes a day"
  ),
    msmokeqage = c(`-2` = "na, see BMSMOKEBEF", `-1` = "na, asked"),
    msmokeyn = c(`-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecignwp",
    "msmokecigp",
    "msmokeecig",
    "msmokeecigd",
    "msmokeecigf",
    "msmokeecigp",
    "msmokeecigpf",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
    msmokebef = c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, short interview", `1` = "no", `2` = "yes"),
    msmokecig = c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeciga = c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeciganw = c(`-2` = "na, see I/J/KMSMOKECIGA", `-1` = "na, asked", `0` = "< 1 a week"),
    msmokecignw = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMSMOKECIG",
    `-1` = "na, asked",
    `0` = "< 1 a week"
  ),
    msmokecigp = c(`-2` = "na, see I/J/KMSMOKEBEF", `-1` = "na, asked"),
    msmokeqage = c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KMSMOKEBEF", `-1` = "na, asked"),
    msmokesage = c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked"),
    msmokeyn = c(`-1` = "na, short interview", `1` = "no", `2` = "yes")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecignwp",
    "msmokecigp",
    "msmokeecig",
    "msmokeecigd",
    "msmokeecigf",
    "msmokeecigp",
    "msmokeecigpf",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
    msmokebef = c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, short interview", `1` = "no", `2` = "yes"),
    msmokecig = c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeciga = c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeciganw = c(`-2` = "na, see I/J/KMSMOKECIGA", `-1` = "na, asked", `0` = "< 1 a week"),
    msmokecignw = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMSMOKECIG",
    `-1` = "na, asked",
    `0` = "< 1 a week"
  ),
    msmokecigp = c(`-2` = "na, see I/J/KMSMOKEBEF", `-1` = "na, asked"),
    msmokeqage = c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KMSMOKEBEF", `-1` = "na, asked"),
    msmokesage = c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked"),
    msmokeyn = c(`-1` = "na, short interview", `1` = "no", `2` = "yes")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "msmokebef",
    "msmokecig",
    "msmokeciga",
    "msmokeciganw",
    "msmokecignw",
    "msmokecignwp",
    "msmokecigp",
    "msmokeecig",
    "msmokeecigd",
    "msmokeecigf",
    "msmokeecigp",
    "msmokeecigpf",
    "msmokeqage",
    "msmokesage",
    "msmokeyn"
  )],
    msmokebef = c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, short interview", `1` = "no", `2` = "yes"),
    msmokecig = c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeciga = c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    msmokeciganw = c(`-2` = "na, see I/J/KMSMOKECIGA", `-1` = "na, asked", `0` = "< 1 a week"),
    msmokecignw = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMSMOKECIG",
    `-1` = "na, asked",
    `0` = "< 1 a week"
  ),
    msmokecigp = c(`-2` = "na, see I/J/KMSMOKEBEF", `-1` = "na, asked"),
    msmokeqage = c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KMSMOKEBEF", `-1` = "na, asked"),
    msmokesage = c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked"),
    msmokeyn = c(`-1` = "na, short interview", `1` = "no", `2` = "yes")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  msmokbef = "categorical",
  msmokebef = "categorical",
  msmokecig = "categorical",
  msmokeciga = "categorical",
  msmokeciganw = "numeric",
  msmokecignw = "numeric",
  msmokecignwp = "numeric",
  msmokecigp = "categorical",
  msmokecigpnw = "numeric",
  msmokeecig = "categorical",
  msmokeecigd = "categorical",
  msmokeecigf = "categorical",
  msmokeecigp = "categorical",
  msmokeecigpf = "categorical",
  msmokepipe = "categorical",
  msmokepm = "numeric",
  msmokeqage = "numeric",
  msmokesage = "numeric",
  msmokesh = "categorical",
  msmokeshnw = "numeric",
  msmokeyn = "categorical"
)

.lasa_fc_154 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "154", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "154", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "154", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "154", waves = .lasa_wave_rows())
)
