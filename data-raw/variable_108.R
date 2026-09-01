## LASA filecode 108 -- variable names, variable labels, value labels,
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
  qacp10a = "categorical",
  qacp10b = "categorical",
  qacp10c = "categorical",
  qacp10d = "categorical",
  qacp10e = "categorical",
  qacp1a = "categorical",
  qacp1b = "categorical",
  qacp1c = "categorical",
  qacp1d = "categorical",
  qacp1e = "categorical",
  qacp2a = "categorical",
  qacp2b = "categorical",
  qacp2c = "categorical",
  qacp2d = "categorical",
  qacp2e = "categorical",
  qacp3a = "categorical",
  qacp3b = "categorical",
  qacp3c = "categorical",
  qacp3d = "categorical",
  qacp3e = "categorical",
  qacp4a = "categorical",
  qacp4b = "categorical",
  qacp4c = "categorical",
  qacp4d = "categorical",
  qacp4e = "categorical",
  qacp5a = "categorical",
  qacp5b = "categorical",
  qacp5c = "categorical",
  qacp5d = "categorical",
  qacp5e = "categorical",
  qacp6a = "categorical",
  qacp6b = "categorical",
  qacp6c = "categorical",
  qacp6d = "categorical",
  qacp6e = "categorical",
  qacp7a = "categorical",
  qacp7b = "categorical",
  qacp7c = "categorical",
  qacp7d = "categorical",
  qacp7e = "categorical",
  qacp8a = "categorical",
  qacp8b = "categorical",
  qacp8c = "categorical",
  qacp8d = "categorical",
  qacp8e = "categorical",
  qacp9a = "categorical",
  qacp9b = "categorical",
  qacp9c = "categorical",
  qacp9d = "categorical",
  qacp9e = "categorical"
)

# define variable labels ----
variable_labels(
  qacp10a = "acp 10a: sometimes think about wishes for my deathbed",
  qacp10b = "acp 10b: talk to people close to me about wishes for my deathbed",
  qacp10c = "acp 10c: talk to my general physician about wishes for my deathbed",
  qacp10d = "acp 10d: would like to talk to my general physician about wishes for my deathbed",
  qacp10e = "acp 10e: put something on paper about wishes for my deathbed",
  qacp1a = "Advance care planning item 1a",
  qacp1b = "Advance care planning item 1b",
  qacp1c = "Advance care planning item 1c",
  qacp1d = "Advance care planning item 1d",
  qacp1e = "Advanced care planning, staying at home: yes, living will (past months)",
  qacp2a = "Advance care planning item 2a",
  qacp2b = "Advance care planning item 2b",
  qacp2c = "Advance care planning item 2c",
  qacp2d = "Advance care planning item 2d",
  qacp2e = "Advanced care planning: going to hospital: yes, living will (past months)",
  qacp3a = "Advance care planning item 3a",
  qacp3b = "Advance care planning item 3b",
  qacp3c = "Advance care planning item 3c",
  qacp3d = "Advance care planning item 3d",
  qacp3e = "Advance care planning item 3e",
  qacp4a = "Advance care planning item 4a",
  qacp4b = "Advance care planning item 4b",
  qacp4c = "Advance care planning item 4c",
  qacp4d = "Advance care planning item 4d",
  qacp4e = "Advance care planning item 4e",
  qacp5a = "Advance care planning item 5a",
  qacp5b = "Advance care planning item 5b",
  qacp5c = "Advance care planning item 5c",
  qacp5d = "Advance care planning item 5d",
  qacp5e = "Advance care planning item 5e",
  qacp6a = "Advance care planning item 6a",
  qacp6b = "Advance care planning item 6b",
  qacp6c = "Advance care planning item 6c",
  qacp6d = "Advance care planning item 6d",
  qacp6e = "Advance care planning item 6e",
  qacp7a = "Advance care planning item 7a",
  qacp7b = "Advance care planning item 7b",
  qacp7c = "Advance care planning item 7c",
  qacp7d = "Advance care planning item 7d",
  qacp7e = "Advance care planning item 7e",
  qacp8a = "acp 8a: sometimes think about I would like to be resuscitated if I had a cardiac arrest",
  qacp8b = "acp 8b: talk to people close to me about I would like to be resuscitated if I had a cardiac arrest",
  qacp8c = "acp 8c: talk to my general physician about I would like to be resuscitated if I had a cardiac arrest",
  qacp8d = "acp 8d: would like to talk to my general physician about I would like to be resuscitated if I had a cardiac arrest",
  qacp8e = "acp 8e: put something on paper about I would like to be resuscitated if I had a cardiac arrest",
  qacp9a = "acp 9a: sometimes think about euthanasia as an option for me if life has become unbearable",
  qacp9b = "acp 9b: talk to people close to me about euthanasia as an option for me if life has become unbearable",
  qacp9c = "acp 9c: talk to my general physician about euthanasia as an option for me if life has become unbearable",
  qacp9d = "acp 9d: would like to talk to my general physician about euthanasia as an option for me if life has become unbearable",
  qacp9e = "acp 9e: put something on paper about future euthanasia as an option for me if life has become unbearable",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qacp10a", "qacp10b", "qacp10c", "qacp10d", "qacp10e", "qacp8a", "qacp8b", "qacp8c", "qacp8d", "qacp8e", "qacp9a", "qacp9b", "qacp9c", "qacp9d", "qacp9e",
  .applies_to_waves = c("I")
)

