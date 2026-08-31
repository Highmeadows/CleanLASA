## LASA filecode 016 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  workret = "Present job: practice until retirement age"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "cjclass",
    "cjlevel",
    "cjpresi",
    "cjsbc92",
    "cjtype",
    "disabl",
    "disablp",
    "employ",
    "job1",
    "job3",
    "job4",
    "job5",
    "job6",
    "job7",
    "job8",
    "joblo1",
    "joblo3",
    "joblo4",
    "joblo5",
    "joblo6",
    "joblo7",
    "jobmon",
    "jobyear",
    "ljclass",
    "ljlevel",
    "ljpresi",
    "ljsbc92",
    "ljtype",
    "retifut",
    "retired",
    "retirf1",
    "retirf2",
    "retirf3",
    "retirf4",
    "retirf5",
    "retirf6"
  ),
  `C` = c(
    "cjclass",
    "cjlevel",
    "cjpresi",
    "cjsbc92",
    "cjtype",
    "disabl",
    "disablp",
    "employ",
    "job1",
    "job3",
    "job4",
    "job5",
    "job6",
    "job7",
    "jobc",
    "jobstam",
    "jobstay",
    "jobstom",
    "jobstoy",
    "retifut",
    "retired",
    "retirf1",
    "retirf2",
    "retirf3",
    "retirf4",
    "retirf5",
    "retirf6"
  ),
  `D` = c(
    "cjclass",
    "cjlevel",
    "cjpresi",
    "cjsbc92",
    "cjtype",
    "disabl",
    "disablp",
    "employ",
    "job1",
    "job3",
    "job4",
    "job5",
    "job6",
    "job7",
    "jobc",
    "jobstam",
    "jobstay",
    "jobstom",
    "jobstoy",
    "retifut",
    "retired",
    "retirf1",
    "retirf2",
    "retirf3",
    "retirf4",
    "retirf5",
    "retirf6"
  ),
  `E` = c(
    "cjclass",
    "cjlevel",
    "cjpresi",
    "cjsbc92",
    "cjtype",
    "disabl",
    "disablp",
    "employ",
    "job1",
    "job3",
    "job4",
    "job5",
    "job6",
    "job7",
    "jobc",
    "jobstam",
    "jobstay",
    "jobstom",
    "jobstoy",
    "retifut",
    "retired",
    "retirf1",
    "retirf2",
    "retirf3",
    "retirf4",
    "retirf5",
    "retirf6"
  ),
  `2B` = c(
    "cjclass",
    "cjlevel",
    "cjpresi",
    "cjsbc92",
    "cjtype",
    "disabl",
    "disablp",
    "employ",
    "flclass",
    "fllevel",
    "flpresi",
    "flsbc92",
    "fltype",
    "job1",
    "job6",
    "jobl1",
    "jobl6",
    "jobstom",
    "jobstoy",
    "nretr",
    "pcclass",
    "pclevel",
    "pcpresi",
    "pcsbc92",
    "pctype",
    "pdisabl",
    "pdisabp",
    "pemploy",
    "pjob1",
    "pjob6",
    "pjobl1",
    "pjobl6",
    "pjobstm",
    "pjobsty",
    "plclass",
    "pllevel",
    "plpresi",
    "plsbc92",
    "pltype",
    "pretifu",
    "pretire",
    "retfin",
    "retifut",
    "retired",
    "retnfr",
    "retreas",
    "retyr",
    "rlclass",
    "rllevel",
    "rlpresi",
    "rlsbc92",
    "rltype",
    "work65"
  ),
  `F` = c(
    "cjclass",
    "cjlevel",
    "cjpresi",
    "cjsbc92",
    "cjtype",
    "disabl",
    "disablp",
    "employ",
    "job1",
    "job3",
    "job4",
    "job5",
    "job6",
    "job7",
    "jobc",
    "jobstam",
    "jobstay",
    "jobstom",
    "jobstoy",
    "retifut",
    "retired",
    "retirf1",
    "retirf2",
    "retirf3",
    "retirf4",
    "retirf5",
    "retirf6"
  ),
  `G` = c(
    "cjclass",
    "cjlevel",
    "cjpresi",
    "cjsbc92",
    "cjtype",
    "disabl",
    "disablp",
    "employ",
    "job1",
    "job3",
    "job4",
    "job5",
    "job6",
    "job7",
    "jobc",
    "jobstam",
    "jobstay",
    "jobstom",
    "jobstoy",
    "retifut",
    "retired",
    "retirf1",
    "retirf2",
    "retirf3",
    "retirf4",
    "retirf5",
    "retirf6",
    "retivol"
  ),
  `H` = c(
    "cjclass",
    "cjlevel",
    "cjsbc",
    "cjtype",
    "disabl",
    "disablp",
    "employ",
    "job1",
    "job3",
    "job3a",
    "job4",
    "job5",
    "job5a",
    "job5b",
    "job6",
    "job7",
    "jobc",
    "jobstam",
    "jobstay",
    "jobstom",
    "jobstoy",
    "pcjclass",
    "pcjlevel",
    "pcjsbc",
    "pcjtype",
    "pjob1",
    "pjob3a",
    "pjob4",
    "pjob5",
    "pjob5a",
    "pjob5b",
    "pjob6",
    "retifut",
    "retired",
    "retirf1",
    "retirf2",
    "retirf3",
    "retirf4",
    "retirf5",
    "retirf6",
    "retivol"
  ),
  `3B` = c(
    "cjclass",
    "cjlevel",
    "cjsbc",
    "cjtype",
    "disabl",
    "disablp",
    "employ",
    "jlstam",
    "jlstay",
    "job1",
    "job3",
    "job3a",
    "job4",
    "job5",
    "job5a",
    "job5b",
    "job6",
    "job7",
    "jobl1",
    "jobl3",
    "jobl3a",
    "jobl4",
    "jobl5",
    "jobl5a",
    "jobl5b",
    "jobl6",
    "jobl7",
    "jobstam",
    "jobstay",
    "jobstom",
    "jobstoy",
    "nretr",
    "pcclass",
    "pclevel",
    "pcsbc",
    "pctype",
    "pdisabl",
    "pdisabp",
    "pemploy",
    "pjdata",
    "pjlstam",
    "pjlstay",
    "pjob1",
    "pjob3",
    "pjob3a",
    "pjob4",
    "pjob5",
    "pjob5a",
    "pjob5b",
    "pjob6",
    "pjob7",
    "pjobl1",
    "pjobl3",
    "pjobl3a",
    "pjobl4",
    "pjobl5",
    "pjobl5a",
    "pjobl5b",
    "pjobl6",
    "pjobl7",
    "pjobstm",
    "pjobsty",
    "pjstam",
    "pjstay",
    "plclass",
    "pllevel",
    "plsbc",
    "pltype",
    "pretire",
    "retired",
    "retivol",
    "retnfr",
    "retnfr2",
    "retreas",
    "retyr",
    "rlclass",
    "rllevel",
    "rlsbc",
    "rltype",
    "work65"
  ),
  `MB` = c(
    "disabl",
    "disablp",
    "employ",
    "jlstam",
    "jlstay",
    "job1",
    "job3",
    "job3a",
    "job4",
    "job5",
    "job5a",
    "job6",
    "job7",
    "jobl1",
    "jobl3",
    "jobl3a",
    "jobl4",
    "jobl5",
    "jobl5a",
    "jobl6",
    "jobl7",
    "jobstam",
    "jobstay",
    "jobstom",
    "jobstoy",
    "pdisabl",
    "pdisabp",
    "pemploy",
    "pjob1",
    "pjob3",
    "pjob3a",
    "pjob4",
    "pjob5",
    "pjob5a",
    "pjob6",
    "pjob7",
    "pjobl1",
    "pjobl3",
    "pjobl3a",
    "pjobl4",
    "pjobl5",
    "pjobl5a",
    "pjobl6",
    "pjobl7",
    "pjobstm",
    "pjobsty",
    "pjstam",
    "pjstay",
    "retired",
    "retivol",
    "workret"
  ),
  `I` = c(
    "cjclass",
    "cjlevel",
    "cjsbc",
    "cjtype",
    "disabl",
    "disablp",
    "employ",
    "job1",
    "job3",
    "job3a",
    "job4",
    "job5",
    "job5a",
    "job5b",
    "job6",
    "job7",
    "jobc",
    "jobs",
    "jobstam",
    "jobstay",
    "jobstom",
    "jobstoy",
    "pcjclass",
    "pcjlevel",
    "pcjsbc",
    "pcjtype",
    "pjob1",
    "pjob3",
    "pjob3a",
    "pjob4",
    "pjob5",
    "pjob5a",
    "pjob5b",
    "pjob6",
    "pjob7",
    "pjobc",
    "pjobs",
    "pjstam",
    "pjstay",
    "retired",
    "retivol",
    "workret"
  ),
  `J` = c(
    "abstot",
    "abswd",
    "cjclass",
    "cjlevel",
    "cjsbc",
    "cjtype",
    "disabl",
    "disablp",
    "employ",
    "eretfin",
    "fretage",
    "healthp",
    "job1",
    "job3",
    "job3a",
    "job4",
    "job5",
    "job5a",
    "job5b",
    "job6c",
    "job6r",
    "job7",
    "jobc",
    "jobs",
    "jobstam",
    "jobstar01",
    "jobstar02",
    "jobstar03",
    "jobstar04",
    "jobstar05",
    "jobstar06",
    "jobstar07",
    "jobstar08",
    "jobstar09",
    "jobstay",
    "jobstom",
    "jobstoy",
    "mability",
    "nretr",
    "pability",
    "pcjclass",
    "pcjlevel",
    "pcjsbc",
    "pcjtype",
    "peretfin",
    "pjob1",
    "pjob3",
    "pjob3a",
    "pjob4",
    "pjob5",
    "pjob5a",
    "pjob5b",
    "pjob6c",
    "pjob6r",
    "pjob7",
    "pjobc",
    "pjobs",
    "pjstam",
    "pjstay",
    "prefret",
    "pretage",
    "pretivol",
    "pretreas",
    "retage",
    "retired",
    "retivol",
    "retreas",
    "retyr",
    "rjobchange01",
    "rjobchange02",
    "rjobchange03",
    "rjobchange04",
    "rjobchange05",
    "rjobchange06",
    "rjobchange07",
    "rjobchange08",
    "rjobchange09",
    "rjobchange10",
    "rjobchange11",
    "rjobchange12",
    "rjobchange13",
    "tasks",
    "wjobchange",
    "workret"
  ),
  `K` = c(
    "abstot",
    "abswd",
    "cjsbc",
    "disabl",
    "disablp",
    "employ",
    "eretfin",
    "fretage",
    "healthp",
    "job3",
    "job3a",
    "job4",
    "job5",
    "job5a",
    "job5b",
    "job6c",
    "job6r",
    "job7",
    "jobc",
    "jobs",
    "jobstam",
    "jobstar01",
    "jobstar02",
    "jobstar03",
    "jobstar04",
    "jobstar05",
    "jobstar06",
    "jobstar07",
    "jobstar08",
    "jobstar09",
    "jobstay",
    "jobstom",
    "jobstoy",
    "kob1",
    "mability",
    "nretr01",
    "nretr02",
    "nretr03",
    "nretr04",
    "nretr05",
    "nretr06",
    "pability",
    "pcjsbc",
    "peretfin",
    "pjob1",
    "pjob3",
    "pjob3a",
    "pjob4",
    "pjob5",
    "pjob5a",
    "pjob5b",
    "pjob6c",
    "pjob6r",
    "pjob7",
    "pjobc",
    "pjobs",
    "pjstam",
    "pjstay",
    "prefret",
    "pretage",
    "pretivol",
    "pretreas01",
    "pretreas02",
    "pretreas03",
    "pretreas04",
    "pretreas05",
    "pretreas06",
    "pretreas07",
    "pretreas08",
    "pretreas09",
    "pretreas10",
    "pretreas11",
    "pretreas12",
    "pretreas13",
    "retage",
    "retired",
    "retivol",
    "retreas01",
    "retreas02",
    "retreas03",
    "retreas04",
    "retreas05",
    "retreas06",
    "retreas07",
    "retreas08",
    "retreas09",
    "retreas10",
    "retreas11",
    "retreas12",
    "retreas13",
    "retyr01",
    "retyr02",
    "retyr03",
    "retyr04",
    "retyr05",
    "retyr06",
    "retyr07",
    "retyr08",
    "retyr09",
    "retyr10",
    "rjobchange01",
    "rjobchange02",
    "rjobchange03",
    "rjobchange04",
    "rjobchange05",
    "rjobchange06",
    "rjobchange07",
    "rjobchange08",
    "rjobchange09",
    "rjobchange10",
    "rjobchange11",
    "rjobchange12",
    "rjobchange13",
    "tasks",
    "wjobchange",
    "workret"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    cjclass = "cur. job: occupational class SBC92",
    cjlevel = "cur. job: occupational skill-level SBC92",
    cjpresi = "cur. job: occup prestige (Sixma & Ultee)",
    cjsbc92 = "cur. job: standard classification occupation",
    cjtype = "cur. job: main type of skills in occupation",
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
    retirf1 = "Fut. retirement: now less working hours",
    retirf2 = "Fut. retirement: now more hobbies",
    retirf3 = "Fut. retirement: now volunteering work",
    retirf4 = "Fut. retirement: now administrative work",
    retirf5 = "Fut. retirement: now more holidays",
    retirf6 = "Fut. retirement: other"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    cjclass = "cur. job: occupational class SBC92",
    cjlevel = "cur. job: occupational skill-level SBC92",
    cjpresi = "cur. job: occup prestige (Sixma & Ultee)",
    cjsbc92 = "cur. job: standard classification occupation",
    cjtype = "cur. job: main type of skills in occupation",
    job4 = "present job: management Yes/No (constructed)",
    job5 = "Management # people",
    jobstam = "Start working: month",
    jobstay = "Start working: year",
    retirf1 = "Fut. retirement: now less working hours",
    retirf2 = "Fut. retirement: now more hobbies",
    retirf3 = "Fut. retirement: now volunteering work",
    retirf4 = "Fut. retirement: now administrative work",
    retirf5 = "Fut. retirement: now more holidays",
    retirf6 = "Fut. retirement: other specification"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    cjclass = "cur. job: occupational class SBC92",
    cjlevel = "cur. job: occupational skill-level SBC92",
    cjpresi = "cur. job: occup prestige (Sixma & Ultee)",
    cjsbc92 = "cur. job: standard classification occupation",
    cjtype = "cur. job: main type of skills in occupation",
    job4 = "present job: management Yes/No (constructed)",
    job5 = "Management # people",
    jobstam = "Start working: month",
    jobstay = "Start working: year",
    retirf1 = "Fut. retirement: now less working hours",
    retirf2 = "Fut. retirement: now more hobbies",
    retirf3 = "Fut. retirement: now volunteering work",
    retirf4 = "Fut. retirement: now administrative work",
    retirf5 = "Fut. retirement: now more holidays",
    retirf6 = "Fut. retirement: other specification"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    cjclass = "cur. job: occupational class SBC92",
    cjlevel = "cur. job: occupational skill-level SBC92",
    cjpresi = "cur. job: occup prestige (Sixma & Ultee)",
    cjsbc92 = "cur. job: standard classification occupation",
    cjtype = "cur. job: main type of skills in occupation",
    job4 = "present job: management Yes/No (constructed)",
    job5 = "Management # people",
    jobstam = "Start working: month",
    jobstay = "Start working: year",
    retirf1 = "Fut. retirement: now less working hours",
    retirf2 = "Fut. retirement: now more hobbies",
    retirf3 = "Fut. retirement: now volunteering work",
    retirf4 = "Fut. retirement: now administrative work",
    retirf5 = "Fut. retirement: now more holidays",
    retirf6 = "Fut. retirement: other specification"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    cjclass = "cur. job: occupational class SBC92",
    cjlevel = "cur. job: occupational skill-level SBC92",
    cjpresi = "cur. job: occup prestige (Sixma & Ultee)",
    cjsbc92 = "cur. job: standard classification occupation",
    cjtype = "cur. job: main type of skills in occupation",
    disabl = "disability insurance act",
    disablp = "disability insurance act: percentage",
    employ = "employment office: registered",
    flclass = "father: last job: occup. class SBC92",
    fllevel = "father: last job: occup. skill-level SBC92",
    flpresi = "father: last job: occup. prestige (Sixma & Ultee)",
    flsbc92 = "father: last job: standard class. occup.",
    fltype = "father: last job: main type of skills",
    job1 = "paid job at present",
    job6 = "current job: hours/week",
    jobl1 = "paid job before (last)",
    jobl6 = "last job: hours/week",
    jobstom = "stopped working: month",
    jobstoy = "stopped working: year",
    nretr = "cur. job: reason no early retirement",
    pcclass = "partner: cur. job: occup. class SBC92",
    pclevel = "partner: cur. job: occup. skill-level SBC92",
    pcpresi = "partner: cur. job: occup. prestige (Sixma & Ultee)",
    pcsbc92 = "partner: cur. job: standard class. occup.",
    pctype = "partner: cur. job: main type of skills",
    pdisabl = "partner: disability insurance act",
    pdisabp = "partner: disability insurance act: percentage",
    pemploy = "partner: employment office: registered",
    pjob1 = "partner: paid job at present",
    pjob6 = "partner: current job: hours/week",
    pjobl1 = "partner: paid job before (last)",
    pjobl6 = "partner: last job: hours/week",
    pjobstm = "partner: stopped working: month",
    pjobsty = "partner: stopped working: year",
    plclass = "partner: last job: occup. class SBC92",
    pllevel = "partner: last job: occup. skill-level SBC92",
    plpresi = "partner: last job: occup. prestige (Sixma & Ultee)",
    plsbc92 = "partner: last job: standard class. occup.",
    pltype = "partner: last job: main type of skills",
    pretifu = "partner: future retirement: anticipation",
    pretire = "partner: (partial) early retirement",
    retfin = "cur. job: consider retirement (financial possible)",
    retifut = "future retirement: anticipation",
    retired = "(partial) early retirement",
    retnfr = "cur. job: reason no full early retirement",
    retreas = "stopped working: reason (partial) early retirement",
    retyr = "cur. job: reason (partial) early retirement",
    rlclass = "last job: occupational class SBC92",
    rllevel = "last job: occupational skill-level SBC92",
    rlpresi = "last job: occup. prestige (Sixma & Ultee)",
    rlsbc92 = "last job: standard classification occupation",
    rltype = "last job: main type of skills in occupation",
    work65 = "cur. job: practise until 65"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    cjclass = "cur. job: occupational class SBC92",
    cjlevel = "cur. job: occupational skill-level SBC92",
    cjpresi = "cur. job: occup prestige (Sixma & Ultee)",
    cjsbc92 = "cur. job: standard classification occupation",
    cjtype = "cur. job: main type of skills in occupation",
    job4 = "present job: management Yes/No (constructed)",
    job5 = "Management # people",
    jobstam = "Start working: month",
    jobstay = "Start working: year",
    retirf1 = "Fut. retirement: now less working hours",
    retirf2 = "Fut. retirement: now more hobbies",
    retirf3 = "Fut. retirement: now volunteering work",
    retirf4 = "Fut. retirement: now administrative work",
    retirf5 = "Fut. retirement: now more holidays",
    retirf6 = "Fut. retirement: other specification"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    cjclass = "cur. job: occupational class SBC92",
    cjlevel = "cur. job: occupational skill-level SBC92",
    cjpresi = "cur. job: occup prestige (Sixma & Ultee)",
    cjsbc92 = "cur. job: standard classification occupation",
    cjtype = "cur. job: main type of skills in occupation",
    job4 = "present job: management Yes/No (constructed)",
    job5 = "Management # people",
    jobstam = "Start working: month",
    jobstay = "Start working: year",
    retirf1 = "Fut. retirement: now less working hours",
    retirf2 = "Fut. retirement: now more hobbies",
    retirf3 = "Fut. retirement: now volunteering work",
    retirf4 = "Fut. retirement: now administrative work",
    retirf5 = "Fut. retirement: now more holidays",
    retirf6 = "Fut. retirement: other specification"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    cjclass = "current job: occupational class SBC 92",
    cjlevel = "current job: occupational skill-level SBC 92",
    cjsbc = "current job: standard classification occupation (SBC 2010)",
    cjtype = "current job: occupational skill-level SBC 92",
    job4 = "present job: management",
    job5 = "Present job: management # people",
    pjob5 = "Partner: present job: management # people",
    retivol = "(partial) Early retirement voluntarily"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    cjclass = "current job: occupational class SBC92",
    cjlevel = "current job: occupational skill-level SBC92",
    cjsbc = "current job: standard classification occupation (SBC 2010)",
    cjtype = "current job: main type of skills in occupation",
    disabl = "disability insurance act",
    disablp = "disability insurance act: percentage",
    employ = "employment office: registered",
    jlstam = "last job: start working: month",
    jlstay = "last job: start working year",
    job3 = "present job: type",
    job3a = "present job: level work activities",
    job4 = "present job: management",
    job5 = "present job: management: number of people",
    job5a = "present job: management: more than half of the time",
    job5b = "present job: management: financial responsibility",
    job6 = "present job: hours/week",
    job7 = "present job: regularity",
    jobl1 = "paid job before (last)",
    jobl3 = "last job: type",
    jobl3a = "last job: level work activities",
    jobl4 = "last job: management",
    jobl5 = "last job: management: number of people",
    jobl5a = "last job: management: more than half of the time",
    jobl5b = "last job: management: financial responsibility",
    jobl6 = "last job: hours/week",
    jobl7 = "last job: regularity",
    jobstam = "present job: start working: month",
    jobstay = "present job: start working: year",
    jobstom = "last job: stopped working: month",
    jobstoy = "last job: stopped working: year",
    nretr = "reason no early retirement",
    pcclass = "partner: current job: occupational class SBC92",
    pclevel = "partner: current job: occupational skill-level SBC92",
    pcsbc = "partner: current job: standard classification occupation (SBC 2010)",
    pctype = "partner: current job: main type of skills in occupation",
    pdisabl = "partner: disability insurance act",
    pdisabp = "partner: disability insurance act: percentage",
    pemploy = "partner: employment office: registered",
    pjdata = "job data partner about current or former partner",
    pjlstam = "partner: last job: start working: month",
    pjlstay = "partner: last job: start working year",
    pjob1 = "partner: paid job at present",
    pjob3 = "partner: present job: type",
    pjob3a = "partner: present job: level work activities",
    pjob4 = "partner: present job: management",
    pjob5 = "partner: present job: management: number of people",
    pjob5a = "partner: present job: management: more than half of the time",
    pjob5b = "partner: present job: management: financial responsibility",
    pjob6 = "partner: present job: hours/week",
    pjob7 = "partner: present job: regularity",
    pjobl1 = "partner: paid job before (last)",
    pjobl3 = "partner: last job: type",
    pjobl3a = "partner: last job: level work activities",
    pjobl4 = "partner: last job: management",
    pjobl5 = "partner: last job: management: number of people",
    pjobl5a = "partner: last job: management: more than half of the time",
    pjobl5b = "partner: last job: management: financial responsibility",
    pjobl6 = "partner: last job: hours/week",
    pjobl7 = "partner: last job: regularity",
    pjobstm = "last job: stopped working: month",
    pjobsty = "partner: last job: stopped working: year",
    pjstam = "partner: present job: start working: month",
    pjstay = "partner: present job: start working: year",
    plclass = "partner: last job: occupational class SBC92",
    pllevel = "partner: last job: occupational skill-level SBC92",
    plsbc = "partner: last job: standard classification occupation (SBC 2010)",
    pltype = "partner: last job: main type of skills in occupation",
    pretire = "partner: (partial) early retirement",
    retired = "(partial) early retirement",
    retnfr = "reason no full early retirement",
    retnfr2 = "would be reason no full early retirement",
    retreas = "stopped working: reason (partial) early retirement",
    retyr = "future: reason (partial) early retirement",
    rlclass = "last job: occupational class SBC92",
    rllevel = "last job: occupational skill-level SBC92",
    rlsbc = "last job: standard classification occupation (SBC 2010)",
    rltype = "last job: main type of skills in occupation",
    work65 = "present job: practise until 65"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    disabl = "disability insurance act",
    disablp = "disability insurance act: percentage",
    employ = "employment office: registered",
    jlstam = "last job: start working: month",
    jlstay = "last job: start working year",
    job1 = "paid job at present",
    job3 = "present job: type",
    job3a = "present job: level work activities",
    job4 = "present job: management",
    job5 = "present job: management: number of people",
    job5a = "present job: management: more than half of the time",
    job6 = "present job: hours/week",
    job7 = "present job: regularity",
    jobl1 = "paid job before (last)",
    jobl3 = "last job: type",
    jobl3a = "last job: level work activities",
    jobl4 = "last job: management",
    jobl5 = "last job: management: number of people",
    jobl5a = "last job: management: more than half of the time",
    jobl6 = "last job: hours/week",
    jobl7 = "last job: regularity",
    jobstam = "present job: start working: month",
    jobstay = "present job: start working: year",
    jobstom = "last job: stopped working: month",
    jobstoy = "last job: stopped working: year",
    pdisabl = "partner: disability insurance act",
    pdisabp = "partner: disability insurance act: percentage",
    pemploy = "partner: employment office: registered",
    pjob1 = "partner: paid job at present",
    pjob3 = "partner: present job: type",
    pjob3a = "partner: present job: level work activities",
    pjob4 = "partner: present job: management",
    pjob5 = "partner: present job: management: number of people",
    pjob5a = "partner: present job: management: more than half of the time",
    pjob6 = "partner: present job: hours/week",
    pjob7 = "partner: present job: regularity",
    pjobl1 = "partner: paid job before (last)",
    pjobl3 = "partner: last job: type",
    pjobl3a = "partner: last job: level work activities",
    pjobl4 = "partner: last job: management",
    pjobl5 = "partner: last job: management: number of people",
    pjobl5a = "partner: last job: management: more than half of the time",
    pjobl6 = "partner: last job: hours/week",
    pjobl7 = "partner: last job: regularity",
    pjobstm = "last job: stopped working: month",
    pjobsty = "partner: last job: stopped working: year",
    pjstam = "partner: present job: start working: month",
    pjstay = "partner: present job: start working: year",
    retired = "(partial) early retirement",
    workret = "present job: practise until retirement age"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    cjclass = "current job: occupational class SBC92",
    cjlevel = "current job: occupational skill-level SBC92",
    cjsbc = "current job: standard classification occupation (SBC 2010)",
    cjtype = "current job: main type of skills in occupation",
    disabl = "disability insurance act",
    disablp = "disability insurance act: percentage",
    employ = "employment office: registered",
    job1 = "paid job at present",
    job3 = "present job: type",
    job3a = "present job: level work activities",
    job4 = "present job: management",
    job5 = "present job: management: number of people",
    job5a = "present job: management: more than half of the time",
    job5b = "present job: management: financial responsibility",
    job6 = "present job: hours/week",
    job7 = "present job: regularity",
    jobc = "paid job, changed",
    jobs = "present job: same job as in last interview",
    jobstam = "present job: start working: month",
    jobstay = "present job: start working: year",
    jobstom = "stopped working: month",
    jobstoy = "stopped working: year",
    pcjclass = "partner: current job: occupational class SBC 92",
    pcjlevel = "partner: current job: occupational skill-level SBC 92",
    pcjsbc = "partner: current job: standard classification occupation (SBC 2010)",
    pcjtype = "partner: current job: main type of skills in occupation",
    pjob1 = "partner: paid job at present",
    pjob3 = "partner: present job: type",
    pjob3a = "partner: present job: level work activities",
    pjob4 = "partner: present job: management",
    pjob5 = "partner: present job: management: number of people",
    pjob5a = "partner: present job: management: more than half of the time",
    pjob5b = "partner: present job: management: financial responsibility",
    pjob6 = "partner: present job: hours/week",
    pjob7 = "partner: present job: regularity",
    pjobc = "partner: paid job, changed",
    pjobs = "partner: present job: same job as in last interview",
    pjstam = "partner: present job: start working: month",
    pjstay = "partner: present job: start working: year",
    retired = "(partial) early retirement",
    workret = "present job: practise until retirement age (66y)"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    abstot = "absence: total number of times in past 12 months",
    abswd = "absence: on working days in past 12 months",
    cjclass = "current job: occupational class SBC92",
    cjlevel = "current job: occupational skill-level SBC92",
    cjsbc = "current job: standard classification occupation (SBC 2010)",
    cjtype = "current job: main type of skills in occupation (SBC 92)",
    disabl = "disability insurance act",
    disablp = "disability insurance act: percentage",
    employ = "employment office: registered",
    eretfin = "early retirement if made financially possible",
    fretage = "preferred age at full retirement",
    healthp = "present job: productivity influenced by health problem(s) past 7 days",
    job1 = "paid job at present",
    job3 = "present job: type",
    job3a = "present job: level work activities",
    job4 = "present job: management",
    job5 = "present job: management: number of people",
    job5a = "present job: management: more than half of the time",
    job5b = "present job: management: financial responsibility",
    job6c = "present job: hours/week on contract",
    job6r = "present job: hours/week in reality",
    job7 = "present job: regularity",
    jobc = "paid job, changed",
    jobs = "present job: same job as in last interview",
    jobstam = "present job: start working: month",
    jobstar01 = "reason start new job: I need the income",
    jobstar02 = "reason start new job: I enjoy this job",
    jobstar03 = "reason start new job: I value contact with other people",
    jobstar04 = "reason start new job: I want something to do",
    jobstar05 = "reason start new job: other reason",
    jobstar06 = "reason start new job: to stay active",
    jobstar07 = "reason start new job: on request",
    jobstar08 = "reason start new job: family related factors",
    jobstar09 = "reason start new job: other work related factors",
    jobstay = "present job: start working: year",
    jobstom = "stopped working: month",
    jobstoy = "stopped working: year",
    mability = "present job: ability to meet mental/pshychological demands",
    nretr = "future: reason no early (full) retirement",
    pability = "present job: ability to meet physical demands",
    pcjclass = "partner: current job: occupational class (SBC 92)",
    pcjlevel = "partner: current job: occupational skill-level (SBC 92)",
    pcjsbc = "partner: current job: standard classification occupation (SBC 2010)",
    pcjtype = "partner: current job: main type of skills in occupation (SBC 92)",
    peretfin = "partial early retirement if made financially possible",
    pjob1 = "partner: paid job at present",
    pjob3 = "partner: present job: type",
    pjob3a = "partner: present job: level work activities",
    pjob4 = "partner: present job: management",
    pjob5 = "partner: present job: management: number of people",
    pjob5a = "partner: present job: management: more than half of the time",
    pjob5b = "partner: present job: management: financial responsibility",
    pjob6c = "partner: present job: hours/week on contract",
    pjob6r = "partner: present job: hours/week in reality",
    pjob7 = "partner: present job: regularity",
    pjobc = "partner: paid job, changed",
    pjobs = "partner: present job: same job as in last interview",
    pjstam = "partner: present job: start working: month",
    pjstay = "partner: present job: start working: year",
    prefret = "preference for partial or full retirement",
    pretage = "preferred age at partial retirement",
    pretivol = "partial retirement voluntarily",
    pretreas = "stopped working: reason partial early retirement",
    retage = "preferred retirement age",
    retired = "(partial) retirement",
    retivol = "retirement voluntarily",
    retreas = "stopped working: reason early retirement",
    retyr = "future: reason (partial) early retirement",
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
    workret = "present job: practice until retirement age (67y)"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    abstot = "absence: total number of times in past 12 months",
    abswd = "absence: on working days in past 12 months",
    cjsbc = "current job: standard classification occupation (SBC 2010)",
    disabl = "disability insurance act",
    disablp = "disability insurance act: percentage",
    employ = "employment office: registered",
    eretfin = "early retirement if made financially possible",
    fretage = "preferred age at full retirement",
    healthp = "present job: productivity influenced by health problem(s) past 7 days",
    job3 = "present job: type",
    job3a = "present job: level work activities",
    job4 = "present job: management",
    job5 = "present job: management: number of people",
    job5a = "present job: management: more than half of the time",
    job5b = "present job: management: financial responsibility",
    job6c = "present job: hours/week on contract",
    job6r = "present job: hours/week in reality",
    job7 = "present job: regularity",
    jobc = "paid job, changed",
    jobs = "present job: same job as in last interview",
    jobstam = "present job: start working: month",
    jobstar01 = "reason start new job: I need the income",
    jobstar02 = "reason start new job: I enjoy this job",
    jobstar03 = "reason start new job: I value contact with other people",
    jobstar04 = "reason start new job: I want something to do",
    jobstar05 = "reason start new job: other reason",
    jobstar06 = "reason start new job: to stay active",
    jobstar07 = "reason start new job: on request",
    jobstar08 = "reason start new job: family related factors",
    jobstar09 = "reason start new job: other work related factors",
    jobstay = "present job: start working: year",
    jobstom = "stopped working: month",
    jobstoy = "stopped working: year",
    kob1 = "paid job at present",
    mability = "present job: ability to meet mental/psychological demands",
    nretr01 = "reason no early (full) retirement: sufficient challenges/fun in work",
    nretr02 = "reason no early (full) retirement: maintain social contacts at work",
    nretr03 = "reason no early (full) retirement: other pasttimes less pleasant than work",
    nretr04 = "reason no early (full) retirement: work till retirement age (67y) financially favorable",
    nretr05 = "reason no early (full) retirement: partner works as well",
    nretr06 = "reason no early (full) retirement: loyalty towards employer/colleague",
    pability = "present job: ability to meet physical demands",
    pcjsbc = "partner: current job: standard classification occupation (SBC 2010)",
    peretfin = "partial early retirement if made financially possible",
    pjob1 = "partner: paid job at present",
    pjob3 = "partner: present job: type",
    pjob3a = "partner: present job: level work activities",
    pjob4 = "partner: present job: management",
    pjob5 = "partner: present job: management: number of people",
    pjob5a = "partner: present job: management: more than half of the time",
    pjob5b = "partner: present job: management: financial responsibility",
    pjob6c = "partner: present job: hours/week on contract",
    pjob6r = "partner: present job: hours/week in reality",
    pjob7 = "partner: present job: regularity",
    pjobc = "partner: paid job, changed",
    pjobs = "partner: present job: same job as in last interview",
    pjstam = "partner: present job: start working: month",
    pjstay = "partner: present job: start working: year",
    prefret = "preference for partial or full retirement",
    pretage = "preferred age at partial retirement",
    pretivol = "partial retirement voluntarily",
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
    retage = "preferred retirement age",
    retired = "(partial) retirement",
    retivol = "retirement voluntarily",
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
    workret = "present job: practice until retirement age (67y)"
  ),
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "mentioned",
  `2` = "yes",
  `3` = "medium",
  `4` = "high",
  `5` = "scientific"
)

