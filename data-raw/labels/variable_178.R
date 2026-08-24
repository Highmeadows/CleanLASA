## LASA filecode 178 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mcizctc = "contact since 2015 (in K: 2018) with CIZ or social district team about 24 hours care",
  mciznc1 = "reason no contact CIZ: no need",
  mciznc2 = "reason no contact CIZ: take care of it myself",
  mciznc3 = "reason no contact CIZ: no knowledge",
  mciznc4 = "reason no contact CIZ: do not dare, cannot do it",
  mciznc5 = "reason no contact CIZ: service unreachable",
  mciznc6 = "reason no contact CIZ: other",
  mcizpc1 = "person who contacted CIZ: respondent",
  mcizpc10 = "person who contacted CIZ: volunteer",
  mcizpc11 = "person who contacted CIZ: other",
  mcizpc2 = "person who contacted CIZ: partner of respondent",
  mcizpc3 = "person who contacted CIZ: child (in law)",
  mcizpc4 = "person who contacted CIZ: other family",
  mcizpc5 = "person who contacted CIZ: neighbour",
  mcizpc6 = "person who contacted CIZ: friend/acquaintance",
  mcizpc7 = "person who contacted CIZ: general practitioner",
  mcizpc8 = "person who contacted CIZ: district nurse",
  mcizpc9 = "person who contacted CIZ: household assistant",
  mcizrc1 = "reason contact CIZ: information",
  mcizrc2 = "reason contact CIZ: application new facility",
  mcizrc3 = "reason contact CIZ: re-evaluation existing facility",
  mcizrc4 = "reason contact CIZ: extension indication",
  mcizrc5 = "reason contact CIZ: complaint",
  mcizrc6 = "reason contact CIZ: to know where I stand with all the changes in care",
  mcizrc7 = "reason contact CIZ: other",
  mhwwctc = "contact since 2015 (in K: 2018) with general practitioner, district nurse or team about home care or nursing",
  mhwwnc1 = "reason no contact GP/nurse: no need",
  mhwwnc2 = "reason no contact GP/nurse: take care of it myself",
  mhwwnc3 = "reason no contact GP/nurse: no knowledge",
  mhwwnc4 = "reason no contact GP/nurse: do not dare, cannot do it",
  mhwwnc5 = "reason no contact GP/nurse: organisation unreachable",
  mhwwnc6 = "reason no contact GP/nurse: other",
  mhwwpc1 = "person who contacted GP/nurse: respondent",
  mhwwpc10 = "person who contacted GP/nurse: volunteer",
  mhwwpc11 = "person who contacted GP/nurse: other",
  mhwwpc2 = "person who contacted GP/nurse: partner of respondent",
  mhwwpc3 = "person who contacted GP/nurse: child (in law)",
  mhwwpc4 = "person who contacted GP/nurse: other family",
  mhwwpc5 = "person who contacted GP/nurse: neighbour",
  mhwwpc6 = "person who contacted GP/nurse: friend/acquaintance",
  mhwwpc7 = "person who contacted GP/nurse: general practitioner",
  mhwwpc8 = "person who contacted GP/nurse: district nurse",
  mhwwpc9 = "person who contacted GP/nurse: household assistant",
  mhwwrc1 = "reason contact: information",
  mhwwrc2 = "reason contact: application new facility",
  mhwwrc3 = "reason contact: re-evaluation existing facility",
  mhwwrc4 = "reason contact: extension indication",
  mhwwrc5 = "reason contact: complaint",
  mhwwrc6 = "reason contact: to know where I stand with all the changes in care",
  mhwwrc7 = "reason contact: other",
  mwmoapp = "application approved",
  mwmoctc = "Contact with municipality/WMO about support or facilities",
  mwmonc1 = "reason no contact: no need",
  mwmonc2 = "reason no contact: take care of it myself",
  mwmonc3 = "reason no contact: no knowledge",
  mwmonc4 = "reason no contact: do not dare, cannot do it",
  mwmonc5 = "reason no contact: service unreachable",
  mwmonc6 = "reason no contact: other",
  mwmopc1 = "person who contacted WMO: respondent",
  mwmopc10 = "person who contacted WMO: volunteer",
  mwmopc11 = "person who contacted WMO: other",
  mwmopc2 = "person who contacted WMO: partner of respondent",
  mwmopc3 = "person who contacted WMO: child (in law)",
  mwmopc4 = "person who contacted WMO: other family",
  mwmopc5 = "person who contacted WMO: neighbour",
  mwmopc6 = "person who contacted WMO: friend/acquaintance",
  mwmopc7 = "person who contacted WMO: general practitioner",
  mwmopc8 = "person who contacted WMO: district nurse",
  mwmopc9 = "person who contacted WMO: household assistant",
  mwmorc = "reason contact with municipality about WMO",
  mwmorc1 = "reason contact WMO: information",
  mwmorc2 = "reason contact WMO: application new facility",
  mwmorc3 = "reason contact WMO: re-evaluation existing facility",
  mwmorc4 = "reason contact WMO: extension indication",
  mwmorc5 = "reason contact WMO: complaint",
  mwmorc6 = "reason contact WMO: to know where I stand with all the changes in care",
  mwmorc7 = "reason contact WMO: other",
  mwmota1 = "type of application: domestic care",
  mwmota2 = "type of application: housing facility",
  mwmota3 = "type of application: transportation facility",
  mwmota4 = "type of application: wheelchair",
  mwmota5 = "type of application: PGB",
  mwmota6 = "type of application: support volunteer aid",
  mwmota7 = "type of application: other"
)

