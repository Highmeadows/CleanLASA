## LASA filecode 154 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  msmokeyn = "Do you smoke",
  .applies_to_waves = c("Z")
)

variable_labels(
  "msmokebef", "msmokeyn",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "MB", "I", "J", "K")
)

variable_labels(
  "msmokepipe",
  .applies_to_waves = c("B", "C")
)

variable_labels(
  "msmokepm",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  "msmokeqage", "msmokesage",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "msmokesh", "msmokeshnw",
  .applies_to_waves = c("D")
)

variable_labels(
  "msmokecig", "msmokeciga", "msmokecigp", "msmokecigpnw",
  .applies_to_waves = c("E", "2B", "F", "G", "H")
)

variable_labels(
  "msmokeciganw",
  .applies_to_waves = c("E", "2B", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "msmokecignw",
  .applies_to_waves = c("E", "2B", "F", "G", "I", "J", "K")
)

variable_labels(
  "msmokecignwp", "msmokeecig", "msmokeecigd", "msmokeecigf", "msmokeecigp", "msmokeecigpf",
  .applies_to_waves = c("I", "J", "K")
)

variable_labels(
  msmokecig = "Do you smoke cigarettes",
  msmokeciga = "Do you smoke cigars",
  msmokepm = "Number of packets a month",
  msmokeqage = "When did you stop smoking: age",
  msmokesage = "When did you start smoking: age",
  msmokesh = "Do you smoke shag",
  msmokeshnw = "Number of shags a week",
  .applies_to_waves = c("B")
)

variable_labels(
  msmokeciganw = "Number of cigars a week",
  .applies_to_waves = c("B", "C", "D")
)

variable_labels(
  msmokecignw = "Number of cigarettes a week",
  .applies_to_waves = c("B", "D")
)

variable_labels(
  msmokeciga = "smoking: cigars",
  msmokecignw = "Number of cigarettes or self-rolled a week",
  msmokesh = "smoking: cigarettes or shag",
  .applies_to_waves = c("C")
)

variable_labels(
  msmokecig = "do you smoke cigarettes",
  msmokeciga = "do you smoke cigars",
  msmokepipe = "do you smoke pipe",
  .applies_to_waves = c("D")
)

variable_labels(
  msmokbef = NA_character_,
  .applies_to_waves = c("E", "2B", "F", "G", "H")
)

variable_labels(
  msmokecignw = "Number of cigarettes a day",
  msmokeqage = "at what age did you stop smoking",
  .applies_to_waves = c("MB")
)

variable_labels(
  msmokecig = "Do you smoke (self-rolled) cigarettes",
  msmokeciga = "Do you smoke pipe/cigars",
  msmokecigp = "(past) Did you smoke (self-rolled) cigarettes",
  .applies_to_waves = c("I", "J", "K")
)

# define value labels ----
value_labels(
  `-4` = "no valid data",
  .applies_to_vars = c("msmokebef", "msmokecig", "msmokeciga", "msmokeciganw", "msmokecignw", "msmokepipe", "msmokepm", "msmokeqage", "msmokesage", "msmokesh", "msmokeshnw", "msmokeyn"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("msmokbef"),
  .applies_to_waves = c("Z", "E", "2B", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "R smokes / na, see CMSMOKEYN", `-1` = "no answer, asked / na, short interview", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokebef"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "na, interview terminated", `-3` = "na, wrong skip", `-2` = "R does not smoke / na, see DMSMOKEYN", `-1` = "na, asked", `1` = "no / yes", `2` = "yes / no",
  .applies_to_vars = c("msmokecig", "msmokeciga"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "R does not smoke / na, wrong skip", `-2` = "R smokes, but not cigars / na, see CMSMOKECIGA / na, see", `-1` = "na, asked", `0` = "< 1 a week",
  .applies_to_vars = c("msmokeciganw"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "R does not smoke / na, wrong skip", `-2` = "R smokes, but not cig / na, see CMSMOKESH", `-1` = "na, asked", `0` = "less than 1 a week", `1` = "1 or less a week / 1-20 cigarettes a day", `2` = "more than 20 cigarettes a day",
  .applies_to_vars = c("msmokecignw"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see I/J/KMSMOKECIGP", `-1` = "na, asked", `0` = "< 1 a week",
  .applies_to_vars = c("msmokecignwp"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-5` = "na, interview terminated", `-3` = "na, wrong skip", `-2` = "na, see E/B/F/G/HMSMOKEYN", `-1` = "na, asked", `1` = "no / yes", `2` = "yes / no",
  .applies_to_vars = c("msmokecigp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "na, interview terminated", `-3` = "na, wrong skip", `-2` = "na, see", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokecigpnw"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokeecig"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KMSMOKEECIG", `1` = "no nicotine", `2` = "1-10 mg nicotine", `3` = "11-20 mg nicotine", `4` = "21-35 mg nicotine", `5` = ">36 mg nicotine",
  .applies_to_vars = c("msmokeecigd"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KMSMOKEECIG", `1` = "most of the day", `2` = "a few times a day", `3` = "a few times a week", `4` = "a few times a month", `5` = "a few times a year",
  .applies_to_vars = c("msmokeecigf"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KMSMOKEBEF / SMOKECIGP", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokeecigp"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KMSMOKEECIGP", `-1` = "na, asked", `1` = "most of the day", `2` = "a few times a day", `3` = "a few times a week", `4` = "a few times a month", `5` = "a few times a year",
  .applies_to_vars = c("msmokeecigpf"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-5` = "na, interview terminated", `-2` = "R does not smoke / na, see DMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokepipe"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "R does not smoke / na, wrong skip", `-2` = "R smokes, but not pipe / na, see CMSMOKEPIPE", `-1` = "na, asked",
  .applies_to_vars = c("msmokepm"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "R smokes / na, wrong skip", `-2` = "R never smoked / na ,see CMSMOKEBEF / na, see DMSMOKEBEF / na, see", `-1` = "na, asked",
  .applies_to_vars = c("msmokeqage"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "R smokes / na, wrong skip", `-2` = "R never smoked / na, see CMSMOKEYN /", `-1` = "na, asked",
  .applies_to_vars = c("msmokesage"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "R does not smoke / na, see CMSMOKEYN /", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokesh"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "R does not smoke", `-2` = "R smokes, but not shag / na, see DMSMOKESH", `-1` = "na, asked",
  .applies_to_vars = c("msmokeshnw"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "na, interview terminated", `-2` = "no answer, skipped", `-1` = "no answer, asked / na, short interview", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokeyn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "R smokes", `-1` = "no answer, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokebef"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "R does not smoke", `-1` = "no answer, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokecig", "msmokeciga", "msmokepipe", "msmokesh"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "R does not smoke", `-2` = "R smokes, but not cigars", `-1` = "no answer, asked",
  .applies_to_vars = c("msmokeciganw"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "R does not smoke", `-2` = "R smokes, but not cig", `-1` = "no answer, asked",
  .applies_to_vars = c("msmokecignw"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "R does not smoke", `-2` = "R smokes, but not pipe", `-1` = "na, asked",
  .applies_to_vars = c("msmokepm"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "R smokes", `-2` = "R never smoked", `-1` = "na, asked",
  .applies_to_vars = c("msmokeqage", "msmokesage"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "R does not smoke", `-2` = "R smokes, but not shag", `-1` = "na, asked",
  .applies_to_vars = c("msmokeshnw"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "no answer, skipped", `-1` = "no answer, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokeyn"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMSMOKEYN", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokebef"),
  .applies_to_waves = c("C")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokeciga", "msmokepipe"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMSMOKECIGA", `-1` = "na, asked",
  .applies_to_vars = c("msmokeciganw"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMSMOKESH", `-1` = "na, asked",
  .applies_to_vars = c("msmokecignw"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMSMOKEPIPE", `-1` = "na, asked",
  .applies_to_vars = c("msmokepm"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na ,see CMSMOKEBEF", `-1` = "na, asked",
  .applies_to_vars = c("msmokeqage"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMSMOKEYN /",
  .applies_to_vars = c("msmokesage", "msmokesh"),
  .applies_to_waves = c("C")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokeyn"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H")
)

value_labels(
  `-2` = "na, see DMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokebef", "msmokecig", "msmokeciga", "msmokepipe", "msmokesh"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DMSMOKECIGA", `-1` = "na, asked",
  .applies_to_vars = c("msmokeciganw"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DMSMOKECIG", `-1` = "na, asked",
  .applies_to_vars = c("msmokecignw"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DMSMOKEPIPE", `-1` = "na, asked",
  .applies_to_vars = c("msmokepm"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DMSMOKEBEF", `-1` = "na, asked",
  .applies_to_vars = c("msmokeqage"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DMSMOKEYN /",
  .applies_to_vars = c("msmokesage"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DMSMOKESH", `-1` = "na, asked",
  .applies_to_vars = c("msmokeshnw"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see E/B/F/G/HMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokebef"),
  .applies_to_waves = c("E", "2B", "F", "G", "H")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokecig", "msmokecigp", "msmokecigpnw"),
  .applies_to_waves = c("E", "2B", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see E/B/F/G/HMSMOKEYN", `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("msmokeciga"),
  .applies_to_waves = c("E", "2B", "F", "G", "H")
)

value_labels(
  `-2` = "na, see",
  .applies_to_vars = c("msmokeciganw", "msmokeqage"),
  .applies_to_waves = c("E", "2B", "F", "G", "H")
)

value_labels(
  `-2` = "na, see E/B/F/GMSMOKECIG", `-1` = "na, asked", `0` = "less than 1 a week", `1` = "1 or less a week",
  .applies_to_vars = c("msmokecignw"),
  .applies_to_waves = c("E", "2B")
)

value_labels(
  `-2` = "na, see E/B/F/G/HSMOKEYN /SMOKEBEF", `-1` = "na, asked",
  .applies_to_vars = c("msmokesage"),
  .applies_to_waves = c("E", "2B", "F", "G", "H")
)

value_labels(
  `-2` = "na, see E/B/F/GMSMOKECIG", `-1` = "na, asked",
  .applies_to_vars = c("msmokecignw"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see E/B/F/GSMOKEYN", `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("msmokecig"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see E/B/F/G/HMSMOKEYN", `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("msmokecigp"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see",
  .applies_to_vars = c("msmokecigpnw"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see BMSMOKEYN /",
  .applies_to_vars = c("msmokebef"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMSMOKEYN", `-1` = "na, asked", `1` = "1-20 cigarettes a day", `2` = "more than 20 cigarettes a day",
  .applies_to_vars = c("msmokecignw"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMSMOKEBEF", `-1` = "na, asked",
  .applies_to_vars = c("msmokeqage"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokeyn"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, short interview", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokebef"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokecig", "msmokeciga"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KMSMOKECIGA", `-1` = "na, asked", `0` = "< 1 a week",
  .applies_to_vars = c("msmokeciganw"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/J/KMSMOKECIG", `-1` = "na, asked", `0` = "< 1 a week",
  .applies_to_vars = c("msmokecignw"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KMSMOKEBEF", `-1` = "na, asked",
  .applies_to_vars = c("msmokecigp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/J/KMSMOKEBEF", `-1` = "na, asked",
  .applies_to_vars = c("msmokeqage"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked",
  .applies_to_vars = c("msmokesage"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-1` = "na, short interview", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msmokeyn"),
  .applies_to_waves = c("I", "J", "K")
)

.lasa_fc_154 <- .lasa_finalize_fc("154")

