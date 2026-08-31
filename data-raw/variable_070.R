## LASA filecode 070 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  sp97s8 = "IT support: other"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "socp01",
    "socp02",
    "socp03",
    "socp04",
    "socp05",
    "socp06",
    "socp07",
    "socp08",
    "socp09",
    "socp10",
    "socp11",
    "socp12",
    "socp13",
    "socp14",
    "socp15",
    "socp16",
    "socp17",
    "socp18",
    "socp19",
    "socp20",
    "socp21",
    "socp22",
    "socp23",
    "socp24",
    "socp25",
    "socp26",
    "socp27",
    "socp28",
    "socp30",
    "socp31",
    "socp33",
    "socp34",
    "socp35",
    "socp36",
    "socp37",
    "socp38",
    "socp39",
    "socp40",
    "socp41",
    "socp42",
    "socp43",
    "socp44",
    "socp45",
    "socp46",
    "socp47",
    "socp48",
    "socp49",
    "socp51",
    "socp52",
    "socp54",
    "socp55",
    "socp56",
    "socp57",
    "socp58",
    "socp59",
    "socp60",
    "socp61",
    "socp62",
    "socp63",
    "socp64",
    "socp65",
    "socp66",
    "socp67",
    "socp68",
    "socp69",
    "socp70",
    "socp71",
    "socpr50",
    "socpyn"
  ),
  `C` = c(
    "socp01",
    "socp02",
    "socp03",
    "socp04",
    "socp05",
    "socp06",
    "socp07",
    "socp08",
    "socp09",
    "socp10",
    "socp11",
    "socp12",
    "socp13",
    "socp13x",
    "socp14",
    "socp15",
    "socp16",
    "socp17",
    "socp18",
    "socp19",
    "socp20",
    "socp21",
    "socp22",
    "socp23",
    "socp24",
    "socp25",
    "socp26",
    "socp27",
    "socp28",
    "socp30",
    "socp31",
    "socp33",
    "socp46",
    "socp47",
    "socp48",
    "socp49",
    "socp51",
    "socp52",
    "socp54",
    "socp55",
    "socp56",
    "socp57",
    "socp58",
    "socp59",
    "socp60",
    "socp61",
    "socp66",
    "socp67",
    "socpr50",
    "socpyn"
  ),
  `D` = c(
    "socp01",
    "socp02",
    "socp03",
    "socp04",
    "socp05",
    "socp06",
    "socp07",
    "socp08",
    "socp09",
    "socp10",
    "socp11",
    "socp12",
    "socp13",
    "socp13x",
    "socp14",
    "socp15",
    "socp16",
    "socp17",
    "socp18",
    "socp19",
    "socp20",
    "socp21",
    "socp22",
    "socp23",
    "socp24",
    "socp25",
    "socp26",
    "socp27",
    "socp28",
    "socp30",
    "socp31",
    "socp33",
    "socp46",
    "socp47",
    "socp48",
    "socp49",
    "socp51",
    "socp52",
    "socp54",
    "socp55",
    "socp56",
    "socp57",
    "socp58",
    "socp59",
    "socp60",
    "socp61",
    "socp66",
    "socp67",
    "socpr50",
    "socpyn"
  ),
  `E` = c(
    "rmso",
    "socp01",
    "socp02",
    "socp03",
    "socp04",
    "socp05",
    "socp06",
    "socp07",
    "socp08",
    "socp09",
    "socp10",
    "socp11",
    "socp12",
    "socp13",
    "socp13x",
    "socp14",
    "socp15",
    "socp16",
    "socp17",
    "socp18",
    "socp19",
    "socp20",
    "socp21",
    "socp22",
    "socp23",
    "socp24",
    "socp25",
    "socp26",
    "socp27",
    "socp28",
    "socp30",
    "socp31",
    "socp33",
    "socp46",
    "socp47",
    "socp48",
    "socp49",
    "socp51",
    "socp52",
    "socp54",
    "socp55",
    "socp72",
    "socp73",
    "socp74",
    "socp75",
    "socp76",
    "socp77",
    "socp78",
    "socp79",
    "socp80",
    "socp81",
    "socp82",
    "socp83",
    "socp84",
    "socp85",
    "socp86",
    "socp87",
    "socp88",
    "socp89",
    "socp90",
    "socp91",
    "socp92",
    "socpr50",
    "socpyn"
  ),
  `2B` = c(
    "rmso",
    "socp01",
    "socp02",
    "socp03",
    "socp04",
    "socp05",
    "socp06",
    "socp07",
    "socp08",
    "socp09",
    "socp10",
    "socp11",
    "socp12",
    "socp13",
    "socp13x",
    "socp14",
    "socp15",
    "socp16",
    "socp17",
    "socp18",
    "socp19",
    "socp20",
    "socp21",
    "socp22",
    "socp23",
    "socp24",
    "socp25",
    "socp26",
    "socp27",
    "socp28",
    "socp30",
    "socp31",
    "socp33",
    "socp34",
    "socp35",
    "socp36",
    "socp37",
    "socp38",
    "socp39",
    "socp40",
    "socp41",
    "socp42",
    "socp43",
    "socp44",
    "socp44b",
    "socp45",
    "socp46",
    "socp47",
    "socp48",
    "socp49",
    "socp51",
    "socp52",
    "socp54",
    "socp55",
    "socp56",
    "socp57",
    "socp58",
    "socp59",
    "socp60",
    "socp61",
    "socp66",
    "socp67",
    "socp72",
    "socp73",
    "socp74",
    "socp75",
    "socp76",
    "socp77",
    "socp78",
    "socp79",
    "socp80",
    "socp81",
    "socp82",
    "socp83",
    "socp84",
    "socp85",
    "socp86",
    "socp87",
    "socp88",
    "socp89",
    "socp90",
    "socp91",
    "socp92",
    "socpr50",
    "socpyn"
  ),
  `F` = c(
    "rmso",
    "socp01",
    "socp02",
    "socp03",
    "socp04",
    "socp05",
    "socp06",
    "socp07",
    "socp08",
    "socp09",
    "socp10",
    "socp11",
    "socp12",
    "socp13",
    "socp13x",
    "socp14",
    "socp15",
    "socp16",
    "socp17",
    "socp18",
    "socp19",
    "socp20",
    "socp21",
    "socp22",
    "socp23",
    "socp24",
    "socp25",
    "socp26",
    "socp27",
    "socp28",
    "socp30",
    "socp31",
    "socp33",
    "socp34",
    "socp35",
    "socp36",
    "socp37",
    "socp38",
    "socp39",
    "socp40",
    "socp41",
    "socp42",
    "socp43",
    "socp44",
    "socp44b",
    "socp45",
    "socp46",
    "socp47",
    "socp48",
    "socp49",
    "socp51",
    "socp52",
    "socp54",
    "socp55",
    "socp56",
    "socp57",
    "socp58",
    "socp59",
    "socp60",
    "socp61",
    "socp66",
    "socp67",
    "socp72",
    "socp73",
    "socp74",
    "socp75",
    "socp76",
    "socp77",
    "socp78",
    "socp79",
    "socp80",
    "socp81",
    "socp82",
    "socp83",
    "socp84",
    "socp85",
    "socp86",
    "socp87",
    "socp88",
    "socp89",
    "socp90",
    "socp91",
    "socp92",
    "socpr50",
    "socpyn"
  ),
  `G` = c(
    "altru1",
    "altru2",
    "altru3",
    "altru4",
    "altru5",
    "rmso",
    "socp01",
    "socp02",
    "socp03",
    "socp04",
    "socp05",
    "socp06",
    "socp07",
    "socp08",
    "socp09",
    "socp10",
    "socp11",
    "socp12",
    "socp13",
    "socp14",
    "socp15",
    "socp16",
    "socp17",
    "socp18",
    "socp19",
    "socp20",
    "socp21",
    "socp22",
    "socp23",
    "socp24",
    "socp25",
    "socp26",
    "socp27",
    "socp28",
    "socp30",
    "socp31",
    "socp33",
    "socp34",
    "socp35",
    "socp36",
    "socp37",
    "socp38",
    "socp39",
    "socp40",
    "socp41",
    "socp42",
    "socp43",
    "socp44",
    "socp44b",
    "socp45",
    "socp46",
    "socp47",
    "socp48",
    "socp49",
    "socp51",
    "socp52",
    "socp54",
    "socp55",
    "socp56",
    "socp57",
    "socp58",
    "socp59",
    "socp60",
    "socp61",
    "socp66",
    "socp67",
    "socp72",
    "socp73",
    "socp74",
    "socp75",
    "socp76",
    "socp77",
    "socp78",
    "socp79",
    "socp80",
    "socp81",
    "socp82",
    "socp83",
    "socp84",
    "socp85",
    "socp86",
    "socp87",
    "socp88",
    "socp89",
    "socp90",
    "socp91",
    "socp92",
    "socpr50",
    "socpyn"
  ),
  `H` = c(
    "rmso",
    "socp01",
    "socp02",
    "socp03",
    "socp04",
    "socp05",
    "socp06",
    "socp07",
    "socp08",
    "socp09",
    "socp10",
    "socp11",
    "socp12",
    "socp13",
    "socp14",
    "socp15",
    "socp16",
    "socp17",
    "socp18",
    "socp19",
    "socp20",
    "socp21",
    "socp22",
    "socp23",
    "socp24",
    "socp25",
    "socp26",
    "socp27",
    "socp28",
    "socp30",
    "socp31",
    "socp33",
    "socp46",
    "socp47",
    "socp48",
    "socp49",
    "socp50",
    "socp51",
    "socp52",
    "socp55",
    "socp56",
    "socp57",
    "socp58",
    "socp59",
    "socp60",
    "socp61",
    "socp66",
    "socp67",
    "socp68",
    "socp69",
    "socp72",
    "socp73",
    "socp93",
    "socp94",
    "socp95",
    "socp96",
    "socp97",
    "socp98",
    "socp99",
    "socpyn",
    "sp72n1",
    "sp72n10",
    "sp72n11",
    "sp72n12",
    "sp72n2",
    "sp72n3",
    "sp72n4",
    "sp72n5",
    "sp72n6",
    "sp72n7",
    "sp72n8",
    "sp72n9",
    "sp93n1",
    "sp93n11",
    "sp93n12",
    "sp93n2",
    "sp93n3",
    "sp93n4",
    "sp93n5",
    "sp93n6",
    "sp93n7",
    "sp93n8",
    "sp93n9",
    "sp95f1",
    "sp95f10",
    "sp95f11",
    "sp95f12",
    "sp95f13",
    "sp95f2",
    "sp95f3",
    "sp95f4",
    "sp95f5",
    "sp95f6",
    "sp95f7",
    "sp95f8",
    "sp95f9",
    "sp97s1",
    "sp97s2",
    "sp97s3",
    "sp97s4",
    "sp97s5",
    "sp97s6",
    "sp97s7",
    "sp97s8"
  ),
  `3B` = c(
    "rmso",
    "socp01",
    "socp02",
    "socp03",
    "socp04",
    "socp05",
    "socp06",
    "socp07",
    "socp08",
    "socp09",
    "socp10",
    "socp11",
    "socp12",
    "socp13",
    "socp14",
    "socp15",
    "socp16",
    "socp17",
    "socp18",
    "socp19",
    "socp20",
    "socp21",
    "socp22",
    "socp23",
    "socp24",
    "socp25",
    "socp26",
    "socp27",
    "socp28",
    "socp30",
    "socp31",
    "socp33",
    "socp46",
    "socp47",
    "socp48",
    "socp49",
    "socp50",
    "socp51",
    "socp52",
    "socp55",
    "socp56",
    "socp57",
    "socp58",
    "socp59",
    "socp60",
    "socp61",
    "socp66",
    "socp67",
    "socp68",
    "socp69",
    "socp72",
    "socp73",
    "socp93",
    "socp94",
    "socp95",
    "socp96",
    "socp97",
    "socp98",
    "socp99",
    "socpyn",
    "sp72n1",
    "sp72n10",
    "sp72n11",
    "sp72n12",
    "sp72n2",
    "sp72n3",
    "sp72n4",
    "sp72n5",
    "sp72n6",
    "sp72n7",
    "sp72n8",
    "sp72n9",
    "sp93n1",
    "sp93n11",
    "sp93n12",
    "sp93n2",
    "sp93n3",
    "sp93n4",
    "sp93n5",
    "sp93n6",
    "sp93n7",
    "sp93n8",
    "sp93n9",
    "sp95f1",
    "sp95f10",
    "sp95f11",
    "sp95f12",
    "sp95f13",
    "sp95f2",
    "sp95f3",
    "sp95f4",
    "sp95f5",
    "sp95f6",
    "sp95f7",
    "sp95f8",
    "sp95f9",
    "sp97s1",
    "sp97s2",
    "sp97s3",
    "sp97s4",
    "sp97s5",
    "sp97s6",
    "sp97s7",
    "sp97s8"
  ),
  `MB` = c(
    "rmso",
    "socp01",
    "socp01n",
    "socp04",
    "socp04n",
    "socp05",
    "socp05n",
    "socp06",
    "socp06n",
    "socp08",
    "socp08n",
    "socp09",
    "socp09n",
    "socp10",
    "socp10n",
    "socp11",
    "socp11n",
    "socp12",
    "socp12n",
    "socp13",
    "socp13n",
    "socp72",
    "socp95",
    "socpyn"
  ),
  `I` = c(
    "rmso",
    "socp01",
    "socp02",
    "socp03",
    "socp04",
    "socp05",
    "socp06",
    "socp07",
    "socp08",
    "socp09",
    "socp10",
    "socp11",
    "socp12",
    "socp13",
    "socp14",
    "socp15",
    "socp16",
    "socp17",
    "socp18",
    "socp19",
    "socp20",
    "socp21",
    "socp22",
    "socp23",
    "socp24",
    "socp25",
    "socp26",
    "socp27",
    "socp28",
    "socp30",
    "socp31",
    "socp33",
    "socp46",
    "socp47",
    "socp48",
    "socp49",
    "socp50",
    "socp51",
    "socp52",
    "socp55",
    "socp56",
    "socp57",
    "socp58",
    "socp59",
    "socp60",
    "socp61",
    "socp66",
    "socp67",
    "socp68",
    "socp69",
    "socp72",
    "socp73",
    "socp93",
    "socp94",
    "socp95",
    "socp96",
    "socp97",
    "socp98",
    "socpyn",
    "sp72n1",
    "sp72n10",
    "sp72n11",
    "sp72n12",
    "sp72n2",
    "sp72n3",
    "sp72n4",
    "sp72n5",
    "sp72n6",
    "sp72n7",
    "sp72n8",
    "sp72n9",
    "sp93n1",
    "sp93n11",
    "sp93n12",
    "sp93n2",
    "sp93n3",
    "sp93n4",
    "sp93n5",
    "sp93n6",
    "sp93n7",
    "sp93n8",
    "sp93n9",
    "sp95f1",
    "sp95f10",
    "sp95f11",
    "sp95f12",
    "sp95f13",
    "sp95f2",
    "sp95f3",
    "sp95f4",
    "sp95f5",
    "sp95f6",
    "sp95f7",
    "sp95f8",
    "sp95f9",
    "sp97s1",
    "sp97s2",
    "sp97s3",
    "sp97s4",
    "sp97s5",
    "sp97s6",
    "sp97s7",
    "sp97s8"
  ),
  `J` = c(
    "rmso",
    "socp01",
    "socp02",
    "socp03",
    "socp04",
    "socp05",
    "socp06",
    "socp07",
    "socp08",
    "socp09",
    "socp10",
    "socp11",
    "socp12",
    "socp13",
    "socp14",
    "socp15",
    "socp16",
    "socp17",
    "socp18",
    "socp19",
    "socp20",
    "socp21",
    "socp22",
    "socp23",
    "socp24",
    "socp25",
    "socp26",
    "socp27",
    "socp28",
    "socp30",
    "socp31",
    "socp33",
    "socp46",
    "socp47",
    "socp48",
    "socp49",
    "socp51",
    "socp52",
    "socp55",
    "socp56",
    "socp57",
    "socp58",
    "socp59",
    "socp60",
    "socp61",
    "socp66",
    "socp67",
    "socp68",
    "socp69",
    "socp72",
    "socp73",
    "socp93",
    "socp94",
    "socp95",
    "socp96",
    "socp97",
    "socp98",
    "socpr50",
    "socpyn",
    "sp72n1",
    "sp72n10",
    "sp72n11",
    "sp72n2",
    "sp72n3",
    "sp72n4",
    "sp72n5",
    "sp72n6",
    "sp72n7",
    "sp72n8",
    "sp93n1",
    "sp93n11",
    "sp93n13",
    "sp93n14",
    "sp93n2",
    "sp93n3",
    "sp93n4",
    "sp93n5",
    "sp93n6",
    "sp93n7",
    "sp93n8",
    "sp95f1",
    "sp95f11",
    "sp95f13",
    "sp95f14",
    "sp95f15",
    "sp95f16",
    "sp95f17",
    "sp95f2",
    "sp95f3",
    "sp95f4",
    "sp95f5",
    "sp95f6",
    "sp95f7",
    "sp95f8",
    "sp95f9",
    "sp97s1",
    "sp97s2",
    "sp97s3",
    "sp97s4",
    "sp97s5",
    "sp97s6",
    "sp97s7",
    "sp97s8"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    socp01 = "Association for the elderly",
    socp02 = "Trade union, employers organisation",
    socp03 = "Political party",
    socp04 = "Church or religious organisation",
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
    socp27 = "Visiting: Organisations all",
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
    socp67 = "Paid work: Age",
    socp69 = "Volunteers work: Age",
    socpr50 = "Cultural: sport self",
    socpyn = "Involved in association"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    socp01 = "Association/organization for the elderly",
    socp02 = "Trade union, employers organisation",
    socp04 = "Church or religious organisation",
    socp27 = "Visiting: Organisations all",
    socp67 = "Paid work: Age"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    socp01 = "Association/organization for the elderly",
    socp02 = "Trade union, employers organisation",
    socp04 = "Church or religious organisation",
    socp27 = "Visiting: Organisations all",
    socp67 = "Paid work: Age"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    socp72 = "Personal computer: usage",
    socp73 = "Personal computer: minutes/week"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    socp72 = "Personal computer: usage",
    socp73 = "Personal computer: minutes/week"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    socp72 = "Personal computer: usage",
    socp73 = "Personal computer: minutes/week"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    socp72 = "Personal computer: usage",
    socp73 = "Personal computer: minutes/week"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    socp55 = "Study: yes/no",
    socp72 = "Personal computer: usage",
    socp73 = "Personal computer: minutes/week",
    socp93 = "Mobile phone: usage",
    socp94 = "Mobile phone usage: how"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    socp55 = "Study: yes/no",
    socp72 = "Personal computer: usage",
    socp73 = "Personal computer: minutes/week",
    socp93 = "Mobile phone: usage",
    socp94 = "Mobile phone usage: how"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    socp01 = "Organization for the elderly, employers organization",
    socp04 = "Church, mosque or religious organization",
    socp08 = "Action group or association with social aim",
    socp10 = "Cultural organization",
    socp11 = "Recreation, music or hobby club",
    socp72 = "Personal computer: usage",
    socpyn = "Active member or involved in organization"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    socp55 = "Study: yes/no",
    socp72 = "Personal computer: usage",
    socp73 = "Personal computer: minutes/week",
    socp93 = "Mobile phone: usage",
    socp94 = "Mobile phone usage: how"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    socp55 = "Study: yes/no",
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
    sp93n8 = "Not calling mobile: other reason"
  ),
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "mentioned",
  `2` = "yes",
  `3` = "a little applicable",
  `4` = "not applicable"
)

