## LASA filecode 159 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_159 <- list(
  variables = data.frame(
    wave = c("B", "B", "B", "B", "B", "B", "B", "B"),
    variable_name = c(
      "bmdecu01",
      "bmdecu02",
      "bmdecu03",
      "bmdecu04",
      "bmdecu05",
      "bmdecu06",
      "bmdecu07",
      "bmdecu08"
    ),
    canonical_name = c("mdecu01", "mdecu02", "mdecu03", "mdecu04", "mdecu05", "mdecu06", "mdecu07", "mdecu08"),
    variable_label = c(
      "Decubitus: reported No/Yes",
      "reported decubitus medical interview",
      "Decubitus: most severe reported",
      "Decubitus: stadium observed",
      "Decubitus: treatment at home by",
      "Decubitus: treatment at nursing home by",
      "Decubitus: present past year",
      "Decubitus: past year how often"
    ),
    harmonized_var_label = c(
      "Decubitus: reported No/Yes",
      "reported decubitus medical interview",
      "Decubitus: most severe reported",
      "Decubitus: stadium observed",
      "Decubitus: treatment at home by",
      "Decubitus: treatment at nursing home by",
      "Decubitus: present past year",
      "Decubitus: past year how often"
    ),
    var_type = c(
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "numeric"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    mdecu01 = list(
      B = no_yes_178
    ),
    mdecu02 = list(
      B = not_reported_heel_ankle_hip_coccyx_other_place
    ),
    mdecu03 = list(
      B = not_reported_heel_ankle_hip_coccyx_other_place
    ),
    mdecu04 = list(
      B = not_reported_no_decubitus_phase_1
    ),
    mdecu05 = list(
      B = not_reported_oneself
    ),
    mdecu06 = list(
      B = not_reported_nurse_other_elderly_care
    ),
    mdecu07 = list(
      B = no_yes_178
    ),
    mdecu08 = list(
      B = vs_1_time
    )
  ),

  value_labels_harmonized = list(
    mdecu01 = no_yes_178,
    mdecu02 = not_reported_heel_ankle_hip_coccyx_other_place,
    mdecu03 = not_reported_heel_ankle_hip_coccyx_other_place,
    mdecu04 = not_reported_no_decubitus_phase_1,
    mdecu05 = not_reported_oneself,
    mdecu06 = not_reported_nurse_other_elderly_care,
    mdecu07 = no_yes_178,
    mdecu08 = vs_1_time
  )
)
