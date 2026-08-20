## LASA filecode 233 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_233 <- list(
  variables = data.frame(
    wave = c(
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H",
      "H"
    ),
    variable_name = c(
      "numberchildnonres",
      "numberchildres",
      "numbertasksIgwoth",
      "numbertasksalpha",
      "numbertaskschildnonres",
      "numbertaskschildres",
      "numbertasksfam",
      "numbertasksneighbours",
      "numbertasksnurse",
      "numbertasksoth",
      "numbertaskspartner",
      "numbertaskspersonnel",
      "numbertasksprivate",
      "numbertasksvol",
      "totalIgwoth",
      "totalalpha",
      "totalchildnonres",
      "totalchildres",
      "totalfam",
      "totalneighbours",
      "totalnurse",
      "totaloth",
      "totalpartner",
      "totalpersonnel",
      "totalprivate",
      "totalvol"
    ),
    canonical_name = c(
      "numberchildnonres",
      "numberchildres",
      "numbertasksigwoth",
      "numbertasksalpha",
      "numbertaskschildnonres",
      "numbertaskschildres",
      "numbertasksfam",
      "numbertasksneighbours",
      "numbertasksnurse",
      "numbertasksoth",
      "numbertaskspartner",
      "numbertaskspersonnel",
      "numbertasksprivate",
      "numbertasksvol",
      "totaligwoth",
      "totalalpha",
      "totalchildnonres",
      "totalchildres",
      "totalfam",
      "totalneighbours",
      "totalnurse",
      "totaloth",
      "totalpartner",
      "totalpersonnel",
      "totalprivate",
      "totalvol"
    ),
    variable_label = c(
      "number of non-resident children",
      "number of resident children",
      "number of tasks provided by resident other",
      "number of tasks provided by elderly/home/alpha",
      "number of tasks provided by non-resident child",
      "number of tasks provided by resident child",
      "number of tasks provided by non-resident other family",
      "number of tasks provided by neighbours/friends/acquaintances",
      "number of tasks provided by district nurse",
      "number of tasks provided by other",
      "number of tasks provided by partner",
      "number of tasks provided by personnel home/hospital",
      "number of tasks provided by private",
      "number of tasks provided by volunteers",
      "total number of resident other",
      "total number of elderly/home/alpha",
      "total number of non-resident child",
      "total number of resident child",
      "total number of non-resident other family",
      "total number of neighbours/friends/acquaintances",
      "total number of district nurse",
      "total number of other",
      "total number of partner",
      "total number of personnel home/hospital",
      "total number of private",
      "total number of volunteers"
    ),
    harmonized_var_label = c(
      "Number of non-resident children",
      "Number of resident children",
      "Number of tasks provided by resident other",
      "Number of tasks provided by elderly/home/alpha",
      "Number of tasks provided by non-resident child",
      "Number of tasks provided by resident child",
      "Number of tasks provided by non-resident other family",
      "Number of tasks provided by neighbours/friends/acquaintances",
      "Number of tasks provided by district nurse",
      "Number of tasks provided by other",
      "Number of tasks provided by partner",
      "Number of tasks provided by personnel home/hospital",
      "Number of tasks provided by private",
      "Number of tasks provided by volunteers",
      "Total number of resident other",
      "Total number of elderly/home/alpha",
      "Total number of non-resident child",
      "Total number of resident child",
      "Total number of non-resident other family",
      "Total number of neighbours/friends/acquaintances",
      "Total number of district nurse",
      "Total number of other",
      "Total number of partner",
      "Total number of personnel home/hospital",
      "Total number of private",
      "Total number of volunteers"
    ),
    var_type = c(
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    totalalpha = list(
      H = unknown
    ),
    totalchildnonres = list(
      H = unknown
    ),
    totalchildres = list(
      H = unknown
    ),
    totalfam = list(
      H = unknown
    ),
    totaligwoth = list(
      H = unknown
    ),
    totalneighbours = list(
      H = unknown
    ),
    totalnurse = list(
      H = unknown
    ),
    totaloth = list(
      H = unknown
    ),
    totalpartner = list(
      H = unknown
    ),
    totalpersonnel = list(
      H = unknown
    ),
    totalprivate = list(
      H = unknown
    ),
    totalvol = list(
      H = unknown
    )
  ),

  value_labels_harmonized = list(
    totalalpha = unknown,
    totalchildnonres = unknown,
    totalchildres = unknown,
    totalfam = unknown,
    totaligwoth = unknown,
    totalneighbours = unknown,
    totalnurse = unknown,
    totaloth = unknown,
    totalpartner = unknown,
    totalpersonnel = unknown,
    totalprivate = unknown,
    totalvol = unknown
  )
)
