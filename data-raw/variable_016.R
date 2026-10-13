## LASA filecode 016 -- variable names, variable labels, value labels,
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
  abstot = "numeric",
  abswd = "numeric",
  cjclass = "categorical",
  cjlevel = "categorical",
  cjpresi = "numeric",
  cjsbc = "numeric",
  cjsbc92 = "categorical",
  cjtype = "categorical",
  disabl = "categorical",
  disablp = "numeric",
  employ = "categorical",
  eretfin = "categorical",
  flclass = "categorical",
  fllevel = "categorical",
  flpresi = "numeric",
  flsbc92 = "categorical",
  fltype = "categorical",
  fretage = "numeric",
  healthp = "categorical",
  jlstam = "date",
  jlstay = "date",
  job1 = "categorical",
  job3 = "categorical",
  job3a = "categorical",
  job4 = "categorical",
  job5 = "numeric",
  job5a = "categorical",
  job5b = "categorical",
  job6 = "numeric",
  job6c = "numeric",
  job6r = "numeric",
  job7 = "categorical",
  job8 = "categorical",
  jobc = "categorical",
  jobl1 = "categorical",
  jobl3 = "categorical",
  jobl3a = "categorical",
  jobl4 = "categorical",
  jobl5 = "numeric",
  jobl5a = "categorical",
  jobl5b = "categorical",
  jobl6 = "numeric",
  jobl7 = "categorical",
  joblo1 = "categorical",
  joblo3 = "categorical",
  joblo4 = "categorical",
  joblo5 = "numeric",
  joblo6 = "numeric",
  joblo7 = "categorical",
  jobmon = "date",
  jobs = "categorical",
  jobstam = "date",
  jobstar01 = "categorical",
  jobstar02 = "categorical",
  jobstar03 = "categorical",
  jobstar04 = "categorical",
  jobstar05 = "categorical",
  jobstar06 = "categorical",
  jobstar07 = "categorical",
  jobstar08 = "categorical",
  jobstar09 = "categorical",
  jobstay = "date",
  jobstom = "date",
  jobstoy = "date",
  jobyear = "date",
  kob1 = "categorical",
  ljclass = "categorical",
  ljlevel = "categorical",
  ljpresi = "numeric",
  ljsbc92 = "categorical",
  ljtype = "categorical",
  mability = "categorical",
  nretr = "categorical",
  nretr01 = "categorical",
  nretr02 = "categorical",
  nretr03 = "categorical",
  nretr04 = "categorical",
  nretr05 = "categorical",
  nretr06 = "categorical",
  pability = "categorical",
  pcclass = "categorical",
  pcjclass = "categorical",
  pcjlevel = "categorical",
  pcjsbc = "categorical",
  pcjtype = "categorical",
  pclevel = "categorical",
  pcpresi = "numeric",
  pcsbc = "numeric",
  pcsbc92 = "categorical",
  pctype = "categorical",
  pdisabl = "categorical",
  pdisabp = "numeric",
  pemploy = "categorical",
  peretfin = "categorical",
  pjdata = "categorical",
  pjlstam = "date",
  pjlstay = "date",
  pjob1 = "categorical",
  pjob3 = "categorical",
  pjob3a = "categorical",
  pjob4 = "categorical",
  pjob5 = "numeric",
  pjob5a = "categorical",
  pjob5b = "categorical",
  pjob6 = "numeric",
  pjob6c = "numeric",
  pjob6r = "numeric",
  pjob7 = "categorical",
  pjobc = "categorical",
  pjobl1 = "categorical",
  pjobl3 = "categorical",
  pjobl3a = "categorical",
  pjobl4 = "categorical",
  pjobl5 = "numeric",
  pjobl5a = "categorical",
  pjobl5b = "categorical",
  pjobl6 = "numeric",
  pjobl7 = "categorical",
  pjobs = "categorical",
  pjobstm = "date",
  pjobsty = "date",
  pjstam = "date",
  pjstay = "date",
  plclass = "categorical",
  pllevel = "categorical",
  plpresi = "numeric",
  plsbc = "numeric",
  plsbc92 = "categorical",
  pltype = "categorical",
  prefret = "categorical",
  pretage = "numeric",
  pretifu = "categorical",
  pretire = "categorical",
  pretivol = "categorical",
  pretreas = "categorical",
  pretreas01 = "categorical",
  pretreas02 = "categorical",
  pretreas03 = "categorical",
  pretreas04 = "categorical",
  pretreas05 = "categorical",
  pretreas06 = "categorical",
  pretreas07 = "categorical",
  pretreas08 = "categorical",
  pretreas09 = "categorical",
  pretreas10 = "categorical",
  pretreas11 = "categorical",
  pretreas12 = "categorical",
  pretreas13 = "categorical",
  retage = "numeric",
  retfin = "categorical",
  retifut = "categorical",
  retired = "categorical",
  retirf1 = "categorical",
  retirf2 = "categorical",
  retirf3 = "categorical",
  retirf4 = "categorical",
  retirf5 = "categorical",
  retirf6 = "categorical",
  retivol = "categorical",
  retnfr = "categorical",
  retnfr2 = "categorical",
  retreas = "categorical",
  retreas01 = "categorical",
  retreas02 = "categorical",
  retreas03 = "categorical",
  retreas04 = "categorical",
  retreas05 = "categorical",
  retreas06 = "categorical",
  retreas07 = "categorical",
  retreas08 = "categorical",
  retreas09 = "categorical",
  retreas10 = "categorical",
  retreas11 = "categorical",
  retreas12 = "categorical",
  retreas13 = "categorical",
  retyr = "categorical",
  retyr01 = "categorical",
  retyr02 = "categorical",
  retyr03 = "categorical",
  retyr04 = "categorical",
  retyr05 = "categorical",
  retyr06 = "categorical",
  retyr07 = "categorical",
  retyr08 = "categorical",
  retyr09 = "categorical",
  retyr10 = "categorical",
  rjobchange01 = "categorical",
  rjobchange02 = "categorical",
  rjobchange03 = "categorical",
  rjobchange04 = "categorical",
  rjobchange05 = "categorical",
  rjobchange06 = "categorical",
  rjobchange07 = "categorical",
  rjobchange08 = "categorical",
  rjobchange09 = "categorical",
  rjobchange10 = "categorical",
  rjobchange11 = "categorical",
  rjobchange12 = "categorical",
  rjobchange13 = "categorical",
  rlclass = "categorical",
  rllevel = "categorical",
  rlpresi = "numeric",
  rlsbc = "numeric",
  rlsbc92 = "categorical",
  rltype = "categorical",
  tasks = "categorical",
  wjobchange = "categorical",
  work65 = "categorical",
  workret = "categorical"
)

