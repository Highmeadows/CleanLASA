## LASA filecode 070 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: give it its own variable_labels()/value_labels() calls
## (or add it to .applies_to_waves of an existing call sharing its text).
## To add a new variable: add it to var_types_vec, then declare its
## text/codes below.

# define variable types ----
## Every canonical variable name this filecode declares, and its
## collapsed type ("numeric"/"categorical"/"text"/"date"). Free order --
## matched by name everywhere below, never by position.
var_types_vec <- c(
  altru1 = "categorical",
  altru2 = "categorical",
  altru3 = "categorical",
  altru4 = "categorical",
  altru5 = "categorical",
  rmso = "categorical",
  socp01 = "categorical",
  socp01n = "categorical",
  socp02 = "categorical",
  socp03 = "categorical",
  socp04 = "categorical",
  socp04n = "categorical",
  socp05 = "categorical",
  socp05n = "categorical",
  socp06 = "categorical",
  socp06n = "categorical",
  socp07 = "categorical",
  socp08 = "categorical",
  socp08n = "categorical",
  socp09 = "categorical",
  socp09n = "categorical",
  socp10 = "categorical",
  socp10n = "categorical",
  socp11 = "categorical",
  socp11n = "categorical",
  socp12 = "categorical",
  socp12n = "categorical",
  socp13 = "categorical",
  socp13n = "categorical",
  socp13x = "categorical",
  socp14 = "categorical",
  socp15 = "categorical",
  socp16 = "categorical",
  socp17 = "categorical",
  socp18 = "categorical",
  socp19 = "categorical",
  socp20 = "categorical",
  socp21 = "categorical",
  socp22 = "categorical",
  socp23 = "categorical",
  socp24 = "categorical",
  socp25 = "categorical",
  socp26 = "categorical",
  socp27 = "categorical",
  socp28 = "categorical",
  socp30 = "numeric",
  socp31 = "categorical",
  socp33 = "numeric",
  socp34 = "categorical",
  socp35 = "categorical",
  socp36 = "categorical",
  socp37 = "categorical",
  socp38 = "categorical",
  socp39 = "categorical",
  socp40 = "categorical",
  socp41 = "categorical",
  socp42 = "categorical",
  socp43 = "categorical",
  socp44 = "categorical",
  socp44b = "categorical",
  socp45 = "categorical",
  socp46 = "categorical",
  socp47 = "categorical",
  socp48 = "categorical",
  socp49 = "categorical",
  socp50 = "categorical",
  socp51 = "categorical",
  socp52 = "categorical",
  socp54 = "numeric",
  socp55 = "categorical",
  socp56 = "categorical",
  socp57 = "categorical",
  socp58 = "categorical",
  socp59 = "categorical",
  socp60 = "categorical",
  socp61 = "categorical",
  socp62 = "categorical",
  socp63 = "categorical",
  socp64 = "categorical",
  socp65 = "categorical",
  socp66 = "categorical",
  socp67 = "numeric",
  socp68 = "categorical",
  socp69 = "numeric",
  socp70 = "categorical",
  socp71 = "numeric",
  socp72 = "categorical",
  socp73 = "numeric",
  socp74 = "categorical",
  socp75 = "categorical",
  socp76 = "categorical",
  socp77 = "categorical",
  socp78 = "categorical",
  socp79 = "categorical",
  socp80 = "text",
  socp81 = "categorical",
  socp82 = "categorical",
  socp83 = "categorical",
  socp84 = "categorical",
  socp85 = "categorical",
  socp86 = "categorical",
  socp87 = "categorical",
  socp88 = "categorical",
  socp89 = "text",
  socp90 = "numeric",
  socp91 = "categorical",
  socp92 = "categorical",
  socp93 = "categorical",
  socp94 = "categorical",
  socp95 = "categorical",
  socp96 = "categorical",
  socp97 = "categorical",
  socp98 = "categorical",
  socp99 = "categorical",
  socpr50 = "categorical",
  socpyn = "categorical",
  sp72n1 = "categorical",
  sp72n10 = "categorical",
  sp72n11 = "categorical",
  sp72n12 = "categorical",
  sp72n2 = "categorical",
  sp72n3 = "categorical",
  sp72n4 = "categorical",
  sp72n5 = "categorical",
  sp72n6 = "categorical",
  sp72n7 = "categorical",
  sp72n8 = "categorical",
  sp72n9 = "categorical",
  sp93n1 = "categorical",
  sp93n11 = "categorical",
  sp93n12 = "categorical",
  sp93n13 = "categorical",
  sp93n14 = "categorical",
  sp93n2 = "categorical",
  sp93n3 = "categorical",
  sp93n4 = "categorical",
  sp93n5 = "categorical",
  sp93n6 = "categorical",
  sp93n7 = "categorical",
  sp93n8 = "categorical",
  sp93n9 = "categorical",
  sp95f1 = "categorical",
  sp95f10 = "categorical",
  sp95f11 = "categorical",
  sp95f12 = "categorical",
  sp95f13 = "categorical",
  sp95f14 = "categorical",
  sp95f15 = "categorical",
  sp95f16 = "categorical",
  sp95f17 = "categorical",
  sp95f2 = "categorical",
  sp95f3 = "categorical",
  sp95f4 = "categorical",
  sp95f5 = "categorical",
  sp95f6 = "categorical",
  sp95f7 = "categorical",
  sp95f8 = "categorical",
  sp95f9 = "categorical",
  sp97s1 = "categorical",
  sp97s2 = "categorical",
  sp97s3 = "categorical",
  sp97s4 = "categorical",
  sp97s5 = "categorical",
  sp97s6 = "categorical",
  sp97s7 = "categorical",
  sp97s8 = "categorical"
)

