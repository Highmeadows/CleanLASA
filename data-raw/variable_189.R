## LASA filecode 189 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  murgyn = "Urgent indication",
  .applies_to_waves = c("Z")
)

variable_labels(
  "madapt", "mappli", "meldedn", "melderl", "mmeal", "mnurdep", "mnursdn", "mnursin", "mriooth", "murgyn",
  .applies_to_waves = c("E", "F")
)

variable_labels(
  "mdomeca", "mhomeca",
  .applies_to_waves = c("E")
)

variable_labels(
  "medntyp", "midn", "mioag", "miose", "miosg", "miotr", "mistay", "mndndep", "mndntyp", "mpersca", "mpgbca", "mpgbcat", "mpgbf", "mpgbfa", "mpgbfat", "mpgbft", "mpgbhc", "mpgbhct", "mpgbhf", "mpgbhft", "mpgbn", "mpgbnt", "mpgbo", "mpgbot", "mpgbp", "mpgbpc", "mpgbpct", "mpgbpt",
  .applies_to_waves = c("F")
)

variable_labels(
  "mdtreat", "mlstay", "mntreat", "mother", "mpgbchc", "mpgbchg", "mpgbchh", "mpgbdev", "mpgbfrc", "mpgbfrg", "mpgbfrh", "mpgbhcc", "mpgbhcg", "mpgbhch", "mpgbhmc", "mpgbhmg", "mpgbhmh", "mpgbnbc", "mpgbnbg", "mpgbnbh", "mpgbotc", "mpgbotg", "mpgboth", "mpgbpg", "mpgbph", "mpgbphc", "mpgbphg", "mpgbphh", "mpgbrcc", "mpgbrcg", "mpgbrch", "mpgbrlc", "mpgbrlg", "mpgbrlh", "mshstay",
  .applies_to_waves = c("G", "H")
)

variable_labels(
  "mcizna", "mcizrd", "mcizyn", "mpgbac", "mpgbao", "mpgbap", "mpgbaph", "mpgbas",
  .applies_to_waves = c("H")
)

variable_labels(
  "mi24ca", "mi24cg", "mi24crd", "midaca", "midacg", "midacm", "midacrd", "miguia", "miguig", "miguim", "miguird", "mihada", "mihadg", "mihadrd", "mihhaa", "mihhag", "mihham", "mihhard", "mintca", "mintcg", "mintcrd", "minura", "minurg", "minurm", "minurrd", "miotha", "miothg", "miothrd", "mipca", "mipcg", "mipcm", "mipcrd", "missca", "misscg", "misscrd", "mitraa", "mitrag", "mitrard", "mppgbdn", "mppgbfo", "mppgbnf", "mppgbot", "mppgbpa", "mppgbpc", "mppgbph", "mppgbrc", "mppgbro", "mppgbvo",
  .applies_to_waves = c("I", "J", "K")
)

variable_labels(
  "mi24cm", "mintcm", "miothm", "misscd",
  .applies_to_waves = c("I", "J")
)

variable_labels(
  "mindnat", "mindpgb",
  .applies_to_waves = c("I")
)

variable_labels(
  "mi24ch", "mintch", "miothh",
  .applies_to_waves = c("J")
)

variable_labels(
  "mi24crw", "midach", "midacrw", "miguih", "miguirw", "mihadrw", "mihhah", "mihharw", "mindtype", "mintcrw", "minurh", "minurrw", "miothrw", "mipch", "mipcrw", "misscrw", "mitrarw",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  "mintcc", "mintcn", "misshd", "missn",
  .applies_to_waves = c("K")
)

variable_labels(
  mdistr = "Indication for district nurse",
  mdistrh = "District nurse: # hours/week",
  mdomech = "Domestic tasks: # hours/week",
  melderh = "Home for the elderly: # hours/week",
  mnursh = "Nursing home: # hours/week",
  mpersca = "Home care: personal care",
  .applies_to_waves = c("E")
)