# define variable labels ----
variable_labels(
  abstot = "Absence: total number of times in past 12 months",
  abswd = "Absence: on working days in past 12 months",
  cjclass = "Current job: occupational class SBC92",
  cjlevel = "Current job: occupational skill-level SBC92",
  cjpresi = "Current job: occup prestige (Sixma & Ultee)",
  cjsbc = "Current job: standard classification occupation (SBC 2010)",
  cjsbc92 = "Current job: standard classification occupation",
  cjtype = "Current job: main type of skills in occupation",
  disabl = "Disability Insurance Act",
  disablp = "Disability Insurance Act: percentage",
  employ = "Employment office: registered",
  eretfin = "Early retirement if made financially possible",
  flclass = "Father: last job: occupational class SBC92",
  fllevel = "Father: last job: occupational skill-level SBC92",
  flpresi = "Father: last job: occupational prestige (Sixma & Ultee)",
  flsbc92 = "Father: last job: standard class. occupational",
  fltype = "Father: last job: main type of skills",
  fretage = "Preferred age at full retirement",
  healthp = "Present job: productivity influenced by health problem(s) past 7 days",
  jlstam = "Last job: start working: month",
  jlstay = "Last job: start working year",
  job1 = "Paid job at present",
  job3 = "Present job: type",
  job3a = "Present job: level work activities",
  job4 = "Present job: management",
  job5 = "Management number of people",
  job5a = "Present job: management: more than half of the time",
  job5b = "Present job: management: financial responsibility",
  job6 = "Present job: hours/week",
  job6c = "Present job: hours/week on contract",
  job6r = "Present job: hours/week in reality",
  job7 = "Present job: regularity",
  job8 = "Is present job longest job",
  jobc = "Paid job, changed (constructed)",
  jobl1 = "Paid job before (last)",
  jobl3 = "Last job: type",
  jobl3a = "Last job: level work activities",
  jobl4 = "Last job: management",
  jobl5 = "Last job: management: number of people",
  jobl5a = "Last job: management: more than half of the time",
  jobl5b = "Last job: management: financial responsibility",
  jobl6 = "Last job: hours/week",
  jobl7 = "Last job: regularity",
  joblo1 = "Paid Job before? (longest)",
  joblo3 = "Longest job: type",
  joblo4 = "Longest job: management",
  joblo5 = "Longest job: management number of of people",
  joblo6 = "Longest job: hours",
  joblo7 = "Longest job: regularity",
  jobmon = "Stopped working: month",
  jobs = "Present job: same job as in last interview",
  jobstam = "Present job: start working: month",
  jobstar01 = "Reason start new job: I need the income",
  jobstar02 = "Reason start new job: I enjoy this job",
  jobstar03 = "Reason start new job: I value contact with other people",
  jobstar04 = "Reason start new job: I want something to do",
  jobstar05 = "Reason start new job: other reason",
  jobstar06 = "Reason start new job: to stay active",
  jobstar07 = "Reason start new job: on request",
  jobstar08 = "Reason start new job: family related factors",
  jobstar09 = "Reason start new job: other work related factors",
  jobstay = "Present job: start working: year",
  jobstom = "Stopped working: month",
  jobstoy = "Stopped working: year",
  jobyear = "Stopped working: year",
  kob1 = "Paid job at present",
  ljclass = "Long. job: occupational class SBC92",
  ljlevel = "Long. job: occupational skill-level SBC92",
  ljpresi = "Long. job: occup prestige (Sixma & Ultee)",
  ljsbc92 = "Long. job: standard classification occupation",
  ljtype = "Long. job: main type of skills in occupation",
  mability = "Present job: ability to meet mental/psychological demands",
  nretr = "Reason for no early retirement",
  nretr01 = "Reason no early (full) retirement: sufficient challenges/fun in work",
  nretr02 = "Reason no early (full) retirement: maintain social contacts at work",
  nretr03 = "Reason no early (full) retirement: other pasttimes less pleasant than work",
  nretr04 = "Reason no early (full) retirement: work till retirement age (67y) financially favorable",
  nretr05 = "Reason no early (full) retirement: partner works as well",
  nretr06 = "Reason no early (full) retirement: loyalty towards employer/colleague",
  pability = "Present job: ability to meet physical demands",
  pcclass = "Partner: current job: occupational class SBC92",
  pcjclass = "Partner: current job: occupational class SBC 92",
  pcjlevel = "Partner: current job: occupational skill-level SBC 92",
  pcjsbc = "Partner: current job: standard classification occupation (SBC 2010)",
  pcjtype = "Partner: current job: main type of skills in occupation",
  pclevel = "Partner: current job: occupational skill-level SBC92",
  pcpresi = "Partner: current job: occupational prestige (Sixma & Ultee)",
  pcsbc = "Partner: current job: standard classification occupation (SBC 2010)",
  pcsbc92 = "Partner: current job: standard class. occupational",
  pctype = "Partner: current job: main type of skills",
  pdisabl = "Partner: disability insurance act",
  pdisabp = "Partner: disability insurance act: percentage",
  pemploy = "Partner: employment office: registered",
  peretfin = "Partial early retirement if made financially possible",
  pjdata = "Job data partner about current or former partner",
  pjlstam = "Partner: last job: start working: month",
  pjlstay = "Partner: last job: start working year",
  pjob1 = "Partner: paid job at present",
  pjob3 = "Partner: present job: type",
  pjob3a = "Partner: present job: level work activities",
  pjob4 = "Partner: present job: management",
  pjob5 = "Partner: present job: management: number of people",
  pjob5a = "Partner: present job: management: more than half of the time",
  pjob5b = "Partner: present job: management: financial responsibility",
  pjob6 = "Partner: present job: hours/week",
  pjob6c = "Partner: present job: hours/week on contract",
  pjob6r = "Partner: present job: hours/week in reality",
  pjob7 = "Partner: present job: regularity",
  pjobc = "Partner: paid job, changed",
  pjobl1 = "Partner: paid job before (last)",
  pjobl3 = "Partner: last job: type",
  pjobl3a = "Partner: last job: level work activities",
  pjobl4 = "Partner: last job: management",
  pjobl5 = "Partner: last job: management: number of people",
  pjobl5a = "Partner: last job: management: more than half of the time",
  pjobl5b = "Partner: last job: management: financial responsibility",
  pjobl6 = "Partner: last job: hours/week",
  pjobl7 = "Partner: last job: regularity",
  pjobs = "Partner: present job: same job as in last interview",
  pjobstm = "Last job: stopped working: month",
  pjobsty = "Partner: last job: stopped working: year",
  pjstam = "Partner: present job: start working: month",
  pjstay = "Partner: present job: start working: year",
  plclass = "Partner: last job: occupational class SBC92",
  pllevel = "Partner: last job: occupational skill-level SBC92",
  plpresi = "Partner: last job: occupational prestige (Sixma & Ultee)",
  plsbc = "Partner: last job: standard classification occupation (SBC 2010)",
  plsbc92 = "Partner: last job: standard class. occupational",
  pltype = "Partner: last job: main type of skills",
  prefret = "Preference for partial or full retirement",
  pretage = "Preferred age at partial retirement",
  pretifu = "Partner: future retirement: anticipation",
  pretire = "Partner: (partial) early retirement",
  pretivol = "Partial retirement voluntarily",
  pretreas = "Stopped working: reason partial early retirement",
  pretreas01 = "Stopped working: reason partial early retirement: reached AOW age (67y)",
  pretreas02 = "Stopped working: reason partial early retirement: stress/work pressure too high",
  pretreas03 = "Stopped working: reason partial early retirement: physically too heavy",
  pretreas04 = "Stopped working: reason partial early retirement: health problems too hindering",
  pretreas05 = "Stopped working: reason partial early retirement: no longer motivated",
  pretreas06 = "Stopped working: reason partial ealry retirement: more fun spend time private life",
  pretreas07 = "Stopped working: reason partial early retirement: provide informal care",
  pretreas08 = "Stopped working: reason partial early retirement: partner had retired",
  pretreas09 = "Stopped working: reason partial early retirement: financially no longer necessary",
  pretreas10 = "Stopped working: reason partial early retirement: future no longer possible",
  pretreas11 = "Stopped working: reason partial early retirement: reached retirement age",
  pretreas12 = "Stopped working: reason partial early retirement: financially favorable",
  pretreas13 = "Stopped working: reason partial early retirement: more time for activities outside of work",
  retage = "Preferred retirement age",
  retfin = "Current job: consider retirement (financial possible)",
  retifut = "Future retirement: anticipation",
  retired = "(Partial) early retirement",
  retirf1 = "Future retirement: now less working hours",
  retirf2 = "Future retirement: now more hobbies",
  retirf3 = "Future retirement: now volunteering work",
  retirf4 = "Future retirement: now administrative work",
  retirf5 = "Future retirement: now more holidays",
  retirf6 = "Future retirement: other specification",
  retivol = "(partial) early retirement voluntarily",
  retnfr = "Reason no full early retirement",
  retnfr2 = "Would be reason no full early retirement",
  retreas = "Stopped working: reason (partial) early retirement",
  retreas01 = "Stopped working: reason early retirement: reached AOW age (67y)",
  retreas02 = "Stopped working: reason early retirement: stress/work pressure too high",
  retreas03 = "Stopped working: reason early retirement: physically too heavy",
  retreas04 = "Stopped working: reason early retirement: health problems too hindering",
  retreas05 = "Stopped working: reason early retirement: no longer motivated",
  retreas06 = "Stopped working: reason early retirement: more fun spend time private life",
  retreas07 = "Stopped working: reason early retirement: provide informal care",
  retreas08 = "Stopped working: reason early retirement: partner had retired",
  retreas09 = "Stopped working: reason early retirement: financially no longer necessary",
  retreas10 = "Stopped working: reason early retirement: future no longer possible",
  retreas11 = "Stopped working: reason early retirement: reached retirement age",
  retreas12 = "Stopped working: reason early retirement: financially favorable",
  retreas13 = "Stopped working: reason early retirement: more time for activities outside of work",
  retyr = "Reason for (partial) early retirement",
  retyr01 = "Future: reason (partial) early retirement: stress/work pressure too high",
  retyr02 = "Future: reason (partial) early retirement: physically too heavy",
  retyr03 = "Future: reason (partial) early retirement: health problems too hindering",
  retyr04 = "Future: reason (partial) early retirement: no longer motivated",
  retyr05 = "Future: reason (partial) early retirement: more fun spend time private life",
  retyr06 = "Future: reason (partial) early retirement: future no longer possible",
  retyr07 = "Future: reason (partial) early retirement: more freedom/less obligations",
  retyr08 = "Future: reason (partial) early retirement: family circumstances",
  retyr09 = "Future: reason (partial) early retirement: partner is/will retiring",
  retyr10 = "Future: reason (partial) early retirement: traveling to/from work difficult",
  rjobchange01 = "Reason change job/tasks: better working hours",
  rjobchange02 = "Reason change job/tasks: better salary",
  rjobchange03 = "Reason change job/tasks: better employment conditions",
  rjobchange04 = "Reason change job/tasks: professional development/growth",
  rjobchange05 = "Reason change job/tasks: work related accident",
  rjobchange06 = "Reason change job/tasks: other health reasons",
  rjobchange07 = "Reason change job/tasks: better combination work and family tasks",
  rjobchange08 = "Reason change job/tasks: avoiding unemployment",
  rjobchange09 = "Reason change job/tasks: different occupation after retirement",
  rjobchange10 = "Reason change job/tasks: other reason",
  rjobchange11 = "Reason change job/tasks: other work related factors",
  rjobchange12 = "Reason change job/tasks: on request",
  rjobchange13 = "Reason change job/tasks: preparing for retirement",
  rlclass = "Last job: occupational class SBC92",
  rllevel = "Last job: occupational skill-level SBC92",
  rlpresi = "Last job: occupational prestige (Sixma & Ultee)",
  rlsbc = "Last job: standard classification occupation (SBC 2010)",
  rlsbc92 = "Last job: standard classification occupation",
  rltype = "Last job: main type of skills in occupation",
  tasks = "Present job: kind of tasks",
  wjobchange = "Who initiated the change in job/tasks",
  work65 = "Current job: practice until 65",
  workret = "Present job: practice until retirement age",
  .applies_to_waves = c("Z")
)

variable_labels(
  "disabl", "disablp", "employ", "job3", "job7", "retifut", "retired",
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H")
)

variable_labels(
  "joblo1", "joblo3", "joblo6", "joblo7", "jobmon", "jobyear",
  .applies_to_waves = c("B")
)

variable_labels(
  "job1",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "3B")
)

variable_labels(
  "job6", "jobc", "jobstom", "jobstoy",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H")
)

variable_labels(
  "retivol",
  .applies_to_waves = c("G", "3B", "MB", "I")
)

variable_labels(
  "job3a", "job5a", "job5b", "jobstam", "jobstay", "pcjclass", "pcjlevel", "pcjsbc", "pcjtype", "pjob1", "pjob3a", "pjob4", "pjob5a", "pjob5b", "pjob6", "retirf1", "retirf2", "retirf3", "retirf4", "retirf5", "retirf6",
  .applies_to_waves = c("H")
)