standardized_value_labels <- list(
  altru1 = c(
    `-3` = "working for own well-being not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "does not apply to me at all",
    `2` = "does not apply to me",
    `3` = "applies to me a little",
    `4` = "applies to me",
    `5` = "apllies to me entirely"
  ),
  altru2 = c(
    `-3` = "working for own well-being not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "does not apply to me at all",
    `2` = "does not apply to me",
    `3` = "applies to me a little",
    `4` = "applies to me",
    `5` = "apllies to me entirely"
  ),
  altru3 = c(
    `-3` = "working for own well-being not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "does not apply to me at all",
    `2` = "does not apply to me",
    `3` = "applies to me a little",
    `4` = "applies to me",
    `5` = "apllies to me entirely"
  ),
  altru4 = c(
    `-3` = "working for own well-being not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "does not apply to me at all",
    `2` = "does not apply to me",
    `3` = "applies to me a little",
    `4` = "applies to me",
    `5` = "apllies to me entirely"
  ),
  altru5 = c(
    `-3` = "working for own well-being not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "does not apply to me at all",
    `2` = "does not apply to me",
    `3` = "applies to me a little",
    `4` = "applies to me",
    `5` = "apllies to me entirely"
  ),
  rmso = c(`-2` = "valid data", `1` = "not available, short interview", `2` = "interview terminated"),
  socp01 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp01n = c(
    `-3` = "many dutch members: organization for the elderly, employers organization not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "mainly dutch members",
    `2` = "many dutch members",
    `3` = "little to none dutch members"
  ),
  socp02 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp03 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp04 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp04n = c(
    `-3` = "many dutch members: church, mosque or religious organization not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "mainly dutch members",
    `2` = "many dutch members",
    `3` = "little to none dutch members"
  ),
  socp05 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp05n = c(
    `-3` = "many dutch members: neighbourhood association not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "mainly dutch members",
    `2` = "many dutch members",
    `3` = "little to none dutch members"
  ),
  socp06 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp06n = c(
    `-3` = "many dutch members: womens association, womens circle not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "mainly dutch members",
    `2` = "many dutch members",
    `3` = "little to none dutch members"
  ),
  socp07 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp08 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp08n = c(
    `-3` = "many dutch members: action group or association with social aim not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "mainly dutch members",
    `2` = "many dutch members",
    `3` = "little to none dutch members"
  ),
  socp09 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp09n = c(
    `-3` = "many dutch members: patients association not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "mainly dutch members",
    `2` = "many dutch members",
    `3` = "little to none dutch members"
  ),
  socp10 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp10n = c(
    `-3` = "many dutch members: cultural organization not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "mainly dutch members",
    `2` = "many dutch members",
    `3` = "little to none dutch members"
  ),
  socp11 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp11n = c(
    `-3` = "many dutch members: recreation, music or hobby club not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "mainly dutch members",
    `2` = "many dutch members",
    `3` = "little to none dutch members"
  ),
  socp12 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp12n = c(
    `-3` = "many dutch members: sporting club not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "mainly dutch members",
    `2` = "many dutch members",
    `3` = "little to none dutch members"
  ),
  socp13 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp13n = c(
    `-3` = "many dutch members: other not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "mainly dutch members",
    `2` = "many dutch members",
    `3` = "little to none dutch members"
  ),
  socp13x = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "- to be coded -",
    `1` = "garden & pets",
    `2` = "cult.hist. ass.",
    `3` = "housing ass.",
    `4` = "other"
  ),
  socp14 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp15 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp16 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp17 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp18 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp19 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp20 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp21 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp22 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp23 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp24 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp25 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp26 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp27 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "does not visit"
  ),
  socp28 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "does not visit",
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp30 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")]
  ),
  socp31 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp33 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")]
  ),
  socp34 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp35 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp36 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp37 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp38 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp39 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp40 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp41 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp42 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp43 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp44 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp44b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp45 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp46 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "does not visit"
  ),
  socp47 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "does not visit"
  ),
  socp48 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "does not visit"
  ),
  socp49 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "does not visit"
  ),
  socp50 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  socp51 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "does not visit"
  ),
  socp52 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "does not visit"
  ),
  socp54 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")]
  ),
  socp55 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp56 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp57 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp58 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp59 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp60 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp61 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  socp62 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp63 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp64 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp65 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "very applicable",
    `2` = "applicable",
    default_answer_labels[c("3", "4")]
  ),
  socp66 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
  socp67 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "dependent on person",
    `3` = "not available, wrong skip"
  ),
  socp68 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
  socp69 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "dependent on person"
  ),
  socp70 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
  socp71 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "dependent on person"
  ),
  socp72 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp73 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  socp74 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp75 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp76 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp77 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp78 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp79 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp80 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "- to be coded -"
  ),
  socp81 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp82 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp83 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp84 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp85 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp86 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp87 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp88 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  socp89 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "- to be coded -"
  ),
  socp90 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  socp91 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "never",
    `2` = "rarely",
    `3` = "sometimes",
    `4` = "often"
  ),
  socp92 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "never",
    `2` = "rarely",
    `3` = "sometimes",
    `4` = "often"
  ),
  socp93 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp94 = c(
    `-3` = "often not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "daily",
    `2` = "a few times a week",
    `3` = "a few times a month",
    `4` = "a few times a year",
    `5` = "less than a few times a year"
  ),
  socp95 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp96 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "daily",
    `2` = "a few times a week",
    `3` = "a few times a month",
    `4` = "a few times a year",
    `5` = "less than a few times a year"
  ),
  socp97 = c(
    `-2` = "not available, wrong skip)-3), not available, routing",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  socp98 = c(
    `-3` = "often not available, wrong skip",
    default_missing_labels[c("-2", "-1")],
    `1` = "daily",
    `2` = "a few times a week",
    `3` = "a few times a month",
    `4` = "a few times a year",
    `5` = "less than a few times a year"
  ),
  socp99 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")],
    `3` = "not allowed to vote"
  ),
  socpr50 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "does not visit"
  ),
  socpyn = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  sp72n1 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp72n10 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp72n11 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp72n12 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp72n2 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp72n3 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp72n4 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp72n5 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp72n6 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp72n7 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp72n8 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp72n9 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp93n1 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp93n11 = stats::setNames(character(0), character(0)),
  sp93n12 = stats::setNames(character(0), character(0)),
  sp93n13 = stats::setNames(character(0), character(0)),
  sp93n14 = stats::setNames(character(0), character(0)),
  sp93n2 = stats::setNames(character(0), character(0)),
  sp93n3 = stats::setNames(character(0), character(0)),
  sp93n4 = stats::setNames(character(0), character(0)),
  sp93n5 = stats::setNames(character(0), character(0)),
  sp93n6 = stats::setNames(character(0), character(0)),
  sp93n7 = stats::setNames(character(0), character(0)),
  sp93n8 = stats::setNames(character(0), character(0)),
  sp93n9 = stats::setNames(character(0), character(0)),
  sp95f1 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f10 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f11 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f12 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f13 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f14 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f15 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f16 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f17 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f2 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f3 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f4 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f5 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f6 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f7 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f8 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp95f9 = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp97s1 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp97s2 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp97s3 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp97s4 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp97s5 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp97s6 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp97s7 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  sp97s8 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    socp01 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp02 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp03 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp04 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp05 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp06 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp07 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp08 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp09 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp10 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp11 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp12 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp13 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp14 = .replace_labels(
    standardized_value_labels$socp14,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp15 = .replace_labels(
    standardized_value_labels$socp15,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp16 = .replace_labels(
    standardized_value_labels$socp16,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp17 = .replace_labels(
    standardized_value_labels$socp17,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp18 = .replace_labels(
    standardized_value_labels$socp18,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp19 = .replace_labels(
    standardized_value_labels$socp19,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp20 = .replace_labels(
    standardized_value_labels$socp20,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp21 = .replace_labels(
    standardized_value_labels$socp21,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp22 = .replace_labels(
    standardized_value_labels$socp22,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp23 = .replace_labels(
    standardized_value_labels$socp23,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp24 = .replace_labels(
    standardized_value_labels$socp24,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp25 = .replace_labels(
    standardized_value_labels$socp25,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp26 = .replace_labels(
    standardized_value_labels$socp26,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp27 = .replace_labels(
    standardized_value_labels$socp27,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp28 = .replace_labels(
    standardized_value_labels$socp28,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp30 = .replace_labels(
    standardized_value_labels$socp30,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp31 = .replace_labels(
    standardized_value_labels$socp31,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp33 = .replace_labels(
    standardized_value_labels$socp33,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp34 = .replace_labels(
    standardized_value_labels$socp34,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp35 = .replace_labels(
    standardized_value_labels$socp35,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp36 = .replace_labels(
    standardized_value_labels$socp36,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp37 = .replace_labels(
    standardized_value_labels$socp37,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp38 = .replace_labels(
    standardized_value_labels$socp38,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp39 = .replace_labels(
    standardized_value_labels$socp39,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp40 = .replace_labels(
    standardized_value_labels$socp40,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp41 = .replace_labels(
    standardized_value_labels$socp41,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp42 = .replace_labels(
    standardized_value_labels$socp42,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp43 = .replace_labels(
    standardized_value_labels$socp43,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp44 = .replace_labels(
    standardized_value_labels$socp44,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp45 = .replace_labels(
    standardized_value_labels$socp45,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp46 = .replace_labels(
    standardized_value_labels$socp46,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp47 = .replace_labels(
    standardized_value_labels$socp47,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp48 = .replace_labels(
    standardized_value_labels$socp48,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp49 = .replace_labels(
    standardized_value_labels$socp49,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp51 = .replace_labels(
    standardized_value_labels$socp51,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp52 = .replace_labels(
    standardized_value_labels$socp52,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp54 = .replace_labels(
    standardized_value_labels$socp54,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp55 = .replace_labels(
    standardized_value_labels$socp55,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp56 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp57 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp58 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp59 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp60 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp61 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp62 = .replace_labels(
    standardized_value_labels$socp62,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp63 = .replace_labels(
    standardized_value_labels$socp63,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp64 = .replace_labels(
    standardized_value_labels$socp64,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp65 = .replace_labels(
    standardized_value_labels$socp65,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socp66 = .replace_labels(
    standardized_value_labels$socp66,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `3` = "no opinion / do not know"
  ),
    socp67 = c(
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `0` = "dependent of person"
  ),
    socp68 = .replace_labels(
    standardized_value_labels$socp68,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `3` = "no opinion / do not know"
  ),
    socp69 = .replace_labels(
    standardized_value_labels$socp69,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `0` = "dependent of person"
  ),
    socp70 = .replace_labels(
    standardized_value_labels$socp70,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `3` = "no opinion / do not know"
  ),
    socp71 = .replace_labels(
    standardized_value_labels$socp71,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `0` = "dependent of person"
  ),
    socpr50 = .replace_labels(
    standardized_value_labels$socpr50,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    socpyn = .replace_labels(
    standardized_value_labels$socpyn,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    socp01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13x = .replace_labels(
    standardized_value_labels$socp13x,
    `-2` = "na, see C/DSOCP13"
  ),
    socp14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp16 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP04",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp18 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP05",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp19 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp20 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP08",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP09",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp23 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp24 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp25 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP12",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP13",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp27 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP14 to 26",
    `-1` = "na, asked",
    `0` = "does not visit"
  ),
    socp28 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP27",
    `-1` = "na, asked",
    `0` = "does not visit",
    `1` = "no",
    `2` = "yes"
  ),
    socp30 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DSOCP28", `-1` = "na, asked"),
    socp31 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP27",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp33 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DSOCP31", `-1` = "na, asked"),
    socp46 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp47 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp48 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp49 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp51 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp52 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp54 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp55 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp56 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp57 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp58 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp59 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp60 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp61 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp66 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRMSO",
    `-1` = "na, asked",
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
    socp67 = c(
    `-2` = "na, see C/DSOCP66",
    `-1` = "na, asked",
    `0` = "dependent on person",
    `3` = "na, wrong skip"
  ),
    socpr50 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socpyn = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRMSO",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    socp01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13x = .replace_labels(
    standardized_value_labels$socp13x,
    `-2` = "na, see C/DSOCP13"
  ),
    socp14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp16 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP04",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp18 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP05",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp19 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp20 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP08",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP09",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp23 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp24 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp25 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP12",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP13",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp27 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP14 to 26",
    `-1` = "na, asked",
    `0` = "does not visit"
  ),
    socp28 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP27",
    `-1` = "na, asked",
    `0` = "does not visit",
    `1` = "no",
    `2` = "yes"
  ),
    socp30 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DSOCP28", `-1` = "na, asked"),
    socp31 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP27",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp33 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DSOCP31", `-1` = "na, asked"),
    socp46 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp47 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp48 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp49 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp51 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp52 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp54 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp55 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socp56 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp57 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp58 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp59 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp60 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp61 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp66 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRMSO",
    `-1` = "na, asked",
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
    socp67 = c(
    `-2` = "na, see C/DSOCP66",
    `-1` = "na, asked",
    `0` = "dependent on person",
    `3` = "na, wrong skip"
  ),
    socpr50 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked"),
    socpyn = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRMSO",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    rmso = c(`-2` = "valid data", `1` = "short interview"),
    socp01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13x = .replace_labels(
    standardized_value_labels$socp13x,
    `-2` = "na, see ESOCP13"
  ),
    socp14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp16 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP04",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp18 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP05",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp19 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp20 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP08",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP09",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp23 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp24 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp25 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP12",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP13",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp27 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP14-26",
    `-1` = "na, asked",
    `0` = "does not visit"
  ),
    socp28 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP27",
    `-1` = "na, asked",
    `0` = "does not visit",
    `1` = "no",
    `2` = "yes"
  ),
    socp30 = c(`-3` = "na, wrong skip", `-2` = "na, see ESOCP28", `-1` = "na, asked"),
    socp31 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ESOCP27",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp33 = c(`-3` = "na, wrong skip", `-2` = "na, see ESOCP31", `-1` = "na, asked"),
    socp46 = c(`-3` = "na, wrong skip", `-2` = "na, see ERMSO", `-1` = "na, asked"),
    socp47 = c(`-3` = "na, wrong skip", `-2` = "na, see ERMSO", `-1` = "na, asked"),
    socp48 = c(`-3` = "na, wrong skip", `-2` = "na, see ERMSO", `-1` = "na, asked"),
    socp49 = c(`-3` = "na, wrong skip", `-2` = "na, see ERMSO", `-1` = "na, asked"),
    socp51 = c(`-3` = "na, wrong skip", `-2` = "na, see ERMSO", `-1` = "na, asked"),
    socp52 = c(`-3` = "na, wrong skip", `-2` = "na, see ERMSO", `-1` = "na, asked"),
    socp54 = c(`-3` = "na, wrong skip", `-2` = "na, see ERMSO", `-1` = "na, asked"),
    socp55 = c(`-3` = "na, wrong skip", `-2` = "na, see ERMSO", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    socp72 = .replace_labels(
    standardized_value_labels$socp72,
    `-2` = "na, see ERMSO"
  ),
    socp73 = .replace_labels(
    standardized_value_labels$socp73,
    `-2` = "na, see ESOCP72"
  ),
    socp74 = .replace_labels(
    standardized_value_labels$socp74,
    `-2` = "na, see ESOCP72"
  ),
    socp75 = .replace_labels(
    standardized_value_labels$socp75,
    `-2` = "na, see ESOCP72"
  ),
    socp76 = .replace_labels(
    standardized_value_labels$socp76,
    `-2` = "na, see ESOCP72"
  ),
    socp77 = .replace_labels(
    standardized_value_labels$socp77,
    `-2` = "na, see ESOCP72"
  ),
    socp78 = .replace_labels(
    standardized_value_labels$socp78,
    `-2` = "na, see ESOCP72"
  ),
    socp79 = .replace_labels(
    standardized_value_labels$socp79,
    `-2` = "na, see ESOCP72"
  ),
    socp80 = .replace_labels(
    standardized_value_labels$socp80,
    `-2` = "na, see ESOCP79"
  ),
    socp81 = .replace_labels(
    standardized_value_labels$socp81,
    `-2` = "na, see ESOCP78"
  ),
    socp82 = .replace_labels(
    standardized_value_labels$socp82,
    `-2` = "na, see ESOCP78"
  ),
    socp83 = .replace_labels(
    standardized_value_labels$socp83,
    `-2` = "na, see ESOCP78"
  ),
    socp84 = .replace_labels(
    standardized_value_labels$socp84,
    `-2` = "na, see ESOCP78"
  ),
    socp85 = .replace_labels(
    standardized_value_labels$socp85,
    `-2` = "na, see ESOCP78"
  ),
    socp86 = .replace_labels(
    standardized_value_labels$socp86,
    `-2` = "na, see ESOCP78"
  ),
    socp87 = .replace_labels(
    standardized_value_labels$socp87,
    `-2` = "na, see ESOCP78"
  ),
    socp88 = .replace_labels(
    standardized_value_labels$socp88,
    `-2` = "na, see ESOCP78"
  ),
    socp89 = .replace_labels(
    standardized_value_labels$socp89,
    `-2` = "na, see ESOCP88"
  ),
    socp90 = .replace_labels(
    standardized_value_labels$socp90,
    `-2` = "na, see ESOCP78"
  ),
    socp91 = .replace_labels(
    standardized_value_labels$socp91,
    `-2` = "na, see ESOCP78"
  ),
    socp92 = .replace_labels(
    standardized_value_labels$socp92,
    `-2` = "na, see ESOCP78"
  ),
    socpr50 = c(`-3` = "na, wrong skip", `-2` = "na, see ERMSO", `-1` = "na, asked"),
    socpyn = c(`-3` = "na, wrong skip", `-2` = "na, see ERMSO", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    rmso = c(`-2` = "valid data", `1` = "short interview"),
    socp01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13x = .replace_labels(
    standardized_value_labels$socp13x,
    `-2` = "na, see B/FSOCP13"
  ),
    socp14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp16 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP04",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp18 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP05",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp19 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp20 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP08",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP09",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp23 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp24 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp25 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP12",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP13",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp27 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP14-26",
    `-1` = "na, asked",
    `0` = "does not visit"
  ),
    socp28 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP27",
    `-1` = "na, asked",
    `0` = "does not visit",
    `1` = "no",
    `2` = "yes"
  ),
    socp30 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FSOCP28", `-1` = "na, asked"),
    socp31 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP27",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp33 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FSOCP31", `-1` = "na, asked"),
    socp34 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp35 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp36 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp37 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp38 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp39 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp40 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp41 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp42 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp43 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp44 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp44b = .replace_labels(
    standardized_value_labels$socp44b,
    `-2` = "na, see B/FSOCPYN,14-33"
  ),
    socp45 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp46 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp47 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp48 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp49 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp51 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp52 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp54 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp55 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FRMSO",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp56 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp57 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp58 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp59 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp60 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp61 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp66 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FRMSO",
    `-1` = "na, asked",
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
    socp67 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP66",
    `-1` = "na, asked",
    `0` = "dependent on person"
  ),
    socp72 = .replace_labels(
    standardized_value_labels$socp72,
    `-2` = "na, see B/FRMSO"
  ),
    socp73 = .replace_labels(
    standardized_value_labels$socp73,
    `-2` = "na, see B/FSOCP72"
  ),
    socp74 = .replace_labels(
    standardized_value_labels$socp74,
    `-2` = "na, see B/FSOCP72"
  ),
    socp75 = .replace_labels(
    standardized_value_labels$socp75,
    `-2` = "na, see B/FSOCP72"
  ),
    socp76 = .replace_labels(
    standardized_value_labels$socp76,
    `-2` = "na, see B/FSOCP72"
  ),
    socp77 = .replace_labels(
    standardized_value_labels$socp77,
    `-2` = "na, see B/FSOCP72"
  ),
    socp78 = .replace_labels(
    standardized_value_labels$socp78,
    `-2` = "na, see B/FSOCP72"
  ),
    socp79 = .replace_labels(
    standardized_value_labels$socp79,
    `-2` = "na, see B/FSOCP72"
  ),
    socp80 = .replace_labels(
    standardized_value_labels$socp80,
    `-2` = "na, see B/FSOCP79"
  ),
    socp81 = .replace_labels(
    standardized_value_labels$socp81,
    `-2` = "na, see B/FSOCP78"
  ),
    socp82 = .replace_labels(
    standardized_value_labels$socp82,
    `-2` = "na, see B/FSOCP78"
  ),
    socp83 = .replace_labels(
    standardized_value_labels$socp83,
    `-2` = "na, see B/FSOCP78"
  ),
    socp84 = .replace_labels(
    standardized_value_labels$socp84,
    `-2` = "na, see B/FSOCP78"
  ),
    socp85 = .replace_labels(
    standardized_value_labels$socp85,
    `-2` = "na, see B/FSOCP78"
  ),
    socp86 = .replace_labels(
    standardized_value_labels$socp86,
    `-2` = "na, see B/FSOCP78"
  ),
    socp87 = .replace_labels(
    standardized_value_labels$socp87,
    `-2` = "na, see B/FSOCP78"
  ),
    socp88 = .replace_labels(
    standardized_value_labels$socp88,
    `-2` = "na, see B/FSOCP78"
  ),
    socp89 = .replace_labels(
    standardized_value_labels$socp89,
    `-2` = "na, see B/FSOCP88"
  ),
    socp90 = .replace_labels(
    standardized_value_labels$socp90,
    `-2` = "na, see B/FSOCP78"
  ),
    socp91 = .replace_labels(
    standardized_value_labels$socp91,
    `-2` = "na, see B/FSOCP78"
  ),
    socp92 = .replace_labels(
    standardized_value_labels$socp92,
    `-2` = "na, see B/FSOCP78"
  ),
    socpr50 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socpyn = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FRMSO",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    rmso = c(`-2` = "valid data", `1` = "short interview"),
    socp01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13x = .replace_labels(
    standardized_value_labels$socp13x,
    `-2` = "na, see B/FSOCP13"
  ),
    socp14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp16 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP04",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp18 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP05",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp19 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp20 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP08",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP09",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp23 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp24 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp25 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP12",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP13",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp27 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP14-26",
    `-1` = "na, asked",
    `0` = "does not visit"
  ),
    socp28 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP27",
    `-1` = "na, asked",
    `0` = "does not visit",
    `1` = "no",
    `2` = "yes"
  ),
    socp30 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FSOCP28", `-1` = "na, asked"),
    socp31 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP27",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp33 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FSOCP31", `-1` = "na, asked"),
    socp34 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp35 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp36 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp37 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp38 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp39 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp40 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp41 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp42 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp43 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp44 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp44b = .replace_labels(
    standardized_value_labels$socp44b,
    `-2` = "na, see B/FSOCPYN,14-33"
  ),
    socp45 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp46 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp47 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp48 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp49 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp51 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp52 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp54 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socp55 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FRMSO",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp56 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp57 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp58 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp59 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp60 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp61 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp66 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FRMSO",
    `-1` = "na, asked",
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
    socp67 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FSOCP66",
    `-1` = "na, asked",
    `0` = "dependent on person"
  ),
    socp72 = .replace_labels(
    standardized_value_labels$socp72,
    `-2` = "na, see B/FRMSO"
  ),
    socp73 = .replace_labels(
    standardized_value_labels$socp73,
    `-2` = "na, see B/FSOCP72"
  ),
    socp74 = .replace_labels(
    standardized_value_labels$socp74,
    `-2` = "na, see B/FSOCP72"
  ),
    socp75 = .replace_labels(
    standardized_value_labels$socp75,
    `-2` = "na, see B/FSOCP72"
  ),
    socp76 = .replace_labels(
    standardized_value_labels$socp76,
    `-2` = "na, see B/FSOCP72"
  ),
    socp77 = .replace_labels(
    standardized_value_labels$socp77,
    `-2` = "na, see B/FSOCP72"
  ),
    socp78 = .replace_labels(
    standardized_value_labels$socp78,
    `-2` = "na, see B/FSOCP72"
  ),
    socp79 = .replace_labels(
    standardized_value_labels$socp79,
    `-2` = "na, see B/FSOCP72"
  ),
    socp80 = .replace_labels(
    standardized_value_labels$socp80,
    `-2` = "na, see B/FSOCP79"
  ),
    socp81 = .replace_labels(
    standardized_value_labels$socp81,
    `-2` = "na, see B/FSOCP78"
  ),
    socp82 = .replace_labels(
    standardized_value_labels$socp82,
    `-2` = "na, see B/FSOCP78"
  ),
    socp83 = .replace_labels(
    standardized_value_labels$socp83,
    `-2` = "na, see B/FSOCP78"
  ),
    socp84 = .replace_labels(
    standardized_value_labels$socp84,
    `-2` = "na, see B/FSOCP78"
  ),
    socp85 = .replace_labels(
    standardized_value_labels$socp85,
    `-2` = "na, see B/FSOCP78"
  ),
    socp86 = .replace_labels(
    standardized_value_labels$socp86,
    `-2` = "na, see B/FSOCP78"
  ),
    socp87 = .replace_labels(
    standardized_value_labels$socp87,
    `-2` = "na, see B/FSOCP78"
  ),
    socp88 = .replace_labels(
    standardized_value_labels$socp88,
    `-2` = "na, see B/FSOCP78"
  ),
    socp89 = .replace_labels(
    standardized_value_labels$socp89,
    `-2` = "na, see B/FSOCP88"
  ),
    socp90 = .replace_labels(
    standardized_value_labels$socp90,
    `-2` = "na, see B/FSOCP78"
  ),
    socp91 = .replace_labels(
    standardized_value_labels$socp91,
    `-2` = "na, see B/FSOCP78"
  ),
    socp92 = .replace_labels(
    standardized_value_labels$socp92,
    `-2` = "na, see B/FSOCP78"
  ),
    socpr50 = c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked"),
    socpyn = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/FRMSO",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    altru1 = .replace_labels(
    standardized_value_labels$altru1,
    `-3` = "working for own well-being na, wrong skip",
    `-2` = "na, see GRMSO"
  ),
    altru2 = .replace_labels(
    standardized_value_labels$altru2,
    `-3` = "working for own well-being na, wrong skip",
    `-2` = "na, see GRMSO"
  ),
    altru3 = .replace_labels(
    standardized_value_labels$altru3,
    `-3` = "working for own well-being na, wrong skip",
    `-2` = "na, see GRMSO"
  ),
    altru4 = .replace_labels(
    standardized_value_labels$altru4,
    `-3` = "working for own well-being na, wrong skip",
    `-2` = "na, see GRMSO"
  ),
    altru5 = .replace_labels(
    standardized_value_labels$altru5,
    `-3` = "working for own well-being na, wrong skip",
    `-2` = "na, see GRMSO"
  ),
    rmso = c(`-2` = "valid data", `1` = "short interview"),
    socp01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp16 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP04",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp18 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP05",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp19 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp20 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP08",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP09",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp23 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp24 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp25 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP12",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP13",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp27 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP14-26",
    `-1` = "na, asked",
    `0` = "does not visit"
  ),
    socp28 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP27",
    `-1` = "na, asked",
    `0` = "does not visit",
    `1` = "no",
    `2` = "yes"
  ),
    socp30 = c(`-3` = "na, wrong skip", `-2` = "na, see GSOCP28", `-1` = "na, asked"),
    socp31 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP27",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp33 = c(`-3` = "na, wrong skip", `-2` = "na, see GSOCP31", `-1` = "na, asked"),
    socp34 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp35 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp36 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp37 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp38 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP28 & 31",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp39 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp40 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp41 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp42 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp43 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp44 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp44b = .replace_labels(
    standardized_value_labels$socp44b,
    `-2` = "na, see GSOCPYN,14-33"
  ),
    socp45 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCPYN,14-33",
    `-1` = "na, asked",
    `1` = "very applicable",
    `2` = "applicable",
    `3` = "a little applicable",
    `4` = "not applicable"
  ),
    socp46 = c(`-3` = "na, wrong skip", `-2` = "na, see GRMSO", `-1` = "na, asked"),
    socp47 = c(`-3` = "na, wrong skip", `-2` = "na, see GRMSO", `-1` = "na, asked"),
    socp48 = c(`-3` = "na, wrong skip", `-2` = "na, see GRMSO", `-1` = "na, asked"),
    socp49 = c(`-3` = "na, wrong skip", `-2` = "na, see GRMSO", `-1` = "na, asked"),
    socp51 = c(`-3` = "na, wrong skip", `-2` = "na, see GRMSO", `-1` = "na, asked"),
    socp52 = c(`-3` = "na, wrong skip", `-2` = "na, see GRMSO", `-1` = "na, asked"),
    socp54 = c(`-3` = "na, wrong skip", `-2` = "na, see GRMSO", `-1` = "na, asked"),
    socp55 = c(`-3` = "na, wrong skip", `-2` = "na, see GRMSO", `-1` = "na, asked"),
    socp56 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp57 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp58 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp59 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp60 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp61 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp66 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GRMSO",
    `-1` = "na, asked",
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
    socp67 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GSOCP66",
    `-1` = "na, asked",
    `0` = "dependent on person"
  ),
    socp72 = .replace_labels(
    standardized_value_labels$socp72,
    `-2` = "na, see GRMSO"
  ),
    socp73 = .replace_labels(
    standardized_value_labels$socp73,
    `-2` = "na, see GSOCP72"
  ),
    socp74 = .replace_labels(
    standardized_value_labels$socp74,
    `-2` = "na, see GSOCP72"
  ),
    socp75 = .replace_labels(
    standardized_value_labels$socp75,
    `-2` = "na, see GSOCP72"
  ),
    socp76 = .replace_labels(
    standardized_value_labels$socp76,
    `-2` = "na, see GSOCP72"
  ),
    socp77 = .replace_labels(
    standardized_value_labels$socp77,
    `-2` = "na, see GSOCP72"
  ),
    socp78 = .replace_labels(
    standardized_value_labels$socp78,
    `-2` = "na, see GSOCP72"
  ),
    socp79 = .replace_labels(
    standardized_value_labels$socp79,
    `-2` = "na, see GSOCP72"
  ),
    socp80 = .replace_labels(
    standardized_value_labels$socp80,
    `-2` = "na, see GSOCP79"
  ),
    socp81 = .replace_labels(
    standardized_value_labels$socp81,
    `-2` = "na, see GSOCP78"
  ),
    socp82 = .replace_labels(
    standardized_value_labels$socp82,
    `-2` = "na, see GSOCP78"
  ),
    socp83 = .replace_labels(
    standardized_value_labels$socp83,
    `-2` = "na, see GSOCP78"
  ),
    socp84 = .replace_labels(
    standardized_value_labels$socp84,
    `-2` = "na, see GSOCP78"
  ),
    socp85 = .replace_labels(
    standardized_value_labels$socp85,
    `-2` = "na, see GSOCP78"
  ),
    socp86 = .replace_labels(
    standardized_value_labels$socp86,
    `-2` = "na, see GSOCP78"
  ),
    socp87 = .replace_labels(
    standardized_value_labels$socp87,
    `-2` = "na, see GSOCP78"
  ),
    socp88 = .replace_labels(
    standardized_value_labels$socp88,
    `-2` = "na, see GSOCP78"
  ),
    socp89 = .replace_labels(
    standardized_value_labels$socp89,
    `-2` = "na, see GSOCP88"
  ),
    socp90 = .replace_labels(
    standardized_value_labels$socp90,
    `-2` = "na, see GSOCP78"
  ),
    socp91 = .replace_labels(
    standardized_value_labels$socp91,
    `-2` = "na, see GSOCP78"
  ),
    socp92 = .replace_labels(
    standardized_value_labels$socp92,
    `-2` = "na, see GSOCP78"
  ),
    socpr50 = c(`-3` = "na, wrong skip", `-2` = "na, see GRMSO", `-1` = "na, asked"),
    socpyn = c(`-3` = "na, wrong skip", `-2` = "na, see GRMSO", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    rmso = .replace_labels(
    standardized_value_labels$rmso,
    `1` = "short interview"
  ),
    socp01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp16 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP04",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp18 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP05",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp19 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp20 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP08",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP09",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp23 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp24 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp25 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP12",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP13",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp27 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP14-26", `-1` = "na, asked"),
    socp28 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP27",
    `-1` = "na, asked",
    `0` = "does not visit",
    `1` = "no",
    `2` = "yes"
  ),
    socp30 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP28", `-1` = "na, asked"),
    socp31 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP27",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp33 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP31", `-1` = "na, asked"),
    socp46 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp47 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp48 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp49 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp50 = .replace_labels(
    standardized_value_labels$socp50,
    `-2` = "na, see H/B/IRMSO"
  ),
    socp51 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp52 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp55 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/IRMSO",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp56 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp57 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp58 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp59 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp60 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp61 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp66 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/IRMSO",
    `-1` = "na, asked",
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
    socp67 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP66",
    `-1` = "na, asked",
    `0` = "dependent on person"
  ),
    socp68 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/IRMSO",
    `-1` = "na, asked",
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
    socp69 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP68",
    `-1` = "na, asked",
    `0` = "dependent on person"
  ),
    socp72 = .replace_labels(
    standardized_value_labels$socp72,
    `-2` = "na, see H/B/IRMSO"
  ),
    socp73 = .replace_labels(
    standardized_value_labels$socp73,
    `-2` = "na, see H/B/ISOCP72"
  ),
    socp93 = .replace_labels(
    standardized_value_labels$socp93,
    `-2` = "na, see H/B/IRMSO"
  ),
    socp94 = .replace_labels(
    standardized_value_labels$socp94,
    `-3` = "often na, wrong skip",
    `-2` = "na, see H/B/ISOCP93"
  ),
    socp95 = .replace_labels(
    standardized_value_labels$socp95,
    `-2` = "na, see H/B/IRMSO"
  ),
    socp96 = .replace_labels(
    standardized_value_labels$socp96,
    `-2` = "na, see H/B/ISP95F6"
  ),
    socp98 = .replace_labels(
    standardized_value_labels$socp98,
    `-3` = "often na, wrong skip",
    `-2` = "na, see H/B/ISOCP97"
  ),
    socp99 = .replace_labels(
    standardized_value_labels$socp99,
    `-2` = "na, see H/BRMSO"
  ),
    socpyn = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/IRMSO",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    sp72n1 = .replace_labels(
    standardized_value_labels$sp72n1,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n10 = .replace_labels(
    standardized_value_labels$sp72n10,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n11 = .replace_labels(
    standardized_value_labels$sp72n11,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n12 = .replace_labels(
    standardized_value_labels$sp72n12,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n2 = .replace_labels(
    standardized_value_labels$sp72n2,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n3 = .replace_labels(
    standardized_value_labels$sp72n3,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n4 = .replace_labels(
    standardized_value_labels$sp72n4,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n5 = .replace_labels(
    standardized_value_labels$sp72n5,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n6 = .replace_labels(
    standardized_value_labels$sp72n6,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n7 = .replace_labels(
    standardized_value_labels$sp72n7,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n8 = .replace_labels(
    standardized_value_labels$sp72n8,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n9 = .replace_labels(
    standardized_value_labels$sp72n9,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp93n1 = .replace_labels(
    standardized_value_labels$sp93n1,
    `-2` = "na, see H/B/ISOCP93"
  ),
    sp95f1 = .replace_labels(
    standardized_value_labels$sp95f1,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f10 = .replace_labels(
    standardized_value_labels$sp95f10,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f11 = .replace_labels(
    standardized_value_labels$sp95f11,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f12 = .replace_labels(
    standardized_value_labels$sp95f12,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f13 = .replace_labels(
    standardized_value_labels$sp95f13,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f2 = .replace_labels(
    standardized_value_labels$sp95f2,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f3 = .replace_labels(
    standardized_value_labels$sp95f3,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f4 = .replace_labels(
    standardized_value_labels$sp95f4,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f5 = .replace_labels(
    standardized_value_labels$sp95f5,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f6 = .replace_labels(
    standardized_value_labels$sp95f6,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f7 = .replace_labels(
    standardized_value_labels$sp95f7,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f8 = .replace_labels(
    standardized_value_labels$sp95f8,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f9 = .replace_labels(
    standardized_value_labels$sp95f9,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp97s1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s6 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s8 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    rmso = .replace_labels(
    standardized_value_labels$rmso,
    `1` = "short interview"
  ),
    socp01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp16 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP04",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp18 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP05",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp19 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp20 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP08",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP09",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp23 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp24 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp25 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP12",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP13",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp27 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP14-26", `-1` = "na, asked"),
    socp28 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP27",
    `-1` = "na, asked",
    `0` = "does not visit",
    `1` = "no",
    `2` = "yes"
  ),
    socp30 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP28", `-1` = "na, asked"),
    socp31 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP27",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp33 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP31", `-1` = "na, asked"),
    socp46 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp47 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp48 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp49 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp50 = .replace_labels(
    standardized_value_labels$socp50,
    `-2` = "na, see H/B/IRMSO"
  ),
    socp51 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp52 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp55 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/IRMSO",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp56 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp57 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp58 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp59 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp60 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp61 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp66 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/IRMSO",
    `-1` = "na, asked",
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
    socp67 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP66",
    `-1` = "na, asked",
    `0` = "dependent on person"
  ),
    socp68 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/IRMSO",
    `-1` = "na, asked",
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
    socp69 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP68",
    `-1` = "na, asked",
    `0` = "dependent on person"
  ),
    socp72 = .replace_labels(
    standardized_value_labels$socp72,
    `-2` = "na, see H/B/IRMSO"
  ),
    socp73 = .replace_labels(
    standardized_value_labels$socp73,
    `-2` = "na, see H/B/ISOCP72"
  ),
    socp93 = .replace_labels(
    standardized_value_labels$socp93,
    `-2` = "na, see H/B/IRMSO"
  ),
    socp94 = .replace_labels(
    standardized_value_labels$socp94,
    `-3` = "often na, wrong skip",
    `-2` = "na, see H/B/ISOCP93"
  ),
    socp95 = .replace_labels(
    standardized_value_labels$socp95,
    `-2` = "na, see H/B/IRMSO"
  ),
    socp96 = .replace_labels(
    standardized_value_labels$socp96,
    `-2` = "na, see H/B/ISP95F6"
  ),
    socp98 = .replace_labels(
    standardized_value_labels$socp98,
    `-3` = "often na, wrong skip",
    `-2` = "na, see H/B/ISOCP97"
  ),
    socp99 = .replace_labels(
    standardized_value_labels$socp99,
    `-2` = "na, see H/BRMSO"
  ),
    socpyn = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/IRMSO",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    sp72n1 = .replace_labels(
    standardized_value_labels$sp72n1,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n10 = .replace_labels(
    standardized_value_labels$sp72n10,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n11 = .replace_labels(
    standardized_value_labels$sp72n11,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n12 = .replace_labels(
    standardized_value_labels$sp72n12,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n2 = .replace_labels(
    standardized_value_labels$sp72n2,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n3 = .replace_labels(
    standardized_value_labels$sp72n3,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n4 = .replace_labels(
    standardized_value_labels$sp72n4,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n5 = .replace_labels(
    standardized_value_labels$sp72n5,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n6 = .replace_labels(
    standardized_value_labels$sp72n6,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n7 = .replace_labels(
    standardized_value_labels$sp72n7,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n8 = .replace_labels(
    standardized_value_labels$sp72n8,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n9 = .replace_labels(
    standardized_value_labels$sp72n9,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp93n1 = .replace_labels(
    standardized_value_labels$sp93n1,
    `-2` = "na, see H/B/ISOCP93"
  ),
    sp95f1 = .replace_labels(
    standardized_value_labels$sp95f1,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f10 = .replace_labels(
    standardized_value_labels$sp95f10,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f11 = .replace_labels(
    standardized_value_labels$sp95f11,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f12 = .replace_labels(
    standardized_value_labels$sp95f12,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f13 = .replace_labels(
    standardized_value_labels$sp95f13,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f2 = .replace_labels(
    standardized_value_labels$sp95f2,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f3 = .replace_labels(
    standardized_value_labels$sp95f3,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f4 = .replace_labels(
    standardized_value_labels$sp95f4,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f5 = .replace_labels(
    standardized_value_labels$sp95f5,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f6 = .replace_labels(
    standardized_value_labels$sp95f6,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f7 = .replace_labels(
    standardized_value_labels$sp95f7,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f8 = .replace_labels(
    standardized_value_labels$sp95f8,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f9 = .replace_labels(
    standardized_value_labels$sp95f9,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp97s1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s6 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s8 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    rmso = .replace_labels(
    standardized_value_labels$rmso,
    `1` = "short interview"
  ),
    socp01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp01n = .replace_labels(
    standardized_value_labels$socp01n,
    `-3` = "many Dutch members: organization for the elderly, employers organization na, wrong skip",
    `-2` = "na, see BSOCP01",
    `1` = "mainly Dutch members",
    `2` = "many Dutch members",
    `3` = "little to none Dutch members"
  ),
    socp04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp04n = .replace_labels(
    standardized_value_labels$socp04n,
    `-3` = "many Dutch members: church, mosque or religious organization na, wrong skip",
    `-2` = "na, see BSOCP04",
    `1` = "mainly Dutch members",
    `2` = "many Dutch members",
    `3` = "little to none Dutch members"
  ),
    socp05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp05n = .replace_labels(
    standardized_value_labels$socp05n,
    `-3` = "many Dutch members: neighbourhood association na, wrong skip",
    `-2` = "na, see SOCP05",
    `1` = "mainly Dutch members",
    `2` = "many Dutch members",
    `3` = "little to none Dutch members"
  ),
    socp06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp06n = .replace_labels(
    standardized_value_labels$socp06n,
    `-3` = "many Dutch members: womens association, womens circle na, wrong skip",
    `-2` = "na, see BSOCP06",
    `1` = "mainly Dutch members",
    `2` = "many Dutch members",
    `3` = "little to none Dutch members"
  ),
    socp08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp08n = .replace_labels(
    standardized_value_labels$socp08n,
    `-3` = "many Dutch members: action group or association with social aim na, wrong skip",
    `-2` = "na, see BSOCP08",
    `1` = "mainly Dutch members",
    `2` = "many Dutch members",
    `3` = "little to none Dutch members"
  ),
    socp09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp09n = .replace_labels(
    standardized_value_labels$socp09n,
    `-3` = "many Dutch members: patients association na, wrong skip",
    `-2` = "na, see BSOCP09",
    `1` = "mainly Dutch members",
    `2` = "many Dutch members",
    `3` = "little to none Dutch members"
  ),
    socp10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp10n = .replace_labels(
    standardized_value_labels$socp10n,
    `-3` = "many Dutch members: cultural organization na, wrong skip",
    `-2` = "na, see BSOCP10",
    `1` = "mainly Dutch members",
    `2` = "many Dutch members",
    `3` = "little to none Dutch members"
  ),
    socp11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp11n = .replace_labels(
    standardized_value_labels$socp11n,
    `-3` = "many Dutch members: recreation, music or hobby club na, wrong skip",
    `-2` = "na, see BSOCP11",
    `1` = "mainly Dutch members",
    `2` = "many Dutch members",
    `3` = "little to none Dutch members"
  ),
    socp12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp12n = .replace_labels(
    standardized_value_labels$socp12n,
    `-3` = "many Dutch members: sporting club na, wrong skip",
    `-2` = "na, see BSOCP12",
    `1` = "mainly Dutch members",
    `2` = "many Dutch members",
    `3` = "little to none Dutch members"
  ),
    socp13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13n = .replace_labels(
    standardized_value_labels$socp13n,
    `-3` = "many Dutch members: other na, wrong skip",
    `-2` = "na, see BSOCP13",
    `1` = "mainly Dutch members",
    `2` = "many Dutch members",
    `3` = "little to none Dutch members"
  ),
    socp72 = .replace_labels(
    standardized_value_labels$socp72,
    `-2` = "na, see BRMSO"
  ),
    socp95 = .replace_labels(
    standardized_value_labels$socp95,
    `-2` = "na, see BRMSO"
  ),
    socpyn = c(`-3` = "na, wrong skip", `-2` = "na, see BRMSO", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    rmso = .replace_labels(
    standardized_value_labels$rmso,
    `1` = "short interview"
  ),
    socp01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp16 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP04",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp18 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP05",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp19 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp20 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP08",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP09",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp23 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp24 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp25 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP12",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP13",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp27 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP14-26", `-1` = "na, asked"),
    socp28 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP27",
    `-1` = "na, asked",
    `0` = "does not visit",
    `1` = "no",
    `2` = "yes"
  ),
    socp30 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP28", `-1` = "na, asked"),
    socp31 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP27",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp33 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP31", `-1` = "na, asked"),
    socp46 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp47 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp48 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp49 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp50 = .replace_labels(
    standardized_value_labels$socp50,
    `-2` = "na, see H/B/IRMSO"
  ),
    socp51 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp52 = c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked"),
    socp55 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/IRMSO",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp56 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp57 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp58 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp59 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp60 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp61 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp66 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/IRMSO",
    `-1` = "na, asked",
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
    socp67 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP66",
    `-1` = "na, asked",
    `0` = "dependent on person"
  ),
    socp68 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/IRMSO",
    `-1` = "na, asked",
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
    socp69 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP68",
    `-1` = "na, asked",
    `0` = "dependent on person"
  ),
    socp72 = .replace_labels(
    standardized_value_labels$socp72,
    `-2` = "na, see H/B/IRMSO"
  ),
    socp73 = .replace_labels(
    standardized_value_labels$socp73,
    `-2` = "na, see H/B/ISOCP72"
  ),
    socp93 = .replace_labels(
    standardized_value_labels$socp93,
    `-2` = "na, see H/B/IRMSO"
  ),
    socp94 = .replace_labels(
    standardized_value_labels$socp94,
    `-3` = "often na, wrong skip",
    `-2` = "na, see H/B/ISOCP93"
  ),
    socp95 = .replace_labels(
    standardized_value_labels$socp95,
    `-2` = "na, see H/B/IRMSO"
  ),
    socp96 = .replace_labels(
    standardized_value_labels$socp96,
    `-2` = "na, see H/B/ISP95F6"
  ),
    socp98 = .replace_labels(
    standardized_value_labels$socp98,
    `-3` = "often na, wrong skip",
    `-2` = "na, see H/B/ISOCP97"
  ),
    socpyn = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/IRMSO",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    sp72n1 = .replace_labels(
    standardized_value_labels$sp72n1,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n10 = .replace_labels(
    standardized_value_labels$sp72n10,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n11 = .replace_labels(
    standardized_value_labels$sp72n11,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n12 = .replace_labels(
    standardized_value_labels$sp72n12,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n2 = .replace_labels(
    standardized_value_labels$sp72n2,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n3 = .replace_labels(
    standardized_value_labels$sp72n3,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n4 = .replace_labels(
    standardized_value_labels$sp72n4,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n5 = .replace_labels(
    standardized_value_labels$sp72n5,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n6 = .replace_labels(
    standardized_value_labels$sp72n6,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n7 = .replace_labels(
    standardized_value_labels$sp72n7,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n8 = .replace_labels(
    standardized_value_labels$sp72n8,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp72n9 = .replace_labels(
    standardized_value_labels$sp72n9,
    `-2` = "na, see H/B/ISOCP72"
  ),
    sp93n1 = .replace_labels(
    standardized_value_labels$sp93n1,
    `-2` = "na, see H/B/ISOCP93"
  ),
    sp95f1 = .replace_labels(
    standardized_value_labels$sp95f1,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f10 = .replace_labels(
    standardized_value_labels$sp95f10,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f11 = .replace_labels(
    standardized_value_labels$sp95f11,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f12 = .replace_labels(
    standardized_value_labels$sp95f12,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f13 = .replace_labels(
    standardized_value_labels$sp95f13,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f2 = .replace_labels(
    standardized_value_labels$sp95f2,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f3 = .replace_labels(
    standardized_value_labels$sp95f3,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f4 = .replace_labels(
    standardized_value_labels$sp95f4,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f5 = .replace_labels(
    standardized_value_labels$sp95f5,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f6 = .replace_labels(
    standardized_value_labels$sp95f6,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f7 = .replace_labels(
    standardized_value_labels$sp95f7,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f8 = .replace_labels(
    standardized_value_labels$sp95f8,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp95f9 = .replace_labels(
    standardized_value_labels$sp95f9,
    `-2` = "na, see H/B/ISOCP95"
  ),
    sp97s1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s6 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    sp97s8 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/ISOCP97",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    rmso = c(`-2` = "valid data", `1` = "short interview"),
    socp01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCPYN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp16 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP04",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp18 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP05",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp19 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp20 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP08",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP09",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp23 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp24 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp25 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP12",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP13",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp27 = c(`-3` = "na, wrong skip", `-2` = "na, see JSOCP14-26", `-1` = "na, asked"),
    socp28 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP27",
    `-1` = "na, asked",
    `0` = "does not visit",
    `1` = "no",
    `2` = "yes"
  ),
    socp30 = c(`-3` = "na, wrong skip", `-2` = "na, see JSOCP28", `-1` = "na, asked"),
    socp31 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP27",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    socp33 = c(`-3` = "na, wrong skip", `-2` = "na, see JSOCP31", `-1` = "na, asked"),
    socp46 = c(`-3` = "na, wrong skip", `-2` = "na, see JRMSO", `-1` = "na, asked"),
    socp47 = c(`-3` = "na, wrong skip", `-2` = "na, see JRMSO", `-1` = "na, asked"),
    socp48 = c(`-3` = "na, wrong skip", `-2` = "na, see JRMSO", `-1` = "na, asked"),
    socp49 = c(`-3` = "na, wrong skip", `-2` = "na, see JRMSO", `-1` = "na, asked"),
    socp51 = c(`-3` = "na, wrong skip", `-2` = "na, see JRMSO", `-1` = "na, asked"),
    socp52 = c(`-3` = "na, wrong skip", `-2` = "na, see JRMSO", `-1` = "na, asked"),
    socp55 = c(`-3` = "na, wrong skip", `-2` = "na, see JRMSO", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    socp56 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp57 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp58 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp59 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp60 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp61 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP55",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    socp66 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JRMSO",
    `-1` = "na, asked",
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
    socp67 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP66",
    `-1` = "na, asked",
    `0` = "dependent on person"
  ),
    socp68 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JRMSO",
    `-1` = "na, asked",
    `1` = "agree",
    `2` = "disagree",
    `3` = "no opinion/don't know"
  ),
    socp69 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JSOCP68",
    `-1` = "na, asked",
    `0` = "dependent on person"
  ),
    socp72 = .replace_labels(
    standardized_value_labels$socp72,
    `-2` = "na, see JRMSO"
  ),
    socp73 = .replace_labels(
    standardized_value_labels$socp73,
    `-2` = "na, see JSOCP72"
  ),
    socp93 = .replace_labels(
    standardized_value_labels$socp93,
    `-2` = "na, see JRMSO"
  ),
    socp94 = .replace_labels(
    standardized_value_labels$socp94,
    `-3` = "often na, wrong skip",
    `-2` = "na, see JSOCP93"
  ),
    socp95 = .replace_labels(
    standardized_value_labels$socp95,
    `-2` = "na, see JSOCP72"
  ),
    socp96 = .replace_labels(
    standardized_value_labels$socp96,
    `-2` = "na, see JSP95F6"
  ),
    socp97 = .replace_labels(
    standardized_value_labels$socp97,
    `-2` = "na, wrong skip)-3), na, see JSOCP72 & JSOCP93 & JSOCP95"
  ),
    socp98 = .replace_labels(
    standardized_value_labels$socp98,
    `-3` = "often na, wrong skip",
    `-2` = "na, see JSOCP97"
  ),
    socpr50 = c(`-3` = "na, wrong skip", `-2` = "na, see JRMSO", `-1` = "na, asked"),
    socpyn = c(`-3` = "na, wrong skip", `-2` = "na, see JRMSO", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    sp72n1 = .replace_labels(
    standardized_value_labels$sp72n1,
    `-2` = "na, see JSOCP72"
  ),
    sp72n10 = .replace_labels(
    standardized_value_labels$sp72n10,
    `-2` = "na, see JSOCP72"
  ),
    sp72n11 = .replace_labels(
    standardized_value_labels$sp72n11,
    `-2` = "na, see JSOCP72"
  ),
    sp72n2 = .replace_labels(
    standardized_value_labels$sp72n2,
    `-2` = "na, see JSOCP72"
  ),
    sp72n3 = .replace_labels(
    standardized_value_labels$sp72n3,
    `-2` = "na, see JSOCP72"
  ),
    sp72n4 = .replace_labels(
    standardized_value_labels$sp72n4,
    `-2` = "na, see JSOCP72"
  ),
    sp72n5 = .replace_labels(
    standardized_value_labels$sp72n5,
    `-2` = "na, see JSOCP72"
  ),
    sp72n6 = .replace_labels(
    standardized_value_labels$sp72n6,
    `-2` = "na, see JSOCP72"
  ),
    sp72n7 = .replace_labels(
    standardized_value_labels$sp72n7,
    `-2` = "na, see JSOCP72"
  ),
    sp72n8 = .replace_labels(
    standardized_value_labels$sp72n8,
    `-2` = "na, see JSOCP72"
  ),
    sp93n1 = .replace_labels(
    standardized_value_labels$sp93n1,
    `-2` = "na, see JSOCP93"
  ),
    sp95f1 = .replace_labels(
    standardized_value_labels$sp95f1,
    `-2` = "na, see JSOCP95"
  ),
    sp95f11 = .replace_labels(
    standardized_value_labels$sp95f11,
    `-2` = "na, see JSOCP95"
  ),
    sp95f13 = .replace_labels(
    standardized_value_labels$sp95f13,
    `-2` = "na, see JSOCP95"
  ),
    sp95f14 = .replace_labels(
    standardized_value_labels$sp95f14,
    `-2` = "na, see JSOCP95"
  ),
    sp95f15 = .replace_labels(
    standardized_value_labels$sp95f15,
    `-2` = "na, see JSOCP95"
  ),
    sp95f16 = .replace_labels(
    standardized_value_labels$sp95f16,
    `-2` = "na, see JSOCP95"
  ),
    sp95f17 = .replace_labels(
    standardized_value_labels$sp95f17,
    `-2` = "na, see JSOCP95"
  ),
    sp95f2 = .replace_labels(
    standardized_value_labels$sp95f2,
    `-2` = "na, see JSOCP95"
  ),
    sp95f3 = .replace_labels(
    standardized_value_labels$sp95f3,
    `-2` = "na, see JSOCP95"
  ),
    sp95f4 = .replace_labels(
    standardized_value_labels$sp95f4,
    `-2` = "na, see JSOCP95"
  ),
    sp95f5 = .replace_labels(
    standardized_value_labels$sp95f5,
    `-2` = "na, see JSOCP95"
  ),
    sp95f6 = .replace_labels(
    standardized_value_labels$sp95f6,
    `-2` = "na, see JSOCP95"
  ),
    sp95f7 = .replace_labels(
    standardized_value_labels$sp95f7,
    `-2` = "na, see JSOCP95"
  ),
    sp95f8 = .replace_labels(
    standardized_value_labels$sp95f8,
    `-2` = "na, see JSOCP95"
  ),
    sp95f9 = .replace_labels(
    standardized_value_labels$sp95f9,
    `-2` = "na, see JSOCP95"
  ),
    sp97s1 = .replace_labels(
    standardized_value_labels$sp97s1,
    `-2` = "na, see JSOCP97"
  ),
    sp97s2 = .replace_labels(
    standardized_value_labels$sp97s2,
    `-2` = "na, see JSOCP97"
  ),
    sp97s3 = .replace_labels(
    standardized_value_labels$sp97s3,
    `-2` = "na, see JSOCP97"
  ),
    sp97s4 = .replace_labels(
    standardized_value_labels$sp97s4,
    `-2` = "na, see JSOCP97"
  ),
    sp97s5 = .replace_labels(
    standardized_value_labels$sp97s5,
    `-2` = "na, see JSOCP97"
  ),
    sp97s6 = .replace_labels(
    standardized_value_labels$sp97s6,
    `-2` = "na, see JSOCP97"
  ),
    sp97s7 = .replace_labels(
    standardized_value_labels$sp97s7,
    `-2` = "na, see JSOCP97"
  ),
    sp97s8 = .replace_labels(
    standardized_value_labels$sp97s8,
    `-2` = "na, see JSOCP97"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "070", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "070", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "070", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "070", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["socp97"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["sp93n11"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["sp93n12"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["sp93n2"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["sp93n3"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["sp93n4"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["sp93n5"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["sp93n6"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["sp93n7"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["sp93n8"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["sp93n9"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["socp97"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["sp93n11"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["sp93n12"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["sp93n2"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["sp93n3"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["sp93n4"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["sp93n5"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["sp93n6"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["sp93n7"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["sp93n8"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["sp93n9"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["socp97"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["sp93n11"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["sp93n12"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["sp93n2"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["sp93n3"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["sp93n4"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["sp93n5"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["sp93n6"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["sp93n7"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["sp93n8"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["sp93n9"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["sp93n11"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["sp93n13"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["sp93n14"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["sp93n2"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["sp93n3"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["sp93n4"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["sp93n5"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["sp93n6"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["sp93n7"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["sp93n8"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)

.lasa_fc_070 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