variable_labels(
  mmealn = "# meals per week",
  mpersch = "Personal care: # hours/week",
  mrioyn = "Indication (on medical grounds)",
  .applies_to_waves = c("E", "F")
)

variable_labels(
  mdistr = "Indication for nursing",
  mdistrh = "nursing: # hours/week",
  mdomeca = "Indication for domestic care",
  mdomech = "Domestic care: # hours/week",
  mioagh = "Other ind.: activating guidance: # hours/week",
  mioseh = "Other ind.: something else: # hours/week",
  miosgh = "Other ind.: supporting guidance: # hours/week",
  miotrh = "Other ind.: treatment: # hours/week",
  mitypc = "Indication: type of care",
  .applies_to_waves = c("F")
)

variable_labels(
  mpgbadm = "PGB: administration",
  .applies_to_waves = c("F", "G")
)

variable_labels(
  mdistr = "indication for nursing",
  mdistrh = "nursing: # hrs per week",
  mitypc = "home care services or PGB",
  motherh = "other care: # hrs per week",
  mpersca = "indication personal care",
  mpersch = "personal care: # hrs per week",
  mpgbpc = "PGB: partner personal care",
  murgyn = "urgent indication",
  .applies_to_waves = c("G", "H")
)

variable_labels(
  mrioyn = "Applied for Indication",
  .applies_to_waves = c("G")
)

variable_labels(
  mpgbac = "PGB: administration: child(ren)",
  mpgbao = "PGB: administration: other",
  mpgbap = "PGB: administration: partner",
  mpgbaph = "PGB: administration: private help",
  mpgbas = "PGB: administration: self",
  .applies_to_waves = c("I", "J", "K")
)

