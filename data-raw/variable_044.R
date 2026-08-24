## LASA filecode 044 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  fac1 = "Facility 1: walker or a walking frame",
  fac2 = "Facility 2: (sports) wheelchair",
  fac3 = "Facility 3: mobility scooter",
  facil = "Having facilities for disabled persons",
  lst1c01 = "Cont. past 6 monthsnths Family physician",
  lst1c02 = "Cont. past 6 monthsnths Dentist",
  lst1c03 = "Cont. past 6 monthsnths Physiotherapist",
  lst1c04 = "Cont. past 6 monthsnths Dietician",
  lst1c05 = "Cont. past 6 monthsnths Home nurs serv/distr. nurs",
  lst1c06 = "Cont. past 6 monthsnths Home help",
  lst1c07 = "Cont. past 6 monthsnths Alpha help",
  lst1c08 = "Cont. past 6 monthsnths Social work",
  lst1c09 = "Cont. past 6 monthsnths Coordinated senior service",
  lst1c10 = "Cont. past 6 monthsnths Telephonic help service",
  lst1c11 = "Cont. past 6 monthsnths Telephone circle",
  lst1c12 = "Cont. past 6 monthsnths Meals on wheels",
  lst1c13 = "Cont. past 6 monthsnths Open table (food)",
  lst1c14 = "Cont. past 6 monthsnths Volunteers UVV",
  lst1c15 = "Cont. past 6 monthsnths Volunteers Zonnebloem",
  lst1c16 = "Cont. past 6 monthsnths Transportation service",
  lst1c17 = "Cont. past 6 monthsnths Chores service",
  lst1c18 = "Cont. past 6 monthsnths Red Cross",
  lst1c19 = "Cont. past 6 monthsnths Memorytraining",
  lst1c1n = "Cont. family physician: number of times",
  lst1k01 = "Know. Family physican",
  lst1k02 = "Know. Dentist",
  lst1k03 = "Know. Physiotherapist",
  lst1k04 = "Know. Dietician",
  lst1k05 = "Know. Home nursing services/district nur",
  lst1k06 = "Know. Home help",
  lst1k07 = "Know. Alpha help",
  lst1k08 = "Know. Social work",
  lst1k09 = "Know. Coordinated senior services",
  lst1k10 = "Know. Telephonic help service",
  lst1k11 = "Know. Telephone circel",
  lst1k12 = "Know. Meals on wheels",
  lst1k13 = "Know. Open eettafel",
  lst1k14 = "Know. Volunteers UVV",
  lst1k15 = "Know. volunteers Zonnebloem",
  lst1k16 = "Know. Transportation service",
  lst1k17 = "Know. Chores Service",
  lst1k18 = "Know. Red Cross",
  lst1k19 = "Know. Memory training",
  lst2c01 = "Cont. past 6 monthsnths Consultation office alcohol&drugs",
  lst2c02 = "Cont. past 6 monthsnths Common mental health care",
  lst2c03 = "Cont. past 6 monthsnths Socio-psychogeriatric service (SPGD)",
  lst2c04 = "Cont. past 6 monthsnths Rehabilitation center",
  lst2c05 = "Cont. past 6 monthsnths Indication commission",
  lst2c06 = "Cont. past 6 monthsnths Alternative practitioner",
  lst2c07 = "Cont. past 6 monthsnths Nursing home-admission",
  lst2c08 = "Cont. past 6 monthsnths Nursing home-observation",
  lst2c09 = "Cont. past 6 monthsnths Nursing home-overnight stay",
  lst2c10 = "Cont. past 6 monthsnths Nursing home-day care",
  lst2c11 = "Cont. past 6 monthsnths Res home - day care",
  lst2c12 = "Cont. past 6 monthsnths Res home - temporary admission",
  lst2c13 = "Cont. past 6 monthsnths Res home - overnight stay",
  lst2c14 = "Cont. past 6 monthsnths Res home - meals",
  lst2c15 = "Cont. past 6 monthsnths Res home - social/creative activities",
  lst2c20 = "Cont. past 6 monthsnths Social alarm",
  lst2c21 = "Cont. past 6 monthsnths Daycare: social/creative activities in group",
  lst2k01 = "Know. Cons. Office for alcohol and drugs",
  lst2k02 = "Know. Comm Mental Health Care",
  lst2k03 = "Know. Socio-Psychiatric service (SPGD)",
  lst2k04 = "Know. Rehabilitation center",
  lst2k05 = "Know. Admission team residental care",
  lst2k06 = "Know. Alternative practitioner",
  lst2k07 = "Know. Nursing home - admission",
  lst2k08 = "Know. Nursing home - observation",
  lst2k09 = "Know. Nursing home - overnight stay",
  lst2k10 = "Know. Nursing home - day care",
  lst2k11 = "Know. Residential home - day care",
  lst2k12 = "Know. Residential home - temporary admis",
  lst2k13 = "Know. Residential home - overnight stay",
  lst2k14 = "Know. Residential home - meals",
  lst2k15 = "Know. Residential home - social or creative"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst1k01",
    "lst1k02",
    "lst1k03",
    "lst1k04",
    "lst1k05",
    "lst1k06",
    "lst1k07",
    "lst1k08",
    "lst1k09",
    "lst1k10",
    "lst1k11",
    "lst1k12",
    "lst1k13",
    "lst1k14",
    "lst1k15",
    "lst1k16",
    "lst1k17",
    "lst1k18",
    "lst1k19",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k01",
    "lst2k02",
    "lst2k03",
    "lst2k04",
    "lst2k05",
    "lst2k06",
    "lst2k07",
    "lst2k08",
    "lst2k09",
    "lst2k10",
    "lst2k11",
    "lst2k12",
    "lst2k13",
    "lst2k14",
    "lst2k15"
  )],
    lst1c01 = "Cont. p 6 mo. Family physician",
    lst1c02 = "Cont. p 6 mo. Dentist",
    lst1c03 = "Cont. p 6 mo. Physiotherapist",
    lst1c04 = "Cont. p 6 mo. Dietician",
    lst1c05 = "Cont. p 6 mo. Home nurs serv/distr. nurs",
    lst1c06 = "Cont. p 6 mo. Home help",
    lst1c07 = "Cont. p 6 mo. Alpha help",
    lst1c08 = "Cont. p 6 mo. Social work",
    lst1c09 = "Cont. p 6 mo. Coordinated senior serv.",
    lst1c10 = "Cont. p 6 mo. Telephonic help service",
    lst1c11 = "Cont. p 6 mo. Telephone circel",
    lst1c12 = "Cont. p 6 mo. Meals on wheels",
    lst1c13 = "Cont. p 6 mo. Open table (food)",
    lst1c14 = "Cont. p 6 mo. Volunteers UVV",
    lst1c15 = "Cont. p 6 mo. Volunteers Zonnebloem",
    lst1c16 = "Cont. p 6 mo. Transportation service",
    lst1c17 = "Cont. p 6 mo. Chores service",
    lst1c18 = "Cont. p 6 mo. Red Cross",
    lst1c19 = "Cont. p 6 mo. Memorytraining",
    lst2c01 = "Cont. p 6 mo. Cons offi. alcohol&drugs",
    lst2c02 = "Cont. p 6 mo. Comm mental health care",
    lst2c03 = "Cont. p 6 mo. Socio-psychiat. serv.(SPGD",
    lst2c04 = "Cont. p 6 mo. Rehabilitation center",
    lst2c05 = "Cont. p 6 mo. Indication commission",
    lst2c06 = "Cont. p 6 mo. Alternative practitioner",
    lst2c07 = "Cont. p 6 mo. Nursing home-admission",
    lst2c08 = "Cont. p 6 mo. Nursing home-observation",
    lst2c09 = "Cont. p 6 mo. Nursing home-overnight stay",
    lst2c10 = "Cont. p 6 mo. Nursing home-day care",
    lst2c11 = "Cont. p 6 mo. Res home - day care",
    lst2c12 = "Cont. p 6 mo. Res home - temp. admission",
    lst2c13 = "Cont. p 6 mo. Res home - overnight stay",
    lst2c14 = "Cont. p 6 mo. Res home - meals",
    lst2c15 = "Cont. p 6 mo. Res home - soci./creative"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k09"
  )],
    lst1c01 = "Cont. p 6 mo. Family physician",
    lst1c02 = "Cont. p 6 mo. Dentist",
    lst1c03 = "Cont. p 6 mo. Physiotherapist",
    lst1c04 = "Cont. p 6 mo. Dietician",
    lst1c05 = "Cont. p 6 mo. Home nurs serv/distr. nurs",
    lst1c06 = "Cont. p 6 mo. Home help",
    lst1c07 = "Cont. p 6 mo. Alpha help",
    lst1c08 = "Cont. p 6 mo. Social work",
    lst1c09 = "Cont. p 6 mo. Coordinated senior service",
    lst1c10 = "Cont. p 6 mo. Telephonic help service",
    lst1c11 = "Cont. p 6 mo. Telephone circle",
    lst1c12 = "Cont. p 6 mo. Meals on wheels",
    lst1c13 = "Cont. p 6 mo. Open table (food)",
    lst1c14 = "Cont. p 6 mo. Volunteers UVV",
    lst1c15 = "Cont. p 6 mo. Volunteers Zonnebloem",
    lst1c16 = "Cont. p 6 mo. Transportation service",
    lst1c17 = "Cont. p 6 mo. Chores service",
    lst1c18 = "Cont. p 6 mo. Red Cross",
    lst1c19 = "Cont. p 6 mo. Memorytraining",
    lst2c01 = "Cont. p 6 mo. Consultation office alcohol&drugs",
    lst2c02 = "Cont. p 6 mo. Common mental health care",
    lst2c03 = "Cont. p 6 mo. Socio-psychogeriatric service (SPGD)",
    lst2c04 = "Cont. p 6 mo. Rehabilitation center",
    lst2c05 = "Cont. p 6 mo. Indication commission",
    lst2c06 = "Cont. p 6 mo. Alternative practitioner",
    lst2c07 = "Cont. p 6 mo. Nursing home-admission",
    lst2c08 = "Cont. p 6 mo. Nursing home-observation",
    lst2c09 = "Cont. p 6 mo. Nursing home-overnight stay",
    lst2c10 = "Cont. p 6 mo. Nursing home-day care",
    lst2c11 = "Cont. p 6 mo. Res home - day care",
    lst2c12 = "Cont. p 6 mo. Res home - temporary admission",
    lst2c13 = "Cont. p 6 mo. Res home - overnight stay",
    lst2c14 = "Cont. p 6 mo. Res home - meals",
    lst2c15 = "Cont. p 6 mo. Res home - social/creative activities"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k09"
  )],
    lst1c01 = "Cont. p 6 mo. Family physician",
    lst1c02 = "Cont. p 6 mo. Dentist",
    lst1c03 = "Cont. p 6 mo. Physiotherapist",
    lst1c04 = "Cont. p 6 mo. Dietician",
    lst1c05 = "Cont. p 6 mo. Home nurs serv/distr. nurs",
    lst1c06 = "Cont. p 6 mo. Home help",
    lst1c07 = "Cont. p 6 mo. Alpha help",
    lst1c08 = "Cont. p 6 mo. Social work",
    lst1c09 = "Cont. p 6 mo. Coordinated senior service",
    lst1c10 = "Cont. p 6 mo. Telephonic help service",
    lst1c11 = "Cont. p 6 mo. Telephone circle",
    lst1c12 = "Cont. p 6 mo. Meals on wheels",
    lst1c13 = "Cont. p 6 mo. Open table (food)",
    lst1c14 = "Cont. p 6 mo. Volunteers UVV",
    lst1c15 = "Cont. p 6 mo. Volunteers Zonnebloem",
    lst1c16 = "Cont. p 6 mo. Transportation service",
    lst1c17 = "Cont. p 6 mo. Chores service",
    lst1c18 = "Cont. p 6 mo. Red Cross",
    lst1c19 = "Cont. p 6 mo. Memorytraining",
    lst2c01 = "Cont. p 6 mo. Consultation office alcohol&drugs",
    lst2c02 = "Cont. p 6 mo. Common mental health care",
    lst2c03 = "Cont. p 6 mo. Socio-psychogeriatric service (SPGD)",
    lst2c04 = "Cont. p 6 mo. Rehabilitation center",
    lst2c05 = "Cont. p 6 mo. Indication commission",
    lst2c06 = "Cont. p 6 mo. Alternative practitioner",
    lst2c07 = "Cont. p 6 mo. Nursing home-admission",
    lst2c08 = "Cont. p 6 mo. Nursing home-observation",
    lst2c09 = "Cont. p 6 mo. Nursing home-overnight stay",
    lst2c10 = "Cont. p 6 mo. Nursing home-day care",
    lst2c11 = "Cont. p 6 mo. Res home - day care",
    lst2c12 = "Cont. p 6 mo. Res home - temporary admission",
    lst2c13 = "Cont. p 6 mo. Res home - overnight stay",
    lst2c14 = "Cont. p 6 mo. Res home - meals",
    lst2c15 = "Cont. p 6 mo. Res home - social/creative activities"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k09"
  )],
    lst1c01 = "Cont. p 6 mo. Family physician",
    lst1c02 = "Cont. p 6 mo. Dentist",
    lst1c03 = "Cont. p 6 mo. Physiotherapist",
    lst1c04 = "Cont. p 6 mo. Dietician",
    lst1c05 = "Cont. p 6 mo. Home nurs serv/distr. nurs",
    lst1c06 = "Cont. p 6 mo. Home help",
    lst1c07 = "Cont. p 6 mo. Alpha help",
    lst1c08 = "Cont. p 6 mo. Social work",
    lst1c09 = "Cont. p 6 mo. Coordinated senior service",
    lst1c10 = "Cont. p 6 mo. Telephonic help service",
    lst1c11 = "Cont. p 6 mo. Telephone circle",
    lst1c12 = "Cont. p 6 mo. Meals on wheels",
    lst1c13 = "Cont. p 6 mo. Open table (food)",
    lst1c14 = "Cont. p 6 mo. Volunteers UVV",
    lst1c15 = "Cont. p 6 mo. Volunteers Zonnebloem",
    lst1c16 = "Cont. p 6 mo. Transportation service",
    lst1c17 = "Cont. p 6 mo. Chores service",
    lst1c18 = "Cont. p 6 mo. Red Cross",
    lst1c19 = "Cont. p 6 mo. Memorytraining",
    lst2c01 = "Cont. p 6 mo. Consultation office alcohol&drugs",
    lst2c02 = "Cont. p 6 mo. Common mental health care",
    lst2c03 = "Cont. p 6 mo. Socio-psychogeriatric service (SPGD)",
    lst2c04 = "Cont. p 6 mo. Rehabilitation center",
    lst2c05 = "Cont. p 6 mo. Indication commission",
    lst2c06 = "Cont. p 6 mo. Alternative practitioner",
    lst2c07 = "Cont. p 6 mo. Nursing home-admission",
    lst2c08 = "Cont. p 6 mo. Nursing home-observation",
    lst2c09 = "Cont. p 6 mo. Nursing home-overnight stay",
    lst2c10 = "Cont. p 6 mo. Nursing home-day care",
    lst2c11 = "Cont. p 6 mo. Res home - day care",
    lst2c12 = "Cont. p 6 mo. Res home - temporary admission",
    lst2c13 = "Cont. p 6 mo. Res home - overnight stay",
    lst2c14 = "Cont. p 6 mo. Res home - meals",
    lst2c15 = "Cont. p 6 mo. Res home - social/creative activities"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k09"
  )],
    lst1c01 = "Cont. p 6 mo. Family physician",
    lst1c02 = "Cont. p 6 mo. Dentist",
    lst1c03 = "Cont. p 6 mo. Physiotherapist",
    lst1c04 = "Cont. p 6 mo. Dietician",
    lst1c05 = "Cont. p 6 mo. Home nurs serv/distr. nurs",
    lst1c06 = "Cont. p 6 mo. Home help",
    lst1c07 = "Cont. p 6 mo. Alpha help",
    lst1c08 = "Cont. p 6 mo. Social work",
    lst1c09 = "Cont. p 6 mo. Coordinated senior service",
    lst1c10 = "Cont. p 6 mo. Telephonic help service",
    lst1c11 = "Cont. p 6 mo. Telephone circle",
    lst1c12 = "Cont. p 6 mo. Meals on wheels",
    lst1c13 = "Cont. p 6 mo. Open table (food)",
    lst1c14 = "Cont. p 6 mo. Volunteers UVV",
    lst1c15 = "Cont. p 6 mo. Volunteers Zonnebloem",
    lst1c16 = "Cont. p 6 mo. Transportation service",
    lst1c17 = "Cont. p 6 mo. Chores service",
    lst1c18 = "Cont. p 6 mo. Red Cross",
    lst1c19 = "Cont. p 6 mo. Memorytraining",
    lst2c01 = "Cont. p 6 mo. Consultation office alcohol&drugs",
    lst2c02 = "Cont. p 6 mo. Common mental health care",
    lst2c03 = "Cont. p 6 mo. Socio-psychogeriatric service (SPGD)",
    lst2c04 = "Cont. p 6 mo. Rehabilitation center",
    lst2c05 = "Cont. p 6 mo. Indication commission",
    lst2c06 = "Cont. p 6 mo. Alternative practitioner",
    lst2c07 = "Cont. p 6 mo. Nursing home-admission",
    lst2c08 = "Cont. p 6 mo. Nursing home-observation",
    lst2c09 = "Cont. p 6 mo. Nursing home-overnight stay",
    lst2c10 = "Cont. p 6 mo. Nursing home-day care",
    lst2c11 = "Cont. p 6 mo. Res home - day care",
    lst2c12 = "Cont. p 6 mo. Res home - temporary admission",
    lst2c13 = "Cont. p 6 mo. Res home - overnight stay",
    lst2c14 = "Cont. p 6 mo. Res home - meals",
    lst2c15 = "Cont. p 6 mo. Res home - social/creative activities"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k09"
  )],
    lst1c01 = "Cont. p 6 mo. Family physician",
    lst1c02 = "Cont. p 6 mo. Dentist",
    lst1c03 = "Cont. p 6 mo. Physiotherapist",
    lst1c04 = "Cont. p 6 mo. Dietician",
    lst1c05 = "Cont. p 6 mo. Home nurs serv/distr. nurs",
    lst1c06 = "Cont. p 6 mo. Home help",
    lst1c07 = "Cont. p 6 mo. Alpha help",
    lst1c08 = "Cont. p 6 mo. Social work",
    lst1c09 = "Cont. p 6 mo. Coordinated senior service",
    lst1c10 = "Cont. p 6 mo. Telephonic help service",
    lst1c11 = "Cont. p 6 mo. Telephone circle",
    lst1c12 = "Cont. p 6 mo. Meals on wheels",
    lst1c13 = "Cont. p 6 mo. Open table (food)",
    lst1c14 = "Cont. p 6 mo. Volunteers UVV",
    lst1c15 = "Cont. p 6 mo. Volunteers Zonnebloem",
    lst1c16 = "Cont. p 6 mo. Transportation service",
    lst1c17 = "Cont. p 6 mo. Chores service",
    lst1c18 = "Cont. p 6 mo. Red Cross",
    lst1c19 = "Cont. p 6 mo. Memorytraining",
    lst2c01 = "Cont. p 6 mo. Consultation office alcohol&drugs",
    lst2c02 = "Cont. p 6 mo. Common mental health care",
    lst2c03 = "Cont. p 6 mo. Socio-psychogeriatric service (SPGD)",
    lst2c04 = "Cont. p 6 mo. Rehabilitation center",
    lst2c05 = "Cont. p 6 mo. Indication commission",
    lst2c06 = "Cont. p 6 mo. Alternative practitioner",
    lst2c07 = "Cont. p 6 mo. Nursing home-admission",
    lst2c08 = "Cont. p 6 mo. Nursing home-observation",
    lst2c09 = "Cont. p 6 mo. Nursing home-overnight stay",
    lst2c10 = "Cont. p 6 mo. Nursing home-day care",
    lst2c11 = "Cont. p 6 mo. Res home - day care",
    lst2c12 = "Cont. p 6 mo. Res home - temporary admission",
    lst2c13 = "Cont. p 6 mo. Res home - overnight stay",
    lst2c14 = "Cont. p 6 mo. Res home - meals",
    lst2c15 = "Cont. p 6 mo. Res home - social/creative activities"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst1c1n",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k09"
  )],
    lst1c01 = "Cont. p 6 mo. Family physician",
    lst1c02 = "Cont. p 6 mo. Dentist",
    lst1c03 = "Cont. p 6 mo. Physiotherapist",
    lst1c04 = "Cont. p 6 mo. Dietician",
    lst1c05 = "Cont. p 6 mo. Home nurs serv/distr. nurs",
    lst1c06 = "Cont. p 6 mo. Home help",
    lst1c07 = "Cont. p 6 mo. Alpha help",
    lst1c08 = "Cont. p 6 mo. Social work",
    lst1c09 = "Cont. p 6 mo. Coordinated senior service",
    lst1c10 = "Cont. p 6 mo. Telephonic help service",
    lst1c11 = "Cont. p 6 mo. Telephone circle",
    lst1c12 = "Cont. p 6 mo. Meals on wheels",
    lst1c13 = "Cont. p 6 mo. Open table (food)",
    lst1c14 = "Cont. p 6 mo. Volunteers UVV",
    lst1c15 = "Cont. p 6 mo. Volunteers Zonnebloem",
    lst1c16 = "Cont. p 6 mo. Transportation service",
    lst1c17 = "Cont. p 6 mo. Chores service",
    lst1c18 = "Cont. p 6 mo. Red Cross",
    lst1c19 = "Cont. p 6 mo. Memorytraining",
    lst2c01 = "Cont. p 6 mo. Consultation office alcohol&drugs",
    lst2c02 = "Cont. p 6 mo. Common mental health care",
    lst2c03 = "Cont. p 6 mo. Socio-psychogeriatric service (SPGD)",
    lst2c04 = "Cont. p 6 mo. Rehabilitation center",
    lst2c05 = "Cont. p 6 mo. Indication commission",
    lst2c06 = "Cont. p 6 mo. Alternative practitioner",
    lst2c07 = "Cont. p 6 mo. Nursing home-admission",
    lst2c08 = "Cont. p 6 mo. Nursing home-observation",
    lst2c09 = "Cont. p 6 mo. Nursing home-overnight stay",
    lst2c10 = "Cont. p 6 mo. Nursing home-day care",
    lst2c11 = "Cont. p 6 mo. Res home - day care",
    lst2c12 = "Cont. p 6 mo. Res home - temporary admission",
    lst2c13 = "Cont. p 6 mo. Res home - overnight stay",
    lst2c14 = "Cont. p 6 mo. Res home - meals",
    lst2c15 = "Cont. p 6 mo. Res home - social/creative activities"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c16",
    "lst1c17",
    "lst1c19",
    "lst1c1n",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15"
  )],
    lst1c01 = "Cont. p 6 mo. Family physician",
    lst1c02 = "Cont. p 6 mo. Dentist",
    lst1c03 = "Cont. p 6 mo. Physiotherapist",
    lst1c04 = "Cont. p 6 mo. Dietician",
    lst1c05 = "Cont. p 6 mo. Home nurse /district nurse",
    lst1c06 = "Cont. p 6 mo. Home help",
    lst1c07 = "Cont. p 6 mo. Alpha help",
    lst1c08 = "Cont. p 6 mo. Social work",
    lst1c09 = "Cont. p 6 mo. Coordinated senior service",
    lst1c10 = "Cont. p 6 mo. Telephonic help service",
    lst1c11 = "Cont. p 6 mo. Telephone circle",
    lst1c12 = "Cont. p 6 mo. Meals on wheels",
    lst1c13 = "Cont. p 6 mo. Open table (food)",
    lst1c14 = "Cont. p 6 mo. Volunteers organisation, namely ...",
    lst1c16 = "Cont. p 6 mo. Transportation service",
    lst1c17 = "Cont. p 6 mo. Chores service",
    lst1c19 = "Cont. p 6 mo. Memorytraining",
    lst2c01 = "Cont. p 6 mo. Consultation office alcohol&drugs",
    lst2c02 = "Cont. p 6 mo. Common mental health care",
    lst2c03 = "Cont. p 6 mo. Socio-psychogeriatric service (SPGD)",
    lst2c04 = "Cont. p 6 mo. Rehabilitation center",
    lst2c05 = "Cont. p 6 mo. Indication commission",
    lst2c06 = "Cont. p 6 mo. Alternative practitioner",
    lst2c07 = "Cont. p 6 mo. Nursing home-admission",
    lst2c08 = "Cont. p 6 mo. Nursing home-observation",
    lst2c09 = "Cont. p 6 mo. Nursing home-overnight stay",
    lst2c10 = "Cont. p 6 mo. Nursing home-day care",
    lst2c11 = "Cont. p 6 mo. Res home - day care",
    lst2c12 = "Cont. p 6 mo. Res home - temporary admission",
    lst2c13 = "Cont. p 6 mo. Res home - overnight stay",
    lst2c14 = "Cont. p 6 mo. Res home - meals",
    lst2c15 = "Cont. p 6 mo. Res home - social/creative activities"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c16",
    "lst1c17",
    "lst1c19",
    "lst1c1n",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15"
  )],
    lst1c01 = "Cont. p 6 mo. Family physician",
    lst1c02 = "Cont. p 6 mo. Dentist",
    lst1c03 = "Cont. p 6 mo. Physiotherapist",
    lst1c04 = "Cont. p 6 mo. Dietician",
    lst1c05 = "Cont. p 6 mo. Home nurse /district nurse",
    lst1c06 = "Cont. p 6 mo. Home help",
    lst1c07 = "Cont. p 6 mo. Alpha help",
    lst1c08 = "Cont. p 6 mo. Social work",
    lst1c09 = "Cont. p 6 mo. Coordinated senior service",
    lst1c10 = "Cont. p 6 mo. Telephonic help service",
    lst1c11 = "Cont. p 6 mo. Telephone circle",
    lst1c12 = "Cont. p 6 mo. Meals on wheels",
    lst1c13 = "Cont. p 6 mo. Open table (food)",
    lst1c14 = "Cont. p 6 mo. Volunteers organisation, namely ...",
    lst1c16 = "Cont. p 6 mo. Transportation service",
    lst1c17 = "Cont. p 6 mo. Chores service",
    lst1c19 = "Cont. p 6 mo. Memorytraining",
    lst2c01 = "Cont. p 6 mo. Consultation office alcohol&drugs",
    lst2c02 = "Cont. p 6 mo. Common mental health care",
    lst2c03 = "Cont. p 6 mo. Socio-psychogeriatric service (SPGD)",
    lst2c04 = "Cont. p 6 mo. Rehabilitation center",
    lst2c05 = "Cont. p 6 mo. Indication commission",
    lst2c06 = "Cont. p 6 mo. Alternative practitioner",
    lst2c07 = "Cont. p 6 mo. Nursing home-admission",
    lst2c08 = "Cont. p 6 mo. Nursing home-observation",
    lst2c09 = "Cont. p 6 mo. Nursing home-overnight stay",
    lst2c10 = "Cont. p 6 mo. Nursing home-day care",
    lst2c11 = "Cont. p 6 mo. Res home - day care",
    lst2c12 = "Cont. p 6 mo. Res home - temporary admission",
    lst2c13 = "Cont. p 6 mo. Res home - overnight stay",
    lst2c14 = "Cont. p 6 mo. Res home - meals",
    lst2c15 = "Cont. p 6 mo. Res home - social/creative activities"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels[c(
    "fac1",
    "fac2",
    "fac3",
    "facil",
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c12",
    "lst1c14",
    "lst1c16",
    "lst1c17",
    "lst1c1n",
    "lst2c01",
    "lst2c02",
    "lst2c06"
  )],
    lst1c01 = "Cont. p 6 mo. Family physician",
    lst1c02 = "Cont. p 6 mo. Dentist",
    lst1c03 = "Cont. p 6 mo. Physiotherapist",
    lst1c04 = "Cont. p 6 mo. Dietician",
    lst1c12 = "Cont. p 6 mo. Meals on wheels",
    lst1c14 = "Cont. p 6 mo. Volunteers organisation",
    lst1c16 = "Cont. p 6 mo Transport services",
    lst1c17 = "Cont. p 6 mo. Chores service",
    lst2c01 = "Cont. p 6 mo. Consultation office alcohol&drugs",
    lst2c02 = "Cont. p 6 mo. Common mental health care",
    lst2c06 = "Cont. p 6 mo. Alternative practitioner"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst1c1n",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c06",
    "lst2c20",
    "lst2c21"
  )],
    lst1c01 = "Cont. p 6 mo. Family physician",
    lst1c02 = "Cont. p 6 mo. Dentist",
    lst1c03 = "Cont. p 6 mo. Physiotherapist",
    lst1c04 = "Cont. p 6 mo. Dietician",
    lst1c08 = "Cont. p 6 mo. Social work",
    lst1c09 = "Cont. p 6 mo. Coordinated senior service",
    lst1c10 = "Cont. p 6 mo. Telephonic help service",
    lst1c11 = "Cont. p 6 mo. Telephone circle",
    lst1c12 = "Cont. p 6 mo. Meals on wheels",
    lst1c13 = "Cont. p 6 mo. Open table (food)",
    lst1c14 = "Cont. p 6 mo. Volunteers organisation, namely ...",
    lst1c16 = "Cont. p 6 mo. Transportation service",
    lst1c17 = "Cont. p 6 mo. Chores service",
    lst1c18 = "Cont. p 6 mo. Red Cross",
    lst1c19 = "Cont. p 6 mo. Memorytraining",
    lst2c01 = "Cont. p 6 mo. Consultation office alcohol&drugs",
    lst2c02 = "Cont. p 6 mo. Common mental health care",
    lst2c03 = "Cont. p 6 mo. Socio-psychogeriatric service (SPGD)",
    lst2c04 = "Cont. p 6 mo. Rehabilitation center",
    lst2c06 = "Cont. p 6 mo. Alternative practitioner",
    lst2c20 = "Cont. p 6 mo. Social alarm",
    lst2c21 = "Cont. p 6 mo. Daycare: social/creative activities in group"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst1c1n",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c06",
    "lst2c20"
  )],
    lst1c01 = "Cont. p 6 mo. Family physician",
    lst1c02 = "Cont. p 6 mo. Dentist",
    lst1c03 = "Cont. p 6 mo. Physiotherapist",
    lst1c04 = "Cont. p 6 mo. Dietician",
    lst1c08 = "Cont. p 6 mo. Social work",
    lst1c09 = "Cont. p 6 mo. Coordinated senior service",
    lst1c10 = "Cont. p 6 mo. Telephonic help service",
    lst1c11 = "Cont. p 6 mo. Telephone circle",
    lst1c12 = "Cont. p 6 mo. Meals on wheels",
    lst1c13 = "Cont. p 6 mo. Open table (food)",
    lst1c14 = "Cont. p 6 mo. Volunteers organisation, namely ...",
    lst1c16 = "Cont. p 6 mo. Transportation service",
    lst1c17 = "Cont. p 6 mo. Chores service",
    lst1c18 = "Cont. p 6 mo. Red Cross",
    lst1c19 = "Cont. p 6 mo. Memorytraining",
    lst2c01 = "Cont. p 6 mo. Consultation office alcohol&drugs",
    lst2c02 = "Cont. p 6 mo. Common mental health care",
    lst2c03 = "Cont. p 6 mo. Socio-psychogeriatric service (SPGD)",
    lst2c04 = "Cont. p 6 mo. Rehabilitation center",
    lst2c06 = "Cont. p 6 mo. Alternative practitioner",
    lst2c20 = "Cont. p 6 mo. Social alarm"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  fac1 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  fac2 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  fac3 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  facil = c(`-4` = "not available, interview terminated", `1` = "no", `2` = "yes"),
  lst1c01 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c02 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c03 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c04 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c05 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c06 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c07 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c08 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c09 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c10 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c11 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c12 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c13 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c14 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c15 = c(
    `-5` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c16 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c17 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c18 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c19 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1c1n = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked: r does not know",
    `98` = "98 times or more"
  ),
  lst1k01 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k02 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k03 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k04 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k05 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k06 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k07 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k08 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k09 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k10 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k11 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k12 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k13 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k14 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k15 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k16 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k17 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k18 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst1k19 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c01 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c02 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c03 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c04 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c05 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c06 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c07 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c08 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c09 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c10 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c11 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c12 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c13 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c14 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c15 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c20 = c(
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2c21 = c(
    `-4` = "not available, interview terminated",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k01 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k02 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k03 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k04 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k05 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k06 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k07 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k08 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k09 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k10 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k11 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k12 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k13 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k14 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lst2k15 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-2` = "not available, routing",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst1k01",
    "lst1k02",
    "lst1k03",
    "lst1k04",
    "lst1k05",
    "lst1k06",
    "lst1k07",
    "lst1k08",
    "lst1k09",
    "lst1k10",
    "lst1k11",
    "lst1k12",
    "lst1k13",
    "lst1k14",
    "lst1k15",
    "lst1k16",
    "lst1k17",
    "lst1k18",
    "lst1k19",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k01",
    "lst2k02",
    "lst2k03",
    "lst2k04",
    "lst2k05",
    "lst2k06",
    "lst2k07",
    "lst2k08",
    "lst2k09",
    "lst2k10",
    "lst2k11",
    "lst2k12",
    "lst2k13",
    "lst2k14",
    "lst2k15"
  )],
    lst1c01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C01",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C03",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C04",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C05",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C06",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C07",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C08",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C10",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C11",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C12",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C13",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C14",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c16 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C16",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C17",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c18 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C18",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c19 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST1C19",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1k01 = .replace_labels(
    standardized_value_labels$lst1k01,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k02 = .replace_labels(
    standardized_value_labels$lst1k02,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k03 = .replace_labels(
    standardized_value_labels$lst1k03,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k04 = .replace_labels(
    standardized_value_labels$lst1k04,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k05 = .replace_labels(
    standardized_value_labels$lst1k05,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k06 = .replace_labels(
    standardized_value_labels$lst1k06,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k07 = .replace_labels(
    standardized_value_labels$lst1k07,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k08 = .replace_labels(
    standardized_value_labels$lst1k08,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k09 = .replace_labels(
    standardized_value_labels$lst1k09,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k10 = .replace_labels(
    standardized_value_labels$lst1k10,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k11 = .replace_labels(
    standardized_value_labels$lst1k11,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k12 = .replace_labels(
    standardized_value_labels$lst1k12,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k13 = .replace_labels(
    standardized_value_labels$lst1k13,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k14 = .replace_labels(
    standardized_value_labels$lst1k14,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k15 = .replace_labels(
    standardized_value_labels$lst1k15,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k16 = .replace_labels(
    standardized_value_labels$lst1k16,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k17 = .replace_labels(
    standardized_value_labels$lst1k17,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k18 = .replace_labels(
    standardized_value_labels$lst1k18,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst1k19 = .replace_labels(
    standardized_value_labels$lst1k19,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview"
  ),
    lst2c01 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K01",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c02 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c03 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K03",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K04",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K05",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K06",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K07",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K08",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K10",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K11",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K12",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K13",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K14",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BLST2K15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2k01 = .replace_labels(
    standardized_value_labels$lst2k01,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  ),
    lst2k02 = .replace_labels(
    standardized_value_labels$lst2k02,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  ),
    lst2k03 = .replace_labels(
    standardized_value_labels$lst2k03,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  ),
    lst2k04 = .replace_labels(
    standardized_value_labels$lst2k04,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  ),
    lst2k05 = .replace_labels(
    standardized_value_labels$lst2k05,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  ),
    lst2k06 = .replace_labels(
    standardized_value_labels$lst2k06,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  ),
    lst2k07 = .replace_labels(
    standardized_value_labels$lst2k07,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  ),
    lst2k08 = .replace_labels(
    standardized_value_labels$lst2k08,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  ),
    lst2k09 = c(
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2k10 = .replace_labels(
    standardized_value_labels$lst2k10,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  ),
    lst2k11 = .replace_labels(
    standardized_value_labels$lst2k11,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  ),
    lst2k12 = .replace_labels(
    standardized_value_labels$lst2k12,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  ),
    lst2k13 = .replace_labels(
    standardized_value_labels$lst2k13,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  ),
    lst2k14 = .replace_labels(
    standardized_value_labels$lst2k14,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  ),
    lst2k15 = .replace_labels(
    standardized_value_labels$lst2k15,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-2` = "na, see BHINDEP"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k09"
  )],
    lst1c01 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c02 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c03 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c04 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c05 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c06 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c07 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c08 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c09 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c10 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c11 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c12 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c13 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c14 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c15 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c16 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c17 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c18 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c19 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c01 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c02 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c03 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c04 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c05 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c06 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c07 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c08 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c09 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c10 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c11 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c12 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c13 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c14 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c15 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2k09 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k09"
  )],
    lst1c01 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c02 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c03 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c04 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c05 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c06 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c07 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c08 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c09 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c10 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c11 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c12 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c13 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c14 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c15 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c16 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c17 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c18 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c19 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c01 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c02 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c03 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c04 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c05 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c06 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c07 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c08 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c09 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c10 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c11 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c12 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c13 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c14 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c15 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2k09 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k09"
  )],
    lst1c01 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c02 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c03 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c04 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c05 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c06 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c07 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c08 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c09 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c10 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c11 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c12 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c13 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c14 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c15 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c16 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c17 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c18 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c19 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c01 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c02 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c03 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c04 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c05 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c06 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c07 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c08 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c09 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c10 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c11 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c12 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c13 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c14 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c15 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2k09 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k09"
  )],
    lst1c01 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c02 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c03 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c04 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c05 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c06 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c07 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c08 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c09 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c10 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c11 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c12 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c13 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c14 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c15 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c16 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c17 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c18 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c19 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c01 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c02 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c03 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c04 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c05 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c06 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c07 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c08 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c09 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c10 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c11 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c12 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c13 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c14 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c15 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2k09 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k09"
  )],
    lst1c01 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c02 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c03 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c04 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c05 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c06 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c07 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c08 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c09 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c10 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c11 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c12 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c13 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c14 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c15 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c16 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c17 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c18 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c19 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c01 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c02 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c03 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c04 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c05 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c06 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c07 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c08 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c09 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c10 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c11 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c12 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c13 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c14 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c15 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2k09 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c15",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst1c1n",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15",
    "lst2k09"
  )],
    lst1c01 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c02 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c03 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c04 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c05 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c06 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c07 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c08 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c09 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c10 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c11 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c12 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c13 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c14 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c15 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c16 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c17 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c18 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c19 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c1n = .replace_labels(
    standardized_value_labels$lst1c1n,
    `-3` = "na wrong skip",
    `-2` = "na, see GLST1C01",
    `-1` = "na, asked: R does not know"
  ),
    lst2c01 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c02 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c03 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c04 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c05 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c06 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c07 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c08 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c09 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c10 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c11 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c12 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c13 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c14 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c15 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2k09 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c16",
    "lst1c17",
    "lst1c19",
    "lst1c1n",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15"
  )],
    lst1c01 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c02 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c03 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c04 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c05 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c06 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c07 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c08 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c09 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c10 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c11 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c12 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c13 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c14 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c16 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c17 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c19 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c1n = c(`-2` = "na, see H/BLST1C01", `-1` = "na, asked: R does not know", `98` = "98 times or more"),
    lst2c01 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c02 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c03 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c04 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c05 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c06 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c07 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c08 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c09 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c10 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c11 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c12 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c13 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c14 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c15 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c05",
    "lst1c06",
    "lst1c07",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c16",
    "lst1c17",
    "lst1c19",
    "lst1c1n",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c05",
    "lst2c06",
    "lst2c07",
    "lst2c08",
    "lst2c09",
    "lst2c10",
    "lst2c11",
    "lst2c12",
    "lst2c13",
    "lst2c14",
    "lst2c15"
  )],
    lst1c01 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c02 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c03 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c04 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c05 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c06 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c07 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c08 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c09 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c10 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c11 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c12 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c13 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c14 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c16 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c17 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c19 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c1n = c(`-2` = "na, see H/BLST1C01", `-1` = "na, asked: R does not know", `98` = "98 times or more"),
    lst2c01 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c02 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c03 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c04 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c05 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c06 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c07 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c08 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c09 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c10 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c11 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c12 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c13 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c14 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c15 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see H/BHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c(
    "fac1",
    "fac2",
    "fac3",
    "facil",
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c12",
    "lst1c14",
    "lst1c16",
    "lst1c17",
    "lst1c1n",
    "lst2c01",
    "lst2c02",
    "lst2c06"
  )],
    fac1 = .replace_labels(
    standardized_value_labels$fac1,
    `-2` = "na, see BFACIL"
  ),
    fac2 = .replace_labels(
    standardized_value_labels$fac2,
    `-2` = "na, see BFACIL"
  ),
    fac3 = .replace_labels(
    standardized_value_labels$fac3,
    `-2` = "na, see BFACIL"
  ),
    facil = .replace_labels(
    standardized_value_labels$facil,
    `-4` = "na, short/terminated interview"
  ),
    lst1c01 = c(`-4` = "na, short/terminated interview", `0` = "not mentioned", `1` = "mentioned"),
    lst1c02 = c(`-4` = "na, short/terminated interview", `0` = "not mentioned", `1` = "mentioned"),
    lst1c03 = c(`-4` = "na, short/terminated interview", `0` = "not mentioned", `1` = "mentioned"),
    lst1c04 = c(`-4` = "na, short/terminated interview", `0` = "not mentioned", `1` = "mentioned"),
    lst1c12 = c(`-4` = "na, short/terminated interview", `0` = "not mentioned", `1` = "mentioned"),
    lst1c14 = c(`-4` = "na, short/terminated interview", `0` = "not mentioned", `1` = "mentioned"),
    lst1c16 = c(`-4` = "na, short/terminated interview", `0` = "not mentioned", `1` = "mentioned"),
    lst1c17 = c(`-4` = "na, short/terminated interview", `0` = "not mentioned", `1` = "mentioned"),
    lst1c1n = c(`-2` = "na, see BLST1C01", `-1` = "na, asked; R does not know", `98` = "98 times or more"),
    lst2c01 = c(`-4` = "na, short/terminated interview", `0` = "not mentioned", `1` = "mentioned"),
    lst2c02 = c(`-4` = "na, short/terminated interview", `0` = "not mentioned", `1` = "mentioned"),
    lst2c06 = c(`-4` = "na, short/terminated interview", `0` = "not mentioned", `1` = "mentioned")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst1c1n",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c06",
    "lst2c20",
    "lst2c21"
  )],
    lst1c01 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c02 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c03 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c04 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c08 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c09 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c10 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c11 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c12 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c13 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c14 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c16 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c17 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c18 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c19 = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c1n = c(`-2` = "na, see ILST1C01", `-1` = "na, asked: R does not know", `98` = "98 times or more"),
    lst2c01 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see IHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c02 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see IHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c03 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see IHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c04 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see IHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c06 = c(
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see IHINDEP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c20 = .replace_labels(
    standardized_value_labels$lst2c20,
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see IHINDEP",
    `-1` = "na, asked"
  ),
    lst2c21 = .replace_labels(
    standardized_value_labels$lst2c21,
    `-4` = "na, short/terminated interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see IHINDEP",
    `-1` = "na, asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "lst1c01",
    "lst1c02",
    "lst1c03",
    "lst1c04",
    "lst1c08",
    "lst1c09",
    "lst1c10",
    "lst1c11",
    "lst1c12",
    "lst1c13",
    "lst1c14",
    "lst1c16",
    "lst1c17",
    "lst1c18",
    "lst1c19",
    "lst1c1n",
    "lst2c01",
    "lst2c02",
    "lst2c03",
    "lst2c04",
    "lst2c06",
    "lst2c20"
  )],
    lst1c01 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c02 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c03 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c04 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c08 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c09 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c10 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c11 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c12 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c13 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c14 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c16 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c17 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c18 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c19 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst1c1n = c(`-2` = "na, see JLST1C01", `-1` = "na, asked; R does not know", `98` = "98 times or more"),
    lst2c01 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c02 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c03 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c04 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c06 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lst2c20 = c(
    `-4` = "na, terminated interview",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  fac1 = "categorical",
  fac2 = "categorical",
  fac3 = "categorical",
  facil = "categorical",
  lst1c01 = "categorical",
  lst1c02 = "categorical",
  lst1c03 = "categorical",
  lst1c04 = "categorical",
  lst1c05 = "categorical",
  lst1c06 = "categorical",
  lst1c07 = "categorical",
  lst1c08 = "categorical",
  lst1c09 = "categorical",
  lst1c10 = "categorical",
  lst1c11 = "categorical",
  lst1c12 = "categorical",
  lst1c13 = "categorical",
  lst1c14 = "categorical",
  lst1c15 = "categorical",
  lst1c16 = "categorical",
  lst1c17 = "categorical",
  lst1c18 = "categorical",
  lst1c19 = "categorical",
  lst1c1n = "numeric",
  lst1k01 = "categorical",
  lst1k02 = "categorical",
  lst1k03 = "categorical",
  lst1k04 = "categorical",
  lst1k05 = "categorical",
  lst1k06 = "categorical",
  lst1k07 = "categorical",
  lst1k08 = "categorical",
  lst1k09 = "categorical",
  lst1k10 = "categorical",
  lst1k11 = "categorical",
  lst1k12 = "categorical",
  lst1k13 = "categorical",
  lst1k14 = "categorical",
  lst1k15 = "categorical",
  lst1k16 = "categorical",
  lst1k17 = "categorical",
  lst1k18 = "categorical",
  lst1k19 = "categorical",
  lst2c01 = "categorical",
  lst2c02 = "categorical",
  lst2c03 = "categorical",
  lst2c04 = "categorical",
  lst2c05 = "categorical",
  lst2c06 = "categorical",
  lst2c07 = "categorical",
  lst2c08 = "categorical",
  lst2c09 = "categorical",
  lst2c10 = "categorical",
  lst2c11 = "categorical",
  lst2c12 = "categorical",
  lst2c13 = "categorical",
  lst2c14 = "categorical",
  lst2c15 = "categorical",
  lst2c20 = "categorical",
  lst2c21 = "categorical",
  lst2k01 = "categorical",
  lst2k02 = "categorical",
  lst2k03 = "categorical",
  lst2k04 = "categorical",
  lst2k05 = "categorical",
  lst2k06 = "categorical",
  lst2k07 = "categorical",
  lst2k08 = "categorical",
  lst2k09 = "categorical",
  lst2k10 = "categorical",
  lst2k11 = "categorical",
  lst2k12 = "categorical",
  lst2k13 = "categorical",
  lst2k14 = "categorical",
  lst2k15 = "categorical"
)

.lasa_fc_044 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "044", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "044", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "044", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "044", waves = .lasa_wave_rows())
)
