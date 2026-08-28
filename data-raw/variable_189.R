## LASA filecode 189 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  madapt = "Indication for adaptations",
  mappli = "Indication for an appliance",
  mcizna = "reason not applied for indication",
  mcizrd = "reason application declined",
  mcizyn = "Applied for Indication",
  mdistr = "Indication for nursing care",
  mdistrh = "Nursing care: hours per week",
  mdomeca = "Home care: domestic tasks",
  mdomech = "Domestic tasks: Number of hours/week",
  mdtreat = "day treatment res care",
  medntyp = "Type of day/night treatment in home for the elderly",
  meldedn = "Day/night treatment in home for the elderly",
  melderh = "Home for the elderly: Number of hours/week",
  melderl = "Stay in home for the elderly",
  mhomeca = "Indication for home care",
  mi24ca = "indication 24 hours care (at home or residential): applied",
  mi24cg = "indication 24 hours care (at home or residential): granted",
  mi24ch = "indication 24 hours care (at home or residential): hours granted",
  mi24cm = "indication 24 hours care (at home or residential): minutes granted",
  mi24crd = "indication 24 hours care (at home or residential): reason declined",
  mi24crw = "indication 24 hours care (at home or residential): reason withdrawn",
  midaca = "indication daytime activities (group): applied",
  midacg = "indication daytime activities (group): granted",
  midach = "indication daytime activities (group): hours granted",
  midacm = "indication daytime activities (group): minutes granted",
  midacrd = "indication daytime activities (group): reason declined",
  midacrw = "indication daytime activities (group): reason withdrawn",
  midn = "Indication for day/night treatment",
  miguia = "indication guidance (one on one): applied",
  miguig = "indication guidance (one on one): granted",
  miguih = "indication guidance (one on one): hours granted",
  miguim = "indication guidance (one on one): minutes granted",
  miguird = "indication guidance (one on one): reason declined",
  miguirw = "indication guidance (one on one): reason withdrawn",
  mihada = "indication house adaptation: applied",
  mihadg = "indication house adaptation: granted",
  mihadrd = "indication house adaptation: reason declined",
  mihadrw = "indication house adaptation: reason withdrawn",
  mihhaa = "indication household assistance at home: applied",
  mihhag = "indication household assistance at home: granted",
  mihhah = "indication household assistance at home: hours granted",
  mihham = "indication household assistance at home: minutes granted",
  mihhard = "indication household assistance at home: reason declined",
  mihharw = "indication household assistance at home: reason withdrawn",
  mindnat = "indication granted: care in kind",
  mindpgb = "indication granted: PGB",
  mindtype = "type of indication granted",
  mintca = "indication night treatment residential care: applied",
  mintcc = "indication night treatment residential care: comment",
  mintcg = "indication night treatment residential care: granted",
  mintch = "indication night treatment residential care: hours granted",
  mintcm = "indication night treatment residential care: minutes granted",
  mintcn = "indication night treatment residential care: number nights granted",
  mintcrd = "indication night treatment residential care: reason declined",
  mintcrw = "indication night treatment residential care: reason withdrawn",
  minura = "indication nursing at home: applied",
  minurg = "indication nursing at home: granted",
  minurh = "indication nursing at home: hours granted",
  minurm = "indication nursing at home: minutes granted",
  minurrd = "indication nursing at home: reason declined",
  minurrw = "indication nursing at home: reason withdrawn",
  mioag = "Other ind.: activating guidance",
  mioagh = "Other ind.: activating guidance: Number of hours/week",
  miose = "Other ind.: something else",
  mioseh = "Other ind.: something else: Number of hours/week",
  miosg = "Other ind.: supporting guidance",
  miosgh = "Other ind.: supporting guidance: Number of hours/week",
  miotha = "other indication: applied",
  miothg = "other indication: granted",
  miothh = "other indication: hours granted",
  miothm = "other indication: minutes granted",
  miothrd = "other indication: reason declined",
  miothrw = "other indication: reason withdrawn",
  miotr = "Other ind.: treatment",
  miotrh = "Other ind.: treatment: Number of hours/week",
  mipca = "indication personal care at home: applied",
  mipcg = "indication personal care at home: granted",
  mipch = "indication personal care at home: hours granted",
  mipcm = "indication personal care at home: minutes granted",
  mipcrd = "indication personal care at home: reason declined",
  mipcrw = "indication personal care at home: reason withdrawn",
  missca = "indication short stay residential care: applied",
  misscd = "indication short stay residential care: days granted",
  misscg = "indication short stay residential care: granted",
  misscrd = "indication short stay residential care: reason declined",
  misscrw = "indication short stay residential care: reason withdrawn",
  misshd = "indication short stay residential care: number days, weeks, months granted",
  missn = "indication short stay residential care: how many days/weeks/months for short stay",
  mistay = "Indication for stay in (nursing) home",
  mitraa = "indication transport: applied",
  mitrag = "indication transport: granted",
  mitrard = "indication transport: reason declined",
  mitrarw = "indication transport: reason withdrawn",
  mitypc = "Indicated care funding/delivery type",
  mlstay = "long stay residential care",
  mmeal = "Indication for meals",
  mmealn = "Number of meals per week",
  mndndep = "Day/night treatment in nursing home: department",
  mndntyp = "Type of day/night treatment in nursing home",
  mntreat = "night treatment res care",
  mnurdep = "Nursing home: department",
  mnursdn = "Day/night treatment in nursing home",
  mnursh = "Nursing home: Number of hours/week",
  mnursin = "Stay in nursing home",
  mother = "other indication",
  motherh = "other care: Number of hours per week",
  mpersca = "Indication for personal care",
  mpersch = "Personal care: hours per week",
  mpgbac = "PGB administration: child(ren)",
  mpgbadm = "PGB administration by person",
  mpgbao = "PGB administration: other",
  mpgbap = "PGB administration: partner",
  mpgbaph = "PGB administration: private help",
  mpgbas = "PGB administration: self",
  mpgbca = "PGB: care by children living away from home",
  mpgbcat = "PGB: type of care by children living away from home",
  mpgbchc = "PGB: outside hh child personal care",
  mpgbchg = "PGB: outside hh child guidance",
  mpgbchh = "PGB: outside hh child household care",
  mpgbdev = "PGB: devices or transport",
  mpgbf = "PGB: care by friends",
  mpgbfa = "PGB: care by family living away from home",
  mpgbfat = "PGB: type of care by family living away from home",
  mpgbfrc = "PGB: friend personal care",
  mpgbfrg = "PGB: friend guidance",
  mpgbfrh = "PGB: friend household care",
  mpgbft = "PGB: type of care by friends",
  mpgbhc = "PGB: care by personnel home care",
  mpgbhcc = "PGB: home care personal care",
  mpgbhcg = "PGB: home care guidance",
  mpgbhch = "PGB: home care household care",
  mpgbhct = "PGB: type of care by personnel home care",
  mpgbhf = "PGB: care by household family/friend",
  mpgbhft = "PGB: type of care by household family/friend",
  mpgbhmc = "PGB: hh member personal care",
  mpgbhmg = "PGB: hh member guidance",
  mpgbhmh = "PGB: hh member household care",
  mpgbn = "PGB: care by neighbours",
  mpgbnbc = "PGB: neighbor personal care",
  mpgbnbg = "PGB: neighbor guidance",
  mpgbnbh = "PGB: neighbor household care",
  mpgbnt = "PGB: type of care by neighbours",
  mpgbo = "PGB: care by others",
  mpgbot = "PGB: type of care by others",
  mpgbotc = "PGB: other personal care",
  mpgbotg = "PGB: other guidance",
  mpgboth = "PGB: other household care",
  mpgbp = "PGB: care by partner",
  mpgbpc = "PGB: care by private care",
  mpgbpct = "PGB: type of care by private care",
  mpgbpg = "PGB: partner guidance",
  mpgbph = "PGB: partner household care",
  mpgbphc = "PGB: private help personal care",
  mpgbphg = "PGB: private help guidance",
  mpgbphh = "PGB: private help household care",
  mpgbpt = "PGB: type of care by partner",
  mpgbrcc = "PGB: res care personal care",
  mpgbrcg = "PGB: res care guidance",
  mpgbrch = "PGB: res care household care",
  mpgbrlc = "PGB: relative personal care",
  mpgbrlg = "PGB: relative guidance",
  mpgbrlh = "PGB: relative household care",
  mppgbdn = "PGB: paying for care to: district nurse",
  mppgbfo = "PGB: paying for care to: other family (non-resident)",
  mppgbnf = "PGB: paying for care to: neighbours/friends/acquaintances",
  mppgbot = "PGB: paying for care to: other",
  mppgbpa = "PGB: paying for care to: partner",
  mppgbpc = "PGB: paying for care to: professional home care",
  mppgbph = "PGB: paying for care to: private help",
  mppgbrc = "PGB: paying for care to: resident child",
  mppgbro = "PGB: paying for care to: other resident",
  mppgbvo = "PGB: paying for care to: volunteers",
  mriooth = "Other indication",
  mrioyn = "Medical care indication/application status",
  mshstay = "short stay residential care",
  murgyn = "Urgent indication"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `E` = c(
    "madapt",
    "mappli",
    "mdistr",
    "mdistrh",
    "mdomeca",
    "mdomech",
    "meldedn",
    "melderh",
    "melderl",
    "mhomeca",
    "mmeal",
    "mmealn",
    "mnurdep",
    "mnursdn",
    "mnursh",
    "mnursin",
    "mpersca",
    "mpersch",
    "mriooth",
    "mrioyn",
    "murgyn"
  ),
  `F` = c(
    "madapt",
    "mappli",
    "mdistr",
    "mdistrh",
    "mdomeca",
    "mdomech",
    "medntyp",
    "meldedn",
    "melderl",
    "midn",
    "mioag",
    "mioagh",
    "miose",
    "mioseh",
    "miosg",
    "miosgh",
    "miotr",
    "miotrh",
    "mistay",
    "mitypc",
    "mmeal",
    "mmealn",
    "mndndep",
    "mndntyp",
    "mnurdep",
    "mnursdn",
    "mnursin",
    "mpersca",
    "mpersch",
    "mpgbadm",
    "mpgbca",
    "mpgbcat",
    "mpgbf",
    "mpgbfa",
    "mpgbfat",
    "mpgbft",
    "mpgbhc",
    "mpgbhct",
    "mpgbhf",
    "mpgbhft",
    "mpgbn",
    "mpgbnt",
    "mpgbo",
    "mpgbot",
    "mpgbp",
    "mpgbpc",
    "mpgbpct",
    "mpgbpt",
    "mriooth",
    "mrioyn",
    "murgyn"
  ),
  `G` = c(
    "mdistr",
    "mdistrh",
    "mdtreat",
    "mitypc",
    "mlstay",
    "mntreat",
    "mother",
    "motherh",
    "mpersca",
    "mpersch",
    "mpgbadm",
    "mpgbchc",
    "mpgbchg",
    "mpgbchh",
    "mpgbdev",
    "mpgbfrc",
    "mpgbfrg",
    "mpgbfrh",
    "mpgbhcc",
    "mpgbhcg",
    "mpgbhch",
    "mpgbhmc",
    "mpgbhmg",
    "mpgbhmh",
    "mpgbnbc",
    "mpgbnbg",
    "mpgbnbh",
    "mpgbotc",
    "mpgbotg",
    "mpgboth",
    "mpgbpc",
    "mpgbpg",
    "mpgbph",
    "mpgbphc",
    "mpgbphg",
    "mpgbphh",
    "mpgbrcc",
    "mpgbrcg",
    "mpgbrch",
    "mpgbrlc",
    "mpgbrlg",
    "mpgbrlh",
    "mrioyn",
    "mshstay",
    "murgyn"
  ),
  `H` = c(
    "mcizna",
    "mcizrd",
    "mcizyn",
    "mdistr",
    "mdistrh",
    "mdtreat",
    "mitypc",
    "mlstay",
    "mntreat",
    "mother",
    "motherh",
    "mpersca",
    "mpersch",
    "mpgbac",
    "mpgbao",
    "mpgbap",
    "mpgbaph",
    "mpgbas",
    "mpgbchc",
    "mpgbchg",
    "mpgbchh",
    "mpgbdev",
    "mpgbfrc",
    "mpgbfrg",
    "mpgbfrh",
    "mpgbhcc",
    "mpgbhcg",
    "mpgbhch",
    "mpgbhmc",
    "mpgbhmg",
    "mpgbhmh",
    "mpgbnbc",
    "mpgbnbg",
    "mpgbnbh",
    "mpgbotc",
    "mpgbotg",
    "mpgboth",
    "mpgbpc",
    "mpgbpg",
    "mpgbph",
    "mpgbphc",
    "mpgbphg",
    "mpgbphh",
    "mpgbrcc",
    "mpgbrcg",
    "mpgbrch",
    "mpgbrlc",
    "mpgbrlg",
    "mpgbrlh",
    "mshstay",
    "murgyn"
  ),
  `I` = c(
    "mi24ca",
    "mi24cg",
    "mi24cm",
    "mi24crd",
    "midaca",
    "midacg",
    "midacm",
    "midacrd",
    "miguia",
    "miguig",
    "miguim",
    "miguird",
    "mihada",
    "mihadg",
    "mihadrd",
    "mihhaa",
    "mihhag",
    "mihham",
    "mihhard",
    "mindnat",
    "mindpgb",
    "mintca",
    "mintcg",
    "mintcm",
    "mintcrd",
    "minura",
    "minurg",
    "minurm",
    "minurrd",
    "miotha",
    "miothg",
    "miothm",
    "miothrd",
    "mipca",
    "mipcg",
    "mipcm",
    "mipcrd",
    "missca",
    "misscd",
    "misscg",
    "misscrd",
    "mitraa",
    "mitrag",
    "mitrard",
    "mpgbac",
    "mpgbao",
    "mpgbap",
    "mpgbaph",
    "mpgbas",
    "mppgbdn",
    "mppgbfo",
    "mppgbnf",
    "mppgbot",
    "mppgbpa",
    "mppgbpc",
    "mppgbph",
    "mppgbrc",
    "mppgbro",
    "mppgbvo"
  ),
  `J` = c(
    "mi24ca",
    "mi24cg",
    "mi24ch",
    "mi24cm",
    "mi24crd",
    "mi24crw",
    "midaca",
    "midacg",
    "midach",
    "midacm",
    "midacrd",
    "midacrw",
    "miguia",
    "miguig",
    "miguih",
    "miguim",
    "miguird",
    "miguirw",
    "mihada",
    "mihadg",
    "mihadrd",
    "mihadrw",
    "mihhaa",
    "mihhag",
    "mihhah",
    "mihham",
    "mihhard",
    "mihharw",
    "mindtype",
    "mintca",
    "mintcg",
    "mintch",
    "mintcm",
    "mintcrd",
    "mintcrw",
    "minura",
    "minurg",
    "minurh",
    "minurm",
    "minurrd",
    "minurrw",
    "miotha",
    "miothg",
    "miothh",
    "miothm",
    "miothrd",
    "miothrw",
    "mipca",
    "mipcg",
    "mipch",
    "mipcm",
    "mipcrd",
    "mipcrw",
    "missca",
    "misscd",
    "misscg",
    "misscrd",
    "misscrw",
    "mitraa",
    "mitrag",
    "mitrard",
    "mitrarw",
    "mpgbac",
    "mpgbao",
    "mpgbap",
    "mpgbaph",
    "mpgbas",
    "mppgbdn",
    "mppgbfo",
    "mppgbnf",
    "mppgbot",
    "mppgbpa",
    "mppgbpc",
    "mppgbph",
    "mppgbrc",
    "mppgbro",
    "mppgbvo"
  ),
  `K` = c(
    "mi24ca",
    "mi24cg",
    "mi24crd",
    "mi24crw",
    "midaca",
    "midacg",
    "midach",
    "midacm",
    "midacrd",
    "midacrw",
    "miguia",
    "miguig",
    "miguih",
    "miguim",
    "miguird",
    "miguirw",
    "mihada",
    "mihadg",
    "mihadrd",
    "mihadrw",
    "mihhaa",
    "mihhag",
    "mihhah",
    "mihham",
    "mihhard",
    "mihharw",
    "mindtype",
    "mintca",
    "mintcc",
    "mintcg",
    "mintcn",
    "mintcrd",
    "mintcrw",
    "minura",
    "minurg",
    "minurh",
    "minurm",
    "minurrd",
    "minurrw",
    "miotha",
    "miothg",
    "miothrd",
    "miothrw",
    "mipca",
    "mipcg",
    "mipch",
    "mipcm",
    "mipcrd",
    "mipcrw",
    "missca",
    "misscg",
    "misscrd",
    "misscrw",
    "misshd",
    "missn",
    "mitraa",
    "mitrag",
    "mitrard",
    "mitrarw",
    "mpgbac",
    "mpgbao",
    "mpgbap",
    "mpgbaph",
    "mpgbas",
    "mppgbdn",
    "mppgbfo",
    "mppgbnf",
    "mppgbot",
    "mppgbpa",
    "mppgbpc",
    "mppgbph",
    "mppgbrc",
    "mppgbro",
    "mppgbvo"
  )
)