standardized_value_labels <- list(
  abstot = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  abswd = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  cjclass = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    `0` = "-to be coded-",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
  cjlevel = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    `0` = "-to be coded-",
    `1` = "elementary",
    `2` = "low",
    default_answer_labels[c("3", "4", "5")]
  ),
  cjpresi = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    `0` = "-to be coded-",
    `13` = "NA",
    `87` = "NA"
  ),
  cjsbc = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  cjsbc92 = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    `0` = "-to be coded-"
  ),
  cjtype = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    `0` = "-to be coded-",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
  disabl = c(
    `-5` = "not available, above age threshold",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  disablp = c(
    `-3` = "not available",
    default_missing_labels[c("-2")],
    `-1` = "not available"
  ),
  employ = c(
    `-5` = "not available, above age threshold",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  eretfin = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  flclass = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
  fllevel = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `1` = "elementary",
    `2` = "low",
    default_answer_labels[c("3", "4", "5")]
  ),
  flpresi = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `13` = "NA",
    `87` = "NA"
  ),
  flsbc92 = c(
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-3", "-1")],
    `0` = "-to be coded-"
  ),
  fltype = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
  fretage = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  healthp = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no health problems/productivity not influenced by health problems",
    `10` = "not productive due to health problems"
  ),
  jlstam = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "january",
    `2` = "february",
    `3` = "march",
    `4` = "april",
    `5` = "may",
    `6` = "june",
    `7` = "july",
    `8` = "august",
    `9` = "september",
    `10` = "october",
    `11` = "november",
    `12` = "december"
  ),
  jlstay = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  job1 = c(
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  job3 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other",
    `8` = "0-hours/stand-by contract"
  ),
  job3a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "elementary",
    `2` = "low",
    default_answer_labels[c("3", "4", "5")]
  ),
  job4 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  job5 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `98` = "NA"
  ),
  job5a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  job5b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  job6 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  job6c = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  job6r = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  job7 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "regular hours (9 to 5)",
    `2` = "regular hours, including night/weekend shifts",
    `3` = "shift work, no weekend shifts",
    `4` = "shift work, including weekend shifts",
    `5` = "irregular hours, no weekend shifts",
    `6` = "irregular hours, including weekend shifts"
  ),
  job8 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "yes"
  ),
  jobc = c(
    default_missing_labels[c("-2")],
    `-1` = "never had job, unknown before",
    `0` = "unknown",
    `1` = "no job, not changed",
    `2` = "no job, changed",
    `3` = "no job, unknown before",
    `4` = "job, not changed",
    `5` = "job, changed",
    `6` = "job, unknown before"
  ),
  jobl1 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  jobl3 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
  jobl3a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "elementary",
    `2` = "low",
    default_answer_labels[c("3", "4", "5")]
  ),
  jobl4 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  jobl5 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  jobl5a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  jobl5b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  jobl6 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  jobl7 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "regular hours (9 to 5)",
    `2` = "regular hours, including night/weekend shifts",
    `3` = "shift work, no weekend shifts",
    `4` = "shift work, including weekend shifts",
    `5` = "irregular hours, no weekend shifts",
    `6` = "irregular hours, including weekend shifts"
  ),
  joblo1 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "yes"
  ),
  joblo3 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
  joblo4 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "not available, bjob8 & bjoblo1",
    `0` = "no",
    `1` = "yes"
  ),
  joblo5 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `98` = "NA"
  ),
  joblo6 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  joblo7 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "regular hours (9 to 5)",
    `2` = "regular hours, including night/weekend shifts",
    `3` = "shift work, no weekend shifts",
    `4` = "shift work, including weekend shifts",
    `5` = "irregular hours, no weekend shifts",
    `6` = "irregular hours, including weekend shifts"
  ),
  jobmon = c(
    `-5` = "no answer, info nestor",
    default_missing_labels[c("-3", "-2")],
    `-1` = "do not know",
    `1` = "january",
    `2` = "february",
    `3` = "march",
    `4` = "april",
    `5` = "may",
    `6` = "june",
    `7` = "july",
    `8` = "august",
    `9` = "september",
    `10` = "october",
    `11` = "november",
    `12` = "december"
  ),
  jobs = c(
    default_missing_labels[c("-2")],
    `-1` = "not available, routing",
    `1` = "no",
    `2` = "not sure",
    `3` = "yes"
  ),
  jobstam = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "january",
    `2` = "february",
    `3` = "march",
    `4` = "april",
    `5` = "may",
    `6` = "june",
    `7` = "july",
    `8` = "august",
    `9` = "september",
    `10` = "october",
    `11` = "november",
    `12` = "december"
  ),
  jobstar01 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  jobstar02 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  jobstar03 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  jobstar04 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  jobstar05 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  jobstar06 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  jobstar07 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  jobstar08 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  jobstar09 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  jobstay = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  jobstom = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "january",
    `2` = "february",
    `3` = "march",
    `4` = "april",
    `5` = "may",
    `6` = "june",
    `7` = "july",
    `8` = "august",
    `9` = "september",
    `10` = "october",
    `11` = "november",
    `12` = "december"
  ),
  jobstoy = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  jobyear = c(
    `-5` = "no answer, info nestor",
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "do not know"
  ),
  kob1 = c(
    default_missing_labels[c("-4", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  ljclass = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
  ljlevel = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "not available, bjob8 & bjoblo1",
    `1` = "elementary",
    `2` = "low",
    default_answer_labels[c("3", "4", "5")]
  ),
  ljpresi = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `13` = "NA",
    `87` = "NA"
  ),
  ljsbc92 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "not available, bjob8 & bjoblo1"
  ),
  ljtype = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
  mability = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "very good",
    `2` = "good",
    `3` = "moderate",
    `4` = "bad",
    `5` = "very bad"
  ),
  nretr = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "enough challenges at work",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "label varies by wave",
    `6` = "label varies by wave",
    `7` = "other reason",
    `8` = "partner is still working",
    `9` = "loyalty towards employer/colleagues"
  ),
  nretr01 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  nretr02 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  nretr03 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  nretr04 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  nretr05 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  nretr06 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  pability = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "very good",
    `2` = "good",
    `3` = "moderate",
    `4` = "bad",
    `5` = "very bad"
  ),
  pcclass = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
  pcjclass = c(
    default_missing_labels[c("-2")],
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
  pcjlevel = c(
    default_missing_labels[c("-2")],
    `1` = "elementary",
    `2` = "low",
    default_answer_labels[c("3", "4", "5")]
  ),
  pcjsbc = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  pcjtype = c(
    default_missing_labels[c("-2")],
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
  pclevel = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `1` = "elementary",
    `2` = "low",
    default_answer_labels[c("3", "4", "5")]
  ),
  pcpresi = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `13` = "NA",
    `87` = "NA"
  ),
  pcsbc = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  pcsbc92 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "-to be coded-"
  ),
  pctype = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
  pdisabl = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  pdisabp = c(
    `-3` = "not available, refused",
    default_missing_labels[c("-2", "-1")]
  ),
  pemploy = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  peretfin = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  pjdata = c(`0` = "no partner", `1` = "current partner", `2` = "former partner"),
  pjlstam = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "january",
    `2` = "february",
    `3` = "march",
    `4` = "april",
    `5` = "may",
    `6` = "june",
    `7` = "july",
    `8` = "august",
    `9` = "september",
    `10` = "october",
    `11` = "november",
    `12` = "december"
  ),
  pjlstay = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  pjob1 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available",
    default_missing_labels[c("-3", "-1")],
    `-2` = "negative code -2",
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  pjob3 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other",
    `8` = "0-hours/stand-by contract"
  ),
  pjob3a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "elementary",
    `2` = "low",
    default_answer_labels[c("3", "4", "5")]
  ),
  pjob4 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  pjob5 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  pjob5a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  pjob5b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  pjob6 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  pjob6c = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  pjob6r = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  pjob7 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "regular hours (9 to 5)",
    `2` = "regular hours, including night/weekend shifts",
    `3` = "shift work, no weekend shifts",
    `4` = "shift work, including weekend shifts",
    `5` = "irregular hours, no weekend shifts",
    `6` = "irregular hours, including weekend shifts"
  ),
  pjobc = c(
    default_missing_labels[c("-2")],
    `-1` = "never had job, unknown before",
    `0` = "unknown",
    `1` = "no job, not changed",
    `2` = "no job, changed",
    `3` = "no job, unknown before",
    `4` = "job, not changed",
    `5` = "job, changed",
    `6` = "job, unknown before"
  ),
  pjobl1 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  pjobl3 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
  pjobl3a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "elementary",
    `2` = "low",
    default_answer_labels[c("3", "4", "5")]
  ),
  pjobl4 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  pjobl5 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  pjobl5a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  pjobl5b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  pjobl6 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  pjobl7 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "regular hours (9 to 5)",
    `2` = "regular hours, including night/weekend shifts",
    `3` = "shift work, no weekend shifts",
    `4` = "shift work, including weekend shifts",
    `5` = "irregular hours, no weekend shifts",
    `6` = "irregular hours, including weekend shifts"
  ),
  pjobs = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available, routing",
    `1` = "no",
    `2` = "not sure",
    `3` = "yes"
  ),
  pjobstm = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "january",
    `2` = "february",
    `3` = "march",
    `4` = "april",
    `5` = "may",
    `6` = "june",
    `7` = "july",
    `8` = "august",
    `9` = "september",
    `10` = "october",
    `11` = "november",
    `12` = "december"
  ),
  pjobsty = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  pjstam = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "january",
    `2` = "february",
    `3` = "march",
    `4` = "april",
    `5` = "may",
    `6` = "june",
    `7` = "july",
    `8` = "august",
    `9` = "september",
    `10` = "october",
    `11` = "november",
    `12` = "december"
  ),
  pjstay = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  plclass = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
  pllevel = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `1` = "elementary",
    `2` = "low",
    default_answer_labels[c("3", "4", "5")]
  ),
  plpresi = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `13` = "NA",
    `87` = "NA"
  ),
  plsbc = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  plsbc92 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "-to be coded-"
  ),
  pltype = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
  prefret = c(
    `-5` = "not available, above age threshold",
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "partial retirement first",
    `2` = "full retirement right away",
    `3` = "dont know yet"
  ),
  pretage = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  pretifu = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  pretire = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes, partly",
    `3` = "yes, completely"
  ),
  pretivol = c(
    `-5` = "not available, above age threshold",
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "yes",
    `2` = "no, not (entirely) voluntarily"
  ),
  pretreas = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "stress and pressure of work too high",
    `2` = "other work related factors (organisational changes/conflicts)",
    `3` = "physically too heavy",
    `4` = "health complaints too hampering",
    `5` = "afraid of deterioration of health",
    `6` = "not motivated anymore/lost interest",
    `7` = "more enjoyable to spend more time on private life",
    `8` = "enjoy life as long as health permits",
    `9` = "not possible anymore in the future",
    `10` = "other reason",
    `11` = "reached official retirement age",
    `12` = "financial benefit",
    `13` = "more time needed for activities outside work"
  ),
  pretreas01 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  pretreas02 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  pretreas03 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  pretreas04 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  pretreas05 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  pretreas06 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  pretreas07 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  pretreas08 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  pretreas09 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  pretreas10 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  pretreas11 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  pretreas12 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  pretreas13 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retage = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  retfin = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  retifut = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  retired = c(
    `-5` = "not available, above age threshold",
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "yes, completely"
  ),
  retirf1 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retirf2 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retirf3 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retirf4 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retirf5 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retirf6 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retivol = c(
    `-5` = "not available, above age threshold",
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "yes, retired but not entirely voluntarily"
  ),
  retnfr = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "enough challenges at work",
    `2` = "maintain social contacts",
    `3` = "other pastime less pleasant",
    `4` = "label varies by wave",
    `5` = "label varies by wave",
    `6` = "should work on to have adequate pension",
    `7` = "other reason"
  ),
  retnfr2 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "enough challenges at work",
    `2` = "maintain social contacts",
    `3` = "other pastime less pleasant",
    `4` = "no possibility for early retirement",
    `5` = "financially more favourable",
    `6` = "should work on to have adequate pension",
    `7` = "other reason"
  ),
  retreas = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "stress and pressure of work too high",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "label varies by wave",
    `6` = "label varies by wave",
    `7` = "label varies by wave",
    `8` = "enjoy life as long as health permits",
    `9` = "not possible anymore in the future",
    `10` = "other reason",
    `11` = "reached official retirement age",
    `12` = "financial benefit",
    `13` = "more time needed for activities outside work"
  ),
  retreas01 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retreas02 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retreas03 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retreas04 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retreas05 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retreas06 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retreas07 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retreas08 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retreas09 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retreas10 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retreas11 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retreas12 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retreas13 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retyr = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "stress and pressure of work too high",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "label varies by wave",
    `6` = "label varies by wave",
    `7` = "label varies by wave",
    `8` = "enjoy life as long as health permits",
    `9` = "not possible anymore in the future",
    `10` = "other reason",
    `11` = "more freedom, less obligations",
    `12` = "family related factors",
    `13` = "partner is retired/is going to retire",
    `14` = "commute is burdensome"
  ),
  retyr01 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retyr02 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retyr03 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retyr04 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retyr05 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retyr06 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retyr07 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retyr08 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retyr09 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  retyr10 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rjobchange01 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rjobchange02 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rjobchange03 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rjobchange04 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rjobchange05 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rjobchange06 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rjobchange07 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rjobchange08 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rjobchange09 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rjobchange10 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rjobchange11 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rjobchange12 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rjobchange13 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  rlclass = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
  rllevel = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `1` = "elementary",
    `2` = "low",
    default_answer_labels[c("3", "4", "5")]
  ),
  rlpresi = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `13` = "NA",
    `87` = "NA"
  ),
  rlsbc = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  rlsbc92 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "-to be coded-"
  ),
  rltype = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "unknown",
    `0` = "-to be coded-",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
  tasks = c(
    default_missing_labels[c("-3")],
    `-2` = "negative code -2",
    `-1` = "negative code -1",
    `3` = "both mentally and physically demanding tasks"
  ),
  wjobchange = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "me",
    `2` = "my employer",
    `3` = "i switched employers"
  ),
  work65 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no, i do not think so",
    `2` = "i am sometimes not sure about this",
    `3` = "yes, i do think so"
  ),
  workret = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no, i do not think so",
    `2` = "label varies by wave",
    `3` = "yes, i do think so"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    cjclass = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1",
    `-1` = "na, asked",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
    cjlevel = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1",
    `-1` = "na, asked",
    `1` = "elementary",
    `2` = "low",
    `3` = "medium",
    `4` = "high",
    `5` = "scientific"
  ),
    cjpresi = c(`-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `13` = "NA", `87` = "NA"),
    cjsbc92 = c(`-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked"),
    cjtype = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1",
    `-1` = "na, asked",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
    disabl = c(
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `0` = "no",
    `1` = "yes"
  ),
    disablp = .replace_labels(
    standardized_value_labels$disablp,
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "do not know"
  ),
    employ = c(
    `-4` = "no answer, short version",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `0` = "no",
    `1` = "yes"
  ),
    job1 = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    job3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    job4 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    job5 = .replace_labels(
    standardized_value_labels$job5,
    `-2` = "na, see BJOB1"
  ),
    job6 = .replace_labels(
    standardized_value_labels$job6,
    `-2` = "na, see BJOB1"
  ),
    job7 = .replace_labels(
    standardized_value_labels$job7,
    `-2` = "na, see BJOB1"
  ),
    job8 = .replace_labels(
    standardized_value_labels$job8,
    `-2` = "na, see BJOB1"
  ),
    joblo1 = .replace_labels(
    standardized_value_labels$joblo1,
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    joblo3 = .replace_labels(
    standardized_value_labels$joblo3,
    `-2` = "na, see BJOB8 & BJOBLO1"
  ),
    joblo4 = .replace_labels(
    standardized_value_labels$joblo4,
    `-2` = "na, BJOB8 & BJOBLO1"
  ),
    joblo5 = .replace_labels(
    standardized_value_labels$joblo5,
    `-2` = "na, see BJOB8 & BJOBLO1"
  ),
    joblo6 = .replace_labels(
    standardized_value_labels$joblo6,
    `-2` = "na, see BJOB8 & BJOBLO1"
  ),
    joblo7 = .replace_labels(
    standardized_value_labels$joblo7,
    `-2` = "na, see BJOB8 & BJOBLO1"
  ),
    jobmon = .replace_labels(
    standardized_value_labels$jobmon,
    `-5` = "no answer, info NESTOR",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobyear = .replace_labels(
    standardized_value_labels$jobyear,
    `-5` = "no answer, info NESTOR",
    `-3` = "no answer, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked"
  ),
    ljclass = .replace_labels(
    standardized_value_labels$ljclass,
    `-2` = "na, see BJOB8 & BJOBLO1"
  ),
    ljlevel = .replace_labels(
    standardized_value_labels$ljlevel,
    `-2` = "na, BJOB8 & BJOBLO1"
  ),
    ljpresi = .replace_labels(
    standardized_value_labels$ljpresi,
    `-2` = "na, see BJOB8 & BJOBLO1"
  ),
    ljsbc92 = .replace_labels(
    standardized_value_labels$ljsbc92,
    `-2` = "na, BJOB8 & BJOBLO1"
  ),
    ljtype = .replace_labels(
    standardized_value_labels$ljtype,
    `-2` = "na, see BJOB8 & BJOBLO1"
  ),
    retifut = c(
    `-4` = "no answer, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRETIRED",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    retired = c(
    `-5` = "na, Age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, partly",
    `2` = "yes, completely"
  ),
    retirf1 = .replace_labels(
    standardized_value_labels$retirf1,
    `-2` = "na, see BRETIFUT"
  ),
    retirf2 = .replace_labels(
    standardized_value_labels$retirf2,
    `-2` = "na, see BRETIFUT"
  ),
    retirf3 = .replace_labels(
    standardized_value_labels$retirf3,
    `-2` = "na, see BRETIFUT"
  ),
    retirf4 = .replace_labels(
    standardized_value_labels$retirf4,
    `-2` = "na, see BRETIFUT"
  ),
    retirf5 = .replace_labels(
    standardized_value_labels$retirf5,
    `-2` = "na, see BRETIFUT"
  ),
    retirf6 = .replace_labels(
    standardized_value_labels$retirf6,
    `-2` = "na, see BRETIFUT"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    cjclass = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
    cjlevel = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `1` = "elementary",
    `2` = "low",
    `3` = "medium",
    `4` = "high",
    `5` = "scientific"
  ),
    cjpresi = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `13` = "NA",
    `87` = "NA"
  ),
    cjsbc92 = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GJOB1", `-1` = "na, asked"),
    cjtype = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
    disabl = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    disablp = c(`-2` = "na, see C/D/E/F/GDISABL", `-1` = "na, asked"),
    employ = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    job1 = c(`-4` = "na, short version", `1` = "no", `2` = "yes"),
    job3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    job4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    job5 = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GJOB4", `-1` = "na, asked"),
    job6 = .replace_labels(
    standardized_value_labels$job6,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    job7 = .replace_labels(
    standardized_value_labels$job7,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    jobc = c(
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "never had job, unknown before",
    `1` = "no job, not changed",
    `2` = "no job, changed",
    `3` = "no job, unknown before",
    `4` = "job, not changed",
    `5` = "job, changed",
    `6` = "job, unknown before"
  ),
    jobstam = c(
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstay = c(`-2` = "na, see C/D/E/F/GJOBC", `-1` = "na, asked"),
    jobstom = .replace_labels(
    standardized_value_labels$jobstom,
    `-3` = "na wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstoy = .replace_labels(
    standardized_value_labels$jobstoy,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    retifut = c(`-2` = "na, see C/D/E/F/GRETIRED", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    retired = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, partly",
    `3` = "yes, completely"
  ),
    retirf1 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf2 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf3 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf4 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf5 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf6 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    cjclass = .replace_labels(
    standardized_value_labels$cjclass,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked / not classified",
    `0` = "- to be coded -"
  ),
    cjlevel = .replace_labels(
    standardized_value_labels$cjlevel,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked / not classified",
    `0` = "- to be coded -"
  ),
    cjpresi = .replace_labels(
    standardized_value_labels$cjpresi,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked / not classified",
    `0` = "- to be coded -"
  ),
    cjsbc92 = .replace_labels(
    standardized_value_labels$cjsbc92,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `0` = "- to be coded -"
  ),
    cjtype = .replace_labels(
    standardized_value_labels$cjtype,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked / not classified",
    `0` = "- to be coded -"
  ),
    disabl = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    disablp = c(`-2` = "na, see C/D/E/F/GDISABL", `-1` = "na, asked"),
    employ = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    job1 = c(`-4` = "na, short version", `1` = "no", `2` = "yes"),
    job3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    job4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    job5 = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GJOB4", `-1` = "na, asked"),
    job6 = .replace_labels(
    standardized_value_labels$job6,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    job7 = .replace_labels(
    standardized_value_labels$job7,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    jobc = c(
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "never had job, unknown before",
    `1` = "no job, not changed",
    `2` = "no job, changed",
    `3` = "no job, unknown before",
    `4` = "job, not changed",
    `5` = "job, changed",
    `6` = "job, unknown before"
  ),
    jobstam = c(
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstay = c(`-2` = "na, see C/D/E/F/GJOBC", `-1` = "na, asked"),
    jobstom = .replace_labels(
    standardized_value_labels$jobstom,
    `-3` = "na wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstoy = .replace_labels(
    standardized_value_labels$jobstoy,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    retifut = c(`-2` = "na, see C/D/E/F/GRETIRED", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    retired = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, partly",
    `3` = "yes, completely"
  ),
    retirf1 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf2 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf3 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf4 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf5 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf6 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    cjclass = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na asked, not classified",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
    cjlevel = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked / not classified",
    `1` = "elementary",
    `2` = "low",
    `3` = "medium",
    `4` = "high",
    `5` = "scientific"
  ),
    cjpresi = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked / not classified",
    `13` = "NA",
    `87` = "NA"
  ),
    cjsbc92 = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GJOB1", `-1` = "na, asked"),
    cjtype = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked / not classified",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
    disabl = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    disablp = c(`-2` = "na, see C/D/E/F/GDISABL", `-1` = "na, asked"),
    employ = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    job1 = c(`-4` = "na, short version", `1` = "no", `2` = "yes"),
    job3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    job4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    job5 = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GJOB4", `-1` = "na, asked"),
    job6 = .replace_labels(
    standardized_value_labels$job6,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    job7 = .replace_labels(
    standardized_value_labels$job7,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    jobc = c(
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "never had job, unknown before",
    `1` = "no job, not changed",
    `2` = "no job, changed",
    `3` = "no job, unknown before",
    `4` = "job, not changed",
    `5` = "job, changed",
    `6` = "job, unknown before"
  ),
    jobstam = c(
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstay = .replace_labels(
    standardized_value_labels$jobstay,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    jobstom = .replace_labels(
    standardized_value_labels$jobstom,
    `-3` = "na wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstoy = .replace_labels(
    standardized_value_labels$jobstoy,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    retifut = c(`-2` = "na, see C/D/E/F/GRETIRED", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    retired = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, partly",
    `3` = "yes, completely"
  ),
    retirf1 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf2 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf3 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf4 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf5 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf6 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    cjclass = .replace_labels(
    standardized_value_labels$cjclass,
    `-2` = "na, see BCJSBC92",
    `-1` = "unknown",
    `0` = "- to be coded -"
  ),
    cjlevel = .replace_labels(
    standardized_value_labels$cjlevel,
    `-2` = "na, see BCJSBC92",
    `-1` = "unknown",
    `0` = "- to be coded -"
  ),
    cjpresi = .replace_labels(
    standardized_value_labels$cjpresi,
    `-2` = "na, see BCJSBC92",
    `-1` = "unknown",
    `0` = "- to be coded -"
  ),
    cjsbc92 = .replace_labels(
    standardized_value_labels$cjsbc92,
    `-2` = "na, see BJOB1",
    `-1` = "na, asked",
    `0` = "- to be coded -"
  ),
    cjtype = .replace_labels(
    standardized_value_labels$cjtype,
    `-2` = "na, see BCJSBC92",
    `-1` = "unknown",
    `0` = "- to be coded -"
  ),
    disabl = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1 & BJOBL1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    disablp = c(`-2` = "na, see BDISABL", `-1` = "na, asked"),
    employ = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    flclass = .replace_labels(
    standardized_value_labels$flclass,
    `-2` = "na, see BFLSBC92",
    `0` = "- to be coded -"
  ),
    fllevel = .replace_labels(
    standardized_value_labels$fllevel,
    `-2` = "na, see BFLSBC92",
    `0` = "- to be coded -"
  ),
    flpresi = .replace_labels(
    standardized_value_labels$flpresi,
    `-2` = "na, see BFLSBC92",
    `0` = "- to be coded -"
  ),
    flsbc92 = .replace_labels(
    standardized_value_labels$flsbc92,
    `-5` = "na, interview terminated",
    `0` = "- to be coded -"
  ),
    fltype = .replace_labels(
    standardized_value_labels$fltype,
    `-2` = "na, see BFLSBC92",
    `0` = "- to be coded -"
  ),
    job1 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    job6 = .replace_labels(
    standardized_value_labels$job6,
    `-2` = "na, see BJOB1"
  ),
    jobl1 = .replace_labels(
    standardized_value_labels$jobl1,
    `-2` = "na, see BJOB1"
  ),
    jobl6 = .replace_labels(
    standardized_value_labels$jobl6,
    `-2` = "na, see BJOBL1"
  ),
    jobstom = .replace_labels(
    standardized_value_labels$jobstom,
    `-3` = "na wrong skip",
    `-2` = "na, see BJOBL1",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstoy = .replace_labels(
    standardized_value_labels$jobstoy,
    `-2` = "na, see BJOBL1"
  ),
    nretr = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRETFIN",
    `-1` = "na, asked",
    `1` = "enough challenges at work",
    `2` = "maintain social contacts",
    `3` = "other pastime less pleasant",
    `4` = "financially more favourable",
    `5` = "other reason"
  ),
    pcclass = .replace_labels(
    standardized_value_labels$pcclass,
    `-2` = "na, see BPCSBC92",
    `0` = "- to be coded -"
  ),
    pclevel = .replace_labels(
    standardized_value_labels$pclevel,
    `-2` = "na, see BPCSBC92",
    `0` = "- to be coded -"
  ),
    pcpresi = .replace_labels(
    standardized_value_labels$pcpresi,
    `-2` = "na, see BPCSBC92",
    `0` = "- to be coded -"
  ),
    pcsbc92 = .replace_labels(
    standardized_value_labels$pcsbc92,
    `-2` = "na, see BPJOB1",
    `0` = "- to be coded -"
  ),
    pctype = .replace_labels(
    standardized_value_labels$pctype,
    `-2` = "na, see BPCSBC92",
    `0` = "- to be coded -"
  ),
    pdisabl = .replace_labels(
    standardized_value_labels$pdisabl,
    `-2` = "na, see BPJOB1 & BPJOBL1"
  ),
    pdisabp = c(`-2` = "na, see BPDISABL", `-1` = "na, asked"),
    pemploy = .replace_labels(
    standardized_value_labels$pemploy,
    `-2` = "na, see BPJOB1"
  ),
    pjob1 = c(
    `-5` = "na, interview terminated",
    `-4` = "na, no household partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    pjob6 = .replace_labels(
    standardized_value_labels$pjob6,
    `-2` = "na, see BPJOB1"
  ),
    pjobl1 = .replace_labels(
    standardized_value_labels$pjobl1,
    `-2` = "na, see BPJOB1"
  ),
    pjobl6 = .replace_labels(
    standardized_value_labels$pjobl6,
    `-2` = "na, see BPJOBL1"
  ),
    pjobstm = .replace_labels(
    standardized_value_labels$pjobstm,
    `-3` = "na wrong skip",
    `-2` = "na, see BPJOBL1",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    pjobsty = .replace_labels(
    standardized_value_labels$pjobsty,
    `-2` = "na, see BPJOBL1"
  ),
    plclass = .replace_labels(
    standardized_value_labels$plclass,
    `-2` = "na, see BPLSBC92",
    `0` = "- to be coded -"
  ),
    pllevel = .replace_labels(
    standardized_value_labels$pllevel,
    `-2` = "na, see BPLSBC92",
    `0` = "- to be coded -"
  ),
    plpresi = .replace_labels(
    standardized_value_labels$plpresi,
    `-2` = "na, see BPLSBC92",
    `0` = "- to be coded -"
  ),
    plsbc92 = .replace_labels(
    standardized_value_labels$plsbc92,
    `-2` = "na, see BPJOB1",
    `0` = "- to be coded -"
  ),
    pltype = .replace_labels(
    standardized_value_labels$pltype,
    `-2` = "na, see BPLSBC92",
    `0` = "- to be coded -"
  ),
    pretifu = .replace_labels(
    standardized_value_labels$pretifu,
    `-2` = "na, see BRETIRE"
  ),
    pretire = .replace_labels(
    standardized_value_labels$pretire,
    `-2` = "na, see BPJOB1 & BPJOBL1"
  ),
    retfin = .replace_labels(
    standardized_value_labels$retfin,
    `-2` = "na, see BRETIRED & BJOB6"
  ),
    retifut = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRETIRED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    retired = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1 & BJOBL1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, partly",
    `3` = "yes, completely"
  ),
    retnfr = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRETFIN",
    `-1` = "na, asked",
    `1` = "enough challenges at work",
    `2` = "maintain social contacts",
    `3` = "other pastime less pleasant",
    `4` = "financially more favourable",
    `5` = "other reason"
  ),
    retreas = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRETIRED",
    `-1` = "na, asked",
    `1` = "stress and pressure of work too high",
    `2` = "physically too heavy",
    `3` = "health complaints too hampering",
    `4` = "not motivated anymore",
    `5` = "nicer to spend more time on private life",
    `6` = "not possible anymore in the future",
    `7` = "other reason"
  ),
    retyr = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRETFIN",
    `-1` = "na, asked",
    `1` = "stress and pressure of work too high",
    `2` = "physically too heavy",
    `3` = "health complaints too hampering",
    `4` = "not motivated anymore",
    `5` = "nicer to spend more time on private life",
    `6` = "not possible anymore in the future",
    `7` = "other reason"
  ),
    rlclass = .replace_labels(
    standardized_value_labels$rlclass,
    `-2` = "na, see BRLSBC92",
    `0` = "- to be coded -"
  ),
    rllevel = .replace_labels(
    standardized_value_labels$rllevel,
    `-2` = "na, see BRLSBC92",
    `0` = "- to be coded -"
  ),
    rlpresi = .replace_labels(
    standardized_value_labels$rlpresi,
    `-2` = "na, see BRLSBC92",
    `0` = "- to be coded -"
  ),
    rlsbc92 = .replace_labels(
    standardized_value_labels$rlsbc92,
    `-2` = "na, see BJOB1",
    `0` = "- to be coded -"
  ),
    rltype = .replace_labels(
    standardized_value_labels$rltype,
    `-2` = "na, see BRLSBC92",
    `0` = "- to be coded -"
  ),
    work65 = .replace_labels(
    standardized_value_labels$work65,
    `-2` = "na, see BRETIRED & BJOB6",
    `1` = "no, I do not think so",
    `2` = "I am sometimes not sure about this",
    `3` = "yes, I do think so"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    cjclass = .replace_labels(
    standardized_value_labels$cjclass,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `0` = "- to be coded -"
  ),
    cjlevel = .replace_labels(
    standardized_value_labels$cjlevel,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `0` = "- to be coded -"
  ),
    cjpresi = .replace_labels(
    standardized_value_labels$cjpresi,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `0` = "- to be coded -"
  ),
    cjsbc92 = .replace_labels(
    standardized_value_labels$cjsbc92,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `0` = "- to be coded -"
  ),
    cjtype = .replace_labels(
    standardized_value_labels$cjtype,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `0` = "- to be coded -"
  ),
    disabl = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    disablp = c(`-2` = "na, see C/D/E/F/GDISABL", `-1` = "na, asked"),
    employ = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    job1 = c(`-4` = "na, short version", `1` = "no", `2` = "yes"),
    job3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    job4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    job5 = .replace_labels(
    standardized_value_labels$job5,
    `-2` = "na, see C/D/E/F/GJOB4"
  ),
    job6 = .replace_labels(
    standardized_value_labels$job6,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    job7 = .replace_labels(
    standardized_value_labels$job7,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    jobc = c(
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "never had job, unknown before",
    `1` = "no job, not changed",
    `2` = "no job, changed",
    `3` = "no job, unknown before",
    `4` = "job, not changed",
    `5` = "job, changed",
    `6` = "job, unknown before"
  ),
    jobstam = .replace_labels(
    standardized_value_labels$jobstam,
    `-3` = "na wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstay = .replace_labels(
    standardized_value_labels$jobstay,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    jobstom = .replace_labels(
    standardized_value_labels$jobstom,
    `-3` = "na wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstoy = .replace_labels(
    standardized_value_labels$jobstoy,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    retifut = c(`-2` = "na, see C/D/E/F/GRETIRED", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    retired = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, partly",
    `3` = "yes, completely"
  ),
    retirf1 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf2 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf3 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf4 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf5 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf6 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    cjclass = .replace_labels(
    standardized_value_labels$cjclass,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `0` = "- to be coded -"
  ),
    cjlevel = .replace_labels(
    standardized_value_labels$cjlevel,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `0` = "- to be coded -"
  ),
    cjpresi = .replace_labels(
    standardized_value_labels$cjpresi,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `0` = "- to be coded -"
  ),
    cjsbc92 = .replace_labels(
    standardized_value_labels$cjsbc92,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `0` = "- to be coded -"
  ),
    cjtype = .replace_labels(
    standardized_value_labels$cjtype,
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "na, asked",
    `0` = "- to be coded -"
  ),
    disabl = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    disablp = c(`-2` = "na, see C/D/E/F/GDISABL", `-1` = "na, asked"),
    employ = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    job1 = c(`-4` = "na, short version", `1` = "no", `2` = "yes"),
    job3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    job4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    job5 = .replace_labels(
    standardized_value_labels$job5,
    `-2` = "na, see C/D/E/F/GJOB4"
  ),
    job6 = .replace_labels(
    standardized_value_labels$job6,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    job7 = .replace_labels(
    standardized_value_labels$job7,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    jobc = c(
    `-2` = "na, see C/D/E/F/GJOB1",
    `-1` = "never had job, unknown before",
    `1` = "no job, not changed",
    `2` = "no job, changed",
    `3` = "no job, unknown before",
    `4` = "job, not changed",
    `5` = "job, changed",
    `6` = "job, unknown before"
  ),
    jobstam = .replace_labels(
    standardized_value_labels$jobstam,
    `-3` = "na wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstay = .replace_labels(
    standardized_value_labels$jobstay,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    jobstom = .replace_labels(
    standardized_value_labels$jobstom,
    `-3` = "na wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstoy = .replace_labels(
    standardized_value_labels$jobstoy,
    `-2` = "na, see C/D/E/F/GJOBC"
  ),
    retifut = c(`-2` = "na, see C/D/E/F/GRETIRED", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    retired = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, partly",
    `3` = "yes, completely"
  ),
    retirf1 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf2 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf3 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf4 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf5 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retirf6 = c(
    `-2` = "na, see C/D/E/F/GRETIFUT",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    retivol = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see G/JOBC",
    `-1` = "na, asked",
    `1` = "no, not retired",
    `2` = "yes, retired entirely voluntarily",
    `3` = "yes, retired but not entirely voluntarily"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    cjclass = c(
    `-2` = "na, see HCJSBC",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
    cjlevel = c(
    `-2` = "na, see HCJSBC",
    `1` = "elementary",
    `2` = "low",
    `3` = "medium",
    `4` = "high",
    `5` = "scientific"
  ),
    cjsbc = .replace_labels(
    standardized_value_labels$cjsbc,
    `-2` = "na, see HJOBC"
  ),
    cjtype = c(
    `-2` = "na, see HCJSBC",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
    disabl = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see HJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    disablp = c(`-2` = "na, see HDISABL", `-1` = "na, asked"),
    employ = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see HJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    job1 = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    job3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see HJOBC",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    job3a = .replace_labels(
    standardized_value_labels$job3a,
    `-2` = "na, see HJOBC"
  ),
    job4 = c(`-3` = "na, wrong skip", `-2` = "na, see HJOBC", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    job5 = .replace_labels(
    standardized_value_labels$job5,
    `-2` = "na, see HJOB4"
  ),
    job5a = .replace_labels(
    standardized_value_labels$job5a,
    `-2` = "na, see HJOB4"
  ),
    job5b = .replace_labels(
    standardized_value_labels$job5b,
    `-2` = "na, see HJOB4"
  ),
    job6 = .replace_labels(
    standardized_value_labels$job6,
    `-2` = "na, see HJOBC"
  ),
    job7 = .replace_labels(
    standardized_value_labels$job7,
    `-2` = "na, see HJOBC"
  ),
    jobc = .replace_labels(
    standardized_value_labels$jobc,
    `-2` = "na, see HJOB1"
  ),
    jobstam = .replace_labels(
    standardized_value_labels$jobstam,
    `-3` = "na wrong skip",
    `-2` = "na, see HJOBC",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstay = .replace_labels(
    standardized_value_labels$jobstay,
    `-2` = "na, see HJOBC"
  ),
    jobstom = .replace_labels(
    standardized_value_labels$jobstom,
    `-3` = "na wrong skip",
    `-2` = "na, see HJOBC",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstoy = .replace_labels(
    standardized_value_labels$jobstoy,
    `-2` = "na, see HJOBC"
  ),
    pcjclass = .replace_labels(
    standardized_value_labels$pcjclass,
    `-2` = "na, see HPCJSBC"
  ),
    pcjlevel = .replace_labels(
    standardized_value_labels$pcjlevel,
    `-2` = "na, see HPCJSBC"
  ),
    pcjsbc = .replace_labels(
    standardized_value_labels$pcjsbc,
    `-2` = "na, see HPJOB1"
  ),
    pcjtype = .replace_labels(
    standardized_value_labels$pcjtype,
    `-2` = "na, see HPCJSBC"
  ),
    pjob1 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "no (household) partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    pjob3a = .replace_labels(
    standardized_value_labels$pjob3a,
    `-2` = "na, see HPJOB1"
  ),
    pjob4 = .replace_labels(
    standardized_value_labels$pjob4,
    `-2` = "na, see HPJOB1"
  ),
    pjob5 = .replace_labels(
    standardized_value_labels$pjob5,
    `-2` = "na, see HPJOB4"
  ),
    pjob5a = .replace_labels(
    standardized_value_labels$pjob5a,
    `-2` = "na, see HPJOB4"
  ),
    pjob5b = .replace_labels(
    standardized_value_labels$pjob5b,
    `-2` = "na, see HPJOB4"
  ),
    pjob6 = .replace_labels(
    standardized_value_labels$pjob6,
    `-2` = "na, see HPJOB1"
  ),
    retifut = c(`-2` = "na, see HRETIRED", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    retired = c(
    `-5` = "na, age >= 65",
    `-3` = "na, wrong skip",
    `-2` = "na, see HJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, partly",
    `3` = "yes, completely"
  ),
    retirf1 = c(`-2` = "na, see HRETIFUT", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    retirf2 = c(`-2` = "na, see HRETIFUT", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    retirf3 = c(`-2` = "na, see HRETIFUT", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    retirf4 = c(`-2` = "na, see HRETIFUT", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    retirf5 = c(`-2` = "na, see HRETIFUT", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    retirf6 = c(`-2` = "na, see HRETIFUT", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    retivol = .replace_labels(
    standardized_value_labels$retivol,
    `-5` = "na, age >=65",
    `-2` = "na, see HJOBC",
    `1` = "no, not retired",
    `2` = "yes, retired entirely voluntarily"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    cjclass = c(
    `-2` = "na, see BCJSBC",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
    cjlevel = c(
    `-2` = "na, see BCJSBC",
    `1` = "elementary",
    `2` = "low",
    `3` = "medium",
    `4` = "high",
    `5` = "scientific"
  ),
    cjsbc = .replace_labels(
    standardized_value_labels$cjsbc,
    `-2` = "na, see BJOB1"
  ),
    cjtype = c(
    `-2` = "na, see BCJSBC",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
    disabl = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1 & BJOBL1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    disablp = c(`-2` = "na, see BDISABL", `-1` = "na, asked"),
    employ = c(`-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    jlstam = .replace_labels(
    standardized_value_labels$jlstam,
    `-3` = "na wrong skip",
    `-2` = "na, see BJOBL1",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jlstay = .replace_labels(
    standardized_value_labels$jlstay,
    `-3` = "na wrong skip",
    `-2` = "na, see BJOBL1"
  ),
    job1 = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    job3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    job3a = .replace_labels(
    standardized_value_labels$job3a,
    `-2` = "na, see BJOB1"
  ),
    job4 = c(`-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    job5 = c(`-3` = "na, wrong skip", `-2` = "na, see BJOB4", `-1` = "na, asked"),
    job5a = .replace_labels(
    standardized_value_labels$job5a,
    `-2` = "na, see BJOB4"
  ),
    job5b = .replace_labels(
    standardized_value_labels$job5b,
    `-2` = "na, see BJOB4"
  ),
    job6 = .replace_labels(
    standardized_value_labels$job6,
    `-2` = "na, see BJOB1"
  ),
    job7 = .replace_labels(
    standardized_value_labels$job7,
    `-2` = "na, see BJOB1"
  ),
    jobl1 = .replace_labels(
    standardized_value_labels$jobl1,
    `-2` = "na, see BJOB1"
  ),
    jobl3 = .replace_labels(
    standardized_value_labels$jobl3,
    `-2` = "na, see BJOBL1"
  ),
    jobl3a = .replace_labels(
    standardized_value_labels$jobl3a,
    `-2` = "na, see BJOBL1"
  ),
    jobl4 = .replace_labels(
    standardized_value_labels$jobl4,
    `-2` = "na, see BJOBL1"
  ),
    jobl5 = .replace_labels(
    standardized_value_labels$jobl5,
    `-2` = "na, see BJOBL4"
  ),
    jobl5a = .replace_labels(
    standardized_value_labels$jobl5a,
    `-2` = "na, see BJOB4"
  ),
    jobl5b = .replace_labels(
    standardized_value_labels$jobl5b,
    `-2` = "na, see BJOB4"
  ),
    jobl6 = .replace_labels(
    standardized_value_labels$jobl6,
    `-2` = "na, see BJOBL1"
  ),
    jobl7 = .replace_labels(
    standardized_value_labels$jobl7,
    `-2` = "na, see BJOBL1"
  ),
    jobstam = .replace_labels(
    standardized_value_labels$jobstam,
    `-3` = "na wrong skip",
    `-2` = "na, see BJOB1",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstay = .replace_labels(
    standardized_value_labels$jobstay,
    `-3` = "na wrong skip",
    `-2` = "na, see BJOB1"
  ),
    jobstom = .replace_labels(
    standardized_value_labels$jobstom,
    `-3` = "na wrong skip",
    `-2` = "na, see BJOBL1",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstoy = .replace_labels(
    standardized_value_labels$jobstoy,
    `-2` = "na, see BJOBL1"
  ),
    nretr = c(
    `-3` = "na, wrong skip",
    `-2` = "see BRETIRED",
    `-1` = "na, asked",
    `1` = "enough challenges at work",
    `2` = "maintain social contacts",
    `3` = "other pastime less pleasant",
    `4` = "no possibility for early retirement",
    `5` = "financially more favourable",
    `6` = "should work on to have adequate pension",
    `7` = "other reason"
  ),
    pcclass = c(
    `-2` = "na, see BPCSBC",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
    pclevel = c(
    `-2` = "na, see BPCSBC",
    `1` = "elementary",
    `2` = "low",
    `3` = "medium",
    `4` = "high",
    `5` = "scientific"
  ),
    pcsbc = .replace_labels(
    standardized_value_labels$pcsbc,
    `-2` = "na, see BPJOB1"
  ),
    pctype = c(
    `-2` = "na, see BPCSBC",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
    pdisabl = .replace_labels(
    standardized_value_labels$pdisabl,
    `-2` = "na, see BPJOB1 & BPJOBL1"
  ),
    pdisabp = c(`-2` = "na, see BPDISABL", `-1` = "na, asked"),
    pemploy = .replace_labels(
    standardized_value_labels$pemploy,
    `-2` = "na, see BPJOB1"
  ),
    pjlstam = .replace_labels(
    standardized_value_labels$pjlstam,
    `-3` = "na wrong skip",
    `-2` = "na, see BJOBL1",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    pjlstay = .replace_labels(
    standardized_value_labels$pjlstay,
    `-3` = "na wrong skip",
    `-2` = "na, see BPJOBL1"
  ),
    pjob1 = c(`-2` = "na, see BPJDATA", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    pjob3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BPJOB1",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    pjob3a = .replace_labels(
    standardized_value_labels$pjob3a,
    `-2` = "na, see BPJOB1"
  ),
    pjob4 = .replace_labels(
    standardized_value_labels$pjob4,
    `-2` = "na, see BPJOB1"
  ),
    pjob5 = .replace_labels(
    standardized_value_labels$pjob5,
    `-2` = "na, see BPJOB4"
  ),
    pjob5a = .replace_labels(
    standardized_value_labels$pjob5a,
    `-2` = "na, see BPJOB4"
  ),
    pjob5b = .replace_labels(
    standardized_value_labels$pjob5b,
    `-2` = "na, see BPJOB4"
  ),
    pjob6 = .replace_labels(
    standardized_value_labels$pjob6,
    `-2` = "na, see BPJOB1"
  ),
    pjob7 = .replace_labels(
    standardized_value_labels$pjob7,
    `-2` = "na, see BPJOB1"
  ),
    pjobl1 = .replace_labels(
    standardized_value_labels$pjobl1,
    `-2` = "na, see BPJOB1"
  ),
    pjobl3 = .replace_labels(
    standardized_value_labels$pjobl3,
    `-2` = "na, see BPJOBL1"
  ),
    pjobl3a = .replace_labels(
    standardized_value_labels$pjobl3a,
    `-2` = "na, see BPJOBL1"
  ),
    pjobl4 = .replace_labels(
    standardized_value_labels$pjobl4,
    `-2` = "na, see BPJOBL1"
  ),
    pjobl5 = .replace_labels(
    standardized_value_labels$pjobl5,
    `-2` = "na, see BPJOBL4"
  ),
    pjobl5a = .replace_labels(
    standardized_value_labels$pjobl5a,
    `-2` = "na, see BPJOBL4"
  ),
    pjobl5b = .replace_labels(
    standardized_value_labels$pjobl5b,
    `-2` = "na, see BPJOBL4"
  ),
    pjobl6 = .replace_labels(
    standardized_value_labels$pjobl6,
    `-2` = "na, see BPJOBL1"
  ),
    pjobl7 = .replace_labels(
    standardized_value_labels$pjobl7,
    `-2` = "na, see BPJOBL1"
  ),
    pjobstm = .replace_labels(
    standardized_value_labels$pjobstm,
    `-3` = "na wrong skip",
    `-2` = "na, see BPJOBL1",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    pjobsty = .replace_labels(
    standardized_value_labels$pjobsty,
    `-2` = "na, see BPJOBL1"
  ),
    pjstam = .replace_labels(
    standardized_value_labels$pjstam,
    `-3` = "na wrong skip",
    `-2` = "na, see BPJOB1",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    pjstay = .replace_labels(
    standardized_value_labels$pjstay,
    `-3` = "na wrong skip",
    `-2` = "na, see BPJOB1"
  ),
    plclass = c(
    `-2` = "na, see BPLSBC",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
    pllevel = c(
    `-2` = "na, see BPLSBC",
    `1` = "elementary",
    `2` = "low",
    `3` = "medium",
    `4` = "high",
    `5` = "scientific"
  ),
    plsbc = .replace_labels(
    standardized_value_labels$plsbc,
    `-2` = "na, see BPJOBL1"
  ),
    pltype = c(
    `-2` = "na, see BPLSBC",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
    pretire = .replace_labels(
    standardized_value_labels$pretire,
    `-2` = "na, see BPJOB1 & BPJOBL1"
  ),
    retired = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1 & BJOBL1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, partly",
    `3` = "yes, completely"
  ),
    retivol = c(
    `-3` = "na, wrong skip",
    `-2` = "see BRETIRED",
    `-1` = "na, asked",
    `1` = "no, not retired",
    `2` = "yes, retired entirely voluntarily",
    `3` = "yes, retired but not entirely voluntarily"
  ),
    retnfr = .replace_labels(
    standardized_value_labels$retnfr,
    `-2` = "see BRETIRED",
    `4` = "no possibility for early retirement",
    `5` = "financially more favourable"
  ),
    retnfr2 = .replace_labels(
    standardized_value_labels$retnfr2,
    `-2` = "see BRETIRED"
  ),
    retreas = c(
    `-3` = "na, wrong skip",
    `-2` = "see BRETIRED",
    `-1` = "na, asked",
    `1` = "stress and pressure of work too high",
    `2` = "physically too heavy",
    `3` = "health complaints too hampering",
    `4` = "not motivated anymore",
    `5` = "nicer to spend more time on private life",
    `6` = "not possible anymore in the future",
    `7` = "other reason"
  ),
    retyr = c(
    `-3` = "na, wrong skip",
    `-2` = "see BRETIRED",
    `-1` = "na, asked",
    `1` = "stress and pressure of work too high",
    `2` = "physically too heavy",
    `3` = "health complaints too hampering",
    `4` = "not motivated anymore",
    `5` = "nicer to spend more time on private life",
    `6` = "not possible anymore in the future",
    `7` = "other reason"
  ),
    rlclass = c(
    `-2` = "na, see BRLSBC",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
    rllevel = c(
    `-2` = "na, see BRLSBC",
    `1` = "elementary",
    `2` = "low",
    `3` = "medium",
    `4` = "high",
    `5` = "scientific"
  ),
    rlsbc = .replace_labels(
    standardized_value_labels$rlsbc,
    `-2` = "na, see BJOBL1"
  ),
    rltype = c(
    `-2` = "na, see BRLSBC",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
    work65 = .replace_labels(
    standardized_value_labels$work65,
    `-2` = "na, see BJOB1 & BRETIRED",
    `1` = "no, I do not think so",
    `2` = "I am sometimes not sure about this",
    `3` = "yes, I do think so"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    disabl = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1/BJOBL1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    disablp = .replace_labels(
    standardized_value_labels$disablp,
    `-3` = "na, refused",
    `-2` = "na, see BDISABL",
    `-1` = "na, asked"
  ),
    employ = c(`-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    jlstam = .replace_labels(
    standardized_value_labels$jlstam,
    `-3` = "na wrong skip",
    `-2` = "na, see BJOBL1",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jlstay = .replace_labels(
    standardized_value_labels$jlstay,
    `-3` = "na wrong skip",
    `-2` = "na, see BJOBL1"
  ),
    job1 = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    job3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    job3a = .replace_labels(
    standardized_value_labels$job3a,
    `-2` = "na, see BJOB1"
  ),
    job4 = c(`-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    job5 = c(`-3` = "na, wrong skip", `-2` = "na, see BJOB4", `-1` = "na, asked"),
    job5a = .replace_labels(
    standardized_value_labels$job5a,
    `-2` = "na, see BJOB4"
  ),
    job6 = .replace_labels(
    standardized_value_labels$job6,
    `-2` = "na, see BJOB1"
  ),
    job7 = .replace_labels(
    standardized_value_labels$job7,
    `-2` = "na, see BJOB1"
  ),
    jobl1 = .replace_labels(
    standardized_value_labels$jobl1,
    `-2` = "na, see BJOB1"
  ),
    jobl3 = .replace_labels(
    standardized_value_labels$jobl3,
    `-2` = "na, see BJOBL1"
  ),
    jobl3a = .replace_labels(
    standardized_value_labels$jobl3a,
    `-2` = "na, see BJOBL1"
  ),
    jobl4 = .replace_labels(
    standardized_value_labels$jobl4,
    `-2` = "na, see BJOBL1"
  ),
    jobl5 = .replace_labels(
    standardized_value_labels$jobl5,
    `-2` = "na, see BJOBL4"
  ),
    jobl5a = .replace_labels(
    standardized_value_labels$jobl5a,
    `-2` = "na, see BJOBL4"
  ),
    jobl6 = .replace_labels(
    standardized_value_labels$jobl6,
    `-2` = "na, see BJOBL1"
  ),
    jobl7 = .replace_labels(
    standardized_value_labels$jobl7,
    `-2` = "na, see BJOBL1"
  ),
    jobstam = .replace_labels(
    standardized_value_labels$jobstam,
    `-3` = "na wrong skip",
    `-2` = "na, see BJOB1",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstay = .replace_labels(
    standardized_value_labels$jobstay,
    `-3` = "na wrong skip",
    `-2` = "na, see BJOB1"
  ),
    jobstom = .replace_labels(
    standardized_value_labels$jobstom,
    `-3` = "na wrong skip",
    `-2` = "na, see BJOBL1",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstoy = .replace_labels(
    standardized_value_labels$jobstoy,
    `-2` = "na, see BJOBL1"
  ),
    pdisabl = .replace_labels(
    standardized_value_labels$pdisabl,
    `-2` = "na, see BPJOB1/BPJOBL1"
  ),
    pdisabp = .replace_labels(
    standardized_value_labels$pdisabp,
    `-3` = "na, refused",
    `-2` = "na, see BPDISABL"
  ),
    pemploy = .replace_labels(
    standardized_value_labels$pemploy,
    `-2` = "na, see BPJOB1"
  ),
    pjob1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BPJDATA",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    pjob3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BPJOB1",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    pjob3a = .replace_labels(
    standardized_value_labels$pjob3a,
    `-2` = "na, see BPJOB1"
  ),
    pjob4 = .replace_labels(
    standardized_value_labels$pjob4,
    `-2` = "na, see BPJOB1"
  ),
    pjob5 = .replace_labels(
    standardized_value_labels$pjob5,
    `-2` = "na, see BPJOB4"
  ),
    pjob5a = .replace_labels(
    standardized_value_labels$pjob5a,
    `-2` = "na, see BPJOB4"
  ),
    pjob6 = .replace_labels(
    standardized_value_labels$pjob6,
    `-2` = "na, see BPJOB1"
  ),
    pjob7 = .replace_labels(
    standardized_value_labels$pjob7,
    `-2` = "na, see BPJOB1"
  ),
    pjobl1 = .replace_labels(
    standardized_value_labels$pjobl1,
    `-2` = "na, see BPJOB1"
  ),
    pjobl3 = .replace_labels(
    standardized_value_labels$pjobl3,
    `-2` = "na, see BPJOBL1"
  ),
    pjobl3a = .replace_labels(
    standardized_value_labels$pjobl3a,
    `-2` = "na, see BPJOBL1"
  ),
    pjobl4 = .replace_labels(
    standardized_value_labels$pjobl4,
    `-2` = "na, see BPJOBL1"
  ),
    pjobl5 = .replace_labels(
    standardized_value_labels$pjobl5,
    `-2` = "na, see BPJOBL4"
  ),
    pjobl5a = .replace_labels(
    standardized_value_labels$pjobl5a,
    `-2` = "na, see BPJOBL4"
  ),
    pjobl6 = .replace_labels(
    standardized_value_labels$pjobl6,
    `-2` = "na, see BPJOBL1"
  ),
    pjobl7 = .replace_labels(
    standardized_value_labels$pjobl7,
    `-2` = "na, see BPJOBL1"
  ),
    pjobstm = .replace_labels(
    standardized_value_labels$pjobstm,
    `-3` = "na wrong skip",
    `-2` = "na, see BPJOBL1",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    pjobsty = .replace_labels(
    standardized_value_labels$pjobsty,
    `-2` = "na, see BPJOBL1"
  ),
    pjstam = .replace_labels(
    standardized_value_labels$pjstam,
    `-3` = "na wrong skip",
    `-2` = "na, see BPJOB1",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    pjstay = .replace_labels(
    standardized_value_labels$pjstay,
    `-3` = "na wrong skip",
    `-2` = "na, see BPJOB1"
  ),
    retired = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BJOB1/BJOBL1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, partly",
    `3` = "yes, completely"
  ),
    retivol = c(
    `-3` = "na, wrong skip",
    `-2` = "see BRETIRED",
    `-1` = "na, asked",
    `1` = "no, not retired",
    `2` = "yes, retired entirely voluntarily",
    `3` = "yes, retired but not entirely voluntarily"
  ),
    workret = .replace_labels(
    standardized_value_labels$workret,
    `-2` = "na, see BJOB1/BRETIRED",
    `1` = "no, I do not think so",
    `2` = "I am sometimes not sure about this",
    `3` = "yes, I do think so"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    cjclass = c(
    `-2` = "na, see ICJSBC",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
    cjlevel = c(
    `-2` = "na, see ICJSBC",
    `1` = "elementary",
    `2` = "low",
    `3` = "medium",
    `4` = "high",
    `5` = "scientific"
  ),
    cjsbc = .replace_labels(
    standardized_value_labels$cjsbc,
    `-2` = "na, see IJOBC/S"
  ),
    cjtype = c(
    `-2` = "na, see ICJSBC",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
    disabl = c(
    `-5` = "na, age >= 66",
    `-3` = "na, wrong skip",
    `-2` = "na, see IJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    disablp = c(`-2` = "na, see IDISABL", `-1` = "na, asked"),
    employ = c(
    `-5` = "na, age >= 66",
    `-3` = "na, wrong skip",
    `-2` = "na, see IJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    job1 = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    job3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see IJOBC/S",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    job3a = .replace_labels(
    standardized_value_labels$job3a,
    `-2` = "na, see IJOBC/S"
  ),
    job4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see IJOBC/S",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    job5 = .replace_labels(
    standardized_value_labels$job5,
    `-2` = "na, see IJOB4"
  ),
    job5a = .replace_labels(
    standardized_value_labels$job5a,
    `-2` = "na, see IJOB4"
  ),
    job5b = .replace_labels(
    standardized_value_labels$job5b,
    `-2` = "na, see IJOB4"
  ),
    job6 = .replace_labels(
    standardized_value_labels$job6,
    `-2` = "na, see IJOBC/S"
  ),
    job7 = .replace_labels(
    standardized_value_labels$job7,
    `-2` = "na, see IJOBC/S"
  ),
    jobc = .replace_labels(
    standardized_value_labels$jobc,
    `-2` = "na, see IJOB1"
  ),
    jobs = .replace_labels(
    standardized_value_labels$jobs,
    `-2` = "na, see IJOB1",
    `-1` = "na, see IJOBC"
  ),
    jobstam = .replace_labels(
    standardized_value_labels$jobstam,
    `-3` = "na wrong skip",
    `-2` = "na, see IJOBC/S",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstay = .replace_labels(
    standardized_value_labels$jobstay,
    `-2` = "na, see IJOBC/S"
  ),
    jobstom = .replace_labels(
    standardized_value_labels$jobstom,
    `-3` = "na wrong skip",
    `-2` = "na, see IJOBC",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstoy = .replace_labels(
    standardized_value_labels$jobstoy,
    `-2` = "na, see IJOBC"
  ),
    pcjclass = .replace_labels(
    standardized_value_labels$pcjclass,
    `-2` = "na, see IPCJSBC"
  ),
    pcjlevel = .replace_labels(
    standardized_value_labels$pcjlevel,
    `-2` = "na, see IPCJSBC"
  ),
    pcjsbc = .replace_labels(
    standardized_value_labels$pcjsbc,
    `-2` = "na, see IPJOBC"
  ),
    pcjtype = .replace_labels(
    standardized_value_labels$pcjtype,
    `-2` = "na, see IPCJSBC"
  ),
    pjob1 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "no (household) partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    pjob3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see IPJOBC/S",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    pjob3a = .replace_labels(
    standardized_value_labels$pjob3a,
    `-2` = "na, see IPJOBC/S"
  ),
    pjob4 = .replace_labels(
    standardized_value_labels$pjob4,
    `-2` = "na, see IPJOBC/S"
  ),
    pjob5 = .replace_labels(
    standardized_value_labels$pjob5,
    `-2` = "na, see IPJOB4"
  ),
    pjob5a = .replace_labels(
    standardized_value_labels$pjob5a,
    `-2` = "na, see IPJOB4"
  ),
    pjob5b = .replace_labels(
    standardized_value_labels$pjob5b,
    `-2` = "na, see IPJOB4"
  ),
    pjob6 = .replace_labels(
    standardized_value_labels$pjob6,
    `-2` = "na, see IPJOB1"
  ),
    pjob7 = .replace_labels(
    standardized_value_labels$pjob7,
    `-2` = "na, see IPJOB1"
  ),
    pjobc = .replace_labels(
    standardized_value_labels$pjobc,
    `-2` = "na, see IPJOB1"
  ),
    pjobs = c(`-2` = "na, see IPJOB1", `-1` = "na, see IPJOBC", `1` = "no", `2` = "not sure", `3` = "yes"),
    pjstam = .replace_labels(
    standardized_value_labels$pjstam,
    `-3` = "na wrong skip",
    `-2` = "na, see IPJOBC/S",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    pjstay = .replace_labels(
    standardized_value_labels$pjstay,
    `-2` = "na, see IPJOBC/S"
  ),
    retired = c(
    `-5` = "na, age >= 66",
    `-3` = "na, wrong skip",
    `-2` = "na, see IJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, partly",
    `3` = "yes, completely"
  ),
    retivol = .replace_labels(
    standardized_value_labels$retivol,
    `-5` = "na, age >=66",
    `-2` = "na, see IJOBC",
    `1` = "no, not retired",
    `2` = "yes, retired entirely voluntarily"
  ),
    workret = .replace_labels(
    standardized_value_labels$workret,
    `-2` = "na, see IJOB1/IRETIRED",
    `1` = "no, I do not think so",
    `2` = "I am not sure about this",
    `3` = "yes, I do think so"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    abstot = .replace_labels(
    standardized_value_labels$abstot,
    `-2` = "na, see JJOBC/S"
  ),
    abswd = .replace_labels(
    standardized_value_labels$abswd,
    `-2` = "na, see JJOBC/S"
  ),
    cjclass = c(
    `-2` = "na, see JCJSBC",
    `11` = "elementary occupations",
    `21` = "lower non-specialized occupations",
    `22` = "lower teaching & instruction occupations",
    `24` = "lower agricultural occupations",
    `25` = "lower natural science occupations",
    `26` = "lower technical occupations",
    `28` = "lower transport occupations",
    `29` = "lower (para)medical occupations",
    `31` = "lower administrative & commercial occupations",
    `33` = "lower security occupations",
    `37` = "lower service & care occupations",
    `42` = "medium teaching & instruction occupations",
    `44` = "medium agricultural occupations",
    `45` = "medium natural science occupations",
    `46` = "medium technical occupations",
    `48` = "medium transport occupations",
    `49` = "medium (para)medical occupations",
    `51` = "medium administrative & commercial occupations",
    `53` = "medium juridical & security occupations",
    `55` = "medium linguistic & cultural occupations",
    `56` = "medium social occupations",
    `57` = "medium service & care occupations",
    `62` = "higher pedagogical occupations",
    `64` = "higher agricultural occupations",
    `65` = "higher natural science occupations",
    `66` = "higher technical occupations",
    `68` = "higher transport occupations",
    `69` = "higher (para)medical occupations",
    `71` = "higher administrative & commercial occupations",
    `73` = "higher juridical & security occupations",
    `75` = "higher linguistic & cultural occupations",
    `76` = "higher social occupations",
    `77` = "higher service & care occupations",
    `78` = "higher managers",
    `82` = "scientific pedagogical occupations",
    `84` = "scientific agricultural occupations",
    `85` = "scientific natural science occupations",
    `86` = "scientific technical occupations",
    `89` = "scientific (para)medical occupations",
    `91` = "scientific administrative & economic occupations",
    `93` = "scientific juridical & policy occupations",
    `96` = "scientific social occupations",
    `98` = "scientific managers"
  ),
    cjlevel = c(
    `-2` = "na, see JCJSBC",
    `1` = "elementary",
    `2` = "low",
    `3` = "medium",
    `4` = "high",
    `5` = "scientific"
  ),
    cjsbc = .replace_labels(
    standardized_value_labels$cjsbc,
    `-2` = "na, see JJOBC/S"
  ),
    cjtype = c(
    `-2` = "na, see JCJSBC",
    `1` = "general",
    `2` = "pedagogical",
    `4` = "agricultural",
    `5` = "natural science",
    `6` = "technical",
    `8` = "transport",
    `9` = "(para)medical",
    `11` = "administrative/commercial",
    `13` = "juridical/security",
    `15` = "cultural/linguistic",
    `16` = "social science",
    `17` = "care & services",
    `18` = "management"
  ),
    disabl = c(
    `-5` = "na, age >= 67",
    `-3` = "na, wrong skip",
    `-2` = "na, see JJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    disablp = .replace_labels(
    standardized_value_labels$disablp,
    `-3` = "refused",
    `-2` = "na, see JDISABL",
    `-1` = "na, asked"
  ),
    employ = c(
    `-5` = "na, age >= 67",
    `-3` = "na, wrong skip",
    `-2` = "na, see JJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    eretfin = .replace_labels(
    standardized_value_labels$eretfin,
    `-2` = "na, see JRETIRED"
  ),
    fretage = .replace_labels(
    standardized_value_labels$fretage,
    `-2` = "na, see JRETIRED"
  ),
    healthp = .replace_labels(
    standardized_value_labels$healthp,
    `-2` = "na, see JJOBC/S"
  ),
    job1 = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    job3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JJOBC/S",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    job3a = .replace_labels(
    standardized_value_labels$job3a,
    `-2` = "na, see JJOBC/S"
  ),
    job4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JJOBC/S",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    job5 = .replace_labels(
    standardized_value_labels$job5,
    `-2` = "na, see JJOB4"
  ),
    job5a = .replace_labels(
    standardized_value_labels$job5a,
    `-2` = "na, see JJOB4"
  ),
    job5b = .replace_labels(
    standardized_value_labels$job5b,
    `-2` = "na, see JJOB4"
  ),
    job6c = .replace_labels(
    standardized_value_labels$job6c,
    `-2` = "na, see JJOBC/S"
  ),
    job6r = .replace_labels(
    standardized_value_labels$job6r,
    `-2` = "na, see JJOBC/S"
  ),
    job7 = .replace_labels(
    standardized_value_labels$job7,
    `-2` = "na, see JJOBC/S"
  ),
    jobc = .replace_labels(
    standardized_value_labels$jobc,
    `-2` = "na, see JJOB1"
  ),
    jobs = .replace_labels(
    standardized_value_labels$jobs,
    `-2` = "na, see JJOB1",
    `-1` = "na, see JJOBC"
  ),
    jobstam = .replace_labels(
    standardized_value_labels$jobstam,
    `-3` = "na wrong skip",
    `-2` = "na, see JJOBC/S",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstar01 = .replace_labels(
    standardized_value_labels$jobstar01,
    `-2` = "na, see JJOBS"
  ),
    jobstar02 = .replace_labels(
    standardized_value_labels$jobstar02,
    `-2` = "na, see JJOBS"
  ),
    jobstar03 = .replace_labels(
    standardized_value_labels$jobstar03,
    `-2` = "na, see JJOBS"
  ),
    jobstar04 = .replace_labels(
    standardized_value_labels$jobstar04,
    `-2` = "na, see JJOBS"
  ),
    jobstar05 = .replace_labels(
    standardized_value_labels$jobstar05,
    `-2` = "na, see JJOBS"
  ),
    jobstar06 = .replace_labels(
    standardized_value_labels$jobstar06,
    `-2` = "na, see JJOBS"
  ),
    jobstar07 = .replace_labels(
    standardized_value_labels$jobstar07,
    `-2` = "na, see JJOBS"
  ),
    jobstar08 = .replace_labels(
    standardized_value_labels$jobstar08,
    `-2` = "na, see JJOBS"
  ),
    jobstar09 = .replace_labels(
    standardized_value_labels$jobstar09,
    `-2` = "na, see JJOBS"
  ),
    jobstay = .replace_labels(
    standardized_value_labels$jobstay,
    `-2` = "na, see JJOBC/S"
  ),
    jobstom = .replace_labels(
    standardized_value_labels$jobstom,
    `-3` = "na wrong skip",
    `-2` = "na, see JJOBC",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstoy = .replace_labels(
    standardized_value_labels$jobstoy,
    `-2` = "na, see JJOBC"
  ),
    mability = .replace_labels(
    standardized_value_labels$mability,
    `-2` = "na, see JJOBC/S"
  ),
    nretr = .replace_labels(
    standardized_value_labels$nretr,
    `-2` = "na, see JRETIRED",
    `2` = "maintain social contacts at work",
    `3` = "other pastimes less pleasant than work",
    `4` = "financially more favourable",
    `5` = "continue working after retirement age in same job",
    `6` = "continue working after retirement age in new job"
  ),
    pability = .replace_labels(
    standardized_value_labels$pability,
    `-2` = "na, see JJOBC/S"
  ),
    pcjclass = .replace_labels(
    standardized_value_labels$pcjclass,
    `-2` = "na, see JPCJSBC"
  ),
    pcjlevel = .replace_labels(
    standardized_value_labels$pcjlevel,
    `-2` = "na, see JPCJSBC"
  ),
    pcjsbc = .replace_labels(
    standardized_value_labels$pcjsbc,
    `-2` = "na, see JPJOBC"
  ),
    pcjtype = .replace_labels(
    standardized_value_labels$pcjtype,
    `-2` = "na, see JPCJSBC"
  ),
    peretfin = .replace_labels(
    standardized_value_labels$peretfin,
    `-2` = "na, see JRETIRED"
  ),
    pjob1 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "no (household) partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    pjob3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JPJOBC/S",
    `-1` = "na, asked",
    `1` = "steady job",
    `2` = "temporary job with contract",
    `3` = "temporary job via employment agency",
    `4` = "self-employed",
    `5` = "free-lance basis",
    `6` = "family company",
    `7` = "other"
  ),
    pjob3a = .replace_labels(
    standardized_value_labels$pjob3a,
    `-2` = "na, see JPJOBC/S"
  ),
    pjob4 = .replace_labels(
    standardized_value_labels$pjob4,
    `-2` = "na, see JPJOBC/S"
  ),
    pjob5 = .replace_labels(
    standardized_value_labels$pjob5,
    `-2` = "na, see JPJOB4"
  ),
    pjob5a = .replace_labels(
    standardized_value_labels$pjob5a,
    `-2` = "na, see JPJOB4"
  ),
    pjob5b = .replace_labels(
    standardized_value_labels$pjob5b,
    `-2` = "na, see JPJOB4"
  ),
    pjob6c = .replace_labels(
    standardized_value_labels$pjob6c,
    `-2` = "na, see JPJOB1"
  ),
    pjob6r = .replace_labels(
    standardized_value_labels$pjob6r,
    `-2` = "na, see JPJOB1"
  ),
    pjob7 = .replace_labels(
    standardized_value_labels$pjob7,
    `-2` = "na, see JPJOB1"
  ),
    pjobc = .replace_labels(
    standardized_value_labels$pjobc,
    `-2` = "na, see JPJOB1"
  ),
    pjobs = .replace_labels(
    standardized_value_labels$pjobs,
    `-2` = "na, see JPJOB1",
    `-1` = "na, see JPJOBC"
  ),
    pjstam = .replace_labels(
    standardized_value_labels$pjstam,
    `-3` = "na wrong skip",
    `-2` = "na, see JPJOBC/S",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    pjstay = .replace_labels(
    standardized_value_labels$pjstay,
    `-2` = "na, see JPJOBC/S"
  ),
    prefret = .replace_labels(
    standardized_value_labels$prefret,
    `-5` = "na, age >= 71",
    `-2` = "na, see JJOBC"
  ),
    pretage = .replace_labels(
    standardized_value_labels$pretage,
    `-2` = "na, see JRETIRED"
  ),
    pretivol = .replace_labels(
    standardized_value_labels$pretivol,
    `-5` = "na, age >=67",
    `-2` = "na, see JJOBC"
  ),
    pretreas = .replace_labels(
    standardized_value_labels$pretreas,
    `-2` = "na, see JRETIRED"
  ),
    retage = .replace_labels(
    standardized_value_labels$retage,
    `-2` = "na, see JRETIRED"
  ),
    retired = c(
    `-5` = "na, age >= 71",
    `-3` = "na, wrong skip",
    `-2` = "na, see JJOBC",
    `-1` = "na, not applicable",
    `1` = "no",
    `2` = "yes, partly",
    `3` = "yes, completely"
  ),
    retivol = c(
    `-5` = "na, age >=67",
    `-3` = "na, wrong skip",
    `-2` = "na, see JJOBC",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no, not (entirely) voluntarily"
  ),
    retreas = .replace_labels(
    standardized_value_labels$retreas,
    `-2` = "na, see JRETIRED",
    `2` = "other work related factors (organisational changes/conflicts)",
    `3` = "physically too heavy",
    `4` = "health complaints too hampering",
    `5` = "afraid of deterioration of health",
    `6` = "not motivated anymore/lost interest",
    `7` = "more enjoyable to spend more time on private life"
  ),
    retyr = .replace_labels(
    standardized_value_labels$retyr,
    `-2` = "na, see JRETIRED",
    `2` = "other work related factors (organisational changes/conflicts)",
    `3` = "physically too demanding",
    `4` = "health complaints too limiting",
    `5` = "afraid of deterioration of health",
    `6` = "not motivated anymore/lost interest",
    `7` = "more enjoyable to spend more time on private life"
  ),
    rjobchange01 = .replace_labels(
    standardized_value_labels$rjobchange01,
    `-2` = "na, see JJOBS"
  ),
    rjobchange02 = .replace_labels(
    standardized_value_labels$rjobchange02,
    `-2` = "na, see JJOBS"
  ),
    rjobchange03 = .replace_labels(
    standardized_value_labels$rjobchange03,
    `-2` = "na, see JJOBS"
  ),
    rjobchange04 = .replace_labels(
    standardized_value_labels$rjobchange04,
    `-2` = "na, see JJOBS"
  ),
    rjobchange05 = .replace_labels(
    standardized_value_labels$rjobchange05,
    `-2` = "na, see JJOBS"
  ),
    rjobchange06 = .replace_labels(
    standardized_value_labels$rjobchange06,
    `-2` = "na, see JJOBS"
  ),
    rjobchange07 = .replace_labels(
    standardized_value_labels$rjobchange07,
    `-2` = "na, see JJOBS"
  ),
    rjobchange08 = .replace_labels(
    standardized_value_labels$rjobchange08,
    `-2` = "na, see JJOBS"
  ),
    rjobchange09 = .replace_labels(
    standardized_value_labels$rjobchange09,
    `-2` = "na, see JJOBS"
  ),
    rjobchange10 = .replace_labels(
    standardized_value_labels$rjobchange10,
    `-2` = "na, see JJOBS"
  ),
    rjobchange11 = .replace_labels(
    standardized_value_labels$rjobchange11,
    `-2` = "na, see JJOBS"
  ),
    rjobchange12 = .replace_labels(
    standardized_value_labels$rjobchange12,
    `-2` = "na, see JJOBS"
  ),
    rjobchange13 = .replace_labels(
    standardized_value_labels$rjobchange13,
    `-2` = "na, see JJOBS"
  ),
    tasks = .replace_labels(
    standardized_value_labels$tasks,
    `-2` = "na, see JJOBC/S",
    `-1` = "na, asked"
  ),
    wjobchange = .replace_labels(
    standardized_value_labels$wjobchange,
    `-2` = "na, see JJOBS",
    `3` = "I switched employers"
  ),
    workret = .replace_labels(
    standardized_value_labels$workret,
    `-2` = "na, see JJOB1/JRETIRED",
    `1` = "no, I do not think so",
    `2` = "I am not sure about this",
    `3` = "yes, I do think so"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    abstot = .replace_labels(
    standardized_value_labels$abstot,
    `-2` = "na, see KJOBC/S"
  ),
    abswd = .replace_labels(
    standardized_value_labels$abswd,
    `-2` = "na, see KJOBC/S"
  ),
    cjsbc = .replace_labels(
    standardized_value_labels$cjsbc,
    `-2` = "na, see KJOBC/S"
  ),
    disabl = c(
    `-5` = "na, age >= 67",
    `-3` = "na, wrong skip",
    `-2` = "na, see KJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    disablp = .replace_labels(
    standardized_value_labels$disablp,
    `-3` = "refused",
    `-2` = "na, see KDISABL",
    `-1` = "na, asked"
  ),
    employ = c(
    `-5` = "na, age >= 67",
    `-3` = "na, wrong skip",
    `-2` = "na, see KJOBC",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    eretfin = .replace_labels(
    standardized_value_labels$eretfin,
    `-2` = "na, see KRETIRED"
  ),
    fretage = .replace_labels(
    standardized_value_labels$fretage,
    `-2` = "na, see KRETIRED"
  ),
    healthp = .replace_labels(
    standardized_value_labels$healthp,
    `-2` = "na, see KJOBC/S"
  ),
    job3 = .replace_labels(
    standardized_value_labels$job3,
    `-2` = "na, see KJOBC/S"
  ),
    job3a = .replace_labels(
    standardized_value_labels$job3a,
    `-2` = "na, see KJOBC/S"
  ),
    job4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KJOBC/S",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    job5 = .replace_labels(
    standardized_value_labels$job5,
    `-2` = "na, see KJOB4"
  ),
    job5a = .replace_labels(
    standardized_value_labels$job5a,
    `-2` = "na, see KJOB4"
  ),
    job5b = .replace_labels(
    standardized_value_labels$job5b,
    `-2` = "na, see KJOB4"
  ),
    job6c = .replace_labels(
    standardized_value_labels$job6c,
    `-2` = "na, see KJOBC/S"
  ),
    job6r = .replace_labels(
    standardized_value_labels$job6r,
    `-2` = "na, see KJOBC/S"
  ),
    job7 = .replace_labels(
    standardized_value_labels$job7,
    `-2` = "na, see KJOBC/S"
  ),
    jobc = .replace_labels(
    standardized_value_labels$jobc,
    `-2` = "na, see KJOB1"
  ),
    jobs = .replace_labels(
    standardized_value_labels$jobs,
    `-2` = "na, see KJOB1",
    `-1` = "na, see KJOBC"
  ),
    jobstam = .replace_labels(
    standardized_value_labels$jobstam,
    `-3` = "na wrong skip",
    `-2` = "na, see KJOBC/S",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstar01 = .replace_labels(
    standardized_value_labels$jobstar01,
    `-2` = "na, see KJOBS"
  ),
    jobstar02 = .replace_labels(
    standardized_value_labels$jobstar02,
    `-2` = "na, see KJOBS"
  ),
    jobstar03 = .replace_labels(
    standardized_value_labels$jobstar03,
    `-2` = "na, see KJOBS"
  ),
    jobstar04 = .replace_labels(
    standardized_value_labels$jobstar04,
    `-2` = "na, see KJOBS"
  ),
    jobstar05 = .replace_labels(
    standardized_value_labels$jobstar05,
    `-2` = "na, see KJOBS"
  ),
    jobstar06 = .replace_labels(
    standardized_value_labels$jobstar06,
    `-2` = "na, see KJOBS"
  ),
    jobstar07 = .replace_labels(
    standardized_value_labels$jobstar07,
    `-2` = "na, see KJOBS"
  ),
    jobstar08 = .replace_labels(
    standardized_value_labels$jobstar08,
    `-2` = "na, see KJOBS"
  ),
    jobstar09 = .replace_labels(
    standardized_value_labels$jobstar09,
    `-2` = "na, see KJOBS"
  ),
    jobstay = .replace_labels(
    standardized_value_labels$jobstay,
    `-2` = "na, see KJOBC/S"
  ),
    jobstom = .replace_labels(
    standardized_value_labels$jobstom,
    `-3` = "na wrong skip",
    `-2` = "na, see KJOBC",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    jobstoy = .replace_labels(
    standardized_value_labels$jobstoy,
    `-2` = "na, see KJOBC"
  ),
    kob1 = .replace_labels(
    standardized_value_labels$kob1,
    `-4` = "na, short version"
  ),
    mability = .replace_labels(
    standardized_value_labels$mability,
    `-2` = "na, see KJOBC/S"
  ),
    nretr01 = .replace_labels(
    standardized_value_labels$nretr01,
    `-2` = "na, see KRETIRED"
  ),
    nretr02 = .replace_labels(
    standardized_value_labels$nretr02,
    `-2` = "na, see KRETIRED"
  ),
    nretr03 = .replace_labels(
    standardized_value_labels$nretr03,
    `-2` = "na, see KRETIRED"
  ),
    nretr04 = .replace_labels(
    standardized_value_labels$nretr04,
    `-2` = "na, see KRETIRED"
  ),
    nretr05 = .replace_labels(
    standardized_value_labels$nretr05,
    `-2` = "na, see KRETIRED"
  ),
    nretr06 = .replace_labels(
    standardized_value_labels$nretr06,
    `-2` = "na, see KRETIRED"
  ),
    pability = .replace_labels(
    standardized_value_labels$pability,
    `-2` = "na, see KJOBC/S"
  ),
    pcjsbc = .replace_labels(
    standardized_value_labels$pcjsbc,
    `-2` = "na, see KPJOBC"
  ),
    peretfin = .replace_labels(
    standardized_value_labels$peretfin,
    `-2` = "na, see KRETIRED"
  ),
    pjob1 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "no (household) partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    pjob3 = .replace_labels(
    standardized_value_labels$pjob3,
    `-2` = "na, see KPJOBC/S"
  ),
    pjob3a = .replace_labels(
    standardized_value_labels$pjob3a,
    `-2` = "na, see KPJOBC/S"
  ),
    pjob4 = .replace_labels(
    standardized_value_labels$pjob4,
    `-2` = "na, see KPJOBC/S"
  ),
    pjob5 = .replace_labels(
    standardized_value_labels$pjob5,
    `-2` = "na, see KPJOB4"
  ),
    pjob5a = .replace_labels(
    standardized_value_labels$pjob5a,
    `-2` = "na, see KPJOB4"
  ),
    pjob5b = .replace_labels(
    standardized_value_labels$pjob5b,
    `-2` = "na, see KPJOB4"
  ),
    pjob6c = .replace_labels(
    standardized_value_labels$pjob6c,
    `-2` = "na, see KPJOB1"
  ),
    pjob6r = .replace_labels(
    standardized_value_labels$pjob6r,
    `-2` = "na, see KPJOB1"
  ),
    pjob7 = .replace_labels(
    standardized_value_labels$pjob7,
    `-2` = "na, see KPJOB1"
  ),
    pjobc = .replace_labels(
    standardized_value_labels$pjobc,
    `-2` = "na, see KPJOB1"
  ),
    pjobs = .replace_labels(
    standardized_value_labels$pjobs,
    `-2` = "na, see KPJOB1",
    `-1` = "na, see KPJOBC"
  ),
    pjstam = .replace_labels(
    standardized_value_labels$pjstam,
    `-3` = "na wrong skip",
    `-2` = "na, see KPJOBC/S",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    pjstay = .replace_labels(
    standardized_value_labels$pjstay,
    `-2` = "na, see KPJOBC/S"
  ),
    prefret = .replace_labels(
    standardized_value_labels$prefret,
    `-5` = "na, age >= 71",
    `-2` = "na, see KJOBC"
  ),
    pretage = .replace_labels(
    standardized_value_labels$pretage,
    `-2` = "na, see KRETIRED"
  ),
    pretivol = .replace_labels(
    standardized_value_labels$pretivol,
    `-5` = "na, age >=67",
    `-2` = "na, see KJOBC"
  ),
    pretreas01 = .replace_labels(
    standardized_value_labels$pretreas01,
    `-2` = "na, see KRETIRED"
  ),
    pretreas02 = .replace_labels(
    standardized_value_labels$pretreas02,
    `-2` = "na, see KRETIRED"
  ),
    pretreas03 = .replace_labels(
    standardized_value_labels$pretreas03,
    `-2` = "na, see KRETIRED"
  ),
    pretreas04 = .replace_labels(
    standardized_value_labels$pretreas04,
    `-2` = "na, see KRETIRED"
  ),
    pretreas05 = .replace_labels(
    standardized_value_labels$pretreas05,
    `-2` = "na, see KRETIRED"
  ),
    pretreas06 = .replace_labels(
    standardized_value_labels$pretreas06,
    `-2` = "na, see KRETIRED"
  ),
    pretreas07 = .replace_labels(
    standardized_value_labels$pretreas07,
    `-2` = "na, see KRETIRED"
  ),
    pretreas08 = .replace_labels(
    standardized_value_labels$pretreas08,
    `-2` = "na, see KRETIRED"
  ),
    pretreas09 = .replace_labels(
    standardized_value_labels$pretreas09,
    `-2` = "na, see KRETIRED"
  ),
    pretreas10 = .replace_labels(
    standardized_value_labels$pretreas10,
    `-2` = "na, see KRETIRED"
  ),
    pretreas11 = .replace_labels(
    standardized_value_labels$pretreas11,
    `-2` = "na, see KRETIRED"
  ),
    pretreas12 = .replace_labels(
    standardized_value_labels$pretreas12,
    `-2` = "na, see KRETIRED"
  ),
    pretreas13 = .replace_labels(
    standardized_value_labels$pretreas13,
    `-2` = "na, see KRETIRED"
  ),
    retage = .replace_labels(
    standardized_value_labels$retage,
    `-2` = "na, see KRETIRED"
  ),
    retired = c(
    `-5` = "na, age >= 71",
    `-3` = "na, wrong skip",
    `-2` = "na, see KJOBC",
    `-1` = "na, not applicable",
    `1` = "no",
    `2` = "yes, partly",
    `3` = "yes, completely"
  ),
    retivol = c(
    `-5` = "na, age >=67",
    `-3` = "na, wrong skip",
    `-2` = "na, see KJOBC",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no, not (entirely) voluntarily"
  ),
    retreas01 = .replace_labels(
    standardized_value_labels$retreas01,
    `-2` = "na, see KRETIRED"
  ),
    retreas02 = .replace_labels(
    standardized_value_labels$retreas02,
    `-2` = "na, see KRETIRED"
  ),
    retreas03 = .replace_labels(
    standardized_value_labels$retreas03,
    `-2` = "na, see KRETIRED"
  ),
    retreas04 = .replace_labels(
    standardized_value_labels$retreas04,
    `-2` = "na, see KRETIRED"
  ),
    retreas05 = .replace_labels(
    standardized_value_labels$retreas05,
    `-2` = "na, see KRETIRED"
  ),
    retreas06 = .replace_labels(
    standardized_value_labels$retreas06,
    `-2` = "na, see KRETIRED"
  ),
    retreas07 = .replace_labels(
    standardized_value_labels$retreas07,
    `-2` = "na, see KRETIRED"
  ),
    retreas08 = .replace_labels(
    standardized_value_labels$retreas08,
    `-2` = "na, see KRETIRED"
  ),
    retreas09 = .replace_labels(
    standardized_value_labels$retreas09,
    `-2` = "na, see KRETIRED"
  ),
    retreas10 = .replace_labels(
    standardized_value_labels$retreas10,
    `-2` = "na, see KRETIRED"
  ),
    retreas11 = .replace_labels(
    standardized_value_labels$retreas11,
    `-2` = "na, see KRETIRED"
  ),
    retreas12 = .replace_labels(
    standardized_value_labels$retreas12,
    `-2` = "na, see KRETIRED"
  ),
    retreas13 = .replace_labels(
    standardized_value_labels$retreas13,
    `-2` = "na, see KRETIRED"
  ),
    retyr01 = .replace_labels(
    standardized_value_labels$retyr01,
    `-2` = "na, see KRETIRED"
  ),
    retyr02 = .replace_labels(
    standardized_value_labels$retyr02,
    `-2` = "na, see KRETIRED"
  ),
    retyr03 = .replace_labels(
    standardized_value_labels$retyr03,
    `-2` = "na, see KRETIRED"
  ),
    retyr04 = .replace_labels(
    standardized_value_labels$retyr04,
    `-2` = "na, see KRETIRED"
  ),
    retyr05 = .replace_labels(
    standardized_value_labels$retyr05,
    `-2` = "na, see KRETIRED"
  ),
    retyr06 = .replace_labels(
    standardized_value_labels$retyr06,
    `-2` = "na, see KRETIRED"
  ),
    retyr07 = .replace_labels(
    standardized_value_labels$retyr07,
    `-2` = "na, see KRETIRED"
  ),
    retyr08 = .replace_labels(
    standardized_value_labels$retyr08,
    `-2` = "na, see KRETIRED"
  ),
    retyr09 = .replace_labels(
    standardized_value_labels$retyr09,
    `-2` = "na, see KRETIRED"
  ),
    retyr10 = .replace_labels(
    standardized_value_labels$retyr10,
    `-2` = "na, see KRETIRED"
  ),
    rjobchange01 = .replace_labels(
    standardized_value_labels$rjobchange01,
    `-2` = "na, see KJOBS"
  ),
    rjobchange02 = .replace_labels(
    standardized_value_labels$rjobchange02,
    `-2` = "na, see KJOBS"
  ),
    rjobchange03 = .replace_labels(
    standardized_value_labels$rjobchange03,
    `-2` = "na, see KJOBS"
  ),
    rjobchange04 = .replace_labels(
    standardized_value_labels$rjobchange04,
    `-2` = "na, see KJOBS"
  ),
    rjobchange05 = .replace_labels(
    standardized_value_labels$rjobchange05,
    `-2` = "na, see KJOBS"
  ),
    rjobchange06 = .replace_labels(
    standardized_value_labels$rjobchange06,
    `-2` = "na, see KJOBS"
  ),
    rjobchange07 = .replace_labels(
    standardized_value_labels$rjobchange07,
    `-2` = "na, see KJOBS"
  ),
    rjobchange08 = .replace_labels(
    standardized_value_labels$rjobchange08,
    `-2` = "na, see KJOBS"
  ),
    rjobchange09 = .replace_labels(
    standardized_value_labels$rjobchange09,
    `-2` = "na, see KJOBS"
  ),
    rjobchange10 = .replace_labels(
    standardized_value_labels$rjobchange10,
    `-2` = "na, see KJOBS"
  ),
    rjobchange11 = .replace_labels(
    standardized_value_labels$rjobchange11,
    `-2` = "na, see KJOBS"
  ),
    rjobchange12 = .replace_labels(
    standardized_value_labels$rjobchange12,
    `-2` = "na, see KJOBS"
  ),
    rjobchange13 = .replace_labels(
    standardized_value_labels$rjobchange13,
    `-2` = "na, see KJOBS"
  ),
    tasks = .replace_labels(
    standardized_value_labels$tasks,
    `-2` = "na, see KJOBC/S",
    `-1` = "na, asked"
  ),
    wjobchange = .replace_labels(
    standardized_value_labels$wjobchange,
    `-2` = "na, see KJOBS",
    `3` = "I switched employers"
  ),
    workret = .replace_labels(
    standardized_value_labels$workret,
    `-2` = "na, see KJOB1/KRETIRED",
    `1` = "no, I do not think so",
    `2` = "I am not sure about this",
    `3` = "yes, I do think so"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "016", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "016", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "016", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "016", waves = .lasa_wave_rows())
)

.lasa_fc_016 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