variable_labels_list <- list(
  Wave_G_labels = .replace_labels(
    harmonized_labels[c(
    "mwmoapp",
    "mwmoctc",
    "mwmonc1",
    "mwmonc2",
    "mwmonc3",
    "mwmonc4",
    "mwmonc5",
    "mwmonc6",
    "mwmorc",
    "mwmota1",
    "mwmota2",
    "mwmota3",
    "mwmota4",
    "mwmota5",
    "mwmota6",
    "mwmota7"
  )],
    mwmoctc = "contact with municipality about WMO since Jan 1, 2007"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c(
    "mwmoapp",
    "mwmoctc",
    "mwmonc1",
    "mwmonc2",
    "mwmonc3",
    "mwmonc4",
    "mwmonc5",
    "mwmonc6",
    "mwmorc1",
    "mwmorc2",
    "mwmorc3",
    "mwmorc4",
    "mwmorc5",
    "mwmorc6",
    "mwmota1",
    "mwmota2",
    "mwmota3",
    "mwmota4",
    "mwmota5",
    "mwmota6",
    "mwmota7"
  )],
    mwmoctc = "contact with municipality about WMO since Jan 1, 2007",
    mwmorc1 = "reason contact information",
    mwmorc2 = "reason contact application new facility",
    mwmorc3 = "reason contact re-evaluation dom. care",
    mwmorc4 = "reason contact extension indication",
    mwmorc5 = "reason contact complaint",
    mwmorc6 = "reason contact other"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c(
    "mcizctc",
    "mciznc1",
    "mciznc2",
    "mciznc3",
    "mciznc4",
    "mciznc5",
    "mciznc6",
    "mcizrc1",
    "mcizrc2",
    "mcizrc3",
    "mcizrc4",
    "mcizrc5",
    "mcizrc6",
    "mcizrc7",
    "mhwwctc",
    "mhwwnc1",
    "mhwwnc2",
    "mhwwnc3",
    "mhwwnc4",
    "mhwwnc5",
    "mhwwnc6",
    "mhwwrc1",
    "mhwwrc2",
    "mhwwrc3",
    "mhwwrc4",
    "mhwwrc5",
    "mhwwrc6",
    "mhwwrc7",
    "mwmoctc",
    "mwmonc1",
    "mwmonc2",
    "mwmonc3",
    "mwmonc4",
    "mwmonc5",
    "mwmonc6",
    "mwmorc1",
    "mwmorc2",
    "mwmorc3",
    "mwmorc4",
    "mwmorc5",
    "mwmorc6",
    "mwmorc7"
  )],
    mcizctc = "contact since 2012 with CIZ or social district team about 24 hours care",
    mciznc1 = "reason no contact: no need",
    mciznc2 = "reason no contact: take care of it myself",
    mciznc3 = "reason no contact: no knowledge",
    mciznc4 = "reason no contact: do not dare, cannot do it",
    mciznc5 = "reason no contact: service unreachable",
    mciznc6 = "reason no contact: other",
    mcizrc1 = "reason contact: information",
    mcizrc2 = "reason contact: application new facility",
    mcizrc3 = "reason contact: re-evaluation existing facility",
    mcizrc4 = "reason contact: extension indication",
    mcizrc5 = "reason contact: complaint",
    mcizrc6 = "reason contact: to know where I stand with all the changes in care",
    mcizrc7 = "reason contact: other",
    mhwwctc = "contact since 2012 with general practitioner, district nurse or team about home care or nursing",
    mhwwnc1 = "reason no contact: no need",
    mhwwnc2 = "reason no contact: take care of it myself",
    mhwwnc3 = "reason no contact: no knowledge",
    mhwwnc4 = "reason no contact: do not dare, cannot do it",
    mhwwnc5 = "reason no contact: organisation unreachable",
    mhwwnc6 = "reason no contact: other",
    mwmoctc = "contact since 2012 with municipality or WMO about support or facilities",
    mwmorc2 = "reason contact: application new facility",
    mwmorc3 = "reason contact: re-evaluation existing facility",
    mwmorc4 = "reason contact: extension indication",
    mwmorc5 = "reason contact: complaint",
    mwmorc6 = "reason contact: to know where I stand with all the changes in care",
    mwmorc7 = "reason contact: other"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c(
    "mcizctc",
    "mciznc1",
    "mciznc2",
    "mciznc3",
    "mciznc4",
    "mciznc5",
    "mciznc6",
    "mcizpc1",
    "mcizpc10",
    "mcizpc11",
    "mcizpc2",
    "mcizpc3",
    "mcizpc4",
    "mcizpc5",
    "mcizpc6",
    "mcizpc7",
    "mcizpc8",
    "mcizpc9",
    "mcizrc1",
    "mcizrc2",
    "mcizrc3",
    "mcizrc4",
    "mcizrc5",
    "mcizrc6",
    "mcizrc7",
    "mhwwctc",
    "mhwwnc1",
    "mhwwnc2",
    "mhwwnc3",
    "mhwwnc4",
    "mhwwnc5",
    "mhwwnc6",
    "mhwwpc1",
    "mhwwpc10",
    "mhwwpc11",
    "mhwwpc2",
    "mhwwpc3",
    "mhwwpc4",
    "mhwwpc5",
    "mhwwpc6",
    "mhwwpc7",
    "mhwwpc8",
    "mhwwpc9",
    "mhwwrc1",
    "mhwwrc2",
    "mhwwrc3",
    "mhwwrc4",
    "mhwwrc5",
    "mhwwrc6",
    "mhwwrc7",
    "mwmoctc",
    "mwmonc1",
    "mwmonc2",
    "mwmonc3",
    "mwmonc4",
    "mwmonc5",
    "mwmonc6",
    "mwmopc1",
    "mwmopc10",
    "mwmopc11",
    "mwmopc2",
    "mwmopc3",
    "mwmopc4",
    "mwmopc5",
    "mwmopc6",
    "mwmopc7",
    "mwmopc8",
    "mwmopc9",
    "mwmorc1",
    "mwmorc2",
    "mwmorc3",
    "mwmorc4",
    "mwmorc5",
    "mwmorc6",
    "mwmorc7"
  )],
    mhwwrc1 = "reason contact GP/nurse: information",
    mhwwrc2 = "reason contact GP/nurse: application new facility",
    mhwwrc3 = "reason contact GP/nurse: re-evaluation existing facility",
    mhwwrc4 = "reason contact GP/nurse: extension indication",
    mhwwrc5 = "reason contact GP/nurse: complaint",
    mhwwrc6 = "reason contact GP/nurse: to know where I stand with all the changes in care",
    mhwwrc7 = "reason contact GP/nurse: other",
    mwmoctc = "contact since 2015 (in K: 2018) with municipality or WMO about support or facilities",
    mwmonc1 = "reason no contact WMO: no need",
    mwmonc2 = "reason no contact WMO: take care of it myself",
    mwmonc3 = "reason no contact WMO: no knowledge",
    mwmonc4 = "reason no contact WMO: do not dare, cannot do it",
    mwmonc5 = "reason no contact WMO : service unreachable",
    mwmonc6 = "reason no contact WMO: other"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c(
    "mcizctc",
    "mciznc1",
    "mciznc2",
    "mciznc3",
    "mciznc4",
    "mciznc5",
    "mciznc6",
    "mcizpc1",
    "mcizpc10",
    "mcizpc11",
    "mcizpc2",
    "mcizpc3",
    "mcizpc4",
    "mcizpc5",
    "mcizpc6",
    "mcizpc7",
    "mcizpc8",
    "mcizpc9",
    "mcizrc1",
    "mcizrc2",
    "mcizrc3",
    "mcizrc4",
    "mcizrc5",
    "mcizrc6",
    "mcizrc7",
    "mhwwctc",
    "mhwwnc1",
    "mhwwnc2",
    "mhwwnc3",
    "mhwwnc4",
    "mhwwnc5",
    "mhwwnc6",
    "mhwwpc1",
    "mhwwpc10",
    "mhwwpc11",
    "mhwwpc2",
    "mhwwpc3",
    "mhwwpc4",
    "mhwwpc5",
    "mhwwpc6",
    "mhwwpc7",
    "mhwwpc8",
    "mhwwpc9",
    "mhwwrc1",
    "mhwwrc2",
    "mhwwrc3",
    "mhwwrc4",
    "mhwwrc5",
    "mhwwrc6",
    "mhwwrc7",
    "mwmoctc",
    "mwmonc1",
    "mwmonc2",
    "mwmonc3",
    "mwmonc4",
    "mwmonc5",
    "mwmonc6",
    "mwmopc1",
    "mwmopc10",
    "mwmopc11",
    "mwmopc2",
    "mwmopc3",
    "mwmopc4",
    "mwmopc5",
    "mwmopc6",
    "mwmopc7",
    "mwmopc8",
    "mwmopc9",
    "mwmorc1",
    "mwmorc2",
    "mwmorc3",
    "mwmorc4",
    "mwmorc5",
    "mwmorc6",
    "mwmorc7"
  )],
    mhwwrc1 = "reason contact GP/nurse: information",
    mhwwrc2 = "reason contact GP/nurse: application new facility",
    mhwwrc3 = "reason contact GP/nurse: re-evaluation existing facility",
    mhwwrc4 = "reason contact GP/nurse: extension indication",
    mhwwrc5 = "reason contact GP/nurse: complaint",
    mhwwrc6 = "reason contact GP/nurse: to know where I stand with all the changes in care",
    mhwwrc7 = "reason contact GP/nurse: other",
    mwmoctc = "contact since 2015 (in K: 2018) with municipality or WMO about support or facilities",
    mwmonc1 = "reason no contact WMO: no need",
    mwmonc2 = "reason no contact WMO: take care of it myself",
    mwmonc3 = "reason no contact WMO: no knowledge",
    mwmonc4 = "reason no contact WMO: do not dare, cannot do it",
    mwmonc5 = "reason no contact WMO : service unreachable",
    mwmonc6 = "reason no contact WMO: other"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mcizctc = c(`-3` = "na, section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  mciznc1 = c(
    `-2` = "na, see IMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mciznc2 = c(
    `-2` = "na, see IMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mciznc3 = c(
    `-2` = "na, see IMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mciznc4 = c(
    `-2` = "na, see IMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mciznc5 = c(
    `-2` = "na, see IMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mciznc6 = c(
    `-2` = "na, see IMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizpc1 = c(
    `-2` = "na, see J/KMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizpc10 = c(
    `-2` = "na, see J/KMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizpc11 = c(
    `-2` = "na, see J/KMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizpc2 = c(
    `-2` = "na, see J/KMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizpc3 = c(
    `-2` = "na, see J/KMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizpc4 = c(
    `-2` = "na, see J/KMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizpc5 = c(
    `-2` = "na, see J/KMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizpc6 = c(
    `-2` = "na, see J/KMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizpc7 = c(
    `-2` = "na, see J/KMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizpc8 = c(
    `-2` = "na, see J/KMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizpc9 = c(
    `-2` = "na, see J/KMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizrc1 = c(
    `-2` = "na, see IMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizrc2 = c(
    `-2` = "na, see IMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizrc3 = c(
    `-2` = "na, see IMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizrc4 = c(
    `-2` = "na, see IMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizrc5 = c(
    `-2` = "na, see IMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizrc6 = c(
    `-2` = "na, see IMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcizrc7 = c(
    `-2` = "na, see IMCIZCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwctc = c(`-3` = "na, section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  mhwwnc1 = c(
    `-2` = "na, see IMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwnc2 = c(
    `-2` = "na, see IMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwnc3 = c(
    `-2` = "na, see IMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwnc4 = c(
    `-2` = "na, see IMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwnc5 = c(
    `-2` = "na, see IMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwnc6 = c(
    `-2` = "na, see IMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwpc1 = c(
    `-2` = "na, see J/KMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwpc10 = c(
    `-2` = "na, see J/KMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwpc11 = c(
    `-2` = "na, see J/KMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwpc2 = c(
    `-2` = "na, see J/KMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwpc3 = c(
    `-2` = "na, see J/KMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwpc4 = c(
    `-2` = "na, see J/KMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwpc5 = c(
    `-2` = "na, see J/KMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwpc6 = c(
    `-2` = "na, see J/KMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwpc7 = c(
    `-2` = "na, see J/KMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwpc8 = c(
    `-2` = "na, see J/KMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwpc9 = c(
    `-2` = "na, see J/KMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwrc1 = c(
    `-2` = "na, see IMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwrc2 = c(
    `-2` = "na, see IMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwrc3 = c(
    `-2` = "na, see IMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwrc4 = c(
    `-2` = "na, see IMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwrc5 = c(
    `-2` = "na, see IMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwrc6 = c(
    `-2` = "na, see IMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhwwrc7 = c(
    `-2` = "na, see IMHWWCTC",
    `-1` = "no answer, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mwmoapp = c(
    `-2` = "na, see G/HMWMOMUN",
    `-1` = "na, asked",
    `1` = "yes, approved",
    `2` = "no, denied: informal network",
    `3` = "no, denied: not severe enough",
    `4` = "no, denied: other"
  ),
  mwmoctc = c(`-3` = "na, section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  mwmonc1 = c(`-2` = "na, see IMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmonc2 = c(`-2` = "na, see IMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmonc3 = c(`-2` = "na, see IMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmonc4 = c(`-2` = "na, see IMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmonc5 = c(`-2` = "na, see IMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmonc6 = c(`-2` = "na, see IMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmopc1 = c(`-2` = "na, see J/KMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmopc10 = c(`-2` = "na, see J/KMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmopc11 = c(`-2` = "na, see J/KMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmopc2 = c(`-2` = "na, see J/KMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmopc3 = c(`-2` = "na, see J/KMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmopc4 = c(`-2` = "na, see J/KMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmopc5 = c(`-2` = "na, see J/KMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmopc6 = c(`-2` = "na, see J/KMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmopc7 = c(`-2` = "na, see J/KMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmopc8 = c(`-2` = "na, see J/KMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmopc9 = c(`-2` = "na, see J/KMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmorc = c(
    `-2` = "na, see GMWMOMUN",
    `-1` = "no answer, asked",
    `1` = "obtain information",
    `2` = "application for a new facility",
    `3` = "re-evaluation domestic care",
    `4` = "extension of an indication",
    `5` = "filing a complaint",
    `6` = "other reason"
  ),
  mwmorc1 = c(`-2` = "na, see HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmorc2 = c(`-2` = "na, see HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmorc3 = c(`-2` = "na, see HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmorc4 = c(`-2` = "na, see HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmorc5 = c(`-2` = "na, see HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmorc6 = c(`-2` = "na, see HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmorc7 = c(`-2` = "na, see IMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmota1 = c(`-2` = "na, see G/HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmota2 = c(`-2` = "na, see G/HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmota3 = c(`-2` = "na, see G/HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmota4 = c(`-2` = "na, see G/HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmota5 = c(`-2` = "na, see G/HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmota6 = c(`-2` = "na, see G/HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mwmota7 = c(`-2` = "na, see G/HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")
)

value_labels_list <- list(
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "mwmoapp",
    "mwmoctc",
    "mwmonc1",
    "mwmonc2",
    "mwmonc3",
    "mwmonc4",
    "mwmonc5",
    "mwmonc6",
    "mwmorc",
    "mwmota1",
    "mwmota2",
    "mwmota3",
    "mwmota4",
    "mwmota5",
    "mwmota6",
    "mwmota7"
  )],
    mwmoctc = c(`-3` = "na, section not done", `1` = "no", `2` = "yes"),
    mwmonc1 = .replace_labels(
    standardized_value_labels$mwmonc1,
    `-2` = "na, see G/HMWMOMUN"
  ),
    mwmonc2 = .replace_labels(
    standardized_value_labels$mwmonc2,
    `-2` = "na, see G/HMWMOMUN"
  ),
    mwmonc3 = .replace_labels(
    standardized_value_labels$mwmonc3,
    `-2` = "na, see G/HMWMOMUN"
  ),
    mwmonc4 = .replace_labels(
    standardized_value_labels$mwmonc4,
    `-2` = "na, see G/HMWMOMUN"
  ),
    mwmonc5 = .replace_labels(
    standardized_value_labels$mwmonc5,
    `-2` = "na, see G/HMWMOMUN"
  ),
    mwmonc6 = .replace_labels(
    standardized_value_labels$mwmonc6,
    `-2` = "na, see G/HMWMOMUN"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "mwmoapp",
    "mwmoctc",
    "mwmonc1",
    "mwmonc2",
    "mwmonc3",
    "mwmonc4",
    "mwmonc5",
    "mwmonc6",
    "mwmorc1",
    "mwmorc2",
    "mwmorc3",
    "mwmorc4",
    "mwmorc5",
    "mwmorc6",
    "mwmota1",
    "mwmota2",
    "mwmota3",
    "mwmota4",
    "mwmota5",
    "mwmota6",
    "mwmota7"
  )],
    mwmoctc = c(`-3` = "na, section not done", `1` = "no", `2` = "yes"),
    mwmonc1 = .replace_labels(
    standardized_value_labels$mwmonc1,
    `-2` = "na, see G/HMWMOMUN"
  ),
    mwmonc2 = .replace_labels(
    standardized_value_labels$mwmonc2,
    `-2` = "na, see G/HMWMOMUN"
  ),
    mwmonc3 = .replace_labels(
    standardized_value_labels$mwmonc3,
    `-2` = "na, see G/HMWMOMUN"
  ),
    mwmonc4 = .replace_labels(
    standardized_value_labels$mwmonc4,
    `-2` = "na, see G/HMWMOMUN"
  ),
    mwmonc5 = .replace_labels(
    standardized_value_labels$mwmonc5,
    `-2` = "na, see G/HMWMOMUN"
  ),
    mwmonc6 = .replace_labels(
    standardized_value_labels$mwmonc6,
    `-2` = "na, see G/HMWMOMUN"
  ),
    mwmorc1 = .replace_labels(
    standardized_value_labels$mwmorc1,
    `-1` = "no answer, asked"
  ),
    mwmorc2 = .replace_labels(
    standardized_value_labels$mwmorc2,
    `-1` = "no answer, asked"
  ),
    mwmorc3 = .replace_labels(
    standardized_value_labels$mwmorc3,
    `-1` = "no answer, asked"
  ),
    mwmorc4 = .replace_labels(
    standardized_value_labels$mwmorc4,
    `-1` = "no answer, asked"
  ),
    mwmorc5 = .replace_labels(
    standardized_value_labels$mwmorc5,
    `-1` = "no answer, asked"
  ),
    mwmorc6 = .replace_labels(
    standardized_value_labels$mwmorc6,
    `-1` = "no answer, asked"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcizctc",
    "mciznc1",
    "mciznc2",
    "mciznc3",
    "mciznc4",
    "mciznc5",
    "mciznc6",
    "mcizrc1",
    "mcizrc2",
    "mcizrc3",
    "mcizrc4",
    "mcizrc5",
    "mcizrc6",
    "mcizrc7",
    "mhwwctc",
    "mhwwnc1",
    "mhwwnc2",
    "mhwwnc3",
    "mhwwnc4",
    "mhwwnc5",
    "mhwwnc6",
    "mhwwrc1",
    "mhwwrc2",
    "mhwwrc3",
    "mhwwrc4",
    "mhwwrc5",
    "mhwwrc6",
    "mhwwrc7",
    "mwmoctc",
    "mwmonc1",
    "mwmonc2",
    "mwmonc3",
    "mwmonc4",
    "mwmonc5",
    "mwmonc6",
    "mwmorc1",
    "mwmorc2",
    "mwmorc3",
    "mwmorc4",
    "mwmorc5",
    "mwmorc6",
    "mwmorc7"
  )],
    mcizctc = c(`-3` = "na, section not done", `1` = "no", `2` = "yes"),
    mhwwctc = c(`-3` = "na, section not done", `1` = "no", `2` = "yes"),
    mwmoctc = c(`-3` = "na, section not done", `1` = "no", `2` = "yes"),
    mwmorc1 = .replace_labels(
    standardized_value_labels$mwmorc1,
    `-2` = "na, see IMWMOCTC"
  ),
    mwmorc2 = .replace_labels(
    standardized_value_labels$mwmorc2,
    `-2` = "na, see IMWMOCTC"
  ),
    mwmorc3 = .replace_labels(
    standardized_value_labels$mwmorc3,
    `-2` = "na, see IMWMOCTC"
  ),
    mwmorc4 = .replace_labels(
    standardized_value_labels$mwmorc4,
    `-2` = "na, see IMWMOCTC"
  ),
    mwmorc5 = .replace_labels(
    standardized_value_labels$mwmorc5,
    `-2` = "na, see IMWMOCTC"
  ),
    mwmorc6 = .replace_labels(
    standardized_value_labels$mwmorc6,
    `-2` = "na, see IMWMOCTC"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcizctc",
    "mciznc1",
    "mciznc2",
    "mciznc3",
    "mciznc4",
    "mciznc5",
    "mciznc6",
    "mcizpc1",
    "mcizpc10",
    "mcizpc11",
    "mcizpc2",
    "mcizpc3",
    "mcizpc4",
    "mcizpc5",
    "mcizpc6",
    "mcizpc7",
    "mcizpc8",
    "mcizpc9",
    "mcizrc1",
    "mcizrc2",
    "mcizrc3",
    "mcizrc4",
    "mcizrc5",
    "mcizrc6",
    "mcizrc7",
    "mhwwctc",
    "mhwwnc1",
    "mhwwnc2",
    "mhwwnc3",
    "mhwwnc4",
    "mhwwnc5",
    "mhwwnc6",
    "mhwwpc1",
    "mhwwpc10",
    "mhwwpc11",
    "mhwwpc2",
    "mhwwpc3",
    "mhwwpc4",
    "mhwwpc5",
    "mhwwpc6",
    "mhwwpc7",
    "mhwwpc8",
    "mhwwpc9",
    "mhwwrc1",
    "mhwwrc2",
    "mhwwrc3",
    "mhwwrc4",
    "mhwwrc5",
    "mhwwrc6",
    "mhwwrc7",
    "mwmoctc",
    "mwmonc1",
    "mwmonc2",
    "mwmonc3",
    "mwmonc4",
    "mwmonc5",
    "mwmonc6",
    "mwmopc1",
    "mwmopc10",
    "mwmopc11",
    "mwmopc2",
    "mwmopc3",
    "mwmopc4",
    "mwmopc5",
    "mwmopc6",
    "mwmopc7",
    "mwmopc8",
    "mwmopc9",
    "mwmorc1",
    "mwmorc2",
    "mwmorc3",
    "mwmorc4",
    "mwmorc5",
    "mwmorc6",
    "mwmorc7"
  )],
    mciznc1 = .replace_labels(
    standardized_value_labels$mciznc1,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mciznc2 = .replace_labels(
    standardized_value_labels$mciznc2,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mciznc3 = .replace_labels(
    standardized_value_labels$mciznc3,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mciznc4 = .replace_labels(
    standardized_value_labels$mciznc4,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mciznc5 = .replace_labels(
    standardized_value_labels$mciznc5,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mciznc6 = .replace_labels(
    standardized_value_labels$mciznc6,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc1 = .replace_labels(
    standardized_value_labels$mcizrc1,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc2 = .replace_labels(
    standardized_value_labels$mcizrc2,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc3 = .replace_labels(
    standardized_value_labels$mcizrc3,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc4 = .replace_labels(
    standardized_value_labels$mcizrc4,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc5 = .replace_labels(
    standardized_value_labels$mcizrc5,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc6 = .replace_labels(
    standardized_value_labels$mcizrc6,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc7 = .replace_labels(
    standardized_value_labels$mcizrc7,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mhwwnc1 = .replace_labels(
    standardized_value_labels$mhwwnc1,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwnc2 = .replace_labels(
    standardized_value_labels$mhwwnc2,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwnc3 = .replace_labels(
    standardized_value_labels$mhwwnc3,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwnc4 = .replace_labels(
    standardized_value_labels$mhwwnc4,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwnc5 = .replace_labels(
    standardized_value_labels$mhwwnc5,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwnc6 = .replace_labels(
    standardized_value_labels$mhwwnc6,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc1 = .replace_labels(
    standardized_value_labels$mhwwrc1,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc2 = .replace_labels(
    standardized_value_labels$mhwwrc2,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc3 = .replace_labels(
    standardized_value_labels$mhwwrc3,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc4 = .replace_labels(
    standardized_value_labels$mhwwrc4,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc5 = .replace_labels(
    standardized_value_labels$mhwwrc5,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc6 = .replace_labels(
    standardized_value_labels$mhwwrc6,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc7 = .replace_labels(
    standardized_value_labels$mhwwrc7,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mwmonc1 = .replace_labels(
    standardized_value_labels$mwmonc1,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmonc2 = .replace_labels(
    standardized_value_labels$mwmonc2,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmonc3 = .replace_labels(
    standardized_value_labels$mwmonc3,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmonc4 = .replace_labels(
    standardized_value_labels$mwmonc4,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmonc5 = .replace_labels(
    standardized_value_labels$mwmonc5,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmonc6 = .replace_labels(
    standardized_value_labels$mwmonc6,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc1 = .replace_labels(
    standardized_value_labels$mwmorc1,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc2 = .replace_labels(
    standardized_value_labels$mwmorc2,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc3 = .replace_labels(
    standardized_value_labels$mwmorc3,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc4 = .replace_labels(
    standardized_value_labels$mwmorc4,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc5 = .replace_labels(
    standardized_value_labels$mwmorc5,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc6 = .replace_labels(
    standardized_value_labels$mwmorc6,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc7 = .replace_labels(
    standardized_value_labels$mwmorc7,
    `-2` = "na, see J/KMWMOCTC"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcizctc",
    "mciznc1",
    "mciznc2",
    "mciznc3",
    "mciznc4",
    "mciznc5",
    "mciznc6",
    "mcizpc1",
    "mcizpc10",
    "mcizpc11",
    "mcizpc2",
    "mcizpc3",
    "mcizpc4",
    "mcizpc5",
    "mcizpc6",
    "mcizpc7",
    "mcizpc8",
    "mcizpc9",
    "mcizrc1",
    "mcizrc2",
    "mcizrc3",
    "mcizrc4",
    "mcizrc5",
    "mcizrc6",
    "mcizrc7",
    "mhwwctc",
    "mhwwnc1",
    "mhwwnc2",
    "mhwwnc3",
    "mhwwnc4",
    "mhwwnc5",
    "mhwwnc6",
    "mhwwpc1",
    "mhwwpc10",
    "mhwwpc11",
    "mhwwpc2",
    "mhwwpc3",
    "mhwwpc4",
    "mhwwpc5",
    "mhwwpc6",
    "mhwwpc7",
    "mhwwpc8",
    "mhwwpc9",
    "mhwwrc1",
    "mhwwrc2",
    "mhwwrc3",
    "mhwwrc4",
    "mhwwrc5",
    "mhwwrc6",
    "mhwwrc7",
    "mwmoctc",
    "mwmonc1",
    "mwmonc2",
    "mwmonc3",
    "mwmonc4",
    "mwmonc5",
    "mwmonc6",
    "mwmopc1",
    "mwmopc10",
    "mwmopc11",
    "mwmopc2",
    "mwmopc3",
    "mwmopc4",
    "mwmopc5",
    "mwmopc6",
    "mwmopc7",
    "mwmopc8",
    "mwmopc9",
    "mwmorc1",
    "mwmorc2",
    "mwmorc3",
    "mwmorc4",
    "mwmorc5",
    "mwmorc6",
    "mwmorc7"
  )],
    mciznc1 = .replace_labels(
    standardized_value_labels$mciznc1,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mciznc2 = .replace_labels(
    standardized_value_labels$mciznc2,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mciznc3 = .replace_labels(
    standardized_value_labels$mciznc3,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mciznc4 = .replace_labels(
    standardized_value_labels$mciznc4,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mciznc5 = .replace_labels(
    standardized_value_labels$mciznc5,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mciznc6 = .replace_labels(
    standardized_value_labels$mciznc6,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc1 = .replace_labels(
    standardized_value_labels$mcizrc1,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc2 = .replace_labels(
    standardized_value_labels$mcizrc2,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc3 = .replace_labels(
    standardized_value_labels$mcizrc3,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc4 = .replace_labels(
    standardized_value_labels$mcizrc4,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc5 = .replace_labels(
    standardized_value_labels$mcizrc5,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc6 = .replace_labels(
    standardized_value_labels$mcizrc6,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mcizrc7 = .replace_labels(
    standardized_value_labels$mcizrc7,
    `-2` = "na, see J/KMCIZCTC"
  ),
    mhwwnc1 = .replace_labels(
    standardized_value_labels$mhwwnc1,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwnc2 = .replace_labels(
    standardized_value_labels$mhwwnc2,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwnc3 = .replace_labels(
    standardized_value_labels$mhwwnc3,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwnc4 = .replace_labels(
    standardized_value_labels$mhwwnc4,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwnc5 = .replace_labels(
    standardized_value_labels$mhwwnc5,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwnc6 = .replace_labels(
    standardized_value_labels$mhwwnc6,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc1 = .replace_labels(
    standardized_value_labels$mhwwrc1,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc2 = .replace_labels(
    standardized_value_labels$mhwwrc2,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc3 = .replace_labels(
    standardized_value_labels$mhwwrc3,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc4 = .replace_labels(
    standardized_value_labels$mhwwrc4,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc5 = .replace_labels(
    standardized_value_labels$mhwwrc5,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc6 = .replace_labels(
    standardized_value_labels$mhwwrc6,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mhwwrc7 = .replace_labels(
    standardized_value_labels$mhwwrc7,
    `-2` = "na, see J/KMHWWCTC"
  ),
    mwmonc1 = .replace_labels(
    standardized_value_labels$mwmonc1,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmonc2 = .replace_labels(
    standardized_value_labels$mwmonc2,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmonc3 = .replace_labels(
    standardized_value_labels$mwmonc3,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmonc4 = .replace_labels(
    standardized_value_labels$mwmonc4,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmonc5 = .replace_labels(
    standardized_value_labels$mwmonc5,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmonc6 = .replace_labels(
    standardized_value_labels$mwmonc6,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc1 = .replace_labels(
    standardized_value_labels$mwmorc1,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc2 = .replace_labels(
    standardized_value_labels$mwmorc2,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc3 = .replace_labels(
    standardized_value_labels$mwmorc3,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc4 = .replace_labels(
    standardized_value_labels$mwmorc4,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc5 = .replace_labels(
    standardized_value_labels$mwmorc5,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc6 = .replace_labels(
    standardized_value_labels$mwmorc6,
    `-2` = "na, see J/KMWMOCTC"
  ),
    mwmorc7 = .replace_labels(
    standardized_value_labels$mwmorc7,
    `-2` = "na, see J/KMWMOCTC"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mcizctc = "categorical",
  mciznc1 = "categorical",
  mciznc2 = "categorical",
  mciznc3 = "categorical",
  mciznc4 = "categorical",
  mciznc5 = "categorical",
  mciznc6 = "categorical",
  mcizpc1 = "categorical",
  mcizpc10 = "categorical",
  mcizpc11 = "categorical",
  mcizpc2 = "categorical",
  mcizpc3 = "categorical",
  mcizpc4 = "categorical",
  mcizpc5 = "categorical",
  mcizpc6 = "categorical",
  mcizpc7 = "categorical",
  mcizpc8 = "categorical",
  mcizpc9 = "categorical",
  mcizrc1 = "categorical",
  mcizrc2 = "categorical",
  mcizrc3 = "categorical",
  mcizrc4 = "categorical",
  mcizrc5 = "categorical",
  mcizrc6 = "categorical",
  mcizrc7 = "categorical",
  mhwwctc = "categorical",
  mhwwnc1 = "categorical",
  mhwwnc2 = "categorical",
  mhwwnc3 = "categorical",
  mhwwnc4 = "categorical",
  mhwwnc5 = "categorical",
  mhwwnc6 = "categorical",
  mhwwpc1 = "categorical",
  mhwwpc10 = "categorical",
  mhwwpc11 = "categorical",
  mhwwpc2 = "categorical",
  mhwwpc3 = "categorical",
  mhwwpc4 = "categorical",
  mhwwpc5 = "categorical",
  mhwwpc6 = "categorical",
  mhwwpc7 = "categorical",
  mhwwpc8 = "categorical",
  mhwwpc9 = "categorical",
  mhwwrc1 = "categorical",
  mhwwrc2 = "categorical",
  mhwwrc3 = "categorical",
  mhwwrc4 = "categorical",
  mhwwrc5 = "categorical",
  mhwwrc6 = "categorical",
  mhwwrc7 = "categorical",
  mwmoapp = "categorical",
  mwmoctc = "categorical",
  mwmonc1 = "categorical",
  mwmonc2 = "categorical",
  mwmonc3 = "categorical",
  mwmonc4 = "categorical",
  mwmonc5 = "categorical",
  mwmonc6 = "categorical",
  mwmopc1 = "categorical",
  mwmopc10 = "categorical",
  mwmopc11 = "categorical",
  mwmopc2 = "categorical",
  mwmopc3 = "categorical",
  mwmopc4 = "categorical",
  mwmopc5 = "categorical",
  mwmopc6 = "categorical",
  mwmopc7 = "categorical",
  mwmopc8 = "categorical",
  mwmopc9 = "categorical",
  mwmorc = "categorical",
  mwmorc1 = "categorical",
  mwmorc2 = "categorical",
  mwmorc3 = "categorical",
  mwmorc4 = "categorical",
  mwmorc5 = "categorical",
  mwmorc6 = "categorical",
  mwmorc7 = "categorical",
  mwmota1 = "categorical",
  mwmota2 = "categorical",
  mwmota3 = "categorical",
  mwmota4 = "categorical",
  mwmota5 = "categorical",
  mwmota6 = "categorical",
  mwmota7 = "categorical"
)

.lasa_fc_178 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "178", waves = .lasa_wave_rows()) |>
    .override_label(wave = "G", variable = "mwmoctc", override_value = "gmwmomun") |>
    .override_label(wave = "H", variable = "mwmoctc", override_value = "hmwmomun"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "178", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "178", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "178", waves = .lasa_wave_rows())
)