variable_labels_list <- list(
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    mdistr = "Indication for district nurse",
    mdistrh = "District nurse: # hours/week",
    mdomech = "Domestic tasks: # hours/week",
    melderh = "Home for the elderly: # hours/week",
    mmealn = "# meals per week",
    mnursh = "Nursing home: # hours/week",
    mpersca = "Home care: personal care",
    mpersch = "Personal care: # hours/week",
    mrioyn = "Indication (on medical grounds)"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    mdistr = "Indication for nursing",
    mdistrh = "nursing: # hours/week",
    mdomeca = "Indication for domestic care",
    mdomech = "Domestic care: # hours/week",
    mioagh = "Other ind.: activating guidance: # hours/week",
    mioseh = "Other ind.: something else: # hours/week",
    miosgh = "Other ind.: supporting guidance: # hours/week",
    miotrh = "Other ind.: treatment: # hours/week",
    mitypc = "Indication: type of care",
    mmealn = "# meals per week",
    mpersch = "Personal care: # hours/week",
    mpgbadm = "PGB: administration",
    mrioyn = "Indication (on medical grounds)"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    mdistr = "indication for nursing",
    mdistrh = "nursing: # hrs per week",
    mitypc = "home care services or PGB",
    motherh = "other care: # hrs per week",
    mpersca = "indication personal care",
    mpersch = "personal care: # hrs per week",
    mpgbadm = "PGB: administration",
    mpgbpc = "PGB: partner personal care",
    mrioyn = "Applied for Indication",
    murgyn = "urgent indication"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    mdistr = "indication for nursing",
    mdistrh = "nursing: # hrs per week",
    mitypc = "home care services or PGB",
    motherh = "other care: # hrs per week",
    mpersca = "indication personal care",
    mpersch = "personal care: # hrs per week",
    mpgbpc = "PGB: partner personal care",
    murgyn = "urgent indication"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    mpgbac = "PGB: administration: child(ren)",
    mpgbao = "PGB: administration: other",
    mpgbap = "PGB: administration: partner",
    mpgbaph = "PGB: administration: private help",
    mpgbas = "PGB: administration: self"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    mpgbac = "PGB: administration: child(ren)",
    mpgbao = "PGB: administration: other",
    mpgbap = "PGB: administration: partner",
    mpgbaph = "PGB: administration: private help",
    mpgbas = "PGB: administration: self"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    mpgbac = "PGB: administration: child(ren)",
    mpgbao = "PGB: administration: other",
    mpgbap = "PGB: administration: partner",
    mpgbaph = "PGB: administration: private help",
    mpgbas = "PGB: administration: self"
  ),
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "mentioned",
  `2` = "yes",
  `3` = "other",
  `4` = "withdrawn"
)