variable_labels(
  cjclass = "cur. job: occupational class SBC92",
  cjlevel = "cur. job: occupational skill-level SBC92",
  cjpresi = "cur. job: occup prestige (Sixma & Ultee)",
  cjsbc92 = "cur. job: standard classification occupation",
  cjtype = "cur. job: main type of skills in occupation",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

variable_labels(
  job1 = "paid job at present?",
  job4 = "Present job: management Yes/No",
  job5 = "Present job: management # of people",
  job6 = "Present job: hours",
  job8 = "Is present job longest job?",
  joblo4 = "Longest job: management Yes/No",
  joblo5 = "Longest job: management # of people",
  ljclass = "long. job: occupational class SBC92",
  ljlevel = "long. job: occupational skill-level SBC92",
  ljpresi = "long. job: occup prestige (Sixma & Ultee)",
  ljsbc92 = "long. job: standard classification occupation",
  ljtype = "long. job: main type of skills in occupation",
  retirf6 = "Fut. retirement: other",
  .applies_to_waves = c("B")
)

variable_labels(
  retirf1 = "Fut. retirement: now less working hours",
  retirf2 = "Fut. retirement: now more hobbies",
  retirf3 = "Fut. retirement: now volunteering work",
  retirf4 = "Fut. retirement: now administrative work",
  retirf5 = "Fut. retirement: now more holidays",
  .applies_to_waves = c("B", "C", "D", "E", "F", "G")
)

variable_labels(
  job4 = "present job: management Yes/No (constructed)",
  job5 = "Management # people",
  jobstam = "Start working: month",
  jobstay = "Start working: year",
  retirf6 = "Fut. retirement: other specification",
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

variable_labels(
  disabl = "disability insurance act",
  disablp = "disability insurance act: percentage",
  employ = "employment office: registered",
  pjob1 = "partner: paid job at present",
  .applies_to_waves = c("2B", "3B", "MB", "I", "J", "K")
)

variable_labels(
  flclass = "father: last job: occup. class SBC92",
  fllevel = "father: last job: occup. skill-level SBC92",
  flpresi = "father: last job: occup. prestige (Sixma & Ultee)",
  flsbc92 = "father: last job: standard class. occup.",
  fltype = "father: last job: main type of skills",
  job6 = "current job: hours/week",
  nretr = "cur. job: reason no early retirement",
  pcclass = "partner: cur. job: occup. class SBC92",
  pclevel = "partner: cur. job: occup. skill-level SBC92",
  pcpresi = "partner: cur. job: occup. prestige (Sixma & Ultee)",
  pcsbc92 = "partner: cur. job: standard class. occup.",
  pctype = "partner: cur. job: main type of skills",
  pjob6 = "partner: current job: hours/week",
  pjobstm = "partner: stopped working: month",
  pjobsty = "partner: stopped working: year",
  plclass = "partner: last job: occup. class SBC92",
  pllevel = "partner: last job: occup. skill-level SBC92",
  plpresi = "partner: last job: occup. prestige (Sixma & Ultee)",
  plsbc92 = "partner: last job: standard class. occup.",
  pltype = "partner: last job: main type of skills",
  pretifu = "partner: future retirement: anticipation",
  retfin = "cur. job: consider retirement (financial possible)",
  retifut = "future retirement: anticipation",
  retnfr = "cur. job: reason no full early retirement",
  retyr = "cur. job: reason (partial) early retirement",
  rlpresi = "last job: occup. prestige (Sixma & Ultee)",
  rlsbc92 = "last job: standard classification occupation",
  work65 = "cur. job: practise until 65",
  .applies_to_waves = c("2B")
)

variable_labels(
  job1 = "paid job at present",
  .applies_to_waves = c("2B", "MB", "I", "J")
)

variable_labels(
  jobl1 = "paid job before (last)",
  jobl6 = "last job: hours/week",
  pdisabl = "partner: disability insurance act",
  pdisabp = "partner: disability insurance act: percentage",
  pemploy = "partner: employment office: registered",
  pjobl1 = "partner: paid job before (last)",
  pjobl6 = "partner: last job: hours/week",
  .applies_to_waves = c("2B", "3B", "MB")
)

variable_labels(
  jobstom = "stopped working: month",
  jobstoy = "stopped working: year",
  .applies_to_waves = c("2B", "I", "J", "K")
)

variable_labels(
  pretire = "partner: (partial) early retirement",
  retreas = "stopped working: reason (partial) early retirement",
  rlclass = "last job: occupational class SBC92",
  rllevel = "last job: occupational skill-level SBC92",
  rltype = "last job: main type of skills in occupation",
  .applies_to_waves = c("2B", "3B")
)

variable_labels(
  retired = "(partial) early retirement",
  .applies_to_waves = c("2B", "3B", "MB", "I")
)

variable_labels(
  cjclass = "current job: occupational class SBC 92",
  cjlevel = "current job: occupational skill-level SBC 92",
  cjtype = "current job: occupational skill-level SBC 92",
  job5 = "Present job: management # people",
  pjob5 = "Partner: present job: management # people",
  retivol = "(partial) Early retirement voluntarily",
  .applies_to_waves = c("H")
)

variable_labels(
  cjsbc = "current job: standard classification occupation (SBC 2010)",
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

variable_labels(
  job4 = "present job: management",
  .applies_to_waves = c("H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  cjclass = "current job: occupational class SBC92",
  cjlevel = "current job: occupational skill-level SBC92",
  .applies_to_waves = c("3B", "I", "J")
)

variable_labels(
  cjtype = "current job: main type of skills in occupation",
  .applies_to_waves = c("3B", "I")
)

variable_labels(
  jlstam = "last job: start working: month",
  jlstay = "last job: start working year",
  jobl3 = "last job: type",
  jobl3a = "last job: level work activities",
  jobl4 = "last job: management",
  jobl5 = "last job: management: number of people",
  jobl5a = "last job: management: more than half of the time",
  jobl7 = "last job: regularity",
  jobstom = "last job: stopped working: month",
  jobstoy = "last job: stopped working: year",
  pjobl3 = "partner: last job: type",
  pjobl3a = "partner: last job: level work activities",
  pjobl4 = "partner: last job: management",
  pjobl5 = "partner: last job: management: number of people",
  pjobl5a = "partner: last job: management: more than half of the time",
  pjobl7 = "partner: last job: regularity",
  pjobstm = "last job: stopped working: month",
  pjobsty = "partner: last job: stopped working: year",
  .applies_to_waves = c("3B", "MB")
)

variable_labels(
  job3 = "present job: type",
  job3a = "present job: level work activities",
  job5 = "present job: management: number of people",
  job5a = "present job: management: more than half of the time",
  job7 = "present job: regularity",
  jobstam = "present job: start working: month",
  jobstay = "present job: start working: year",
  pjob3 = "partner: present job: type",
  pjob3a = "partner: present job: level work activities",
  pjob4 = "partner: present job: management",
  pjob5 = "partner: present job: management: number of people",
  pjob5a = "partner: present job: management: more than half of the time",
  pjob7 = "partner: present job: regularity",
  pjstam = "partner: present job: start working: month",
  pjstay = "partner: present job: start working: year",
  .applies_to_waves = c("3B", "MB", "I", "J", "K")
)

variable_labels(
  job5b = "present job: management: financial responsibility",
  pjob5b = "partner: present job: management: financial responsibility",
  .applies_to_waves = c("3B", "I", "J", "K")
)

variable_labels(
  job6 = "present job: hours/week",
  pjob6 = "partner: present job: hours/week",
  .applies_to_waves = c("3B", "MB", "I")
)

variable_labels(
  jobl5b = "last job: management: financial responsibility",
  nretr = "reason no early retirement",
  pcclass = "partner: current job: occupational class SBC92",
  pclevel = "partner: current job: occupational skill-level SBC92",
  pcsbc = "partner: current job: standard classification occupation (SBC 2010)",
  pctype = "partner: current job: main type of skills in occupation",
  pjdata = "job data partner about current or former partner",
  pjlstam = "partner: last job: start working: month",
  pjlstay = "partner: last job: start working year",
  pjobl5b = "partner: last job: management: financial responsibility",
  plclass = "partner: last job: occupational class SBC92",
  pllevel = "partner: last job: occupational skill-level SBC92",
  plsbc = "partner: last job: standard classification occupation (SBC 2010)",
  pltype = "partner: last job: main type of skills in occupation",
  retnfr = "reason no full early retirement",
  retnfr2 = "would be reason no full early retirement",
  rlsbc = "last job: standard classification occupation (SBC 2010)",
  work65 = "present job: practise until 65",
  .applies_to_waves = c("3B")
)

variable_labels(
  retyr = "future: reason (partial) early retirement",
  .applies_to_waves = c("3B", "J")
)

variable_labels(
  workret = "present job: practise until retirement age",
  .applies_to_waves = c("MB")
)

variable_labels(
  jobc = "paid job, changed",
  jobs = "present job: same job as in last interview",
  pcjsbc = "partner: current job: standard classification occupation (SBC 2010)",
  pjobc = "partner: paid job, changed",
  pjobs = "partner: present job: same job as in last interview",
  .applies_to_waves = c("I", "J", "K")
)

variable_labels(
  pcjclass = "partner: current job: occupational class SBC 92",
  pcjlevel = "partner: current job: occupational skill-level SBC 92",
  pcjtype = "partner: current job: main type of skills in occupation",
  workret = "present job: practise until retirement age (66y)",
  .applies_to_waves = c("I")
)

variable_labels(
  abstot = "absence: total number of times in past 12 months",
  abswd = "absence: on working days in past 12 months",
  eretfin = "early retirement if made financially possible",
  fretage = "preferred age at full retirement",
  healthp = "present job: productivity influenced by health problem(s) past 7 days",
  job6c = "present job: hours/week on contract",
  job6r = "present job: hours/week in reality",
  jobstar01 = "reason start new job: I need the income",
  jobstar02 = "reason start new job: I enjoy this job",
  jobstar03 = "reason start new job: I value contact with other people",
  jobstar04 = "reason start new job: I want something to do",
  jobstar05 = "reason start new job: other reason",
  jobstar06 = "reason start new job: to stay active",
  jobstar07 = "reason start new job: on request",
  jobstar08 = "reason start new job: family related factors",
  jobstar09 = "reason start new job: other work related factors",
  pability = "present job: ability to meet physical demands",
  peretfin = "partial early retirement if made financially possible",
  pjob6c = "partner: present job: hours/week on contract",
  pjob6r = "partner: present job: hours/week in reality",
  prefret = "preference for partial or full retirement",
  pretage = "preferred age at partial retirement",
  pretivol = "partial retirement voluntarily",
  retage = "preferred retirement age",
  retired = "(partial) retirement",
  retivol = "retirement voluntarily",
  rjobchange01 = "reason change job/tasks: better working hours",
  rjobchange02 = "reason change job/tasks: better salary",
  rjobchange03 = "reason change job/tasks: better employment conditions",
  rjobchange04 = "reason change job/tasks: professional development/growth",
  rjobchange05 = "reason change job/tasks: work related accident",
  rjobchange06 = "reason change job/tasks: other health reasons",
  rjobchange07 = "reason change job/tasks: better combination work and family tasks",
  rjobchange08 = "reason change job/tasks: avoiding unemployment",
  rjobchange09 = "reason change job/tasks: different occupation after retirement",
  rjobchange10 = "reason change job/tasks: other reason",
  rjobchange11 = "reason change job/tasks: other work related factors",
  rjobchange12 = "reason change job/tasks: on request",
  rjobchange13 = "reason change job/tasks: preparing for retirement",
  tasks = "present job: kind of tasks",
  wjobchange = "who initiated the change in job/tasks",
  workret = "present job: practice until retirement age (67y)",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  cjtype = "current job: main type of skills in occupation (SBC 92)",
  mability = "present job: ability to meet mental/pshychological demands",
  nretr = "future: reason no early (full) retirement",
  pcjclass = "partner: current job: occupational class (SBC 92)",
  pcjlevel = "partner: current job: occupational skill-level (SBC 92)",
  pcjtype = "partner: current job: main type of skills in occupation (SBC 92)",
  pretreas = "stopped working: reason partial early retirement",
  retreas = "stopped working: reason early retirement",
  .applies_to_waves = c("J")
)

variable_labels(
  kob1 = "paid job at present",
  mability = "present job: ability to meet mental/psychological demands",
  nretr01 = "reason no early (full) retirement: sufficient challenges/fun in work",
  nretr02 = "reason no early (full) retirement: maintain social contacts at work",
  nretr03 = "reason no early (full) retirement: other pasttimes less pleasant than work",
  nretr04 = "reason no early (full) retirement: work till retirement age (67y) financially favorable",
  nretr05 = "reason no early (full) retirement: partner works as well",
  nretr06 = "reason no early (full) retirement: loyalty towards employer/colleague",
  pretreas01 = "stopped working: reason partial early retirement: reached AOW age (67y)",
  pretreas02 = "stopped working: reason partial early retirement: stress/work pressure too high",
  pretreas03 = "stopped working: reason partial early retirement: physically too heavy",
  pretreas04 = "stopped working: reason partial early retirement: health problems too hindering",
  pretreas05 = "stopped working: reason partial early retirement: no longer motivated",
  pretreas06 = "stopped working: reason partial ealry retirement: more fun spend time private life",
  pretreas07 = "stopped working: reason partial early retirement: provide informal care",
  pretreas08 = "stopped working: reason partial early retirement: partner had retired",
  pretreas09 = "stopped working: reason partial early retirement: financially no longer necessary",
  pretreas10 = "stopped working: reason partial early retirement: future no longer possible",
  pretreas11 = "stopped working: reason partial early retirement: reached retirement age",
  pretreas12 = "stopped working: reason partial early retirement: financially favorable",
  pretreas13 = "stopped working: reason partial early retirement: more time for activities outside of work",
  retreas01 = "stopped working: reason early retirement: reached AOW age (67y)",
  retreas02 = "stopped working: reason early retirement: stress/work pressure too high",
  retreas03 = "stopped working: reason early retirement: physically too heavy",
  retreas04 = "stopped working: reason early retirement: health problems too hindering",
  retreas05 = "stopped working: reason early retirement: no longer motivated",
  retreas06 = "stopped working: reason early retirement: more fun spend time private life",
  retreas07 = "stopped working: reason early retirement: provide informal care",
  retreas08 = "stopped working: reason early retirement: partner had retired",
  retreas09 = "stopped working: reason early retirement: financially no longer necessary",
  retreas10 = "stopped working: reason early retirement: future no longer possible",
  retreas11 = "stopped working: reason early retirement: reached retirement age",
  retreas12 = "stopped working: reason early retirement: financially favorable",
  retreas13 = "stopped working: reason early retirement: more time for activities outside of work",
  retyr01 = "future: reason (partial) early retirement: stress/work pressure too high",
  retyr02 = "future: reason (partial) early retirement: physically too heavy",
  retyr03 = "future: reason (partial) early retirement: health problems too hindering",
  retyr04 = "future: reason (partial) early retirement: no longer motivated",
  retyr05 = "future: reason (partial) early retirement: more fun spend time private life",
  retyr06 = "future: reason (partial) early retirement: future no longer possible",
  retyr07 = "future: reason (partial) early retirement: more freedom/less obligations",
  retyr08 = "future: reason (partial) early retirement: family circumstances",
  retyr09 = "future: reason (partial) early retirement: partner is/will retiring",
  retyr10 = "future: reason (partial) early retirement: traveling to/from work difficult",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("abstot", "abswd", "cjclass", "cjlevel", "cjpresi", "cjsbc", "cjsbc92", "cjtype", "disabl", "disablp", "employ", "eretfin", "flclass", "fllevel", "flpresi", "fltype", "fretage", "healthp", "jlstam", "jlstay", "job3", "job3a", "job4", "job5", "job5a", "job5b", "job6", "job6c", "job6r", "job7", "job8", "jobc", "jobl1", "jobl3", "jobl3a", "jobl4", "jobl5", "jobl5a", "jobl5b", "jobl6", "jobl7", "joblo1", "joblo3", "joblo5", "joblo6", "joblo7", "jobmon", "jobs", "jobstam", "jobstar01", "jobstar02", "jobstar03", "jobstar04", "jobstar05", "jobstar06", "jobstar07", "jobstar08", "jobstar09", "jobstay", "jobstom", "jobstoy", "jobyear", "ljclass", "ljpresi", "ljtype", "mability", "nretr", "nretr01", "nretr02", "nretr03", "nretr04", "nretr05", "nretr06", "pability", "pcclass", "pcjclass", "pcjlevel", "pcjsbc", "pcjtype", "pclevel", "pcpresi", "pcsbc", "pcsbc92", "pctype", "pdisabl", "pdisabp", "pemploy", "peretfin", "pjlstam", "pjlstay", "pjob3", "pjob3a", "pjob4", "pjob5", "pjob5a", "pjob5b", "pjob6", "pjob6c", "pjob6r", "pjob7", "pjobc", "pjobl1", "pjobl3", "pjobl3a", "pjobl4", "pjobl5", "pjobl5a", "pjobl5b", "pjobl6", "pjobl7", "pjobs", "pjobstm", "pjobsty", "pjstam", "pjstay", "plclass", "pllevel", "plpresi", "plsbc", "plsbc92", "pltype", "prefret", "pretage", "pretifu", "pretire", "pretivol", "pretreas", "pretreas01", "pretreas02", "pretreas03", "pretreas04", "pretreas05", "pretreas06", "pretreas07", "pretreas08", "pretreas09", "pretreas10", "pretreas11", "pretreas12", "pretreas13", "retage", "retfin", "retifut", "retired", "retirf1", "retirf2", "retirf3", "retirf4", "retirf5", "retirf6", "retivol", "retnfr", "retnfr2", "retreas", "retreas01", "retreas02", "retreas03", "retreas04", "retreas05", "retreas06", "retreas07", "retreas08", "retreas09", "retreas10", "retreas11", "retreas12", "retreas13", "retyr", "retyr01", "retyr02", "retyr03", "retyr04", "retyr05", "retyr06", "retyr07", "retyr08", "retyr09", "retyr10", "rjobchange01", "rjobchange02", "rjobchange03", "rjobchange04", "rjobchange05", "rjobchange06", "rjobchange07", "rjobchange08", "rjobchange09", "rjobchange10", "rjobchange11", "rjobchange12", "rjobchange13", "rlclass", "rllevel", "rlpresi", "rlsbc", "rlsbc92", "rltype", "wjobchange", "work65", "workret"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("abstot", "abswd", "job6c", "job6r"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "not available", `0` = "-to be coded-", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("cjclass"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "not available", `0` = "-to be coded-", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("cjlevel"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "not available", `0` = "-to be coded-", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("cjpresi"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("cjsbc"),
  .applies_to_waves = c("Z", "H", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "not available", `0` = "-to be coded-",
  .applies_to_vars = c("cjsbc92"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "not available", `0` = "-to be coded-", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("cjtype"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, above age threshold", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes",
  .applies_to_vars = c("disabl", "employ"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "not available", `-1` = "not available",
  .applies_to_vars = c("disablp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("eretfin", "peretfin"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "unknown", `0` = "-to be coded-", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("flclass", "pcclass", "plclass", "rlclass"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "unknown", `0` = "-to be coded-", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("fllevel", "pclevel", "pllevel", "rllevel"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "unknown", `0` = "-to be coded-", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("flpresi", "pcpresi", "plpresi", "rlpresi"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, interview terminated", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "-to be coded-",
  .applies_to_vars = c("flsbc92"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "unknown", `0` = "-to be coded-", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("fltype", "pctype", "pltype", "rltype"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("fretage", "pretage", "retage"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no health problems/productivity not influenced by health problems", `10` = "not productive due to health problems",
  .applies_to_vars = c("healthp"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "january", `2` = "february", `3` = "march", `4` = "april", `5` = "may", `6` = "june", `7` = "july", `8` = "august", `9` = "september", `10` = "october", `11` = "november", `12` = "december",
  .applies_to_vars = c("jlstam", "jobstam", "jobstom", "pjlstam", "pjobstm", "pjstam"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("jlstay", "jobl5", "jobl6", "joblo6", "pcjsbc", "pcsbc", "pjlstay", "pjob5", "pjob6", "pjob6c", "pjob6r", "pjobl5", "pjobl6", "pjobsty", "pjstay", "plsbc", "rlsbc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, interview terminated", `-4` = "na, short interview", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "steady job", `2` = "temporary job with contract", `3` = "temporary job via employment agency", `4` = "self-employed", `5` = "free-lance basis", `6` = "family company", `7` = "other", `8` = "0-hours/stand-by contract",
  .applies_to_vars = c("job3"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("job3a"),
  .applies_to_waves = c("Z", "H", "J", "K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes",
  .applies_to_vars = c("job4", "retifut"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `98` = "NA",
  .applies_to_vars = c("job5", "joblo5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job5a", "job5b", "jobl1", "jobl4", "jobl5a", "jobl5b", "pdisabl", "pemploy", "pjob4", "pjob5a", "pjob5b", "pjobl1", "pjobl4", "pjobl5a", "pjobl5b", "pretifu", "retfin"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("job6", "jobstoy"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "regular hours (9 to 5)", `2` = "regular hours, including night/weekend shifts", `3` = "shift work, no weekend shifts", `4` = "shift work, including weekend shifts", `5` = "irregular hours, no weekend shifts", `6` = "irregular hours, including weekend shifts",
  .applies_to_vars = c("job7"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "J", "K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("job8", "joblo1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "never had job, unknown before", `0` = "unknown", `1` = "no job, not changed", `2` = "no job, changed", `3` = "no job, unknown before", `4` = "job, not changed", `5` = "job, changed", `6` = "job, unknown before",
  .applies_to_vars = c("jobc", "pjobc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "steady job", `2` = "temporary job with contract", `3` = "temporary job via employment agency", `4` = "self-employed", `5` = "free-lance basis", `6` = "family company", `7` = "other",
  .applies_to_vars = c("jobl3", "joblo3", "pjobl3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("jobl3a", "pjob3a", "pjobl3a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "regular hours (9 to 5)", `2` = "regular hours, including night/weekend shifts", `3` = "shift work, no weekend shifts", `4` = "shift work, including weekend shifts", `5` = "irregular hours, no weekend shifts", `6` = "irregular hours, including weekend shifts",
  .applies_to_vars = c("jobl7", "joblo7", "pjob7", "pjobl7"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "not available, bjob8 & bjoblo1", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("joblo4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "no answer, info nestor", `-3` = "na, wrong skip", `-1` = "do not know", `1` = "january", `2` = "february", `3` = "march", `4` = "april", `5` = "may", `6` = "june", `7` = "july", `8` = "august", `9` = "september", `10` = "october", `11` = "november", `12` = "december",
  .applies_to_vars = c("jobmon"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available, routing", `1` = "no", `2` = "not sure", `3` = "yes",
  .applies_to_vars = c("jobs"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("jobstar01", "jobstar02", "jobstar03", "jobstar04", "jobstar05", "jobstar06", "jobstar07", "jobstar08", "jobstar09", "rjobchange01", "rjobchange02", "rjobchange03", "rjobchange04", "rjobchange05", "rjobchange06", "rjobchange07", "rjobchange08", "rjobchange09", "rjobchange10", "rjobchange11", "rjobchange12", "rjobchange13"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("jobstay"),
  .applies_to_waves = c("Z", "E", "F", "G", "H", "J", "K")
)

value_labels(
  `-5` = "no answer, info nestor", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "do not know",
  .applies_to_vars = c("jobyear"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("kob1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("ljclass"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "not available, bjob8 & bjoblo1", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("ljlevel"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("ljpresi"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "not available, bjob8 & bjoblo1", `-1` = "na, asked",
  .applies_to_vars = c("ljsbc92"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("ljtype"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "very good", `2` = "good", `3` = "moderate", `4` = "bad", `5` = "very bad",
  .applies_to_vars = c("mability", "pability"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "enough challenges at work", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "label varies by wave", `7` = "other reason", `8` = "partner is still working", `9` = "loyalty towards employer/colleagues",
  .applies_to_vars = c("nretr"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("nretr01", "nretr02", "nretr03", "nretr04", "nretr05", "nretr06", "pretreas01", "pretreas02", "pretreas03", "pretreas04", "pretreas05", "pretreas06", "pretreas07", "pretreas08", "pretreas09", "pretreas10", "pretreas11", "pretreas12", "pretreas13", "retreas01", "retreas02", "retreas03", "retreas04", "retreas05", "retreas06", "retreas07", "retreas08", "retreas09", "retreas10", "retreas11", "retreas12", "retreas13", "retyr01", "retyr02", "retyr03", "retyr04", "retyr05", "retyr06", "retyr07", "retyr08", "retyr09", "retyr10"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("pcjclass"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pcjlevel"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("pcjtype"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "-to be coded-",
  .applies_to_vars = c("pcsbc92", "plsbc92", "rlsbc92"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "not available, refused", `-1` = "na, asked",
  .applies_to_vars = c("pdisabp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "no partner", `1` = "current partner", `2` = "former partner",
  .applies_to_vars = c("pjdata"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-5` = "not available, interview terminated", `-4` = "not available", `-3` = "na, wrong skip", `-2` = "negative code -2", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "steady job", `2` = "temporary job with contract", `3` = "temporary job via employment agency", `4` = "self-employed", `5` = "free-lance basis", `6` = "family company", `7` = "other", `8` = "0-hours/stand-by contract",
  .applies_to_vars = c("pjob3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "not available, routing", `1` = "no", `2` = "not sure", `3` = "yes",
  .applies_to_vars = c("pjobs"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, above age threshold", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "partial retirement first", `2` = "full retirement right away", `3` = "dont know yet",
  .applies_to_vars = c("prefret"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes, partly", `3` = "yes, completely",
  .applies_to_vars = c("pretire"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, above age threshold", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "yes", `2` = "no, not (entirely) voluntarily",
  .applies_to_vars = c("pretivol"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "stress and pressure of work too high", `2` = "other work related factors (organisational changes/conflicts)", `3` = "physically too heavy", `4` = "health complaints too hampering", `5` = "afraid of deterioration of health", `6` = "not motivated anymore/lost interest", `7` = "more enjoyable to spend more time on private life", `8` = "enjoy life as long as health permits", `9` = "not possible anymore in the future", `10` = "other reason", `11` = "reached official retirement age", `12` = "financial benefit", `13` = "more time needed for activities outside work",
  .applies_to_vars = c("pretreas"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, above age threshold", `-3` = "na, wrong skip", `-1` = "not available", `0` = "no", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "yes, completely",
  .applies_to_vars = c("retired"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("retirf1", "retirf2", "retirf3", "retirf4", "retirf5", "retirf6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, above age threshold", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "yes, retired but not entirely voluntarily",
  .applies_to_vars = c("retivol"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "enough challenges at work", `2` = "maintain social contacts", `3` = "other pastime less pleasant", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "should work on to have adequate pension", `7` = "other reason",
  .applies_to_vars = c("retnfr"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "enough challenges at work", `2` = "maintain social contacts", `3` = "other pastime less pleasant", `4` = "no possibility for early retirement", `5` = "financially more favourable", `6` = "should work on to have adequate pension", `7` = "other reason",
  .applies_to_vars = c("retnfr2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "stress and pressure of work too high", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "label varies by wave", `7` = "label varies by wave", `8` = "enjoy life as long as health permits", `9` = "not possible anymore in the future", `10` = "other reason", `11` = "reached official retirement age", `12` = "financial benefit", `13` = "more time needed for activities outside work",
  .applies_to_vars = c("retreas"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "stress and pressure of work too high", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "label varies by wave", `7` = "label varies by wave", `8` = "enjoy life as long as health permits", `9` = "not possible anymore in the future", `10` = "other reason", `11` = "more freedom, less obligations", `12` = "family related factors", `13` = "partner is retired/is going to retire", `14` = "commute is burdensome",
  .applies_to_vars = c("retyr"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "negative code -2", `-1` = "negative code -1", `3` = "both mentally and physically demanding tasks",
  .applies_to_vars = c("tasks"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "me", `2` = "my employer", `3` = "i switched employers",
  .applies_to_vars = c("wjobchange"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no, i do not think so", `2` = "i am sometimes not sure about this", `3` = "yes, i do think so",
  .applies_to_vars = c("work65"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no, i do not think so", `2` = "label varies by wave", `3` = "yes, i do think so",
  .applies_to_vars = c("workret"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("cjclass"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("cjlevel"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("cjpresi"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked",
  .applies_to_vars = c("cjsbc92"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("cjtype"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "no answer, short version", `-3` = "no answer, wrong skip", `-2` = "no answer, routing", `-1` = "no answer, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("disabl", "employ"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no answer, wrong skip", `-2` = "no answer, routing", `-1` = "do not know",
  .applies_to_vars = c("disablp"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job1"),
  .applies_to_waves = c("B", "H", "3B", "MB", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `1` = "steady job", `2` = "temporary job with contract", `3` = "temporary job via employment agency", `4` = "self-employed", `5` = "free-lance basis", `6` = "family company", `7` = "other",
  .applies_to_vars = c("job3"),
  .applies_to_waves = c("B", "3B", "MB")
)

value_labels(
  `-4` = "na, short version", `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("job4"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `98` = "NA",
  .applies_to_vars = c("job5"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked",
  .applies_to_vars = c("job6"),
  .applies_to_waves = c("B", "2B", "3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `1` = "regular hours (9 to 5)", `2` = "regular hours, including night/weekend shifts", `3` = "shift work, no weekend shifts", `4` = "shift work, including weekend shifts", `5` = "irregular hours, no weekend shifts", `6` = "irregular hours, including weekend shifts",
  .applies_to_vars = c("job7"),
  .applies_to_waves = c("B", "3B", "MB")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("job8"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "no answer, wrong skip", `-2` = "no answer, routing", `-1` = "no answer, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("joblo1"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB8 & BJOBLO1", `-1` = "na, asked", `1` = "steady job", `2` = "temporary job with contract", `3` = "temporary job via employment agency", `4` = "self-employed", `5` = "free-lance basis", `6` = "family company", `7` = "other",
  .applies_to_vars = c("joblo3"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, BJOB8 & BJOBLO1", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("joblo4"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB8 & BJOBLO1", `-1` = "na, asked", `98` = "NA",
  .applies_to_vars = c("joblo5"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB8 & BJOBLO1", `-1` = "na, asked",
  .applies_to_vars = c("joblo6"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB8 & BJOBLO1", `-1` = "na, asked", `1` = "regular hours (9 to 5)", `2` = "regular hours, including night/weekend shifts", `3` = "shift work, no weekend shifts", `4` = "shift work, including weekend shifts", `5` = "irregular hours, no weekend shifts", `6` = "irregular hours, including weekend shifts",
  .applies_to_vars = c("joblo7"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "no answer, info NESTOR", `-3` = "no answer, wrong skip", `-2` = "no answer, routing", `-1` = "do not know", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("jobmon"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "no answer, info NESTOR", `-3` = "no answer, wrong skip", `-2` = "no answer, routing", `-1` = "no answer, asked", `0` = "do not know",
  .applies_to_vars = c("jobyear"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB8 & BJOBLO1", `-1` = "na, asked", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("ljclass"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, BJOB8 & BJOBLO1", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("ljlevel"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB8 & BJOBLO1", `-1` = "na, asked", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("ljpresi"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, BJOB8 & BJOBLO1", `-1` = "na, asked",
  .applies_to_vars = c("ljsbc92"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB8 & BJOBLO1", `-1` = "na, asked", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("ljtype"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "no answer, short version", `-3` = "na, wrong skip", `-2` = "na, see BRETIRED", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("retifut"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, Age >= 65", `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `0` = "no", `1` = "yes, partly", `2` = "yes, completely",
  .applies_to_vars = c("retired"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BRETIFUT", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("retirf1", "retirf2", "retirf3", "retirf4", "retirf5", "retirf6"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see C/D/E/F/GJOB1",
  .applies_to_vars = c("cjclass", "cjlevel", "cjpresi", "cjsbc92", "cjtype", "jobc"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-2` = "na, see C/D/E/F/GJOBC",
  .applies_to_vars = c("disabl", "employ", "job3", "job4", "job6", "job7", "jobstam", "jobstay", "jobstom", "jobstoy", "retired"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-2` = "na, see C/D/E/F/GRETIFUT",
  .applies_to_vars = c("retirf1", "retirf2", "retirf3", "retirf4", "retirf5", "retirf6"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-5` = "na, age >= 65",
  .applies_to_vars = c("disabl", "employ", "retired"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("cjclass"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("cjlevel"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("cjpresi"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("cjsbc92"),
  .applies_to_waves = c("C", "E")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("cjtype"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("disabl", "employ"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see C/D/E/F/GDISABL", `-1` = "na, asked",
  .applies_to_vars = c("disablp"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-4` = "na, short version", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job1"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "steady job", `2` = "temporary job with contract", `3` = "temporary job via employment agency", `4` = "self-employed", `5` = "free-lance basis", `6` = "family company", `7` = "other",
  .applies_to_vars = c("job3"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("job4"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GJOB4", `-1` = "na, asked",
  .applies_to_vars = c("job5"),
  .applies_to_waves = c("C", "D", "E")
)

value_labels(
  `-1` = "never had job, unknown before", `1` = "no job, not changed", `2` = "no job, changed", `3` = "no job, unknown before", `4` = "job, not changed", `5` = "job, changed", `6` = "job, unknown before",
  .applies_to_vars = c("jobc"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("jobstam"),
  .applies_to_waves = c("C", "D", "E")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("jobstay"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na wrong skip", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("jobstom"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see C/D/E/F/GRETIRED", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("retifut"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes, partly", `3` = "yes, completely",
  .applies_to_vars = c("retired"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H")
)

value_labels(
  `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("retirf1", "retirf2", "retirf3", "retirf4", "retirf5", "retirf6"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked / not classified", `0` = "- to be coded -", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("cjclass"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked / not classified", `0` = "- to be coded -", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("cjlevel"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked / not classified", `0` = "- to be coded -", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("cjpresi"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "- to be coded -",
  .applies_to_vars = c("cjsbc92"),
  .applies_to_waves = c("D", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked / not classified", `0` = "- to be coded -", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("cjtype"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na asked, not classified", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("cjclass"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked / not classified", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("cjlevel"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked / not classified", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("cjpresi"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked / not classified", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("cjtype"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCJSBC92", `-1` = "unknown", `0` = "- to be coded -", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("cjclass"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCJSBC92", `-1` = "unknown", `0` = "- to be coded -", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("cjlevel"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCJSBC92", `-1` = "unknown", `0` = "- to be coded -", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("cjpresi"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `0` = "- to be coded -",
  .applies_to_vars = c("cjsbc92", "rlsbc92"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCJSBC92", `-1` = "unknown", `0` = "- to be coded -", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("cjtype"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1 & BJOBL1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("disabl"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BDISABL", `-1` = "na, asked",
  .applies_to_vars = c("disablp"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("employ", "jobl1"),
  .applies_to_waves = c("2B", "3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BFLSBC92", `-1` = "unknown", `0` = "- to be coded -", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("flclass"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BFLSBC92", `-1` = "unknown", `0` = "- to be coded -", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("fllevel"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BFLSBC92", `-1` = "unknown", `0` = "- to be coded -", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("flpresi"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "na, interview terminated", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "- to be coded -",
  .applies_to_vars = c("flsbc92"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BFLSBC92", `-1` = "unknown", `0` = "- to be coded -", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("fltype"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job1"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOBL1", `-1` = "na, asked",
  .applies_to_vars = c("jobl6", "jobstoy"),
  .applies_to_waves = c("2B", "3B", "MB")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see BJOBL1", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("jobstom"),
  .applies_to_waves = c("2B", "3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRETFIN", `-1` = "na, asked", `1` = "enough challenges at work", `2` = "maintain social contacts", `3` = "other pastime less pleasant", `4` = "financially more favourable", `5` = "other reason",
  .applies_to_vars = c("nretr", "retnfr"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPCSBC92", `-1` = "unknown", `0` = "- to be coded -", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("pcclass"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPCSBC92", `-1` = "unknown", `0` = "- to be coded -", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pclevel"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPCSBC92", `-1` = "unknown", `0` = "- to be coded -", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("pcpresi"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked", `0` = "- to be coded -",
  .applies_to_vars = c("pcsbc92", "plsbc92"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPCSBC92", `-1` = "unknown", `0` = "- to be coded -", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("pctype"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB1 & BPJOBL1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pdisabl"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BPDISABL", `-1` = "na, asked",
  .applies_to_vars = c("pdisabp"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pemploy", "pjobl1"),
  .applies_to_waves = c("2B", "3B", "MB")
)

value_labels(
  `-5` = "na, interview terminated", `-4` = "na, no household partner", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob1"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked",
  .applies_to_vars = c("pjob6"),
  .applies_to_waves = c("2B", "3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOBL1", `-1` = "na, asked",
  .applies_to_vars = c("pjobl6", "pjobsty"),
  .applies_to_waves = c("2B", "3B", "MB")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see BPJOBL1", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("pjobstm"),
  .applies_to_waves = c("2B", "3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPLSBC92", `-1` = "unknown", `0` = "- to be coded -", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("plclass"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPLSBC92", `-1` = "unknown", `0` = "- to be coded -", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pllevel"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPLSBC92", `-1` = "unknown", `0` = "- to be coded -", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("plpresi"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPLSBC92", `-1` = "unknown", `0` = "- to be coded -", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("pltype"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRETIRE", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pretifu"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB1 & BPJOBL1", `-1` = "na, asked", `1` = "no", `2` = "yes, partly", `3` = "yes, completely",
  .applies_to_vars = c("pretire"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRETIRED & BJOB6", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("retfin"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRETIRED", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("retifut"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1 & BJOBL1", `-1` = "na, asked", `1` = "no", `2` = "yes, partly", `3` = "yes, completely",
  .applies_to_vars = c("retired"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRETIRED", `-1` = "na, asked", `1` = "stress and pressure of work too high", `2` = "physically too heavy", `3` = "health complaints too hampering", `4` = "not motivated anymore", `5` = "nicer to spend more time on private life", `6` = "not possible anymore in the future", `7` = "other reason",
  .applies_to_vars = c("retreas"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRETFIN", `-1` = "na, asked", `1` = "stress and pressure of work too high", `2` = "physically too heavy", `3` = "health complaints too hampering", `4` = "not motivated anymore", `5` = "nicer to spend more time on private life", `6` = "not possible anymore in the future", `7` = "other reason",
  .applies_to_vars = c("retyr"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRLSBC92", `-1` = "unknown", `0` = "- to be coded -", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("rlclass"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRLSBC92", `-1` = "unknown", `0` = "- to be coded -", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("rllevel"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRLSBC92", `-1` = "unknown", `0` = "- to be coded -", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("rlpresi"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRLSBC92", `-1` = "unknown", `0` = "- to be coded -", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("rltype"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRETIRED & BJOB6", `-1` = "na, asked", `1` = "no, I do not think so", `2` = "I am sometimes not sure about this", `3` = "yes, I do think so",
  .applies_to_vars = c("work65"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "- to be coded -", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("cjclass"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "- to be coded -", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("cjlevel"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "- to be coded -", `13` = "NA", `87` = "NA",
  .applies_to_vars = c("cjpresi"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "- to be coded -", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("cjtype"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GJOB4", `-1` = "na, asked", `98` = "NA",
  .applies_to_vars = c("job5"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-3` = "na wrong skip", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("jobstam"),
  .applies_to_waves = c("F", "G", "H", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see G/JOBC", `-1` = "na, asked", `1` = "no, not retired", `2` = "yes, retired entirely voluntarily", `3` = "yes, retired but not entirely voluntarily",
  .applies_to_vars = c("retivol"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see HJOBC",
  .applies_to_vars = c("cjsbc", "disabl", "employ", "job3", "job3a", "job4", "job6", "job7", "jobstam", "jobstay", "jobstom", "jobstoy", "retired", "retivol"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HCJSBC", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("cjclass"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HCJSBC", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("cjlevel"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HCJSBC", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("cjtype"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HDISABL", `-1` = "na, asked",
  .applies_to_vars = c("disablp"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job4"),
  .applies_to_waves = c("H", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HJOB4", `-1` = "na, asked", `98` = "NA",
  .applies_to_vars = c("job5"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job5a", "job5b"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HJOB1", `-1` = "never had job, unknown before", `0` = "unknown", `1` = "no job, not changed", `2` = "no job, changed", `3` = "no job, unknown before", `4` = "job, not changed", `5` = "job, changed", `6` = "job, unknown before",
  .applies_to_vars = c("jobc"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HPCJSBC", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("pcjclass"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HPCJSBC", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pcjlevel"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HPJOB1", `-1` = "na, asked",
  .applies_to_vars = c("pcjsbc", "pjob6"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HPCJSBC", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("pcjtype"),
  .applies_to_waves = c("H")
)

value_labels(
  `-4` = "na, short version", `-3` = "na, wrong skip", `-2` = "no (household) partner", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob1"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HPJOB1", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pjob3a"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HPJOB1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob4"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HPJOB4", `-1` = "na, asked",
  .applies_to_vars = c("pjob5"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HPJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob5a", "pjob5b"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HRETIRED", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("retifut"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HRETIFUT", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("retirf1", "retirf2", "retirf3", "retirf4", "retirf5", "retirf6"),
  .applies_to_waves = c("H")
)

value_labels(
  `-5` = "na, age >=65", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no, not retired", `2` = "yes, retired entirely voluntarily", `3` = "yes, retired but not entirely voluntarily",
  .applies_to_vars = c("retivol"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see BCJSBC", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("cjclass"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BCJSBC", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("cjlevel"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked",
  .applies_to_vars = c("cjsbc"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BCJSBC", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("cjtype"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see BJOBL1", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("jlstam"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see BJOBL1", `-1` = "na, asked",
  .applies_to_vars = c("jlstay"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("job3a"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job4"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB4", `-1` = "na, asked",
  .applies_to_vars = c("job5"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job5a"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job5b", "jobl5a", "jobl5b"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOBL1", `-1` = "na, asked", `1` = "steady job", `2` = "temporary job with contract", `3` = "temporary job via employment agency", `4` = "self-employed", `5` = "free-lance basis", `6` = "family company", `7` = "other",
  .applies_to_vars = c("jobl3"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOBL1", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("jobl3a"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOBL1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("jobl4"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOBL4", `-1` = "na, asked",
  .applies_to_vars = c("jobl5"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOBL1", `-1` = "na, asked", `1` = "regular hours (9 to 5)", `2` = "regular hours, including night/weekend shifts", `3` = "shift work, no weekend shifts", `4` = "shift work, including weekend shifts", `5` = "irregular hours, no weekend shifts", `6` = "irregular hours, including weekend shifts",
  .applies_to_vars = c("jobl7"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("jobstam"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked",
  .applies_to_vars = c("jobstay"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "see BRETIRED", `-1` = "na, asked", `1` = "enough challenges at work", `2` = "maintain social contacts", `3` = "other pastime less pleasant", `4` = "no possibility for early retirement", `5` = "financially more favourable", `6` = "should work on to have adequate pension", `7` = "other reason",
  .applies_to_vars = c("nretr", "retnfr", "retnfr2"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BPCSBC", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("pcclass"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BPCSBC", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pclevel"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked",
  .applies_to_vars = c("pcsbc"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BPCSBC", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("pctype"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see BJOBL1", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("pjlstam"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see BPJOBL1", `-1` = "na, asked",
  .applies_to_vars = c("pjlstay"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BPJDATA", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob1"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked", `1` = "steady job", `2` = "temporary job with contract", `3` = "temporary job via employment agency", `4` = "self-employed", `5` = "free-lance basis", `6` = "family company", `7` = "other",
  .applies_to_vars = c("pjob3"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pjob3a"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob4"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB4", `-1` = "na, asked",
  .applies_to_vars = c("pjob5"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob5a"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob5b"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked", `1` = "regular hours (9 to 5)", `2` = "regular hours, including night/weekend shifts", `3` = "shift work, no weekend shifts", `4` = "shift work, including weekend shifts", `5` = "irregular hours, no weekend shifts", `6` = "irregular hours, including weekend shifts",
  .applies_to_vars = c("pjob7"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOBL1", `-1` = "na, asked", `1` = "steady job", `2` = "temporary job with contract", `3` = "temporary job via employment agency", `4` = "self-employed", `5` = "free-lance basis", `6` = "family company", `7` = "other",
  .applies_to_vars = c("pjobl3"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOBL1", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pjobl3a"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOBL1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjobl4"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOBL4", `-1` = "na, asked",
  .applies_to_vars = c("pjobl5"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOBL4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjobl5a"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOBL4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjobl5b"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOBL1", `-1` = "na, asked", `1` = "regular hours (9 to 5)", `2` = "regular hours, including night/weekend shifts", `3` = "shift work, no weekend shifts", `4` = "shift work, including weekend shifts", `5` = "irregular hours, no weekend shifts", `6` = "irregular hours, including weekend shifts",
  .applies_to_vars = c("pjobl7"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("pjstam"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked",
  .applies_to_vars = c("pjstay"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-2` = "na, see BPLSBC", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("plclass"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BPLSBC", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pllevel"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOBL1", `-1` = "na, asked",
  .applies_to_vars = c("plsbc"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BPLSBC", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("pltype"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "see BRETIRED", `-1` = "na, asked", `1` = "no, not retired", `2` = "yes, retired entirely voluntarily", `3` = "yes, retired but not entirely voluntarily",
  .applies_to_vars = c("retivol"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "see BRETIRED", `-1` = "na, asked", `1` = "stress and pressure of work too high", `2` = "physically too heavy", `3` = "health complaints too hampering", `4` = "not motivated anymore", `5` = "nicer to spend more time on private life", `6` = "not possible anymore in the future", `7` = "other reason",
  .applies_to_vars = c("retreas", "retyr"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BRLSBC", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("rlclass"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BRLSBC", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("rllevel"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOBL1", `-1` = "na, asked",
  .applies_to_vars = c("rlsbc"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BRLSBC", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("rltype"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1 & BRETIRED", `-1` = "na, asked", `1` = "no, I do not think so", `2` = "I am sometimes not sure about this", `3` = "yes, I do think so",
  .applies_to_vars = c("work65"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1/BJOBL1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("disabl"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, refused", `-2` = "na, see BDISABL", `-1` = "na, asked",
  .applies_to_vars = c("disablp"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOBL4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("jobl5a"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJOB1/BPJOBL1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pdisabl"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, refused", `-2` = "na, see BPDISABL", `-1` = "na, asked",
  .applies_to_vars = c("pdisabp"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BPJDATA", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob1"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1/BJOBL1", `-1` = "na, asked", `1` = "no", `2` = "yes, partly", `3` = "yes, completely",
  .applies_to_vars = c("retired"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BJOB1/BRETIRED", `-1` = "na, asked", `1` = "no, I do not think so", `2` = "I am sometimes not sure about this", `3` = "yes, I do think so",
  .applies_to_vars = c("workret"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see ICJSBC", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("cjclass"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see ICJSBC", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("cjlevel"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IJOBC/S", `-1` = "na, asked",
  .applies_to_vars = c("cjsbc", "job6", "jobstay"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see ICJSBC", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("cjtype"),
  .applies_to_waves = c("I")
)

value_labels(
  `-5` = "na, age >= 66", `-3` = "na, wrong skip", `-2` = "na, see IJOBC", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("disabl", "employ"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IDISABL", `-1` = "na, asked",
  .applies_to_vars = c("disablp"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IJOBC/S", `-1` = "na, asked", `1` = "steady job", `2` = "temporary job with contract", `3` = "temporary job via employment agency", `4` = "self-employed", `5` = "free-lance basis", `6` = "family company", `7` = "other",
  .applies_to_vars = c("job3"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IJOBC/S", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("job3a"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IJOBC/S", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job4"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IJOB4", `-1` = "na, asked", `98` = "NA",
  .applies_to_vars = c("job5"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job5a", "job5b"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IJOBC/S", `-1` = "na, asked", `1` = "regular hours (9 to 5)", `2` = "regular hours, including night/weekend shifts", `3` = "shift work, no weekend shifts", `4` = "shift work, including weekend shifts", `5` = "irregular hours, no weekend shifts", `6` = "irregular hours, including weekend shifts",
  .applies_to_vars = c("job7"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IJOB1", `-1` = "never had job, unknown before", `0` = "unknown", `1` = "no job, not changed", `2` = "no job, changed", `3` = "no job, unknown before", `4` = "job, not changed", `5` = "job, changed", `6` = "job, unknown before",
  .applies_to_vars = c("jobc"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IJOB1", `-1` = "na, see IJOBC", `1` = "no", `2` = "not sure", `3` = "yes",
  .applies_to_vars = c("jobs"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see IJOBC/S", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("jobstam"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see IJOBC", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("jobstom"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IJOBC", `-1` = "na, asked",
  .applies_to_vars = c("jobstoy"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IPCJSBC", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("pcjclass"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IPCJSBC", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pcjlevel"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IPJOBC", `-1` = "na, asked",
  .applies_to_vars = c("pcjsbc"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IPCJSBC", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("pcjtype"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IPJOBC/S", `-1` = "na, asked", `1` = "steady job", `2` = "temporary job with contract", `3` = "temporary job via employment agency", `4` = "self-employed", `5` = "free-lance basis", `6` = "family company", `7` = "other",
  .applies_to_vars = c("pjob3"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IPJOBC/S", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pjob3a"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IPJOBC/S", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob4"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IPJOB4", `-1` = "na, asked",
  .applies_to_vars = c("pjob5"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IPJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob5a", "pjob5b"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IPJOB1", `-1` = "na, asked",
  .applies_to_vars = c("pjob6"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IPJOB1", `-1` = "na, asked", `1` = "regular hours (9 to 5)", `2` = "regular hours, including night/weekend shifts", `3` = "shift work, no weekend shifts", `4` = "shift work, including weekend shifts", `5` = "irregular hours, no weekend shifts", `6` = "irregular hours, including weekend shifts",
  .applies_to_vars = c("pjob7"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IPJOB1", `-1` = "never had job, unknown before", `0` = "unknown", `1` = "no job, not changed", `2` = "no job, changed", `3` = "no job, unknown before", `4` = "job, not changed", `5` = "job, changed", `6` = "job, unknown before",
  .applies_to_vars = c("pjobc"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IPJOB1", `-1` = "na, see IPJOBC", `1` = "no", `2` = "not sure", `3` = "yes",
  .applies_to_vars = c("pjobs"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see IPJOBC/S", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("pjstam"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IPJOBC/S", `-1` = "na, asked",
  .applies_to_vars = c("pjstay"),
  .applies_to_waves = c("I")
)

value_labels(
  `-5` = "na, age >= 66", `-3` = "na, wrong skip", `-2` = "na, see IJOBC", `-1` = "na, asked", `1` = "no", `2` = "yes, partly", `3` = "yes, completely",
  .applies_to_vars = c("retired"),
  .applies_to_waves = c("I")
)

value_labels(
  `-5` = "na, age >=66", `-3` = "na, wrong skip", `-2` = "na, see IJOBC", `-1` = "na, asked", `1` = "no, not retired", `2` = "yes, retired entirely voluntarily", `3` = "yes, retired but not entirely voluntarily",
  .applies_to_vars = c("retivol"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IJOB1/IRETIRED", `-1` = "na, asked", `1` = "no, I do not think so", `2` = "I am not sure about this", `3` = "yes, I do think so",
  .applies_to_vars = c("workret"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see JJOBC/S",
  .applies_to_vars = c("abstot", "abswd", "cjsbc", "healthp", "job3", "job3a", "job4", "job6c", "job6r", "job7", "jobstam", "jobstay", "mability", "pability", "tasks"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JJOBS",
  .applies_to_vars = c("jobstar01", "jobstar02", "jobstar03", "jobstar04", "jobstar05", "jobstar06", "jobstar07", "jobstar08", "jobstar09", "rjobchange01", "rjobchange02", "rjobchange03", "rjobchange04", "rjobchange05", "rjobchange06", "rjobchange07", "rjobchange08", "rjobchange09", "rjobchange10", "rjobchange11", "rjobchange12", "rjobchange13", "wjobchange"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JCJSBC", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("cjclass"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JCJSBC", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("cjlevel"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JCJSBC", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("cjtype"),
  .applies_to_waves = c("J")
)

value_labels(
  `-5` = "na, age >= 67", `-3` = "na, wrong skip", `-2` = "na, see JJOBC", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("disabl", "employ"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "refused", `-2` = "na, see JDISABL", `-1` = "na, asked",
  .applies_to_vars = c("disablp"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JRETIRED", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("eretfin", "peretfin"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JRETIRED", `-1` = "na, asked",
  .applies_to_vars = c("fretage", "pretage", "retage"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JJOB4", `-1` = "na, asked", `98` = "NA",
  .applies_to_vars = c("job5"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job5a", "job5b"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JJOB1", `-1` = "never had job, unknown before", `0` = "unknown", `1` = "no job, not changed", `2` = "no job, changed", `3` = "no job, unknown before", `4` = "job, not changed", `5` = "job, changed", `6` = "job, unknown before",
  .applies_to_vars = c("jobc"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JJOB1", `-1` = "na, see JJOBC", `1` = "no", `2` = "not sure", `3` = "yes",
  .applies_to_vars = c("jobs"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see JJOBC", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("jobstom"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JJOBC", `-1` = "na, asked",
  .applies_to_vars = c("jobstoy"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JRETIRED", `-1` = "na, asked", `1` = "enough challenges at work", `2` = "maintain social contacts at work", `3` = "other pastimes less pleasant than work", `4` = "financially more favourable", `5` = "continue working after retirement age in same job", `6` = "continue working after retirement age in new job", `7` = "other reason", `8` = "partner is still working", `9` = "loyalty towards employer/colleagues",
  .applies_to_vars = c("nretr"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JPCJSBC", `11` = "elementary occupations", `21` = "lower non-specialized occupations", `22` = "lower teaching & instruction occupations", `24` = "lower agricultural occupations", `25` = "lower natural science occupations", `26` = "lower technical occupations", `28` = "lower transport occupations", `29` = "lower (para)medical occupations", `31` = "lower administrative & commercial occupations", `33` = "lower security occupations", `37` = "lower service & care occupations", `42` = "medium teaching & instruction occupations", `44` = "medium agricultural occupations", `45` = "medium natural science occupations", `46` = "medium technical occupations", `48` = "medium transport occupations", `49` = "medium (para)medical occupations", `51` = "medium administrative & commercial occupations", `53` = "medium juridical & security occupations", `55` = "medium linguistic & cultural occupations", `56` = "medium social occupations", `57` = "medium service & care occupations", `62` = "higher pedagogical occupations", `64` = "higher agricultural occupations", `65` = "higher natural science occupations", `66` = "higher technical occupations", `68` = "higher transport occupations", `69` = "higher (para)medical occupations", `71` = "higher administrative & commercial occupations", `73` = "higher juridical & security occupations", `75` = "higher linguistic & cultural occupations", `76` = "higher social occupations", `77` = "higher service & care occupations", `78` = "higher managers", `82` = "scientific pedagogical occupations", `84` = "scientific agricultural occupations", `85` = "scientific natural science occupations", `86` = "scientific technical occupations", `89` = "scientific (para)medical occupations", `91` = "scientific administrative & economic occupations", `93` = "scientific juridical & policy occupations", `96` = "scientific social occupations", `98` = "scientific managers",
  .applies_to_vars = c("pcjclass"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JPCJSBC", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pcjlevel"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JPJOBC", `-1` = "na, asked",
  .applies_to_vars = c("pcjsbc"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JPCJSBC", `1` = "general", `2` = "pedagogical", `4` = "agricultural", `5` = "natural science", `6` = "technical", `8` = "transport", `9` = "(para)medical", `11` = "administrative/commercial", `13` = "juridical/security", `15` = "cultural/linguistic", `16` = "social science", `17` = "care & services", `18` = "management",
  .applies_to_vars = c("pcjtype"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JPJOBC/S", `-1` = "na, asked", `1` = "steady job", `2` = "temporary job with contract", `3` = "temporary job via employment agency", `4` = "self-employed", `5` = "free-lance basis", `6` = "family company", `7` = "other",
  .applies_to_vars = c("pjob3"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JPJOBC/S", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pjob3a"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JPJOBC/S", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob4"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JPJOB4", `-1` = "na, asked",
  .applies_to_vars = c("pjob5"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JPJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob5a", "pjob5b"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JPJOB1", `-1` = "na, asked",
  .applies_to_vars = c("pjob6c", "pjob6r"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JPJOB1", `-1` = "na, asked", `1` = "regular hours (9 to 5)", `2` = "regular hours, including night/weekend shifts", `3` = "shift work, no weekend shifts", `4` = "shift work, including weekend shifts", `5` = "irregular hours, no weekend shifts", `6` = "irregular hours, including weekend shifts",
  .applies_to_vars = c("pjob7"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JPJOB1", `-1` = "never had job, unknown before", `0` = "unknown", `1` = "no job, not changed", `2` = "no job, changed", `3` = "no job, unknown before", `4` = "job, not changed", `5` = "job, changed", `6` = "job, unknown before",
  .applies_to_vars = c("pjobc"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JPJOB1", `-1` = "na, see JPJOBC", `1` = "no", `2` = "not sure", `3` = "yes",
  .applies_to_vars = c("pjobs"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see JPJOBC/S", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("pjstam"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JPJOBC/S", `-1` = "na, asked",
  .applies_to_vars = c("pjstay"),
  .applies_to_waves = c("J")
)

value_labels(
  `-5` = "na, age >= 71", `-3` = "na, wrong skip", `-2` = "na, see JJOBC", `-1` = "na, asked", `1` = "partial retirement first", `2` = "full retirement right away", `3` = "dont know yet",
  .applies_to_vars = c("prefret"),
  .applies_to_waves = c("J")
)

value_labels(
  `-5` = "na, age >=67", `-3` = "na, wrong skip", `-2` = "na, see JJOBC", `-1` = "na, asked", `1` = "yes", `2` = "no, not (entirely) voluntarily",
  .applies_to_vars = c("pretivol", "retivol"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JRETIRED", `-1` = "na, asked", `1` = "stress and pressure of work too high", `2` = "other work related factors (organisational changes/conflicts)", `3` = "physically too heavy", `4` = "health complaints too hampering", `5` = "afraid of deterioration of health", `6` = "not motivated anymore/lost interest", `7` = "more enjoyable to spend more time on private life", `8` = "enjoy life as long as health permits", `9` = "not possible anymore in the future", `10` = "other reason", `11` = "reached official retirement age", `12` = "financial benefit", `13` = "more time needed for activities outside work",
  .applies_to_vars = c("pretreas", "retreas"),
  .applies_to_waves = c("J")
)

value_labels(
  `-5` = "na, age >= 71", `-3` = "na, wrong skip", `-2` = "na, see JJOBC", `-1` = "na, not applicable", `1` = "no", `2` = "yes, partly", `3` = "yes, completely",
  .applies_to_vars = c("retired"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JRETIRED", `-1` = "na, asked", `1` = "stress and pressure of work too high", `2` = "other work related factors (organisational changes/conflicts)", `3` = "physically too demanding", `4` = "health complaints too limiting", `5` = "afraid of deterioration of health", `6` = "not motivated anymore/lost interest", `7` = "more enjoyable to spend more time on private life", `8` = "enjoy life as long as health permits", `9` = "not possible anymore in the future", `10` = "other reason", `11` = "more freedom, less obligations", `12` = "family related factors", `13` = "partner is retired/is going to retire", `14` = "commute is burdensome",
  .applies_to_vars = c("retyr"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `3` = "both mentally and physically demanding tasks",
  .applies_to_vars = c("tasks"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "me", `2` = "my employer", `3` = "I switched employers",
  .applies_to_vars = c("wjobchange"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JJOB1/JRETIRED", `-1` = "na, asked", `1` = "no, I do not think so", `2` = "I am not sure about this", `3` = "yes, I do think so",
  .applies_to_vars = c("workret"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see KJOBC/S",
  .applies_to_vars = c("abstot", "abswd", "cjsbc", "healthp", "job3", "job3a", "job4", "job6c", "job6r", "job7", "jobstam", "jobstay", "mability", "pability", "tasks"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KJOBS",
  .applies_to_vars = c("jobstar01", "jobstar02", "jobstar03", "jobstar04", "jobstar05", "jobstar06", "jobstar07", "jobstar08", "jobstar09", "rjobchange01", "rjobchange02", "rjobchange03", "rjobchange04", "rjobchange05", "rjobchange06", "rjobchange07", "rjobchange08", "rjobchange09", "rjobchange10", "rjobchange11", "rjobchange12", "rjobchange13", "wjobchange"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KRETIRED",
  .applies_to_vars = c("eretfin", "fretage", "nretr01", "nretr02", "nretr03", "nretr04", "nretr05", "nretr06", "peretfin", "pretage", "pretreas01", "pretreas02", "pretreas03", "pretreas04", "pretreas05", "pretreas06", "pretreas07", "pretreas08", "pretreas09", "pretreas10", "pretreas11", "pretreas12", "pretreas13", "retage", "retreas01", "retreas02", "retreas03", "retreas04", "retreas05", "retreas06", "retreas07", "retreas08", "retreas09", "retreas10", "retreas11", "retreas12", "retreas13", "retyr01", "retyr02", "retyr03", "retyr04", "retyr05", "retyr06", "retyr07", "retyr08", "retyr09", "retyr10"),
  .applies_to_waves = c("K")
)

value_labels(
  `-5` = "na, age >= 67", `-3` = "na, wrong skip", `-2` = "na, see KJOBC", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("disabl", "employ"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "refused", `-2` = "na, see KDISABL", `-1` = "na, asked",
  .applies_to_vars = c("disablp"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KJOB4", `-1` = "na, asked", `98` = "NA",
  .applies_to_vars = c("job5"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("job5a", "job5b"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KJOB1", `-1` = "never had job, unknown before", `0` = "unknown", `1` = "no job, not changed", `2` = "no job, changed", `3` = "no job, unknown before", `4` = "job, not changed", `5` = "job, changed", `6` = "job, unknown before",
  .applies_to_vars = c("jobc"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KJOB1", `-1` = "na, see KJOBC", `1` = "no", `2` = "not sure", `3` = "yes",
  .applies_to_vars = c("jobs"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see KJOBC", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("jobstom"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KJOBC", `-1` = "na, asked",
  .applies_to_vars = c("jobstoy"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("kob1"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KPJOBC", `-1` = "na, asked",
  .applies_to_vars = c("pcjsbc"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KPJOBC/S", `-1` = "na, asked", `1` = "steady job", `2` = "temporary job with contract", `3` = "temporary job via employment agency", `4` = "self-employed", `5` = "free-lance basis", `6` = "family company", `7` = "other", `8` = "0-hours/stand-by contract",
  .applies_to_vars = c("pjob3"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KPJOBC/S", `-1` = "na, asked", `1` = "elementary", `2` = "low", `3` = "medium", `4` = "high", `5` = "scientific",
  .applies_to_vars = c("pjob3a"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KPJOBC/S", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob4"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KPJOB4", `-1` = "na, asked",
  .applies_to_vars = c("pjob5"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KPJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pjob5a", "pjob5b"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KPJOB1", `-1` = "na, asked",
  .applies_to_vars = c("pjob6c", "pjob6r"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KPJOB1", `-1` = "na, asked", `1` = "regular hours (9 to 5)", `2` = "regular hours, including night/weekend shifts", `3` = "shift work, no weekend shifts", `4` = "shift work, including weekend shifts", `5` = "irregular hours, no weekend shifts", `6` = "irregular hours, including weekend shifts",
  .applies_to_vars = c("pjob7"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KPJOB1", `-1` = "never had job, unknown before", `0` = "unknown", `1` = "no job, not changed", `2` = "no job, changed", `3` = "no job, unknown before", `4` = "job, not changed", `5` = "job, changed", `6` = "job, unknown before",
  .applies_to_vars = c("pjobc"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KPJOB1", `-1` = "na, see KPJOBC", `1` = "no", `2` = "not sure", `3` = "yes",
  .applies_to_vars = c("pjobs"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see KPJOBC/S", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("pjstam"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KPJOBC/S", `-1` = "na, asked",
  .applies_to_vars = c("pjstay"),
  .applies_to_waves = c("K")
)

value_labels(
  `-5` = "na, age >= 71", `-3` = "na, wrong skip", `-2` = "na, see KJOBC", `-1` = "na, asked", `1` = "partial retirement first", `2` = "full retirement right away", `3` = "dont know yet",
  .applies_to_vars = c("prefret"),
  .applies_to_waves = c("K")
)

value_labels(
  `-5` = "na, age >=67", `-3` = "na, wrong skip", `-2` = "na, see KJOBC", `-1` = "na, asked", `1` = "yes", `2` = "no, not (entirely) voluntarily",
  .applies_to_vars = c("pretivol", "retivol"),
  .applies_to_waves = c("K")
)

value_labels(
  `-5` = "na, age >= 71", `-3` = "na, wrong skip", `-2` = "na, see KJOBC", `-1` = "na, not applicable", `1` = "no", `2` = "yes, partly", `3` = "yes, completely",
  .applies_to_vars = c("retired"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KJOB1/KRETIRED", `-1` = "na, asked", `1` = "no, I do not think so", `2` = "I am not sure about this", `3` = "yes, I do think so",
  .applies_to_vars = c("workret"),
  .applies_to_waves = c("K")
)

.lasa_fc_016 <- .lasa_finalize_fc("016")