variable_labels(
  "qacp1e", "qacp2e",
  .applies_to_waves = c("K")
)

variable_labels(
  qacp1a = "acp 1a: sometimes think about future health",
  qacp1b = "acp 1b: talk to people close to me about future health",
  qacp1c = "acp 1c: talk to my general physician about future health",
  qacp1d = "acp 1d: would like to talk to my general physician about future health",
  qacp2a = "acp 2a: sometimes think about future health partner",
  qacp2b = "acp 2b: talk to people close to me about future health partner",
  qacp2c = "acp 2c: talk to my general physician about future health partner",
  qacp2d = "acp 2d: would like to talk to my general physician about future health partner",
  qacp3a = "acp 3a: sometimes think about future medical care and guidance",
  qacp3b = "acp 3b: talk to people close to me about future medical care and guidance",
  qacp3c = "acp 3c: talk to my general physician about future medical care and guidance",
  qacp3d = "acp 3d: would like to talk to my general physician about future medical care and guidance",
  qacp3e = "acp 3e: put something on paper about future medical care and guidance",
  qacp4a = "acp 4a: sometimes think about who to take care of me not being able to care for myself",
  qacp4b = "acp 4b: talk to people close to me about who to take care of me not being able to care for myself",
  qacp4c = "acp 4c: talk to my general physician about who to take care of me not being able to care for myself",
  qacp4d = "acp 4d: would like to talk to my general physician who to take care of me not being able to care for myself",
  qacp4e = "acp 4e: put something on paper about who to take care of me not being able to care for myself",
  qacp5a = "acp 5a: sometimes think about who to take medical decisions for me not being able doing it myself",
  qacp5b = "acp 5b: talk to people close to me about who to take medical decisions for me not being able doing it myself",
  qacp5c = "acp 5c: talk to my general physician about who to take medical decisions for me not being able doing it myself",
  qacp5d = "acp 5d: would like to talk to my general physician about who to take medical decisions for me not being able doing it myself",
  qacp5e = "acp 5e: put something on paper about who to take medical decisions for me not being able doing it myself",
  qacp6a = "acp 6a: sometimes think about whether a nursing home is an option for me when not being able to stay at home",
  qacp6b = "acp 6b: talk to people close to me about whether a nursing home is an option for me when not being able to stay at home",
  qacp6c = "acp 6c: talk to my general physician about whether a nursing home is an option for me when not being able to stay at home",
  qacp6d = "acp 6d: would like to talk to my general physician about whether a nursing home is an option for me when not being able to stay at home",
  qacp6e = "acp 6e: put something on paper about whether a nursing home is an option for me when not being able to stay at home",
  qacp7a = "acp 7a: sometimes think about situations where I no longer want to have a life-extending treatment",
  qacp7b = "acp 7b: talk to people close to me about situations where I no longer want to have a life-extending treatment",
  qacp7c = "acp 7c: talk to my general physician about situations where I no longer want to have a life-extending treatment",
  qacp7d = "acp 7d: would like to talk to my general physician about situations where I no longer want to have a life-extending treatment",
  qacp7e = "acp 7e: put something on paper about situations where I no longer want to have a life-extending treatment",
  .applies_to_waves = c("I")
)