# define variable labels ----
variable_labels(
  altru1 = "Altruism:",
  altru2 = "Altruism: working for the common good",
  altru3 = "Altruism: important making effort for others",
  altru4 = "Altruism: important giving to the poor",
  altru5 = "Altruism: generally people can be trusted",
  rmso = "Reason missing: Social participation",
  socp01 = "Organization for the elderly",
  socp01n = "How",
  socp02 = "Trade union, employers organization",
  socp03 = "Political party or organization",
  socp04 = "Church or religious organization",
  socp04n = "How",
  socp05 = "Neighbourhood association",
  socp05n = "How",
  socp06 = "Womens association, womens circle",
  socp06n = "How",
  socp07 = "Organ. to assist elderly or disabled",
  socp08 = "Action group or ass. with social aim",
  socp08n = "How",
  socp09 = "Patients association",
  socp09n = "How",
  socp10 = "Choir, musical society or drama club",
  socp10n = "How",
  socp11 = "Hobby club or social club",
  socp11n = "How",
  socp12 = "Sporting club",
  socp12n = "How",
  socp13 = "Other",
  socp13n = "How",
  socp13x = "Other: categorized",
  socp14 = "Visiting: Org. for the elderly",
  socp15 = "Visiting: Trade union, employers org.",
  socp16 = "Visiting: Political party or org.",
  socp17 = "Visiting: Church or religious org.",
  socp18 = "Visiting: Neighbourhood association.",
  socp19 = "Visiting: Womens ass. or womens circle",
  socp20 = "Visiting: Org. to assist eld. and disabl.",
  socp21 = "Visiting: Action group or ass. social aim",
  socp22 = "Visiting: Patients association",
  socp23 = "Visiting: Choir, mus.society or dramaclub",
  socp24 = "Visiting: Hobby club or social club",
  socp25 = "Visiting: Sporting club",
  socp26 = "Visiting: Other",
  socp27 = "Visiting: Organizations all",
  socp28 = "Participation: administrative work",
  socp30 = "Participation: adm.work in minutes/week",
  socp31 = "Participation: volunteers work",
  socp33 = "Participation: vol.work in minutes/week",
  socp34 = "Reason: mentally fysically fit",
  socp35 = "Reason: development own capability",
  socp36 = "Reason: social contacts",
  socp37 = "Reason: responsibility",
  socp38 = "Reason: other",
  socp39 = "Reason not: not interested",
  socp40 = "Reason not: no time",
  socp41 = "Reason not: not enjoyable",
  socp42 = "Reason not: bad health",
  socp43 = "Reason not: no transportation",
  socp44 = "Reason not: fear to go on the street",
  socp44b = "Reason not: age too high or too old",
  socp45 = "Reason not: other",
  socp46 = "Cultural: cinema, museum, exhib., artgallery",
  socp47 = "Cultural: trip, recreation, zoo, entertainmt",
  socp48 = "Cultural: social cultural centrum",
  socp49 = "Cultural: pub, restaurant, dancing salon",
  socp50 = "Cultural: outdoor sporting",
  socp51 = "Cultural: visiting sporting competition",
  socp52 = "Cultural: shopping for pleasure",
  socp54 = "Hobbies in and around the house min/day",
  socp55 = "Study: Yes/no",
  socp56 = "Study: qualifying education",
  socp57 = "Study: creativity course",
  socp58 = "Study: general knowledge or language",
  socp59 = "Study: emancipation for woman",
  socp60 = "Study: emancipation for elderly",
  socp61 = "Study: other",
  socp62 = "Reason: mentally fysically fit",
  socp63 = "Reason: development own capability",
  socp64 = "Reason: social contacts",
  socp65 = "Reason: responsibility",
  socp66 = "Paid work: not over certain age",
  socp67 = "Paid work: age",
  socp68 = "Volunteers work: not over certain age",
  socp69 = "Volunteers work: age",
  socp70 = "Administrative work: not over certain age",
  socp71 = "Administrative work: Age",
  socp72 = "Computer/digital device usage",
  socp73 = "Computer/digital device usage: minutes/week",
  socp74 = "Personal computer: wordprocessing",
  socp75 = "Personal computer: administration",
  socp76 = "Personal computer: hobbies",
  socp77 = "Personal computer: games",
  socp78 = "Personal computer: internet",
  socp79 = "Personal computer: other",
  socp80 = "Personal computer: other specified",
  socp81 = "Internet: surfing",
  socp82 = "Internet: email",
  socp83 = "Internet: chat",
  socp84 = "Internet: newsgroups",
  socp85 = "Internet: discussion groups",
  socp86 = "Internet: shopping",
  socp87 = "Internet: telebanking",
  socp88 = "Internet: other",
  socp89 = "Internet: other specified",
  socp90 = "Internet: minutes per week",
  socp91 = "Internet: personal support received",
  socp92 = "Internet: personal support given",
  socp93 = "Calling mobile or using messaging service",
  socp94 = "Calling mobile or using messaging service: how often",
  socp95 = "Internet: usage",
  socp96 = "Internet: contact with family, friends",
  socp97 = "In need of IT support na, wrong skip)-3), na, see H/B/ISOCP72 &",
  socp98 = "IT support: how",
  socp99 = "Voted last election",
  socpr50 = "Cultural: outdoor sporting",
  socpyn = "Member or involved in organization",
  sp72n1 = "Not using PC: not interested",
  sp72n10 = "Not using PC: no time",
  sp72n11 = "Not using PC: too difficult",
  sp72n12 = "Not using PC: maybe in the future",
  sp72n2 = "Not using PC: no help",
  sp72n3 = "Not using PC: too old",
  sp72n4 = "Not using PC: dont have PC",
  sp72n5 = "Not using PC: health problem",
  sp72n6 = "Not using PC: afraid of computers",
  sp72n7 = "Not using PC: too expensive",
  sp72n8 = "Not using PC: other reason",
  sp72n9 = "Not using PC: no space",
  sp93n1 = "Not using mobile: not interested",
  sp93n11 = "Not using mobile: too complicated",
  sp93n12 = "Not using mobile: maybe in the future",
  sp93n13 = "Not calling mobile: not necessary",
  sp93n14 = "Not calling mobile: dont always want to be available",
  sp93n2 = "Not using mobile: no help",
  sp93n3 = "Not using mobile: too old",
  sp93n4 = "Not using mobile: dont have mobile",
  sp93n5 = "Not using mobile: health problem",
  sp93n6 = "Not using mobile: afraid of mobiles",
  sp93n7 = "Not using mobile: too expensive",
  sp93n8 = "Not using mobile: other reason",
  sp93n9 = "Not using mobile: only emergencies",
  sp95f1 = "Internet: surfing",
  sp95f10 = "Internet: administrative tasks",
  sp95f11 = "Internet: games",
  sp95f12 = "Internet: hobbies",
  sp95f13 = "Internet: films/music",
  sp95f14 = "Internet: requesting and arranging facilities (prof. care, transport)",
  sp95f15 = "Internet: making appointments with doctors",
  sp95f16 = "Internet: arranging tax returns, health care benefits",
  sp95f17 = "Internet: using governmental portal (MijnOverheid)",
  sp95f2 = "Internet: discussion/news groups",
  sp95f3 = "Internet: order foodstuff",
  sp95f4 = "Internet: order medication",
  sp95f5 = "Internet: buy goods (travel, books, etc.)",
  sp95f6 = "Internet: maintain contacts",
  sp95f7 = "Internet: visiting medical websites",
  sp95f8 = "Internet: telebanking",
  sp95f9 = "Internet: other function",
  sp97s1 = "IT support: partner",
  sp97s2 = "IT support: children",
  sp97s3 = "IT support: other family members",
  sp97s4 = "IT support: neighbours",
  sp97s5 = "IT support: friends",
  sp97s6 = "IT support: professionals",
  sp97s7 = "IT support: nobody",
  sp97s8 = "IT support: other",
  .applies_to_waves = c("Z")
)

