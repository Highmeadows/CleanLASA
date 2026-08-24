## LASA filecode 142 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  qphyn = "Help given with personal care y/n"
)

variable_labels_list <- list(
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c(
    "qhhacqh",
    "qhhacqu",
    "qhhbrsh",
    "qhhbrsi",
    "qhhchin",
    "qhhchnh",
    "qhhgrah",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhotfa",
    "qhhotfh",
    "qhhothh",
    "qhhothn",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprth",
    "qhhyn",
    "qphacqh",
    "qphacqu",
    "qphbrsh",
    "qphbrsi",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchrh",
    "qphgrah",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphotfa",
    "qphotfh",
    "qphothh",
    "qphothn",
    "qphothr",
    "qphotrh",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprrh",
    "qphprth",
    "qphyn"
  )],
    qhhpart = "Help dom. tasks partner",
    qhhprth = "Hours help dom. tasks partner",
    qphpart = "Help pers. care partner",
    qphprth = "Hours help pers. care partner"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c(
    "qhhacqh",
    "qhhacqu",
    "qhhbrsh",
    "qhhbrsi",
    "qhhchin",
    "qhhchnh",
    "qhhgrah",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhotfa",
    "qhhotfh",
    "qhhothh",
    "qhhothn",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprth",
    "qhhyn",
    "qphacqh",
    "qphacqu",
    "qphbrsh",
    "qphbrsi",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchrh",
    "qphgrah",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphotfa",
    "qphotfh",
    "qphothh",
    "qphothn",
    "qphothr",
    "qphotrh",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprrh",
    "qphprth",
    "qphyn"
  )],
    qhhpart = "Help dom. tasks partner",
    qhhprth = "Hours help dom. tasks partner",
    qphpart = "Help pers. care partner",
    qphprth = "Hours help pers. care partner"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c(
    "qcarbur",
    "qhhacqh",
    "qhhacqm",
    "qhhacqu",
    "qhhacqy",
    "qhhbrsh",
    "qhhbrsi",
    "qhhbrsm",
    "qhhbrsy",
    "qhhchin",
    "qhhchnh",
    "qhhchnm",
    "qhhchny",
    "qhhgrah",
    "qhhgram",
    "qhhgray",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhneim",
    "qhhneiy",
    "qhhotfa",
    "qhhotfh",
    "qhhotfm",
    "qhhotfy",
    "qhhothh",
    "qhhothm",
    "qhhothn",
    "qhhothy",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprnm",
    "qhhprny",
    "qhhprth",
    "qhhprtm",
    "qhhprty",
    "qhhyn",
    "qphacqh",
    "qphacqm",
    "qphacqu",
    "qphacqy",
    "qphbrsh",
    "qphbrsi",
    "qphbrsm",
    "qphbrsy",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchnm",
    "qphchny",
    "qphchrh",
    "qphchrm",
    "qphchry",
    "qphgrah",
    "qphgram",
    "qphgray",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphneim",
    "qphneiy",
    "qphotfa",
    "qphotfh",
    "qphotfm",
    "qphotfy",
    "qphothh",
    "qphothm",
    "qphothn",
    "qphothr",
    "qphothy",
    "qphotrh",
    "qphotrm",
    "qphotry",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprnm",
    "qphprny",
    "qphprrh",
    "qphprrm",
    "qphprry",
    "qphprth",
    "qphprtm",
    "qphprty",
    "qphyn"
  )],
    qhhpart = "Help dom. tasks partner",
    qhhprth = "Hours help dom. tasks partner",
    qhhprtm = "Start month help dom. tasks partner",
    qhhprty = "Start year help dom. tasks partner",
    qhhyn = "Help given with domestic tasks",
    qphpart = "Help pers. care partner",
    qphprth = "Hours help pers. care partner",
    qphprtm = "Start month help pers. care partner",
    qphprty = "Start year help pers. care partner",
    qphyn = "Help given with personal care"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c(
    "qcarbur",
    "qhhacqh",
    "qhhacqm",
    "qhhacqu",
    "qhhacqy",
    "qhhbrsh",
    "qhhbrsi",
    "qhhbrsm",
    "qhhbrsy",
    "qhhchin",
    "qhhchnh",
    "qhhchnm",
    "qhhchny",
    "qhhgrah",
    "qhhgram",
    "qhhgray",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhneim",
    "qhhneiy",
    "qhhotfa",
    "qhhotfh",
    "qhhotfm",
    "qhhotfy",
    "qhhothh",
    "qhhothm",
    "qhhothn",
    "qhhothy",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprnm",
    "qhhprny",
    "qhhprth",
    "qhhprtm",
    "qhhprty",
    "qhhyn",
    "qphacqh",
    "qphacqm",
    "qphacqu",
    "qphacqy",
    "qphbrsh",
    "qphbrsi",
    "qphbrsm",
    "qphbrsy",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchnm",
    "qphchny",
    "qphchrh",
    "qphchrm",
    "qphchry",
    "qphgrah",
    "qphgram",
    "qphgray",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphneim",
    "qphneiy",
    "qphotfa",
    "qphotfh",
    "qphotfm",
    "qphotfy",
    "qphothh",
    "qphothm",
    "qphothn",
    "qphothr",
    "qphothy",
    "qphotrh",
    "qphotrm",
    "qphotry",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprnm",
    "qphprny",
    "qphprrh",
    "qphprrm",
    "qphprry",
    "qphprth",
    "qphprtm",
    "qphprty",
    "qphyn"
  )],
    qhhpart = "Help dom. tasks partner",
    qhhprth = "Hours help dom. tasks partner",
    qhhprtm = "Start month help dom. tasks partner",
    qhhprty = "Start year help dom. tasks partner",
    qhhyn = "Help given with domestic tasks",
    qphpart = "Help pers. care partner",
    qphprth = "Hours help pers. care partner",
    qphprtm = "Start month help pers. care partner",
    qphprty = "Start year help pers. care partner",
    qphyn = "Help given with personal care"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c(
    "qcarbur",
    "qhhacqh",
    "qhhacqm",
    "qhhacqu",
    "qhhacqy",
    "qhhbrsh",
    "qhhbrsi",
    "qhhbrsm",
    "qhhbrsy",
    "qhhchin",
    "qhhchnh",
    "qhhchnm",
    "qhhchny",
    "qhhgrah",
    "qhhgram",
    "qhhgray",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhneim",
    "qhhneiy",
    "qhhotfa",
    "qhhotfh",
    "qhhotfm",
    "qhhotfy",
    "qhhothh",
    "qhhothm",
    "qhhothn",
    "qhhothy",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprnm",
    "qhhprny",
    "qhhprth",
    "qhhprtm",
    "qhhprty",
    "qhhyn",
    "qphacqh",
    "qphacqm",
    "qphacqu",
    "qphacqy",
    "qphbrsh",
    "qphbrsi",
    "qphbrsm",
    "qphbrsy",
    "qphchin",
    "qphchnh",
    "qphchnm",
    "qphchny",
    "qphgrah",
    "qphgram",
    "qphgray",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphneim",
    "qphneiy",
    "qphotfa",
    "qphotfh",
    "qphotfm",
    "qphotfy",
    "qphothh",
    "qphothm",
    "qphothn",
    "qphothy",
    "qphparn",
    "qphpart",
    "qphprnh",
    "qphprnm",
    "qphprny",
    "qphprth",
    "qphprtm",
    "qphprty",
    "qphyn"
  )],
    qhhpart = "Help dom. tasks partner outside household",
    qhhprth = "Hours help dom. tasks partner outside household",
    qhhprtm = "Start month help dom. tasks partner outside household",
    qhhprty = "Start year help dom. tasks partner outside household",
    qhhyn = "Help given with domestic tasks",
    qphpart = "Help pers. care partner outside household",
    qphprth = "Hours help pers. care partner outside household",
    qphprtm = "Start month help pers. care partner outside household",
    qphprty = "Start year help pers. care partner outside household",
    qphyn = "Help given with personal care"
  ),
  Wave_MB_labels = harmonized_labels[c(
    "mhhacqh",
    "mhhacqu",
    "mhhacqy",
    "mhhbrsh",
    "mhhbrsi",
    "mhhbrsy",
    "mhhchin",
    "mhhchnh",
    "mhhchny",
    "mhhgrah",
    "mhhgray",
    "mhhgrch",
    "mhhneig",
    "mhhneih",
    "mhhneiy",
    "mhhotfa",
    "mhhotfh",
    "mhhotfy",
    "mhhothh",
    "mhhothn",
    "mhhothy",
    "mhhparn",
    "mhhpart",
    "mhhprnh",
    "mhhprny",
    "mhhprth",
    "mhhprty",
    "mhhyn",
    "mphacqh",
    "mphacqu",
    "mphacqy",
    "mphbrsh",
    "mphbrsi",
    "mphbrsy",
    "mphchin",
    "mphchnh",
    "mphchny",
    "mphgrah",
    "mphgray",
    "mphgrch",
    "mphneig",
    "mphneih",
    "mphneiy",
    "mphotfa",
    "mphotfh",
    "mphotfy",
    "mphothh",
    "mphothn",
    "mphothy",
    "mphparn",
    "mphpart",
    "mphprnh",
    "mphprny",
    "mphprth",
    "mphprty",
    "mphyn",
    "qcarbur"
  )],
  Wave_I_labels = .replace_labels(
    harmonized_labels[c(
    "qcarbur",
    "qhhacqh",
    "qhhacqhp",
    "qhhacqu",
    "qhhbrsh",
    "qhhbrshp",
    "qhhbrsi",
    "qhhchin",
    "qhhchnh",
    "qhhchnhp",
    "qhhgrah",
    "qhhgrahp",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhneihp",
    "qhhotfa",
    "qhhotfh",
    "qhhotfhp",
    "qhhothh",
    "qhhothhp",
    "qhhothn",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprnhp",
    "qhhprth",
    "qhhprthp",
    "qhhyn",
    "qphacqh",
    "qphacqhp",
    "qphacqu",
    "qphbrsh",
    "qphbrshp",
    "qphbrsi",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchnhp",
    "qphchrh",
    "qphchrhp",
    "qphgrah",
    "qphgrahp",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphneihp",
    "qphotfa",
    "qphotfh",
    "qphotfhp",
    "qphothh",
    "qphothhp",
    "qphothn",
    "qphothr",
    "qphotrh",
    "qphotrhp",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprnhp",
    "qphprrh",
    "qphprrhp",
    "qphprth",
    "qphprthp",
    "qphyn"
  )],
    qhhpart = "Help dom. tasks partner",
    qhhprth = "Hours help dom. tasks partner",
    qphpart = "Help pers. care partner",
    qphprth = "Hours help pers. care partner"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c(
    "qcarbur",
    "qhhacqh",
    "qhhacqhp",
    "qhhacqu",
    "qhhbrsh",
    "qhhbrshp",
    "qhhbrsi",
    "qhhchin",
    "qhhchnh",
    "qhhchnhp",
    "qhhgrah",
    "qhhgrahp",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhneihp",
    "qhhotfa",
    "qhhotfh",
    "qhhotfhp",
    "qhhothh",
    "qhhothhp",
    "qhhothn",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprnhp",
    "qhhprth",
    "qhhprthp",
    "qhhyn",
    "qphacqh",
    "qphacqhp",
    "qphacqu",
    "qphbrsh",
    "qphbrshp",
    "qphbrsi",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchnhp",
    "qphchrh",
    "qphchrhp",
    "qphgrah",
    "qphgrahp",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphneihp",
    "qphotfa",
    "qphotfh",
    "qphotfhp",
    "qphothh",
    "qphothhp",
    "qphothn",
    "qphothr",
    "qphotrh",
    "qphotrhp",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprnhp",
    "qphprrh",
    "qphprrhp",
    "qphprth",
    "qphprthp",
    "qphyn"
  )],
    qhhpart = "Help dom. tasks partner",
    qhhprth = "Hours help dom. tasks partner",
    qphpart = "Help pers. care partner",
    qphprth = "Hours help pers. care partner"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c(
    "qcarbur",
    "qhhacqh",
    "qhhacqhp",
    "qhhacqu",
    "qhhbrsh",
    "qhhbrshp",
    "qhhbrsi",
    "qhhchin",
    "qhhchnh",
    "qhhchnhp",
    "qhhgrah",
    "qhhgrahp",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhneihp",
    "qhhotfa",
    "qhhotfh",
    "qhhotfhp",
    "qhhothh",
    "qhhothhp",
    "qhhothn",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprnhp",
    "qhhprth",
    "qhhprthp",
    "qhhyn",
    "qphacqh",
    "qphacqhp",
    "qphacqu",
    "qphbrsh",
    "qphbrshp",
    "qphbrsi",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchnhp",
    "qphchrh",
    "qphchrhp",
    "qphgrah",
    "qphgrahp",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphneihp",
    "qphotfa",
    "qphotfh",
    "qphotfhp",
    "qphothh",
    "qphothhp",
    "qphothn",
    "qphothr",
    "qphotrh",
    "qphotrhp",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprnhp",
    "qphprrh",
    "qphprrhp",
    "qphprth",
    "qphprthp",
    "qphyn"
  )],
    qhhpart = "Help dom. tasks partner",
    qhhprth = "Hours help dom. tasks partner",
    qphpart = "Help pers. care partner",
    qphprth = "Hours help pers. care partner"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mhhacqh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  mhhacqu = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mhhacqy = c(`-2` = "not available", `-1` = "not available"),
  mhhbrsh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  mhhbrsi = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mhhbrsy = c(`-2` = "not available", `-1` = "not available"),
  mhhchin = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mhhchnh = c(`-2` = "not available", `-1` = "not available", `0` = NA_character_, `168` = NA_character_),
  mhhchny = c(`-2` = "not available", `-1` = "not available"),
  mhhgrah = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  mhhgray = c(`-2` = "not available", `-1` = "not available"),
  mhhgrch = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mhhneig = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mhhneih = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  mhhneiy = c(`-2` = "not available", `-1` = "not available"),
  mhhotfa = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mhhotfh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  mhhotfy = c(`-2` = "not available", `-1` = "not available"),
  mhhothh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  mhhothn = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mhhothy = c(`-2` = "not available", `-1` = "not available"),
  mhhparn = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mhhpart = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mhhprnh = c(`-2` = "not available", `-1` = "not available", `0` = NA_character_, `168` = NA_character_),
  mhhprny = c(`-2` = "not available", `-1` = "not available"),
  mhhprth = c(`-2` = "not available", `-1` = "not available", `0` = NA_character_, `168` = NA_character_),
  mhhprty = c(`-2` = "not available", `-1` = "not available"),
  mhhyn = c(`-5` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  mphacqh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  mphacqu = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mphacqy = c(`-2` = "not available", `-1` = "not available"),
  mphbrsh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  mphbrsi = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mphbrsy = c(`-2` = "not available", `-1` = "not available"),
  mphchin = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mphchnh = c(`-2` = "not available", `-1` = "not available", `0` = NA_character_, `168` = NA_character_),
  mphchny = c(`-2` = "not available", `-1` = "not available"),
  mphgrah = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  mphgray = c(`-2` = "not available", `-1` = "not available"),
  mphgrch = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mphneig = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mphneih = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  mphneiy = c(`-2` = "not available", `-1` = "not available"),
  mphotfa = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mphotfh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  mphotfy = c(`-2` = "not available", `-1` = "not available"),
  mphothh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  mphothn = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mphothy = c(`-2` = "not available", `-1` = "not available"),
  mphparn = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mphpart = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  mphprnh = c(`-2` = "not available", `-1` = "not available", `0` = NA_character_, `168` = NA_character_),
  mphprny = c(`-2` = "not available", `-1` = "not available"),
  mphprth = c(`-2` = "not available", `-1` = "not available", `0` = NA_character_, `168` = NA_character_),
  mphprty = c(`-2` = "not available", `-1` = "not available"),
  mphyn = c(`-1` = "not available", `1` = "no", `2` = "yes"),
  qcarbur = c(
    `-5` = "not available",
    `-1` = "not available",
    `1` = "not at all or hardly a burden",
    `2` = "somewhat a burden",
    `3` = "rather heavy burden",
    `4` = "very heavy burden",
    `5` = "overburdened",
    `6` = "R does not give any domestic or personal care"
  ),
  qhhacqh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qhhacqhp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qhhacqm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qhhacqu = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qhhacqy = c(`-2` = "not available", `-1` = "not available"),
  qhhbrsh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qhhbrshp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qhhbrsi = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qhhbrsm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qhhbrsy = c(`-2` = "not available", `-1` = "not available"),
  qhhchin = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qhhchnh = c(`-2` = "not available", `-1` = "not available", `0` = NA_character_, `168` = NA_character_),
  qhhchnhp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qhhchnm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qhhchny = c(`-2` = "not available", `-1` = "not available"),
  qhhgrah = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qhhgrahp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qhhgram = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qhhgray = c(`-2` = "not available", `-1` = "not available"),
  qhhgrch = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qhhneig = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qhhneih = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qhhneihp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qhhneim = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qhhneiy = c(`-2` = "not available", `-1` = "not available"),
  qhhotfa = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qhhotfh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qhhotfhp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qhhotfm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qhhotfy = c(`-2` = "not available", `-1` = "not available"),
  qhhothh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qhhothhp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qhhothm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qhhothn = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qhhothy = c(`-2` = "not available", `-1` = "not available"),
  qhhparn = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qhhpart = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qhhprnh = c(`-2` = "not available", `-1` = "not available", `0` = NA_character_, `168` = NA_character_),
  qhhprnhp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qhhprnm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qhhprny = c(`-2` = "not available", `-1` = "not available"),
  qhhprth = c(`-2` = "not available", `-1` = "not available", `0` = NA_character_, `168` = NA_character_),
  qhhprthp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qhhprtm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qhhprty = c(`-2` = "not available", `-1` = "not available"),
  qhhyn = c(`-1` = "not available", `1` = "no", `2` = "yes"),
  qphacqh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qphacqhp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qphacqm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qphacqu = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qphacqy = c(`-2` = "not available", `-1` = "not available"),
  qphbrsh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qphbrshp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qphbrsi = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qphbrsm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qphbrsy = c(`-2` = "not available", `-1` = "not available"),
  qphchin = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qphchir = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qphchnh = c(`-2` = "not available", `-1` = "not available", `0` = NA_character_, `168` = NA_character_),
  qphchnhp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qphchnm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qphchny = c(`-2` = "not available", `-1` = "not available"),
  qphchrh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qphchrhp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qphchrm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qphchry = c(`-2` = "not available", `-1` = "not available"),
  qphgrah = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qphgrahp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qphgram = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qphgray = c(`-2` = "not available", `-1` = "not available"),
  qphgrch = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qphneig = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qphneih = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qphneihp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qphneim = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qphneiy = c(`-2` = "not available", `-1` = "not available"),
  qphotfa = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qphotfh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qphotfhp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qphotfm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qphotfy = c(`-2` = "not available", `-1` = "not available"),
  qphothh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qphothhp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qphothm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qphothn = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qphothr = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qphothy = c(`-2` = "not available", `-1` = "not available"),
  qphotrh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qphotrhp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qphotrm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qphotry = c(`-2` = "not available", `-1` = "not available"),
  qphparn = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qphparr = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qphpart = c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  qphprnh = c(`-2` = "not available", `-1` = "not available", `0` = NA_character_, `168` = NA_character_),
  qphprnhp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qphprnm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qphprny = c(`-2` = "not available", `-1` = "not available"),
  qphprrh = c(`-2` = "not available", `-1` = "not available", `168` = NA_character_),
  qphprrhp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qphprrm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qphprry = c(`-2` = "not available", `-1` = "not available"),
  qphprth = c(`-2` = "not available", `-1` = "not available", `0` = NA_character_, `168` = NA_character_),
  qphprthp = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qphprtm = c(
    `-2` = "not available",
    `-1` = "not available",
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
  qphprty = c(`-2` = "not available", `-1` = "not available"),
  qphyn = c(`-1` = "not available", `1` = "no", `2` = "yes")
)

value_labels_list <- list(
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "qhhacqh",
    "qhhacqu",
    "qhhbrsh",
    "qhhbrsi",
    "qhhchin",
    "qhhchnh",
    "qhhgrah",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhotfa",
    "qhhotfh",
    "qhhothh",
    "qhhothn",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprth",
    "qhhyn",
    "qphacqh",
    "qphacqu",
    "qphbrsh",
    "qphbrsi",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchrh",
    "qphgrah",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphotfa",
    "qphotfh",
    "qphothh",
    "qphothn",
    "qphothr",
    "qphotrh",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprrh",
    "qphprth",
    "qphyn"
  )],
    qhhacqh = .replace_labels(
    standardized_value_labels$qhhacqh,
    `-2` = "na, see b/fqhhacqu",
    `-1` = "na, asked"
  ),
    qhhacqu = .replace_labels(
    standardized_value_labels$qhhacqu,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhbrsh = .replace_labels(
    standardized_value_labels$qhhbrsh,
    `-2` = "na, see b/fqhhbrsi",
    `-1` = "na, asked"
  ),
    qhhbrsi = .replace_labels(
    standardized_value_labels$qhhbrsi,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhchin = .replace_labels(
    standardized_value_labels$qhhchin,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhchnh = .replace_labels(
    standardized_value_labels$qhhchnh,
    `-2` = "na, see b/fqhhchin",
    `-1` = "na, asked"
  ),
    qhhgrah = .replace_labels(
    standardized_value_labels$qhhgrah,
    `-2` = "na, see b/fqhhgrch",
    `-1` = "na, asked"
  ),
    qhhgrch = .replace_labels(
    standardized_value_labels$qhhgrch,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhneig = .replace_labels(
    standardized_value_labels$qhhneig,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhneih = .replace_labels(
    standardized_value_labels$qhhneih,
    `-2` = "na, see b/fqhhneig",
    `-1` = "na, asked"
  ),
    qhhotfa = .replace_labels(
    standardized_value_labels$qhhotfa,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhotfh = .replace_labels(
    standardized_value_labels$qhhotfh,
    `-2` = "na, see b/fqhhotfa",
    `-1` = "na, asked"
  ),
    qhhothh = .replace_labels(
    standardized_value_labels$qhhothh,
    `-2` = "na, see b/fqhhothn",
    `-1` = "na, asked"
  ),
    qhhothn = .replace_labels(
    standardized_value_labels$qhhothn,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhparn = .replace_labels(
    standardized_value_labels$qhhparn,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhpart = .replace_labels(
    standardized_value_labels$qhhpart,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhprnh = .replace_labels(
    standardized_value_labels$qhhprnh,
    `-2` = "na, see b/fqhhparn",
    `-1` = "na, asked"
  ),
    qhhprth = .replace_labels(
    standardized_value_labels$qhhprth,
    `-2` = "na, see b/fqhhpart",
    `-1` = "na, asked"
  ),
    qhhyn = .replace_labels(
    standardized_value_labels$qhhyn,
    `-1` = "na, asked"
  ),
    qphacqh = .replace_labels(
    standardized_value_labels$qphacqh,
    `-2` = "na, see b/fqphacqu",
    `-1` = "na, asked"
  ),
    qphacqu = .replace_labels(
    standardized_value_labels$qphacqu,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphbrsh = .replace_labels(
    standardized_value_labels$qphbrsh,
    `-2` = "na, see b/fqphbrsi",
    `-1` = "na, asked"
  ),
    qphbrsi = .replace_labels(
    standardized_value_labels$qphbrsi,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphchin = .replace_labels(
    standardized_value_labels$qphchin,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphchir = .replace_labels(
    standardized_value_labels$qphchir,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphchnh = c(`-2` = "na, see b/fqphchin", `-1` = "na, asked", `168` = NA_character_),
    qphchrh = .replace_labels(
    standardized_value_labels$qphchrh,
    `-2` = "na, see b/fqphchir",
    `-1` = "na, asked"
  ),
    qphgrah = .replace_labels(
    standardized_value_labels$qphgrah,
    `-2` = "na, see b/fqphgrch",
    `-1` = "na, asked"
  ),
    qphgrch = .replace_labels(
    standardized_value_labels$qphgrch,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphneig = .replace_labels(
    standardized_value_labels$qphneig,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphneih = .replace_labels(
    standardized_value_labels$qphneih,
    `-2` = "na, see b/fqphneig",
    `-1` = "na, asked"
  ),
    qphotfa = .replace_labels(
    standardized_value_labels$qphotfa,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphotfh = .replace_labels(
    standardized_value_labels$qphotfh,
    `-2` = "na, see b/fqphotfa",
    `-1` = "na, asked"
  ),
    qphothh = .replace_labels(
    standardized_value_labels$qphothh,
    `-2` = "na, see b/fqphothn",
    `-1` = "na, asked"
  ),
    qphothn = .replace_labels(
    standardized_value_labels$qphothn,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphothr = .replace_labels(
    standardized_value_labels$qphothr,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphotrh = .replace_labels(
    standardized_value_labels$qphotrh,
    `-2` = "na, see b/fqphothr",
    `-1` = "na, asked"
  ),
    qphparn = .replace_labels(
    standardized_value_labels$qphparn,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphparr = .replace_labels(
    standardized_value_labels$qphparr,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphpart = .replace_labels(
    standardized_value_labels$qphpart,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphprnh = c(`-2` = "na, see b/fqphparn", `-1` = "na, asked", `168` = NA_character_),
    qphprrh = .replace_labels(
    standardized_value_labels$qphprrh,
    `-2` = "na, see b/fqphparr",
    `-1` = "na, asked"
  ),
    qphprth = c(`-2` = "na, see b/fqphpart", `-1` = "na, asked", `168` = NA_character_),
    qphyn = .replace_labels(
    standardized_value_labels$qphyn,
    `-1` = "na, asked"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "qhhacqh",
    "qhhacqu",
    "qhhbrsh",
    "qhhbrsi",
    "qhhchin",
    "qhhchnh",
    "qhhgrah",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhotfa",
    "qhhotfh",
    "qhhothh",
    "qhhothn",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprth",
    "qhhyn",
    "qphacqh",
    "qphacqu",
    "qphbrsh",
    "qphbrsi",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchrh",
    "qphgrah",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphotfa",
    "qphotfh",
    "qphothh",
    "qphothn",
    "qphothr",
    "qphotrh",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprrh",
    "qphprth",
    "qphyn"
  )],
    qhhacqh = .replace_labels(
    standardized_value_labels$qhhacqh,
    `-2` = "na, see b/fqhhacqu",
    `-1` = "na, asked"
  ),
    qhhacqu = .replace_labels(
    standardized_value_labels$qhhacqu,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhbrsh = .replace_labels(
    standardized_value_labels$qhhbrsh,
    `-2` = "na, see b/fqhhbrsi",
    `-1` = "na, asked"
  ),
    qhhbrsi = .replace_labels(
    standardized_value_labels$qhhbrsi,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhchin = .replace_labels(
    standardized_value_labels$qhhchin,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhchnh = .replace_labels(
    standardized_value_labels$qhhchnh,
    `-2` = "na, see b/fqhhchin",
    `-1` = "na, asked"
  ),
    qhhgrah = .replace_labels(
    standardized_value_labels$qhhgrah,
    `-2` = "na, see b/fqhhgrch",
    `-1` = "na, asked"
  ),
    qhhgrch = .replace_labels(
    standardized_value_labels$qhhgrch,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhneig = .replace_labels(
    standardized_value_labels$qhhneig,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhneih = .replace_labels(
    standardized_value_labels$qhhneih,
    `-2` = "na, see b/fqhhneig",
    `-1` = "na, asked"
  ),
    qhhotfa = .replace_labels(
    standardized_value_labels$qhhotfa,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhotfh = .replace_labels(
    standardized_value_labels$qhhotfh,
    `-2` = "na, see b/fqhhotfa",
    `-1` = "na, asked"
  ),
    qhhothh = .replace_labels(
    standardized_value_labels$qhhothh,
    `-2` = "na, see b/fqhhothn",
    `-1` = "na, asked"
  ),
    qhhothn = .replace_labels(
    standardized_value_labels$qhhothn,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhparn = .replace_labels(
    standardized_value_labels$qhhparn,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhpart = .replace_labels(
    standardized_value_labels$qhhpart,
    `-2` = "na, see b/fqhhyn",
    `-1` = "na, asked"
  ),
    qhhprnh = .replace_labels(
    standardized_value_labels$qhhprnh,
    `-2` = "na, see b/fqhhparn",
    `-1` = "na, asked"
  ),
    qhhprth = .replace_labels(
    standardized_value_labels$qhhprth,
    `-2` = "na, see b/fqhhpart",
    `-1` = "na, asked"
  ),
    qhhyn = .replace_labels(
    standardized_value_labels$qhhyn,
    `-1` = "na, asked"
  ),
    qphacqh = .replace_labels(
    standardized_value_labels$qphacqh,
    `-2` = "na, see b/fqphacqu",
    `-1` = "na, asked"
  ),
    qphacqu = .replace_labels(
    standardized_value_labels$qphacqu,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphbrsh = .replace_labels(
    standardized_value_labels$qphbrsh,
    `-2` = "na, see b/fqphbrsi",
    `-1` = "na, asked"
  ),
    qphbrsi = .replace_labels(
    standardized_value_labels$qphbrsi,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphchin = .replace_labels(
    standardized_value_labels$qphchin,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphchir = .replace_labels(
    standardized_value_labels$qphchir,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphchnh = c(`-2` = "na, see b/fqphchin", `-1` = "na, asked", `168` = NA_character_),
    qphchrh = .replace_labels(
    standardized_value_labels$qphchrh,
    `-2` = "na, see b/fqphchir",
    `-1` = "na, asked"
  ),
    qphgrah = .replace_labels(
    standardized_value_labels$qphgrah,
    `-2` = "na, see b/fqphgrch",
    `-1` = "na, asked"
  ),
    qphgrch = .replace_labels(
    standardized_value_labels$qphgrch,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphneig = .replace_labels(
    standardized_value_labels$qphneig,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphneih = .replace_labels(
    standardized_value_labels$qphneih,
    `-2` = "na, see b/fqphneig",
    `-1` = "na, asked"
  ),
    qphotfa = .replace_labels(
    standardized_value_labels$qphotfa,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphotfh = .replace_labels(
    standardized_value_labels$qphotfh,
    `-2` = "na, see b/fqphotfa",
    `-1` = "na, asked"
  ),
    qphothh = .replace_labels(
    standardized_value_labels$qphothh,
    `-2` = "na, see b/fqphothn",
    `-1` = "na, asked"
  ),
    qphothn = .replace_labels(
    standardized_value_labels$qphothn,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphothr = .replace_labels(
    standardized_value_labels$qphothr,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphotrh = .replace_labels(
    standardized_value_labels$qphotrh,
    `-2` = "na, see b/fqphothr",
    `-1` = "na, asked"
  ),
    qphparn = .replace_labels(
    standardized_value_labels$qphparn,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphparr = .replace_labels(
    standardized_value_labels$qphparr,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphpart = .replace_labels(
    standardized_value_labels$qphpart,
    `-2` = "na, see b/fqphyn",
    `-1` = "na, asked"
  ),
    qphprnh = c(`-2` = "na, see b/fqphparn", `-1` = "na, asked", `168` = NA_character_),
    qphprrh = .replace_labels(
    standardized_value_labels$qphprrh,
    `-2` = "na, see b/fqphparr",
    `-1` = "na, asked"
  ),
    qphprth = c(`-2` = "na, see b/fqphpart", `-1` = "na, asked", `168` = NA_character_),
    qphyn = .replace_labels(
    standardized_value_labels$qphyn,
    `-1` = "na, asked"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "qcarbur",
    "qhhacqh",
    "qhhacqm",
    "qhhacqu",
    "qhhacqy",
    "qhhbrsh",
    "qhhbrsi",
    "qhhbrsm",
    "qhhbrsy",
    "qhhchin",
    "qhhchnh",
    "qhhchnm",
    "qhhchny",
    "qhhgrah",
    "qhhgram",
    "qhhgray",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhneim",
    "qhhneiy",
    "qhhotfa",
    "qhhotfh",
    "qhhotfm",
    "qhhotfy",
    "qhhothh",
    "qhhothm",
    "qhhothn",
    "qhhothy",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprnm",
    "qhhprny",
    "qhhprth",
    "qhhprtm",
    "qhhprty",
    "qhhyn",
    "qphacqh",
    "qphacqm",
    "qphacqu",
    "qphacqy",
    "qphbrsh",
    "qphbrsi",
    "qphbrsm",
    "qphbrsy",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchnm",
    "qphchny",
    "qphchrh",
    "qphchrm",
    "qphchry",
    "qphgrah",
    "qphgram",
    "qphgray",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphneim",
    "qphneiy",
    "qphotfa",
    "qphotfh",
    "qphotfm",
    "qphotfy",
    "qphothh",
    "qphothm",
    "qphothn",
    "qphothr",
    "qphothy",
    "qphotrh",
    "qphotrm",
    "qphotry",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprnm",
    "qphprny",
    "qphprrh",
    "qphprrm",
    "qphprry",
    "qphprth",
    "qphprtm",
    "qphprty",
    "qphyn"
  )],
    qcarbur = c(
    `-1` = "na, asked",
    `1` = "not at all or hardly a burden",
    `2` = "somewhat a burden",
    `3` = "rather heavy burden",
    `4` = "very heavy burden",
    `5` = "overburdened"
  ),
    qhhacqh = .replace_labels(
    standardized_value_labels$qhhacqh,
    `-2` = "na, see g/hqhhacqu",
    `-1` = "na, asked"
  ),
    qhhacqm = .replace_labels(
    standardized_value_labels$qhhacqm,
    `-2` = "na, see g/hqhhacqu",
    `-1` = "na, asked"
  ),
    qhhacqu = .replace_labels(
    standardized_value_labels$qhhacqu,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhacqy = .replace_labels(
    standardized_value_labels$qhhacqy,
    `-2` = "na, see g/hqhhacqu",
    `-1` = "na, asked"
  ),
    qhhbrsh = .replace_labels(
    standardized_value_labels$qhhbrsh,
    `-2` = "na, see g/hqhhbrsi",
    `-1` = "na, asked"
  ),
    qhhbrsi = .replace_labels(
    standardized_value_labels$qhhbrsi,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhbrsm = .replace_labels(
    standardized_value_labels$qhhbrsm,
    `-2` = "na, see g/hqhhbrsi",
    `-1` = "na, asked"
  ),
    qhhbrsy = .replace_labels(
    standardized_value_labels$qhhbrsy,
    `-2` = "na, see g/hqhhbrsi",
    `-1` = "na, asked"
  ),
    qhhchin = .replace_labels(
    standardized_value_labels$qhhchin,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhchnh = .replace_labels(
    standardized_value_labels$qhhchnh,
    `-2` = "na, see g/hqhhchin",
    `-1` = "na, asked"
  ),
    qhhchnm = .replace_labels(
    standardized_value_labels$qhhchnm,
    `-2` = "na, see g/hqhhchin",
    `-1` = "na, asked"
  ),
    qhhchny = .replace_labels(
    standardized_value_labels$qhhchny,
    `-2` = "na, see g/hqhhchin",
    `-1` = "na, asked"
  ),
    qhhgrah = .replace_labels(
    standardized_value_labels$qhhgrah,
    `-2` = "na, see g/hqhhgrch",
    `-1` = "na, asked"
  ),
    qhhgram = .replace_labels(
    standardized_value_labels$qhhgram,
    `-2` = "na, see g/hqhhgrch",
    `-1` = "na, asked"
  ),
    qhhgray = .replace_labels(
    standardized_value_labels$qhhgray,
    `-2` = "na, see g/hqhhgrch",
    `-1` = "na, asked"
  ),
    qhhgrch = .replace_labels(
    standardized_value_labels$qhhgrch,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhneig = .replace_labels(
    standardized_value_labels$qhhneig,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhneih = .replace_labels(
    standardized_value_labels$qhhneih,
    `-2` = "na, see g/hqhhneig",
    `-1` = "na, asked"
  ),
    qhhneim = .replace_labels(
    standardized_value_labels$qhhneim,
    `-2` = "na, see g/hqhhneig",
    `-1` = "na, asked"
  ),
    qhhneiy = .replace_labels(
    standardized_value_labels$qhhneiy,
    `-2` = "na, see g/hqhhneig",
    `-1` = "na, asked"
  ),
    qhhotfa = .replace_labels(
    standardized_value_labels$qhhotfa,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhotfh = .replace_labels(
    standardized_value_labels$qhhotfh,
    `-2` = "na, see g/hqhhotfa",
    `-1` = "na, asked"
  ),
    qhhotfm = .replace_labels(
    standardized_value_labels$qhhotfm,
    `-2` = "na, see g/hqhhotfa",
    `-1` = "na, asked"
  ),
    qhhotfy = .replace_labels(
    standardized_value_labels$qhhotfy,
    `-2` = "na, see g/hqhhotfa",
    `-1` = "na, asked"
  ),
    qhhothh = .replace_labels(
    standardized_value_labels$qhhothh,
    `-2` = "na, see g/hqhhothn",
    `-1` = "na, asked"
  ),
    qhhothm = .replace_labels(
    standardized_value_labels$qhhothm,
    `-2` = "na, see g/hqhhothn",
    `-1` = "na, asked"
  ),
    qhhothn = .replace_labels(
    standardized_value_labels$qhhothn,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhothy = .replace_labels(
    standardized_value_labels$qhhothy,
    `-2` = "na, see g/hqhhothn",
    `-1` = "na, asked"
  ),
    qhhparn = .replace_labels(
    standardized_value_labels$qhhparn,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhpart = .replace_labels(
    standardized_value_labels$qhhpart,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhprnh = .replace_labels(
    standardized_value_labels$qhhprnh,
    `-2` = "na, see g/hqhhparn",
    `-1` = "na, asked"
  ),
    qhhprnm = .replace_labels(
    standardized_value_labels$qhhprnm,
    `-2` = "na, see g/hqhhparn",
    `-1` = "na, asked"
  ),
    qhhprny = .replace_labels(
    standardized_value_labels$qhhprny,
    `-2` = "na, see g/hqhhparn",
    `-1` = "na, asked"
  ),
    qhhprth = .replace_labels(
    standardized_value_labels$qhhprth,
    `-2` = "na, see g/hqhhpart",
    `-1` = "na, asked"
  ),
    qhhprtm = .replace_labels(
    standardized_value_labels$qhhprtm,
    `-2` = "na, see g/hqhhpart",
    `-1` = "na, asked"
  ),
    qhhprty = .replace_labels(
    standardized_value_labels$qhhprty,
    `-2` = "na, see g/hqhhpart",
    `-1` = "na, asked"
  ),
    qhhyn = .replace_labels(
    standardized_value_labels$qhhyn,
    `-1` = "na, asked"
  ),
    qphacqh = .replace_labels(
    standardized_value_labels$qphacqh,
    `-2` = "na, see g/hqphacqu",
    `-1` = "na, asked"
  ),
    qphacqm = .replace_labels(
    standardized_value_labels$qphacqm,
    `-2` = "na, see g/hqphacqu",
    `-1` = "na, asked"
  ),
    qphacqu = .replace_labels(
    standardized_value_labels$qphacqu,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphacqy = .replace_labels(
    standardized_value_labels$qphacqy,
    `-2` = "na, see g/hqphacqu",
    `-1` = "na, asked"
  ),
    qphbrsh = .replace_labels(
    standardized_value_labels$qphbrsh,
    `-2` = "na, see g/hqphbrsi",
    `-1` = "na, asked"
  ),
    qphbrsi = .replace_labels(
    standardized_value_labels$qphbrsi,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphbrsm = .replace_labels(
    standardized_value_labels$qphbrsm,
    `-2` = "na, see g/hqphbrsi",
    `-1` = "na, asked"
  ),
    qphbrsy = .replace_labels(
    standardized_value_labels$qphbrsy,
    `-2` = "na, see g/hqphbrsi",
    `-1` = "na, asked"
  ),
    qphchin = .replace_labels(
    standardized_value_labels$qphchin,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphchir = .replace_labels(
    standardized_value_labels$qphchir,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphchnh = c(`-2` = "na, see g/hqphchin", `-1` = "na, asked", `168` = NA_character_),
    qphchnm = .replace_labels(
    standardized_value_labels$qphchnm,
    `-2` = "na, see g/hqphchin",
    `-1` = "na, asked"
  ),
    qphchny = .replace_labels(
    standardized_value_labels$qphchny,
    `-2` = "na, see g/hqphchin",
    `-1` = "na, asked"
  ),
    qphchrh = .replace_labels(
    standardized_value_labels$qphchrh,
    `-2` = "na, see g/hqphchir",
    `-1` = "na, asked"
  ),
    qphchrm = .replace_labels(
    standardized_value_labels$qphchrm,
    `-2` = "na, see g/hqphchir",
    `-1` = "na, asked"
  ),
    qphchry = .replace_labels(
    standardized_value_labels$qphchry,
    `-2` = "na, see g/hqphchir",
    `-1` = "na, asked"
  ),
    qphgrah = .replace_labels(
    standardized_value_labels$qphgrah,
    `-2` = "na, see g/hqphgrch",
    `-1` = "na, asked"
  ),
    qphgram = .replace_labels(
    standardized_value_labels$qphgram,
    `-2` = "na, see g/hqphgrch",
    `-1` = "na, asked"
  ),
    qphgray = .replace_labels(
    standardized_value_labels$qphgray,
    `-2` = "na, see g/hqphgrch",
    `-1` = "na, asked"
  ),
    qphgrch = .replace_labels(
    standardized_value_labels$qphgrch,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphneig = .replace_labels(
    standardized_value_labels$qphneig,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphneih = .replace_labels(
    standardized_value_labels$qphneih,
    `-2` = "na, see g/hqphneig",
    `-1` = "na, asked"
  ),
    qphneim = .replace_labels(
    standardized_value_labels$qphneim,
    `-2` = "na, see g/hqphneig",
    `-1` = "na, asked"
  ),
    qphneiy = .replace_labels(
    standardized_value_labels$qphneiy,
    `-2` = "na, see g/hqphneig",
    `-1` = "na, asked"
  ),
    qphotfa = .replace_labels(
    standardized_value_labels$qphotfa,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphotfh = .replace_labels(
    standardized_value_labels$qphotfh,
    `-2` = "na, see g/hqphotfa",
    `-1` = "na, asked"
  ),
    qphotfm = .replace_labels(
    standardized_value_labels$qphotfm,
    `-2` = "na, see g/hqphotfa",
    `-1` = "na, asked"
  ),
    qphotfy = .replace_labels(
    standardized_value_labels$qphotfy,
    `-2` = "na, see g/hqphotfa",
    `-1` = "na, asked"
  ),
    qphothh = .replace_labels(
    standardized_value_labels$qphothh,
    `-2` = "na, see g/hqphothn",
    `-1` = "na, asked"
  ),
    qphothm = .replace_labels(
    standardized_value_labels$qphothm,
    `-2` = "na, see g/hqphothn",
    `-1` = "na, asked"
  ),
    qphothn = .replace_labels(
    standardized_value_labels$qphothn,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphothr = .replace_labels(
    standardized_value_labels$qphothr,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphothy = .replace_labels(
    standardized_value_labels$qphothy,
    `-2` = "na, see g/hqphothn",
    `-1` = "na, asked"
  ),
    qphotrh = .replace_labels(
    standardized_value_labels$qphotrh,
    `-2` = "na, see g/hqphothr",
    `-1` = "na, asked"
  ),
    qphotrm = .replace_labels(
    standardized_value_labels$qphotrm,
    `-2` = "na, see g/hqphothr",
    `-1` = "na, asked"
  ),
    qphotry = .replace_labels(
    standardized_value_labels$qphotry,
    `-2` = "na, see g/hqphothr",
    `-1` = "na, asked"
  ),
    qphparn = .replace_labels(
    standardized_value_labels$qphparn,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphparr = .replace_labels(
    standardized_value_labels$qphparr,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphpart = .replace_labels(
    standardized_value_labels$qphpart,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphprnh = c(`-2` = "na, see g/hqphparn", `-1` = "na, asked", `168` = NA_character_),
    qphprnm = .replace_labels(
    standardized_value_labels$qphprnm,
    `-2` = "na, see g/hqphparn",
    `-1` = "na, asked"
  ),
    qphprny = .replace_labels(
    standardized_value_labels$qphprny,
    `-2` = "na, see g/hqphparn",
    `-1` = "na, asked"
  ),
    qphprrh = .replace_labels(
    standardized_value_labels$qphprrh,
    `-2` = "na, see g/hqphparr",
    `-1` = "na, asked"
  ),
    qphprrm = .replace_labels(
    standardized_value_labels$qphprrm,
    `-2` = "na, see g/hqphparr",
    `-1` = "na, asked"
  ),
    qphprry = .replace_labels(
    standardized_value_labels$qphprry,
    `-2` = "na, see g/hqphparr",
    `-1` = "na, asked"
  ),
    qphprth = c(`-2` = "na, see g/hqphpart", `-1` = "na, asked", `168` = NA_character_),
    qphprtm = .replace_labels(
    standardized_value_labels$qphprtm,
    `-2` = "na, see g/hqphpart",
    `-1` = "na, asked"
  ),
    qphprty = .replace_labels(
    standardized_value_labels$qphprty,
    `-2` = "na, see g/hqphpart",
    `-1` = "na, asked"
  ),
    qphyn = .replace_labels(
    standardized_value_labels$qphyn,
    `-1` = "na, asked"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "qcarbur",
    "qhhacqh",
    "qhhacqm",
    "qhhacqu",
    "qhhacqy",
    "qhhbrsh",
    "qhhbrsi",
    "qhhbrsm",
    "qhhbrsy",
    "qhhchin",
    "qhhchnh",
    "qhhchnm",
    "qhhchny",
    "qhhgrah",
    "qhhgram",
    "qhhgray",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhneim",
    "qhhneiy",
    "qhhotfa",
    "qhhotfh",
    "qhhotfm",
    "qhhotfy",
    "qhhothh",
    "qhhothm",
    "qhhothn",
    "qhhothy",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprnm",
    "qhhprny",
    "qhhprth",
    "qhhprtm",
    "qhhprty",
    "qhhyn",
    "qphacqh",
    "qphacqm",
    "qphacqu",
    "qphacqy",
    "qphbrsh",
    "qphbrsi",
    "qphbrsm",
    "qphbrsy",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchnm",
    "qphchny",
    "qphchrh",
    "qphchrm",
    "qphchry",
    "qphgrah",
    "qphgram",
    "qphgray",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphneim",
    "qphneiy",
    "qphotfa",
    "qphotfh",
    "qphotfm",
    "qphotfy",
    "qphothh",
    "qphothm",
    "qphothn",
    "qphothr",
    "qphothy",
    "qphotrh",
    "qphotrm",
    "qphotry",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprnm",
    "qphprny",
    "qphprrh",
    "qphprrm",
    "qphprry",
    "qphprth",
    "qphprtm",
    "qphprty",
    "qphyn"
  )],
    qcarbur = c(
    `-1` = "na, asked",
    `1` = "not at all or hardly a burden",
    `2` = "somewhat a burden",
    `3` = "rather heavy burden",
    `4` = "very heavy burden",
    `5` = "overburdened"
  ),
    qhhacqh = .replace_labels(
    standardized_value_labels$qhhacqh,
    `-2` = "na, see g/hqhhacqu",
    `-1` = "na, asked"
  ),
    qhhacqm = .replace_labels(
    standardized_value_labels$qhhacqm,
    `-2` = "na, see g/hqhhacqu",
    `-1` = "na, asked"
  ),
    qhhacqu = .replace_labels(
    standardized_value_labels$qhhacqu,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhacqy = .replace_labels(
    standardized_value_labels$qhhacqy,
    `-2` = "na, see g/hqhhacqu",
    `-1` = "na, asked"
  ),
    qhhbrsh = .replace_labels(
    standardized_value_labels$qhhbrsh,
    `-2` = "na, see g/hqhhbrsi",
    `-1` = "na, asked"
  ),
    qhhbrsi = .replace_labels(
    standardized_value_labels$qhhbrsi,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhbrsm = .replace_labels(
    standardized_value_labels$qhhbrsm,
    `-2` = "na, see g/hqhhbrsi",
    `-1` = "na, asked"
  ),
    qhhbrsy = .replace_labels(
    standardized_value_labels$qhhbrsy,
    `-2` = "na, see g/hqhhbrsi",
    `-1` = "na, asked"
  ),
    qhhchin = .replace_labels(
    standardized_value_labels$qhhchin,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhchnh = .replace_labels(
    standardized_value_labels$qhhchnh,
    `-2` = "na, see g/hqhhchin",
    `-1` = "na, asked"
  ),
    qhhchnm = .replace_labels(
    standardized_value_labels$qhhchnm,
    `-2` = "na, see g/hqhhchin",
    `-1` = "na, asked"
  ),
    qhhchny = .replace_labels(
    standardized_value_labels$qhhchny,
    `-2` = "na, see g/hqhhchin",
    `-1` = "na, asked"
  ),
    qhhgrah = .replace_labels(
    standardized_value_labels$qhhgrah,
    `-2` = "na, see g/hqhhgrch",
    `-1` = "na, asked"
  ),
    qhhgram = .replace_labels(
    standardized_value_labels$qhhgram,
    `-2` = "na, see g/hqhhgrch",
    `-1` = "na, asked"
  ),
    qhhgray = .replace_labels(
    standardized_value_labels$qhhgray,
    `-2` = "na, see g/hqhhgrch",
    `-1` = "na, asked"
  ),
    qhhgrch = .replace_labels(
    standardized_value_labels$qhhgrch,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhneig = .replace_labels(
    standardized_value_labels$qhhneig,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhneih = .replace_labels(
    standardized_value_labels$qhhneih,
    `-2` = "na, see g/hqhhneig",
    `-1` = "na, asked"
  ),
    qhhneim = .replace_labels(
    standardized_value_labels$qhhneim,
    `-2` = "na, see g/hqhhneig",
    `-1` = "na, asked"
  ),
    qhhneiy = .replace_labels(
    standardized_value_labels$qhhneiy,
    `-2` = "na, see g/hqhhneig",
    `-1` = "na, asked"
  ),
    qhhotfa = .replace_labels(
    standardized_value_labels$qhhotfa,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhotfh = .replace_labels(
    standardized_value_labels$qhhotfh,
    `-2` = "na, see g/hqhhotfa",
    `-1` = "na, asked"
  ),
    qhhotfm = .replace_labels(
    standardized_value_labels$qhhotfm,
    `-2` = "na, see g/hqhhotfa",
    `-1` = "na, asked"
  ),
    qhhotfy = .replace_labels(
    standardized_value_labels$qhhotfy,
    `-2` = "na, see g/hqhhotfa",
    `-1` = "na, asked"
  ),
    qhhothh = .replace_labels(
    standardized_value_labels$qhhothh,
    `-2` = "na, see g/hqhhothn",
    `-1` = "na, asked"
  ),
    qhhothm = .replace_labels(
    standardized_value_labels$qhhothm,
    `-2` = "na, see g/hqhhothn",
    `-1` = "na, asked"
  ),
    qhhothn = .replace_labels(
    standardized_value_labels$qhhothn,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhothy = .replace_labels(
    standardized_value_labels$qhhothy,
    `-2` = "na, see g/hqhhothn",
    `-1` = "na, asked"
  ),
    qhhparn = .replace_labels(
    standardized_value_labels$qhhparn,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhpart = .replace_labels(
    standardized_value_labels$qhhpart,
    `-2` = "na, see g/hqhhyn",
    `-1` = "na, asked"
  ),
    qhhprnh = .replace_labels(
    standardized_value_labels$qhhprnh,
    `-2` = "na, see g/hqhhparn",
    `-1` = "na, asked"
  ),
    qhhprnm = .replace_labels(
    standardized_value_labels$qhhprnm,
    `-2` = "na, see g/hqhhparn",
    `-1` = "na, asked"
  ),
    qhhprny = .replace_labels(
    standardized_value_labels$qhhprny,
    `-2` = "na, see g/hqhhparn",
    `-1` = "na, asked"
  ),
    qhhprth = .replace_labels(
    standardized_value_labels$qhhprth,
    `-2` = "na, see g/hqhhpart",
    `-1` = "na, asked"
  ),
    qhhprtm = .replace_labels(
    standardized_value_labels$qhhprtm,
    `-2` = "na, see g/hqhhpart",
    `-1` = "na, asked"
  ),
    qhhprty = .replace_labels(
    standardized_value_labels$qhhprty,
    `-2` = "na, see g/hqhhpart",
    `-1` = "na, asked"
  ),
    qhhyn = .replace_labels(
    standardized_value_labels$qhhyn,
    `-1` = "na, asked"
  ),
    qphacqh = .replace_labels(
    standardized_value_labels$qphacqh,
    `-2` = "na, see g/hqphacqu",
    `-1` = "na, asked"
  ),
    qphacqm = .replace_labels(
    standardized_value_labels$qphacqm,
    `-2` = "na, see g/hqphacqu",
    `-1` = "na, asked"
  ),
    qphacqu = .replace_labels(
    standardized_value_labels$qphacqu,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphacqy = .replace_labels(
    standardized_value_labels$qphacqy,
    `-2` = "na, see g/hqphacqu",
    `-1` = "na, asked"
  ),
    qphbrsh = .replace_labels(
    standardized_value_labels$qphbrsh,
    `-2` = "na, see g/hqphbrsi",
    `-1` = "na, asked"
  ),
    qphbrsi = .replace_labels(
    standardized_value_labels$qphbrsi,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphbrsm = .replace_labels(
    standardized_value_labels$qphbrsm,
    `-2` = "na, see g/hqphbrsi",
    `-1` = "na, asked"
  ),
    qphbrsy = .replace_labels(
    standardized_value_labels$qphbrsy,
    `-2` = "na, see g/hqphbrsi",
    `-1` = "na, asked"
  ),
    qphchin = .replace_labels(
    standardized_value_labels$qphchin,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphchir = .replace_labels(
    standardized_value_labels$qphchir,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphchnh = c(`-2` = "na, see g/hqphchin", `-1` = "na, asked", `168` = NA_character_),
    qphchnm = .replace_labels(
    standardized_value_labels$qphchnm,
    `-2` = "na, see g/hqphchin",
    `-1` = "na, asked"
  ),
    qphchny = .replace_labels(
    standardized_value_labels$qphchny,
    `-2` = "na, see g/hqphchin",
    `-1` = "na, asked"
  ),
    qphchrh = .replace_labels(
    standardized_value_labels$qphchrh,
    `-2` = "na, see g/hqphchir",
    `-1` = "na, asked"
  ),
    qphchrm = .replace_labels(
    standardized_value_labels$qphchrm,
    `-2` = "na, see g/hqphchir",
    `-1` = "na, asked"
  ),
    qphchry = .replace_labels(
    standardized_value_labels$qphchry,
    `-2` = "na, see g/hqphchir",
    `-1` = "na, asked"
  ),
    qphgrah = .replace_labels(
    standardized_value_labels$qphgrah,
    `-2` = "na, see g/hqphgrch",
    `-1` = "na, asked"
  ),
    qphgram = .replace_labels(
    standardized_value_labels$qphgram,
    `-2` = "na, see g/hqphgrch",
    `-1` = "na, asked"
  ),
    qphgray = .replace_labels(
    standardized_value_labels$qphgray,
    `-2` = "na, see g/hqphgrch",
    `-1` = "na, asked"
  ),
    qphgrch = .replace_labels(
    standardized_value_labels$qphgrch,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphneig = .replace_labels(
    standardized_value_labels$qphneig,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphneih = .replace_labels(
    standardized_value_labels$qphneih,
    `-2` = "na, see g/hqphneig",
    `-1` = "na, asked"
  ),
    qphneim = .replace_labels(
    standardized_value_labels$qphneim,
    `-2` = "na, see g/hqphneig",
    `-1` = "na, asked"
  ),
    qphneiy = .replace_labels(
    standardized_value_labels$qphneiy,
    `-2` = "na, see g/hqphneig",
    `-1` = "na, asked"
  ),
    qphotfa = .replace_labels(
    standardized_value_labels$qphotfa,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphotfh = .replace_labels(
    standardized_value_labels$qphotfh,
    `-2` = "na, see g/hqphotfa",
    `-1` = "na, asked"
  ),
    qphotfm = .replace_labels(
    standardized_value_labels$qphotfm,
    `-2` = "na, see g/hqphotfa",
    `-1` = "na, asked"
  ),
    qphotfy = .replace_labels(
    standardized_value_labels$qphotfy,
    `-2` = "na, see g/hqphotfa",
    `-1` = "na, asked"
  ),
    qphothh = .replace_labels(
    standardized_value_labels$qphothh,
    `-2` = "na, see g/hqphothn",
    `-1` = "na, asked"
  ),
    qphothm = .replace_labels(
    standardized_value_labels$qphothm,
    `-2` = "na, see g/hqphothn",
    `-1` = "na, asked"
  ),
    qphothn = .replace_labels(
    standardized_value_labels$qphothn,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphothr = .replace_labels(
    standardized_value_labels$qphothr,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphothy = .replace_labels(
    standardized_value_labels$qphothy,
    `-2` = "na, see g/hqphothn",
    `-1` = "na, asked"
  ),
    qphotrh = .replace_labels(
    standardized_value_labels$qphotrh,
    `-2` = "na, see g/hqphothr",
    `-1` = "na, asked"
  ),
    qphotrm = .replace_labels(
    standardized_value_labels$qphotrm,
    `-2` = "na, see g/hqphothr",
    `-1` = "na, asked"
  ),
    qphotry = .replace_labels(
    standardized_value_labels$qphotry,
    `-2` = "na, see g/hqphothr",
    `-1` = "na, asked"
  ),
    qphparn = .replace_labels(
    standardized_value_labels$qphparn,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphparr = .replace_labels(
    standardized_value_labels$qphparr,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphpart = .replace_labels(
    standardized_value_labels$qphpart,
    `-2` = "na, see g/hqphyn",
    `-1` = "na, asked"
  ),
    qphprnh = c(`-2` = "na, see g/hqphparn", `-1` = "na, asked", `168` = NA_character_),
    qphprnm = .replace_labels(
    standardized_value_labels$qphprnm,
    `-2` = "na, see g/hqphparn",
    `-1` = "na, asked"
  ),
    qphprny = .replace_labels(
    standardized_value_labels$qphprny,
    `-2` = "na, see g/hqphparn",
    `-1` = "na, asked"
  ),
    qphprrh = .replace_labels(
    standardized_value_labels$qphprrh,
    `-2` = "na, see g/hqphparr",
    `-1` = "na, asked"
  ),
    qphprrm = .replace_labels(
    standardized_value_labels$qphprrm,
    `-2` = "na, see g/hqphparr",
    `-1` = "na, asked"
  ),
    qphprry = .replace_labels(
    standardized_value_labels$qphprry,
    `-2` = "na, see g/hqphparr",
    `-1` = "na, asked"
  ),
    qphprth = c(`-2` = "na, see g/hqphpart", `-1` = "na, asked", `168` = NA_character_),
    qphprtm = .replace_labels(
    standardized_value_labels$qphprtm,
    `-2` = "na, see g/hqphpart",
    `-1` = "na, asked"
  ),
    qphprty = .replace_labels(
    standardized_value_labels$qphprty,
    `-2` = "na, see g/hqphpart",
    `-1` = "na, asked"
  ),
    qphyn = .replace_labels(
    standardized_value_labels$qphyn,
    `-1` = "na, asked"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "qcarbur",
    "qhhacqh",
    "qhhacqm",
    "qhhacqu",
    "qhhacqy",
    "qhhbrsh",
    "qhhbrsi",
    "qhhbrsm",
    "qhhbrsy",
    "qhhchin",
    "qhhchnh",
    "qhhchnm",
    "qhhchny",
    "qhhgrah",
    "qhhgram",
    "qhhgray",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhneim",
    "qhhneiy",
    "qhhotfa",
    "qhhotfh",
    "qhhotfm",
    "qhhotfy",
    "qhhothh",
    "qhhothm",
    "qhhothn",
    "qhhothy",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprnm",
    "qhhprny",
    "qhhprth",
    "qhhprtm",
    "qhhprty",
    "qhhyn",
    "qphacqh",
    "qphacqm",
    "qphacqu",
    "qphacqy",
    "qphbrsh",
    "qphbrsi",
    "qphbrsm",
    "qphbrsy",
    "qphchin",
    "qphchnh",
    "qphchnm",
    "qphchny",
    "qphgrah",
    "qphgram",
    "qphgray",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphneim",
    "qphneiy",
    "qphotfa",
    "qphotfh",
    "qphotfm",
    "qphotfy",
    "qphothh",
    "qphothm",
    "qphothn",
    "qphothy",
    "qphparn",
    "qphpart",
    "qphprnh",
    "qphprnm",
    "qphprny",
    "qphprth",
    "qphprtm",
    "qphprty",
    "qphyn"
  )],
    qcarbur = c(
    `-1` = "na, asked",
    `1` = "not at all or hardly a burden",
    `2` = "somewhat a burden",
    `3` = "rather heavy burden",
    `4` = "very heavy burden",
    `5` = "overburdened",
    `6` = "R does not give any domestic or personal care"
  ),
    qhhacqh = .replace_labels(
    standardized_value_labels$qhhacqh,
    `-2` = "na, see bqhhacqu",
    `-1` = "na, asked"
  ),
    qhhacqm = .replace_labels(
    standardized_value_labels$qhhacqm,
    `-2` = "na, see bqhhacqu",
    `-1` = "na, asked"
  ),
    qhhacqu = .replace_labels(
    standardized_value_labels$qhhacqu,
    `-2` = "na, see bqhhyn",
    `-1` = "na, asked"
  ),
    qhhacqy = .replace_labels(
    standardized_value_labels$qhhacqy,
    `-2` = "na, see bqhhacqu",
    `-1` = "na, asked"
  ),
    qhhbrsh = .replace_labels(
    standardized_value_labels$qhhbrsh,
    `-2` = "na, see bqhhbrsi",
    `-1` = "na, asked"
  ),
    qhhbrsi = .replace_labels(
    standardized_value_labels$qhhbrsi,
    `-2` = "na, see bqhhyn",
    `-1` = "na, asked"
  ),
    qhhbrsm = .replace_labels(
    standardized_value_labels$qhhbrsm,
    `-2` = "na, see bqhhbrsi",
    `-1` = "na, asked"
  ),
    qhhbrsy = .replace_labels(
    standardized_value_labels$qhhbrsy,
    `-2` = "na, see bqhhbrsi",
    `-1` = "na, asked"
  ),
    qhhchin = .replace_labels(
    standardized_value_labels$qhhchin,
    `-2` = "na, see bqhhyn",
    `-1` = "na, asked"
  ),
    qhhchnh = .replace_labels(
    standardized_value_labels$qhhchnh,
    `-2` = "na, see bqhhchin",
    `-1` = "na, asked"
  ),
    qhhchnm = .replace_labels(
    standardized_value_labels$qhhchnm,
    `-2` = "na, see bqhhchin",
    `-1` = "na, asked"
  ),
    qhhchny = .replace_labels(
    standardized_value_labels$qhhchny,
    `-2` = "na, see bqhhchin",
    `-1` = "na, asked"
  ),
    qhhgrah = .replace_labels(
    standardized_value_labels$qhhgrah,
    `-2` = "na, see bqhhgrch",
    `-1` = "na, asked"
  ),
    qhhgram = .replace_labels(
    standardized_value_labels$qhhgram,
    `-2` = "na, see bqhhgrch",
    `-1` = "na, asked"
  ),
    qhhgray = .replace_labels(
    standardized_value_labels$qhhgray,
    `-2` = "na, see bqhhgrch",
    `-1` = "na, asked"
  ),
    qhhgrch = .replace_labels(
    standardized_value_labels$qhhgrch,
    `-2` = "na, see bqhhyn",
    `-1` = "na, asked"
  ),
    qhhneig = .replace_labels(
    standardized_value_labels$qhhneig,
    `-2` = "na, see bqhhyn",
    `-1` = "na, asked"
  ),
    qhhneih = .replace_labels(
    standardized_value_labels$qhhneih,
    `-2` = "na, see bqhhneig",
    `-1` = "na, asked"
  ),
    qhhneim = .replace_labels(
    standardized_value_labels$qhhneim,
    `-2` = "na, see bqhhneig",
    `-1` = "na, asked"
  ),
    qhhneiy = .replace_labels(
    standardized_value_labels$qhhneiy,
    `-2` = "na, see bqhhneig",
    `-1` = "na, asked"
  ),
    qhhotfa = .replace_labels(
    standardized_value_labels$qhhotfa,
    `-2` = "na, see bqhhyn",
    `-1` = "na, asked"
  ),
    qhhotfh = .replace_labels(
    standardized_value_labels$qhhotfh,
    `-2` = "na, see bqhhotfa",
    `-1` = "na, asked"
  ),
    qhhotfm = .replace_labels(
    standardized_value_labels$qhhotfm,
    `-2` = "na, see bqhhotfa",
    `-1` = "na, asked"
  ),
    qhhotfy = .replace_labels(
    standardized_value_labels$qhhotfy,
    `-2` = "na, see bqhhotfa",
    `-1` = "na, asked"
  ),
    qhhothh = .replace_labels(
    standardized_value_labels$qhhothh,
    `-2` = "na, see bqhhothn",
    `-1` = "na, asked"
  ),
    qhhothm = .replace_labels(
    standardized_value_labels$qhhothm,
    `-2` = "na, see bqhhothn",
    `-1` = "na, asked"
  ),
    qhhothn = .replace_labels(
    standardized_value_labels$qhhothn,
    `-2` = "na, see bqhhyn",
    `-1` = "na, asked"
  ),
    qhhothy = .replace_labels(
    standardized_value_labels$qhhothy,
    `-2` = "na, see bqhhothn",
    `-1` = "na, asked"
  ),
    qhhparn = .replace_labels(
    standardized_value_labels$qhhparn,
    `-2` = "na, see bqhhyn",
    `-1` = "na, asked"
  ),
    qhhpart = .replace_labels(
    standardized_value_labels$qhhpart,
    `-2` = "na, see bqhhyn",
    `-1` = "na, asked"
  ),
    qhhprnh = .replace_labels(
    standardized_value_labels$qhhprnh,
    `-2` = "na, see bqhhparn",
    `-1` = "na, asked"
  ),
    qhhprnm = .replace_labels(
    standardized_value_labels$qhhprnm,
    `-2` = "na, see bqhhparn",
    `-1` = "na, asked"
  ),
    qhhprny = .replace_labels(
    standardized_value_labels$qhhprny,
    `-2` = "na, see bqhhparn",
    `-1` = "na, asked"
  ),
    qhhprth = .replace_labels(
    standardized_value_labels$qhhprth,
    `-2` = "na, see bqhhpart",
    `-1` = "na, asked"
  ),
    qhhprtm = .replace_labels(
    standardized_value_labels$qhhprtm,
    `-2` = "na, see bqhhpart",
    `-1` = "na, asked"
  ),
    qhhprty = .replace_labels(
    standardized_value_labels$qhhprty,
    `-2` = "na, see bqhhpart",
    `-1` = "na, asked"
  ),
    qhhyn = .replace_labels(
    standardized_value_labels$qhhyn,
    `-1` = "na, asked"
  ),
    qphacqh = .replace_labels(
    standardized_value_labels$qphacqh,
    `-2` = "na, see bqphacqu",
    `-1` = "na, asked"
  ),
    qphacqm = .replace_labels(
    standardized_value_labels$qphacqm,
    `-2` = "na, see bqphacqu",
    `-1` = "na, asked"
  ),
    qphacqu = .replace_labels(
    standardized_value_labels$qphacqu,
    `-2` = "na, see bqphyn",
    `-1` = "na, asked"
  ),
    qphacqy = .replace_labels(
    standardized_value_labels$qphacqy,
    `-2` = "na, see bqphacqu",
    `-1` = "na, asked"
  ),
    qphbrsh = .replace_labels(
    standardized_value_labels$qphbrsh,
    `-2` = "na, see bqphbrsi",
    `-1` = "na, asked"
  ),
    qphbrsi = .replace_labels(
    standardized_value_labels$qphbrsi,
    `-2` = "na, see bqphyn",
    `-1` = "na, asked"
  ),
    qphbrsm = .replace_labels(
    standardized_value_labels$qphbrsm,
    `-2` = "na, see bqphbrsi",
    `-1` = "na, asked"
  ),
    qphbrsy = .replace_labels(
    standardized_value_labels$qphbrsy,
    `-2` = "na, see bqphbrsi",
    `-1` = "na, asked"
  ),
    qphchin = .replace_labels(
    standardized_value_labels$qphchin,
    `-2` = "na, see bqphyn",
    `-1` = "na, asked"
  ),
    qphchnh = .replace_labels(
    standardized_value_labels$qphchnh,
    `-2` = "na, see bqphchin",
    `-1` = "na, asked"
  ),
    qphchnm = .replace_labels(
    standardized_value_labels$qphchnm,
    `-2` = "na, see bqphchin",
    `-1` = "na, asked"
  ),
    qphchny = .replace_labels(
    standardized_value_labels$qphchny,
    `-2` = "na, see bqphchin",
    `-1` = "na, asked"
  ),
    qphgrah = .replace_labels(
    standardized_value_labels$qphgrah,
    `-2` = "na, see bqphgrch",
    `-1` = "na, asked"
  ),
    qphgram = .replace_labels(
    standardized_value_labels$qphgram,
    `-2` = "na, see bqphgrch",
    `-1` = "na, asked"
  ),
    qphgray = .replace_labels(
    standardized_value_labels$qphgray,
    `-2` = "na, see bqphgrch",
    `-1` = "na, asked"
  ),
    qphgrch = .replace_labels(
    standardized_value_labels$qphgrch,
    `-2` = "na, see bqphyn",
    `-1` = "na, asked"
  ),
    qphneig = .replace_labels(
    standardized_value_labels$qphneig,
    `-2` = "na, see bqphyn",
    `-1` = "na, asked"
  ),
    qphneih = .replace_labels(
    standardized_value_labels$qphneih,
    `-2` = "na, see bqphneig",
    `-1` = "na, asked"
  ),
    qphneim = .replace_labels(
    standardized_value_labels$qphneim,
    `-2` = "na, see bqphneig",
    `-1` = "na, asked"
  ),
    qphneiy = .replace_labels(
    standardized_value_labels$qphneiy,
    `-2` = "na, see bqphneig",
    `-1` = "na, asked"
  ),
    qphotfa = .replace_labels(
    standardized_value_labels$qphotfa,
    `-2` = "na, see bqphyn",
    `-1` = "na, asked"
  ),
    qphotfh = .replace_labels(
    standardized_value_labels$qphotfh,
    `-2` = "na, see bqphotfa",
    `-1` = "na, asked"
  ),
    qphotfm = .replace_labels(
    standardized_value_labels$qphotfm,
    `-2` = "na, see bqphotfa",
    `-1` = "na, asked"
  ),
    qphotfy = .replace_labels(
    standardized_value_labels$qphotfy,
    `-2` = "na, see bqphotfa",
    `-1` = "na, asked"
  ),
    qphothh = .replace_labels(
    standardized_value_labels$qphothh,
    `-2` = "na, see bqphothn",
    `-1` = "na, asked"
  ),
    qphothm = .replace_labels(
    standardized_value_labels$qphothm,
    `-2` = "na, see bqphothn",
    `-1` = "na, asked"
  ),
    qphothn = .replace_labels(
    standardized_value_labels$qphothn,
    `-2` = "na, see bqphyn",
    `-1` = "na, asked"
  ),
    qphothy = .replace_labels(
    standardized_value_labels$qphothy,
    `-2` = "na, see bqphothn",
    `-1` = "na, asked"
  ),
    qphparn = .replace_labels(
    standardized_value_labels$qphparn,
    `-2` = "na, see bqphyn",
    `-1` = "na, asked"
  ),
    qphpart = .replace_labels(
    standardized_value_labels$qphpart,
    `-2` = "na, see bqphyn",
    `-1` = "na, asked"
  ),
    qphprnh = .replace_labels(
    standardized_value_labels$qphprnh,
    `-2` = "na, see bqphparn",
    `-1` = "na, asked"
  ),
    qphprnm = .replace_labels(
    standardized_value_labels$qphprnm,
    `-2` = "na, see bqphparn",
    `-1` = "na, asked"
  ),
    qphprny = .replace_labels(
    standardized_value_labels$qphprny,
    `-2` = "na, see bqphparn",
    `-1` = "na, asked"
  ),
    qphprth = .replace_labels(
    standardized_value_labels$qphprth,
    `-2` = "na, see bqphpart",
    `-1` = "na, asked"
  ),
    qphprtm = .replace_labels(
    standardized_value_labels$qphprtm,
    `-2` = "na, see bqphpart",
    `-1` = "na, asked"
  ),
    qphprty = .replace_labels(
    standardized_value_labels$qphprty,
    `-2` = "na, see bqphpar",
    `-1` = "na, asked"
  ),
    qphyn = .replace_labels(
    standardized_value_labels$qphyn,
    `-1` = "na, asked"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c(
    "mhhacqh",
    "mhhacqu",
    "mhhacqy",
    "mhhbrsh",
    "mhhbrsi",
    "mhhbrsy",
    "mhhchin",
    "mhhchnh",
    "mhhchny",
    "mhhgrah",
    "mhhgray",
    "mhhgrch",
    "mhhneig",
    "mhhneih",
    "mhhneiy",
    "mhhotfa",
    "mhhotfh",
    "mhhotfy",
    "mhhothh",
    "mhhothn",
    "mhhothy",
    "mhhparn",
    "mhhpart",
    "mhhprnh",
    "mhhprny",
    "mhhprth",
    "mhhprty",
    "mhhyn",
    "mphacqh",
    "mphacqu",
    "mphacqy",
    "mphbrsh",
    "mphbrsi",
    "mphbrsy",
    "mphchin",
    "mphchnh",
    "mphchny",
    "mphgrah",
    "mphgray",
    "mphgrch",
    "mphneig",
    "mphneih",
    "mphneiy",
    "mphotfa",
    "mphotfh",
    "mphotfy",
    "mphothh",
    "mphothn",
    "mphothy",
    "mphparn",
    "mphpart",
    "mphprnh",
    "mphprny",
    "mphprth",
    "mphprty",
    "mphyn",
    "qcarbur"
  )],
    mhhacqh = .replace_labels(
    standardized_value_labels$mhhacqh,
    `-2` = "na, see BMHHACQU",
    `-1` = "na, asked"
  ),
    mhhacqu = .replace_labels(
    standardized_value_labels$mhhacqu,
    `-2` = "na, see BMHHYN",
    `-1` = "na, asked"
  ),
    mhhacqy = .replace_labels(
    standardized_value_labels$mhhacqy,
    `-2` = "na, see BMHHACQU",
    `-1` = "na, asked"
  ),
    mhhbrsh = .replace_labels(
    standardized_value_labels$mhhbrsh,
    `-2` = "na, see BMHHBRSI",
    `-1` = "na, asked"
  ),
    mhhbrsi = .replace_labels(
    standardized_value_labels$mhhbrsi,
    `-2` = "na, see BMHHYN",
    `-1` = "na, asked"
  ),
    mhhbrsy = .replace_labels(
    standardized_value_labels$mhhbrsy,
    `-2` = "na, see BMHHBRSI",
    `-1` = "na, asked"
  ),
    mhhchin = .replace_labels(
    standardized_value_labels$mhhchin,
    `-2` = "na, see BMHHYN",
    `-1` = "na, asked"
  ),
    mhhchnh = .replace_labels(
    standardized_value_labels$mhhchnh,
    `-2` = "na, see BMHHCHIN",
    `-1` = "na, asked"
  ),
    mhhchny = .replace_labels(
    standardized_value_labels$mhhchny,
    `-2` = "na, see BMHHCHIN",
    `-1` = "na, asked"
  ),
    mhhgrah = .replace_labels(
    standardized_value_labels$mhhgrah,
    `-2` = "na, see BMHHGRCH",
    `-1` = "na, asked"
  ),
    mhhgray = .replace_labels(
    standardized_value_labels$mhhgray,
    `-2` = "na, see BMHHGRCH",
    `-1` = "na, asked"
  ),
    mhhgrch = .replace_labels(
    standardized_value_labels$mhhgrch,
    `-2` = "na, see BMHHYN",
    `-1` = "na, asked"
  ),
    mhhneig = .replace_labels(
    standardized_value_labels$mhhneig,
    `-2` = "na, see BMHHYN",
    `-1` = "na, asked"
  ),
    mhhneih = .replace_labels(
    standardized_value_labels$mhhneih,
    `-2` = "na, see BMHHNEIG",
    `-1` = "na, asked"
  ),
    mhhneiy = .replace_labels(
    standardized_value_labels$mhhneiy,
    `-2` = "na, see BMHHNEIG",
    `-1` = "na, asked"
  ),
    mhhotfa = .replace_labels(
    standardized_value_labels$mhhotfa,
    `-2` = "na, see BMHHYN",
    `-1` = "na, asked"
  ),
    mhhotfh = .replace_labels(
    standardized_value_labels$mhhotfh,
    `-2` = "na, see BMHHOTFA",
    `-1` = "na, asked"
  ),
    mhhotfy = .replace_labels(
    standardized_value_labels$mhhotfy,
    `-2` = "na, see BMHHOTFA",
    `-1` = "na, asked"
  ),
    mhhothh = .replace_labels(
    standardized_value_labels$mhhothh,
    `-2` = "na, see BMHHOTHN",
    `-1` = "na, asked"
  ),
    mhhothn = .replace_labels(
    standardized_value_labels$mhhothn,
    `-2` = "na, see BMHHYN",
    `-1` = "na, asked"
  ),
    mhhothy = .replace_labels(
    standardized_value_labels$mhhothy,
    `-2` = "na, see BMHHOTHN",
    `-1` = "na, asked"
  ),
    mhhparn = .replace_labels(
    standardized_value_labels$mhhparn,
    `-2` = "na, see BMHHYN",
    `-1` = "na, asked"
  ),
    mhhpart = .replace_labels(
    standardized_value_labels$mhhpart,
    `-2` = "na, see BMHHYN",
    `-1` = "na, asked"
  ),
    mhhprnh = .replace_labels(
    standardized_value_labels$mhhprnh,
    `-2` = "na, see BMHHPARN",
    `-1` = "na, asked"
  ),
    mhhprny = .replace_labels(
    standardized_value_labels$mhhprny,
    `-2` = "na, see BMHHPARN",
    `-1` = "na, asked"
  ),
    mhhprth = .replace_labels(
    standardized_value_labels$mhhprth,
    `-2` = "na, see BMHHPART",
    `-1` = "na, asked"
  ),
    mhhprty = .replace_labels(
    standardized_value_labels$mhhprty,
    `-2` = "na, see BMHHPART",
    `-1` = "na, asked"
  ),
    mhhyn = .replace_labels(
    standardized_value_labels$mhhyn,
    `-5` = "na, terminated interview",
    `-1` = "na, asked"
  ),
    mphacqh = .replace_labels(
    standardized_value_labels$mphacqh,
    `-2` = "na, see BMPHACQU",
    `-1` = "na, asked"
  ),
    mphacqu = .replace_labels(
    standardized_value_labels$mphacqu,
    `-2` = "na, see BMPHYN",
    `-1` = "na, asked"
  ),
    mphacqy = .replace_labels(
    standardized_value_labels$mphacqy,
    `-2` = "na, see BMPHACQU",
    `-1` = "na, asked"
  ),
    mphbrsh = .replace_labels(
    standardized_value_labels$mphbrsh,
    `-2` = "na, see BMPHBRSI",
    `-1` = "na, asked"
  ),
    mphbrsi = .replace_labels(
    standardized_value_labels$mphbrsi,
    `-2` = "na, see BMPHYN",
    `-1` = "na, asked"
  ),
    mphbrsy = .replace_labels(
    standardized_value_labels$mphbrsy,
    `-2` = "na, see BMPHBRSI",
    `-1` = "na, asked"
  ),
    mphchin = .replace_labels(
    standardized_value_labels$mphchin,
    `-2` = "na, see BMPHYN",
    `-1` = "na, asked"
  ),
    mphchnh = .replace_labels(
    standardized_value_labels$mphchnh,
    `-2` = "na, see BMPHCHIN",
    `-1` = "na, asked"
  ),
    mphchny = .replace_labels(
    standardized_value_labels$mphchny,
    `-2` = "na, see BMPHCHIN",
    `-1` = "na, asked"
  ),
    mphgrah = .replace_labels(
    standardized_value_labels$mphgrah,
    `-2` = "na, see BMPHGRCH",
    `-1` = "na, asked"
  ),
    mphgray = .replace_labels(
    standardized_value_labels$mphgray,
    `-2` = "na, see BMPHGRCH",
    `-1` = "na, asked"
  ),
    mphgrch = .replace_labels(
    standardized_value_labels$mphgrch,
    `-2` = "na, see BMPHYN",
    `-1` = "na, asked"
  ),
    mphneig = .replace_labels(
    standardized_value_labels$mphneig,
    `-2` = "na, see BMPHYN",
    `-1` = "na, asked"
  ),
    mphneih = .replace_labels(
    standardized_value_labels$mphneih,
    `-2` = "na, see BMPHNEIG",
    `-1` = "na, asked"
  ),
    mphneiy = .replace_labels(
    standardized_value_labels$mphneiy,
    `-2` = "na, see BMPHNEIG",
    `-1` = "na, asked"
  ),
    mphotfa = .replace_labels(
    standardized_value_labels$mphotfa,
    `-2` = "na, see BMPHYN",
    `-1` = "na, asked"
  ),
    mphotfh = .replace_labels(
    standardized_value_labels$mphotfh,
    `-2` = "na, see BMPHOTFA",
    `-1` = "na, asked"
  ),
    mphotfy = .replace_labels(
    standardized_value_labels$mphotfy,
    `-2` = "na, see BMPHOTFA",
    `-1` = "na, asked"
  ),
    mphothh = .replace_labels(
    standardized_value_labels$mphothh,
    `-2` = "na, see BMPHOTHN",
    `-1` = "na, asked"
  ),
    mphothn = .replace_labels(
    standardized_value_labels$mphothn,
    `-2` = "na, see BMPHYN",
    `-1` = "na, asked"
  ),
    mphothy = .replace_labels(
    standardized_value_labels$mphothy,
    `-2` = "na, see BMPHOTHN",
    `-1` = "na, asked"
  ),
    mphparn = .replace_labels(
    standardized_value_labels$mphparn,
    `-2` = "na, see BMPHYN",
    `-1` = "na, asked"
  ),
    mphpart = .replace_labels(
    standardized_value_labels$mphpart,
    `-2` = "na, see BMPHYN",
    `-1` = "na, asked"
  ),
    mphprnh = .replace_labels(
    standardized_value_labels$mphprnh,
    `-2` = "na, see BMPHPARN",
    `-1` = "na, asked"
  ),
    mphprny = .replace_labels(
    standardized_value_labels$mphprny,
    `-2` = "na, see BMPHPARN",
    `-1` = "na, asked"
  ),
    mphprth = .replace_labels(
    standardized_value_labels$mphprth,
    `-2` = "na, see BMPHPART",
    `-1` = "na, asked"
  ),
    mphprty = .replace_labels(
    standardized_value_labels$mphprty,
    `-2` = "na, see BMPHPART",
    `-1` = "na, asked"
  ),
    mphyn = .replace_labels(
    standardized_value_labels$mphyn,
    `-1` = "na, asked"
  ),
    qcarbur = c(
    `-5` = "na, terminated interview",
    `-1` = "na, asked",
    `1` = "not at all or hardly a burden",
    `2` = "somewhat a burden",
    `3` = "rather heavy burden",
    `4` = "very heavy burden"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "qcarbur",
    "qhhacqh",
    "qhhacqhp",
    "qhhacqu",
    "qhhbrsh",
    "qhhbrshp",
    "qhhbrsi",
    "qhhchin",
    "qhhchnh",
    "qhhchnhp",
    "qhhgrah",
    "qhhgrahp",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhneihp",
    "qhhotfa",
    "qhhotfh",
    "qhhotfhp",
    "qhhothh",
    "qhhothhp",
    "qhhothn",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprnhp",
    "qhhprth",
    "qhhprthp",
    "qhhyn",
    "qphacqh",
    "qphacqhp",
    "qphacqu",
    "qphbrsh",
    "qphbrshp",
    "qphbrsi",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchnhp",
    "qphchrh",
    "qphchrhp",
    "qphgrah",
    "qphgrahp",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphneihp",
    "qphotfa",
    "qphotfh",
    "qphotfhp",
    "qphothh",
    "qphothhp",
    "qphothn",
    "qphothr",
    "qphotrh",
    "qphotrhp",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprnhp",
    "qphprrh",
    "qphprrhp",
    "qphprth",
    "qphprthp",
    "qphyn"
  )],
    qcarbur = c(
    `-1` = "na, asked",
    `1` = "not at all or hardly a burden",
    `2` = "somewhat a burden",
    `3` = "rather heavy burden",
    `4` = "very heavy burden",
    `5` = "overburdened"
  ),
    qhhacqh = .replace_labels(
    standardized_value_labels$qhhacqh,
    `-2` = "na, see I/J/KQHHACQU",
    `-1` = "na, asked"
  ),
    qhhacqhp = .replace_labels(
    standardized_value_labels$qhhacqhp,
    `-2` = "na, see I/J/KQHHACQU",
    `-1` = "na, asked"
  ),
    qhhacqu = .replace_labels(
    standardized_value_labels$qhhacqu,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhbrsh = .replace_labels(
    standardized_value_labels$qhhbrsh,
    `-2` = "na, see I/J/KQHHBRSI",
    `-1` = "na, asked"
  ),
    qhhbrshp = .replace_labels(
    standardized_value_labels$qhhbrshp,
    `-2` = "na, see I/J/KQHHBRSI",
    `-1` = "na, asked"
  ),
    qhhbrsi = .replace_labels(
    standardized_value_labels$qhhbrsi,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhchin = .replace_labels(
    standardized_value_labels$qhhchin,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhchnh = .replace_labels(
    standardized_value_labels$qhhchnh,
    `-2` = "na, see I/J/KQHHCHIN",
    `-1` = "na, asked"
  ),
    qhhchnhp = .replace_labels(
    standardized_value_labels$qhhchnhp,
    `-2` = "na, see I/J/KQHHCHIN",
    `-1` = "na, asked"
  ),
    qhhgrah = .replace_labels(
    standardized_value_labels$qhhgrah,
    `-2` = "na, see I/J/KQHHGRCH",
    `-1` = "na, asked"
  ),
    qhhgrahp = .replace_labels(
    standardized_value_labels$qhhgrahp,
    `-2` = "na, see I/J/KQHHGRCH",
    `-1` = "na, asked"
  ),
    qhhgrch = .replace_labels(
    standardized_value_labels$qhhgrch,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhneig = .replace_labels(
    standardized_value_labels$qhhneig,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhneih = .replace_labels(
    standardized_value_labels$qhhneih,
    `-2` = "na, see I/J/KQHHNEIG",
    `-1` = "na, asked"
  ),
    qhhneihp = .replace_labels(
    standardized_value_labels$qhhneihp,
    `-2` = "na, see I/J/KQHHNEIG",
    `-1` = "na, asked"
  ),
    qhhotfa = .replace_labels(
    standardized_value_labels$qhhotfa,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhotfh = .replace_labels(
    standardized_value_labels$qhhotfh,
    `-2` = "na, see I/J/KQHHOTFA",
    `-1` = "na, asked"
  ),
    qhhotfhp = .replace_labels(
    standardized_value_labels$qhhotfhp,
    `-2` = "na, see I/J/KQHHOTFA",
    `-1` = "na, asked"
  ),
    qhhothh = .replace_labels(
    standardized_value_labels$qhhothh,
    `-2` = "na, see I/J/KQHHOTHN",
    `-1` = "na, asked"
  ),
    qhhothhp = .replace_labels(
    standardized_value_labels$qhhothhp,
    `-2` = "na, see I/J/KQHHOTHN",
    `-1` = "na, asked"
  ),
    qhhothn = .replace_labels(
    standardized_value_labels$qhhothn,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhparn = .replace_labels(
    standardized_value_labels$qhhparn,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhpart = .replace_labels(
    standardized_value_labels$qhhpart,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhprnh = .replace_labels(
    standardized_value_labels$qhhprnh,
    `-2` = "na, see I/J/KQHHPARN",
    `-1` = "na, asked"
  ),
    qhhprnhp = .replace_labels(
    standardized_value_labels$qhhprnhp,
    `-2` = "na, see I/J/KQHHPARN",
    `-1` = "na, asked"
  ),
    qhhprth = .replace_labels(
    standardized_value_labels$qhhprth,
    `-2` = "na, see I/J/KQHHPART",
    `-1` = "na, asked"
  ),
    qhhprthp = .replace_labels(
    standardized_value_labels$qhhprthp,
    `-2` = "na, see I/J/KQHHPART",
    `-1` = "na, asked"
  ),
    qhhyn = .replace_labels(
    standardized_value_labels$qhhyn,
    `-1` = "na, asked"
  ),
    qphacqh = .replace_labels(
    standardized_value_labels$qphacqh,
    `-2` = "na, see I/J/KQPHACQU",
    `-1` = "na, asked"
  ),
    qphacqhp = .replace_labels(
    standardized_value_labels$qphacqhp,
    `-2` = "na, see I/J/KQPHACQU",
    `-1` = "na, asked"
  ),
    qphacqu = .replace_labels(
    standardized_value_labels$qphacqu,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphbrsh = .replace_labels(
    standardized_value_labels$qphbrsh,
    `-2` = "na, see I/J/KQPHBRSI",
    `-1` = "na, asked"
  ),
    qphbrshp = .replace_labels(
    standardized_value_labels$qphbrshp,
    `-2` = "na, see I/J/KQPHBRSI",
    `-1` = "na, asked"
  ),
    qphbrsi = .replace_labels(
    standardized_value_labels$qphbrsi,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphchin = .replace_labels(
    standardized_value_labels$qphchin,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphchir = .replace_labels(
    standardized_value_labels$qphchir,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphchnh = c(`-2` = "na, see I/J/KQPHCHIN", `-1` = "na, asked", `168` = NA_character_),
    qphchnhp = .replace_labels(
    standardized_value_labels$qphchnhp,
    `-2` = "na, see I/J/KQPHCHIN",
    `-1` = "na, asked"
  ),
    qphchrh = .replace_labels(
    standardized_value_labels$qphchrh,
    `-2` = "na, see I/J/KQPHCHIR",
    `-1` = "na, asked"
  ),
    qphchrhp = .replace_labels(
    standardized_value_labels$qphchrhp,
    `-2` = "na, see I/J/KQPHCHIR",
    `-1` = "na, asked"
  ),
    qphgrah = .replace_labels(
    standardized_value_labels$qphgrah,
    `-2` = "na, see I/J/KQPHGRCH",
    `-1` = "na, asked"
  ),
    qphgrahp = .replace_labels(
    standardized_value_labels$qphgrahp,
    `-2` = "na, see I/J/KQPHGRCH",
    `-1` = "na, asked"
  ),
    qphgrch = .replace_labels(
    standardized_value_labels$qphgrch,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphneig = .replace_labels(
    standardized_value_labels$qphneig,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphneih = .replace_labels(
    standardized_value_labels$qphneih,
    `-2` = "na, see I/J/KQPHNEIG",
    `-1` = "na, asked"
  ),
    qphneihp = .replace_labels(
    standardized_value_labels$qphneihp,
    `-2` = "na, see I/J/KQPHNEIG",
    `-1` = "na, asked"
  ),
    qphotfa = .replace_labels(
    standardized_value_labels$qphotfa,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphotfh = .replace_labels(
    standardized_value_labels$qphotfh,
    `-2` = "na, see I/J/KQPHOTFA",
    `-1` = "na, asked"
  ),
    qphotfhp = .replace_labels(
    standardized_value_labels$qphotfhp,
    `-2` = "na, see I/J/KQPHOTFA",
    `-1` = "na, asked"
  ),
    qphothh = .replace_labels(
    standardized_value_labels$qphothh,
    `-2` = "na, see I/J/KQPHOTHN",
    `-1` = "na, asked"
  ),
    qphothhp = .replace_labels(
    standardized_value_labels$qphothhp,
    `-2` = "na, see I/J/KQPHOTHN",
    `-1` = "na, asked"
  ),
    qphothn = .replace_labels(
    standardized_value_labels$qphothn,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphothr = .replace_labels(
    standardized_value_labels$qphothr,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphotrh = .replace_labels(
    standardized_value_labels$qphotrh,
    `-2` = "na, see I/J/KQPHOTHR",
    `-1` = "na, asked"
  ),
    qphotrhp = .replace_labels(
    standardized_value_labels$qphotrhp,
    `-2` = "na, see I/J/KQPHOTHR",
    `-1` = "na, asked"
  ),
    qphparn = .replace_labels(
    standardized_value_labels$qphparn,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphparr = .replace_labels(
    standardized_value_labels$qphparr,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphpart = .replace_labels(
    standardized_value_labels$qphpart,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphprnh = c(`-2` = "na, see I/J/KQPHPARN", `-1` = "na, asked", `168` = NA_character_),
    qphprnhp = .replace_labels(
    standardized_value_labels$qphprnhp,
    `-2` = "na, see I/J/KQPHPARN",
    `-1` = "na, asked"
  ),
    qphprrh = .replace_labels(
    standardized_value_labels$qphprrh,
    `-2` = "na, see I/J/KQPHPARR",
    `-1` = "na, asked"
  ),
    qphprrhp = .replace_labels(
    standardized_value_labels$qphprrhp,
    `-2` = "na, see I/J/KQPHPARR",
    `-1` = "na, asked"
  ),
    qphprth = c(`-2` = "na, see I/J/KQPHPART", `-1` = "na, asked", `168` = NA_character_),
    qphprthp = .replace_labels(
    standardized_value_labels$qphprthp,
    `-2` = "na, see I/J/KQPHPART",
    `-1` = "na, asked"
  ),
    qphyn = .replace_labels(
    standardized_value_labels$qphyn,
    `-1` = "na, asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "qcarbur",
    "qhhacqh",
    "qhhacqhp",
    "qhhacqu",
    "qhhbrsh",
    "qhhbrshp",
    "qhhbrsi",
    "qhhchin",
    "qhhchnh",
    "qhhchnhp",
    "qhhgrah",
    "qhhgrahp",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhneihp",
    "qhhotfa",
    "qhhotfh",
    "qhhotfhp",
    "qhhothh",
    "qhhothhp",
    "qhhothn",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprnhp",
    "qhhprth",
    "qhhprthp",
    "qhhyn",
    "qphacqh",
    "qphacqhp",
    "qphacqu",
    "qphbrsh",
    "qphbrshp",
    "qphbrsi",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchnhp",
    "qphchrh",
    "qphchrhp",
    "qphgrah",
    "qphgrahp",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphneihp",
    "qphotfa",
    "qphotfh",
    "qphotfhp",
    "qphothh",
    "qphothhp",
    "qphothn",
    "qphothr",
    "qphotrh",
    "qphotrhp",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprnhp",
    "qphprrh",
    "qphprrhp",
    "qphprth",
    "qphprthp",
    "qphyn"
  )],
    qcarbur = c(
    `-1` = "na, asked",
    `1` = "not at all or hardly a burden",
    `2` = "somewhat a burden",
    `3` = "rather heavy burden",
    `4` = "very heavy burden",
    `5` = "overburdened"
  ),
    qhhacqh = .replace_labels(
    standardized_value_labels$qhhacqh,
    `-2` = "na, see I/J/KQHHACQU",
    `-1` = "na, asked"
  ),
    qhhacqhp = .replace_labels(
    standardized_value_labels$qhhacqhp,
    `-2` = "na, see I/J/KQHHACQU",
    `-1` = "na, asked"
  ),
    qhhacqu = .replace_labels(
    standardized_value_labels$qhhacqu,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhbrsh = .replace_labels(
    standardized_value_labels$qhhbrsh,
    `-2` = "na, see I/J/KQHHBRSI",
    `-1` = "na, asked"
  ),
    qhhbrshp = .replace_labels(
    standardized_value_labels$qhhbrshp,
    `-2` = "na, see I/J/KQHHBRSI",
    `-1` = "na, asked"
  ),
    qhhbrsi = .replace_labels(
    standardized_value_labels$qhhbrsi,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhchin = .replace_labels(
    standardized_value_labels$qhhchin,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhchnh = .replace_labels(
    standardized_value_labels$qhhchnh,
    `-2` = "na, see I/J/KQHHCHIN",
    `-1` = "na, asked"
  ),
    qhhchnhp = .replace_labels(
    standardized_value_labels$qhhchnhp,
    `-2` = "na, see I/J/KQHHCHIN",
    `-1` = "na, asked"
  ),
    qhhgrah = .replace_labels(
    standardized_value_labels$qhhgrah,
    `-2` = "na, see I/J/KQHHGRCH",
    `-1` = "na, asked"
  ),
    qhhgrahp = .replace_labels(
    standardized_value_labels$qhhgrahp,
    `-2` = "na, see I/J/KQHHGRCH",
    `-1` = "na, asked"
  ),
    qhhgrch = .replace_labels(
    standardized_value_labels$qhhgrch,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhneig = .replace_labels(
    standardized_value_labels$qhhneig,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhneih = .replace_labels(
    standardized_value_labels$qhhneih,
    `-2` = "na, see I/J/KQHHNEIG",
    `-1` = "na, asked"
  ),
    qhhneihp = .replace_labels(
    standardized_value_labels$qhhneihp,
    `-2` = "na, see I/J/KQHHNEIG",
    `-1` = "na, asked"
  ),
    qhhotfa = .replace_labels(
    standardized_value_labels$qhhotfa,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhotfh = .replace_labels(
    standardized_value_labels$qhhotfh,
    `-2` = "na, see I/J/KQHHOTFA",
    `-1` = "na, asked"
  ),
    qhhotfhp = .replace_labels(
    standardized_value_labels$qhhotfhp,
    `-2` = "na, see I/J/KQHHOTFA",
    `-1` = "na, asked"
  ),
    qhhothh = .replace_labels(
    standardized_value_labels$qhhothh,
    `-2` = "na, see I/J/KQHHOTHN",
    `-1` = "na, asked"
  ),
    qhhothhp = .replace_labels(
    standardized_value_labels$qhhothhp,
    `-2` = "na, see I/J/KQHHOTHN",
    `-1` = "na, asked"
  ),
    qhhothn = .replace_labels(
    standardized_value_labels$qhhothn,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhparn = .replace_labels(
    standardized_value_labels$qhhparn,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhpart = .replace_labels(
    standardized_value_labels$qhhpart,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhprnh = .replace_labels(
    standardized_value_labels$qhhprnh,
    `-2` = "na, see I/J/KQHHPARN",
    `-1` = "na, asked"
  ),
    qhhprnhp = .replace_labels(
    standardized_value_labels$qhhprnhp,
    `-2` = "na, see I/J/KQHHPARN",
    `-1` = "na, asked"
  ),
    qhhprth = .replace_labels(
    standardized_value_labels$qhhprth,
    `-2` = "na, see I/J/KQHHPART",
    `-1` = "na, asked"
  ),
    qhhprthp = .replace_labels(
    standardized_value_labels$qhhprthp,
    `-2` = "na, see I/J/KQHHPART",
    `-1` = "na, asked"
  ),
    qhhyn = .replace_labels(
    standardized_value_labels$qhhyn,
    `-1` = "na, asked"
  ),
    qphacqh = .replace_labels(
    standardized_value_labels$qphacqh,
    `-2` = "na, see I/J/KQPHACQU",
    `-1` = "na, asked"
  ),
    qphacqhp = .replace_labels(
    standardized_value_labels$qphacqhp,
    `-2` = "na, see I/J/KQPHACQU",
    `-1` = "na, asked"
  ),
    qphacqu = .replace_labels(
    standardized_value_labels$qphacqu,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphbrsh = .replace_labels(
    standardized_value_labels$qphbrsh,
    `-2` = "na, see I/J/KQPHBRSI",
    `-1` = "na, asked"
  ),
    qphbrshp = .replace_labels(
    standardized_value_labels$qphbrshp,
    `-2` = "na, see I/J/KQPHBRSI",
    `-1` = "na, asked"
  ),
    qphbrsi = .replace_labels(
    standardized_value_labels$qphbrsi,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphchin = .replace_labels(
    standardized_value_labels$qphchin,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphchir = .replace_labels(
    standardized_value_labels$qphchir,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphchnh = c(`-2` = "na, see I/J/KQPHCHIN", `-1` = "na, asked", `168` = NA_character_),
    qphchnhp = .replace_labels(
    standardized_value_labels$qphchnhp,
    `-2` = "na, see I/J/KQPHCHIN",
    `-1` = "na, asked"
  ),
    qphchrh = .replace_labels(
    standardized_value_labels$qphchrh,
    `-2` = "na, see I/J/KQPHCHIR",
    `-1` = "na, asked"
  ),
    qphchrhp = .replace_labels(
    standardized_value_labels$qphchrhp,
    `-2` = "na, see I/J/KQPHCHIR",
    `-1` = "na, asked"
  ),
    qphgrah = .replace_labels(
    standardized_value_labels$qphgrah,
    `-2` = "na, see I/J/KQPHGRCH",
    `-1` = "na, asked"
  ),
    qphgrahp = .replace_labels(
    standardized_value_labels$qphgrahp,
    `-2` = "na, see I/J/KQPHGRCH",
    `-1` = "na, asked"
  ),
    qphgrch = .replace_labels(
    standardized_value_labels$qphgrch,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphneig = .replace_labels(
    standardized_value_labels$qphneig,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphneih = .replace_labels(
    standardized_value_labels$qphneih,
    `-2` = "na, see I/J/KQPHNEIG",
    `-1` = "na, asked"
  ),
    qphneihp = .replace_labels(
    standardized_value_labels$qphneihp,
    `-2` = "na, see I/J/KQPHNEIG",
    `-1` = "na, asked"
  ),
    qphotfa = .replace_labels(
    standardized_value_labels$qphotfa,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphotfh = .replace_labels(
    standardized_value_labels$qphotfh,
    `-2` = "na, see I/J/KQPHOTFA",
    `-1` = "na, asked"
  ),
    qphotfhp = .replace_labels(
    standardized_value_labels$qphotfhp,
    `-2` = "na, see I/J/KQPHOTFA",
    `-1` = "na, asked"
  ),
    qphothh = .replace_labels(
    standardized_value_labels$qphothh,
    `-2` = "na, see I/J/KQPHOTHN",
    `-1` = "na, asked"
  ),
    qphothhp = .replace_labels(
    standardized_value_labels$qphothhp,
    `-2` = "na, see I/J/KQPHOTHN",
    `-1` = "na, asked"
  ),
    qphothn = .replace_labels(
    standardized_value_labels$qphothn,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphothr = .replace_labels(
    standardized_value_labels$qphothr,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphotrh = .replace_labels(
    standardized_value_labels$qphotrh,
    `-2` = "na, see I/J/KQPHOTHR",
    `-1` = "na, asked"
  ),
    qphotrhp = .replace_labels(
    standardized_value_labels$qphotrhp,
    `-2` = "na, see I/J/KQPHOTHR",
    `-1` = "na, asked"
  ),
    qphparn = .replace_labels(
    standardized_value_labels$qphparn,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphparr = .replace_labels(
    standardized_value_labels$qphparr,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphpart = .replace_labels(
    standardized_value_labels$qphpart,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphprnh = c(`-2` = "na, see I/J/KQPHPARN", `-1` = "na, asked", `168` = NA_character_),
    qphprnhp = .replace_labels(
    standardized_value_labels$qphprnhp,
    `-2` = "na, see I/J/KQPHPARN",
    `-1` = "na, asked"
  ),
    qphprrh = .replace_labels(
    standardized_value_labels$qphprrh,
    `-2` = "na, see I/J/KQPHPARR",
    `-1` = "na, asked"
  ),
    qphprrhp = .replace_labels(
    standardized_value_labels$qphprrhp,
    `-2` = "na, see I/J/KQPHPARR",
    `-1` = "na, asked"
  ),
    qphprth = c(`-2` = "na, see I/J/KQPHPART", `-1` = "na, asked", `168` = NA_character_),
    qphprthp = .replace_labels(
    standardized_value_labels$qphprthp,
    `-2` = "na, see I/J/KQPHPART",
    `-1` = "na, asked"
  ),
    qphyn = .replace_labels(
    standardized_value_labels$qphyn,
    `-1` = "na, asked"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "qcarbur",
    "qhhacqh",
    "qhhacqhp",
    "qhhacqu",
    "qhhbrsh",
    "qhhbrshp",
    "qhhbrsi",
    "qhhchin",
    "qhhchnh",
    "qhhchnhp",
    "qhhgrah",
    "qhhgrahp",
    "qhhgrch",
    "qhhneig",
    "qhhneih",
    "qhhneihp",
    "qhhotfa",
    "qhhotfh",
    "qhhotfhp",
    "qhhothh",
    "qhhothhp",
    "qhhothn",
    "qhhparn",
    "qhhpart",
    "qhhprnh",
    "qhhprnhp",
    "qhhprth",
    "qhhprthp",
    "qhhyn",
    "qphacqh",
    "qphacqhp",
    "qphacqu",
    "qphbrsh",
    "qphbrshp",
    "qphbrsi",
    "qphchin",
    "qphchir",
    "qphchnh",
    "qphchnhp",
    "qphchrh",
    "qphchrhp",
    "qphgrah",
    "qphgrahp",
    "qphgrch",
    "qphneig",
    "qphneih",
    "qphneihp",
    "qphotfa",
    "qphotfh",
    "qphotfhp",
    "qphothh",
    "qphothhp",
    "qphothn",
    "qphothr",
    "qphotrh",
    "qphotrhp",
    "qphparn",
    "qphparr",
    "qphpart",
    "qphprnh",
    "qphprnhp",
    "qphprrh",
    "qphprrhp",
    "qphprth",
    "qphprthp",
    "qphyn"
  )],
    qcarbur = c(
    `-1` = "na, asked",
    `1` = "not at all or hardly a burden",
    `2` = "somewhat a burden",
    `3` = "rather heavy burden",
    `4` = "very heavy burden",
    `5` = "overburdened"
  ),
    qhhacqh = .replace_labels(
    standardized_value_labels$qhhacqh,
    `-2` = "na, see I/J/KQHHACQU",
    `-1` = "na, asked"
  ),
    qhhacqhp = .replace_labels(
    standardized_value_labels$qhhacqhp,
    `-2` = "na, see I/J/KQHHACQU",
    `-1` = "na, asked"
  ),
    qhhacqu = .replace_labels(
    standardized_value_labels$qhhacqu,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhbrsh = .replace_labels(
    standardized_value_labels$qhhbrsh,
    `-2` = "na, see I/J/KQHHBRSI",
    `-1` = "na, asked"
  ),
    qhhbrshp = .replace_labels(
    standardized_value_labels$qhhbrshp,
    `-2` = "na, see I/J/KQHHBRSI",
    `-1` = "na, asked"
  ),
    qhhbrsi = .replace_labels(
    standardized_value_labels$qhhbrsi,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhchin = .replace_labels(
    standardized_value_labels$qhhchin,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhchnh = .replace_labels(
    standardized_value_labels$qhhchnh,
    `-2` = "na, see I/J/KQHHCHIN",
    `-1` = "na, asked"
  ),
    qhhchnhp = .replace_labels(
    standardized_value_labels$qhhchnhp,
    `-2` = "na, see I/J/KQHHCHIN",
    `-1` = "na, asked"
  ),
    qhhgrah = .replace_labels(
    standardized_value_labels$qhhgrah,
    `-2` = "na, see I/J/KQHHGRCH",
    `-1` = "na, asked"
  ),
    qhhgrahp = .replace_labels(
    standardized_value_labels$qhhgrahp,
    `-2` = "na, see I/J/KQHHGRCH",
    `-1` = "na, asked"
  ),
    qhhgrch = .replace_labels(
    standardized_value_labels$qhhgrch,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhneig = .replace_labels(
    standardized_value_labels$qhhneig,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhneih = .replace_labels(
    standardized_value_labels$qhhneih,
    `-2` = "na, see I/J/KQHHNEIG",
    `-1` = "na, asked"
  ),
    qhhneihp = .replace_labels(
    standardized_value_labels$qhhneihp,
    `-2` = "na, see I/J/KQHHNEIG",
    `-1` = "na, asked"
  ),
    qhhotfa = .replace_labels(
    standardized_value_labels$qhhotfa,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhotfh = .replace_labels(
    standardized_value_labels$qhhotfh,
    `-2` = "na, see I/J/KQHHOTFA",
    `-1` = "na, asked"
  ),
    qhhotfhp = .replace_labels(
    standardized_value_labels$qhhotfhp,
    `-2` = "na, see I/J/KQHHOTFA",
    `-1` = "na, asked"
  ),
    qhhothh = .replace_labels(
    standardized_value_labels$qhhothh,
    `-2` = "na, see I/J/KQHHOTHN",
    `-1` = "na, asked"
  ),
    qhhothhp = .replace_labels(
    standardized_value_labels$qhhothhp,
    `-2` = "na, see I/J/KQHHOTHN",
    `-1` = "na, asked"
  ),
    qhhothn = .replace_labels(
    standardized_value_labels$qhhothn,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhparn = .replace_labels(
    standardized_value_labels$qhhparn,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhpart = .replace_labels(
    standardized_value_labels$qhhpart,
    `-2` = "na, see I/J/KQHHYN",
    `-1` = "na, asked"
  ),
    qhhprnh = .replace_labels(
    standardized_value_labels$qhhprnh,
    `-2` = "na, see I/J/KQHHPARN",
    `-1` = "na, asked"
  ),
    qhhprnhp = .replace_labels(
    standardized_value_labels$qhhprnhp,
    `-2` = "na, see I/J/KQHHPARN",
    `-1` = "na, asked"
  ),
    qhhprth = .replace_labels(
    standardized_value_labels$qhhprth,
    `-2` = "na, see I/J/KQHHPART",
    `-1` = "na, asked"
  ),
    qhhprthp = .replace_labels(
    standardized_value_labels$qhhprthp,
    `-2` = "na, see I/J/KQHHPART",
    `-1` = "na, asked"
  ),
    qhhyn = .replace_labels(
    standardized_value_labels$qhhyn,
    `-1` = "na, asked"
  ),
    qphacqh = .replace_labels(
    standardized_value_labels$qphacqh,
    `-2` = "na, see I/J/KQPHACQU",
    `-1` = "na, asked"
  ),
    qphacqhp = .replace_labels(
    standardized_value_labels$qphacqhp,
    `-2` = "na, see I/J/KQPHACQU",
    `-1` = "na, asked"
  ),
    qphacqu = .replace_labels(
    standardized_value_labels$qphacqu,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphbrsh = .replace_labels(
    standardized_value_labels$qphbrsh,
    `-2` = "na, see I/J/KQPHBRSI",
    `-1` = "na, asked"
  ),
    qphbrshp = .replace_labels(
    standardized_value_labels$qphbrshp,
    `-2` = "na, see I/J/KQPHBRSI",
    `-1` = "na, asked"
  ),
    qphbrsi = .replace_labels(
    standardized_value_labels$qphbrsi,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphchin = .replace_labels(
    standardized_value_labels$qphchin,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphchir = .replace_labels(
    standardized_value_labels$qphchir,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphchnh = c(`-2` = "na, see I/J/KQPHCHIN", `-1` = "na, asked", `168` = NA_character_),
    qphchnhp = .replace_labels(
    standardized_value_labels$qphchnhp,
    `-2` = "na, see I/J/KQPHCHIN",
    `-1` = "na, asked"
  ),
    qphchrh = .replace_labels(
    standardized_value_labels$qphchrh,
    `-2` = "na, see I/J/KQPHCHIR",
    `-1` = "na, asked"
  ),
    qphchrhp = .replace_labels(
    standardized_value_labels$qphchrhp,
    `-2` = "na, see I/J/KQPHCHIR",
    `-1` = "na, asked"
  ),
    qphgrah = .replace_labels(
    standardized_value_labels$qphgrah,
    `-2` = "na, see I/J/KQPHGRCH",
    `-1` = "na, asked"
  ),
    qphgrahp = .replace_labels(
    standardized_value_labels$qphgrahp,
    `-2` = "na, see I/J/KQPHGRCH",
    `-1` = "na, asked"
  ),
    qphgrch = .replace_labels(
    standardized_value_labels$qphgrch,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphneig = .replace_labels(
    standardized_value_labels$qphneig,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphneih = .replace_labels(
    standardized_value_labels$qphneih,
    `-2` = "na, see I/J/KQPHNEIG",
    `-1` = "na, asked"
  ),
    qphneihp = .replace_labels(
    standardized_value_labels$qphneihp,
    `-2` = "na, see I/J/KQPHNEIG",
    `-1` = "na, asked"
  ),
    qphotfa = .replace_labels(
    standardized_value_labels$qphotfa,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphotfh = .replace_labels(
    standardized_value_labels$qphotfh,
    `-2` = "na, see I/J/KQPHOTFA",
    `-1` = "na, asked"
  ),
    qphotfhp = .replace_labels(
    standardized_value_labels$qphotfhp,
    `-2` = "na, see I/J/KQPHOTFA",
    `-1` = "na, asked"
  ),
    qphothh = .replace_labels(
    standardized_value_labels$qphothh,
    `-2` = "na, see I/J/KQPHOTHN",
    `-1` = "na, asked"
  ),
    qphothhp = .replace_labels(
    standardized_value_labels$qphothhp,
    `-2` = "na, see I/J/KQPHOTHN",
    `-1` = "na, asked"
  ),
    qphothn = .replace_labels(
    standardized_value_labels$qphothn,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphothr = .replace_labels(
    standardized_value_labels$qphothr,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphotrh = .replace_labels(
    standardized_value_labels$qphotrh,
    `-2` = "na, see I/J/KQPHOTHR",
    `-1` = "na, asked"
  ),
    qphotrhp = .replace_labels(
    standardized_value_labels$qphotrhp,
    `-2` = "na, see I/J/KQPHOTHR",
    `-1` = "na, asked"
  ),
    qphparn = .replace_labels(
    standardized_value_labels$qphparn,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphparr = .replace_labels(
    standardized_value_labels$qphparr,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphpart = .replace_labels(
    standardized_value_labels$qphpart,
    `-2` = "na, see I/J/KQPHYN",
    `-1` = "na, asked"
  ),
    qphprnh = c(`-2` = "na, see I/J/KQPHPARN", `-1` = "na, asked", `168` = NA_character_),
    qphprnhp = .replace_labels(
    standardized_value_labels$qphprnhp,
    `-2` = "na, see I/J/KQPHPARN",
    `-1` = "na, asked"
  ),
    qphprrh = .replace_labels(
    standardized_value_labels$qphprrh,
    `-2` = "na, see I/J/KQPHPARR",
    `-1` = "na, asked"
  ),
    qphprrhp = .replace_labels(
    standardized_value_labels$qphprrhp,
    `-2` = "na, see I/J/KQPHPARR",
    `-1` = "na, asked"
  ),
    qphprth = c(`-2` = "na, see I/J/KQPHPART", `-1` = "na, asked", `168` = NA_character_),
    qphprthp = .replace_labels(
    standardized_value_labels$qphprthp,
    `-2` = "na, see I/J/KQPHPART",
    `-1` = "na, asked"
  ),
    qphyn = .replace_labels(
    standardized_value_labels$qphyn,
    `-1` = "na, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

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

.lasa_fc_142 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "142", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "142", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "142", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "142", waves = .lasa_wave_rows())
)