variable_labels(
  qacp1a = "Advanced care planning, staying at home: no, not thought about (past months)",
  qacp1b = "Advanced care planning, staying at home: yes, thought about (past months)",
  qacp1c = "Advanced care planning, staying at home: yes, spoken about with doctor/healthcare provider (past months)",
  qacp1d = "Advanced care planning, staying at home: yes, spoken about with relatives (past months)",
  qacp2a = "Advanced care planning: going to hospital: no, not thought about (past months)",
  qacp2b = "Advanced care planning: going to hospital: yes, thought about (past months)",
  qacp2c = "Advanced care planning: going to hospital: yes, spoken about with doctor/healthcare provider (past months)",
  qacp2d = "Advanced care planning: going to hospital: yes, spoken about with relatives (past months)",
  qacp3a = "Advanced care planning: admitted to nursing home: no, not thought about (past months)",
  qacp3b = "Advanced care planning: admitted to nursing home: yes, thought about (past months)",
  qacp3c = "Advanced care planning: admitted to nursing home: yes, spoken about with doctor/healthcare provider (past months)",
  qacp3d = "Advanced care planning: admitted to nursing home: yes, spoken about with relatives (past months)",
  qacp3e = "Advanced care planning: admitted to nursing home: yes, living will (past months)",
  qacp4a = "Advanced care planning: desired treatments: no, not thought about (past months)",
  qacp4b = "Advanced care planning: desired treatments: yes, thought about (past months)",
  qacp4c = "Advanced care planning: desired treatments: yes, spoken about with doctor/healthcare provider (past months)",
  qacp4d = "Advanced care planning: desired treatments: yes, spoken about with relatives (past months)",
  qacp4e = "Advanced care planning: desired treatments: yes, living will (past months)",
  qacp5a = "Advanced care planning: who should make medical decisions: no, not thought about (past months)",
  qacp5b = "Advanced care planning: who should make medical decisions: yes, thought about (past months)",
  qacp5c = "Advanced care planning: who should make medical decisions: yes, spoken about with doctor/healthcare provider (past months)",
  qacp5d = "Advanced care planning: who should make medical decisions: yes, spoken about with relatives (past months)",
  qacp5e = "Advanced care planning: who should make medical decisions: yes, living will (past months)",
  qacp6a = "Advanced care planning: be resuscitated: no, not thought about (past months)",
  qacp6b = "Advanced care planning: be resuscitated: yes, thought about (past months)",
  qacp6c = "Advanced care planning: be resuscitated: yes, spoken about with doctor/healthcare provider (past months)",
  qacp6d = "Advanced care planning: be resuscitated: yes, spoken about with relatives (past months)",
  qacp6e = "Advanced care planning: be resuscitated: yes, living will (past months)",
  qacp7a = "Advanced care planning: euthanasia: no, not thought about (past months)",
  qacp7b = "Advanced care planning: euthanasia: yes, thought about (past months)",
  qacp7c = "Advanced care planning: euthanasia: yes, spoken about with doctor/healthcare provider (past months)",
  qacp7d = "Advanced care planning: euthanasia: yes, spoken about with relatives (past months)",
  qacp7e = "Advanced care planning: euthanasia: yes, living will (past months)",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qacp10a", "qacp10b", "qacp10c", "qacp10d", "qacp10e", "qacp8a", "qacp8b", "qacp8c", "qacp8d", "qacp8e", "qacp9a", "qacp9b", "qacp9c", "qacp9d", "qacp9e"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `-1` = "na, asked", `0` = "not mentioned", `1` = "label varies by wave", `2` = "no",
  .applies_to_vars = c("qacp1a", "qacp1b", "qacp1c", "qacp1d", "qacp3a", "qacp3b", "qacp3c", "qacp3d", "qacp3e", "qacp4a", "qacp4b", "qacp4c", "qacp4d", "qacp4e", "qacp5a", "qacp5b", "qacp5c", "qacp5d", "qacp5e", "qacp6a", "qacp6b", "qacp6c", "qacp6d", "qacp6e", "qacp7a", "qacp7b", "qacp7c", "qacp7d", "qacp7e"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("qacp1e", "qacp2e"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "not applicable", `-1` = "na, asked", `0` = "not mentioned", `1` = "label varies by wave", `2` = "no",
  .applies_to_vars = c("qacp2a", "qacp2b", "qacp2c", "qacp2d"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qacp1a", "qacp1b", "qacp1c", "qacp1d", "qacp2a", "qacp2b", "qacp2c", "qacp2d", "qacp3a", "qacp3b", "qacp3c", "qacp3d", "qacp3e", "qacp4a", "qacp4b", "qacp4c", "qacp4d", "qacp4e", "qacp5a", "qacp5b", "qacp5c", "qacp5d", "qacp5e", "qacp6a", "qacp6b", "qacp6c", "qacp6d", "qacp6e", "qacp7a", "qacp7b", "qacp7c", "qacp7d", "qacp7e"),
  .applies_to_waves = c("I", "K")
)

value_labels(
  `1` = "yes", `2` = "no",
  .applies_to_vars = c("qacp1a", "qacp1b", "qacp1c", "qacp1d", "qacp3a", "qacp3b", "qacp3c", "qacp3d", "qacp3e", "qacp4a", "qacp4b", "qacp4c", "qacp4d", "qacp4e", "qacp5a", "qacp5b", "qacp5c", "qacp5d", "qacp5e", "qacp6a", "qacp6b", "qacp6c", "qacp6d", "qacp6e", "qacp7a", "qacp7b", "qacp7c", "qacp7d", "qacp7e"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "not applicable", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qacp2a", "qacp2b", "qacp2c", "qacp2d"),
  .applies_to_waves = c("I")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("qacp1a", "qacp1b", "qacp1c", "qacp1d", "qacp2a", "qacp2b", "qacp2c", "qacp2d", "qacp3a", "qacp3b", "qacp3c", "qacp3d", "qacp3e", "qacp4a", "qacp4b", "qacp4c", "qacp4d", "qacp4e", "qacp5a", "qacp5b", "qacp5c", "qacp5d", "qacp5e", "qacp6a", "qacp6b", "qacp6c", "qacp6d", "qacp6e", "qacp7a", "qacp7b", "qacp7c", "qacp7d", "qacp7e"),
  .applies_to_waves = c("K")
)

.lasa_fc_108 <- .lasa_finalize_fc("108")

