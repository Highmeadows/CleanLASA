## LASA filecode 142 -- variable names, variable labels, value labels,
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
  mhhacqh = "numeric",
  mhhacqu = "categorical",
  mhhacqy = "numeric",
  mhhbrsh = "numeric",
  mhhbrsi = "categorical",
  mhhbrsy = "numeric",
  mhhchin = "categorical",
  mhhchnh = "numeric",
  mhhchny = "numeric",
  mhhgrah = "numeric",
  mhhgray = "numeric",
  mhhgrch = "categorical",
  mhhneig = "categorical",
  mhhneih = "numeric",
  mhhneiy = "numeric",
  mhhotfa = "categorical",
  mhhotfh = "numeric",
  mhhotfy = "numeric",
  mhhothh = "numeric",
  mhhothn = "categorical",
  mhhothy = "numeric",
  mhhparn = "categorical",
  mhhpart = "categorical",
  mhhprnh = "numeric",
  mhhprny = "numeric",
  mhhprth = "numeric",
  mhhprty = "numeric",
  mhhyn = "categorical",
  mphacqh = "numeric",
  mphacqu = "categorical",
  mphacqy = "numeric",
  mphbrsh = "numeric",
  mphbrsi = "categorical",
  mphbrsy = "numeric",
  mphchin = "categorical",
  mphchnh = "numeric",
  mphchny = "numeric",
  mphgrah = "numeric",
  mphgray = "numeric",
  mphgrch = "categorical",
  mphneig = "categorical",
  mphneih = "numeric",
  mphneiy = "numeric",
  mphotfa = "categorical",
  mphotfh = "numeric",
  mphotfy = "numeric",
  mphothh = "numeric",
  mphothn = "categorical",
  mphothy = "numeric",
  mphparn = "categorical",
  mphpart = "categorical",
  mphprnh = "numeric",
  mphprny = "numeric",
  mphprth = "numeric",
  mphprty = "numeric",
  mphyn = "categorical",
  qcarbur = "categorical",
  qhhacqh = "numeric",
  qhhacqhp = "categorical",
  qhhacqm = "categorical",
  qhhacqu = "categorical",
  qhhacqy = "numeric",
  qhhbrsh = "numeric",
  qhhbrshp = "categorical",
  qhhbrsi = "categorical",
  qhhbrsm = "categorical",
  qhhbrsy = "numeric",
  qhhchin = "categorical",
  qhhchnh = "numeric",
  qhhchnhp = "categorical",
  qhhchnm = "categorical",
  qhhchny = "numeric",
  qhhgrah = "numeric",
  qhhgrahp = "categorical",
  qhhgram = "categorical",
  qhhgray = "numeric",
  qhhgrch = "categorical",
  qhhneig = "categorical",
  qhhneih = "numeric",
  qhhneihp = "categorical",
  qhhneim = "categorical",
  qhhneiy = "numeric",
  qhhotfa = "categorical",
  qhhotfh = "numeric",
  qhhotfhp = "categorical",
  qhhotfm = "categorical",
  qhhotfy = "numeric",
  qhhothh = "numeric",
  qhhothhp = "categorical",
  qhhothm = "categorical",
  qhhothn = "categorical",
  qhhothy = "numeric",
  qhhparn = "categorical",
  qhhpart = "categorical",
  qhhprnh = "numeric",
  qhhprnhp = "categorical",
  qhhprnm = "categorical",
  qhhprny = "numeric",
  qhhprth = "numeric",
  qhhprthp = "categorical",
  qhhprtm = "categorical",
  qhhprty = "numeric",
  qhhyn = "categorical",
  qphacqh = "numeric",
  qphacqhp = "categorical",
  qphacqm = "categorical",
  qphacqu = "categorical",
  qphacqy = "numeric",
  qphbrsh = "numeric",
  qphbrshp = "categorical",
  qphbrsi = "categorical",
  qphbrsm = "categorical",
  qphbrsy = "numeric",
  qphchin = "categorical",
  qphchir = "categorical",
  qphchnh = "numeric",
  qphchnhp = "categorical",
  qphchnm = "categorical",
  qphchny = "numeric",
  qphchrh = "numeric",
  qphchrhp = "categorical",
  qphchrm = "categorical",
  qphchry = "numeric",
  qphgrah = "numeric",
  qphgrahp = "categorical",
  qphgram = "categorical",
  qphgray = "numeric",
  qphgrch = "categorical",
  qphneig = "categorical",
  qphneih = "numeric",
  qphneihp = "categorical",
  qphneim = "categorical",
  qphneiy = "numeric",
  qphotfa = "categorical",
  qphotfh = "numeric",
  qphotfhp = "categorical",
  qphotfm = "categorical",
  qphotfy = "numeric",
  qphothh = "numeric",
  qphothhp = "categorical",
  qphothm = "categorical",
  qphothn = "categorical",
  qphothr = "categorical",
  qphothy = "numeric",
  qphotrh = "numeric",
  qphotrhp = "categorical",
  qphotrm = "categorical",
  qphotry = "numeric",
  qphparn = "categorical",
  qphparr = "categorical",
  qphpart = "categorical",
  qphprnh = "numeric",
  qphprnhp = "categorical",
  qphprnm = "categorical",
  qphprny = "numeric",
  qphprrh = "numeric",
  qphprrhp = "categorical",
  qphprrm = "categorical",
  qphprry = "numeric",
  qphprth = "numeric",
  qphprthp = "categorical",
  qphprtm = "categorical",
  qphprty = "numeric",
  qphyn = "categorical"
)