variable_labels(
  "socp13",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J")
)

variable_labels(
  "socp26", "socp28", "socp31",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "socp34", "socp35", "socp36", "socp37", "socp38", "socp39", "socp40", "socp41", "socp42", "socp43", "socp44", "socp45",
  .applies_to_waves = c("B", "2B", "F", "G")
)

variable_labels(
  "socp55",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

variable_labels(
  "socp59", "socp61", "socp66",
  .applies_to_waves = c("B", "C", "D", "2B", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "socp62", "socp63", "socp64", "socp65", "socp70", "socp71",
  .applies_to_waves = c("B")
)

variable_labels(
  "socp68",
  .applies_to_waves = c("B", "H", "3B", "I", "J")
)

variable_labels(
  "socp03", "socp07", "socp08", "socp10", "socp11", "socp14", "socp15", "socp16", "socp17", "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24", "socp25", "socp30", "socp33", "socp46", "socp47", "socp48", "socp49", "socp51", "socp52", "socpyn",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "socp05", "socp06", "socp09", "socp12",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J")
)

variable_labels(
  "socp13x",
  .applies_to_waves = c("C", "D", "E", "2B", "F")
)

variable_labels(
  "socp54",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G")
)

variable_labels(
  "socp56", "socp57", "socp58", "socp60",
  .applies_to_waves = c("C", "D", "2B", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "socpr50",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "J")
)

variable_labels(
  "rmso",
  .applies_to_waves = c("E", "2B", "F", "G", "H", "3B", "MB", "I", "J")
)

variable_labels(
  "socp01", "socp02", "socp04", "socp27",
  .applies_to_waves = c("E", "2B", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "socp74", "socp75", "socp76", "socp77", "socp78", "socp79", "socp80", "socp81", "socp82", "socp83", "socp84", "socp85", "socp86", "socp87", "socp88", "socp89", "socp90", "socp91", "socp92",
  .applies_to_waves = c("E", "2B", "F", "G")
)

variable_labels(
  "socp44b",
  .applies_to_waves = c("2B", "F", "G")
)

variable_labels(
  "socp67",
  .applies_to_waves = c("2B", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "altru1", "altru2", "altru3", "altru4", "altru5",
  .applies_to_waves = c("G")
)

variable_labels(
  "socp50", "socp97", "sp72n1", "sp72n10", "sp72n11", "sp72n12", "sp72n2", "sp72n3", "sp72n4", "sp72n5", "sp72n6", "sp72n7", "sp72n8", "sp72n9", "sp93n1", "sp93n11", "sp93n12", "sp93n2", "sp93n3", "sp93n4", "sp93n5", "sp93n6", "sp93n7", "sp93n8", "sp93n9", "sp95f10", "sp95f12",
  .applies_to_waves = c("H", "3B", "I")
)

variable_labels(
  "socp69", "socp96", "socp98", "sp95f1", "sp95f11", "sp95f13", "sp95f2", "sp95f3", "sp95f4", "sp95f5", "sp95f6", "sp95f7", "sp95f8", "sp95f9", "sp97s1", "sp97s2", "sp97s3", "sp97s4", "sp97s5", "sp97s6", "sp97s7", "sp97s8",
  .applies_to_waves = c("H", "3B", "I", "J")
)

variable_labels(
  "socp95",
  .applies_to_waves = c("H", "3B", "MB", "I", "J")
)

variable_labels(
  "socp99",
  .applies_to_waves = c("H", "3B")
)

variable_labels(
  "socp01n", "socp04n", "socp05n", "socp06n", "socp08n", "socp09n", "socp10n", "socp11n", "socp12n", "socp13n",
  .applies_to_waves = c("MB")
)

variable_labels(
  "socp93", "sp93n13", "sp93n14", "sp95f14", "sp95f15", "sp95f16", "sp95f17",
  .applies_to_waves = c("J")
)

variable_labels(
  socp01 = "Association for the elderly",
  socp03 = "Political party",
  socp05 = "Neighbourhood organisation",
  socp06 = "Organisation for women",
  socp07 = "Organisation for helping the elderly",
  socp08 = "Organisation with a social purpose",
  socp09 = "Organisation for patient",
  socp10 = "Organisation for singing, music or theatre",
  socp11 = "Organisation for relaxation hobby",
  socp12 = "Sportclub",
  socp14 = "Visiting: Association for the elderly",
  socp15 = "Visiting: Trade union, employers organisation",
  socp16 = "Visiting: Political party",
  socp17 = "Visiting: Church or religious organisation",
  socp18 = "Visiting: Neighbourhood organisation",
  socp19 = "Visiting: Organisation for women",
  socp20 = "Visiting: Organisation for helping the elderly",
  socp21 = "Visiting: Organisation with a social purpose",
  socp22 = "Visiting: Organisation for patients",
  socp23 = "Visiting: Organisation for singing, music or theatre",
  socp24 = "Visiting: Organisation for relaxation hobby",
  socp25 = "Visiting: Sportclub",
  socp30 = "Participation: administrative minutes (total)",
  socp33 = "Participation: volunteers work minutes (total)",
  socp46 = "Cultural: museum",
  socp47 = "Cultural: recreation",
  socp48 = "Cultural: centrum",
  socp49 = "Cultural: horeca",
  socp51 = "Cultural: sport games",
  socp52 = "Cultural: shopping",
  socp54 = "Hobbies: minutes a day (total)",
  socp56 = "Study: certified diploma",
  socp57 = "Study: hobby",
  socp58 = "Study: general knowledge",
  socp60 = "Study: emancipation elderly",
  socp69 = "Volunteers work: Age",
  socpr50 = "Cultural: sport self",
  socpyn = "Involved in association",
  .applies_to_waves = c("B")
)

variable_labels(
  socp02 = "Trade union, employers organisation",
  socp04 = "Church or religious organisation",
  socp27 = "Visiting: Organisations all",
  socp67 = "Paid work: Age",
  .applies_to_waves = c("B", "C", "D")
)

variable_labels(
  socp01 = "Association/organization for the elderly",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  socp72 = "Personal computer: usage",
  .applies_to_waves = c("E", "2B", "F", "G", "H", "3B", "MB", "I")
)

variable_labels(
  socp73 = "Personal computer: minutes/week",
  .applies_to_waves = c("E", "2B", "F", "G", "H", "3B", "I")
)

variable_labels(
  socp55 = "Study: yes/no",
  .applies_to_waves = c("H", "3B", "I", "J")
)

variable_labels(
  socp93 = "Mobile phone: usage",
  socp94 = "Mobile phone usage: how",
  .applies_to_waves = c("H", "3B", "I")
)

variable_labels(
  socp01 = "Organization for the elderly, employers organization",
  socp04 = "Church, mosque or religious organization",
  socp08 = "Action group or association with social aim",
  socp10 = "Cultural organization",
  socp11 = "Recreation, music or hobby club",
  socpyn = "Active member or involved in organization",
  .applies_to_waves = c("MB")
)

variable_labels(
  socp72 = "PC, laptop, tablet, smartphone: usage",
  socp73 = "PC, laptop, tablet, smartphone: minutes/week",
  socp94 = "Calling mobile or using messaging service: how",
  socp97 = "In need of IT support",
  sp72n1 = "Not using PC, laptop, tablet, smartphone: not interested",
  sp72n10 = "Not using PC, laptop, tablet, smartphone: no time",
  sp72n11 = "Not using PC, laptop, tablet, smartphone: too difficult",
  sp72n2 = "Not using PC, laptop, tablet, smartphone: no help",
  sp72n3 = "Not using PC, laptop, tablet, smartphone: too old",
  sp72n4 = "Not using PC, laptop, tablet, smartphone: dont have PC, laptop, tablet, smartphone",
  sp72n5 = "Not using PC, laptop, tablet, smartphone: health problem",
  sp72n6 = "Not using PC, laptop, tablet, smartphone: afraid of computers / smartphones",
  sp72n7 = "Not using PC, laptop, tablet, smartphone: too expensive",
  sp72n8 = "Not using PC, laptop, tablet, smartphone: other reason",
  sp93n1 = "Not calling mobile: not interested",
  sp93n11 = "Not calling mobile: too complicated",
  sp93n2 = "Not calling mobile: no help",
  sp93n3 = "Not calling mobile: too old",
  sp93n4 = "Not calling mobile: dont have mobile",
  sp93n5 = "Not calling mobile: health problem",
  sp93n6 = "Not calling mobile: afraid of mobiles",
  sp93n7 = "Not calling mobile: too expensive",
  sp93n8 = "Not calling mobile: other reason",
  .applies_to_waves = c("J")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("altru1", "altru2", "altru3", "altru4", "altru5", "socp01", "socp01n", "socp02", "socp03", "socp04", "socp04n", "socp05", "socp05n", "socp06", "socp06n", "socp07", "socp08", "socp08n", "socp09", "socp09n", "socp10", "socp10n", "socp11", "socp11n", "socp12", "socp12n", "socp13", "socp13n", "socp13x", "socp14", "socp15", "socp16", "socp17", "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24", "socp25", "socp26", "socp27", "socp28", "socp30", "socp31", "socp33", "socp34", "socp35", "socp36", "socp37", "socp38", "socp39", "socp40", "socp41", "socp42", "socp43", "socp44", "socp44b", "socp45", "socp46", "socp47", "socp48", "socp49", "socp50", "socp51", "socp52", "socp54", "socp55", "socp56", "socp57", "socp58", "socp59", "socp60", "socp61", "socp62", "socp63", "socp64", "socp65", "socp66", "socp67", "socp68", "socp69", "socp70", "socp71", "socp72", "socp73", "socp74", "socp75", "socp76", "socp77", "socp78", "socp79", "socp80", "socp81", "socp82", "socp83", "socp84", "socp85", "socp86", "socp87", "socp88", "socp89", "socp90", "socp91", "socp92", "socp93", "socp94", "socp95", "socp96", "socp98", "socp99", "socpr50", "socpyn", "sp72n1", "sp72n10", "sp72n11", "sp72n12", "sp72n2", "sp72n3", "sp72n4", "sp72n5", "sp72n6", "sp72n7", "sp72n8", "sp72n9", "sp93n1", "sp95f1", "sp95f10", "sp95f11", "sp95f12", "sp95f13", "sp95f14", "sp95f15", "sp95f16", "sp95f17", "sp95f2", "sp95f3", "sp95f4", "sp95f5", "sp95f6", "sp95f7", "sp95f8", "sp95f9", "sp97s1", "sp97s2", "sp97s3", "sp97s4", "sp97s5", "sp97s6", "sp97s7", "sp97s8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "valid data",
  .applies_to_vars = c("rmso"),
  .applies_to_waves = c("Z", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J")
)

value_labels(
  `-5` = "interview terminated", `-4` = "na, short interview",
  .applies_to_vars = c("socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08", "socp09", "socp10", "socp11", "socp12", "socp13", "socp14", "socp15", "socp16", "socp17", "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24", "socp25", "socp26", "socp27", "socp28", "socp30", "socp31", "socp33", "socp34", "socp35", "socp36", "socp37", "socp38", "socp39", "socp40", "socp41", "socp42", "socp43", "socp44", "socp45", "socp46", "socp47", "socp48", "socp49", "socp51", "socp52", "socp54", "socp55", "socp56", "socp57", "socp58", "socp59", "socp60", "socp61", "socp62", "socp63", "socp64", "socp65", "socp66", "socp67", "socp68", "socp69", "socp70", "socp71", "socpr50", "socpyn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "working for own well-being not available, wrong skip", `-1` = "na, asked", `1` = "does not apply to me at all", `2` = "does not apply to me", `3` = "applies to me a little", `4` = "applies to me", `5` = "apllies to me entirely",
  .applies_to_vars = c("altru1", "altru2", "altru3", "altru4", "altru5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "not available, short interview", `2` = "interview terminated",
  .applies_to_vars = c("rmso"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "label varies by wave", `2` = "yes",
  .applies_to_vars = c("socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08", "socp09", "socp10", "socp11", "socp12", "socp13", "socp56", "socp57", "socp58", "socp59", "socp60", "socp61"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "many dutch members: organization for the elderly, employers organization not available, wrong skip", `-1` = "na, asked", `1` = "mainly dutch members", `2` = "many dutch members", `3` = "little to none dutch members",
  .applies_to_vars = c("socp01n"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "many dutch members: church, mosque or religious organization not available, wrong skip", `-1` = "na, asked", `1` = "mainly dutch members", `2` = "many dutch members", `3` = "little to none dutch members",
  .applies_to_vars = c("socp04n"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "many dutch members: neighbourhood association not available, wrong skip", `-1` = "na, asked", `1` = "mainly dutch members", `2` = "many dutch members", `3` = "little to none dutch members",
  .applies_to_vars = c("socp05n"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "many dutch members: womens association, womens circle not available, wrong skip", `-1` = "na, asked", `1` = "mainly dutch members", `2` = "many dutch members", `3` = "little to none dutch members",
  .applies_to_vars = c("socp06n"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "many dutch members: action group or association with social aim not available, wrong skip", `-1` = "na, asked", `1` = "mainly dutch members", `2` = "many dutch members", `3` = "little to none dutch members",
  .applies_to_vars = c("socp08n"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "many dutch members: patients association not available, wrong skip", `-1` = "na, asked", `1` = "mainly dutch members", `2` = "many dutch members", `3` = "little to none dutch members",
  .applies_to_vars = c("socp09n"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "many dutch members: cultural organization not available, wrong skip", `-1` = "na, asked", `1` = "mainly dutch members", `2` = "many dutch members", `3` = "little to none dutch members",
  .applies_to_vars = c("socp10n"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "many dutch members: recreation, music or hobby club not available, wrong skip", `-1` = "na, asked", `1` = "mainly dutch members", `2` = "many dutch members", `3` = "little to none dutch members",
  .applies_to_vars = c("socp11n"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "many dutch members: sporting club not available, wrong skip", `-1` = "na, asked", `1` = "mainly dutch members", `2` = "many dutch members", `3` = "little to none dutch members",
  .applies_to_vars = c("socp12n"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "many dutch members: other not available, wrong skip", `-1` = "na, asked", `1` = "mainly dutch members", `2` = "many dutch members", `3` = "little to none dutch members",
  .applies_to_vars = c("socp13n"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "- to be coded -", `1` = "garden & pets", `2` = "cult.hist. ass.", `3` = "housing ass.", `4` = "other",
  .applies_to_vars = c("socp13x"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp14", "socp15", "socp16", "socp17", "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24", "socp25", "socp26", "socp31", "socp62"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "does not visit",
  .applies_to_vars = c("socp27", "socp46", "socp47", "socp48", "socp49", "socp51", "socp52", "socpr50"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "does not visit", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp28"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("socp30", "socp33"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "very applicable", `2` = "applicable", `3` = "a little applicable", `4` = "not applicable",
  .applies_to_vars = c("socp34", "socp35", "socp36", "socp37", "socp38", "socp39", "socp40", "socp41", "socp42", "socp43", "socp44", "socp44b", "socp45"),
  .applies_to_waves = c("Z", "2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("socp50"),
  .applies_to_waves = c("Z", "H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("socp54"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp55"),
  .applies_to_waves = c("Z", "E", "2B", "F", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "very applicable", `2` = "applicable", `3` = "a little applicable", `4` = "not applicable",
  .applies_to_vars = c("socp63", "socp64", "socp65"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "agree", `2` = "disagree", `3` = "no opinion/don't know",
  .applies_to_vars = c("socp66"),
  .applies_to_waves = c("Z", "C", "D", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "dependent on person", `3` = "not available, wrong skip",
  .applies_to_vars = c("socp67"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "agree", `2` = "disagree", `3` = "no opinion/don't know",
  .applies_to_vars = c("socp68"),
  .applies_to_waves = c("Z", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "dependent on person",
  .applies_to_vars = c("socp69", "socp71"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "agree", `2` = "disagree", `3` = "no opinion/don't know",
  .applies_to_vars = c("socp70"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp72"),
  .applies_to_waves = c("Z", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("socp73"),
  .applies_to_waves = c("Z", "2B", "F", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("socp74", "socp75", "socp76", "socp77", "socp78", "socp79"),
  .applies_to_waves = c("Z", "2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "- to be coded -",
  .applies_to_vars = c("socp80", "socp89"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("socp81", "socp82", "socp83", "socp84", "socp85", "socp86", "socp87", "socp88"),
  .applies_to_waves = c("Z", "E", "2B", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("socp90"),
  .applies_to_waves = c("Z", "E", "2B", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "never", `2` = "rarely", `3` = "sometimes", `4` = "often",
  .applies_to_vars = c("socp91", "socp92"),
  .applies_to_waves = c("Z", "E", "2B", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp93", "socp95"),
  .applies_to_waves = c("Z", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "often not available, wrong skip", `-1` = "na, asked", `1` = "daily", `2` = "a few times a week", `3` = "a few times a month", `4` = "a few times a year", `5` = "less than a few times a year",
  .applies_to_vars = c("socp94", "socp98"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "daily", `2` = "a few times a week", `3` = "a few times a month", `4` = "a few times a year", `5` = "less than a few times a year",
  .applies_to_vars = c("socp96"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, wrong skip)-3), not available, routing", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp97"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "not allowed to vote",
  .applies_to_vars = c("socp99"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socpyn"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("sp72n1", "sp72n10", "sp72n11", "sp72n2", "sp72n3", "sp72n4", "sp72n5", "sp72n6", "sp72n7", "sp72n8", "sp95f1", "sp95f11", "sp95f13", "sp95f2", "sp95f3", "sp95f4", "sp95f5", "sp95f6", "sp95f7", "sp95f8", "sp95f9"),
  .applies_to_waves = c("Z", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("sp72n12", "sp72n9", "sp95f10", "sp95f12"),
  .applies_to_waves = c("Z", "H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("sp93n1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("sp95f14", "sp95f15", "sp95f16", "sp95f17"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("sp97s1", "sp97s2", "sp97s3", "sp97s4", "sp97s5", "sp97s6", "sp97s7", "sp97s8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "interview broken off", `-4` = "no answer, short version", `-3` = "no answer, wrong skip", `-2` = "no answer, routing", `-1` = "no answer, asked",
  .applies_to_vars = c("socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08", "socp09", "socp10", "socp11", "socp12", "socp13", "socp14", "socp15", "socp16", "socp17", "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24", "socp25", "socp26", "socp27", "socp28", "socp30", "socp31", "socp33", "socp34", "socp35", "socp36", "socp37", "socp38", "socp39", "socp40", "socp41", "socp42", "socp43", "socp44", "socp45", "socp46", "socp47", "socp48", "socp49", "socp51", "socp52", "socp54", "socp55", "socp56", "socp57", "socp58", "socp59", "socp60", "socp61", "socp62", "socp63", "socp64", "socp65", "socp66", "socp67", "socp68", "socp69", "socp70", "socp71", "socpr50", "socpyn"),
  .applies_to_waves = c("B")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08", "socp09", "socp10", "socp11", "socp12", "socp13", "socp14", "socp15", "socp16", "socp17", "socp18", "socp19", "socp20", "socp21", "socp22", "socp23", "socp24", "socp25", "socp26", "socp31", "socp55", "socp56", "socp57", "socp58", "socp59", "socp60", "socp61", "socp62", "socpyn"),
  .applies_to_waves = c("B")
)

value_labels(
  `0` = "does not visit",
  .applies_to_vars = c("socp27", "socp46", "socp47", "socp48", "socp49", "socp51", "socp52", "socpr50"),
  .applies_to_waves = c("B")
)

value_labels(
  `0` = "does not visit", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp28"),
  .applies_to_waves = c("B")
)

value_labels(
  `1` = "very applicable", `2` = "applicable", `3` = "a little applicable", `4` = "not applicable",
  .applies_to_vars = c("socp34", "socp35", "socp36", "socp37", "socp38", "socp39", "socp40", "socp41", "socp42", "socp43", "socp44", "socp45", "socp63", "socp64", "socp65"),
  .applies_to_waves = c("B")
)

value_labels(
  `1` = "agree", `2` = "disagree", `3` = "no opinion / do not know",
  .applies_to_vars = c("socp66", "socp68", "socp70"),
  .applies_to_waves = c("B")
)

value_labels(
  `0` = "dependent of person",
  .applies_to_vars = c("socp67", "socp69", "socp71"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see C/DRMSO",
  .applies_to_vars = c("socp46", "socp47", "socp48", "socp49", "socp51", "socp52", "socp54", "socp55", "socp66", "socpr50", "socpyn"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-2` = "na, see C/DSOCP55",
  .applies_to_vars = c("socp56", "socp57", "socp58", "socp59", "socp60", "socp61"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-2` = "na, see C/DSOCPYN",
  .applies_to_vars = c("socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08", "socp09", "socp10", "socp11", "socp12", "socp13"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("socp01", "socp04", "socp05", "socp06", "socp08", "socp09", "socp10", "socp11", "socp12", "socp13"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("socp02", "socp03", "socp07"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP13", `-1` = "na, asked", `0` = "- to be coded -", `1` = "garden & pets", `2` = "cult.hist. ass.", `3` = "housing ass.", `4` = "other",
  .applies_to_vars = c("socp13x"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp14"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP02", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp15"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP03", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp16"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP04", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp17"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP05", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp18"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP06", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp19"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP07", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp20"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP08", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp21"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP09", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp22"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP10", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp23"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP11", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp24"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP12", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp25"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP13", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp26"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP14 to 26", `-1` = "na, asked", `0` = "does not visit",
  .applies_to_vars = c("socp27"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP27", `-1` = "na, asked", `0` = "does not visit", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp28"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP28", `-1` = "na, asked",
  .applies_to_vars = c("socp30"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP27", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp31"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DSOCP31", `-1` = "na, asked",
  .applies_to_vars = c("socp33"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("socp46", "socp47", "socp48", "socp49", "socp51", "socp52"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("socp55"),
  .applies_to_waves = c("C", "D", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("socp56", "socp57", "socp58", "socp59", "socp60", "socp61"),
  .applies_to_waves = c("C", "D", "2B", "F", "H", "3B", "I")
)

value_labels(
  `-2` = "na, see C/DSOCP66", `-1` = "na, asked", `0` = "dependent on person", `3` = "na, wrong skip",
  .applies_to_vars = c("socp67"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("socpr50"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "J")
)

value_labels(
  `-2` = "na, see ERMSO",
  .applies_to_vars = c("socp46", "socp47", "socp48", "socp49", "socp51", "socp52", "socp54", "socp55", "socp72", "socpr50", "socpyn"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ESOCP78",
  .applies_to_vars = c("socp81", "socp82", "socp83", "socp84", "socp85", "socp86", "socp87", "socp88", "socp90", "socp91", "socp92"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ESOCPYN",
  .applies_to_vars = c("socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08", "socp09", "socp10", "socp11", "socp12", "socp13"),
  .applies_to_waves = c("E")
)

value_labels(
  `1` = "short interview",
  .applies_to_vars = c("rmso"),
  .applies_to_waves = c("E", "2B", "F", "G", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP13", `-1` = "na, asked", `0` = "- to be coded -", `1` = "garden & pets", `2` = "cult.hist. ass.", `3` = "housing ass.", `4` = "other",
  .applies_to_vars = c("socp13x"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp14"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP02", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp15"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP03", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp16"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP04", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp17"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP05", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp18"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP06", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp19"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP07", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp20"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP08", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp21"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP09", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp22"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP10", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp23"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP11", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp24"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP12", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp25"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP13", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp26"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP14-26", `-1` = "na, asked", `0` = "does not visit",
  .applies_to_vars = c("socp27"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP27", `-1` = "na, asked", `0` = "does not visit", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp28"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP28", `-1` = "na, asked",
  .applies_to_vars = c("socp30"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP27", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp31"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP31", `-1` = "na, asked",
  .applies_to_vars = c("socp33"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP72", `-1` = "na, asked",
  .applies_to_vars = c("socp73"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP72", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("socp74", "socp75", "socp76", "socp77", "socp78", "socp79"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP79", `-1` = "na, asked", `0` = "- to be coded -",
  .applies_to_vars = c("socp80"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ESOCP88", `-1` = "na, asked", `0` = "- to be coded -",
  .applies_to_vars = c("socp89"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see B/FRMSO",
  .applies_to_vars = c("socp46", "socp47", "socp48", "socp49", "socp51", "socp52", "socp54", "socp55", "socp66", "socp72", "socpr50", "socpyn"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see B/FSOCP28 & 31",
  .applies_to_vars = c("socp34", "socp35", "socp36", "socp37", "socp38"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see B/FSOCP55",
  .applies_to_vars = c("socp56", "socp57", "socp58", "socp59", "socp60", "socp61"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see B/FSOCP72",
  .applies_to_vars = c("socp73", "socp74", "socp75", "socp76", "socp77", "socp78", "socp79"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see B/FSOCP78",
  .applies_to_vars = c("socp81", "socp82", "socp83", "socp84", "socp85", "socp86", "socp87", "socp88", "socp90", "socp91", "socp92"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see B/FSOCPYN",
  .applies_to_vars = c("socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08", "socp09", "socp10", "socp11", "socp12", "socp13"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see B/FSOCPYN,14-33",
  .applies_to_vars = c("socp39", "socp40", "socp41", "socp42", "socp43", "socp44", "socp44b", "socp45"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP13", `-1` = "na, asked", `0` = "- to be coded -", `1` = "garden & pets", `2` = "cult.hist. ass.", `3` = "housing ass.", `4` = "other",
  .applies_to_vars = c("socp13x"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp14"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP02", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp15"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP03", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp16"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP04", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp17"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP05", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp18"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP06", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp19"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP07", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp20"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP08", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp21"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP09", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp22"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP10", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp23"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP11", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp24"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP12", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp25"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP13", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp26"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP14-26", `-1` = "na, asked", `0` = "does not visit",
  .applies_to_vars = c("socp27"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP27", `-1` = "na, asked", `0` = "does not visit", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp28"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP28", `-1` = "na, asked",
  .applies_to_vars = c("socp30"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP27", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp31"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP31", `-1` = "na, asked",
  .applies_to_vars = c("socp33"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP66", `-1` = "na, asked", `0` = "dependent on person",
  .applies_to_vars = c("socp67"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP79", `-1` = "na, asked", `0` = "- to be coded -",
  .applies_to_vars = c("socp80"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/FSOCP88", `-1` = "na, asked", `0` = "- to be coded -",
  .applies_to_vars = c("socp89"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see GRMSO",
  .applies_to_vars = c("altru1", "altru2", "altru3", "altru4", "altru5", "socp46", "socp47", "socp48", "socp49", "socp51", "socp52", "socp54", "socp55", "socp66", "socp72", "socpr50", "socpyn"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GSOCP78",
  .applies_to_vars = c("socp81", "socp82", "socp83", "socp84", "socp85", "socp86", "socp87", "socp88", "socp90", "socp91", "socp92"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GSOCPYN",
  .applies_to_vars = c("socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08", "socp09", "socp10", "socp11", "socp12", "socp13"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "working for own well-being na, wrong skip", `-1` = "na, asked", `1` = "does not apply to me at all", `2` = "does not apply to me", `3` = "applies to me a little", `4` = "applies to me", `5` = "apllies to me entirely",
  .applies_to_vars = c("altru1", "altru2", "altru3", "altru4", "altru5"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp14"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP02", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp15"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP03", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp16"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP04", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp17"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP05", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp18"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP06", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp19"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP07", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp20"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP08", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp21"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP09", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp22"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP10", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp23"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP11", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp24"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP12", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp25"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP13", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp26"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP14-26", `-1` = "na, asked", `0` = "does not visit",
  .applies_to_vars = c("socp27"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP27", `-1` = "na, asked", `0` = "does not visit", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp28"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP28", `-1` = "na, asked",
  .applies_to_vars = c("socp30"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP27", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp31"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP31", `-1` = "na, asked",
  .applies_to_vars = c("socp33"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP28 & 31", `-1` = "na, asked", `1` = "very applicable", `2` = "applicable", `3` = "a little applicable", `4` = "not applicable",
  .applies_to_vars = c("socp34", "socp35", "socp36", "socp37", "socp38"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCPYN,14-33", `-1` = "na, asked", `1` = "very applicable", `2` = "applicable", `3` = "a little applicable", `4` = "not applicable",
  .applies_to_vars = c("socp39", "socp40", "socp41", "socp42", "socp43", "socp44", "socp44b", "socp45"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP55", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("socp56", "socp57", "socp58", "socp59", "socp60", "socp61"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP66", `-1` = "na, asked", `0` = "dependent on person",
  .applies_to_vars = c("socp67"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP72", `-1` = "na, asked",
  .applies_to_vars = c("socp73"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP72", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("socp74", "socp75", "socp76", "socp77", "socp78", "socp79"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP79", `-1` = "na, asked", `0` = "- to be coded -",
  .applies_to_vars = c("socp80"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GSOCP88", `-1` = "na, asked", `0` = "- to be coded -",
  .applies_to_vars = c("socp89"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see H/B/IRMSO",
  .applies_to_vars = c("socp46", "socp47", "socp48", "socp49", "socp50", "socp51", "socp52", "socp55", "socp66", "socp68", "socp72", "socp93", "socp95", "socpyn"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-2` = "na, see H/B/ISOCP55",
  .applies_to_vars = c("socp56", "socp57", "socp58", "socp59", "socp60", "socp61"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-2` = "na, see H/B/ISOCP72",
  .applies_to_vars = c("socp73", "sp72n1", "sp72n10", "sp72n11", "sp72n12", "sp72n2", "sp72n3", "sp72n4", "sp72n5", "sp72n6", "sp72n7", "sp72n8", "sp72n9"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-2` = "na, see H/B/ISOCP95",
  .applies_to_vars = c("sp95f1", "sp95f10", "sp95f11", "sp95f12", "sp95f13", "sp95f2", "sp95f3", "sp95f4", "sp95f5", "sp95f6", "sp95f7", "sp95f8", "sp95f9"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-2` = "na, see H/B/ISOCP97",
  .applies_to_vars = c("socp98", "sp97s1", "sp97s2", "sp97s3", "sp97s4", "sp97s5", "sp97s6", "sp97s7", "sp97s8"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-2` = "na, see H/B/ISOCPYN",
  .applies_to_vars = c("socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08", "socp09", "socp10", "socp11", "socp12", "socp13"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `1` = "short interview", `2` = "interview terminated",
  .applies_to_vars = c("rmso"),
  .applies_to_waves = c("H", "3B", "MB", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp14"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP02", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp15"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP03", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp16"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP04", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp17"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP05", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp18"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP06", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp19"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP07", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp20"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP08", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp21"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP09", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp22"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP10", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp23"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP11", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp24"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP12", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp25"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP13", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp26"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP14-26", `-1` = "na, asked",
  .applies_to_vars = c("socp27"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP27", `-1` = "na, asked", `0` = "does not visit", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp28"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP28", `-1` = "na, asked",
  .applies_to_vars = c("socp30"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP27", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp31"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP31", `-1` = "na, asked",
  .applies_to_vars = c("socp33"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP66", `-1` = "na, asked", `0` = "dependent on person",
  .applies_to_vars = c("socp67"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP68", `-1` = "na, asked", `0` = "dependent on person",
  .applies_to_vars = c("socp69"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "often na, wrong skip", `-2` = "na, see H/B/ISOCP93", `-1` = "na, asked", `1` = "daily", `2` = "a few times a week", `3` = "a few times a month", `4` = "a few times a year", `5` = "less than a few times a year",
  .applies_to_vars = c("socp94"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISP95F6", `-1` = "na, asked", `1` = "daily", `2` = "a few times a week", `3` = "a few times a month", `4` = "a few times a year", `5` = "less than a few times a year",
  .applies_to_vars = c("socp96"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "often na, wrong skip", `-1` = "na, asked", `1` = "daily", `2` = "a few times a week", `3` = "a few times a month", `4` = "a few times a year", `5` = "less than a few times a year",
  .applies_to_vars = c("socp98"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/BRMSO", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "not allowed to vote",
  .applies_to_vars = c("socp99"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP93", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("sp93n1"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("sp97s1", "sp97s2", "sp97s3", "sp97s4", "sp97s5", "sp97s6", "sp97s7", "sp97s8"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-2` = "na, see BSOCPYN",
  .applies_to_vars = c("socp01", "socp04", "socp05", "socp06", "socp08", "socp09", "socp10", "socp11", "socp12", "socp13"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "many Dutch members: organization for the elderly, employers organization na, wrong skip", `-2` = "na, see BSOCP01", `-1` = "na, asked", `1` = "mainly Dutch members", `2` = "many Dutch members", `3` = "little to none Dutch members",
  .applies_to_vars = c("socp01n"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "many Dutch members: church, mosque or religious organization na, wrong skip", `-2` = "na, see BSOCP04", `-1` = "na, asked", `1` = "mainly Dutch members", `2` = "many Dutch members", `3` = "little to none Dutch members",
  .applies_to_vars = c("socp04n"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "many Dutch members: neighbourhood association na, wrong skip", `-2` = "na, see SOCP05", `-1` = "na, asked", `1` = "mainly Dutch members", `2` = "many Dutch members", `3` = "little to none Dutch members",
  .applies_to_vars = c("socp05n"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "many Dutch members: womens association, womens circle na, wrong skip", `-2` = "na, see BSOCP06", `-1` = "na, asked", `1` = "mainly Dutch members", `2` = "many Dutch members", `3` = "little to none Dutch members",
  .applies_to_vars = c("socp06n"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "many Dutch members: action group or association with social aim na, wrong skip", `-2` = "na, see BSOCP08", `-1` = "na, asked", `1` = "mainly Dutch members", `2` = "many Dutch members", `3` = "little to none Dutch members",
  .applies_to_vars = c("socp08n"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "many Dutch members: patients association na, wrong skip", `-2` = "na, see BSOCP09", `-1` = "na, asked", `1` = "mainly Dutch members", `2` = "many Dutch members", `3` = "little to none Dutch members",
  .applies_to_vars = c("socp09n"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "many Dutch members: cultural organization na, wrong skip", `-2` = "na, see BSOCP10", `-1` = "na, asked", `1` = "mainly Dutch members", `2` = "many Dutch members", `3` = "little to none Dutch members",
  .applies_to_vars = c("socp10n"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "many Dutch members: recreation, music or hobby club na, wrong skip", `-2` = "na, see BSOCP11", `-1` = "na, asked", `1` = "mainly Dutch members", `2` = "many Dutch members", `3` = "little to none Dutch members",
  .applies_to_vars = c("socp11n"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "many Dutch members: sporting club na, wrong skip", `-2` = "na, see BSOCP12", `-1` = "na, asked", `1` = "mainly Dutch members", `2` = "many Dutch members", `3` = "little to none Dutch members",
  .applies_to_vars = c("socp12n"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "many Dutch members: other na, wrong skip", `-2` = "na, see BSOCP13", `-1` = "na, asked", `1` = "mainly Dutch members", `2` = "many Dutch members", `3` = "little to none Dutch members",
  .applies_to_vars = c("socp13n"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRMSO", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp72", "socp95", "socpyn"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see JRMSO",
  .applies_to_vars = c("socp46", "socp47", "socp48", "socp49", "socp51", "socp52", "socp55", "socp66", "socp68", "socp72", "socp93", "socpr50", "socpyn"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JSOCP72",
  .applies_to_vars = c("socp73", "socp95", "sp72n1", "sp72n10", "sp72n11", "sp72n2", "sp72n3", "sp72n4", "sp72n5", "sp72n6", "sp72n7", "sp72n8"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JSOCP95",
  .applies_to_vars = c("sp95f1", "sp95f11", "sp95f13", "sp95f14", "sp95f15", "sp95f16", "sp95f17", "sp95f2", "sp95f3", "sp95f4", "sp95f5", "sp95f6", "sp95f7", "sp95f8", "sp95f9"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JSOCPYN",
  .applies_to_vars = c("socp01", "socp02", "socp03", "socp04", "socp05", "socp06", "socp07", "socp08", "socp09", "socp10", "socp11", "socp12", "socp13"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp14"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP02", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp15"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP03", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp16"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP04", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp17"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP05", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp18"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP06", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp19"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP07", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp20"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP08", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp21"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP09", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp22"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP10", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp23"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP11", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp24"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP12", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp25"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP13", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp26"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP14-26", `-1` = "na, asked",
  .applies_to_vars = c("socp27"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP27", `-1` = "na, asked", `0` = "does not visit", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp28"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP28", `-1` = "na, asked",
  .applies_to_vars = c("socp30"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP27", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp31"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP31", `-1` = "na, asked",
  .applies_to_vars = c("socp33"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP55", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("socp56", "socp57", "socp58", "socp59", "socp60", "socp61"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP66", `-1` = "na, asked", `0` = "dependent on person",
  .applies_to_vars = c("socp67"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP68", `-1` = "na, asked", `0` = "dependent on person",
  .applies_to_vars = c("socp69"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "often na, wrong skip", `-2` = "na, see JSOCP93", `-1` = "na, asked", `1` = "daily", `2` = "a few times a week", `3` = "a few times a month", `4` = "a few times a year", `5` = "less than a few times a year",
  .applies_to_vars = c("socp94"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSP95F6", `-1` = "na, asked", `1` = "daily", `2` = "a few times a week", `3` = "a few times a month", `4` = "a few times a year", `5` = "less than a few times a year",
  .applies_to_vars = c("socp96"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, wrong skip)-3), na, see JSOCP72 & JSOCP93 & JSOCP95", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("socp97"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "often na, wrong skip", `-2` = "na, see JSOCP97", `-1` = "na, asked", `1` = "daily", `2` = "a few times a week", `3` = "a few times a month", `4` = "a few times a year", `5` = "less than a few times a year",
  .applies_to_vars = c("socp98"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP93", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("sp93n1"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JSOCP97", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("sp97s1", "sp97s2", "sp97s3", "sp97s4", "sp97s5", "sp97s6", "sp97s7", "sp97s8"),
  .applies_to_waves = c("J")
)

.lasa_fc_070 <- .lasa_finalize_fc("070")