# define value labels ----
value_labels(
  `-2` = "no valid data",
  .applies_to_vars = c("mi24cg", "mi24ch", "mi24cm", "mi24crd", "mi24crw", "midacg", "midach", "midacm", "midacrd", "midacrw", "miguig", "miguih", "miguim", "miguird", "miguirw", "mihadg", "mihadrd", "mihadrw", "mihhag", "mihhah", "mihham", "mihhard", "mihharw", "mintcg", "mintch", "mintcm", "mintcn", "mintcrd", "mintcrw", "minurg", "minurh", "minurm", "minurrd", "minurrw", "miothg", "miothh", "miothm", "miothrd", "miothrw", "mipcg", "mipch", "mipcm", "mipcrd", "mipcrw", "misscd", "misscg", "misscrd", "misscrw", "misshd", "missn", "mitrag", "mitrard", "mitrarw", "mppgbdn", "mppgbfo", "mppgbnf", "mppgbot", "mppgbpa", "mppgbpc", "mppgbph", "mppgbrc", "mppgbro", "mppgbvo"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("madapt", "mappli", "mdomeca", "melderl", "mmeal", "mnursin", "mriooth"),
  .applies_to_waves = c("Z", "E", "F")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "not needed", `2` = "prefer self-regulation", `3` = "did not know", `4` = "do not dare/not able", `5` = "other reason",
  .applies_to_vars = c("mcizna"),
  .applies_to_waves = c("Z", "H")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "must rely on informal network", `2` = "need for help not strong enough", `3` = "other reason",
  .applies_to_vars = c("mcizrd"),
  .applies_to_waves = c("Z", "H")
)

value_labels(
  `-5` = "section not done", `1` = "no", `2` = "yes, declined", `3` = "yes, not approved yet", `4` = "yes",
  .applies_to_vars = c("mcizyn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mdistr", "mpersca"),
  .applies_to_waves = c("Z", "E", "F", "G", "H")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked",
  .applies_to_vars = c("mdistrh", "mpersch"),
  .applies_to_waves = c("Z", "E", "F", "G", "H")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked",
  .applies_to_vars = c("mdomech", "mmealn"),
  .applies_to_waves = c("Z", "E", "F")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "no", `2` = "yes, elderly home", `3` = "yes, nursing home, somatic", `4` = "yes, nursing home, psychogeriatric",
  .applies_to_vars = c("mdtreat", "mlstay", "mntreat", "mshstay"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both",
  .applies_to_vars = c("medntyp", "mndntyp"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "both",
  .applies_to_vars = c("meldedn", "mnursdn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked",
  .applies_to_vars = c("melderh", "mnursh"),
  .applies_to_waves = c("Z", "E")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mhomeca"),
  .applies_to_waves = c("Z", "E")
)

value_labels(
  `-3` = "section not done", `-2` = "na, no contact about services", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mi24ca", "midaca", "miguia", "mihada", "mihhaa", "mintca", "minura", "miotha", "mipca", "missca", "mitraa"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mi24cg", "midacg", "miguig", "mihadg", "mihhag", "mintcg", "minurg", "miothg", "mipcg", "misscg", "mitrag"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mi24ch", "mi24cm", "midach", "midacm", "miguih", "miguim", "mihhah", "mihham", "mintch", "mintcm", "mintcn", "minurh", "minurm", "miothh", "miothm", "mipch", "mipcm", "misscd", "misshd", "missn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mi24crd", "mi24crw", "midacrd", "midacrw", "miguird", "miguirw", "mihadrd", "mihadrw", "mihhard", "mihharw", "mintcrd", "mintcrw", "minurrd", "minurrw", "miothrd", "miothrw", "mipcrd", "mipcrw", "misscrd", "misscrw", "mitrard", "mitrarw"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("midn", "mioag", "miose", "miosg", "miotr", "mistay"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-3` = "section not done", `-2` = "na, no contact about services", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mindnat", "mindpgb"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `-3` = "section not done", `-2` = "na, no contact about services", `-1` = "na, asked", `1` = "in kind", `2` = "Personal budget (PGB)", `3` = "both",
  .applies_to_vars = c("mindtype"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked",
  .applies_to_vars = c("mioagh", "mioseh", "miosgh", "miotrh"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "care paid by org", `2` = "PGB",
  .applies_to_vars = c("mitypc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "somatic", `2` = "psychogeriatric",
  .applies_to_vars = c("mndndep"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "somatic", `2` = "psychogeriatric",
  .applies_to_vars = c("mnurdep"),
  .applies_to_waves = c("Z", "E", "F")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mother", "mpgbdev"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked",
  .applies_to_vars = c("motherh"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `-2` = "not applicable based on routing/PGB indication status", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mpgbac", "mpgbao", "mpgbap", "mpgbaph", "mpgbas"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "respondent", `2` = "spouse", `3` = "child(ren)", `4` = "private help", `5` = "other",
  .applies_to_vars = c("mpgbadm"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mpgbca", "mpgbf", "mpgbfa", "mpgbhc", "mpgbhf", "mpgbn", "mpgbo", "mpgbp"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "domestic care", `2` = "personal care", `3` = "both",
  .applies_to_vars = c("mpgbcat", "mpgbfat", "mpgbft", "mpgbhct", "mpgbhft", "mpgbnt", "mpgbot", "mpgbpct", "mpgbpt"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mpgbchc", "mpgbchg", "mpgbchh", "mpgbfrc", "mpgbfrg", "mpgbfrh", "mpgbhcc", "mpgbhcg", "mpgbhch", "mpgbhmc", "mpgbhmg", "mpgbhmh", "mpgbnbc", "mpgbnbg", "mpgbnbh", "mpgbotc", "mpgbotg", "mpgboth", "mpgbpg", "mpgbph", "mpgbphc", "mpgbphg", "mpgbphh", "mpgbrcc", "mpgbrcg", "mpgbrch", "mpgbrlc", "mpgbrlg", "mpgbrlh"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mpgbpc"),
  .applies_to_waves = c("Z", "F", "G", "H")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mppgbdn", "mppgbfo", "mppgbnf", "mppgbot", "mppgbpa", "mppgbpc", "mppgbph", "mppgbrc", "mppgbro", "mppgbvo"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "indication/application not yet finalized", `3` = "yes", `4` = "answer 2 + 3",
  .applies_to_vars = c("mrioyn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "yes, very urgent",
  .applies_to_vars = c("murgyn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "day treatment", `2` = "night treatment", `3` = "both",
  .applies_to_vars = c("meldedn", "mnursdn"),
  .applies_to_waves = c("E")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "no, but expect one soon", `3` = "yes", `4` = "answer 2 + 3",
  .applies_to_vars = c("mrioyn"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "no", `2` = "yes, urgent", `3` = "yes, very urgent",
  .applies_to_vars = c("murgyn"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("meldedn", "mnursdn"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "care paid by org", `2` = "care paid with pgb",
  .applies_to_vars = c("mitypc"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "R self", `2` = "spouse", `3` = "child(ren)", `4` = "private help", `5` = "other",
  .applies_to_vars = c("mpgbadm"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "no, but expect one soon", `3` = "yes",
  .applies_to_vars = c("mrioyn"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("murgyn"),
  .applies_to_waves = c("F", "G", "H")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "home care service", `2` = "PGB",
  .applies_to_vars = c("mitypc"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes, not approved yet", `3` = "yes, approved",
  .applies_to_vars = c("mrioyn"),
  .applies_to_waves = c("G")
)

value_labels(
  `-5` = "section not done", `1` = "no", `2` = "yes, declined", `3` = "yes, not approved yet", `4` = "yes, approved",
  .applies_to_vars = c("mcizyn"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, routing", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mpgbac", "mpgbao", "mpgbap", "mpgbaph", "mpgbas"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see IMINDPGB",
  .applies_to_vars = c("mpgbac", "mpgbao", "mpgbap", "mpgbaph", "mpgbas", "mppgbdn", "mppgbfo", "mppgbnf", "mppgbot", "mppgbpa", "mppgbpc", "mppgbph", "mppgbrc", "mppgbro", "mppgbvo"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "section not done", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mi24ca", "midaca", "miguia", "mihada", "mihhaa", "mintca", "minura", "miotha", "mipca", "missca", "mitraa"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMI24CA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mi24cg"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMI24CA", `-1` = "na, asked",
  .applies_to_vars = c("mi24cm"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMI24CG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mi24crd"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIDACA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("midacg"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIDACA", `-1` = "na, asked",
  .applies_to_vars = c("midacm"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIDACG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("midacrd"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIGUIA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("miguig"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIGUIA", `-1` = "na, asked",
  .applies_to_vars = c("miguim"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIGUIG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("miguird"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIHADA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mihadg"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIHADG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mihadrd"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIHHAA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mihhag"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIHHAA", `-1` = "na, asked",
  .applies_to_vars = c("mihham"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIHHAG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mihhard"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMINTCA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mintcg"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMINTCA", `-1` = "na, asked",
  .applies_to_vars = c("mintcm"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMINTCG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mintcrd"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMINURA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("minurg"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMINURA", `-1` = "na, asked",
  .applies_to_vars = c("minurm"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMINURG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("minurrd"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIOTHA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("miothg"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIOTHA", `-1` = "na, asked",
  .applies_to_vars = c("miothm"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIOTHG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("miothrd"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIPCA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mipcg"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIPCA", `-1` = "na, asked",
  .applies_to_vars = c("mipcm"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMIPCG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mipcrd"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMISSCA", `-1` = "na, asked",
  .applies_to_vars = c("misscd"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMISSCA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("misscg"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMISSCG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("misscrd"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMITRAA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mitrag"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMITRAG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mitrard"),
  .applies_to_waves = c("I")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mpgbac", "mpgbao", "mpgbap", "mpgbaph", "mpgbas"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see J/KMINDTYPE",
  .applies_to_vars = c("mpgbac", "mpgbao", "mpgbap", "mpgbaph", "mpgbas", "mppgbdn", "mppgbfo", "mppgbnf", "mppgbot", "mppgbpa", "mppgbpc", "mppgbph", "mppgbrc", "mppgbro", "mppgbvo"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-2` = "na, see JMI24CA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mi24cg"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMI24CA", `-1` = "na, asked",
  .applies_to_vars = c("mi24ch", "mi24cm"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMI24CG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mi24crd", "mi24crw"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIDACA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("midacg"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIDACA", `-1` = "na, asked",
  .applies_to_vars = c("midach", "midacm"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIDACG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("midacrd", "midacrw"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIGUIA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("miguig"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIGUIA", `-1` = "na, asked",
  .applies_to_vars = c("miguih", "miguim"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIGUIG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("miguird", "miguirw"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIHADA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mihadg"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIHADG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mihadrd", "mihadrw"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIHHAA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mihhag"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIHHAA", `-1` = "na, asked",
  .applies_to_vars = c("mihhah", "mihham"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIHHAG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mihhard", "mihharw"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMINTCA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mintcg"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMINTCA", `-1` = "na, asked",
  .applies_to_vars = c("mintch", "mintcm"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMINTCG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mintcrd", "mintcrw"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMINURA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("minurg"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMINURA", `-1` = "na, asked",
  .applies_to_vars = c("minurh", "minurm"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMINURG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("minurrd", "minurrw"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIOTHA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("miothg"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIOTHA", `-1` = "na, asked",
  .applies_to_vars = c("miothh", "miothm"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIOTHG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("miothrd", "miothrw"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIPCA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mipcg"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIPCA", `-1` = "na, asked",
  .applies_to_vars = c("mipch", "mipcm"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMIPCG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mipcrd", "mipcrw"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMISSCA", `-1` = "na, asked",
  .applies_to_vars = c("misscd"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMISSCA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("misscg"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMISSCG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("misscrd", "misscrw"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMITRAA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mitrag"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMITRAG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mitrard", "mitrarw"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see KMI24CA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mi24cg"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMI24CG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mi24crd", "mi24crw"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIDACA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("midacg"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIDACA", `-1` = "na, asked",
  .applies_to_vars = c("midach", "midacm"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIDACG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("midacrd", "midacrw"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIGUIA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("miguig"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIGUIA", `-1` = "na, asked",
  .applies_to_vars = c("miguih", "miguim"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIGUIG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("miguird", "miguirw"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIHADA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mihadg"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIHADG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mihadrd", "mihadrw"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIHHAA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mihhag"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIHHAA", `-1` = "na, asked",
  .applies_to_vars = c("mihhah", "mihham"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIHHAG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mihhard", "mihharw"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMINTCA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mintcg"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMINTCA", `-1` = "na, asked",
  .applies_to_vars = c("mintcn"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMINTCG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mintcrd", "mintcrw"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMINURA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("minurg"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMINURA", `-1` = "na, asked",
  .applies_to_vars = c("minurh", "minurm"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMINURG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("minurrd", "minurrw"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIOTHA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("miothg"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIOTHG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("miothrd", "miothrw"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIPCA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mipcg"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIPCA", `-1` = "na, asked",
  .applies_to_vars = c("mipch", "mipcm"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMIPCG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mipcrd", "mipcrw"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMISSCA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("misscg"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMISSCG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("misscrd", "misscrw"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMISSCA", `-1` = "na, asked",
  .applies_to_vars = c("misshd", "missn"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMITRAA", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "under consideration", `4` = "withdrawn",
  .applies_to_vars = c("mitrag"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMITRAG", `-1` = "na, asked", `1` = "informal network should help", `2` = "need for care is not serious enough", `3` = "other",
  .applies_to_vars = c("mitrard", "mitrarw"),
  .applies_to_waves = c("K")
)

.lasa_fc_189 <- .lasa_finalize_fc("189")
.lasa_fc_189$variables <- .lasa_fc_189$variables |>
  .override_label(wave = "I", variable = "misscd", override_value = "imisscm")