# define variable labels ----
variable_labels(
  mhhacqh = "Hours help dom. tasks acquaintances",
  mhhacqu = "Help dom. tasks acquaintances",
  mhhacqy = "Start year help dom. tasks acquaintances",
  mhhbrsh = "Hours help dom. tasks brother/sister",
  mhhbrsi = "Help dom. tasks brother/sister",
  mhhbrsy = "Start year help dom. tasks brother/sister",
  mhhchin = "Help dom. tasks non-resident child",
  mhhchnh = "Hours help dom. tasks non-resident child",
  mhhchny = "Start year help dom. tasks non-resident child",
  mhhgrah = "Hours help dom. tasks grandchild",
  mhhgray = "Start year help dom. tasks grandchild",
  mhhgrch = "Help dom. tasks grandchild",
  mhhneig = "Help dom. tasks neighbour",
  mhhneih = "Hours help dom. tasks neighbour",
  mhhneiy = "Start year help dom. tasks neighbour",
  mhhotfa = "Help dom. tasks other family",
  mhhotfh = "Hours help dom. tasks other family",
  mhhotfy = "Start year help dom. tasks other family",
  mhhothh = "Hours help dom. tasks other",
  mhhothn = "Help dom. tasks other",
  mhhothy = "Start year help dom. tasks other",
  mhhparn = "Help dom. tasks non-resident parent outside household",
  mhhpart = "Help dom. tasks partner outside household",
  mhhprnh = "Hours help dom. tasks non-resident parent",
  mhhprny = "Start year help dom. tasks non-resident parent",
  mhhprth = "Hours help dom. tasks partner outside household",
  mhhprty = "Start year help dom. tasks partner outside household",
  mhhyn = "Help given with domestic tasks",
  mphacqh = "Hours help pers. care acquaintances",
  mphacqu = "Help pers. care acquaintances",
  mphacqy = "Start year help pers. care acquaintances",
  mphbrsh = "Hours help pers. care brother/sister",
  mphbrsi = "Help pers. care brother/sister",
  mphbrsy = "Start year help pers. care brother/sister",
  mphchin = "Help pers. care non-resident child",
  mphchnh = "Hours help pers. care non-resident child",
  mphchny = "Start year help pers. care non-resident child",
  mphgrah = "Hours help pers. care grandchild",
  mphgray = "Start year help pers. care grandchild",
  mphgrch = "Help pers. care grandchild",
  mphneig = "Help pers. care neighbour",
  mphneih = "Hours help pers. care neighbour",
  mphneiy = "Start year help pers. care neighbour",
  mphotfa = "Help pers. care other family",
  mphotfh = "Hours help pers. care other family",
  mphotfy = "Start year help pers. care other family",
  mphothh = "Hours help pers. care other",
  mphothn = "Help pers. care other",
  mphothy = "Start year help pers. care other",
  mphparn = "Help pers. care non-resident parent",
  mphpart = "Help pers. care partner",
  mphprnh = "Hours help pers. care non-resident parent",
  mphprny = "Start year help pers. care non-resident parent",
  mphprth = "Hours help pers. care partner",
  mphprty = "Start year help pers. care partner",
  mphyn = "Help given with personal care",
  qcarbur = "Care giving: burden for respondent",
  qhhacqh = "Hours help dom. tasks acquaintances",
  qhhacqhp = "Health problems help dom. tasks acquaintances",
  qhhacqm = "Start month help dom. tasks acquaintances",
  qhhacqu = "Help dom. tasks acquaintances",
  qhhacqy = "Start year help dom. tasks acquaintances",
  qhhbrsh = "Hours help dom. tasks brother/sister",
  qhhbrshp = "Health problems help dom. tasks brother/sister",
  qhhbrsi = "Help dom. tasks brother/sister",
  qhhbrsm = "Start month help dom. tasks brother/sister",
  qhhbrsy = "Start year help dom. tasks brother/sister",
  qhhchin = "Help dom. tasks non-resident child",
  qhhchnh = "Hours help dom. tasks non-resident child",
  qhhchnhp = "Health problems help dom. tasks non-resident child",
  qhhchnm = "Start month help dom. tasks non-resident child",
  qhhchny = "Start year help dom. tasks non-resident child",
  qhhgrah = "Hours help dom. tasks grandchild",
  qhhgrahp = "Health problems help dom. tasks grandchild",
  qhhgram = "Start month help dom. tasks grandchild",
  qhhgray = "Start year help dom. tasks grandchild",
  qhhgrch = "Help dom. tasks grandchild",
  qhhneig = "Help dom. tasks neighbour",
  qhhneih = "Hours help dom. tasks neighbour",
  qhhneihp = "Health problems help dom. tasks neighbour",
  qhhneim = "Start month help dom. tasks neighbour",
  qhhneiy = "Start year help dom. tasks neighbour",
  qhhotfa = "Help dom. tasks other family",
  qhhotfh = "Hours help dom. tasks other family",
  qhhotfhp = "Health problems help dom. tasks other family",
  qhhotfm = "Start month help dom. tasks other family",
  qhhotfy = "Start year help dom. tasks other family",
  qhhothh = "Hours help dom. tasks other",
  qhhothhp = "Health problems help dom. tasks other",
  qhhothm = "Start month help dom. tasks other",
  qhhothn = "Help dom. tasks other",
  qhhothy = "Start year help dom. tasks other",
  qhhparn = "Help dom. tasks non-resident parent",
  qhhpart = "Help domestic tasks: partner",
  qhhprnh = "Hours help dom. tasks non-resident parent",
  qhhprnhp = "Health problems help dom. tasks non-resident parent",
  qhhprnm = "Start month help dom. tasks non-resident parent",
  qhhprny = "Start year help dom. tasks non-resident parent",
  qhhprth = "Hours help domestic tasks: partner",
  qhhprthp = "Health problems help dom. tasks partner",
  qhhprtm = "Start month help domestic tasks: partner",
  qhhprty = "Start year help domestic tasks: partner",
  qhhyn = "Help given with domestic tasks y/n",
  qphacqh = "Hours help pers. care acquaintances",
  qphacqhp = "Health problems help pers. care acquaintances",
  qphacqm = "Start month help pers. care acquaintances",
  qphacqu = "Help pers. care acquaintances",
  qphacqy = "Start year help pers. care acquaintances",
  qphbrsh = "Hours help pers. care brother/sister",
  qphbrshp = "Health problems help pers. care brother/sister",
  qphbrsi = "Help pers. care brother/sister",
  qphbrsm = "Start month help pers. care brother/sister",
  qphbrsy = "Start year help pers. care brother/sister",
  qphchin = "Help pers. care non-resident child",
  qphchir = "Help pers. care resident child",
  qphchnh = "Hours help pers. care non-resident child",
  qphchnhp = "Health problems help pers. care non-resident child",
  qphchnm = "Start month help pers. care non-resident child",
  qphchny = "Start year help pers. care non-resident child",
  qphchrh = "Hours help pers. care resident child",
  qphchrhp = "Health problems help pers. care resident child",
  qphchrm = "Start month help pers. care resident child",
  qphchry = "Start year help pers. care resident child",
  qphgrah = "Hours help pers. care grandchild",
  qphgrahp = "Health problems help pers. care grandchild",
  qphgram = "Start month help pers. care grandchild",
  qphgray = "Start year help pers. care grandchild",
  qphgrch = "Help pers. care grandchild",
  qphneig = "Help pers. care neighbour",
  qphneih = "Hours help pers. care neighbour",
  qphneihp = "Health problems help pers. care neighbour",
  qphneim = "Start month help pers. care neighbour",
  qphneiy = "Start year help pers. care neighbour",
  qphotfa = "Help pers. care other family",
  qphotfh = "Hours help pers. care other family",
  qphotfhp = "Health problems help pers. care other family",
  qphotfm = "Start month help pers. care other family",
  qphotfy = "Start year help pers. care other family",
  qphothh = "Hours help pers. care other",
  qphothhp = "Health problems help pers. care other",
  qphothm = "Start month help pers. care other",
  qphothn = "Help pers. care other",
  qphothr = "Help pers. care resident other",
  qphothy = "Start year help pers. care other",
  qphotrh = "Hours help pers. care resident other",
  qphotrhp = "Health problems help pers. care resident other",
  qphotrm = "Start month help pers. care resident other",
  qphotry = "Start year help pers. care resident other",
  qphparn = "Help pers. care non-resident parent",
  qphparr = "Help pers. care resident parent",
  qphpart = "Help personal care: partner",
  qphprnh = "Hours help pers. care non-resident parent",
  qphprnhp = "Health problems help pers. care non-resident parent",
  qphprnm = "Start month help pers. care non-resident parent",
  qphprny = "Start year help pers. care non-resident parent",
  qphprrh = "Hours help pers. care resident parent",
  qphprrhp = "Health problems help pers. care resident parent",
  qphprrm = "Start month help pers. care resident parent",
  qphprry = "Start year help pers. care resident parent",
  qphprth = "Hours help personal care: partner",
  qphprthp = "Health problems help pers. care partner",
  qphprtm = "Start month help personal care: partner",
  qphprty = "Start year help personal care: partner",
  qphyn = "Help given with personal care y/n",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qhhacqh", "qhhacqu", "qhhbrsh", "qhhbrsi", "qhhchin", "qhhchnh", "qhhgrah", "qhhgrch", "qhhneig", "qhhneih", "qhhotfa", "qhhotfh", "qhhothh", "qhhothn", "qhhparn", "qhhprnh", "qphacqh", "qphacqu", "qphbrsh", "qphbrsi", "qphchin", "qphchnh", "qphgrah", "qphgrch", "qphneig", "qphneih", "qphotfa", "qphotfh", "qphothh", "qphothn", "qphparn", "qphprnh",
  .applies_to_waves = c("2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "qhhyn", "qphyn",
  .applies_to_waves = c("2B", "F", "I", "J", "K")
)

variable_labels(
  "qphchir", "qphchrh", "qphothr", "qphotrh", "qphparr", "qphprrh",
  .applies_to_waves = c("2B", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "qcarbur",
  .applies_to_waves = c("G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "qhhacqm", "qhhacqy", "qhhbrsm", "qhhbrsy", "qhhchnm", "qhhchny", "qhhgram", "qhhgray", "qhhneim", "qhhneiy", "qhhotfm", "qhhotfy", "qhhothm", "qhhothy", "qhhprnm", "qhhprny", "qphacqm", "qphacqy", "qphbrsm", "qphbrsy", "qphchnm", "qphchny", "qphgram", "qphgray", "qphneim", "qphneiy", "qphotfm", "qphotfy", "qphothm", "qphothy", "qphprnm", "qphprny",
  .applies_to_waves = c("G", "H", "3B")
)

variable_labels(
  "qphchrm", "qphchry", "qphotrm", "qphotry", "qphprrm", "qphprry",
  .applies_to_waves = c("G", "H")
)

variable_labels(
  "mhhacqh", "mhhacqu", "mhhacqy", "mhhbrsh", "mhhbrsi", "mhhbrsy", "mhhchin", "mhhchnh", "mhhchny", "mhhgrah", "mhhgray", "mhhgrch", "mhhneig", "mhhneih", "mhhneiy", "mhhotfa", "mhhotfh", "mhhotfy", "mhhothh", "mhhothn", "mhhothy", "mhhparn", "mhhpart", "mhhprnh", "mhhprny", "mhhprth", "mhhprty", "mhhyn", "mphacqh", "mphacqu", "mphacqy", "mphbrsh", "mphbrsi", "mphbrsy", "mphchin", "mphchnh", "mphchny", "mphgrah", "mphgray", "mphgrch", "mphneig", "mphneih", "mphneiy", "mphotfa", "mphotfh", "mphotfy", "mphothh", "mphothn", "mphothy", "mphparn", "mphpart", "mphprnh", "mphprny", "mphprth", "mphprty", "mphyn",
  .applies_to_waves = c("MB")
)

variable_labels(
  "qhhacqhp", "qhhbrshp", "qhhchnhp", "qhhgrahp", "qhhneihp", "qhhotfhp", "qhhothhp", "qhhprnhp", "qhhprthp", "qphacqhp", "qphbrshp", "qphchnhp", "qphchrhp", "qphgrahp", "qphneihp", "qphotfhp", "qphothhp", "qphotrhp", "qphprnhp", "qphprrhp", "qphprthp",
  .applies_to_waves = c("I", "J", "K")
)

variable_labels(
  qhhpart = "Help dom. tasks partner",
  qhhprth = "Hours help dom. tasks partner",
  qphpart = "Help pers. care partner",
  qphprth = "Hours help pers. care partner",
  .applies_to_waves = c("2B", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  qhhprtm = "Start month help dom. tasks partner",
  qhhprty = "Start year help dom. tasks partner",
  qphprtm = "Start month help pers. care partner",
  qphprty = "Start year help pers. care partner",
  .applies_to_waves = c("G", "H")
)

variable_labels(
  qhhyn = "Help given with domestic tasks",
  qphyn = "Help given with personal care",
  .applies_to_waves = c("G", "H", "3B")
)

variable_labels(
  qhhpart = "Help dom. tasks partner outside household",
  qhhprth = "Hours help dom. tasks partner outside household",
  qhhprtm = "Start month help dom. tasks partner outside household",
  qhhprty = "Start year help dom. tasks partner outside household",
  qphpart = "Help pers. care partner outside household",
  qphprth = "Hours help pers. care partner outside household",
  qphprtm = "Start month help pers. care partner outside household",
  qphprty = "Start year help pers. care partner outside household",
  .applies_to_waves = c("3B")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("mhhacqh", "mhhacqu", "mhhacqy", "mhhbrsh", "mhhbrsi", "mhhbrsy", "mhhchin", "mhhchnh", "mhhchny", "mhhgrah", "mhhgray", "mhhgrch", "mhhneig", "mhhneih", "mhhneiy", "mhhotfa", "mhhotfh", "mhhotfy", "mhhothh", "mhhothn", "mhhothy", "mhhparn", "mhhpart", "mhhprnh", "mhhprny", "mhhprth", "mhhprty", "mhhyn", "mphacqh", "mphacqu", "mphacqy", "mphbrsh", "mphbrsi", "mphbrsy", "mphchin", "mphchnh", "mphchny", "mphgrah", "mphgray", "mphgrch", "mphneig", "mphneih", "mphneiy", "mphotfa", "mphotfh", "mphotfy", "mphothh", "mphothn", "mphothy", "mphparn", "mphpart", "mphprnh", "mphprny", "mphprth", "mphprty", "mphyn", "qcarbur", "qhhacqh", "qhhacqhp", "qhhacqm", "qhhacqu", "qhhacqy", "qhhbrsh", "qhhbrshp", "qhhbrsi", "qhhbrsm", "qhhbrsy", "qhhchin", "qhhchnh", "qhhchnhp", "qhhchnm", "qhhchny", "qhhgrah", "qhhgrahp", "qhhgram", "qhhgray", "qhhgrch", "qhhneig", "qhhneih", "qhhneihp", "qhhneim", "qhhneiy", "qhhotfa", "qhhotfh", "qhhotfhp", "qhhotfm", "qhhotfy", "qhhothh", "qhhothhp", "qhhothm", "qhhothn", "qhhothy", "qhhparn", "qhhpart", "qhhprnh", "qhhprnhp", "qhhprnm", "qhhprny", "qhhprth", "qhhprthp", "qhhprtm", "qhhprty", "qhhyn", "qphacqh", "qphacqhp", "qphacqm", "qphacqu", "qphacqy", "qphbrsh", "qphbrshp", "qphbrsi", "qphbrsm", "qphbrsy", "qphchin", "qphchir", "qphchnh", "qphchnhp", "qphchnm", "qphchny", "qphchrh", "qphchrhp", "qphchrm", "qphchry", "qphgrah", "qphgrahp", "qphgram", "qphgray", "qphgrch", "qphneig", "qphneih", "qphneihp", "qphneim", "qphneiy", "qphotfa", "qphotfh", "qphotfhp", "qphotfm", "qphotfy", "qphothh", "qphothhp", "qphothm", "qphothn", "qphothr", "qphothy", "qphotrh", "qphotrhp", "qphotrm", "qphotry", "qphparn", "qphparr", "qphpart", "qphprnh", "qphprnhp", "qphprnm", "qphprny", "qphprrh", "qphprrhp", "qphprrm", "qphprry", "qphprth", "qphprthp", "qphprtm", "qphprty", "qphyn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available",
  .applies_to_vars = c("mhhacqh", "mhhacqu", "mhhacqy", "mhhbrsh", "mhhbrsi", "mhhbrsy", "mhhchin", "mhhchnh", "mhhchny", "mhhgrah", "mhhgray", "mhhgrch", "mhhneig", "mhhneih", "mhhneiy", "mhhotfa", "mhhotfh", "mhhotfy", "mhhothh", "mhhothn", "mhhothy", "mhhparn", "mhhpart", "mhhprnh", "mhhprny", "mhhprth", "mhhprty", "mphacqh", "mphacqu", "mphacqy", "mphbrsh", "mphbrsi", "mphbrsy", "mphchin", "mphchnh", "mphchny", "mphgrah", "mphgray", "mphgrch", "mphneig", "mphneih", "mphneiy", "mphotfa", "mphotfh", "mphotfy", "mphothh", "mphothn", "mphothy", "mphparn", "mphpart", "mphprnh", "mphprny", "mphprth", "mphprty", "qhhacqh", "qhhacqhp", "qhhacqm", "qhhacqu", "qhhacqy", "qhhbrsh", "qhhbrshp", "qhhbrsi", "qhhbrsm", "qhhbrsy", "qhhchin", "qhhchnh", "qhhchnhp", "qhhchnm", "qhhchny", "qhhgrah", "qhhgrahp", "qhhgram", "qhhgray", "qhhgrch", "qhhneig", "qhhneih", "qhhneihp", "qhhneim", "qhhneiy", "qhhotfa", "qhhotfh", "qhhotfhp", "qhhotfm", "qhhotfy", "qhhothh", "qhhothhp", "qhhothm", "qhhothn", "qhhothy", "qhhparn", "qhhpart", "qhhprnh", "qhhprnhp", "qhhprnm", "qhhprny", "qhhprth", "qhhprthp", "qhhprtm", "qhhprty", "qphacqh", "qphacqhp", "qphacqm", "qphacqu", "qphacqy", "qphbrsh", "qphbrshp", "qphbrsi", "qphbrsm", "qphbrsy", "qphchin", "qphchir", "qphchnh", "qphchnhp", "qphchnm", "qphchny", "qphchrh", "qphchrhp", "qphchrm", "qphchry", "qphgrah", "qphgrahp", "qphgram", "qphgray", "qphgrch", "qphneig", "qphneih", "qphneihp", "qphneim", "qphneiy", "qphotfa", "qphotfh", "qphotfhp", "qphotfm", "qphotfy", "qphothh", "qphothhp", "qphothm", "qphothn", "qphothr", "qphothy", "qphotrh", "qphotrhp", "qphotrm", "qphotry", "qphparn", "qphparr", "qphpart", "qphprnh", "qphprnhp", "qphprnm", "qphprny", "qphprrh", "qphprrhp", "qphprrm", "qphprry", "qphprth", "qphprthp", "qphprtm", "qphprty"),
  .applies_to_waves = c("Z")
)

value_labels(
  `168` = NA_character_,
  .applies_to_vars = c("mhhacqh", "mhhbrsh", "mhhgrah", "mhhneih", "mhhotfh", "mhhothh", "mphacqh", "mphbrsh", "mphgrah", "mphneih", "mphotfh", "mphothh", "qhhacqh", "qhhbrsh", "qhhgrah", "qhhneih", "qhhotfh", "qhhothh", "qphacqh", "qphbrsh", "qphchrh", "qphgrah", "qphneih", "qphotfh", "qphothh", "qphotrh", "qphprrh"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mhhacqu", "mhhbrsi", "mhhchin", "mhhgrch", "mhhneig", "mhhotfa", "mhhothn", "mhhparn", "mhhpart", "mphacqu", "mphbrsi", "mphchin", "mphgrch", "mphneig", "mphotfa", "mphothn", "mphparn", "mphpart", "qhhacqu", "qhhbrsi", "qhhchin", "qhhgrch", "qhhneig", "qhhotfa", "qhhothn", "qhhparn", "qhhpart", "qphacqu", "qphbrsi", "qphchin", "qphchir", "qphgrch", "qphneig", "qphotfa", "qphothn", "qphothr", "qphparn", "qphparr", "qphpart"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("mhhchnh", "mhhprnh", "mhhprth", "mphchnh", "mphprnh", "mphprth", "qhhchnh", "qhhprnh", "qhhprth", "qphchnh", "qphprnh", "qphprth"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mhhyn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("mphyn", "qhhacqhp", "qhhbrshp", "qhhchnhp", "qhhgrahp", "qhhneihp", "qhhotfhp", "qhhothhp", "qhhprnhp", "qhhprthp", "qhhyn", "qphacqhp", "qphbrshp", "qphchnhp", "qphchrhp", "qphgrahp", "qphneihp", "qphotfhp", "qphothhp", "qphotrhp", "qphprnhp", "qphprrhp", "qphprthp", "qphyn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available", `1` = "not at all or hardly a burden", `2` = "somewhat a burden", `3` = "rather heavy burden", `4` = "very heavy burden", `5` = "overburdened", `6` = "R does not give any domestic or personal care",
  .applies_to_vars = c("qcarbur"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhacqm", "qhhbrsm", "qhhchnm", "qhhgram", "qhhneim", "qhhotfm", "qhhothm", "qhhprnm", "qhhprtm", "qphacqm", "qphbrsm", "qphchnm", "qphchrm", "qphgram", "qphneim", "qphotfm", "qphothm", "qphotrm", "qphprnm", "qphprrm", "qphprtm"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see b/fqhhyn",
  .applies_to_vars = c("qhhacqu", "qhhbrsi", "qhhchin", "qhhgrch", "qhhneig", "qhhotfa", "qhhothn", "qhhparn", "qhhpart"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqphyn",
  .applies_to_vars = c("qphacqu", "qphbrsi", "qphchin", "qphchir", "qphgrch", "qphneig", "qphotfa", "qphothn", "qphothr", "qphparn", "qphparr", "qphpart"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqhhacqu", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhacqh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("qhhacqu", "qhhbrsi", "qhhchin", "qhhgrch", "qhhneig", "qhhotfa", "qhhothn", "qhhparn", "qhhpart", "qphacqu", "qphbrsi", "qphchin", "qphchir", "qphgrch", "qphneig", "qphotfa", "qphothn", "qphothr", "qphparn", "qphparr", "qphpart"),
  .applies_to_waves = c("2B", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "na, see b/fqhhbrsi", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhbrsh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqhhchin", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qhhchnh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqhhgrch", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhgrah"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqhhneig", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhneih"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqhhotfa", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhotfh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqhhothn", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhothh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqhhparn", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qhhprnh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqhhpart", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qhhprth"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qhhyn", "qphyn"),
  .applies_to_waves = c("2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see b/fqphacqu", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphacqh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqphbrsi", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphbrsh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqphchin", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphchnh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqphchir", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphchrh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqphgrch", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphgrah"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqphneig", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphneih"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqphotfa", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphotfh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqphothn", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphothh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqphothr", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphotrh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqphparn", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphprnh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqphparr", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphprrh"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see b/fqphpart", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphprth"),
  .applies_to_waves = c("2B", "F")
)

value_labels(
  `-2` = "na, see g/hqhhyn",
  .applies_to_vars = c("qhhacqu", "qhhbrsi", "qhhchin", "qhhgrch", "qhhneig", "qhhotfa", "qhhothn", "qhhparn", "qhhpart"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphyn",
  .applies_to_vars = c("qphacqu", "qphbrsi", "qphchin", "qphchir", "qphgrch", "qphneig", "qphotfa", "qphothn", "qphothr", "qphparn", "qphparr", "qphpart"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-1` = "na, asked", `1` = "not at all or hardly a burden", `2` = "somewhat a burden", `3` = "rather heavy burden", `4` = "very heavy burden", `5` = "overburdened",
  .applies_to_vars = c("qcarbur"),
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "na, see g/hqhhacqu", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhacqh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhacqu", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhacqm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhacqu", `-1` = "na, asked",
  .applies_to_vars = c("qhhacqy"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhbrsi", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhbrsh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhbrsi", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhbrsm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhbrsi", `-1` = "na, asked",
  .applies_to_vars = c("qhhbrsy"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhchin", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qhhchnh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhchin", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhchnm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhchin", `-1` = "na, asked",
  .applies_to_vars = c("qhhchny"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhgrch", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhgrah"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhgrch", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhgram"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhgrch", `-1` = "na, asked",
  .applies_to_vars = c("qhhgray"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhneig", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhneih"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhneig", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhneim"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhneig", `-1` = "na, asked",
  .applies_to_vars = c("qhhneiy"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhotfa", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhotfh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhotfa", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhotfm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhotfa", `-1` = "na, asked",
  .applies_to_vars = c("qhhotfy"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhothn", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhothh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhothn", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhothm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhothn", `-1` = "na, asked",
  .applies_to_vars = c("qhhothy"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhparn", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qhhprnh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhparn", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhprnm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhparn", `-1` = "na, asked",
  .applies_to_vars = c("qhhprny"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhpart", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qhhprth"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhpart", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhprtm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqhhpart", `-1` = "na, asked",
  .applies_to_vars = c("qhhprty"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphacqu", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphacqh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphacqu", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphacqm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphacqu", `-1` = "na, asked",
  .applies_to_vars = c("qphacqy"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphbrsi", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphbrsh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphbrsi", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphbrsm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphbrsi", `-1` = "na, asked",
  .applies_to_vars = c("qphbrsy"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphchin", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphchnh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphchin", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphchnm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphchin", `-1` = "na, asked",
  .applies_to_vars = c("qphchny"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphchir", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphchrh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphchir", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphchrm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphchir", `-1` = "na, asked",
  .applies_to_vars = c("qphchry"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphgrch", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphgrah"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphgrch", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphgram"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphgrch", `-1` = "na, asked",
  .applies_to_vars = c("qphgray"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphneig", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphneih"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphneig", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphneim"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphneig", `-1` = "na, asked",
  .applies_to_vars = c("qphneiy"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphotfa", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphotfh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphotfa", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphotfm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphotfa", `-1` = "na, asked",
  .applies_to_vars = c("qphotfy"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphothn", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphothh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphothn", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphothm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphothn", `-1` = "na, asked",
  .applies_to_vars = c("qphothy"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphothr", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphotrh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphothr", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphotrm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphothr", `-1` = "na, asked",
  .applies_to_vars = c("qphotry"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphparn", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphprnh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphparn", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphprnm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphparn", `-1` = "na, asked",
  .applies_to_vars = c("qphprny"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphparr", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphprrh"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphparr", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphprrm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphparr", `-1` = "na, asked",
  .applies_to_vars = c("qphprry"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphpart", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphprth"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphpart", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphprtm"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see g/hqphpart", `-1` = "na, asked",
  .applies_to_vars = c("qphprty"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-1` = "na, asked", `1` = "not at all or hardly a burden", `2` = "somewhat a burden", `3` = "rather heavy burden", `4` = "very heavy burden", `5` = "overburdened", `6` = "R does not give any domestic or personal care",
  .applies_to_vars = c("qcarbur"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhacqu", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhacqh"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhacqu", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhacqm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhyn", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("qhhacqu", "qhhbrsi", "qhhchin", "qhhgrch", "qhhneig", "qhhotfa", "qhhothn", "qhhparn", "qhhpart"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhacqu", `-1` = "na, asked",
  .applies_to_vars = c("qhhacqy"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhbrsi", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhbrsh"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhbrsi", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhbrsm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhbrsi", `-1` = "na, asked",
  .applies_to_vars = c("qhhbrsy"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhchin", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qhhchnh"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhchin", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhchnm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhchin", `-1` = "na, asked",
  .applies_to_vars = c("qhhchny"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhgrch", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhgrah"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhgrch", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhgram"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhgrch", `-1` = "na, asked",
  .applies_to_vars = c("qhhgray"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhneig", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhneih"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhneig", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhneim"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhneig", `-1` = "na, asked",
  .applies_to_vars = c("qhhneiy"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhotfa", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhotfh"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhotfa", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhotfm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhotfa", `-1` = "na, asked",
  .applies_to_vars = c("qhhotfy"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhothn", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhothh"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhothn", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhothm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhothn", `-1` = "na, asked",
  .applies_to_vars = c("qhhothy"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhparn", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qhhprnh"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhparn", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhprnm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhparn", `-1` = "na, asked",
  .applies_to_vars = c("qhhprny"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhpart", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qhhprth"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhpart", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qhhprtm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqhhpart", `-1` = "na, asked",
  .applies_to_vars = c("qhhprty"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphacqu", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphacqh"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphacqu", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphacqm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphyn", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("qphacqu", "qphbrsi", "qphchin", "qphgrch", "qphneig", "qphotfa", "qphothn", "qphparn", "qphpart"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphacqu", `-1` = "na, asked",
  .applies_to_vars = c("qphacqy"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphbrsi", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphbrsh"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphbrsi", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphbrsm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphbrsi", `-1` = "na, asked",
  .applies_to_vars = c("qphbrsy"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphchin", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qphchnh"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphchin", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphchnm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphchin", `-1` = "na, asked",
  .applies_to_vars = c("qphchny"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphgrch", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphgrah"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphgrch", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphgram"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphgrch", `-1` = "na, asked",
  .applies_to_vars = c("qphgray"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphneig", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphneih"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphneig", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphneim"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphneig", `-1` = "na, asked",
  .applies_to_vars = c("qphneiy"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphotfa", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphotfh"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphotfa", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphotfm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphotfa", `-1` = "na, asked",
  .applies_to_vars = c("qphotfy"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphothn", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphothh"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphothn", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphothm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphothn", `-1` = "na, asked",
  .applies_to_vars = c("qphothy"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphparn", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qphprnh"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphparn", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphprnm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphparn", `-1` = "na, asked",
  .applies_to_vars = c("qphprny"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphpart", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qphprth"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphpart", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("qphprtm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see bqphpar", `-1` = "na, asked",
  .applies_to_vars = c("qphprty"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BMHHACQU", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("mhhacqh"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHYN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mhhacqu", "mhhbrsi", "mhhchin", "mhhgrch", "mhhneig", "mhhotfa", "mhhothn", "mhhparn", "mhhpart"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHACQU", `-1` = "na, asked",
  .applies_to_vars = c("mhhacqy"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHBRSI", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("mhhbrsh"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHBRSI", `-1` = "na, asked",
  .applies_to_vars = c("mhhbrsy"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHCHIN", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("mhhchnh"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHCHIN", `-1` = "na, asked",
  .applies_to_vars = c("mhhchny"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHGRCH", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("mhhgrah"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHGRCH", `-1` = "na, asked",
  .applies_to_vars = c("mhhgray"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHNEIG", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("mhhneih"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHNEIG", `-1` = "na, asked",
  .applies_to_vars = c("mhhneiy"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHOTFA", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("mhhotfh"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHOTFA", `-1` = "na, asked",
  .applies_to_vars = c("mhhotfy"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHOTHN", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("mhhothh"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHOTHN", `-1` = "na, asked",
  .applies_to_vars = c("mhhothy"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHPARN", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("mhhprnh"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHPARN", `-1` = "na, asked",
  .applies_to_vars = c("mhhprny"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHPART", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("mhhprth"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMHHPART", `-1` = "na, asked",
  .applies_to_vars = c("mhhprty"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-5` = "na, terminated interview", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mhhyn"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHACQU", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("mphacqh"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHYN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mphacqu", "mphbrsi", "mphchin", "mphgrch", "mphneig", "mphotfa", "mphothn", "mphparn", "mphpart"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHACQU", `-1` = "na, asked",
  .applies_to_vars = c("mphacqy"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHBRSI", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("mphbrsh"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHBRSI", `-1` = "na, asked",
  .applies_to_vars = c("mphbrsy"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHCHIN", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("mphchnh"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHCHIN", `-1` = "na, asked",
  .applies_to_vars = c("mphchny"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHGRCH", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("mphgrah"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHGRCH", `-1` = "na, asked",
  .applies_to_vars = c("mphgray"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHNEIG", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("mphneih"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHNEIG", `-1` = "na, asked",
  .applies_to_vars = c("mphneiy"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHOTFA", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("mphotfh"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHOTFA", `-1` = "na, asked",
  .applies_to_vars = c("mphotfy"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHOTHN", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("mphothh"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHOTHN", `-1` = "na, asked",
  .applies_to_vars = c("mphothy"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHPARN", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("mphprnh"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHPARN", `-1` = "na, asked",
  .applies_to_vars = c("mphprny"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHPART", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("mphprth"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMPHPART", `-1` = "na, asked",
  .applies_to_vars = c("mphprty"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mphyn"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-5` = "na, terminated interview", `-1` = "na, asked", `1` = "not at all or hardly a burden", `2` = "somewhat a burden", `3` = "rather heavy burden", `4` = "very heavy burden",
  .applies_to_vars = c("qcarbur"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see I/J/KQHHYN",
  .applies_to_vars = c("qhhacqu", "qhhbrsi", "qhhchin", "qhhgrch", "qhhneig", "qhhotfa", "qhhothn", "qhhparn", "qhhpart"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHYN",
  .applies_to_vars = c("qphacqu", "qphbrsi", "qphchin", "qphchir", "qphgrch", "qphneig", "qphotfa", "qphothn", "qphothr", "qphparn", "qphparr", "qphpart"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHACQU", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhacqh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHACQU", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qhhacqhp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHBRSI", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhbrsh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHBRSI", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qhhbrshp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHCHIN", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qhhchnh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHCHIN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qhhchnhp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHGRCH", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhgrah"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHGRCH", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qhhgrahp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHNEIG", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhneih"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHNEIG", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qhhneihp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHOTFA", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhotfh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHOTFA", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qhhotfhp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHOTHN", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qhhothh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHOTHN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qhhothhp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHPARN", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qhhprnh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHPARN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qhhprnhp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHPART", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_,
  .applies_to_vars = c("qhhprth"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQHHPART", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qhhprthp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHACQU", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphacqh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHACQU", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qphacqhp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHBRSI", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphbrsh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHBRSI", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qphbrshp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHCHIN", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphchnh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHCHIN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qphchnhp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHCHIR", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphchrh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHCHIR", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qphchrhp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHGRCH", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphgrah"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHGRCH", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qphgrahp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHNEIG", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphneih"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHNEIG", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qphneihp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHOTFA", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphotfh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHOTFA", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qphotfhp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHOTHN", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphothh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHOTHN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qphothhp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHOTHR", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphotrh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHOTHR", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qphotrhp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHPARN", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphprnh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHPARN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qphprnhp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHPARR", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphprrh"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHPARR", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qphprrhp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHPART", `-1` = "na, asked", `168` = NA_character_,
  .applies_to_vars = c("qphprth"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPHPART", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qphprthp"),
  .applies_to_waves = c("I", "J", "K")
)

.lasa_fc_142 <- .lasa_finalize_fc("142")