standardized_value_labels <- list(
  madapt = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mappli = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mcizna = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "not needed",
    `2` = "prefer self-regulation",
    `3` = "did not know",
    `4` = "do not dare/not able",
    `5` = "other reason"
  ),
  mcizrd = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "must rely on informal network",
    `2` = "need for help not strong enough",
    `3` = "other reason"
  ),
  mcizyn = c(
    `-5` = "section not done",
    `1` = "no",
    `2` = "yes, declined",
    `3` = "yes, not approved yet",
    `4` = "yes"
  ),
  mdistr = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mdistrh = c(
    default_missing_labels[c("-2", "-1")]
  ),
  mdomeca = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mdomech = c(
    default_missing_labels[c("-2", "-1")]
  ),
  mdtreat = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    `2` = "yes, elderly home",
    `3` = "yes, nursing home, somatic",
    `4` = "yes, nursing home, psychogeriatric"
  ),
  medntyp = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "day treatment",
    `2` = "night treatment",
    `3` = "both"
  ),
  meldedn = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")],
    `3` = "both"
  ),
  melderh = c(
    default_missing_labels[c("-2", "-1")]
  ),
  melderl = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mhomeca = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mi24ca = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mi24cg = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2", "4")],
    `3` = "under consideration"
  ),
  mi24ch = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  mi24cm = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  mi24crd = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  mi24crw = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  midaca = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  midacg = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2", "4")],
    `3` = "under consideration"
  ),
  midach = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  midacm = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  midacrd = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  midacrw = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  midn = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  miguia = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  miguig = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2", "4")],
    `3` = "under consideration"
  ),
  miguih = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  miguim = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  miguird = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  miguirw = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  mihada = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mihadg = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2", "4")],
    `3` = "under consideration"
  ),
  mihadrd = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  mihadrw = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  mihhaa = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mihhag = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2", "4")],
    `3` = "under consideration"
  ),
  mihhah = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  mihham = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  mihhard = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  mihharw = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  mindnat = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mindpgb = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mindtype = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    default_missing_labels[c("-1")],
    `1` = "in kind",
    `2` = "Personal budget (PGB)",
    `3` = "both"
  ),
  mintca = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mintcc = stats::setNames(character(0), character(0)),
  mintcg = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2", "4")],
    `3` = "under consideration"
  ),
  mintch = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  mintcm = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  mintcn = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  mintcrd = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  mintcrw = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  minura = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  minurg = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2", "4")],
    `3` = "under consideration"
  ),
  minurh = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  minurm = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  minurrd = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  minurrw = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  mioag = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mioagh = c(
    default_missing_labels[c("-2", "-1")]
  ),
  miose = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mioseh = c(
    default_missing_labels[c("-2", "-1")]
  ),
  miosg = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  miosgh = c(
    default_missing_labels[c("-2", "-1")]
  ),
  miotha = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  miothg = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2", "4")],
    `3` = "under consideration"
  ),
  miothh = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  miothm = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  miothrd = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  miothrw = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  miotr = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  miotrh = c(
    default_missing_labels[c("-2", "-1")]
  ),
  mipca = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mipcg = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2", "4")],
    `3` = "under consideration"
  ),
  mipch = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  mipcm = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  mipcrd = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  mipcrw = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  missca = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  misscd = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  misscg = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2", "4")],
    `3` = "under consideration"
  ),
  misscrd = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  misscrw = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  misshd = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  missn = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")]
  ),
  mistay = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mitraa = c(
    `-3` = "section not done",
    `-2` = "na, no contact about services",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mitrag = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2", "4")],
    `3` = "under consideration"
  ),
  mitrard = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  mitrarw = c(
    `-2` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "informal network should help",
    `2` = "need for care is not serious enough",
    default_answer_labels[c("3")]
  ),
  mitypc = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "care paid by org",
    `2` = "PGB"
  ),
  mlstay = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    `2` = "yes, elderly home",
    `3` = "yes, nursing home, somatic",
    `4` = "yes, nursing home, psychogeriatric"
  ),
  mmeal = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mmealn = c(
    default_missing_labels[c("-2", "-1")]
  ),
  mndndep = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "somatic",
    `2` = "psychogeriatric"
  ),
  mndntyp = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "day treatment",
    `2` = "night treatment",
    `3` = "both"
  ),
  mntreat = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    `2` = "yes, elderly home",
    `3` = "yes, nursing home, somatic",
    `4` = "yes, nursing home, psychogeriatric"
  ),
  mnurdep = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "somatic",
    `2` = "psychogeriatric"
  ),
  mnursdn = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")],
    `3` = "both"
  ),
  mnursh = c(
    default_missing_labels[c("-2", "-1")]
  ),
  mnursin = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mother = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  motherh = c(
    default_missing_labels[c("-2", "-1")]
  ),
  mpersca = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mpersch = c(
    default_missing_labels[c("-2", "-1")]
  ),
  mpgbac = c(
    `-2` = "not applicable based on routing/PGB indication status",
    default_missing_labels[c("-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbadm = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "respondent",
    `2` = "spouse",
    `3` = "child(ren)",
    `4` = "private help",
    `5` = "other"
  ),
  mpgbao = c(
    `-2` = "not applicable based on routing/PGB indication status",
    default_missing_labels[c("-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbap = c(
    `-2` = "not applicable based on routing/PGB indication status",
    default_missing_labels[c("-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbaph = c(
    `-2` = "not applicable based on routing/PGB indication status",
    default_missing_labels[c("-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbas = c(
    `-2` = "not applicable based on routing/PGB indication status",
    default_missing_labels[c("-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbca = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbcat = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "domestic care",
    `2` = "personal care",
    `3` = "both"
  ),
  mpgbchc = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbchg = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbchh = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbdev = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mpgbf = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbfa = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbfat = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "domestic care",
    `2` = "personal care",
    `3` = "both"
  ),
  mpgbfrc = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbfrg = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbfrh = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbft = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "domestic care",
    `2` = "personal care",
    `3` = "both"
  ),
  mpgbhc = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbhcc = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbhcg = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbhch = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbhct = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "domestic care",
    `2` = "personal care",
    `3` = "both"
  ),
  mpgbhf = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbhft = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "domestic care",
    `2` = "personal care",
    `3` = "both"
  ),
  mpgbhmc = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbhmg = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbhmh = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbn = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbnbc = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbnbg = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbnbh = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbnt = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "domestic care",
    `2` = "personal care",
    `3` = "both"
  ),
  mpgbo = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbot = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "domestic care",
    `2` = "personal care",
    `3` = "both"
  ),
  mpgbotc = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbotg = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgboth = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbp = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbpc = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbpct = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "domestic care",
    `2` = "personal care",
    `3` = "both"
  ),
  mpgbpg = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbph = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbphc = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbphg = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbphh = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbpt = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "domestic care",
    `2` = "personal care",
    `3` = "both"
  ),
  mpgbrcc = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbrcg = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbrch = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbrlc = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbrlg = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mpgbrlh = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mppgbdn = c(
    `-2` = "no valid data",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mppgbfo = c(
    `-2` = "no valid data",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mppgbnf = c(
    `-2` = "no valid data",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mppgbot = c(
    `-2` = "no valid data",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mppgbpa = c(
    `-2` = "no valid data",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mppgbpc = c(
    `-2` = "no valid data",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mppgbph = c(
    `-2` = "no valid data",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mppgbrc = c(
    `-2` = "no valid data",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mppgbro = c(
    `-2` = "no valid data",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mppgbvo = c(
    `-2` = "no valid data",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mriooth = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  mrioyn = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "indication/application not yet finalized",
    `3` = "yes",
    `4` = "answer 2 + 3"
  ),
  mshstay = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    `2` = "yes, elderly home",
    `3` = "yes, nursing home, somatic",
    `4` = "yes, nursing home, psychogeriatric"
  ),
  murgyn = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")],
    `3` = "yes, very urgent"
  )
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    meldedn = .replace_labels(
    standardized_value_labels$meldedn,
    `1` = "day treatment",
    `2` = "night treatment"
  ),
    mnursdn = .replace_labels(
    standardized_value_labels$mnursdn,
    `1` = "day treatment",
    `2` = "night treatment"
  ),
    mrioyn = .replace_labels(
    standardized_value_labels$mrioyn,
    `2` = "no, but expect one soon"
  ),
    murgyn = .replace_labels(
    standardized_value_labels$murgyn,
    `2` = "yes, urgent"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    meldedn = c(`-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mitypc = .replace_labels(
    standardized_value_labels$mitypc,
    `2` = "care paid with pgb"
  ),
    mnursdn = c(`-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mpgbadm = .replace_labels(
    standardized_value_labels$mpgbadm,
    `1` = "R self"
  ),
    mrioyn = c(`-1` = "na, asked", `1` = "no", `2` = "no, but expect one soon", `3` = "yes"),
    murgyn = c(`-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    mitypc = .replace_labels(
    standardized_value_labels$mitypc,
    `1` = "home care service"
  ),
    mrioyn = c(`-1` = "na, asked", `1` = "no", `2` = "yes, not approved yet", `3` = "yes, approved"),
    murgyn = c(`-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    mcizyn = .replace_labels(
    standardized_value_labels$mcizyn,
    `4` = "yes, approved"
  ),
    mitypc = .replace_labels(
    standardized_value_labels$mitypc,
    `1` = "home care service"
  ),
    mpgbac = .replace_labels(
    standardized_value_labels$mpgbac,
    `-2` = "na, routing"
  ),
    mpgbao = .replace_labels(
    standardized_value_labels$mpgbao,
    `-2` = "na, routing"
  ),
    mpgbap = .replace_labels(
    standardized_value_labels$mpgbap,
    `-2` = "na, routing"
  ),
    mpgbaph = .replace_labels(
    standardized_value_labels$mpgbaph,
    `-2` = "na, routing"
  ),
    mpgbas = .replace_labels(
    standardized_value_labels$mpgbas,
    `-2` = "na, routing"
  ),
    murgyn = c(`-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    mi24ca = c(`-3` = "section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mi24cg = .replace_labels(
    standardized_value_labels$mi24cg,
    `-2` = "na, see IMI24CA"
  ),
    mi24cm = .replace_labels(
    standardized_value_labels$mi24cm,
    `-2` = "na, see IMI24CA"
  ),
    mi24crd = .replace_labels(
    standardized_value_labels$mi24crd,
    `-2` = "na, see IMI24CG"
  ),
    midaca = c(`-3` = "section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    midacg = .replace_labels(
    standardized_value_labels$midacg,
    `-2` = "na, see IMIDACA"
  ),
    midacm = .replace_labels(
    standardized_value_labels$midacm,
    `-2` = "na, see IMIDACA"
  ),
    midacrd = .replace_labels(
    standardized_value_labels$midacrd,
    `-2` = "na, see IMIDACG"
  ),
    miguia = c(`-3` = "section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    miguig = .replace_labels(
    standardized_value_labels$miguig,
    `-2` = "na, see IMIGUIA"
  ),
    miguim = .replace_labels(
    standardized_value_labels$miguim,
    `-2` = "na, see IMIGUIA"
  ),
    miguird = .replace_labels(
    standardized_value_labels$miguird,
    `-2` = "na, see IMIGUIG"
  ),
    mihada = c(`-3` = "section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mihadg = .replace_labels(
    standardized_value_labels$mihadg,
    `-2` = "na, see IMIHADA"
  ),
    mihadrd = .replace_labels(
    standardized_value_labels$mihadrd,
    `-2` = "na, see IMIHADG"
  ),
    mihhaa = c(`-3` = "section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mihhag = .replace_labels(
    standardized_value_labels$mihhag,
    `-2` = "na, see IMIHHAA"
  ),
    mihham = .replace_labels(
    standardized_value_labels$mihham,
    `-2` = "na, see IMIHHAA"
  ),
    mihhard = .replace_labels(
    standardized_value_labels$mihhard,
    `-2` = "na, see IMIHHAG"
  ),
    mintca = c(`-3` = "section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mintcg = .replace_labels(
    standardized_value_labels$mintcg,
    `-2` = "na, see IMINTCA"
  ),
    mintcm = .replace_labels(
    standardized_value_labels$mintcm,
    `-2` = "na, see IMINTCA"
  ),
    mintcrd = .replace_labels(
    standardized_value_labels$mintcrd,
    `-2` = "na, see IMINTCG"
  ),
    minura = c(`-3` = "section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    minurg = .replace_labels(
    standardized_value_labels$minurg,
    `-2` = "na, see IMINURA"
  ),
    minurm = .replace_labels(
    standardized_value_labels$minurm,
    `-2` = "na, see IMINURA"
  ),
    minurrd = .replace_labels(
    standardized_value_labels$minurrd,
    `-2` = "na, see IMINURG"
  ),
    miotha = c(`-3` = "section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    miothg = .replace_labels(
    standardized_value_labels$miothg,
    `-2` = "na, see IMIOTHA"
  ),
    miothm = .replace_labels(
    standardized_value_labels$miothm,
    `-2` = "na, see IMIOTHA"
  ),
    miothrd = .replace_labels(
    standardized_value_labels$miothrd,
    `-2` = "na, see IMIOTHG"
  ),
    mipca = c(`-3` = "section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mipcg = .replace_labels(
    standardized_value_labels$mipcg,
    `-2` = "na, see IMIPCA"
  ),
    mipcm = .replace_labels(
    standardized_value_labels$mipcm,
    `-2` = "na, see IMIPCA"
  ),
    mipcrd = .replace_labels(
    standardized_value_labels$mipcrd,
    `-2` = "na, see IMIPCG"
  ),
    missca = c(`-3` = "section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    misscd = .replace_labels(
    standardized_value_labels$misscd,
    `-2` = "na, see IMISSCA"
  ),
    misscg = .replace_labels(
    standardized_value_labels$misscg,
    `-2` = "na, see IMISSCA"
  ),
    misscrd = .replace_labels(
    standardized_value_labels$misscrd,
    `-2` = "na, see IMISSCG"
  ),
    mitraa = c(`-3` = "section not done", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mitrag = .replace_labels(
    standardized_value_labels$mitrag,
    `-2` = "na, see IMITRAA"
  ),
    mitrard = .replace_labels(
    standardized_value_labels$mitrard,
    `-2` = "na, see IMITRAG"
  ),
    mpgbac = c(`-2` = "na, see IMINDPGB", `0` = "not mentioned", `1` = "mentioned"),
    mpgbao = c(`-2` = "na, see IMINDPGB", `0` = "not mentioned", `1` = "mentioned"),
    mpgbap = c(`-2` = "na, see IMINDPGB", `0` = "not mentioned", `1` = "mentioned"),
    mpgbaph = c(`-2` = "na, see IMINDPGB", `0` = "not mentioned", `1` = "mentioned"),
    mpgbas = c(`-2` = "na, see IMINDPGB", `0` = "not mentioned", `1` = "mentioned"),
    mppgbdn = .replace_labels(
    standardized_value_labels$mppgbdn,
    `-2` = "na, see IMINDPGB"
  ),
    mppgbfo = .replace_labels(
    standardized_value_labels$mppgbfo,
    `-2` = "na, see IMINDPGB"
  ),
    mppgbnf = .replace_labels(
    standardized_value_labels$mppgbnf,
    `-2` = "na, see IMINDPGB"
  ),
    mppgbot = .replace_labels(
    standardized_value_labels$mppgbot,
    `-2` = "na, see IMINDPGB"
  ),
    mppgbpa = .replace_labels(
    standardized_value_labels$mppgbpa,
    `-2` = "na, see IMINDPGB"
  ),
    mppgbpc = .replace_labels(
    standardized_value_labels$mppgbpc,
    `-2` = "na, see IMINDPGB"
  ),
    mppgbph = .replace_labels(
    standardized_value_labels$mppgbph,
    `-2` = "na, see IMINDPGB"
  ),
    mppgbrc = .replace_labels(
    standardized_value_labels$mppgbrc,
    `-2` = "na, see IMINDPGB"
  ),
    mppgbro = .replace_labels(
    standardized_value_labels$mppgbro,
    `-2` = "na, see IMINDPGB"
  ),
    mppgbvo = .replace_labels(
    standardized_value_labels$mppgbvo,
    `-2` = "na, see IMINDPGB"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    mi24cg = .replace_labels(
    standardized_value_labels$mi24cg,
    `-2` = "na, see JMI24CA"
  ),
    mi24ch = .replace_labels(
    standardized_value_labels$mi24ch,
    `-2` = "na, see JMI24CA"
  ),
    mi24cm = .replace_labels(
    standardized_value_labels$mi24cm,
    `-2` = "na, see JMI24CA"
  ),
    mi24crd = .replace_labels(
    standardized_value_labels$mi24crd,
    `-2` = "na, see JMI24CG"
  ),
    mi24crw = .replace_labels(
    standardized_value_labels$mi24crw,
    `-2` = "na, see JMI24CG"
  ),
    midacg = .replace_labels(
    standardized_value_labels$midacg,
    `-2` = "na, see JMIDACA"
  ),
    midach = .replace_labels(
    standardized_value_labels$midach,
    `-2` = "na, see JMIDACA"
  ),
    midacm = .replace_labels(
    standardized_value_labels$midacm,
    `-2` = "na, see JMIDACA"
  ),
    midacrd = .replace_labels(
    standardized_value_labels$midacrd,
    `-2` = "na, see JMIDACG"
  ),
    midacrw = .replace_labels(
    standardized_value_labels$midacrw,
    `-2` = "na, see JMIDACG"
  ),
    miguig = .replace_labels(
    standardized_value_labels$miguig,
    `-2` = "na, see JMIGUIA"
  ),
    miguih = .replace_labels(
    standardized_value_labels$miguih,
    `-2` = "na, see JMIGUIA"
  ),
    miguim = .replace_labels(
    standardized_value_labels$miguim,
    `-2` = "na, see JMIGUIA"
  ),
    miguird = .replace_labels(
    standardized_value_labels$miguird,
    `-2` = "na, see JMIGUIG"
  ),
    miguirw = .replace_labels(
    standardized_value_labels$miguirw,
    `-2` = "na, see JMIGUIG"
  ),
    mihadg = .replace_labels(
    standardized_value_labels$mihadg,
    `-2` = "na, see JMIHADA"
  ),
    mihadrd = .replace_labels(
    standardized_value_labels$mihadrd,
    `-2` = "na, see JMIHADG"
  ),
    mihadrw = .replace_labels(
    standardized_value_labels$mihadrw,
    `-2` = "na, see JMIHADG"
  ),
    mihhag = .replace_labels(
    standardized_value_labels$mihhag,
    `-2` = "na, see JMIHHAA"
  ),
    mihhah = .replace_labels(
    standardized_value_labels$mihhah,
    `-2` = "na, see JMIHHAA"
  ),
    mihham = .replace_labels(
    standardized_value_labels$mihham,
    `-2` = "na, see JMIHHAA"
  ),
    mihhard = .replace_labels(
    standardized_value_labels$mihhard,
    `-2` = "na, see JMIHHAG"
  ),
    mihharw = .replace_labels(
    standardized_value_labels$mihharw,
    `-2` = "na, see JMIHHAG"
  ),
    mintcg = .replace_labels(
    standardized_value_labels$mintcg,
    `-2` = "na, see JMINTCA"
  ),
    mintch = .replace_labels(
    standardized_value_labels$mintch,
    `-2` = "na, see JMINTCA"
  ),
    mintcm = .replace_labels(
    standardized_value_labels$mintcm,
    `-2` = "na, see JMINTCA"
  ),
    mintcrd = .replace_labels(
    standardized_value_labels$mintcrd,
    `-2` = "na, see JMINTCG"
  ),
    mintcrw = .replace_labels(
    standardized_value_labels$mintcrw,
    `-2` = "na, see JMINTCG"
  ),
    minurg = .replace_labels(
    standardized_value_labels$minurg,
    `-2` = "na, see JMINURA"
  ),
    minurh = .replace_labels(
    standardized_value_labels$minurh,
    `-2` = "na, see JMINURA"
  ),
    minurm = .replace_labels(
    standardized_value_labels$minurm,
    `-2` = "na, see JMINURA"
  ),
    minurrd = .replace_labels(
    standardized_value_labels$minurrd,
    `-2` = "na, see JMINURG"
  ),
    minurrw = .replace_labels(
    standardized_value_labels$minurrw,
    `-2` = "na, see JMINURG"
  ),
    miothg = .replace_labels(
    standardized_value_labels$miothg,
    `-2` = "na, see JMIOTHA"
  ),
    miothh = .replace_labels(
    standardized_value_labels$miothh,
    `-2` = "na, see JMIOTHA"
  ),
    miothm = .replace_labels(
    standardized_value_labels$miothm,
    `-2` = "na, see JMIOTHA"
  ),
    miothrd = .replace_labels(
    standardized_value_labels$miothrd,
    `-2` = "na, see JMIOTHG"
  ),
    miothrw = .replace_labels(
    standardized_value_labels$miothrw,
    `-2` = "na, see JMIOTHG"
  ),
    mipcg = .replace_labels(
    standardized_value_labels$mipcg,
    `-2` = "na, see JMIPCA"
  ),
    mipch = .replace_labels(
    standardized_value_labels$mipch,
    `-2` = "na, see JMIPCA"
  ),
    mipcm = .replace_labels(
    standardized_value_labels$mipcm,
    `-2` = "na, see JMIPCA"
  ),
    mipcrd = .replace_labels(
    standardized_value_labels$mipcrd,
    `-2` = "na, see JMIPCG"
  ),
    mipcrw = .replace_labels(
    standardized_value_labels$mipcrw,
    `-2` = "na, see JMIPCG"
  ),
    misscd = .replace_labels(
    standardized_value_labels$misscd,
    `-2` = "na, see JMISSCA"
  ),
    misscg = .replace_labels(
    standardized_value_labels$misscg,
    `-2` = "na, see JMISSCA"
  ),
    misscrd = .replace_labels(
    standardized_value_labels$misscrd,
    `-2` = "na, see JMISSCG"
  ),
    misscrw = .replace_labels(
    standardized_value_labels$misscrw,
    `-2` = "na, see JMISSCG"
  ),
    mitrag = .replace_labels(
    standardized_value_labels$mitrag,
    `-2` = "na, see JMITRAA"
  ),
    mitrard = .replace_labels(
    standardized_value_labels$mitrard,
    `-2` = "na, see JMITRAG"
  ),
    mitrarw = .replace_labels(
    standardized_value_labels$mitrarw,
    `-2` = "na, see JMITRAG"
  ),
    mpgbac = c(`-2` = "na, see J/KMINDTYPE", `0` = "not mentioned", `1` = "mentioned"),
    mpgbao = c(`-2` = "na, see J/KMINDTYPE", `0` = "not mentioned", `1` = "mentioned"),
    mpgbap = c(`-2` = "na, see J/KMINDTYPE", `0` = "not mentioned", `1` = "mentioned"),
    mpgbaph = c(`-2` = "na, see J/KMINDTYPE", `0` = "not mentioned", `1` = "mentioned"),
    mpgbas = c(`-2` = "na, see J/KMINDTYPE", `0` = "not mentioned", `1` = "mentioned"),
    mppgbdn = .replace_labels(
    standardized_value_labels$mppgbdn,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbfo = .replace_labels(
    standardized_value_labels$mppgbfo,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbnf = .replace_labels(
    standardized_value_labels$mppgbnf,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbot = .replace_labels(
    standardized_value_labels$mppgbot,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbpa = .replace_labels(
    standardized_value_labels$mppgbpa,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbpc = .replace_labels(
    standardized_value_labels$mppgbpc,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbph = .replace_labels(
    standardized_value_labels$mppgbph,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbrc = .replace_labels(
    standardized_value_labels$mppgbrc,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbro = .replace_labels(
    standardized_value_labels$mppgbro,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbvo = .replace_labels(
    standardized_value_labels$mppgbvo,
    `-2` = "na, see J/KMINDTYPE"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    mi24cg = .replace_labels(
    standardized_value_labels$mi24cg,
    `-2` = "na, see KMI24CA"
  ),
    mi24crd = .replace_labels(
    standardized_value_labels$mi24crd,
    `-2` = "na, see KMI24CG"
  ),
    mi24crw = .replace_labels(
    standardized_value_labels$mi24crw,
    `-2` = "na, see KMI24CG"
  ),
    midacg = .replace_labels(
    standardized_value_labels$midacg,
    `-2` = "na, see KMIDACA"
  ),
    midach = .replace_labels(
    standardized_value_labels$midach,
    `-2` = "na, see KMIDACA"
  ),
    midacm = .replace_labels(
    standardized_value_labels$midacm,
    `-2` = "na, see KMIDACA"
  ),
    midacrd = .replace_labels(
    standardized_value_labels$midacrd,
    `-2` = "na, see KMIDACG"
  ),
    midacrw = .replace_labels(
    standardized_value_labels$midacrw,
    `-2` = "na, see KMIDACG"
  ),
    miguig = .replace_labels(
    standardized_value_labels$miguig,
    `-2` = "na, see KMIGUIA"
  ),
    miguih = .replace_labels(
    standardized_value_labels$miguih,
    `-2` = "na, see KMIGUIA"
  ),
    miguim = .replace_labels(
    standardized_value_labels$miguim,
    `-2` = "na, see KMIGUIA"
  ),
    miguird = .replace_labels(
    standardized_value_labels$miguird,
    `-2` = "na, see KMIGUIG"
  ),
    miguirw = .replace_labels(
    standardized_value_labels$miguirw,
    `-2` = "na, see KMIGUIG"
  ),
    mihadg = .replace_labels(
    standardized_value_labels$mihadg,
    `-2` = "na, see KMIHADA"
  ),
    mihadrd = .replace_labels(
    standardized_value_labels$mihadrd,
    `-2` = "na, see KMIHADG"
  ),
    mihadrw = .replace_labels(
    standardized_value_labels$mihadrw,
    `-2` = "na, see KMIHADG"
  ),
    mihhag = .replace_labels(
    standardized_value_labels$mihhag,
    `-2` = "na, see KMIHHAA"
  ),
    mihhah = .replace_labels(
    standardized_value_labels$mihhah,
    `-2` = "na, see KMIHHAA"
  ),
    mihham = .replace_labels(
    standardized_value_labels$mihham,
    `-2` = "na, see KMIHHAA"
  ),
    mihhard = .replace_labels(
    standardized_value_labels$mihhard,
    `-2` = "na, see KMIHHAG"
  ),
    mihharw = .replace_labels(
    standardized_value_labels$mihharw,
    `-2` = "na, see KMIHHAG"
  ),
    mintcg = .replace_labels(
    standardized_value_labels$mintcg,
    `-2` = "na, see KMINTCA"
  ),
    mintcn = .replace_labels(
    standardized_value_labels$mintcn,
    `-2` = "na, see KMINTCA"
  ),
    mintcrd = .replace_labels(
    standardized_value_labels$mintcrd,
    `-2` = "na, see KMINTCG"
  ),
    mintcrw = .replace_labels(
    standardized_value_labels$mintcrw,
    `-2` = "na, see KMINTCG"
  ),
    minurg = .replace_labels(
    standardized_value_labels$minurg,
    `-2` = "na, see KMINURA"
  ),
    minurh = .replace_labels(
    standardized_value_labels$minurh,
    `-2` = "na, see KMINURA"
  ),
    minurm = .replace_labels(
    standardized_value_labels$minurm,
    `-2` = "na, see KMINURA"
  ),
    minurrd = .replace_labels(
    standardized_value_labels$minurrd,
    `-2` = "na, see KMINURG"
  ),
    minurrw = .replace_labels(
    standardized_value_labels$minurrw,
    `-2` = "na, see KMINURG"
  ),
    miothg = .replace_labels(
    standardized_value_labels$miothg,
    `-2` = "na, see KMIOTHA"
  ),
    miothrd = .replace_labels(
    standardized_value_labels$miothrd,
    `-2` = "na, see KMIOTHG"
  ),
    miothrw = .replace_labels(
    standardized_value_labels$miothrw,
    `-2` = "na, see KMIOTHG"
  ),
    mipcg = .replace_labels(
    standardized_value_labels$mipcg,
    `-2` = "na, see KMIPCA"
  ),
    mipch = .replace_labels(
    standardized_value_labels$mipch,
    `-2` = "na, see KMIPCA"
  ),
    mipcm = .replace_labels(
    standardized_value_labels$mipcm,
    `-2` = "na, see KMIPCA"
  ),
    mipcrd = .replace_labels(
    standardized_value_labels$mipcrd,
    `-2` = "na, see KMIPCG"
  ),
    mipcrw = .replace_labels(
    standardized_value_labels$mipcrw,
    `-2` = "na, see KMIPCG"
  ),
    misscg = .replace_labels(
    standardized_value_labels$misscg,
    `-2` = "na, see KMISSCA"
  ),
    misscrd = .replace_labels(
    standardized_value_labels$misscrd,
    `-2` = "na, see KMISSCG"
  ),
    misscrw = .replace_labels(
    standardized_value_labels$misscrw,
    `-2` = "na, see KMISSCG"
  ),
    misshd = .replace_labels(
    standardized_value_labels$misshd,
    `-2` = "na, see KMISSCA"
  ),
    missn = .replace_labels(
    standardized_value_labels$missn,
    `-2` = "na, see KMISSCA"
  ),
    mitrag = .replace_labels(
    standardized_value_labels$mitrag,
    `-2` = "na, see KMITRAA"
  ),
    mitrard = .replace_labels(
    standardized_value_labels$mitrard,
    `-2` = "na, see KMITRAG"
  ),
    mitrarw = .replace_labels(
    standardized_value_labels$mitrarw,
    `-2` = "na, see KMITRAG"
  ),
    mpgbac = c(`-2` = "na, see J/KMINDTYPE", `0` = "not mentioned", `1` = "mentioned"),
    mpgbao = c(`-2` = "na, see J/KMINDTYPE", `0` = "not mentioned", `1` = "mentioned"),
    mpgbap = c(`-2` = "na, see J/KMINDTYPE", `0` = "not mentioned", `1` = "mentioned"),
    mpgbaph = c(`-2` = "na, see J/KMINDTYPE", `0` = "not mentioned", `1` = "mentioned"),
    mpgbas = c(`-2` = "na, see J/KMINDTYPE", `0` = "not mentioned", `1` = "mentioned"),
    mppgbdn = .replace_labels(
    standardized_value_labels$mppgbdn,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbfo = .replace_labels(
    standardized_value_labels$mppgbfo,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbnf = .replace_labels(
    standardized_value_labels$mppgbnf,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbot = .replace_labels(
    standardized_value_labels$mppgbot,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbpa = .replace_labels(
    standardized_value_labels$mppgbpa,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbpc = .replace_labels(
    standardized_value_labels$mppgbpc,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbph = .replace_labels(
    standardized_value_labels$mppgbph,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbrc = .replace_labels(
    standardized_value_labels$mppgbrc,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbro = .replace_labels(
    standardized_value_labels$mppgbro,
    `-2` = "na, see J/KMINDTYPE"
  ),
    mppgbvo = .replace_labels(
    standardized_value_labels$mppgbvo,
    `-2` = "na, see J/KMINDTYPE"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  madapt = "categorical",
  mappli = "categorical",
  mcizna = "categorical",
  mcizrd = "categorical",
  mcizyn = "categorical",
  mdistr = "categorical",
  mdistrh = "numeric",
  mdomeca = "categorical",
  mdomech = "numeric",
  mdtreat = "categorical",
  medntyp = "categorical",
  meldedn = "categorical",
  melderh = "numeric",
  melderl = "categorical",
  mhomeca = "categorical",
  mi24ca = "categorical",
  mi24cg = "categorical",
  mi24ch = "numeric",
  mi24cm = "numeric",
  mi24crd = "categorical",
  mi24crw = "categorical",
  midaca = "categorical",
  midacg = "categorical",
  midach = "numeric",
  midacm = "numeric",
  midacrd = "categorical",
  midacrw = "categorical",
  midn = "categorical",
  miguia = "categorical",
  miguig = "categorical",
  miguih = "numeric",
  miguim = "numeric",
  miguird = "categorical",
  miguirw = "categorical",
  mihada = "categorical",
  mihadg = "categorical",
  mihadrd = "categorical",
  mihadrw = "categorical",
  mihhaa = "categorical",
  mihhag = "categorical",
  mihhah = "numeric",
  mihham = "numeric",
  mihhard = "categorical",
  mihharw = "categorical",
  mindnat = "categorical",
  mindpgb = "categorical",
  mindtype = "categorical",
  mintca = "categorical",
  mintcc = "text",
  mintcg = "categorical",
  mintch = "numeric",
  mintcm = "numeric",
  mintcn = "numeric",
  mintcrd = "categorical",
  mintcrw = "categorical",
  minura = "categorical",
  minurg = "categorical",
  minurh = "numeric",
  minurm = "numeric",
  minurrd = "categorical",
  minurrw = "categorical",
  mioag = "categorical",
  mioagh = "numeric",
  miose = "categorical",
  mioseh = "numeric",
  miosg = "categorical",
  miosgh = "numeric",
  miotha = "categorical",
  miothg = "categorical",
  miothh = "numeric",
  miothm = "numeric",
  miothrd = "categorical",
  miothrw = "categorical",
  miotr = "categorical",
  miotrh = "numeric",
  mipca = "categorical",
  mipcg = "categorical",
  mipch = "numeric",
  mipcm = "numeric",
  mipcrd = "categorical",
  mipcrw = "categorical",
  missca = "categorical",
  misscd = "numeric",
  misscg = "categorical",
  misscrd = "categorical",
  misscrw = "categorical",
  misshd = "numeric",
  missn = "numeric",
  mistay = "categorical",
  mitraa = "categorical",
  mitrag = "categorical",
  mitrard = "categorical",
  mitrarw = "categorical",
  mitypc = "categorical",
  mlstay = "categorical",
  mmeal = "categorical",
  mmealn = "numeric",
  mndndep = "categorical",
  mndntyp = "categorical",
  mntreat = "categorical",
  mnurdep = "categorical",
  mnursdn = "categorical",
  mnursh = "numeric",
  mnursin = "categorical",
  mother = "categorical",
  motherh = "numeric",
  mpersca = "categorical",
  mpersch = "numeric",
  mpgbac = "categorical",
  mpgbadm = "categorical",
  mpgbao = "categorical",
  mpgbap = "categorical",
  mpgbaph = "categorical",
  mpgbas = "categorical",
  mpgbca = "categorical",
  mpgbcat = "categorical",
  mpgbchc = "categorical",
  mpgbchg = "categorical",
  mpgbchh = "categorical",
  mpgbdev = "categorical",
  mpgbf = "categorical",
  mpgbfa = "categorical",
  mpgbfat = "categorical",
  mpgbfrc = "categorical",
  mpgbfrg = "categorical",
  mpgbfrh = "categorical",
  mpgbft = "categorical",
  mpgbhc = "categorical",
  mpgbhcc = "categorical",
  mpgbhcg = "categorical",
  mpgbhch = "categorical",
  mpgbhct = "categorical",
  mpgbhf = "categorical",
  mpgbhft = "categorical",
  mpgbhmc = "categorical",
  mpgbhmg = "categorical",
  mpgbhmh = "categorical",
  mpgbn = "categorical",
  mpgbnbc = "categorical",
  mpgbnbg = "categorical",
  mpgbnbh = "categorical",
  mpgbnt = "categorical",
  mpgbo = "categorical",
  mpgbot = "categorical",
  mpgbotc = "categorical",
  mpgbotg = "categorical",
  mpgboth = "categorical",
  mpgbp = "categorical",
  mpgbpc = "categorical",
  mpgbpct = "categorical",
  mpgbpg = "categorical",
  mpgbph = "categorical",
  mpgbphc = "categorical",
  mpgbphg = "categorical",
  mpgbphh = "categorical",
  mpgbpt = "categorical",
  mpgbrcc = "categorical",
  mpgbrcg = "categorical",
  mpgbrch = "categorical",
  mpgbrlc = "categorical",
  mpgbrlg = "categorical",
  mpgbrlh = "categorical",
  mppgbdn = "categorical",
  mppgbfo = "categorical",
  mppgbnf = "categorical",
  mppgbot = "categorical",
  mppgbpa = "categorical",
  mppgbpc = "categorical",
  mppgbph = "categorical",
  mppgbrc = "categorical",
  mppgbro = "categorical",
  mppgbvo = "categorical",
  mriooth = "categorical",
  mrioyn = "categorical",
  mshstay = "categorical",
  murgyn = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "189", waves = .lasa_wave_rows()) |>
    .override_label(wave = "I", variable = "misscd", override_value = "imisscm"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "189", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "189", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "189", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["mintcc"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)

.lasa_fc_189 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

