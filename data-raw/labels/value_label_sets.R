## Reusable value-label vectors shared across many LASA variables/filecodes.
## Each vector maps a numeric code (name) to its label text (value); see
## data-raw/build_lasa_label_db.R for how these are assembled into the
## package's label database. Referenced by name from the per-filecode
## data-raw/labels/variables_<filecode>.R scripts -- rename freely, just
## keep the reference in sync (a build-time check will catch a stale one).
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on.

a_moderate_to_strong_wish_to_live_a_weak_wish_to_live <- c(
  `-1` = "na, asked",
  `1` = "a moderate to strong wish to live",
  `2` = "a weak wish to live",
  `3` = "no wish to live"
)

about_every_meal_every_day_but_not_every_meal <- c(
  `-5` = "na, interview terminated",
  `-1` = "no valid data",
  `1` = "about every meal",
  `2` = "every day but not every meal",
  `3` = "every week but not every day",
  `4` = "< once a week"
)

acceptable_not_acceptable_opposed_no_opinion <- c(
  `-1` = "no answer",
  `1` = "acceptable",
  `2` = "not acceptable",
  `3` = "opposed",
  `4` = "no opinion"
)

agree_disagree_no_opinion_do_not_know <- c(
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-3` = "no answer, wrong skip",
  `-2` = "no answer, routing",
  `-1` = "no answer, asked",
  `1` = "agree",
  `2` = "disagree",
  `3` = "no opinion / do not know"
)

agree_disagree_no_opinion_don_t_know <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/IRMSO",
  `-1` = "na, asked",
  `1` = "agree",
  `2` = "disagree",
  `3` = "no opinion/don't know"
)

agree_disagree_no_opinion_don_t_know_2 <- c(
  `-5` = "interview terminated",
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "agree",
  `2` = "disagree",
  `3` = "no opinion/don't know"
)

agree_disagree_no_opinion_don_t_know_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FRMSO",
  `-1` = "na, asked",
  `1` = "agree",
  `2` = "disagree",
  `3` = "no opinion/don't know"
)

agree_disagree_no_opinion_don_t_know_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DRMSO",
  `-1` = "na, asked",
  `1` = "agree",
  `2` = "disagree",
  `3` = "no opinion/don't know"
)

agree_disagree_no_opinion_don_t_know_5 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see JRMSO",
  `-1` = "na, asked",
  `1` = "agree",
  `2` = "disagree",
  `3` = "no opinion/don't know"
)

all_of_the_time_most_of_the_time_a_good_bit_of_the_time <- c(
  `-1` = "asked, no answer",
  `1` = "all of the time",
  `2` = "most of the time",
  `3` = "a good bit of the time",
  `4` = "some of the time",
  `5` = "a little of the time",
  `6` = "none of the time"
)

all_of_the_time_most_of_the_time_a_good_bit_of_the_time_2 <- c(
  `-1` = "not available",
  `1` = "all of the time",
  `2` = "most of the time",
  `3` = "a good bit of the time",
  `4` = "some of the time",
  `5` = "a little of the time",
  `6` = "none of the time"
)

almost_daily_at_least_once_a_week_few_times_a_month <- c(
  `-1` = "na, asked",
  `1` = "almost daily",
  `2` = "at least once a week",
  `3` = "few times a month",
  `4` = "few times a year",
  `5` = "less than once a year",
  `6` = "never"
)

almost_never_a_few_times_a_year_once_a_month <- c(
  `-2` = "no answer, routing",
  `-1` = "no answer",
  `1` = "almost never",
  `2` = "a few times a year",
  `3` = "once a month",
  `4` = "a few times a month",
  `5` = "once a week",
  `6` = "a few times a week",
  `7` = "every day"
)

almost_never_some_of_the_time_often_most_of_the_time <- c(
  `-1` = "no answer",
  `1` = "almost never",
  `2` = "some of the time",
  `3` = "often",
  `4` = "most of the time"
)

almost_never_some_of_the_time_often_most_of_the_time_2 <- c(
  `-1` = "not available",
  `1` = "almost never",
  `2` = "some of the time",
  `3` = "often",
  `4` = "most of the time"
)

applicable_not_applicable <- c(`-1` = "no answer", `1` = "applicable", `2` = "?", `3` = "not applicable")

applicable_not_applicable_2 <- c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable")

as_old_as_possible_irrespective_health_problems <- c(
  `-2` = "na, see G/H/I/J/KLIFELI",
  `-1` = "na, asked",
  `1` = "as old as possible, irrespective health problems",
  `2` = "shorter life, if without major health problems"
)

at_least_once_a_day_a_few_times_a_week_once_a_week <- c(
  `-2` = "no partner",
  `-1` = "no answer",
  `1` = "at least once a day",
  `2` = "a few times a week",
  `3` = "once a week",
  `4` = "once a month",
  `5` = "less than once a month"
)

at_or_below_income_threshold_above_income_threshold <- c(
  `-4` = "not available, partner in household",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "at or below income threshold",
  `2` = "above income threshold"
)

at_or_below_income_threshold_above_income_threshold_2 <- c(
  `-4` = "not available, no partner in household",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "at or below income threshold",
  `2` = "above income threshold"
)

attached_row_or_semi_detached_detached <- c(
  `-4` = "na, previous interview telephonic",
  `-3` = "na, wrong skip",
  `-1` = "unknown",
  `1` = "attached row or semi-detached",
  `2` = "detached",
  `3` = "high rise (elevator)",
  `4` = "high rise (no elevator)",
  `5` = "ground floor apartment",
  `6` = "apt build elderly (elevator)",
  `7` = "home elderly (street level)",
  `8` = "semi-independent",
  `9` = "farm / corporate housing",
  `10` = "houseboat",
  `11` = "housing with communal facilities",
  `12` = "other",
  `13` = "institution",
  `14` = "monastery"
)

attached_row_or_semi_detached_detached_2 <- c(
  `-5` = "na, see I/J/KHINDEP",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/J/KMOVED",
  `-1` = "na, asked",
  `1` = "attached row or semi-detached",
  `2` = "detached",
  `3` = "high rise (elevator)",
  `4` = "high rise (no elevator)",
  `5` = "ground floor apartment",
  `6` = "apt build elderly (elevator)",
  `7` = "home elderly (street level)",
  `8` = "semi-independent",
  `9` = "farm / corporate housing",
  `10` = "houseboat",
  `11` = "housing with communal facilities",
  `12` = "other (documented"
)

attached_row_semi_detached_detached_high_rise_elevator <- c(
  `-5` = "na, see C/D/E/F/GHINDEP",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GMOVED",
  `-1` = "na, asked",
  `1` = "attached row",
  `2` = "semi-detached",
  `3` = "detached",
  `4` = "high rise (elevator)",
  `5` = "high rise (no elevator)",
  `6` = "low-level apt building",
  `7` = "ground floor apartment",
  `8` = "apt build elderly (elevator)",
  `9` = "home elderly (street level)",
  `10` = "service flat (home elderly)",
  `11` = "semi-independent",
  `12` = "farm",
  `13` = "houseboat",
  `14` = "commune",
  `15` = "other (documented)"
)

attached_row_semi_detached_detached_high_rise_elevator_2 <- c(
  `-1` = "unknown",
  `1` = "attached row",
  `2` = "semi-detached",
  `3` = "detached",
  `4` = "high rise (elevator)",
  `5` = "high rise (no elevator)",
  `6` = "low-level apt building",
  `7` = "ground floor apartment",
  `8` = "apt build elderly (elevator)",
  `9` = "home elderly (street level)",
  `10` = "service flat (home elderly)",
  `11` = "semi-independent",
  `12` = "farm",
  `13` = "houseboat",
  `14` = "commune",
  `15` = "other",
  `16` = "institution",
  `17` = "monastery"
)

attached_row_semi_detached_detached_high_rise_elevator_3 <- c(
  `-3` = "na, wrong skip",
  `-1` = "unknown",
  `1` = "attached row",
  `2` = "semi-detached",
  `3` = "detached",
  `4` = "high rise (elevator)",
  `5` = "high rise (no elevator)",
  `6` = "low-level apt building",
  `7` = "ground floor apartment",
  `8` = "apt build elderly (elevator)",
  `9` = "home elderly (street level)",
  `10` = "service flat (home elderly)",
  `11` = "semi-independent",
  `12` = "farm",
  `13` = "houseboat",
  `14` = "commune",
  `15` = "other",
  `16` = "institution",
  `17` = "monastery"
)

attempted_score_60 <- c(`-2` = "test not done", `-1` = "no valid measurement", `30` = "attempted score < 60")

blank <- c(`0` = NA_character_, `4` = NA_character_, `6` = NA_character_, `10` = NA_character_)

certainly_true_true_do_not_know_not_true <- c(
  `-1` = "no valid data",
  `1` = "certainly true",
  `2` = "true",
  `3` = "do not know",
  `4` = "not true",
  `5` = "certainly not true"
)

certainly_true_true_do_not_know_not_true_2 <- c(
  `-1` = "not available",
  `1` = "certainly true",
  `2` = "true",
  `3` = "do not know",
  `4` = "not true",
  `5` = "certainly not true"
)

checked_in_documentation_known_without_check_estimation <- c(
  `-1` = "no answer",
  `1` = "checked in documentation",
  `2` = "known without check",
  `3` = "estimation"
)

children_in_this_category_number_unknown <- c(
  `-2` = "children in this category, number unknown",
  `-1` = "no answer/refusal/interview terminated",
  `0` = NA_character_,
  `1` = NA_character_
)

coding_category_1_coding_category_2_coding_category_3 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "coding category 1",
  `2` = "coding category 2",
  `3` = "coding category 3",
  `4` = "coding category 4",
  `5` = "coding category 5",
  `6` = "coding category 6",
  `7` = "coding category 7",
  `8` = "coding category 8",
  `9` = "coding category 9",
  `10` = "coding category 10",
  `11` = "left hand/wrist",
  `12` = "both hands/wrists",
  `13` = "toes right foot",
  `14` = "toes left foot",
  `15` = "toes both feet",
  `16` = "right foot/ankle",
  `17` = "left foot/ankle",
  `18` = "both feet/ankles",
  `19` = "neck",
  `20` = "back",
  `21` = "right shoulder",
  `22` = "left shoulder",
  `23` = "other"
)

coding_category_1_coding_category_2_occasionally <- c(
  `-1` = "not available",
  `1` = "coding category 1",
  `2` = "coding category 2",
  `3` = "occasionally",
  `4` = "rather often",
  `5` = "very often"
)

complete_test_done_visus_problems_refused_cognitive <- c(
  `-4` = "no valid data",
  `0` = "complete test done",
  `1` = "visus problems",
  `2` = "refused",
  `3` = "cognitive",
  `4` = "physical",
  `5` = "technical",
  `6` = "unknown"
)

completed_without_help_completed_with_help_terminated <- c(
  `-7` = "na, technical missing",
  `-6` = "na, test not done",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMPF",
  `-1` = "na, asked",
  `1` = "completed without help",
  `2` = "completed with help",
  `3` = "terminated",
  `4` = "not done"
)

completed_without_help_completed_with_help_terminated_2 <- c(
  `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
  `-1` = "na, asked",
  `1` = "completed without help",
  `2` = "completed with help",
  `3` = "terminated",
  `4` = "not done"
)

completed_without_help_completed_with_help_terminated_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/BCARDIG1",
  `-1` = "na, asked",
  `1` = "completed without help",
  `2` = "completed with help",
  `3` = "terminated",
  `4` = "not done"
)

completed_without_help_completed_with_help_terminated_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/BCARDIG2",
  `-1` = "na, asked",
  `1` = "completed without help",
  `2` = "completed with help",
  `3` = "terminated",
  `4` = "not done"
)

completed_without_help_completed_with_help_terminated_5 <- c(
  `-2` = "na, see C/D/E/B/F/G/H/BCARDIG5",
  `-1` = "na, asked",
  `1` = "completed without help",
  `2` = "completed with help",
  `3` = "terminated",
  `4` = "not done"
)

completed_without_help_completed_with_help_terminated_6 <- c(
  `-2` = "na, see C/D/E/B/F/G/H/BCARDIG6",
  `-1` = "na, asked",
  `1` = "completed without help",
  `2` = "completed with help",
  `3` = "terminated",
  `4` = "not done"
)

completed_without_help_completed_with_help_terminated_7 <- c(
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "completed without help",
  `2` = "completed with help",
  `3` = "terminated",
  `4` = "not done"
)

completed_without_help_completed_with_help_terminated_8 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "completed without help",
  `2` = "completed with help",
  `3` = "terminated",
  `4` = "not done"
)

completed_without_help_completed_with_help_terminated_9 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BCARDIG1",
  `-1` = "na, asked",
  `1` = "completed without help",
  `2` = "completed with help",
  `3` = "terminated",
  `4` = "not done"
)

completely_disagree_disagree_do_not_agree_disagree <- c(
  `-1` = "na, asked",
  `1` = "completely disagree",
  `2` = "disagree",
  `3` = "do not agree/disagree",
  `4` = "agree",
  `5` = "completely agree"
)

continuously_day_and_night <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BDHELP01",
  `-1` = "no (valid) answer",
  `168` = "continuously day and night"
)

continuously_day_and_night_2 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BPHELP01",
  `-1` = "no (valid) answer",
  `168` = "continuously day and night"
)

continuously_day_and_night_3 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BRHELP01",
  `-1` = "no (valid) answer",
  `168` = "continuously day and night"
)

correct <- c(`-2` = "na, see E/F/GMRMCRAV in LASAF/G222", `-1` = "na, asked", `4` = "correct")

correct_10 <- c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `1` = "correct")

correct_11 <- c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `2` = "correct")

correct_12 <- c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `6` = "correct")

correct_13 <- c(`-2` = "na, see BRMCRAV in LAS2B222", `-1` = "na, asked", `4` = "correct")

correct_14 <- c(`-2` = "na, see BRMCRAV in LAS2B222", `-1` = "na, asked", `3` = "correct")

correct_15 <- c(`-2` = "na, see BRMCRAV in LAS2B222", `-1` = "na, asked", `5` = "correct")

correct_16 <- c(`-2` = "na, see BRMCRAV in LAS2B222", `-1` = "na, asked", `2` = "correct")

correct_17 <- c(`-2` = "na, see BRMCRAV in LAS2B222", `-1` = "na, asked", `6` = "correct")

correct_18 <- c(
  `-6` = "no valid data",
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-2` = "na, see BRMCRAV in LASAB222",
  `-1` = "na, asked",
  `4` = "correct"
)

correct_19 <- c(
  `-6` = "no valid data",
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-2` = "na, see BRMCRAV in LASAB222",
  `-1` = "na, asked",
  `3` = "correct"
)

correct_2 <- c(`-2` = "na, see E/F/GMRMCRAV in LASAF/G222", `-1` = "na, asked", `3` = "correct")

correct_20 <- c(
  `-6` = "no valid data",
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-2` = "na, see BRMCRAV in LASAB222",
  `-1` = "na, asked",
  `5` = "correct"
)

correct_21 <- c(
  `-6` = "no valid data",
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-2` = "na, see BRMCRAV in LASAB222",
  `-1` = "na, asked",
  `1` = "correct"
)

correct_22 <- c(
  `-6` = "no valid data",
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-2` = "na, see BRMCRAV in LASAB222",
  `-1` = "na, asked",
  `2` = "correct"
)

correct_23 <- c(
  `-6` = "no valid data",
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-2` = "na, see BRMCRAV in LASAB222",
  `-1` = "na, asked",
  `6` = "correct"
)

correct_24 <- c(`-2` = "not available, routing", `-1` = "not available, asked", `4` = "correct")

correct_25 <- c(`-2` = "not available, routing", `-1` = "not available, asked", `3` = "correct")

correct_26 <- c(`-2` = "not available, routing", `-1` = "not available, asked", `5` = "correct")

correct_27 <- c(`-2` = "not available, routing", `-1` = "not available, asked", `1` = "correct")

correct_28 <- c(`-2` = "not available, routing", `-1` = "not available, asked", `2` = "correct")

correct_29 <- c(`-2` = "not available, routing", `-1` = "not available, asked", `6` = "correct")

correct_3 <- c(`-2` = "na, see E/F/GMRMCRAV in LASAF/G222", `-1` = "na, asked", `5` = "correct")

correct_30 <- c(
  `-6` = "not available, no valid data",
  `-5` = "not available, interview terminated",
  `-4` = "not available, short interview",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `4` = "correct"
)

correct_31 <- c(
  `-6` = "not available, no valid data",
  `-5` = "not available, interview terminated",
  `-4` = "not available, short interview",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `3` = "correct"
)

correct_32 <- c(
  `-6` = "not available, no valid data",
  `-5` = "not available, interview terminated",
  `-4` = "not available, short interview",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `5` = "correct"
)

correct_33 <- c(
  `-6` = "not available, no valid data",
  `-5` = "not available, interview terminated",
  `-4` = "not available, short interview",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "correct"
)

correct_34 <- c(
  `-6` = "not available, no valid data",
  `-5` = "not available, interview terminated",
  `-4` = "not available, short interview",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `2` = "correct"
)

correct_35 <- c(
  `-6` = "not available, no valid data",
  `-5` = "not available, interview terminated",
  `-4` = "not available, short interview",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `6` = "correct"
)

correct_36 <- c(`-2` = "na, see BRMCRAV in LAS2B222", `-1` = "na, asked", `1` = "correct")

correct_4 <- c(`-2` = "na, see E/F/GMRMCRAV in LASAF/G222", `-1` = "na, asked", `1` = "correct")

correct_5 <- c(`-2` = "na, see E/F/GMRMCRAV in LASAF/G222", `-1` = "na, asked", `2` = "correct")

correct_6 <- c(`-2` = "na, see E/F/GMRMCRAV in LASAF/G222", `-1` = "na, asked", `6` = "correct")

correct_7 <- c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `4` = "correct")

correct_8 <- c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `3` = "correct")

correct_9 <- c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222", `-1` = "na, asked", `5` = "correct")

cut_off <- c(`-2` = "no valid data", `0` = NA_character_, `16` = "cut off", `60` = NA_character_)

daily_5_6_days_a_week_3_4_days_a_week_1_2_days_a_week <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CMALCYN",
  `-1` = "na, asked",
  `1` = "daily",
  `2` = "5-6 days a week",
  `3` = "3-4 days a week",
  `4` = "1-2 days a week",
  `5` = "1-3 days a month",
  `6` = "<1 day a month"
)

daily_a_few_times_a_week_a_few_times_a_month <- c(
  `-3` = "often na, wrong skip",
  `-2` = "na, see H/B/ISOCP93",
  `-1` = "na, asked",
  `1` = "daily",
  `2` = "a few times a week",
  `3` = "a few times a month",
  `4` = "a few times a year",
  `5` = "less than a few times a year"
)

daily_a_few_times_a_week_a_few_times_a_month_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISP95F6",
  `-1` = "na, asked",
  `1` = "daily",
  `2` = "a few times a week",
  `3` = "a few times a month",
  `4` = "a few times a year",
  `5` = "less than a few times a year"
)

daily_a_few_times_a_week_a_few_times_a_month_3 <- c(
  `-3` = "often na, wrong skip",
  `-2` = "na, see H/B/ISOCP97",
  `-1` = "na, asked",
  `1` = "daily",
  `2` = "a few times a week",
  `3` = "a few times a month",
  `4` = "a few times a year",
  `5` = "less than a few times a year"
)

daily_a_few_times_a_week_a_few_times_a_month_4 <- c(
  `-3` = "often not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "daily",
  `2` = "a few times a week",
  `3` = "a few times a month",
  `4` = "a few times a year",
  `5` = "less than a few times a year"
)

day_treatment_night_treatment_both <- c(
  `-2` = "na, routing",
  `-1` = "na, asked",
  `1` = "day treatment",
  `2` = "night treatment",
  `3` = "both"
)

day_week_month <- c(`-2` = "na, see jmDsup/jmMVsup", `-1` = "na, asked", `1` = "day", `2` = "week", `3` = "month")

day_week_month_2 <- c(`-2` = "na, see IM#SUP", `-1` = "na, asked", `1` = "day", `2` = "week", `3` = "month")

day_week_month_for_thrombosis_as_required <- c(
  `-2` = "na, see G/H/B/B/I/J/KM#MED",
  `-1` = "na, asked",
  `1` = "day",
  `2` = "week",
  `3` = "month",
  `4` = "for thrombosis",
  `5` = "as required",
  `6` = "other kind of period"
)

day_week_month_for_thrombosis_as_required_2 <- c(
  `-2` = "na, see D/E/B/FM#MED",
  `-1` = "na, asked",
  `1` = "day",
  `2` = "week",
  `3` = "month",
  `4` = "for thrombosis",
  `5` = "as required",
  `6` = "other kind of period"
)

decrease_stays_the_same_increase <- c(
  `-4` = "na, short version",
  `-1` = "na, asked",
  `1` = "decrease",
  `2` = "stays the same",
  `3` = "increase"
)

dependent_of_person <- c(
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-3` = "no answer, wrong skip",
  `-2` = "no answer, routing",
  `-1` = "no answer, asked",
  `0` = "dependent of person"
)

dependent_on_person <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP66",
  `-1` = "na, asked",
  `0` = "dependent on person"
)

dependent_on_person_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP68",
  `-1` = "na, asked",
  `0` = "dependent on person"
)

dependent_on_person_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP66",
  `-1` = "na, asked",
  `0` = "dependent on person"
)

dependent_on_person_4 <- c(
  `-5` = "interview terminated",
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "dependent on person"
)

dependent_on_person_na_wrong_skip <- c(
  `-2` = "na, see C/DSOCP66",
  `-1` = "na, asked",
  `0` = "dependent on person",
  `3` = "na, wrong skip"
)

device_not_working_or_parts_missing_physical_reasons <- c(
  `-2` = "LF test done",
  `1` = "device not working or parts missing",
  `2` = "physical reasons",
  `3` = "R does not want to perform spirometry",
  `4` = "limited time",
  `5` = "no medication",
  `6` = "environment not suitable",
  `7` = "unknown"
)

did_not_bear_children_see_bmmeno04_na_asked <- c(`-3` = "did not bear children", `-2` = "see BMMENO04", `-1` = "na, asked")

did_not_eat_less_did_eat_somewhat_less <- c(
  `-1` = "na, asked",
  `1` = "did not eat less",
  `2` = "did eat somewhat less",
  `3` = "did eat much less"
)

did_not_eat_less_did_eat_somewhat_less_2 <- c(
  `-3` = "na, section not done",
  `-1` = "na, asked",
  `1` = "did not eat less",
  `2` = "did eat somewhat less",
  `3` = "did eat much less"
)

dissatisfied_a_little_dissatisfied <- c(
  `-5` = "na, refused",
  `-4` = "na, short version",
  `-1` = "na, asked",
  `1` = "dissatisfied",
  `2` = "a little dissatisfied",
  `3` = "not dissatisfied/satisfied",
  `4` = "a little satisfied",
  `5` = "satisfied"
)

dissatisfied_a_little_dissatisfied_2 <- c(
  `-4` = "na, short version",
  `-1` = "na, asked",
  `1` = "dissatisfied",
  `2` = "a little dissatisfied",
  `3` = "not dissatisfied/satisfied",
  `4` = "a little satisfied",
  `5` = "satisfied"
)

dissatisfied_a_little_dissatisfied_3 <- c(
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-1` = "na, asked",
  `1` = "dissatisfied",
  `2` = "a little dissatisfied",
  `3` = "not dissatisfied/satisfied",
  `4` = "a little satisfied",
  `5` = "satisfied"
)

dissatisfied_a_little_dissatisfied_4 <- c(
  `-6` = "na, refused",
  `-4` = "na, short version",
  `-1` = "na, do not know",
  `1` = "dissatisfied",
  `2` = "a little dissatisfied",
  `3` = "not dissatisfied/satisfied",
  `4` = "a little satisfied",
  `5` = "satisfied"
)

dissatisfied_a_little_dissatisfied_5 <- c(
  `-6` = "not available, refused",
  `-5` = "not available, refused",
  `-4` = "not available, short version",
  `-3` = "not available, wrong skip",
  `-1` = "not available",
  `1` = "dissatisfied",
  `2` = "a little dissatisfied",
  `3` = "not dissatisfied/satisfied",
  `4` = "a little satisfied",
  `5` = "satisfied"
)

dissatisfied_not_satisfied_dissatisfied_satisfied <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, routing",
  `-1` = "na, asked",
  `1` = "dissatisfied",
  `2` = "not satisfied/dissatisfied",
  `3` = "satisfied"
)

distance_walking_distance_cycling_gymnastics <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
  `-1` = "na, asked",
  `1` = "distance walking",
  `2` = "distance cycling",
  `3` = "gymnastics",
  `4` = "home trainer",
  `5` = "swimming",
  `6` = "(folk)dancing",
  `7` = "bowling",
  `8` = "tennis",
  `9` = "jogging/running/speed walking",
  `10` = "rowing",
  `11` = "sailing",
  `12` = "billiards",
  `13` = "fishing",
  `14` = "soccer/basketball/korfball",
  `15` = "volleybal/baseball",
  `16` = "winter sports",
  `17` = "other sports"
)

distance_walking_distance_cycling_gymnastics_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/GLPHYA25",
  `-1` = "na, asked",
  `1` = "distance walking",
  `2` = "distance cycling",
  `3` = "gymnastics",
  `4` = "home trainer",
  `5` = "swimming",
  `6` = "(folk)dancing",
  `7` = "bowling",
  `8` = "tennis",
  `9` = "jogging/running/speed walking",
  `10` = "rowing",
  `11` = "sailing",
  `12` = "billiards",
  `13` = "fishing",
  `14` = "soccer/basketball/korfball",
  `15` = "volleybal/baseball",
  `16` = "winter sports",
  `17` = "other sports"
)

distance_walking_distance_cycling_gymnastics_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
  `-1` = "na, asked",
  `1` = "distance walking",
  `2` = "distance cycling",
  `3` = "gymnastics",
  `4` = "home trainer",
  `5` = "swimming",
  `6` = "(folk)dancing",
  `7` = "bowling",
  `8` = "tennis",
  `9` = "jogging/running/speed walking",
  `10` = "rowing",
  `11` = "sailing",
  `12` = "billiards",
  `13` = "fishing",
  `14` = "soccer/basketball/korfball",
  `15` = "volleybal/baseball",
  `16` = "winter sports",
  `17` = "golf",
  `18` = "other sports"
)

distance_walking_distance_cycling_gymnastics_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/GLPHYA25",
  `-1` = "na, asked",
  `1` = "distance walking",
  `2` = "distance cycling",
  `3` = "gymnastics",
  `4` = "home trainer",
  `5` = "swimming",
  `6` = "(folk)dancing",
  `7` = "bowling",
  `8` = "tennis",
  `9` = "jogging/running/speed walking",
  `10` = "rowing",
  `11` = "sailing",
  `12` = "billiards",
  `13` = "fishing",
  `14` = "soccer/basketball/korfball",
  `15` = "volleybal/baseball",
  `16` = "winter sports",
  `17` = "golf",
  `18` = "other sports"
)

distance_walking_distance_cycling_gymnastics_5 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "distance walking",
  `2` = "distance cycling",
  `3` = "gymnastics",
  `4` = "home trainer",
  `5` = "swimming",
  `6` = "(folk)dancing",
  `7` = "bowling",
  `8` = "tennis",
  `9` = "jogging/running/speed walking",
  `10` = "rowing",
  `11` = "coding category 11",
  `12` = "coding category 12",
  `13` = "coding category 13",
  `14` = "soccer/basketball/korfball",
  `15` = "volleybal/baseball",
  `16` = "winter sports",
  `17` = "coding category 17",
  `18` = "other sports",
  `21` = "cycling: long distance cycling",
  `22` = "cycling: cycle racing / spinning / mountain biking",
  `23` = "cycling: treadmill at home / cycle ergometer at home",
  `31` = "gymnastics and fitness: gymnastics / exercising at home",
  `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
  `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
  `34` = "gymnastics and fitness: endurance training",
  `41` = "swimming: swimming",
  `42` = "swimming: aqua gym / aqua jogging",
  `51` = "racket sports: tennis",
  `52` = "racket sports: table tennis",
  `53` = "racket sports: squash",
  `54` = "racket sports: badminton",
  `61` = "running: running / jogging",
  `71` = "water sports: rowing",
  `72` = "water sports: sailing",
  `73` = "water sports: canoeing",
  `81` = "ball sports: soccer",
  `82` = "ball sports: futsal",
  `83` = "ball sports: hockey",
  `84` = "ball sports: volleyball",
  `85` = "ball sports: basketball",
  `86` = "ball sports: baseball / softball",
  `87` = "ball sports: golf / ball throwing game",
  `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
  `91` = "winter sports: skiing",
  `92` = "winter sports: cross country skiing",
  `93` = "winter sports: ice skating",
  `101` = "animal sports: horse riding",
  `102` = "animal sports: fishing / pigeon racing",
  `103` = "animal sports: dog training / horse carriage driving",
  `111` = "other sports: climbing",
  `112` = "other sports: billiards / darts",
  `113` = "other sports: (folk) dancing",
  `114` = "other sports: other"
)

does_not_apply_to_me_at_all_does_not_apply_to_me <- c(
  `-3` = "working for own well-being na, wrong skip",
  `-2` = "na, see GRMSO",
  `-1` = "na, asked",
  `1` = "does not apply to me at all",
  `2` = "does not apply to me",
  `3` = "applies to me a little",
  `4` = "applies to me",
  `5` = "apllies to me entirely"
)

does_not_apply_to_me_at_all_does_not_apply_to_me_2 <- c(
  `-3` = "working for own well-being not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "does not apply to me at all",
  `2` = "does not apply to me",
  `3` = "applies to me a little",
  `4` = "applies to me",
  `5` = "apllies to me entirely"
)

does_not_visit <- c(
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-3` = "no answer, wrong skip",
  `-2` = "no answer, routing",
  `-1` = "no answer, asked",
  `0` = "does not visit"
)

does_not_visit_2 <- c(
  `-5` = "interview terminated",
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "does not visit"
)

does_not_visit_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP14-26",
  `-1` = "na, asked",
  `0` = "does not visit"
)

does_not_visit_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP14 to 26",
  `-1` = "na, asked",
  `0` = "does not visit"
)

does_not_visit_no_yes <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP27",
  `-1` = "na, asked",
  `0` = "does not visit",
  `1` = "no",
  `2` = "yes"
)

does_not_visit_no_yes_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP27",
  `-1` = "na, asked",
  `0` = "does not visit",
  `1` = "no",
  `2` = "yes"
)

does_not_visit_no_yes_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP27",
  `-1` = "na, asked",
  `0` = "does not visit",
  `1` = "no",
  `2` = "yes"
)

domestic_care_personal_care_both <- c(
  `-2` = "na, routing",
  `-1` = "na, asked",
  `1` = "domestic care",
  `2` = "personal care",
  `3` = "both"
)

done_not_done_no_right_eye_no_left_eye_terminated <- c(`1` = "done", `2` = "not done", `3` = "no right eye", `4` = "no left eye", `5` = "terminated")

done_not_done_terminated_not_able_physical <- c(
  `-1` = "na, interview terminated",
  `1` = "done",
  `2` = "not done",
  `3` = "terminated",
  `4` = "not able (physical)"
)

drink_less_alcohol <- c(`4` = "drink less alcohol")

eat_less_fat <- c(`3` = "eat less fat")

elementary_low_medium_high_scientific <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "elementary",
  `2` = "low",
  `3` = "medium",
  `4` = "high",
  `5` = "scientific"
)

elementary_low_medium_high_scientific_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BJOB1",
  `-1` = "na, asked",
  `1` = "elementary",
  `2` = "low",
  `3` = "medium",
  `4` = "high",
  `5` = "scientific"
)

elementary_low_medium_high_scientific_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BJOBL1",
  `-1` = "na, asked",
  `1` = "elementary",
  `2` = "low",
  `3` = "medium",
  `4` = "high",
  `5` = "scientific"
)

elementary_low_medium_high_scientific_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BPJOB1",
  `-1` = "na, asked",
  `1` = "elementary",
  `2` = "low",
  `3` = "medium",
  `4` = "high",
  `5` = "scientific"
)

elementary_low_medium_high_scientific_5 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BPJOBL1",
  `-1` = "na, asked",
  `1` = "elementary",
  `2` = "low",
  `3` = "medium",
  `4` = "high",
  `5` = "scientific"
)

enough_challenges_at_work_maintain_social_contacts <- c(
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
)

enough_challenges_at_work_maintain_social_contacts_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BRETFIN",
  `-1` = "na, asked",
  `1` = "enough challenges at work",
  `2` = "maintain social contacts",
  `3` = "other pastime less pleasant",
  `4` = "financially more favourable",
  `5` = "other reason"
)

er_ir_eg_ig_er_ir_ig_eg_er_eg_ir_ig_er_eg_ig_ir <- c(
  `-7` = "NA:rank>10/12",
  `-6` = "NA:see 247",
  `-3` = "RCF/SYS addition",
  `-1` = "only missings",
  `1234` = "er ir eg ig",
  `1243` = "er ir ig eg",
  `1324` = "er eg ir ig",
  `1342` = "er eg ig ir",
  `1423` = "er ig ir eg",
  `1432` = "er ig eg ir",
  `2134` = "ir er eg ig",
  `2143` = "ir er ig eg",
  `2314` = "ir eg er ig",
  `2341` = "ir eg ig er",
  `2413` = "ir ig er eg",
  `2431` = "ir ig eg er",
  `3124` = "eg er ir ig",
  `3142` = "eg er ig ir",
  `3214` = "eg ir er ig",
  `3241` = "eg ir ig er",
  `3412` = "eg ig er ir",
  `3421` = "eg ig ir er",
  `4123` = "ig er ir eg",
  `4132` = "ig er eg ir",
  `4213` = "ig ir er eg",
  `4231` = "ig ir eg er",
  `4312` = "ig eg er ir",
  `4321` = "ig eg ir er"
)

every_day_4_5_times_a_week_2_3_times_a_week <- c(
  `-1` = "no answer",
  `1` = "every day",
  `2` = "4-5 times a week",
  `3` = "2-3 times a week",
  `4` = "<2 times a week",
  `5` = "never"
)

every_day_5_6_days_a_week_3_4_days_a_week <- c(
  `-2` = "R does not drink",
  `-1` = "no answer, asked",
  `1` = "every day",
  `2` = "5-6 days a week",
  `3` = "3-4 days a week",
  `4` = "1-2 days a week",
  `5` = "1-3 days a month",
  `6` = "<1 day a month"
)

every_day_5_6_days_a_week_3_4_days_a_week_2 <- c(
  `-4` = "no valid data",
  `-2` = "R does not drink",
  `-1` = "no answer, asked",
  `1` = "every day",
  `2` = "5-6 days a week",
  `3` = "3-4 days a week",
  `4` = "1-2 days a week",
  `5` = "1-3 days a month",
  `6` = "less than 1 day a month"
)

excellent_good_fair_bad_refused_other <- c(
  `-2` = "no valid measurement",
  `-1` = "na, asked",
  `1` = "excellent",
  `2` = "good",
  `3` = "fair",
  `4` = "bad",
  `5` = "refused",
  `6` = "other"
)

excellent_good_fair_bad_refused_other_reason <- c(
  `-2` = "no answer, skipped",
  `-1` = "no answer, asked",
  `1` = "excellent",
  `2` = "good",
  `3` = "fair",
  `4` = "bad",
  `5` = "refused",
  `6` = "other reason"
)

excellent_good_fair_sometimes_good_bad_poor <- c(
  `-5` = "na, interview terminated",
  `-1` = "na, asked",
  `1` = "excellent",
  `2` = "good",
  `3` = "fair",
  `4` = "sometimes good/bad",
  `5` = "poor"
)

excellent_good_fair_sometimes_good_bad_poor_2 <- c(
  `-5` = "not available, interview terminated",
  `-1` = "not available, asked",
  `1` = "excellent",
  `2` = "good",
  `3` = "fair",
  `4` = "sometimes good/bad",
  `5` = "poor"
)

excellent_very_good_good_fair_poor <- c(
  `-1` = "asked, no answer",
  `1` = "excellent",
  `2` = "very good",
  `3` = "good",
  `4` = "fair",
  `5` = "poor"
)

extra_instructions_other_disturbing_factors <- c(
  `-3` = "no test",
  `-2` = "no particularities",
  `-1` = "no others mentioned",
  `1` = "extra instructions",
  `2` = "other disturbing factors",
  `3` = "R confused/not fit",
  `4` = "stopped/technical",
  `5` = "not specified"
)

extra_instructions_other_disturbing_factors_2 <- c(
  `-4` = "no valid data",
  `-3` = "no test",
  `-2` = "no particularities",
  `-1` = "no others mentioned",
  `1` = "extra instructions",
  `2` = "other disturbing factors",
  `3` = "R confused/not fit",
  `4` = "stopped/technical",
  `5` = "not specified"
)

face_to_face_complete_face_to_face_short <- c(
  `-1` = "no data",
  `1` = "face to face: complete",
  `2` = "face to face: short",
  `3` = "face to face: terminated",
  `4` = "face to face: sh/term",
  `5` = "telephone: respondent",
  `6` = "telephone: respondent"
)

fall_from_standing_height_fall_from_standing_height_or <- c(
  `-2` = "na, see H/B/IMBOT1#",
  `-1` = "na, asked",
  `1` = "fall from > standing height",
  `2` = "fall from standing height or <",
  `3` = "traffic accident",
  `4` = "other"
)

fall_from_standing_height_fall_from_standing_height_or_2 <- c(
  `-2` = "na, see JMBOT#",
  `-1` = "na, asked",
  `1` = "fall from > standing height",
  `2` = "fall from standing height or <",
  `3` = "traffic accident",
  `4` = "other"
)

fall_from_standing_height_fall_from_standing_height_or_3 <- c(
  `-2` = "na, see KMBOT#",
  `-1` = "na, asked",
  `1` = "fall from > standing height",
  `2` = "fall from standing height or <",
  `3` = "traffic accident",
  `4` = "other"
)

fall_from_standing_height_or_fall_from_standing_height <- c(
  `-2` = "na, see H/B/IMBOT1#",
  `-1` = "na, asked",
  `1` = "fall from standing height or <",
  `2` = "fall from > standing height",
  `3` = "fall from bike",
  `4` = "traffic accident",
  `5` = "other"
)

fall_from_standing_height_or_fall_from_standing_height_2 <- c(
  `-2` = "na, see BMBOT1#",
  `-1` = "na, asked",
  `1` = "fall from standing height or <",
  `2` = "fall from > standing height",
  `3` = "fall from bike",
  `4` = "traffic accident",
  `5` = "other"
)

fall_no_yes <- c(`1` = "fall no", `2` = "yes")

fall_standing_height_fall_standing_height <- c(
  `-2` = "na, see D/EMBOT1#",
  `-1` = "na, asked",
  `1` = "fall > standing height",
  `2` = "fall < standing height",
  `3` = "traffic accident",
  `4` = "other -> to be coded"
)

fall_standing_height_fall_standing_height_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CMBOT1#",
  `-1` = "na, asked",
  `1` = "fall>standing height",
  `2` = "fall<standing height",
  `3` = "traffic accident",
  `4` = "other",
  `5` = "spontaan"
)

fall_standing_height_fall_standing_height_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BMBOT1#",
  `-1` = "na, asked",
  `1` = "fall > standing height",
  `2` = "fall < standing height",
  `3` = "traffic accident",
  `4` = "other -> to be coded"
)

fall_standing_height_fall_standing_height_4 <- c(
  `-2` = "na, see FMBOT1#",
  `-1` = "na, asked",
  `1` = "fall > standing height",
  `2` = "fall < =standing height",
  `3` = "traffic accident",
  `4` = "other"
)

fall_standing_height_fall_standing_height_5 <- c(
  `-2` = "na, see GMBOT1",
  `-1` = "na, asked",
  `1` = "fall > standing height",
  `2` = "fall < =standing height",
  `3` = "traffic accident",
  `4` = "other"
)

fall_standing_height_fall_standing_height_6 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see GMBOT1",
  `-1` = "na, asked",
  `1` = "fall>standing height",
  `2` = "fall<standing height",
  `3` = "fall from bike",
  `4` = "other",
  `5` = "other"
)

fall_standing_height_fall_standing_height_7 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CMBOT1#",
  `-1` = "na, asked",
  `1` = "fall>standing height",
  `2` = "fall<standing height",
  `3` = "fall from bike",
  `4` = "other",
  `5` = "other"
)

for_living_outweigh_those_for_dying_about_equal <- c(
  `-1` = "na, asked",
  `1` = "for living outweigh those for dying",
  `2` = "about equal",
  `3` = "for dying outweigh those for living"
)

for_respondent_for_former_inmate_for_both <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/J/KSPECADJ",
  `-1` = "na, asked",
  `1` = "for respondent",
  `2` = "for (former) inmate",
  `3` = "for both",
  `4` = "for none, already present"
)

good_moderate_poor <- c(`-1` = "na, asked", `1` = "good", `2` = "moderate", `3` = "poor")

good_moderate_poor_2 <- c(
  `-3` = "na, section ot done",
  `-1` = "na, asked",
  `1` = "good",
  `2` = "moderate",
  `3` = "poor"
)

guidance_dietician <- c(`14` = "guidance dietician")

hardly_ever_sometimes_often_almost_always <- c(
  `-2` = "na, see J/KMSENS7A",
  `-1` = "na, asked",
  `1` = "hardly ever",
  `2` = "sometimes",
  `3` = "often",
  `4` = "almost always"
)

hardly_ever_sometimes_often_almost_always_2 <- c(
  `-2` = "na, see J/KMSENS7A",
  `-1` = "na, asked",
  `1` = "hardly ever",
  `2` = "sometimes",
  `3` = "often",
  `4` = "almost always",
  `5` = "R does not wear a HA in this situation"
)

hardly_ever_sometimes_often_almost_always_3 <- c(
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "hardly ever",
  `2` = "sometimes",
  `3` = "often",
  `4` = "almost always",
  `5` = "R does not have a hearing aid"
)

hip_knee_fingers_hand_wrist_toes_foot_ankle_neck_back <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see JRHEUM10A3",
  `-1` = "na, asked",
  `1` = "hip",
  `2` = "knee",
  `3` = "fingers",
  `4` = "hand/wrist",
  `5` = "toes",
  `6` = "foot/ankle",
  `7` = "neck",
  `8` = "back",
  `9` = "shoulder",
  `10` = "other"
)

home_care_service_pgb <- c(`-2` = "na, routing", `-1` = "na, asked", `1` = "home care service", `2` = "PGB")

household_children_in_law_other_kin_neighborhood <- c(
  `1` = "household",
  `2` = "children/-in-law",
  `3` = "other kin",
  `4` = "neighborhood",
  `5` = "work/school",
  `6` = "organizations",
  `7` = "other non-kin",
  `8` = "forgotten",
  `9` = "RCF/SYS addition"
)

housekeeper_in_household_acquaintance_in_household <- c(
  `1` = "housekeeper (in household)",
  `2` = "acquaintance (in household)",
  `3` = "catholic sister (in household)",
  `4` = "parent (in household)",
  `5` = "parent inlaw (in household)",
  `6` = "niece/nephew (in household)",
  `7` = "son/daughter-in-law (in household)",
  `8` = "brother/sister-in-law (in household)",
  `9` = "former partner (in household)",
  `10` = "boarder/landlord (in household)",
  `11` = "partner/spouse (in household)",
  `12` = "biological son/daughter (in household)",
  `13` = "brother/sister (in household)",
  `14` = "grandson/daughter (in household)",
  `15` = "friend (in household)",
  `16` = "other, not specified (in household)",
  `17` = "other nonkin, not specified (in household)",
  `18` = "other kin, not specified (in household)",
  `19` = "son/daughter of partner, step, adoptive, foster (in household)",
  `21` = "biological son/daughter",
  `22` = "son/daughter-in-law",
  `23` = "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)",
  `24` = "former son/daughter-in-law, other specific cases",
  `25` = "stepchild",
  `26` = "adoptive child",
  `27` = "foster child",
  `31` = "parent",
  `32` = "brother/sister (including half or step)",
  `33` = "brother/sister-in-law",
  `34` = "grandson/daughter",
  `35` = "cousin/niece/nephew",
  `36` = "uncle/aunt",
  `37` = "other family; specification unknown",
  `38` = "father/mother-in-law",
  `39` = "partner/spouse of grandchild",
  `40` = "neighbor",
  `41` = "former neighbor",
  `42` = "living in neighborhood",
  `51` = "(former) colleague or his/her spouse",
  `52` = "known through volunteer work",
  `53` = "known through school, course, education",
  `60` = "known through voluntary organization (e.g. church, sports, political)",
  `70` = "other nonkin; specification unknown",
  `71` = "friend",
  `72` = "acquaintance",
  `73` = "(former) colleague or his/her spouse ->51",
  `74` = "known through voluntary organization (e.g. church, sports, political) ->60",
  `75` = "known through contact at street",
  `76` = "professional helper",
  `77` = "professional, e.g. pastor, reverend, general practitioner",
  `78` = "other kin or nonkin; specification unknown",
  `79` = "professional helper (frequent contact)",
  `80` = "partner/spouse outside household",
  `81` = "former spouse/partner",
  `82` = "parent of child-in-law",
  `83` = "former parent-in-law",
  `84` = "landlord",
  `85` = "catholic sister",
  `86` = "other kin or nonkin; specification unknown"
)

hypertension_ulcer_stomach_or_duodenum <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HOTHSI01",
  `-1` = "na, asked",
  `1` = "hypertension",
  `2` = "ulcer stomach or duodenum",
  `3` = "serious intestinal disease",
  `4` = "gall-stones/gall-bladder",
  `5` = "liver disease or cirrhosis",
  `6` = "inguinal hernia",
  `7` = "kidney stone",
  `8` = "kidney disease-serious",
  `9` = "chronic cystitis",
  `10` = "prostate complaints (males)",
  `11` = "prolapse (females)",
  `12` = "thyroid disease",
  `13` = "back problems, hernia",
  `14` = "epilepsy",
  `15` = "dizziness with falling",
  `16` = "migraine",
  `17` = "serious skin disease",
  `18` = "decubitus-ulcer",
  `19` = "allergy/hay-fever",
  `20` = "serious consequences accident",
  `21` = "other serious consequences/burns",
  `22` = "consequences surgery/operations",
  `23` = "disease of nervous system",
  `24` = "mental problems, incl. depression",
  `25` = "- to be coded -",
  `26` = "ear diseases/hearing problems",
  `27` = "venous insufficiency/varicose veins",
  `28` = "anaemia",
  `29` = "chronic headaches (no migraine)",
  `30` = "chronic neck-problems",
  `31` = "dizziness without falling",
  `32` = "congenital disorders",
  `33` = "hypercholesterolaemia",
  `34` = "gout",
  `35` = "menopausal complaints (females)",
  `36` = "osteoporosis",
  `37` = "other pulmonary disease (no CNSLD)",
  `38` = "systemic diseases",
  `39` = "other hormonal diseases (no diabetes/thyroid)",
  `40` = "other urological disease (no incontinence)",
  `41` = "other locomotor disease",
  `42` = "other vascular disease",
  `43` = "other neurological disease",
  `44` = "TIA",
  `45` = "other haematological disease",
  `46` = "pancreatitis-chronic",
  `47` = "no label",
  `48` = "addiction",
  `49` = "other chronic disease",
  `50` = "other non-chronic disease"
)

hypertension_ulcer_stomach_or_duodenum_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HOTHSI07",
  `-1` = "na, asked",
  `1` = "hypertension",
  `2` = "ulcer stomach or duodenum",
  `3` = "serious intestinal disease",
  `4` = "gall-stones/gall-bladder",
  `5` = "liver disease or cirrhosis",
  `6` = "inguinal hernia",
  `7` = "kidney stone",
  `8` = "kidney disease-serious",
  `9` = "chronic cystitis",
  `10` = "prostate complaints (males)",
  `11` = "prolapse (females)",
  `12` = "thyroid disease",
  `13` = "back problems, hernia",
  `14` = "epilepsy",
  `15` = "dizziness with falling",
  `16` = "migraine",
  `17` = "serious skin disease",
  `18` = "decubitus-ulcer",
  `19` = "allergy/hay-fever",
  `20` = "serious consequences accident",
  `21` = "other serious consequences/burns",
  `22` = "consequences surgery/operations",
  `23` = "disease of nervous system",
  `24` = "mental problems, incl. depression",
  `25` = "- to be coded -",
  `26` = "ear diseases/hearing problems",
  `27` = "venous insufficiency/varicose veins",
  `28` = "anaemia",
  `29` = "chronic headaches (no migraine)",
  `30` = "chronic neck-problems",
  `31` = "dizziness without falling",
  `32` = "congenital disorders",
  `33` = "hypercholesterolaemia",
  `34` = "gout",
  `35` = "menopausal complaints (females)",
  `36` = "osteoporosis",
  `37` = "other pulmonary disease (no CNSLD)",
  `38` = "systemic diseases",
  `39` = "other hormonal diseases (no diabetes/thyroid)",
  `40` = "other urological disease (no incontinence)",
  `41` = "other locomotor disease",
  `42` = "other vascular disease",
  `43` = "other neurological disease",
  `44` = "TIA",
  `45` = "other haematological disease",
  `46` = "pancreatitis-chronic",
  `47` = "no label",
  `48` = "addiction",
  `49` = "other chronic disease",
  `50` = "other non-chronic disease"
)

hypertension_ulcer_stomach_or_duodenum_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JOTHSI01",
  `-1` = "na, asked",
  `1` = "hypertension",
  `2` = "ulcer stomach or duodenum",
  `3` = "serious intestinal disease",
  `4` = "gall-stones/gall-bladder",
  `5` = "liver disease or cirrhosis",
  `6` = "inguinal hernia",
  `7` = "kidney stone",
  `8` = "kidney disease-serious",
  `9` = "chronic cystitis",
  `10` = "prostate complaints (males)",
  `11` = "prolapse (females)",
  `12` = "thyroid disease",
  `13` = "back problems, hernia",
  `14` = "epilepsy",
  `15` = "dizziness with falling",
  `16` = "migraine",
  `17` = "serious skin disease",
  `18` = "decubitus-ulcer",
  `19` = "allergy/hay-fever",
  `20` = "serious consequences accident",
  `21` = "other serious consequences/burns",
  `22` = "consequences surgery/operations",
  `23` = "disease of nervous system",
  `24` = "Parkinson",
  `25` = "mental problems, incl. depression",
  `26` = "other to be coded"
)

hypertension_ulcer_stomach_or_duodenum_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JOTHSI07",
  `-1` = "na, asked",
  `1` = "hypertension",
  `2` = "ulcer stomach or duodenum",
  `3` = "serious intestinal disease",
  `4` = "gall-stones/gall-bladder",
  `5` = "liver disease or cirrhosis",
  `6` = "inguinal hernia",
  `7` = "kidney stone",
  `8` = "kidney disease-serious",
  `9` = "chronic cystitis",
  `10` = "prostate complaints (males)",
  `11` = "prolapse (females)",
  `12` = "thyroid disease",
  `13` = "back problems, hernia",
  `14` = "epilepsy",
  `15` = "dizziness with falling",
  `16` = "migraine",
  `17` = "serious skin disease",
  `18` = "decubitus-ulcer",
  `19` = "allergy/hay-fever",
  `20` = "serious consequences accident",
  `21` = "other serious consequences/burns",
  `22` = "consequences surgery/operations",
  `23` = "disease of nervous system",
  `24` = "Parkinson",
  `25` = "mental problems, incl. depression",
  `26` = "other to be coded"
)

hypertension_ulcer_stomach_or_duodenum_5 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "hypertension",
  `2` = "ulcer stomach or duodenum",
  `3` = "serious intestinal disease",
  `4` = "gall-stones/gall-bladder",
  `5` = "liver disease or cirrhosis",
  `6` = "inguinal hernia",
  `7` = "kidney stone",
  `8` = "kidney disease-serious",
  `9` = "chronic cystitis",
  `10` = "prostate complaints (males)",
  `11` = "prolapse (females)",
  `12` = "thyroid disease",
  `13` = "back problems, hernia",
  `14` = "epilepsy",
  `15` = "dizziness with falling",
  `16` = "migraine",
  `17` = "serious skin disease",
  `18` = "decubitus-ulcer",
  `19` = "allergy/hay-fever",
  `20` = "serious consequences accident",
  `21` = "other serious consequences/burns",
  `22` = "consequences surgery/operations",
  `23` = "disease of nervous system",
  `24` = "coding category 24",
  `25` = "coding category 25",
  `26` = "coding category 26",
  `27` = "coding category 27",
  `28` = "coding category 28",
  `29` = "coding category 29",
  `30` = "coding category 30",
  `31` = "coding category 31",
  `32` = "congenital disorders",
  `33` = "hypercholesterolaemia",
  `34` = "gout",
  `35` = "menopausal complaints (females)",
  `36` = "osteoporosis",
  `37` = "other pulmonary disease (no CNSLD)",
  `38` = "systemic diseases",
  `39` = "other hormonal diseases (no diabetes/thyroid)",
  `40` = "other urological disease (no incontinence)",
  `41` = "other locomotor disease",
  `42` = "other vascular disease",
  `43` = "other neurological disease",
  `44` = "TIA",
  `45` = "other haematological disease",
  `46` = "pancreatitis-chronic",
  `47` = "no label",
  `48` = "addiction",
  `49` = "other chronic disease",
  `50` = "other non-chronic disease"
)

i_do_not_make_my_organs_available <- c(
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "I do not make my organs available",
  `2` = "I make all my organs available",
  `3` = "I make some organs available",
  `4` = "I leave the choice to my next of kin",
  `5` = "I do not know / do not want to say it"
)

in_kind_personal_budget_pgb_both <- c(
  `-3` = "section not done",
  `-2` = "na, no contact about services",
  `-1` = "na, asked",
  `1` = "in kind",
  `2` = "Personal budget (PGB)",
  `3` = "both"
)

in_netherlands_in_morocco_turkey_elsewhere <- c(
  `-3` = "not asked (interview terminated/skip)",
  `-2` = "answer: not applicable",
  `-1` = "no answer",
  `1` = "in Netherlands",
  `2` = "in Morocco/Turkey",
  `3` = "elsewhere",
  `4` = "equal number in Morocco/Turkey and NL"
)

independent_residential_home_nursing_h_somatic <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GMOVED",
  `-1` = "na, asked",
  `1` = "independent",
  `2` = "residential home",
  `3` = "nursing h-somatic",
  `4` = "nursing h-psych",
  `5` = "hospital",
  `6` = "psychiatric hospital",
  `8` = "monastery"
)

independent_residential_home_nursing_h_somatic_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/J/KMOVED",
  `-1` = "na, asked",
  `1` = "independent",
  `2` = "residential home",
  `3` = "nursing h-somatic",
  `4` = "nursing h-psych",
  `5` = "hospital",
  `6` = "psychiatric hospital",
  `8` = "monastery"
)

informal_network_should_help <- c(
  `-2` = "no valid data",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_10 <- c(
  `-2` = "na, see JMIHHAG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_11 <- c(
  `-2` = "na, see KMIHHAG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_12 <- c(
  `-2` = "na, see JMINTCG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_13 <- c(
  `-2` = "na, see KMINTCG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_14 <- c(
  `-2` = "na, see JMINURG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_15 <- c(
  `-2` = "na, see KMINURG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_16 <- c(
  `-2` = "na, see JMIOTHG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_17 <- c(
  `-2` = "na, see KMIOTHG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_18 <- c(
  `-2` = "na, see JMIPCG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_19 <- c(
  `-2` = "na, see KMIPCG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_2 <- c(
  `-2` = "na, see JMI24CG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_20 <- c(
  `-2` = "na, see JMISSCG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_21 <- c(
  `-2` = "na, see KMISSCG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_22 <- c(
  `-2` = "na, see JMITRAG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_23 <- c(
  `-2` = "na, see KMITRAG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_3 <- c(
  `-2` = "na, see KMI24CG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_4 <- c(
  `-2` = "na, see JMIDACG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_5 <- c(
  `-2` = "na, see KMIDACG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_6 <- c(
  `-2` = "na, see JMIGUIG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_7 <- c(
  `-2` = "na, see KMIGUIG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_8 <- c(
  `-2` = "na, see JMIHADG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

informal_network_should_help_9 <- c(
  `-2` = "na, see KMIHADG",
  `-1` = "na, asked",
  `1` = "informal network should help",
  `2` = "need for care is not serious enough",
  `3` = "other"
)

insufficient_in_between_s_i_sufficient_do_not_know <- c(
  `-5` = "na, terminated interview",
  `-3` = "na, wrong skip",
  `-2` = "na, D/BR- D/BP- & D/BDHELPYN",
  `-1` = "na, asked",
  `1` = "insufficient",
  `2` = "in between s/i",
  `3` = "sufficient",
  `4` = "do not know",
  `5` = "refused to answer"
)

insufficient_in_between_sufficient_insufficient <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KHELPR",
  `-1` = "na, asked",
  `1` = "insufficient",
  `2` = "in between sufficient / insufficient",
  `3` = "sufficient",
  `4` = "do not know",
  `5` = "refused to answer"
)

interview_broken_off_no_answer_short_version <- c(
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-3` = "no answer, wrong skip",
  `-2` = "no answer, routing",
  `-1` = "no answer, asked"
)

interview_terminated <- c(`-2` = "valid data", `2` = "interview terminated")

interview_terminated_2 <- c(`-4` = "interview terminated")

interview_terminated_no_scale_too_many_missing <- c(
  `-3` = "interview terminated",
  `-2` = "no scale (too many missing)",
  `1` = NA_character_,
  `30` = NA_character_
)

interview_terminated_not_available_short_interview <- c(
  `-5` = "interview terminated",
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked"
)

interview_terminated_refused_test <- c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test")

interview_terminated_short_interview_na_refused <- c(
  `-4` = "interview terminated",
  `-3` = "short interview",
  `-2` = "na, refused",
  `-1` = "na, asked",
  `0` = NA_character_,
  `1` = NA_character_
)

interview_terminated_short_interview_na_refused_2 <- c(
  `-4` = "interview terminated",
  `-3` = "short interview",
  `-2` = "na, refused",
  `0` = NA_character_,
  `1` = NA_character_
)

january_december <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KPHELP01",
  `-1` = "na, asked",
  `1` = "January",
  `12` = "... December"
)

january_february_march_april_may_june_july_august <- c(
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
)

january_february_march_april_may_june_july_august_10 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BCVA02B",
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
)

january_february_march_april_may_june_july_august_11 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BHART06",
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
)

january_february_march_april_may_june_july_august_12 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see G/H/I/J/KINCDECL",
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
)

january_february_march_april_may_june_july_august_13 <- c(
  `-2` = "na, see BMBOT1#",
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
)

january_february_march_april_may_june_july_august_14 <- c(
  `-2` = "na, see DMHIPPRO",
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
)

january_february_march_april_may_june_july_august_15 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see BPJOBL1",
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
)

january_february_march_april_may_june_july_august_16 <- c(
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
)

january_february_march_april_may_june_july_august_17 <- c(
  `-2` = "na, see FMBOT1",
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
)

january_february_march_april_may_june_july_august_18 <- c(
  `-2` = "na, see GMBOT#",
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
)

january_february_march_april_may_june_july_august_19 <- c(
  `-2` = "na, see BMBOT#",
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
)

january_february_march_april_may_june_july_august_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCVA02B",
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
)

january_february_march_april_may_june_july_august_20 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see HJOBC",
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
)

january_february_march_april_may_june_july_august_21 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see BJOB1",
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
)

january_february_march_april_may_june_july_august_22 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see BPJOB1",
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
)

january_february_march_april_may_june_july_august_23 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DINCDECL",
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
)

january_february_march_april_may_june_july_august_24 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see ICVA02B",
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
)

january_february_march_april_may_june_july_august_25 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see IHART06",
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
)

january_february_march_april_may_june_july_august_26 <- c(
  `-2` = "na, see g/hqhhacqu",
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
)

january_february_march_april_may_june_july_august_27 <- c(
  `-2` = "na, see g/hqhhbrsi",
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
)

january_february_march_april_may_june_july_august_28 <- c(
  `-2` = "na, see g/hqhhchin",
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
)

january_february_march_april_may_june_july_august_29 <- c(
  `-2` = "na, see g/hqhhgrch",
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
)

january_february_march_april_may_june_july_august_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HHART06",
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
)

january_february_march_april_may_june_july_august_30 <- c(
  `-2` = "na, see g/hqhhneig",
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
)

january_february_march_april_may_june_july_august_31 <- c(
  `-2` = "na, see g/hqhhotfa",
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
)

january_february_march_april_may_june_july_august_32 <- c(
  `-2` = "na, see g/hqhhothn",
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
)

january_february_march_april_may_june_july_august_33 <- c(
  `-2` = "na, see g/hqhhparn",
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
)

january_february_march_april_may_june_july_august_34 <- c(
  `-2` = "na, see g/hqhhpart",
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
)

january_february_march_april_may_june_july_august_35 <- c(
  `-2` = "na, see g/hqphacqu",
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
)

january_february_march_april_may_june_july_august_36 <- c(
  `-2` = "na, see g/hqphbrsi",
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
)

january_february_march_april_may_june_july_august_37 <- c(
  `-2` = "na, see g/hqphchin",
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
)

january_february_march_april_may_june_july_august_38 <- c(
  `-2` = "na, see g/hqphgrch",
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
)

january_february_march_april_may_june_july_august_39 <- c(
  `-2` = "na, see g/hqphneig",
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
)

january_february_march_april_may_june_july_august_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CMBOT1#",
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
)

january_february_march_april_may_june_july_august_40 <- c(
  `-2` = "na, see g/hqphotfa",
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
)

january_february_march_april_may_june_july_august_41 <- c(
  `-2` = "na, see g/hqphothn",
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
)

january_february_march_april_may_june_july_august_42 <- c(
  `-2` = "na, see g/hqphparn",
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
)

january_february_march_april_may_june_july_august_43 <- c(
  `-2` = "na, see g/hqphpart",
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
)

january_february_march_april_may_june_july_august_44 <- c(
  `-2` = "na, see g/hqphchir",
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
)

january_february_march_april_may_june_july_august_45 <- c(
  `-2` = "na, see g/hqphothr",
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
)

january_february_march_april_may_june_july_august_46 <- c(
  `-2` = "na, see g/hqphparr",
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
)

january_february_march_april_may_june_july_august_47 <- c(
  `-2` = "na, see H/B/IMBOT1#",
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
)

january_february_march_april_may_june_july_august_48 <- c(
  `-2` = "na, see JMBOT#",
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
)

january_february_march_april_may_june_july_august_49 <- c(
  `-2` = "na, see KMBOT#",
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
)

january_february_march_april_may_june_july_august_5 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
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
)

january_february_march_april_may_june_july_august_50 <- c(
  `-2` = "na, see BMHIPPRO",
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
)

january_february_march_april_may_june_july_august_51 <- c(
  `-2` = "na, see JMFALLFRAC",
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
)

january_february_march_april_may_june_july_august_52 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see FMBOT1",
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
)

january_february_march_april_may_june_july_august_53 <- c(
  `-2` = "na, see BMWALKAID1",
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
)

january_february_march_april_may_june_july_august_54 <- c(
  `-2` = "na, see DMWALKAID1",
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
)

january_february_march_april_may_june_july_august_55 <- c(
  `-2` = "na, see BMWALKAID2",
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
)

january_february_march_april_may_june_july_august_56 <- c(
  `-2` = "na, see DMWALKAID2",
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
)

january_february_march_april_may_june_july_august_57 <- c(
  `-2` = "na, see BMWALKAID3",
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
)

january_february_march_april_may_june_july_august_58 <- c(
  `-2` = "na, see DMWALKAID3",
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
)

january_february_march_april_may_june_july_august_59 <- c(
  `-2` = "na, see BMWALKAID4",
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
)

january_february_march_april_may_june_july_august_6 <- c(
  `-3` = "na wrong skip",
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
)

january_february_march_april_may_june_july_august_60 <- c(
  `-2` = "na, see DMWALKAID4",
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
)

january_february_march_april_may_june_july_august_61 <- c(
  `-2` = "na, see BMWALKAID5",
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
)

january_february_march_april_may_june_july_august_62 <- c(
  `-2` = "na, see DMWALKAID5",
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
)

january_february_march_april_may_june_july_august_7 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
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
)

january_february_march_april_may_june_july_august_8 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/IMBOT1#",
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
)

january_february_march_april_may_june_july_august_9 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see BJOBL1",
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
)

knee <- c(`1` = "Knee")

knee_2 <- c(`2` = "Knee")

leave_it_all_to_others_determine_it_somewhat_by_myself <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KHELPR",
  `-1` = "na, asked",
  `1` = "leave it all to others",
  `2` = "determine it somewhat by myself",
  `3` = "determine it all by myself"
)

leave_it_all_to_others_determine_it_somewhat_by_myself_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see Na, see BR-, BD-, & BNHELPYN",
  `-1` = "na, asked",
  `1` = "leave it all to others",
  `2` = "determine it somewhat by myself",
  `3` = "determine it all by myself"
)

leave_it_all_to_others_determine_it_somewhat_by_myself_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HR-, HD-, HN-, HG- & HAHELPYN",
  `-1` = "na, asked",
  `1` = "leave it all to others",
  `2` = "determine it somewhat by myself",
  `3` = "determine it all by myself"
)

leave_it_all_to_others_determine_it_somewhat_by_myself_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see IR-, ID-, IG-, IG & IAHELPYN",
  `-1` = "na, asked",
  `1` = "leave it all to others",
  `2` = "determine it somewhat by myself",
  `3` = "determine it all by myself"
)

leave_it_all_to_others_determine_it_somewhat_by_myself_5 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BR-, BD-, & BNHELPYN",
  `-1` = "na, asked",
  `1` = "leave it all to others",
  `2` = "determine it somewhat by myself",
  `3` = "determine it all by myself"
)

leave_it_all_to_others_determine_it_somewhat_by_myself_6 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "leave it all to others",
  `2` = "determine it somewhat by myself",
  `3` = "determine it all by myself"
)

less_snacks <- c(`2` = "less snacks")

less_than_1_a_week_1_or_less_a_week <- c(
  `-2` = "na, see E/B/F/GMSMOKECIG",
  `-1` = "na, asked",
  `0` = "less than 1 a week",
  `1` = "1 or less a week"
)

less_than_1_month_1_month_to_1_year_1_to_5_years <- c(
  `-2` = "na, see G/H/B/B/I/J/KM#MED",
  `-1` = "na, asked",
  `1` = "less than 1 month",
  `2` = "1 month to 1 year",
  `3` = "1 to 5 years",
  `4` = "longer than 5 years 1"
)

less_than_1_month_1_month_to_1_year_1_to_5_years_2 <- c(
  `-2` = "na, see D/E/B/FM#MED",
  `-1` = "na, asked",
  `1` = "less than 1 month",
  `2` = "1 month to 1 year",
  `3` = "1 to 5 years",
  `4` = "longer than 5 years"
)

less_than_1_month_1_month_to_1_year_1_to_5_years_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CM#MED",
  `-1` = "no valid data",
  `1` = "less than 1 month",
  `2` = "1 month to 1 year",
  `3` = "1 to 5 years",
  `4` = "longer than 5 years"
)

less_than_1_month_1_month_to_1_year_1_to_5_years_4 <- c(
  `-3` = "no valid data",
  `-2` = "na, see BM#MED",
  `-1` = "na, asked",
  `1` = "less than 1 month",
  `2` = "1 month to 1 year",
  `3` = "1 to 5 years",
  `4` = "longer than 5 years",
  `5` = "sometimes",
  `6` = "only when necessary"
)

less_than_1_month_1_month_to_1_year_1_to_5_years_5 <- c(
  `-3` = "no valid data / na, wrong skip",
  `-2` = "na, see BM#MED",
  `-1` = "na, asked / no valid data",
  `1` = "less than 1 month",
  `2` = "1 month to 1 year",
  `3` = "1 to 5 years",
  `4` = "longer than 5 years / longer than 5 years 1",
  `5` = "sometimes",
  `6` = "only when necessary"
)

less_than_1_month_1_month_to_1_year_1_to_5_years_6 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CM#MED",
  `-1` = "no valid data / na, asked",
  `1` = "less than 1 month",
  `2` = "1 month to 1 year",
  `3` = "1 to 5 years",
  `4` = "longer than 5 years / longer than 5 years 1"
)

less_than_once_a_day_if_necessary <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CM#MED",
  `-1` = "no valid data",
  `98` = "less than once a day",
  `99` = "if necessary"
)

less_than_once_a_day_once_a_day_twice_a_day <- c(
  `-5` = "na, interview terminated",
  `-1` = "na, asked",
  `1` = "less than once a day",
  `2` = "once a day",
  `3` = "twice a day",
  `4` = "more than twice a day"
)

less_than_one_day_a_week_1_2_days_a_week <- c(
  `-1` = "na, asked",
  `1` = "less than one day a week",
  `2` = "1-2 days a week",
  `3` = "3-4 days a week",
  `4` = "5-6 days a week",
  `5` = "daily"
)

less_than_one_day_a_week_1_2_days_a_week_2 <- c(
  `-2` = "na, no second vitamin",
  `-1` = "na, asked",
  `1` = "less than one day a week",
  `2` = "1-2 days a week",
  `3` = "3-4 days a week",
  `4` = "5-6 days a week",
  `5` = "daily"
)

less_than_one_day_a_week_1_2_days_a_week_3 <- c(
  `-2` = "na, no third vitamin",
  `-1` = "na, asked",
  `1` = "less than one day a week",
  `2` = "1-2 days a week",
  `3` = "3-4 days a week",
  `4` = "5-6 days a week",
  `5` = "daily"
)

less_than_one_week_week_one_month_one_month <- c(
  `-2` = "na, see C/DMBACKP",
  `1` = "less than one week",
  `2` = "> week < one month",
  `3` = "> one month"
)

less_than_one_week_week_one_month_one_month_2 <- c(
  `-2` = "na, see EMBACKP",
  `-1` = "na, asked",
  `1` = "less than one week",
  `2` = "> week < one month",
  `3` = "> one month"
)

light_products <- c(`6` = "light products")

limit_types_of_food <- c(`5` = "limit types of food")

long_interview_short_interview <- c(`-2` = "valid data", `1` = "long interview", `2` = "short interview")

long_interview_short_interview_2 <- c(`-5` = "na, see G/HRMCH", `1` = "long interview", `2` = "short interview")

long_interview_short_interview_3 <- c(`-2` = "na, see I/JRMCH", `1` = "long interview", `2` = "short interview")

male_female <- c(`-1` = "unknown", `1` = "male", `2` = "female")

male_respondent_na_asked <- c(`-2` = "male respondent", `-1` = "na, asked")

man_woman <- c(`1` = "man", `2` = "woman")

mary_sophia_emily_john <- c(`1` = "Mary", `2` = "Sophia", `3` = "Emily", `4` = "John")

mary_sophia_emily_john_2 <- c(`1` = "mary", `2` = "sophia", `3` = "emily", `4` = "john")

mentioned_not_mentioned <- c(`-1` = "all 3 missing", `1` = "mentioned", `2` = "not mentioned")

mentioned_not_mentioned_2 <- c(`-1` = "missing", `1` = "mentioned", `2` = "not mentioned")

microgramme_milligramme_gramme <- c(
  `-2` = "na, see D/E/B/FM#MED",
  `-1` = "na, asked",
  `1` = "microgramme",
  `2` = "milligramme",
  `3` = "gramme",
  `4` = "other measurement / milliliter",
  `5` = "unit per ml",
  `6` = "percentage"
)

microgramme_milligramme_gramme_milliliter <- c(
  `-2` = "na, see jmDsup/jmMVsup",
  `-1` = "na, asked",
  `1` = "microgramme",
  `2` = "milligramme",
  `3` = "gramme",
  `4` = "milliliter",
  `5` = "unit per milliliter",
  `6` = "percentage"
)

microgramme_milligramme_gramme_milliliter_2 <- c(
  `-2` = "na, see IM#SUP",
  `-1` = "na, asked",
  `1` = "microgramme",
  `2` = "milligramme",
  `3` = "gramme",
  `4` = "milliliter",
  `5` = "unit per milliliter",
  `6` = "percentage"
)

microgramme_milligramme_gramme_milliliter_unit_per_ml <- c(
  `-2` = "na, see B/B/I/J/KM#MED",
  `-1` = "na, asked",
  `1` = "microgramme",
  `2` = "milligramme",
  `3` = "gramme",
  `4` = "milliliter",
  `5` = "unit per ml",
  `6` = "percentage"
)

microgramme_milligramme_gramme_other_measurement <- c(
  `-2` = "na, see D/E/B/FM#MED",
  `-1` = "na, asked",
  `1` = "microgramme",
  `2` = "milligramme",
  `3` = "gramme",
  `4` = "other measurement"
)

microgramme_milligramme_gramme_other_measurement_2 <- c(
  `-2` = "na, see G/HM#MED",
  `-1` = "na, asked",
  `1` = "microgramme",
  `2` = "milligramme",
  `3` = "gramme",
  `4` = "other measurement"
)

missing_network_identified_age_0_17 <- c(
  `-5` = "missing network",
  `-4` = "identified;age 0-17",
  `-3` = "not identified;age 0-17",
  `-2` = "not identified;interview/SYS/RCF addition",
  `-1` = "not identified"
)

monastery_institution_unknown <- c(`-3` = "monastery", `-2` = "institution", `-1` = "unknown")

more_daily_exercise_stairs <- c(`10` = "more daily exercise (stairs)")

more_exercise_sports <- c(`9` = "more exercise (sports)")

more_smoking <- c(`11` = "more smoking")

morning_7_12_hour_afternoon_12_18_hour <- c(
  `-4` = "no valid data",
  `-2` = "no answer, skipped",
  `-1` = "no answer, asked",
  `1` = "morning 7-12 hour",
  `2` = "afternoon 12-18 hour",
  `3` = "evening 18-24 hour",
  `4` = "night 0-7 hour"
)

most_of_the_day_a_few_times_a_day_a_few_times_a_week <- c(
  `-2` = "na, see I/J/KMSMOKEECIG",
  `1` = "most of the day",
  `2` = "a few times a day",
  `3` = "a few times a week",
  `4` = "a few times a month",
  `5` = "a few times a year"
)

most_of_the_day_a_few_times_a_day_a_few_times_a_week_2 <- c(
  `-2` = "na, see I/J/KMSMOKEECIGP",
  `-1` = "na, asked",
  `1` = "most of the day",
  `2` = "a few times a day",
  `3` = "a few times a week",
  `4` = "a few times a month",
  `5` = "a few times a year"
)

much_better_a_little_better <- c(
  `-5` = "na, interview terminated",
  `-1` = "na, asked",
  `1` = "much better",
  `2` = "a little better",
  `3` = "do not know/just as good as other",
  `4` = "a little worse",
  `5` = "much worse"
)

much_better_a_little_better_do_not_know_just_as_good <- c(
  `-5` = "na, interview terminated",
  `-1` = "na, asked",
  `1` = "much better",
  `2` = "a little better",
  `3` = "do not know/just as good",
  `4` = "a little worse",
  `5` = "much worse"
)

much_better_a_little_better_do_not_know_just_as_good_2 <- c(
  `-5` = "not available, interview terminated",
  `-1` = "not available, asked",
  `1` = "much better",
  `2` = "a little better",
  `3` = "do not know/just as good",
  `4` = "a little worse",
  `5` = "much worse"
)

much_better_better_just_as_good_worse_much_worse <- c(
  `-1` = "no answer",
  `1` = "much better",
  `2` = "better",
  `3` = "just as good",
  `4` = "worse",
  `5` = "much worse"
)

much_better_better_just_as_good_worse_much_worse_2 <- c(
  `-1` = "not available",
  `1` = "much better",
  `2` = "better",
  `3` = "just as good",
  `4` = "worse",
  `5` = "much worse"
)

much_greater_greater_smaller_less_much_smaller <- c(
  `-1` = "no answer",
  `1` = "much greater",
  `2` = "greater",
  `3` = "smaller",
  `4` = "less",
  `5` = "much smaller"
)

much_less_active_less_active_just_as_active_more_active <- c(
  `-1` = "no answer",
  `1` = "much less active",
  `2` = "less active",
  `3` = "just as active",
  `4` = "more active",
  `5` = "much more active"
)

much_less_smoothly_less_smoothly_just_as_smoothly <- c(
  `-1` = "no answer",
  `1` = "much less smoothly",
  `2` = "less smoothly",
  `3` = "just as smoothly",
  `4` = "more smoothly",
  `5` = "much more smoothly"
)

much_less_strong_less_strong_just_as_strong_stronger <- c(
  `-1` = "no answer",
  `1` = "much less strong",
  `2` = "less strong",
  `3` = "just as strong",
  `4` = "stronger",
  `5` = "much stronger"
)

much_more_easy_more_easy_just_as_easy_more_difficult <- c(
  `-1` = "no answer",
  `1` = "much more easy",
  `2` = "more easy",
  `3` = "just as easy",
  `4` = "more difficult",
  `5` = "much more difficult"
)

much_more_flexible_more_flexible_just_as_flexible <- c(
  `-1` = "no answer",
  `1` = "much more flexible",
  `2` = "more flexible",
  `3` = "just as flexible",
  `4` = "less flexible",
  `5` = "much less flexible"
)

much_more_satisfied_more_satisfied_equally_satisfied <- c(
  `-1` = "no answer",
  `1` = "much more satisfied",
  `2` = "more satisfied",
  `3` = "equally satisfied",
  `4` = "less dissatisfied",
  `5` = "much less satisfied"
)

much_slower_slower_just_as_fast_faster_much_faster <- c(
  `-1` = "no answer",
  `1` = "much slower",
  `2` = "slower",
  `3` = "just as fast",
  `4` = "faster",
  `5` = "much faster"
)

must_rely_on_informal_network <- c(
  `-2` = "na, routing",
  `-1` = "na, asked",
  `1` = "must rely on informal network",
  `2` = "need for help not strong enough",
  `3` = "other reason"
)

na <- c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GJOB4", `-1` = "na, asked", `98` = "NA")

na_2 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `98` = "NA"
)

na_asked <- c(`-1` = "na, asked")

na_for_thrombosis_na_see_d_e_b_fm_med_na_asked <- c(`-3` = "na, for thrombosis", `-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked")

na_for_thrombosis_na_see_g_h_b_b_i_j_km_med_na_asked <- c(`-3` = "na, for thrombosis", `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked")

na_interview_terminated <- c(`-5` = "na, interview terminated")

na_no_measurement_na_see_c_d_e_b_f_g_h_b_b_i_j_kwalk03 <- c(
  `-6` = "na, no measurement",
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
  `-1` = "no (valid) answer"
)

na_no_measurement_na_see_c_d_e_b_f_gwalk03 <- c(`-6` = "na, no measurement", `-2` = "na, see C/D/E/B/F/GWALK03", `-1` = "no (valid) answer")

na_no_measurement_na_see_h_b_b_i_jwalk03 <- c(`-6` = "na, no measurement", `-2` = "na, see H/B/B/I/JWALK03", `-1` = "no (valid) answer")

na_no_measurement_na_wrong_skip <- c(
  `-6` = "na, no measurement",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
  `-1` = "na, asked"
)

na_no_measurement_na_wrong_skip_2 <- c(
  `-6` = "na, no measurement",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
  `-1` = "no (valid) answer"
)

na_no_measurement_na_wrong_skip_3 <- c(
  `-6` = "na, no measurement",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG5",
  `-1` = "no (valid) answer"
)

na_no_measurement_na_wrong_skip_4 <- c(
  `-6` = "na, no measurement",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
  `-1` = "na, asked"
)

na_no_measuring_na_wrong_skip_na_see_bchair4_na_asked <- c(
  `-6` = "na, no measuring",
  `-3` = "na, wrong skip",
  `-2` = "na, see BCHAIR4",
  `-1` = "na, asked"
)

na_no_measuring_na_wrong_skip_na_see_bwalk03_na_asked <- c(
  `-6` = "na, no measuring",
  `-3` = "na, wrong skip",
  `-2` = "na, see BWALK03",
  `-1` = "na, asked"
)

na_no_second_corticosteroid_na_asked <- c(`-2` = "na, no second corticosteroid", `-1` = "na, asked")

na_not_living_independently_na_wrong_skip <- c(
  `-4` = "na, not living independently",
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KHELPR",
  `-1` = "na, asked"
)

na_routing_na_asked <- c(`-2` = "na, routing", `-1` = "na, asked")

na_section_not_done <- c(`-3` = "na, section not done")

na_section_not_done_na_asked <- c(`-3` = "na, section not done", `-1` = "na, asked")

na_see <- c(`-2` = "na, see")

na_see_247_rcf_sys_addition_deleted_by_interviewer <- c(`-6` = "NA: see 247", `-3` = "RCF/SYS addition", `-1` = "deleted by Interviewer")

na_see_247_rcf_sys_addition_missing <- c(
  `-6` = "NA: see 247",
  `-3` = "RCF/SYS addition",
  `-1` = "missing",
  `0` = NA_character_,
  `59` = NA_character_,
  `99` = NA_character_
)

na_see_b_fqhhacqu_na_asked <- c(`-2` = "na, see b/fqhhacqu", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqhhbrsi_na_asked <- c(`-2` = "na, see b/fqhhbrsi", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqhhchin_na_asked <- c(`-2` = "na, see b/fqhhchin", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_)

na_see_b_fqhhgrch_na_asked <- c(`-2` = "na, see b/fqhhgrch", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqhhneig_na_asked <- c(`-2` = "na, see b/fqhhneig", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqhhotfa_na_asked <- c(`-2` = "na, see b/fqhhotfa", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqhhothn_na_asked <- c(`-2` = "na, see b/fqhhothn", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqhhparn_na_asked <- c(`-2` = "na, see b/fqhhparn", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_)

na_see_b_fqhhpart_na_asked <- c(`-2` = "na, see b/fqhhpart", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_)

na_see_b_fqphacqu_na_asked <- c(`-2` = "na, see b/fqphacqu", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqphbrsi_na_asked <- c(`-2` = "na, see b/fqphbrsi", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqphchin_na_asked <- c(`-2` = "na, see b/fqphchin", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqphchir_na_asked <- c(`-2` = "na, see b/fqphchir", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqphgrch_na_asked <- c(`-2` = "na, see b/fqphgrch", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqphneig_na_asked <- c(`-2` = "na, see b/fqphneig", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqphotfa_na_asked <- c(`-2` = "na, see b/fqphotfa", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqphothn_na_asked <- c(`-2` = "na, see b/fqphothn", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqphothr_na_asked <- c(`-2` = "na, see b/fqphothr", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqphparn_na_asked <- c(`-2` = "na, see b/fqphparn", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqphparr_na_asked <- c(`-2` = "na, see b/fqphparr", `-1` = "na, asked", `168` = NA_character_)

na_see_b_fqphpart_na_asked <- c(`-2` = "na, see b/fqphpart", `-1` = "na, asked", `168` = NA_character_)

na_see_bdisabl_na_asked <- c(`-2` = "na, see BDISABL", `-1` = "na, asked")

na_see_bm_med_na_asked <- c(`-2` = "na, see BM#MED", `-1` = "na, asked")

na_see_bmalcuse_no_answer_asked <- c(`-2` = "na, see BMALCUSE", `-1` = "no answer, asked")

na_see_bmbot1_na_asked <- c(`-2` = "na, see BMBOT1#", `-1` = "na, asked")

na_see_bmbot_na_asked <- c(`-2` = "na, see BMBOT#", `-1` = "na, asked")

na_see_bmhippl_na_asked <- c(`-2` = "na, see BMHIPPL", `-1` = "na, asked")

na_see_bmhippr_na_asked <- c(`-2` = "na, see BMHIPPR", `-1` = "na, asked")

na_see_bmmed_r_does_not_know <- c(`-2` = "na, see BMMED", `-1` = "R does not know")

na_see_bmmeno63_na_asked <- c(`-2` = "na, see BMMENO63", `-1` = "na, asked")

na_see_bmmsevrs_na_no_valid_data_interview_terminated <- c(
  `-5` = "na, see BMMSEVRS",
  `-4` = "na, no valid data",
  `-3` = "interview terminated",
  `-2` = "no scale (too many missing)",
  `1` = NA_character_,
  `30` = NA_character_
)

na_see_bmwalkaid1_na_asked <- c(`-2` = "na, see BMWALKAID1", `-1` = "na, asked")

na_see_bmwalkaid2_na_asked <- c(`-2` = "na, see BMWALKAID2", `-1` = "na, asked")

na_see_bmwalkaid3_na_asked <- c(`-2` = "na, see BMWALKAID3", `-1` = "na, asked")

na_see_bmwalkaid4_na_asked <- c(`-2` = "na, see BMWALKAID4", `-1` = "na, asked")

na_see_bmwalkaid5_na_asked <- c(`-2` = "na, see BMWALKAID5", `-1` = "na, asked")

na_see_bpdisabl_na_asked <- c(`-2` = "na, see BPDISABL", `-1` = "na, asked")

na_see_bpets <- c(`-2` = "na, see BPETS")

na_see_brm161 <- c(`-2` = "na, see BRM161")

na_see_brm161_no_valid_data <- c(`-2` = "na, see BRM161", `-1` = "no valid data")

na_see_brmalc_in_lasab228 <- c(`-2` = "na, see BRMALC in LASAB228")

na_see_brmcrav <- c(`-2` = "na, see BRMCRAV")

na_see_c_d_e_bmweightch_na_asked <- c(`-2` = "na, see C/D/E/BMWEIGHTCH", `-1` = "na, asked")

na_see_c_d_e_f_gdisabl_na_asked <- c(`-2` = "na, see C/D/E/F/GDISABL", `-1` = "na, asked")

na_see_c_d_e_f_ghindep_na_wrong_skip <- c(
  `-5` = "na, see C/D/E/F/GHINDEP",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GMOVED",
  `-1` = "na, asked"
)

na_see_c_d_e_f_gjobc_na_asked <- c(`-2` = "na, see C/D/E/F/GJOBC", `-1` = "na, asked")

na_see_c_d_eincf <- c(`-2` = "na, see C/D/EINCF")

na_see_c_drmcrav_in_lasac_d_e222 <- c(`-2` = "na, see C/DRMCRAV in LASAC/D/E222")

na_see_cm_med_na_asked <- c(`-2` = "na, see CM#MED", `-1` = "na, asked")

na_see_crm151 <- c(`-2` = "na, see CRM151")

na_see_d_e_b_fm_med_na_asked <- c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked")

na_see_d_em_med_na_asked <- c(`-2` = "na, see D/EM#MED", `-1` = "na, asked")

na_see_d_embot1 <- c(`-2` = "na, see D/EMBOT1")

na_see_d_emhippro_na_asked <- c(`-2` = "na, see D/EMHIPPRO", `-1` = "na, asked")

na_see_d_epets <- c(`-2` = "na, see D/EPETS")

na_see_dm_med_na_asked <- c(`-2` = "na, see DM#MED", `-1` = "na, asked")

na_see_dmfallc_na_asked <- c(`-2` = "na, see DMFALLC", `-1` = "na, asked")

na_see_dmfallly_na_asked <- c(`-2` = "na, see DMFALLLY", `-1` = "na, asked")

na_see_dmwalkaid1_na_asked <- c(`-2` = "na, see DMWALKAID1", `-1` = "na, asked")

na_see_dmwalkaid2_na_asked <- c(`-2` = "na, see DMWALKAID2", `-1` = "na, asked")

na_see_dmwalkaid3_na_asked <- c(`-2` = "na, see DMWALKAID3", `-1` = "na, asked")

na_see_dmwalkaid4_na_asked <- c(`-2` = "na, see DMWALKAID4", `-1` = "na, asked")

na_see_dmwalkaid5_na_asked <- c(`-2` = "na, see DMWALKAID5", `-1` = "na, asked")

na_see_e_b_f_g_hsmokeyn_smokebef_na_asked <- c(`-2` = "na, see E/B/F/G/HSMOKEYN /SMOKEBEF", `-1` = "na, asked")

na_see_e_b_f_gmsmokecig_na_asked <- c(`-2` = "na, see E/B/F/GMSMOKECIG", `-1` = "na, asked")

na_see_e_f_gmrmcrav_in_lasaf_g222 <- c(`-2` = "na, see E/F/GMRMCRAV in LASAF/G222")

na_see_f_g_h_b_i_j_knupers <- c(`-2` = "na, see F/G/H/B/I/J/KNUPERS")

na_see_f_g_h_b_i_jpts <- c(`-2` = "na, see F/G/H/B/I/JPTS")

na_see_f_gmweightch_na_asked <- c(`-2` = "na, see F/GMWEIGHTCH", `-1` = "na, asked")

na_see_fmbot1_na_asked <- c(`-2` = "na, see FMBOT1", `-1` = "na, asked")

na_see_fmhippro_na_asked <- c(`-2` = "na, see FMHIPPRO", `-1` = "na, asked")

na_see_frm161 <- c(`-2` = "na, see FRM161")

na_see_frm161_na_asked <- c(`-2` = "na, see FRM161", `-1` = "na, asked")

na_see_g_h_b_b_i_j_km_med_na_asked <- c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked")

na_see_g_h_b_i_j_kmmeduse_na_asked <- c(`-2` = "na, see G/H/B/I/J/KMMEDUSE", `-1` = "na, asked")

na_see_g_h_i_j_klifeli_na_asked <- c(`-2` = "na, see G/H/I/J/KLIFELI", `-1` = "na, asked")

na_see_g_hqhhacqu_na_asked <- c(`-2` = "na, see g/hqhhacqu", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqhhacqu_na_asked_2 <- c(`-2` = "na, see g/hqhhacqu", `-1` = "na, asked")

na_see_g_hqhhbrsi_na_asked <- c(`-2` = "na, see g/hqhhbrsi", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqhhbrsi_na_asked_2 <- c(`-2` = "na, see g/hqhhbrsi", `-1` = "na, asked")

na_see_g_hqhhchin_na_asked <- c(`-2` = "na, see g/hqhhchin", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_)

na_see_g_hqhhchin_na_asked_2 <- c(`-2` = "na, see g/hqhhchin", `-1` = "na, asked")

na_see_g_hqhhgrch_na_asked <- c(`-2` = "na, see g/hqhhgrch", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqhhgrch_na_asked_2 <- c(`-2` = "na, see g/hqhhgrch", `-1` = "na, asked")

na_see_g_hqhhneig_na_asked <- c(`-2` = "na, see g/hqhhneig", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqhhneig_na_asked_2 <- c(`-2` = "na, see g/hqhhneig", `-1` = "na, asked")

na_see_g_hqhhotfa_na_asked <- c(`-2` = "na, see g/hqhhotfa", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqhhotfa_na_asked_2 <- c(`-2` = "na, see g/hqhhotfa", `-1` = "na, asked")

na_see_g_hqhhothn_na_asked <- c(`-2` = "na, see g/hqhhothn", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqhhothn_na_asked_2 <- c(`-2` = "na, see g/hqhhothn", `-1` = "na, asked")

na_see_g_hqhhparn_na_asked <- c(`-2` = "na, see g/hqhhparn", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_)

na_see_g_hqhhparn_na_asked_2 <- c(`-2` = "na, see g/hqhhparn", `-1` = "na, asked")

na_see_g_hqhhpart_na_asked <- c(`-2` = "na, see g/hqhhpart", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_)

na_see_g_hqhhpart_na_asked_2 <- c(`-2` = "na, see g/hqhhpart", `-1` = "na, asked")

na_see_g_hqphacqu_na_asked <- c(`-2` = "na, see g/hqphacqu", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqphacqu_na_asked_2 <- c(`-2` = "na, see g/hqphacqu", `-1` = "na, asked")

na_see_g_hqphbrsi_na_asked <- c(`-2` = "na, see g/hqphbrsi", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqphbrsi_na_asked_2 <- c(`-2` = "na, see g/hqphbrsi", `-1` = "na, asked")

na_see_g_hqphchin_na_asked <- c(`-2` = "na, see g/hqphchin", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqphchin_na_asked_2 <- c(`-2` = "na, see g/hqphchin", `-1` = "na, asked")

na_see_g_hqphchir_na_asked <- c(`-2` = "na, see g/hqphchir", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqphchir_na_asked_2 <- c(`-2` = "na, see g/hqphchir", `-1` = "na, asked")

na_see_g_hqphgrch_na_asked <- c(`-2` = "na, see g/hqphgrch", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqphgrch_na_asked_2 <- c(`-2` = "na, see g/hqphgrch", `-1` = "na, asked")

na_see_g_hqphneig_na_asked <- c(`-2` = "na, see g/hqphneig", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqphneig_na_asked_2 <- c(`-2` = "na, see g/hqphneig", `-1` = "na, asked")

na_see_g_hqphotfa_na_asked <- c(`-2` = "na, see g/hqphotfa", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqphotfa_na_asked_2 <- c(`-2` = "na, see g/hqphotfa", `-1` = "na, asked")

na_see_g_hqphothn_na_asked <- c(`-2` = "na, see g/hqphothn", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqphothn_na_asked_2 <- c(`-2` = "na, see g/hqphothn", `-1` = "na, asked")

na_see_g_hqphothr_na_asked <- c(`-2` = "na, see g/hqphothr", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqphothr_na_asked_2 <- c(`-2` = "na, see g/hqphothr", `-1` = "na, asked")

na_see_g_hqphparn_na_asked <- c(`-2` = "na, see g/hqphparn", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqphparn_na_asked_2 <- c(`-2` = "na, see g/hqphparn", `-1` = "na, asked")

na_see_g_hqphparr_na_asked <- c(`-2` = "na, see g/hqphparr", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqphparr_na_asked_2 <- c(`-2` = "na, see g/hqphparr", `-1` = "na, asked")

na_see_g_hqphpart_na_asked <- c(`-2` = "na, see g/hqphpart", `-1` = "na, asked", `168` = NA_character_)

na_see_g_hqphpart_na_asked_2 <- c(`-2` = "na, see g/hqphpart", `-1` = "na, asked")

na_see_gmbot_na_asked <- c(`-2` = "na, see GMBOT#", `-1` = "na, asked")

na_see_gmhippro_na_asked <- c(`-2` = "na, see GMHIPPRO", `-1` = "na, asked")

na_see_grm161 <- c(`-2` = "na, see GRM161")

na_see_grm161_na_asked <- c(`-2` = "na, see GRM161", `-1` = "na, asked")

na_see_h_b_i_jrm161 <- c(`-2` = "na, see H/B/I/JRM161")

na_see_h_b_i_jrm161_na_asked <- c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked")

na_see_h_b_imbot1 <- c(`-2` = "na, see H/B/IMBOT1")

na_see_h_b_imbot1_na_asked <- c(`-2` = "na, see H/B/IMBOT1#", `-1` = "na, asked")

na_see_h_b_imheight_na_asked <- c(`-2` = "na, see H/B/IMHEIGHT", `-1` = "na, asked")

na_see_h_b_imhippro_na_asked <- c(`-2` = "na, see H/B/IMHIPPRO", `-1` = "na, asked")

na_see_h_b_imweight_routing_na_asked <- c(`-2` = "na, see H/B/IMWEIGHT/ routing", `-1` = "na, asked")

na_see_h_bmweightch_na_asked <- c(`-2` = "na, see H/BMWEIGHTCH", `-1` = "na, asked")

na_see_h_brm171_na_asked <- c(`-2` = "na, see H/BRM171", `-1` = "na, asked")

na_see_h_imknepro_na_asked <- c(`-2` = "na, see H/IMKNEPRO", `-1` = "na, asked")

na_see_h_iqmus1_h_iqmus3_no_answer <- c(`-2` = "na, see H/IQMUS1 & H/IQMUS3", `-1` = "no answer")

na_see_i_j_kmsmokebef_na_asked <- c(`-2` = "na, see I/J/KMSMOKEBEF", `-1` = "na, asked")

na_see_i_j_kmsmokeyn_na_asked <- c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked")

na_see_i_j_kqhhacqu_na_asked <- c(`-2` = "na, see I/J/KQHHACQU", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqhhbrsi_na_asked <- c(`-2` = "na, see I/J/KQHHBRSI", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqhhchin_na_asked <- c(`-2` = "na, see I/J/KQHHCHIN", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_)

na_see_i_j_kqhhgrch_na_asked <- c(`-2` = "na, see I/J/KQHHGRCH", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqhhneig_na_asked <- c(`-2` = "na, see I/J/KQHHNEIG", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqhhotfa_na_asked <- c(`-2` = "na, see I/J/KQHHOTFA", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqhhothn_na_asked <- c(`-2` = "na, see I/J/KQHHOTHN", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqhhparn_na_asked <- c(`-2` = "na, see I/J/KQHHPARN", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_)

na_see_i_j_kqhhpart_na_asked <- c(`-2` = "na, see I/J/KQHHPART", `-1` = "na, asked", `0` = NA_character_, `168` = NA_character_)

na_see_i_j_kqphacqu_na_asked <- c(`-2` = "na, see I/J/KQPHACQU", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqphbrsi_na_asked <- c(`-2` = "na, see I/J/KQPHBRSI", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqphchin_na_asked <- c(`-2` = "na, see I/J/KQPHCHIN", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqphchir_na_asked <- c(`-2` = "na, see I/J/KQPHCHIR", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqphgrch_na_asked <- c(`-2` = "na, see I/J/KQPHGRCH", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqphneig_na_asked <- c(`-2` = "na, see I/J/KQPHNEIG", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqphotfa_na_asked <- c(`-2` = "na, see I/J/KQPHOTFA", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqphothn_na_asked <- c(`-2` = "na, see I/J/KQPHOTHN", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqphothr_na_asked <- c(`-2` = "na, see I/J/KQPHOTHR", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqphparn_na_asked <- c(`-2` = "na, see I/J/KQPHPARN", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqphparr_na_asked <- c(`-2` = "na, see I/J/KQPHPARR", `-1` = "na, asked", `168` = NA_character_)

na_see_i_j_kqphpart_na_asked <- c(`-2` = "na, see I/J/KQPHPART", `-1` = "na, asked", `168` = NA_character_)

na_see_i_jmweightch_na_asked <- c(`-2` = "na, see I/JMWEIGHTCH", `-1` = "na, asked")

na_see_im_sup_na_asked <- c(`-2` = "na, see IM#SUP", `-1` = "na, asked")

na_see_iqdona2_na_asked <- c(`-2` = "na, see IQDONA2", `-1` = "na, asked")

na_see_j_kmsens7a_na_asked <- c(`-2` = "na, see J/KMSENS7A", `-1` = "na, asked")

na_see_jmbot_na_asked <- c(`-2` = "na, see JMBOT#", `-1` = "na, asked")

na_see_jmdsup_jmmvsup_na_asked <- c(`-2` = "na, see jmDsup/jmMVsup", `-1` = "na, asked")

na_see_jmfallfrac_na_asked <- c(`-2` = "na, see JMFALLFRAC", `-1` = "na, asked")

na_see_jmhippro_na_asked <- c(`-2` = "na, see JMHIPPRO", `-1` = "na, asked")

na_see_jmi24ca_na_asked <- c(`-2` = "na, see JMI24CA", `-1` = "na, asked")

na_see_jmidaca_na_asked <- c(`-2` = "na, see JMIDACA", `-1` = "na, asked")

na_see_jmiguia_na_asked <- c(`-2` = "na, see JMIGUIA", `-1` = "na, asked")

na_see_jmihhaa_na_asked <- c(`-2` = "na, see JMIHHAA", `-1` = "na, asked")

na_see_jmintca_na_asked <- c(`-2` = "na, see JMINTCA", `-1` = "na, asked")

na_see_jminura_na_asked <- c(`-2` = "na, see JMINURA", `-1` = "na, asked")

na_see_jmiotha_na_asked <- c(`-2` = "na, see JMIOTHA", `-1` = "na, asked")

na_see_jmipca_na_asked <- c(`-2` = "na, see JMIPCA", `-1` = "na, asked")

na_see_jmknepro_na_asked <- c(`-2` = "na, see JMKNEPRO", `-1` = "na, asked")

na_see_jqmusl_no_answer <- c(`-2` = "na, see JQMUSL", `-1` = "no answer")

na_see_jqmussln_no_answer <- c(`-2` = "na, see JQMUSSLN", `-1` = "no answer")

na_see_kmbot_na_asked <- c(`-2` = "na, see KMBOT#", `-1` = "na, asked")

na_see_kmfallfrac_na_asked <- c(`-2` = "na, see KMFALLFRAC", `-1` = "na, asked")

na_see_kmfallphcn <- c(`-2` = "na, see KMFALLPHCN")

na_see_kmfallphcn_no_yes <- c(`-1` = "na, asked", `0` = "na, see KMFALLPHCN", `1` = "no", `2` = "yes")

na_see_kmhippro_na_asked <- c(`-2` = "na, see KMHIPPRO", `-1` = "na, asked")

na_see_kmidaca_na_asked <- c(`-2` = "na, see KMIDACA", `-1` = "na, asked")

na_see_kmiguia_na_asked <- c(`-2` = "na, see KMIGUIA", `-1` = "na, asked")

na_see_kmihhaa_na_asked <- c(`-2` = "na, see KMIHHAA", `-1` = "na, asked")

na_see_kminura_na_asked <- c(`-2` = "na, see KMINURA", `-1` = "na, asked")

na_see_kmipca_na_asked <- c(`-2` = "na, see KMIPCA", `-1` = "na, asked")

na_see_kmissca_na_asked <- c(`-2` = "na, see KMISSCA", `-1` = "na, asked")

na_see_kmknepro_na_asked <- c(`-2` = "na, see KMKNEPRO", `-1` = "na, asked")

na_short_version_na_wrong_skip_na_see_bmoved_na_asked <- c(
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "na, see BMOVED",
  `-1` = "na, asked"
)

na_wrong_skip_male_respondent_na_asked <- c(`-3` = "na, wrong skip", `-2` = "male respondent", `-1` = "na, asked")

na_wrong_skip_na_see_b_c_d_e_b_f_g_h_b_i_jlphya03 <- c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03", `-1` = "na, asked")

na_wrong_skip_na_see_b_c_d_e_b_f_g_h_b_i_jlphya07 <- c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07", `-1` = "na, asked")

na_wrong_skip_na_see_b_c_d_e_b_f_g_h_b_i_jlphya11 <- c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11", `-1` = "na, asked")

na_wrong_skip_na_see_b_c_d_e_b_f_g_h_b_i_jlphya17 <- c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17", `-1` = "na, asked")

na_wrong_skip_na_see_b_c_d_e_b_f_g_h_b_i_jlphya21 <- c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21", `-1` = "na, asked")

na_wrong_skip_na_see_b_c_d_e_b_f_g_h_b_i_jlphya23 <- c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23", `-1` = "na, asked")

na_wrong_skip_na_see_b_c_d_e_b_f_g_h_b_i_jlphya25 <- c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25", `-1` = "na, asked")

na_wrong_skip_na_see_b_c_d_e_b_f_g_h_b_i_jlphya27 <- c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27", `-1` = "na, asked")

na_wrong_skip_na_see_b_c_d_e_b_f_g_h_b_i_jlphya32 <- c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32", `-1` = "na, asked")

na_wrong_skip_na_see_b_c_d_e_b_f_g_h_b_i_jlphya36 <- c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked")

na_wrong_skip_na_see_b_c_d_e_b_f_g_h_blphya15_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15", `-1` = "na, asked")

na_wrong_skip_na_see_b_c_d_e_b_f_glphya29_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/GLPHYA29", `-1` = "na, asked")

na_wrong_skip_na_see_b_frmso_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see B/FRMSO", `-1` = "na, asked")

na_wrong_skip_na_see_b_fsocp28_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see B/FSOCP28", `-1` = "na, asked")

na_wrong_skip_na_see_b_fsocp31_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see B/FSOCP31", `-1` = "na, asked")

na_wrong_skip_na_see_b_fsocp72_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see B/FSOCP72", `-1` = "na, asked")

na_wrong_skip_na_see_b_fsocp78_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see B/FSOCP78", `-1` = "na, asked")

na_wrong_skip_na_see_bartvei1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BARTVEI1", `-1` = "na, asked")

na_wrong_skip_na_see_bartvei5_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BARTVEI5", `-1` = "na, asked")

na_wrong_skip_na_see_bcancer1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked")

na_wrong_skip_na_see_bcara01_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BCARA01", `-1` = "na, asked")

na_wrong_skip_na_see_bcva02_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BCVA02", `-1` = "na, asked")

na_wrong_skip_na_see_bcva02b_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BCVA02B", `-1` = "na, asked")

na_wrong_skip_na_see_bdiabe01_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked")

na_wrong_skip_na_see_bdiabe07_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BDIABE07", `-1` = "na, asked")

na_wrong_skip_na_see_bhart01_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked")

na_wrong_skip_na_see_bhart06_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BHART06", `-1` = "na, asked")

na_wrong_skip_na_see_bhbd1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BHBD1", `-1` = "na, asked")

na_wrong_skip_na_see_bhindep_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked")

na_wrong_skip_na_see_bincdecl_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BINCDECL", `-1` = "na, asked")

na_wrong_skip_na_see_bincon1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked")

na_wrong_skip_na_see_bjob1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked")

na_wrong_skip_na_see_bjob1_na_asked_2 <- c(`-3` = "na wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked")

na_wrong_skip_na_see_bjob4_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BJOB4", `-1` = "na, asked")

na_wrong_skip_na_see_bjobl1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BJOBL1", `-1` = "na, asked")

na_wrong_skip_na_see_bjobl1_na_asked_2 <- c(`-3` = "na wrong skip", `-2` = "na, see BJOBL1", `-1` = "na, asked")

na_wrong_skip_na_see_bjobl4_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BJOBL4", `-1` = "na, asked")

na_wrong_skip_na_see_blphya07_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BLPHYA07", `-1` = "na, asked")

na_wrong_skip_na_see_blphya11_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BLPHYA11", `-1` = "na, asked")

na_wrong_skip_na_see_blphya21_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BLPHYA21", `-1` = "na, asked")

na_wrong_skip_na_see_bmbot1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BMBOT1#", `-1` = "na, asked")

na_wrong_skip_na_see_bothsi01_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BOTHSI01", `-1` = "na, asked")

na_wrong_skip_na_see_bothsi07_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BOTHSI07", `-1` = "na, asked")

na_wrong_skip_na_see_bpjob1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked")

na_wrong_skip_na_see_bpjob1_na_asked_2 <- c(`-3` = "na wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked")

na_wrong_skip_na_see_bpjob4_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BPJOB4", `-1` = "na, asked")

na_wrong_skip_na_see_bpjobl1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BPJOBL1", `-1` = "na, asked")

na_wrong_skip_na_see_bpjobl4_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BPJOBL4", `-1` = "na, asked")

na_wrong_skip_na_see_brheum01_02_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BRHEUM01&02", `-1` = "na, asked")

na_wrong_skip_na_see_brm161_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see BRM161", `-1` = "na, asked")

na_wrong_skip_na_see_c_d_e_f_g_h_b_b_i_j_ktandem1 <- c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KTANDEM1", `-1` = "na, asked")

na_wrong_skip_na_see_c_d_e_f_gjob1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GJOB1", `-1` = "na, asked")

na_wrong_skip_na_see_c_d_e_f_gjob4_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GJOB4", `-1` = "na, asked")

na_wrong_skip_na_see_c_d_e_f_gjobc_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GJOBC", `-1` = "na, asked")

na_wrong_skip_na_see_c_d_e_f_gmoved_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GMOVED", `-1` = "na, asked")

na_wrong_skip_na_see_c_dfallly <- c(`-3` = "na, wrong skip", `-2` = "na, see C/DFALLLY")

na_wrong_skip_na_see_c_dincdecl_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see C/DINCDECL", `-1` = "na, asked")

na_wrong_skip_na_see_c_dmheightp_no_valid_data <- c(`-3` = "na, wrong skip", `-2` = "na, see C/DMHEIGHTP", `-1` = "no valid data")

na_wrong_skip_na_see_c_drm161_no_valid_data <- c(`-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data")

na_wrong_skip_na_see_c_drm161_no_valid_data_2 <- c(`-3` = "na, wrong skip", `-2` = "na see C/DRM161", `-1` = "no valid data")

na_wrong_skip_na_see_c_drmso_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see C/DRMSO", `-1` = "na, asked")

na_wrong_skip_na_see_c_dsocp28_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see C/DSOCP28", `-1` = "na, asked")

na_wrong_skip_na_see_c_dsocp31_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see C/DSOCP31", `-1` = "na, asked")

na_wrong_skip_na_see_c_mweightp1_8_no_valid_data <- c(`-3` = "na, wrong skip", `-2` = "na, see C/MWEIGHTP1&8", `-1` = "no valid data")

na_wrong_skip_na_see_ccva02b_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see CCVA02B", `-1` = "na, asked")

na_wrong_skip_na_see_chart06_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see CHART06", `-1` = "na, asked")

na_wrong_skip_na_see_cm_med_no_valid_data <- c(`-3` = "na, wrong skip", `-2` = "na, see CM#MED", `-1` = "no valid data")

na_wrong_skip_na_see_cm_med_no_valid_data_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see CM#MED", `-1` = "no valid data / na, asked")

na_wrong_skip_na_see_cmbot1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see CMBOT1#", `-1` = "na, asked")

na_wrong_skip_na_see_cmbot8 <- c(`-3` = "na, wrong skip", `-2` = "na, see CMBOT8#")

na_wrong_skip_na_see_cmbot8_2 <- c(`-3` = "na, wrong skip", `-2` = "na, see CMBOT8")

na_wrong_skip_na_see_cmeyetes_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see CMEYETES", `-1` = "na, asked")

na_wrong_skip_na_see_cmeyetes_na_asked_no_measurement <- c(`-3` = "na, wrong skip", `-2` = "na, see CMEYETES", `-1` = "na, asked / no measurement")

na_wrong_skip_na_see_cmmeno09_r_does_not_know_age <- c(`-3` = "na, wrong skip", `-2` = "na, see CMMENO09", `-1` = "R does not know age")

na_wrong_skip_na_see_cmmeno82_r_does_not_know_age <- c(`-3` = "na, wrong skip", `-2` = "na, see CMMENO82", `-1` = "R does not know age")

na_wrong_skip_na_see_cmsmokeyn <- c(`-3` = "na, wrong skip", `-2` = "na, see CMSMOKEYN /")

na_wrong_skip_na_see_crm161_no_valid_data <- c(`-3` = "na, wrong skip", `-2` = "na, see CRM161", `-1` = "no valid data")

na_wrong_skip_na_see_d_e_f_g_hartvei1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HARTVEI1", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_g_hartvei5_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HARTVEI5", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_g_hcancer1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HCANCER1", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_g_hcara01_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HCARA01", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_g_hcva02b_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HCVA02B", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_g_hdiabe01_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HDIABE01", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_g_hdiabe07_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HDIABE07", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_g_hhart01_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HHART01", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_g_hhart06_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HHART06", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_g_hhbd1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HHBD1", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_g_hincon1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HINCON1", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_g_hothsi01_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HOTHSI01", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_g_hothsi07_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HOTHSI07", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_g_hrheum01_02_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HRHEUM01&02", `-1` = "na, asked")

na_wrong_skip_na_see_d_e_f_gcva02c_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/E/F/GCVA02C", `-1` = "na, asked")

na_wrong_skip_na_see_d_erm161_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see D/ERM161", `-1` = "na, asked")

na_wrong_skip_na_see_drm161_no_valid_data <- c(`-3` = "na, wrong skip", `-2` = "na, see DRM161", `-1` = "no valid data")

na_wrong_skip_na_see_erm161_no_valid_data <- c(`-3` = "na, wrong skip", `-2` = "na, see ERM161", `-1` = "no valid data")

na_wrong_skip_na_see_ermso_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see ERMSO", `-1` = "na, asked")

na_wrong_skip_na_see_frm161_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see FRM161", `-1` = "na, asked")

na_wrong_skip_na_see_g_h_i_j_kincdecl_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see G/H/I/J/KINCDECL", `-1` = "na, asked")

na_wrong_skip_na_see_grmso_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see GRMSO", `-1` = "na, asked")

na_wrong_skip_na_see_h_b_i_jrm161_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see H/B/I/JRM161", `-1` = "na, asked")

na_wrong_skip_na_see_h_b_irmso_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see H/B/IRMSO", `-1` = "na, asked")

na_wrong_skip_na_see_h_b_isocp14_26_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP14-26", `-1` = "na, asked")

na_wrong_skip_na_see_h_b_isocp28_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP28", `-1` = "na, asked")

na_wrong_skip_na_see_h_b_isocp31_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP31", `-1` = "na, asked")

na_wrong_skip_na_see_h_b_isocp72_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see H/B/ISOCP72", `-1` = "na, asked")

na_wrong_skip_na_see_hjobc_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see HJOBC", `-1` = "na, asked")

na_wrong_skip_na_see_hmoved_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see HMOVED", `-1` = "na, asked")

na_wrong_skip_na_see_hpjob1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see HPJOB1", `-1` = "na, asked")

na_wrong_skip_na_see_i_j_kmoved_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KMOVED", `-1` = "na, asked")

na_wrong_skip_na_see_i_j_kmsmokebef_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KMSMOKEBEF", `-1` = "na, asked")

na_wrong_skip_na_see_i_jdiabe01_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see I/JDIABE01", `-1` = "na, asked")

na_wrong_skip_na_see_i_jhbd1_i_jhbd1a1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see I/JHBD1 & I/JHBD1A1", `-1` = "na, asked")

na_wrong_skip_na_see_i_jothsi01_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see I/JOTHSI01", `-1` = "na, asked")

na_wrong_skip_na_see_i_jothsi07_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see I/JOTHSI07", `-1` = "na, asked")

na_wrong_skip_na_see_i_jrh10_1s_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see I/JRH10_1S", `-1` = "na, asked")

na_wrong_skip_na_see_i_jrh10_2s_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see I/JRH10_2S", `-1` = "na, asked")

na_wrong_skip_na_see_i_jrh10_3s_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see I/JRH10_3S", `-1` = "na, asked")

na_wrong_skip_na_see_i_jrheum10a2_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A2", `-1` = "na, asked")

na_wrong_skip_na_see_i_jrheum10a3_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A3", `-1` = "na, asked")

na_wrong_skip_na_see_i_jrheum10a_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A", `-1` = "na, asked")

na_wrong_skip_na_see_i_jrm161_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see I/JRM161", `-1` = "na, asked")

na_wrong_skip_na_see_iahelp12_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see IAHELP12", `-1` = "na, asked")

na_wrong_skip_na_see_icva02b <- c(`-3` = "na, wrong skip", `-2` = "na, see ICVA02B")

na_wrong_skip_na_see_icva02b_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see ICVA02B", `-1` = "na, asked")

na_wrong_skip_na_see_ihart06 <- c(`-3` = "na, wrong skip", `-2` = "na, see IHART06")

na_wrong_skip_na_see_ihart06_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see IHART06", `-1` = "na, asked")

na_wrong_skip_na_see_ijobc_s_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see IJOBC/S", `-1` = "na, asked")

na_wrong_skip_na_see_j_khelpr_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see J/KHELPR", `-1` = "na, asked")

na_wrong_skip_na_see_j_kphelp01_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see J/KPHELP01", `-1` = "na, asked")

na_wrong_skip_na_see_j_ktandem3_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see J/KTANDEM3", `-1` = "na, asked")

na_wrong_skip_na_see_jjobc_s_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see JJOBC/S", `-1` = "na, asked")

na_wrong_skip_na_see_jpjob1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see JPJOB1", `-1` = "na, asked")

na_wrong_skip_na_see_jretired_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see JRETIRED", `-1` = "na, asked")

na_wrong_skip_na_see_jrmso_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see JRMSO", `-1` = "na, asked")

na_wrong_skip_na_see_kjobc_s_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see KJOBC/S", `-1` = "na, asked")

na_wrong_skip_na_see_klidasdiag_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see klidasdiag", `-1` = "na, asked")

na_wrong_skip_na_see_kpjob1_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see KPJOB1", `-1` = "na, asked")

na_wrong_skip_na_see_kretired_na_asked <- c(`-3` = "na, wrong skip", `-2` = "na, see KRETIRED", `-1` = "na, asked")

never_1_2_times_3_times_or_more <- c(`-1` = "no answer", `1` = "never", `2` = "1-2 times", `3` = "3 times or more")

never_1_2_times_3_times_or_more_2 <- c(`-1` = "not available", `1` = "never", `2` = "1-2 times", `3` = "3 times or more")

never_1_3_times_a_month_1_3_times_a_week <- c(
  `-1` = "no answer",
  `1` = "never",
  `2` = "1-3 times a month",
  `3` = "1-3 times a week",
  `4` = "more than 3 times a week"
)

never_1_3_times_a_month_1_3_times_a_week_2 <- c(
  `-1` = "not available",
  `1` = "never",
  `2` = "1-3 times a month",
  `3` = "1-3 times a week",
  `4` = "more than 3 times a week"
)

never_almost_never_sometimes_often_very_often <- c(
  `-1` = "no answer",
  `0` = "never",
  `1` = "almost never",
  `2` = "sometimes",
  `3` = "often",
  `4` = "very often"
)

never_had_a_job_has_had_a_job <- c(`-1` = "na, asked", `1` = "never had a job", `2` = "has/had a job")

never_less_than_once_a_month_once_a_month <- c(
  `-1` = "na, asked",
  `1` = "never",
  `2` = "less than once a month",
  `3` = "once a month",
  `4` = "a few times a month",
  `5` = "once a week",
  `6` = "a few times a week",
  `7` = "once a day",
  `8` = "more than once a day"
)

never_less_than_once_a_month_once_a_month_2 <- c(
  `-2` = "na, see D/E/BRMGL",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "less than once a month",
  `3` = "once a month",
  `4` = "a few times a month",
  `5` = "once a week",
  `6` = "a few times a week",
  `7` = "once a day",
  `8` = "more than once a day"
)

never_less_than_once_a_month_once_a_month_3 <- c(
  `-2` = "na, see G/HRMGL",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "less than once a month",
  `3` = "once a month",
  `4` = "a few times a month",
  `5` = "once a week",
  `6` = "a few times a week",
  `7` = "once a day",
  `8` = "more than once a day"
)

never_once_a_year_or_less_a_few_times_a_year <- c(
  `-2` = "na, see D/E/BRELIG01",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "once a year or less",
  `3` = "a few times a year",
  `4` = "approx. once a month",
  `5` = "2 or 3 times a month",
  `6` = "once a week or more"
)

never_once_a_year_or_less_a_few_times_a_year_2 <- c(
  `-1` = "na, asked",
  `1` = "never",
  `2` = "once a year or less",
  `3` = "a few times a year",
  `4` = "approx. once a month",
  `5` = "2 or 3 times a month",
  `6` = "once a week or more"
)

never_once_a_year_or_less_a_few_times_a_year_3 <- c(
  `-2` = "na, see G/HRMGL",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "once a year or less",
  `3` = "a few times a year",
  `4` = "approx. once a month",
  `5` = "2 or 3 times a month",
  `6` = "once a week or more"
)

never_or_less_than_once_a_year_once_or_few_times_a_year <- c(
  `-4` = "no medical interview",
  `-3` = "not asked (interview terminated)",
  `-2` = "answer: not applicable",
  `-1` = "no answer",
  `1` = "never or less than once a year",
  `2` = "once or few times a year",
  `3` = "once or few times a month",
  `4` = "once or few times a week",
  `5` = "daily"
)

never_rarely_occasionally_rather_often_very_often <- c(
  `-1` = "no answer",
  `1` = "never",
  `2` = "rarely",
  `3` = "occasionally",
  `4` = "rather often",
  `5` = "very often"
)

never_rarely_occasionally_rather_often_very_often_2 <- c(
  `-2` = "na, see J/KQORH3",
  `-1` = "no answer",
  `1` = "never",
  `2` = "rarely",
  `3` = "occasionally",
  `4` = "rather often",
  `5` = "very often"
)

never_rarely_sometimes_often <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP78",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "rarely",
  `3` = "sometimes",
  `4` = "often"
)

never_rarely_sometimes_often_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see ESOCP78",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "rarely",
  `3` = "sometimes",
  `4` = "often"
)

never_rarely_sometimes_often_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see GSOCP78",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "rarely",
  `3` = "sometimes",
  `4` = "often"
)

never_rarely_sometimes_often_4 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "never",
  `2` = "rarely",
  `3` = "sometimes",
  `4` = "often"
)

never_seldom_occasionally_often_or_always <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_10 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/EADL1A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_11 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL2A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_12 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/EADL2A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_13 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL3A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_14 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/EADL3A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_15 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL4A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_16 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/EADL4A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_17 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL5A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_18 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/EADL5A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_19 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL6A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL1A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_20 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/EADL6A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_21 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL7A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_22 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BADL1A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_23 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HADL1A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_24 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HADL2A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_25 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HADL3A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_26 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BADL4A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_27 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HADL4A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_28 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HADL5A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_29 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BADL6A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL2A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_30 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HADL6A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_31 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HADL7A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL3A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_5 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL4A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_6 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL5A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_7 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL6A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_8 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL7A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_occasionally_often_or_always_9 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL1A",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "occasionally",
  `4` = "often or always"
)

never_seldom_some_of_the_time_often_always <- c(
  `-1` = "no answer",
  `1` = "never",
  `2` = "seldom",
  `3` = "some of the time",
  `4` = "often",
  `5` = "always"
)

never_seldom_some_of_the_time_often_always_2 <- c(
  `-1` = "not available",
  `1` = "never",
  `2` = "seldom",
  `3` = "some of the time",
  `4` = "often",
  `5` = "always"
)

never_seldom_sometimes_often <- c(
  `-7` = "NA:rank>10/12",
  `-6` = "NA:see 247",
  `-3` = "RCF/SYS addition",
  `-1` = "no answer",
  `1` = "never",
  `2` = "seldom",
  `3` = "sometimes",
  `4` = "often"
)

never_seldom_sometimes_often_2 <- c(
  `-7` = "not available,rank>10/12",
  `-6` = "not available, routing",
  `-3` = "rcf/sys addition",
  `-1` = "no answer",
  `1` = "never",
  `2` = "seldom",
  `3` = "sometimes",
  `4` = "often"
)

never_seldom_sometimes_often_very_often <- c(
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "sometimes",
  `4` = "often",
  `5` = "very often"
)

never_seldom_sometimes_reasonably_often_often <- c(
  `-1` = "na, asked",
  `1` = "never",
  `2` = "seldom",
  `3` = "sometimes",
  `4` = "reasonably often",
  `5` = "often",
  `6` = "very often"
)

never_sometimes_often_all_the_time <- c(
  `-2` = "na, see BQWORKYN",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "sometimes",
  `3` = "often",
  `4` = "all the time"
)

never_sometimes_often_all_the_time_2 <- c(
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "never",
  `2` = "sometimes",
  `3` = "often",
  `4` = "all the time"
)

never_sometimes_often_all_the_time_3 <- c(
  `-2` = "na, see BQWORKD",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "sometimes",
  `3` = "often",
  `4` = "all the time"
)

never_sometimes_often_all_the_time_4 <- c(
  `-2` = "na, see JQWORKD",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "sometimes",
  `3` = "often",
  `4` = "all the time"
)

never_sometimes_often_all_the_time_5 <- c(
  `-2` = "na, see KQWORKD",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "sometimes",
  `3` = "often",
  `4` = "all the time"
)

never_sometimes_often_all_the_time_not_applicable <- c(
  `-2` = "na, see IQWORKD",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "sometimes",
  `3` = "often",
  `4` = "all the time",
  `5` = "not applicable"
)

never_sometimes_often_all_the_time_not_applicable_2 <- c(
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "never",
  `2` = "sometimes",
  `3` = "often",
  `4` = "all the time",
  `5` = "not applicable"
)

never_sometimes_often_all_the_time_not_applicable_3 <- c(
  `-2` = "na, see JQWORKD",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "sometimes",
  `3` = "often",
  `4` = "all the time",
  `5` = "not applicable"
)

never_sometimes_often_all_the_time_not_applicable_4 <- c(
  `-2` = "na, see KQWORKD",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "sometimes",
  `3` = "often",
  `4` = "all the time",
  `5` = "not applicable"
)

never_sometimes_regularly_often <- c(`-1` = "no answer", `1` = "never", `2` = "sometimes", `3` = "regularly", `4` = "often")

never_sometimes_regularly_very_often <- c(
  `-2` = "na, short interview",
  `-1` = "na, asked",
  `1` = "never",
  `2` = "sometimes",
  `3` = "regularly",
  `4` = "very often"
)

never_sometimes_regularly_very_often_2 <- c(
  `-2` = "short interview",
  `-1` = "not available, asked",
  `1` = "never",
  `2` = "sometimes",
  `3` = "regularly",
  `4` = "very often"
)

never_yearly_or_less_often_few_times_year_monthly <- c(
  `-6` = "often are you in touch with ...?\" / \"Hoe vaak heeft u contact met NA: see 247",
  `-3` = "RCF/SYS addition",
  `-1` = "no answer",
  `1` = "never",
  `2` = "...\") yearly or less often",
  `3` = "few times year",
  `4` = "monthly",
  `5` = "once every 2 weeks",
  `6` = "weekly",
  `7` = "few times week",
  `8` = "daily or household member"
)

never_yearly_or_less_often_few_times_year_monthly_2 <- c(
  `-5` = "RCF/SYS addition",
  `-1` = "no answer",
  `1` = "never",
  `2` = "yearly or less often",
  `3` = "few times year",
  `4` = "monthly",
  `5` = "once every 2 weeks",
  `6` = "weekly",
  `7` = "few times week",
  `8` = "daily/hh member"
)

no <- c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KWALK03", `-1` = "na, asked", `1` = "no")

no_answer <- c(`-1` = "no answer")

no_answer_2 <- c(`-1` = "no answer", `0` = NA_character_, `100` = NA_character_)

no_answer_3 <- c(`-1` = "no answer", `0` = NA_character_, `10` = NA_character_)

no_answer_asked <- c(`-1` = "no answer, asked")

no_answer_see_bqparsep_no_answer <- c(`-2` = "no answer, see BQPARSEP", `-1` = "no answer")

no_answer_skipped_male_respondent_no_answer <- c(`-3` = "no answer, skipped", `-2` = "male respondent", `-1` = "no answer")

no_answer_skipped_male_respondent_not_available <- c(`-3` = "no answer, skipped", `-2` = "male respondent", `-1` = "not available")

no_binary_category_1_yes <- c(
  `-4` = "not available, short version",
  `-3` = "not available, wrong skip",
  `-2` = "not available",
  `-1` = "not available, asked",
  `0` = "no",
  `1` = "binary category 1",
  `2` = "yes"
)

no_binary_category_1_yes_2 <- c(
  `-5` = "not available, above age threshold",
  `-4` = "no answer, short version",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "no",
  `1` = "binary category 1",
  `2` = "yes"
)

no_change_extreme_change <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JKNEEP1",
  `-1` = "na, asked",
  `0` = "no change",
  `10` = "extreme change"
)

no_change_extreme_change_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see KKNEEP1",
  `-1` = "na, asked",
  `0` = "no change",
  `10` = "extreme change"
)

no_change_extreme_change_3 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "no change",
  `10` = "extreme change"
)

no_church_member_dutch_reformed <- c(
  `-1` = "no answer",
  `1` = "no church member",
  `2` = "Dutch reformed",
  `3` = "Reformed Association within the Dutch Reformed Church",
  `4` = "Reformed churches in the Netherlands (Synodal)",
  `5` = "Other Reformed churches",
  `6` = "Other protestant churches",
  `7` = "Roman-Catholic",
  `8` = "Humanistic society",
  `9` = "Jewish",
  `10` = "other"
)

no_church_member_reformed_dutch_reformed <- c(
  `-1` = "no answer",
  `1` = "no church member",
  `2` = "Reformed",
  `3` = "Dutch reformed",
  `4` = "small reformed denomination",
  `5` = "Roman-Catholic",
  `6` = "Humanistic society",
  `7` = "Jewish",
  `8` = "other"
)

no_church_member_reformed_dutch_reformed_2 <- c(
  `-1` = "not available",
  `1` = "no church member",
  `2` = "Reformed",
  `3` = "Dutch reformed",
  `4` = "small reformed denomination",
  `5` = "Roman-Catholic",
  `6` = "Humanistic society",
  `7` = "Jewish",
  `8` = "other",
  `9` = "Jewish",
  `10` = "other"
)

no_coding_category_1_coding_category_2_yes_specialist <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "no",
  `1` = "coding category 1",
  `2` = "coding category 2",
  `3` = "yes, specialist"
)

no_coding_category_1_mentioned <- c(
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "no",
  `1` = "coding category 1",
  `2` = "mentioned"
)

no_coding_category_1_yes <- c(
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "no",
  `1` = "coding category 1",
  `2` = "yes"
)

no_coding_category_1_yes_2 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "no",
  `1` = "coding category 1",
  `2` = "yes"
)

no_data <- c(`-3` = "no data", `10` = NA_character_, `100` = NA_character_)

no_data_2 <- c(`-3` = "no data", `1` = NA_character_, `18` = NA_character_)

no_five_times_completed_no_less_than_five_times <- c(
  `-6` = "na, test not done",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
  `-1` = "na, asked",
  `1` = "no: five times completed",
  `2` = "no: less than five times",
  `3` = "yes: less than five times"
)

no_hurt_hurts_a_little_bit_hurts_a_little_more <- c(
  `-6` = "na, wrong skip",
  `-2` = "na, see B/BWALK03",
  `-1` = "na, asked",
  `0` = "no hurt",
  `2` = "hurts a little bit",
  `4` = "hurts a little more",
  `6` = "hurts even more",
  `8` = "hurts a whole lot",
  `10` = "hurts worst"
)

no_hurt_hurts_a_little_bit_hurts_a_little_more_2 <- c(
  `-6` = "na, wrong skip",
  `-2` = "na, see B/BCHAIR5",
  `-1` = "na, asked",
  `0` = "no hurt",
  `2` = "hurts a little bit",
  `4` = "hurts a little more",
  `6` = "hurts even more",
  `8` = "hurts a whole lot",
  `10` = "hurts worst"
)

no_i_cannot_only_with_help <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "no, I cannot",
  `2` = "only with help",
  `3` = "functional ability category 3",
  `4` = "functional ability category 4",
  `5` = "yes, without help"
)

no_i_cannot_only_with_help_yes_with_difficulty <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BADL1A",
  `-1` = "na, asked",
  `1` = "no, I cannot",
  `2` = "only with help",
  `3` = "yes, with difficulty",
  `4` = "yes, without help"
)

no_i_cannot_only_with_help_yes_with_much_difficulty <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL1A",
  `-1` = "na, asked",
  `1` = "no, I cannot",
  `2` = "only with help",
  `3` = "yes, with much difficulty",
  `4` = "yes, with some difficulty",
  `5` = "yes, without help"
)

no_i_cannot_only_with_help_yes_with_much_difficulty_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL1A",
  `-1` = "na, asked",
  `1` = "no, I cannot",
  `2` = "only with help",
  `3` = "yes, with much difficulty",
  `4` = "yes, with some difficulty",
  `5` = "yes, without help"
)

no_i_cannot_only_with_help_yes_with_much_difficulty_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/EADL1A",
  `-1` = "na, asked",
  `1` = "no, I cannot",
  `2` = "only with help",
  `3` = "yes, with much difficulty",
  `4` = "yes, with some difficulty",
  `5` = "yes, without help"
)

no_i_cannot_only_with_help_yes_with_much_difficulty_4 <- c(
  `-5` = "na, interview terminated",
  `-1` = "na, asked",
  `1` = "no, I cannot",
  `2` = "only with help",
  `3` = "yes, with much difficulty",
  `4` = "yes, with some difficulty",
  `5` = "yes, without help"
)

no_i_cannot_only_with_help_yes_with_much_difficulty_5 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HADL1A",
  `-1` = "na, asked",
  `1` = "no, I cannot",
  `2` = "only with help",
  `3` = "yes, with much difficulty",
  `4` = "yes, with some difficulty",
  `5` = "yes, without help"
)

no_i_cannot_only_with_help_yes_with_much_difficulty_6 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BADL1A",
  `-1` = "na, asked",
  `1` = "no, I cannot",
  `2` = "only with help",
  `3` = "yes, with much difficulty",
  `4` = "yes, with some difficulty",
  `5` = "yes, without help"
)

no_i_cannot_only_with_help_yes_with_much_difficulty_7 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "no, I cannot",
  `2` = "only with help",
  `3` = "yes, with much difficulty",
  `4` = "yes, with some difficulty",
  `5` = "yes, without help"
)

no_i_do_not_need_help_with_this <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KHELPR & J/KSUFFIC",
  `-1` = "na, asked",
  `1` = "no, I do not need help with this",
  `2` = "no, I get enough hours of help with this",
  `3` = "yes, I would like to have more hours help with this"
)

no_i_do_not_need_help_with_this_2 <- c(
  `-3` = "na, wrong skip",
  `-1` = "na, asked",
  `1` = "no, I do not need help with this",
  `2` = "no, I get enough hours of help with this",
  `3` = "yes, I would like to have more hours of help with this"
)

no_i_do_not_need_help_with_this_3 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "no, I do not need help with this",
  `2` = "no, I get enough hours of help with this",
  `3` = "yes, I would like to have more hours help with this"
)

no_income_r_only_p_only_r_p_in_hh_r_p_out_hh <- c(
  `-5` = "na, refused",
  `-4` = "na, short version",
  `-1` = "na, asked",
  `0` = "no income",
  `1` = "R only",
  `2` = "P only",
  `3` = "R+P in hh",
  `4` = "R+P out hh",
  `5` = "R+other in hh"
)

no_job_not_changed_no_job_changed_no_job_unknown_before <- c(
  `-2` = "na, see C/D/E/F/GJOB1",
  `-1` = "never had job, unknown before",
  `1` = "no job, not changed",
  `2` = "no job, changed",
  `3` = "no job, unknown before",
  `4` = "job, not changed",
  `5` = "job, changed",
  `6` = "job, unknown before"
)

no_left_right_left_and_right <- c(`-1` = "na, asked", `1` = "no", `2` = "left", `3` = "right", `4` = "left and right")

no_measurement <- c(`-1` = "no measurement")

no_measurement_2 <- c(`-3` = "no measurement")

no_measurement_length_measured_no_valid_data <- c(`-3` = "no measurement", `-2` = "length measured", `-1` = "no valid data")

no_measurement_no_valid_data <- c(`-3` = "no measurement", `-1` = "no valid data")

no_medicines <- c(`0` = "no medicines")

no_medicines_2 <- c(`-2` = "na, see B/I/J/KMMEDUSE", `0` = "no medicines")

no_more_or_less_yes <- c(
  `-4` = "refusal/skip by interviewer",
  `-3` = "not asked (interview terminated/skip)",
  `-1` = "no answer",
  `1` = "no",
  `2` = "more-or-less",
  `3` = "yes"
)

no_more_or_less_yes_10 <- c(
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-1` = "not available, asked",
  `1` = "no",
  `2` = "more or less",
  `3` = "yes"
)

no_more_or_less_yes_2 <- c(
  `-4` = "refusal/skip by interviewernterviewer",
  `-3` = "not asked (interview terminated/skip)",
  `-1` = "no answer",
  `1` = "no",
  `2` = "more or less",
  `3` = "yes"
)

no_more_or_less_yes_3 <- c(`-1` = "no answer", `1` = "no", `2` = "more-or-less", `3` = "yes")

no_more_or_less_yes_4 <- c(
  `-4` = "short version Q",
  `-3` = "interview broken off",
  `-2` = "no valid data",
  `-1` = "no answer",
  `1` = "no",
  `2` = "more-or-less",
  `3` = "yes"
)

no_more_or_less_yes_5 <- c(
  `-4` = "refusal/skip by I",
  `-3` = "terminated interview",
  `-2` = "no valid data",
  `-1` = "no answer",
  `1` = "no",
  `2` = "more-or-less",
  `3` = "yes"
)

no_more_or_less_yes_6 <- c(
  `-4` = "coding category -4",
  `-3` = "interview terminated",
  `-2` = "no valid data",
  `-1` = "no answer",
  `1` = "no",
  `2` = "more or less",
  `3` = "yes"
)

no_more_or_less_yes_7 <- c(`-1` = "not available", `1` = "no", `2` = "more-or-less", `3` = "yes")

no_more_or_less_yes_8 <- c(
  `-4` = "no answer, short version",
  `-1` = "no answer, asked",
  `1` = "no",
  `2` = "more or less",
  `3` = "yes"
)

no_more_or_less_yes_9 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `1` = "no",
  `2` = "more or less",
  `3` = "yes"
)

no_mortgage_mortgage <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/H/I/J/KHOWNER",
  `-1` = "na, asked",
  `1` = "no mortgage",
  `2` = "mortgage"
)

no_mortgage_mortgage_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BHOWNER",
  `-1` = "na, asked",
  `1` = "no mortgage",
  `2` = "mortgage"
)

no_never_had_before_yes_possess_one_without_use <- c(
  `-5` = "na, section not done",
  `-1` = "na, asked",
  `1` = "no, never had before",
  `2` = "yes, possess one without use",
  `3` = "yes, possess two without use",
  `4` = "yes, possess one with use",
  `5` = "yes, possess two with use of one",
  `6` = "yes, possess two with use"
)

no_never_had_before_yes_possess_one_without_use_2 <- c(
  `-1` = "na, asked",
  `1` = "no, never had before",
  `2` = "yes, possess one without use",
  `3` = "yes, possess two without use",
  `4` = "yes, possess one with use",
  `5` = "yes, possess two with use of one",
  `6` = "yes, possess two with use"
)

no_nicotine_1_10_mg_nicotine_11_20_mg_nicotine <- c(
  `-2` = "na, see I/J/KMSMOKEECIG",
  `1` = "no nicotine",
  `2` = "1-10 mg nicotine",
  `3` = "11-20 mg nicotine",
  `4` = "21-35 mg nicotine",
  `5` = ">36 mg nicotine"
)

no_no_more_or_less_yes_yes <- c(
  `-4` = "interview terminated",
  `-2` = "not asked",
  `-1` = "na, asked",
  `1` = "no!",
  `2` = "no",
  `3` = "more or less",
  `4` = "yes",
  `5` = "yes!"
)

no_no_previous_interview_yes_yes_previous_interview_no <- c(
  `-5` = "na, see D/E/F/G/HRMCH",
  `-1` = "na, asked",
  `0` = "no",
  `1` = "no, previous interview yes",
  `2` = "yes, previous interview no",
  `3` = "yes, previous interview yes"
)

no_no_previous_interview_yes_yes_previous_interview_no_2 <- c(
  `-5` = "na, see I/JRMCH",
  `-1` = "na, asked",
  `0` = "no",
  `1` = "no, previous interview yes",
  `2` = "yes, previous interview no",
  `3` = "yes, previous interview yes"
)

no_no_previous_interview_yes_yes_previous_interview_no_3 <- c(
  `-5` = "na, see KRMCH",
  `-1` = "na, asked",
  `0` = "no",
  `1` = "no, previous interview yes",
  `2` = "yes, previous interview no",
  `3` = "yes, previous interview yes"
)

no_not_retired_yes_retired_entirely_voluntarily <- c(
  `-3` = "na, wrong skip",
  `-2` = "see BRETIRED",
  `-1` = "na, asked",
  `1` = "no, not retired",
  `2` = "yes, retired entirely voluntarily",
  `3` = "yes, retired but not entirely voluntarily"
)

no_numeric_coding_category_1_yes <- c(
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "no",
  `1` = "numeric coding category 1",
  `2` = "yes"
)

no_numeric_coding_category_1_yes_2 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "no",
  `1` = "numeric coding category 1",
  `2` = "yes"
)

no_numeric_coding_category_1_yes_3 <- c(
  `-5` = "not available, interview terminated",
  `-4` = "not available, interview terminated",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "no",
  `1` = "numeric coding category 1",
  `2` = "yes",
  `3` = "respondent does not know",
  `4` = "refused"
)

no_only_on_certain_occasion_yes_most_of_the_time <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HINCON1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "only on certain occasion",
  `3` = "yes, most of the time"
)

no_only_on_certain_occasion_yes_most_of_the_time_2 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BINCON1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "only on certain occasion",
  `3` = "yes, most of the time"
)

no_pain_discomfort_moderate_pain_discomfort <- c(
  `-1` = "no answer",
  `1` = "no pain/discomfort",
  `2` = "moderate pain/discomfort",
  `3` = "extreme pain/discomfort"
)

no_pain_worst_conceivable_pain <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JKNEEP1",
  `-1` = "na, asked",
  `0` = "no pain",
  `10` = "worst conceivable pain"
)

no_pain_worst_conceivable_pain_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see KKNEEP1",
  `-1` = "na, asked",
  `0` = "no pain",
  `10` = "worst conceivable pain"
)

no_pain_worst_conceivable_pain_3 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "no pain",
  `10` = "worst conceivable pain"
)

no_particularities_r_refuses_handicapped_hand <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CRM161",
  `-1` = "no valid data",
  `0` = "no particularities",
  `1` = "R refuses",
  `2` = "handicapped hand"
)

no_particularities_scored_refused_trousers_right_leg <- c(
  `-3` = "no measurement",
  `-2` = "no answer, skipped",
  `-1` = "no valid data",
  `0` = "no particularities scored",
  `1` = "refused",
  `2` = "trousers",
  `3` = "right leg"
)

no_partner_cannot_only_with_help <- c(
  `-2` = "no partner",
  `-1` = "no answer",
  `1` = "no, partner cannot",
  `2` = "only with help",
  `3` = "yes, with much difficulty",
  `4` = "yes, with some difficulty",
  `5` = "yes, without help"
)

no_partner_cannot_only_with_help_2 <- c(
  `-2` = "not available",
  `-1` = "not available",
  `1` = "no, partner cannot",
  `2` = "only with help",
  `3` = "yes, with much difficulty",
  `4` = "yes, with some difficulty",
  `5` = "yes, without help"
)

no_partner_current_partner_former_partner <- c(`0` = "no partner", `1` = "current partner", `2` = "former partner")

no_partner_in_household_partner_in_household <- c(
  `-2` = "na, see F/G/H/B/I/J/KNUPERS",
  `0` = "no partner in household",
  `1` = "partner in household"
)

no_partner_no_answer <- c(`-2` = "no partner", `-1` = "no answer", `1` = NA_character_, `10` = NA_character_)

no_partner_partner_in_hh_child_partner_outs_hh_child <- c(
  `-5` = "RCF/SYS addition",
  `-2` = "not asked: age<18",
  `-1` = "no answer",
  `0` = "no partner",
  `1` = "partner in hh child",
  `2` = "partner outs hh child"
)

no_problems_usual_activities <- c(
  `-1` = "no answer",
  `1` = "no problems usual activities",
  `2` = "some problems usual activities",
  `3` = "unable to perform usual activities"
)

no_problems_walking_some_problems_walking <- c(
  `-1` = "no answer",
  `1` = "no problems walking",
  `2` = "some problems walking",
  `3` = "confined to bed"
)

no_problems_washing_dressing <- c(
  `-1` = "no answer",
  `1` = "no problems washing/dressing",
  `2` = "some problems washing/dressing",
  `3` = "unable to wash/dress"
)

no_r_is_not_wearing_ha_yes_r_is_wearing_1_ha_left <- c(
  `-2` = "na, see J/KMSENS7A",
  `-1` = "na, asked",
  `1` = "no, R is not wearing HA",
  `2` = "yes, R is wearing 1 HA, left",
  `3` = "yes, R is wearing 1 HA, right",
  `4` = "yes, R is wearing 2 HA"
)

no_recall_test <- c(`-2` = "no recall test")

no_recall_test_h_b_1_no_answer_asked_i_j_km15wtrnd_15_words_recall_number_of_doubles <- c(
  `-2` = "no recall test h/b/ -1: no answer, asked i/j/km15wtrnd 15 words (recall): number of doubles"
)

no_recall_test_no_answer_asked <- c(`-2` = "no recall test", `-1` = "no answer, asked")

no_restrictions_in_wheelchair_recent_surgery <- c(
  `-6` = "na, test not done",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
  `-1` = "na, asked",
  `1` = "no restrictions",
  `2` = "in wheelchair",
  `3` = "recent surgery",
  `4` = "recent accident",
  `5` = "other"
)

no_score_see_brmds_no_score_too_many_missings <- c(`-2` = "no score, see BRMDS", `-1` = "no score, too many missings")

no_specific_information <- c(
  `-2` = "no specific information",
  `0` = NA_character_,
  `4` = NA_character_,
  `6` = NA_character_,
  `10` = NA_character_
)

no_specific_reason_bending_down_tension_tiredness <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DMDIZZOTH",
  `1` = "no specific reason",
  `2` = "bending down",
  `3` = "tension/ tiredness",
  `4` = "sickness, medication"
)

no_supplements <- c(`-2` = "na, see jmDsup/jmMVsup", `0` = "no supplements")

no_supplements_2 <- c(`-2` = "na, see IMSUP", `0` = "no supplements")

no_test <- c(`-2` = "no test")

no_test_2 <- c(`-1` = "no test")

no_test_no_valid_time_data <- c(`-2` = "no test", `-1` = "no valid time data")

no_time_1_hour_24_hours <- c(
  `-7` = "NA:rank>10/12",
  `-6` = "NA:see 247",
  `-4` = "NA:miss techn",
  `-3` = "RCF/SYS addition",
  `-1` = "no answer",
  `0` = "no time",
  `60` = "1 hour",
  `1440` = ">24 hours"
)

no_trial <- c(`-1` = "no trial")

no_valid_data <- c(`-2` = "no valid data")

no_valid_data_10 <- c(`-2` = "no valid data", `23` = NA_character_, `60` = NA_character_)

no_valid_data_11 <- c(`-2` = "no valid data", `5` = NA_character_, `25` = NA_character_)

no_valid_data_12 <- c(`-2` = "no valid data", `20` = NA_character_, `60` = NA_character_)

no_valid_data_2 <- c(`-1` = "no valid data")

no_valid_data_3 <- c(`-2` = "no valid data", `4` = NA_character_, `20` = NA_character_)

no_valid_data_4 <- c(`-2` = "no valid data", `3` = NA_character_, `15` = NA_character_)

no_valid_data_5 <- c(`-2` = "no valid data", `0` = NA_character_, `21` = NA_character_)

no_valid_data_6 <- c(`-2` = "no valid data", `8` = NA_character_, `25` = NA_character_)

no_valid_data_7 <- c(`-2` = "no valid data", `22` = NA_character_, `60` = NA_character_)

no_valid_data_8 <- c(`-3` = "no valid data", `1` = NA_character_, `18` = NA_character_)

no_valid_data_9 <- c(`-3` = "no valid data", `10` = NA_character_, `100` = NA_character_)

no_valid_data_interview_broken_off <- c(
  `-6` = "no valid data",
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-2` = "na, see BRMCRAV in LASAB222",
  `-1` = "na, asked"
)

no_valid_data_na_asked <- c(`-2` = "no valid data", `-1` = "na, asked")

no_valid_data_na_asked_2 <- c(`-1` = "no valid data / na, asked")

no_valid_data_no_answer_routing_no_answer_asked <- c(`-3` = "no valid data", `-2` = "no answer, routing", `-1` = "no answer, asked")

no_valid_data_no_trial <- c(`-4` = "no valid data", `-1` = "no trial")

no_valid_data_r_never_drank_r_drinks_at_present <- c(
  `-4` = "no valid data",
  `-3` = "R never drank",
  `-2` = "R drinks at present",
  `-1` = "no answer, asked"
)

no_valid_data_r_smokes_r_never_smoked_no_answer_asked <- c(`-4` = "no valid data", `-3` = "R smokes", `-2` = "R never smoked", `-1` = "no answer, asked")

no_valid_measurement <- c(`-1` = "no valid measurement")

no_valid_time_data <- c(`-1` = "no valid time data")

no_wish_to_die_a_weak_wish_to_die <- c(
  `-1` = "na, asked",
  `1` = "no wish to die",
  `2` = "a weak wish to die",
  `3` = "a moderate to strong wish to die"
)

no_yes <- c(`-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_10 <- c(
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-3` = "no answer, wrong skip",
  `-2` = "no answer, routing",
  `-1` = "no answer, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_100 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/GWALK03",
  `-1` = "na, asked",
  `0` = "no",
  `1` = "yes"
)

no_yes_100_yes_100_200_yes_200_300_yes_300_400 <- c(
  `-5` = "na, refused",
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "no answer, routing",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, < ƒ 100",
  `3` = "yes, ƒ 100 - 200",
  `4` = "yes, ƒ 200 - 300",
  `5` = "yes, ƒ 300 - 400",
  `6` = "yes, ƒ 400 - 500",
  `7` = "yes, ƒ 500 >",
  `8` = "yes, do not know how many"
)

no_yes_101 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CCARA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_102 <- c(`-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_103 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JHART01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_104 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BRHEUM01&02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_105 <- c(
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_106 <- c(`-2` = "na, see D/E/BRMGL", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_107 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FRMSO",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_108 <- c(`-2` = "no answer, skipped", `-1` = "no answer, asked", `1` = "no", `2` = "yes")

no_yes_109 <- c(`-2` = "na, see FMBOT1#", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_11 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CRM161",
  `-1` = "no valid data",
  `1` = "no",
  `2` = "yes"
)

no_yes_110 <- c(`-2` = "na, see GMBOT1#", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_111 <- c(
  `-5` = "na, see C/D/E/F/GHINDEP",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GMOVED",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_112 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GMOVED",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_113 <- c(`-4` = "na, short version", `1` = "no", `2` = "yes")

no_yes_114 <- c(`-2` = "na, see C/D/E/F/GRETIRED", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_115 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GJOBC",
  `-1` = "na, asked",
  `0` = "no",
  `1` = "yes"
)

no_yes_116 <- c(`-3` = "na, wrong skip", `-2` = "na, see BJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_117 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HSUFFIC",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_118 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/B/I/J/KWALK03",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_119 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HARTVE1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_12 <- c(
  `-3` = "section not done",
  `-2` = "na, no contact about services",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_120 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HARTVEI5",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_121 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCANCER1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_122 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCARA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_123 <- c(
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "na, see BCARA01",
  `-1` = "na, asked",
  `0` = "no",
  `1` = "yes"
)

no_yes_124 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCVA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_125 <- c(
  `-6` = "na, see DARTVEI1",
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HDIABE01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_126 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HDIABE07",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_127 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HDIABE11",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_128 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HHART01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_129 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HHART10",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_13 <- c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_130 <- c(`-5` = "na, see D/E/F/G/HRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_131 <- c(`-5` = "na, see I/JRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_132 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HHBD1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_133 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HINCON1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_134 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HINCON1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_135 <- c(`-5` = "na, see DRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_136 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CRHEUM01&02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_137 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HRHEUM01&02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_138 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HRHEUM01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_139 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HOTHSI07",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_14 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/I/JRM161",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_140 <- c(`-2` = "na, see BMALCYN", `-1` = "no answer, asked", `1` = "no", `2` = "yes")

no_yes_141 <- c(`-2` = "na, see E/B/F/G/HMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_142 <- c(`-2` = "na, see DMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_143 <- c(`-3` = "na, section not done", `1` = "no", `2` = "yes")

no_yes_144 <- c(`-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_145 <- c(`-2` = "na, see KMFALLFRAC", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_146 <- c(
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version",
  `-3` = "na: no brothers",
  `-2` = "answer: no brothers",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes"
)

no_yes_147 <- c(
  `-6` = "refusal/skip by interviewer",
  `-5` = "terminated interview",
  `-4` = "short version",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes"
)

no_yes_148 <- c(
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version",
  `-3` = "na: no daughters",
  `-2` = "answer: no daughters",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes"
)

no_yes_149 <- c(
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version",
  `-3` = "na: no sisters",
  `-2` = "answer: no sisters",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes"
)

no_yes_15 <- c(`-1` = "na, asked", `0` = "no", `1` = "yes")

no_yes_150 <- c(
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version",
  `-3` = "na: no sons",
  `-2` = "answer: no sons",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes"
)

no_yes_151 <- c(
  `-8` = "technical problems",
  `-7` = "refusal/skip by interviewer",
  `-6` = "interview nonresponse",
  `-5` = "interview nonresponse",
  `-4` = "short version",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes"
)

no_yes_152 <- c(
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "no (household) partner",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_153 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL1A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_154 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL2A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_155 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL3A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_156 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL4A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_157 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL5A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_158 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL6A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_159 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/I/J/KADL7A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_16 <- c(
  `-5` = "not available, refused",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "no",
  `1` = "yes"
)

no_yes_160 <- c(`-2` = "na, see D/ESENSE01", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_161 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BARTVEI1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_162 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JARTVEI1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_163 <- c(
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "na, see BCVA01",
  `-1` = "na, asked",
  `0` = "no",
  `1` = "yes"
)

no_yes_164 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BDIABE01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_165 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CHART01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_166 <- c(`-5` = "na, see KRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_167 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BOTHSI01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_168 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see KRHEUM01&02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_169 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JRHEUM10A2",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_17 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCARA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_170 <- c(
  `-4` = "Not applicable, positive corona test less than 3 months ago",
  `-3` = "na, wrong skip",
  `-2` = "na, see KCORONA1 & KCORONA2",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_171 <- c(
  `-4` = "Not applicable, positive corona test less than 3 months ago",
  `-3` = "na, wrong skip",
  `-2` = "na, see KCORONA2",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_172 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/I/JLPHYASP",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_173 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/I/JLPHYA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_174 <- c(`-3` = "na, wrong skip", `-2` = "na, see JRMSO", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_175 <- c(
  `-5` = "na, interview terminated",
  `-2` = "no answer, skipped",
  `-1` = "no answer, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_176 <- c(
  `-4` = "no valid data",
  `-2` = "R does not smoke",
  `-1` = "no answer, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_177 <- c(`-2` = "na, see I/J/KMSMOKEBEF / SMOKECIGP", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_178 <- c(`-3` = "no valid data", `-1` = "no answer, asked", `1` = "no", `2` = "yes")

no_yes_179 <- c(`-2` = "na, see BMBOT6", `1` = "no", `2` = "yes")

no_yes_18 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCVA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_180 <- c(`-2` = "na, see DMFALLC", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_181 <- c(
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version",
  `-2` = "na: no partner",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes"
)

no_yes_182 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BHINDEP",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_183 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/J/KMOVED",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_184 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, interview terminated",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_185 <- c(
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "na, routing",
  `-1` = "na, asked",
  `0` = "no",
  `1` = "yes"
)

no_yes_186 <- c(`-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_187 <- c(
  `-4` = "no answer, short version",
  `-3` = "no answer, wrong skip",
  `-2` = "no answer, routing",
  `-1` = "no answer, asked",
  `0` = "no",
  `1` = "yes"
)

no_yes_188 <- c(`-3` = "na, wrong skip", `-2` = "na, see BPJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_189 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BPJOBL4",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_19 <- c(
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes"
)

no_yes_190 <- c(
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "na, no partner",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_191 <- c(`-5` = "na, section not done", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_192 <- c(`-5` = "na, terminated interview", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_193 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CCANCER1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_194 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BCANCER1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_195 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see KHART01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_196 <- c(`-5` = "not available, routing", `-1` = "not available, asked", `1` = "no", `2` = "yes")

no_yes_197 <- c(
  `-5` = "not available, interview terminated",
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_198 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_199 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_2 <- c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_20 <- c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes")

no_yes_200 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP03",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_201 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP04",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_202 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP05",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_203 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP06",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_204 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP07",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_205 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP08",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_206 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP09",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_207 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP10",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_208 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP11",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_209 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP12",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_21 <- c(`-3` = "na, wrong skip", `-2` = "na, see GRM161", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_210 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP13",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_211 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP27",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_212 <- c(`-3` = "na, wrong skip", `-2` = "na, see ERMSO", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_213 <- c(`-3` = "na, wrong skip", `-2` = "na, see BRMSO", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_214 <- c(`-2` = "na, see I/J/KQPMEMO", `-1` = "no answer", `1` = "no", `2` = "yes")

no_yes_215 <- c(`-2` = "na, see I/J/KQHHACQU", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_216 <- c(`-2` = "na, see I/J/KQHHBRSI", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_217 <- c(`-2` = "na, see I/J/KQHHCHIN", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_218 <- c(`-2` = "na, see I/J/KQHHGRCH", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_219 <- c(`-2` = "na, see I/J/KQHHNEIG", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_22 <- c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_220 <- c(`-2` = "na, see I/J/KQHHOTFA", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_221 <- c(`-2` = "na, see I/J/KQHHOTHN", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_222 <- c(`-2` = "na, see I/J/KQHHPARN", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_223 <- c(`-2` = "na, see I/J/KQHHPART", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_224 <- c(`-2` = "na, see I/J/KQPHACQU", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_225 <- c(`-2` = "na, see I/J/KQPHBRSI", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_226 <- c(`-2` = "na, see I/J/KQPHCHIN", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_227 <- c(`-2` = "na, see I/J/KQPHCHIR", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_228 <- c(`-2` = "na, see I/J/KQPHGRCH", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_229 <- c(`-2` = "na, see I/J/KQPHNEIG", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_23 <- c(`-1` = "no answer, asked", `1` = "no", `2` = "yes")

no_yes_230 <- c(`-2` = "na, see I/J/KQPHOTFA", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_231 <- c(`-2` = "na, see I/J/KQPHOTHN", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_232 <- c(`-2` = "na, see I/J/KQPHOTHR", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_233 <- c(`-2` = "na, see I/J/KQPHPARN", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_234 <- c(`-2` = "na, see I/J/KQPHPARR", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_235 <- c(`-2` = "na, see I/J/KQPHPART", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_236 <- c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, short interview", `1` = "no", `2` = "yes")

no_yes_237 <- c(`-1` = "na, short interview", `1` = "no", `2` = "yes")

no_yes_238 <- c(`-3` = "na, section ot done", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_239 <- c(`-3` = "na, wrong skip", `-2` = "na, see GRM161", `1` = "no", `2` = "yes")

no_yes_24 <- c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_240 <- c(
  `-5` = "na, interview terminated",
  `-2` = "male respondent",
  `-1` = "no valid data",
  `1` = "no",
  `2` = "yes"
)

no_yes_241 <- c(`-5` = "na, interview terminated", `-1` = "no valid data", `1` = "no", `2` = "yes")

no_yes_242 <- c(`-2` = "na, see DMFALLLY", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_243 <- c(
  `-8` = "technical problems",
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version interview",
  `-3` = "not asked: partner not identified in demographic part",
  `-2` = "not asked: no partner",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes"
)

no_yes_244 <- c(`-1` = "not available, asked", `1` = "no", `2` = "yes")

no_yes_245 <- c(
  `-5` = "na, age >= 65",
  `-3` = "na, wrong skip",
  `-2` = "na, see HJOBC",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_246 <- c(
  `-5` = "na, age >= 66",
  `-3` = "na, wrong skip",
  `-2` = "na, see IJOBC",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_247 <- c(
  `-5` = "na, age >= 67",
  `-3` = "na, wrong skip",
  `-2` = "na, see JJOBC",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_248 <- c(
  `-5` = "na, age >= 67",
  `-3` = "na, wrong skip",
  `-2` = "na, see KJOBC",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_249 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BPJOB1 & BPJOBL1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_25 <- c(
  `-5` = "interview terminated",
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_250 <- c(`-3` = "na, wrong skip", `-2` = "na, see HJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_251 <- c(`-3` = "na, wrong skip", `-2` = "na, see IJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_252 <- c(`-3` = "na, wrong skip", `-2` = "na, see JJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_253 <- c(`-3` = "na, wrong skip", `-2` = "na, see KJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_254 <- c(`-3` = "na, wrong skip", `-2` = "na, see BJOBL1", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_255 <- c(`-3` = "na, wrong skip", `-2` = "na, see HPJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_256 <- c(`-3` = "na, wrong skip", `-2` = "na, see IPJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_257 <- c(`-3` = "na, wrong skip", `-2` = "na, see JPJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_258 <- c(`-3` = "na, wrong skip", `-2` = "na, see KPJOB4", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_259 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BPJOBL1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_26 <- c(`-2` = "na, see JMBOT#", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_260 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see JRETIRED",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_261 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see KRETIRED",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_262 <- c(
  `-4` = "no answer, short version",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "no",
  `1` = "yes"
)

no_yes_263 <- c(
  `-5` = "na, refused",
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "na, routing",
  `-1` = "na, asked",
  `0` = "no",
  `1` = "yes"
)

no_yes_264 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/CMEMORY1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_265 <- c(`-3` = "na, wrong skip", `-2` = "na, see BADL1A", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_266 <- c(`-3` = "na, wrong skip", `-2` = "na, see BADL4A", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_267 <- c(`-3` = "na, wrong skip", `-2` = "na, see BADL6A", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_268 <- c(`-2` = "na, see BSENSE01", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_269 <- c(`-2` = "na, see CSENSE01", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_27 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HRHEUM01&02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_270 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BARTVE1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_271 <- c(
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "na, see BARTVEI1",
  `-1` = "na, asked",
  `0` = "no",
  `1` = "yes"
)

no_yes_272 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CARTVEI1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_273 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see KARTVEI1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_274 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BARTVEI5",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_275 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JARTVEI5",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_276 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BCANCER1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_277 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BCARA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_278 <- c(
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "na, see BDIABE01",
  `-1` = "na, asked",
  `0` = "no",
  `1` = "yes"
)

no_yes_279 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CDIABE01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_28 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/IRMSO",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_280 <- c(
  `-6` = "na, see BARTVEI1",
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BDIABE01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_281 <- c(
  `-6` = "na, see I/JARTVEI1",
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JDIABE01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_282 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BDIABE07",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_283 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JDIABE07",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_284 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BDIABE11",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_285 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JDIABE11",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_286 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BHART01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_287 <- c(
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "na, see BHART01",
  `-1` = "na, asked",
  `0` = "no",
  `1` = "yes"
)

no_yes_288 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BHART10",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_289 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JHART10",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_29 <- c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes")

no_yes_290 <- c(`-5` = "na, see CRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_291 <- c(`-3` = "na, wrong skip", `-2` = "na, see BHBD1", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_292 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BINCON1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_293 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CINCON1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_294 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BINCON1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_295 <- c(`-3` = "na, wrong skip", `-2` = "na, see COTH1", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_296 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JOTHSI01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_297 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BRHEUM01&02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_298 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JRHEUM01&02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_299 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BRHEUM01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_3 <- c(`-1` = "no answer", `1` = "no", `2` = "yes")

no_yes_30 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see ERM161",
  `-1` = "no valid data",
  `1` = "no",
  `2` = "yes"
)

no_yes_300 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JCVA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_301 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JHBD1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_302 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JRHEUM01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_303 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see KRHEUM10A2",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_304 <- c(`-2` = "na, see G/HRMGL", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_305 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_306 <- c(
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-1` = "not available, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_307 <- c(`-2` = "na, see BMEDSPEC", `-1` = "na, asked", `0` = "no", `1` = "yes")

no_yes_308 <- c(
  `-5` = "na, interview terminated",
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_309 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_31 <- c(
  `-8` = "technical problems",
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version interview",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes"
)

no_yes_310 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_311 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_312 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_313 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP03",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_314 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP03",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_315 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP04",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_316 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP04",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_317 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP05",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_318 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP05",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_319 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP06",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_32 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see klidasdiag",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_320 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP06",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_321 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP07",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_322 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP07",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_323 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP08",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_324 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP08",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_325 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP09",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_326 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP09",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_327 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP10",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_328 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP10",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_329 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP11",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_33 <- c(`-1` = "not available", `1` = "no", `2` = "yes")

no_yes_330 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP11",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_331 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP12",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_332 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP12",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_333 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP13",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_334 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP13",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_335 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP27",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_336 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP27",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_337 <- c(`-3` = "na, wrong skip", `-2` = "na, see GRMSO", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_338 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DRMSO",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_339 <- c(`-1` = "na asked", `1` = "no", `2` = "yes")

no_yes_34 <- c(`-3` = "no test", `0` = "no", `1` = "yes")

no_yes_340 <- c(`-2` = "na, male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_341 <- c(
  `-4` = "no valid data",
  `-2` = "no answer, skipped",
  `-1` = "no answer, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_342 <- c(
  `-4` = "no valid data",
  `-2` = "R never drank",
  `-1` = "no answer, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_343 <- c(`-2` = "na, see BMWLOSS", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_344 <- c(`-2` = "na, see GRM161", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_345 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see DRM161",
  `-1` = "no valid data",
  `1` = "no",
  `2` = "yes"
)

no_yes_346 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/ERM161",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_347 <- c(`-2` = "no symptoms mentioned", `-1` = "na, asked", `0` = "no", `1` = "yes")

no_yes_348 <- c(
  `-3` = "R does not know",
  `-2` = "male respondent",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_349 <- c(`-2` = "na, see DMFALLF", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_35 <- c(`-5` = "na, refusal", `-2` = "na, see BPARTINC", `-1` = "na, asked", `0` = "no", `1` = "yes")

no_yes_350 <- c(`-2` = "na, see KMFALLLY", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_36 <- c(`-5` = "na, refusal", `-2` = "na, see BRESPINC", `-1` = "na, asked", `0` = "no", `1` = "yes")

no_yes_37 <- c(
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "na, see BRHEUM01&02",
  `-1` = "na, asked",
  `0` = "no",
  `1` = "yes"
)

no_yes_38 <- c(`-2` = "no partner", `-1` = "no answer", `1` = "no", `2` = "yes")

no_yes_39 <- c(
  `-6` = "na, test not done",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_4 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_40 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_41 <- c(`-2` = "na, see I/J/KQPDEME", `-1` = "no answer", `1` = "no", `2` = "yes")

no_yes_42 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DRM161",
  `-1` = "no valid data / na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_43 <- c(`-2` = "not available, routing", `-1` = "not available", `1` = "no", `2` = "yes")

no_yes_44 <- c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes")

no_yes_45 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_45_euro_yes_45_136_euro_yes_136_227_euro <- c(
  `-5` = "na, refused",
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "no answer, routing",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, < 45 euro",
  `3` = "yes, 45 - 136 euro",
  `4` = "yes, 136 - 227 euro",
  `5` = "yes, 227 - 318 euro",
  `6` = "yes, 318 - 410 euro",
  `7` = "yes, > 410 euro"
)

no_yes_46 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA06",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_47 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA10",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_48 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_49 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_5 <- c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_50 <- c(
  `-4` = "no valid data",
  `-2` = "R does not drink",
  `-1` = "no answer, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_51 <- c(`-2` = "na, see H/IMBOT1#", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_52 <- c(`-3` = "section not done", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_53 <- c(
  `-5` = "na, age >= 65",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GJOBC",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_54 <- c(
  `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_55 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_56 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HARTVEI1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_57 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCANCER1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_58 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BCARA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_59 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HDIABE01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_6 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DRM161",
  `-1` = "no valid data",
  `1` = "no",
  `2` = "yes"
)

no_yes_60 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BHART01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_61 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HOTHSI01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_62 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_63 <- c(`-2` = "na, see I/J/KMSMOKEYN", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_64 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BSUFFIC",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_65 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_66 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_67 <- c(`-5` = "interview terminated", `-1` = "not available, asked", `1` = "no", `2` = "yes")

no_yes_68 <- c(`-3` = "na, section not done", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_69 <- c(`-3` = "na, wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_7 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_70 <- c(`-2` = "not available, routing", `-1` = "not available, asked", `1` = "no", `2` = "yes")

no_yes_71 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BCVA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_72 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JRHEUM01&02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_73 <- c(
  `-4` = "Not applicable, positive corona test less than 3 months ago",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_74 <- c(`-2` = "na, see CRMGL", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_75 <- c(`-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_76 <- c(
  `-5` = "na, partner out hh",
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "na, no partner",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_77 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_78 <- c(
  `-6` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/HWALK03",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_79 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/GLPHYA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_8 <- c(`-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_80 <- c(
  `-3` = "no answer, skipped",
  `-2` = "male respondent",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes"
)

no_yes_81 <- c(
  `-3` = "no answer, skipped",
  `-2` = "male respondent",
  `-1` = "not available",
  `1` = "no",
  `2` = "yes"
)

no_yes_82 <- c(`-4` = "no valid data", `-3` = "no test", `0` = "no", `1` = "yes")

no_yes_83 <- c(`-2` = "na, see KMBOT#", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_84 <- c(`-2` = "na, see BSPEC17", `0` = "no", `1` = "yes")

no_yes_85 <- c(`-2` = "not available, routing", `0` = "no", `1` = "yes")

no_yes_86 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL1A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_87 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/EADL1A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_88 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL2A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_89 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/EADL2A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_9 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HHART01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_90 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL3A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_91 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/EADL3A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_92 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL4A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_93 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/EADL4A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_94 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL5A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_95 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/EADL5A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_96 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL6A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_97 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/EADL6A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_98 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/F/GADL7A",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes"
)

no_yes_99 <- c(`-2` = "na, see F/GMSENS01", `-1` = "na, asked", `1` = "no", `2` = "yes")

no_yes_both <- c(`-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "both")

no_yes_but_not_in_past_year_yes_in_past_year <- c(
  `-2` = "R does not drink",
  `-1` = "no answer, asked",
  `1` = "no",
  `2` = "yes, but not in past year",
  `3` = "yes, in past year"
)

no_yes_do_not_know <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "do not know"
)

no_yes_do_not_know_2 <- c(`-5` = "na, interview terminated", `1` = "no", `2` = "yes", `3` = "do not know")

no_yes_do_not_know_3 <- c(
  `-5` = "na, interview terminated",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "do not know"
)

no_yes_do_not_know_refusal <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "do not know",
  `4` = "refusal"
)

no_yes_do_not_know_refusal_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "do not know",
  `4` = "refusal"
)

no_yes_do_not_know_refusal_3 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "do not know",
  `4` = "refusal"
)

no_yes_do_not_know_refused_to_answer <- c(
  `-5` = "na, terminated interview",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "do not know",
  `4` = "refused to answer"
)

no_yes_do_not_know_refused_to_answer_2 <- c(
  `-7` = "na, P outside HH",
  `-6` = "na, no Partner",
  `-5` = "na, terminated interview",
  `-3` = "na, wrong skip",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "do not know",
  `4` = "refused to answer"
)

no_yes_do_not_know_refused_to_answer_3 <- c(
  `-7` = "na, P outside HH",
  `-6` = "na, No Partner",
  `-5` = "na, terminated interview",
  `-3` = "na, wrong skip",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "do not know",
  `4` = "refused to answer"
)

no_yes_do_not_know_refused_to_answer_4 <- c(
  `-5` = "not available, interview terminated",
  `-1` = "not available, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "do not know",
  `4` = "refused to answer"
)

no_yes_do_not_know_refused_to_answer_5 <- c(
  `-5` = "na, interv broken off",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "do not know",
  `4` = "refused to answer"
)

no_yes_elderly_home_yes_nursing_home_somatic <- c(
  `-2` = "na, routing",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, elderly home",
  `3` = "yes, nursing home, somatic",
  `4` = "yes, nursing home, psychogeriatric"
)

no_yes_equal_to_oth_children <- c(
  `-4` = "NA:equal to oth ch'n",
  `-2` = "do not know",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes",
  `3` = "equal to oth children"
)

no_yes_equal_to_oth_children_10 <- c(
  `-5` = "not available,m1 corrected2yes",
  `-4` = "not available,equal to oth ch'n",
  `-3` = "not available,no@dvigm1",
  `-2` = "don't know",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes",
  `3` = "equal to oth children"
)

no_yes_equal_to_oth_children_2 <- c(
  `-4` = "not available,equal to oth ch'n",
  `-2` = "don't know",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes",
  `3` = "equal to oth children"
)

no_yes_equal_to_oth_children_3 <- c(
  `-2` = "do not know",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes",
  `3` = "equal to oth children"
)

no_yes_equal_to_oth_children_4 <- c(
  `-2` = "don't know",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes",
  `3` = "equal to oth children"
)

no_yes_equal_to_oth_children_5 <- c(
  `-5` = "NA:E1 corrected2yes",
  `-4` = "NA:equal to oth ch'n",
  `-3` = "NA:no@dvigE1",
  `-2` = "do not know",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes",
  `3` = "equal to oth children"
)

no_yes_equal_to_oth_children_6 <- c(
  `-5` = "NA:J1 corrected2yes",
  `-4` = "NA:equal to oth ch'n",
  `-3` = "NA:no@dvigJ1",
  `-2` = "do not know",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes",
  `3` = "equal to oth children"
)

no_yes_equal_to_oth_children_7 <- c(
  `-5` = "NA:M1 corrected2yes",
  `-4` = "NA:equal to oth ch'n",
  `-3` = "NA:no@dvigM1",
  `-2` = "do not know",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes",
  `3` = "equal to oth children"
)

no_yes_equal_to_oth_children_8 <- c(
  `-5` = "not available,e1 corrected2yes",
  `-4` = "not available,equal to oth ch'n",
  `-3` = "not available,no@dvige1",
  `-2` = "don't know",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes",
  `3` = "equal to oth children"
)

no_yes_equal_to_oth_children_9 <- c(
  `-5` = "not available,j1 corrected2yes",
  `-4` = "not available,equal to oth ch'n",
  `-3` = "not available,no@dvigj1",
  `-2` = "don't know",
  `-1` = "no answer",
  `1` = "no",
  `2` = "yes",
  `3` = "equal to oth children"
)

no_yes_family_doctor_yes_hospital <- c(
  `-2` = "na, see KMFALLPHCN",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family doctor",
  `3` = "yes, hospital",
  `4` = "yes, family doctor and hospital"
)

no_yes_family_doctor_yes_hospital_2 <- c(
  `-2` = "na, see JMFALLLY",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family doctor",
  `3` = "yes, hospital",
  `4` = "yes, family doctor and hospital"
)

no_yes_family_physician_yes_specialist <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HARTVEI1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_10 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HOTHSI07",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_11 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HRHEUM01&02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_12 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BARTVEI1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_13 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JARTVEI1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_14 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BCANCER1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_15 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BCARA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_16 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JCARA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_17 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BCVA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_18 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JCVA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_19 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BDIABE01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCANCER1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_20 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JDIABE01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_21 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BHART01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_22 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JHART01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_23 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BHBD1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_24 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JHBD1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_25 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BINCON1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_26 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BOTHSI01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_27 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JOTHSI01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_28 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BOTHSI07",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_29 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JOTHSI07",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCARA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_30 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BRHEUM01&02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_31 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JRHEUM01&02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCVA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_5 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HDIABE01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_6 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HHART01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_7 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HHBD1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_8 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HINCON1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_family_physician_yes_specialist_9 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HOTHSI01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, family physician",
  `3` = "yes, specialist"
)

no_yes_insulin_injections_yes_tablets_only <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HDIABE01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, insulin injections",
  `3` = "yes, tablets only"
)

no_yes_left <- c(`-2` = "na, see BMHIPPRO", `-1` = "na, asked", `1` = "no", `2` = "yes, left")

no_yes_no <- c(`-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "no")

no_yes_no_exertion_chest_pain_no_exertion_pain_legs <- c(
  `-6` = "na, see D/E/F/G/HHART01",
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HDIABE01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "no exertion: chest pain",
  `4` = "no exertion: pain legs",
  `5` = "no exertion: shortness of breath",
  `6` = "no exertion: joint complaints",
  `7` = "no exertion: other reason"
)

no_yes_no_exertion_chest_pain_no_exertion_pain_legs_2 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HHART01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "no exertion: chest pain",
  `4` = "no exertion: pain legs",
  `5` = "no exertion: shortness of breath",
  `6` = "no exertion: joint complaints",
  `7` = "no exertion: other reason"
)

no_yes_no_exertion_chest_pain_no_exertion_pain_legs_3 <- c(
  `-6` = "na, see BHART01",
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BDIABE01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "no exertion: chest pain",
  `4` = "no exertion: pain legs",
  `5` = "no exertion: shortness of breath",
  `6` = "no exertion: joint complaints",
  `7` = "no exertion: other reason"
)

no_yes_no_exertion_chest_pain_no_exertion_pain_legs_4 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BHART01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "no exertion: chest pain",
  `4` = "no exertion: pain legs",
  `5` = "no exertion: shortness of breath",
  `6` = "no exertion: joint complaints",
  `7` = "no exertion: other reason"
)

no_yes_no_exertion_chest_pain_no_exertion_pain_legs_5 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JHART01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "no exertion: chest pain",
  `4` = "no exertion: pain legs",
  `5` = "no exertion: shortness of breath",
  `6` = "no exertion: joint complaints",
  `7` = "no exertion: other reason"
)

no_yes_not_allowed_to_vote <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/BRMSO",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "not allowed to vote"
)

no_yes_not_applicable <- c(
  `-5` = "interview terminated",
  `-2` = "not asked, routing",
  `-1` = "no valid answer",
  `1` = "no",
  `2` = "yes",
  `3` = "not applicable"
)

no_yes_not_applicable_2 <- c(
  `-5` = "interview terminated",
  `-2` = "not asked, routing",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "not applicable"
)

no_yes_not_done_various_reasons <- c(`-3` = "not in sample", `1` = "no", `2` = "yes", `3` = "not done various reasons")

no_yes_not_the_past_year_yes_the_past_year <- c(`-1` = "na, asked", `1` = "no", `2` = "yes, not the past year", `3` = "yes, the past year")

no_yes_one_removed_yes_both_removed <- c(
  `-2` = "male respondent",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, one removed",
  `3` = "yes, both removed"
)

no_yes_partly_yes_completely <- c(
  `-5` = "na, age >= 65",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GJOBC",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, partly",
  `3` = "yes, completely"
)

no_yes_partly_yes_completely_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BPJOB1 & BPJOBL1",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, partly",
  `3` = "yes, completely"
)

no_yes_r_does_not_know <- c(`-5` = "na, see KRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "R does not know")

no_yes_r_does_not_know_refused <- c(
  `-5` = "na, interview terminated",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "R does not know",
  `4` = "refused"
)

no_yes_r_does_not_know_refused_2 <- c(
  `-4` = "na, short/terminated interview",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "R does not know",
  `4` = "refused"
)

no_yes_r_does_not_know_refused_3 <- c(
  `-2` = "na, see C/D/E/B/F/GPSYCH",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "R does not know",
  `4` = "refused"
)

no_yes_r_does_not_know_refused_4 <- c(
  `-2` = "na, see H/IPSYCH",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "R does not know",
  `4` = "refused"
)

no_yes_r_refused_to_answer_r_does_not_know <- c(
  `-3` = "na, wrong skip",
  `-2` = "male respondent",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "R refused to answer",
  `4` = "R does not know"
)

no_yes_respondent_does_not_know <- c(
  `-5` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "respondent does not know"
)

no_yes_respondent_does_not_know_refused <- c(
  `-4` = "not available, interview terminated",
  `-1` = "not available, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "respondent does not know",
  `4` = "refused"
)

no_yes_right <- c(`-2` = "na, see BMHIPPRO", `-1` = "na, asked", `1` = "no", `2` = "yes, right")

no_yes_terminated <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "terminated"
)

no_yes_under_consideration_withdrawn <- c(
  `-2` = "no valid data",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "under consideration",
  `4` = "withdrawn"
)

no_yes_unknown <- c(`-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "unknown")

no_yes_with_heavy_exertion_yes_with_light_exertion <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCARA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, with heavy exertion",
  `3` = "yes, with light exertion",
  `4` = "yes, at rest"
)

no_yes_with_heavy_exertion_yes_with_light_exertion_2 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BCARA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, with heavy exertion",
  `3` = "yes, with light exertion",
  `4` = "yes, at rest"
)

no_yes_with_heavy_exertion_yes_with_light_exertion_3 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JCARA01",
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes, with heavy exertion",
  `3` = "yes, with light exertion",
  `4` = "yes, at rest"
)

no_yes_yes_no <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DRM161",
  `-1` = "no valid data / na, asked",
  `1` = "no / yes",
  `2` = "yes / no"
)

no_yes_yes_no_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CRM161",
  `-1` = "no valid data / na, asked",
  `1` = "no / yes",
  `2` = "yes / no"
)

no_yes_yes_no_3 <- c(
  `-5` = "na, interview terminated",
  `-4` = "no valid data",
  `-3` = "na, wrong skip",
  `-2` = "R does not smoke / na, see DMSMOKEYN",
  `-1` = "no answer, asked",
  `1` = "no / yes",
  `2` = "yes / no"
)

no_yes_yes_temporarily_living_elsewhere <- c(
  `-1` = "na, asked",
  `1` = "no",
  `2` = "yes",
  `3` = "yes, temporarily living elsewhere",
  `4` = "lived temporarily elsewhere"
)

none <- c(`-5` = "na, interview terminated", `-1` = "no valid data", `0` = "none")

none_1_7_more_than_7 <- c(`-1` = "no answer", `1` = "none", `2` = "1-7", `3` = "more than 7")

none_1_7_more_than_7_2 <- c(`-1` = "not available", `1` = "none", `2` = "1-7", `3` = "more than 7")

none_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014",
  `-1` = "na, asked",
  `0` = "none"
)

none_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/BHINDEP in LASA014",
  `-1` = "na, asked",
  `0` = "none"
)

none_equal_1pair_2child_equal_3pairs_3child_equal <- c(
  `0` = "none equal",
  `1` = "1pair=2child equal",
  `3` = "3pairs=3child equal",
  `6` = "all equal"
)

none_equal_2_children_equal_estimate_2_pairs_equal <- c(
  `0` = "none equal",
  `2` = "2 children equal",
  `2.8` = "estimate (2 pairs equal)",
  `3` = "3 children equal",
  `3.3` = "estimate (4 pairs equal)",
  `4` = "all children equal"
)

none_glasses_contact_lenses <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CMEYETES",
  `-1` = "na, asked",
  `1` = "none",
  `2` = "glasses",
  `3` = "contact lenses"
)

none_glasses_contact_lenses_2 <- c(`-1` = "no answer, asked", `1` = "none", `2` = "glasses", `3` = "contact lenses")

none_insulin_injections_tablets <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JDIABE01",
  `-1` = "na, asked",
  `1` = "none",
  `2` = "insulin injections",
  `3` = "tablets"
)

none_mentioned_1_mentioned_9_mentioned <- c(`0` = "none mentioned", `1` = "1 mentioned", `9` = "9 mentioned")

none_op_geen_van_beide <- c(
  `1` = "none/op geen van beide",
  `2` = "only on the happiness line/alleen op de gelukslijn",
  `3` = "only on the life line/alleen op de levenslijn",
  `4` = "on both lines/op allebei de lijnen"
)

normal_measurement_cannot_sit_other_to_be_coded <- c(
  `-1` = "no valid measurement",
  `0` = "normal measurement",
  `1` = "cannot sit",
  `2` = "other to be coded"
)

normal_test_not_capable <- c(
  `-6` = "na, test not done",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
  `-1` = "na, asked",
  `1` = "normal test",
  `2` = "not capable",
  `3` = "immediately steps out of position (in less than 1 second)"
)

normal_test_not_capable_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KTANDEM1",
  `-1` = "na, asked",
  `1` = "normal test",
  `2` = "not capable",
  `3` = "immediately steps out of position (in less than 1 second)",
  `5` = "refusal",
  `6` = "physical impossible"
)

normal_test_not_capable_falls_almost_direct <- c(
  `-6` = "na, test not done",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
  `-1` = "na, asked",
  `1` = "normal test",
  `2` = "not capable",
  `3` = "falls almost direct",
  `4` = "stops within 3 sec.",
  `5` = "refusal",
  `6` = "physical impossible"
)

not_a_single_day_1_30_days_31_89_days_90_days_or_more <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JKNEEP1",
  `-1` = "na, asked",
  `1` = "not a single day",
  `2` = "1-30 days",
  `3` = "31-89 days",
  `4` = "90 days or more"
)

not_annoying_at_all_a_bit_annoying_rather_annoying <- c(
  `-2` = "na, see BSENSE18",
  `-1` = "na, asked",
  `1` = "not annoying at all",
  `2` = "a bit annoying",
  `3` = "rather annoying",
  `4` = "most annoying"
)

not_annoying_at_all_a_bit_annoying_rather_annoying_2 <- c(
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "not annoying at all",
  `2` = "a bit annoying",
  `3` = "rather annoying",
  `4` = "most annoying"
)

not_anxious_depressed_moderately_anxious_depressed <- c(
  `-1` = "no answer",
  `1` = "not anxious/depressed",
  `2` = "moderately anxious/depressed",
  `3` = "extreme anxious/depressed"
)

not_asked_asked_cannot_remember <- c(
  `-5` = "na, various reasons",
  `-1` = "na, asked",
  `1` = "not asked",
  `2` = "asked",
  `3` = "cannot remember"
)

not_asked_asked_cannot_remember_2 <- c(
  `-5` = "not available, various reasons",
  `-1` = "not available, asked",
  `1` = "not asked",
  `2` = "asked",
  `3` = "cannot remember"
)

not_asked_asked_no_score <- c(`-2` = "not asked", `-1` = "asked, no score", `0` = NA_character_, `1` = NA_character_)

not_asked_interview_terminated_skip <- c(
  `-3` = "not asked (interview terminated/skip)",
  `-2` = "answer: not applicable",
  `-1` = "no answer"
)

not_at_all_a_little_a_moderate_amount_very_much <- c(
  `-1` = "asked, no answer",
  `1` = "not at all",
  `2` = "a little",
  `3` = "a moderate amount",
  `4` = "very much",
  `5` = "an extreme amount"
)

not_at_all_a_little_bit_moderately_quite_a_bit <- c(
  `-1` = "asked, no answer",
  `1` = "not at all",
  `2` = "a little bit",
  `3` = "moderately",
  `4` = "quite a bit",
  `5` = "extremely"
)

not_at_all_a_little_moderately_quite_a_bit_very_much <- c(
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "a little",
  `3` = "moderately",
  `4` = "quite a bit",
  `5` = "very much"
)

not_at_all_characteristic_not_characteristic <- c(
  `-1` = "no answer",
  `1` = "not at all characteristic",
  `2` = "not characteristic",
  `3` = "somewhat characteristic",
  `4` = "characteristic",
  `5` = "very characteristic"
)

not_at_all_characteristic_not_characteristic_2 <- c(
  `-1` = "not available",
  `1` = "not at all characteristic",
  `2` = "not characteristic",
  `3` = "somewhat characteristic",
  `4` = "characteristic",
  `5` = "very characteristic"
)

not_at_all_involved_not_involved_involved <- c(
  `-1` = "no answer",
  `1` = "not at all involved",
  `2` = "not involved",
  `3` = "involved",
  `4` = "greatly involved"
)

not_at_all_involved_not_involved_involved_2 <- c(
  `-1` = "not available",
  `1` = "not at all involved",
  `2` = "not involved",
  `3` = "involved",
  `4` = "greatly involved"
)

not_at_all_or_hardly_a_burden_somewhat_a_burden <- c(
  `-1` = "na, asked",
  `1` = "not at all or hardly a burden",
  `2` = "somewhat a burden",
  `3` = "rather heavy burden",
  `4` = "very heavy burden",
  `5` = "overburdened"
)

not_at_all_or_hardly_a_burden_somewhat_a_burden_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KPHELP01",
  `-1` = "na, asked",
  `1` = "not at all or hardly a burden",
  `2` = "somewhat a burden",
  `3` = "rather heavy burden",
  `4` = "very heavy burden",
  `5` = "overburdened"
)

not_at_all_sometimes_often_always <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "not at all",
  `2` = "sometimes",
  `3` = "often",
  `4` = "always"
)

not_at_all_sometimes_often_always_10 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HRHEUM01&02",
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "sometimes",
  `3` = "often",
  `4` = "always"
)

not_at_all_sometimes_often_always_11 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BCARA01",
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "sometimes",
  `3` = "often",
  `4` = "always"
)

not_at_all_sometimes_often_always_12 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CCARA01",
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "sometimes",
  `3` = "often",
  `4` = "always"
)

not_at_all_sometimes_often_always_13 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JCARA01",
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "sometimes",
  `3` = "often",
  `4` = "always"
)

not_at_all_sometimes_often_always_2 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCARA01",
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "sometimes",
  `3` = "often",
  `4` = "always"
)

not_at_all_sometimes_often_always_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HARTVEI1",
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "sometimes",
  `3` = "often",
  `4` = "always"
)

not_at_all_sometimes_often_always_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCANCER1",
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "sometimes",
  `3` = "often",
  `4` = "always"
)

not_at_all_sometimes_often_always_5 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCARA01",
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "sometimes",
  `3` = "often",
  `4` = "always"
)

not_at_all_sometimes_often_always_6 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCVA01",
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "sometimes",
  `3` = "often",
  `4` = "always"
)

not_at_all_sometimes_often_always_7 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HDIABE01",
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "sometimes",
  `3` = "often",
  `4` = "always"
)

not_at_all_sometimes_often_always_8 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HHART01",
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "sometimes",
  `3` = "often",
  `4` = "always"
)

not_at_all_sometimes_often_always_9 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HINCON1",
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "sometimes",
  `3` = "often",
  `4` = "always"
)

not_at_all_somewhat_considerably_very_much <- c(
  `-2` = "na, see D/ERMPTSD in LASAD/E291",
  `-1` = "na, asked",
  `1` = "not at all",
  `2` = "somewhat",
  `3` = "considerably",
  `4` = "very much"
)

not_at_all_somewhat_considerably_very_much_2 <- c(
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "not at all",
  `2` = "somewhat",
  `3` = "considerably",
  `4` = "very much"
)

not_available <- c(`-1` = "not available")

not_available_2 <- c(`-2` = "not available")

not_available_no_measurement_not_available_wrong_skip <- c(
  `-6` = "not available, no measurement",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked"
)

not_available_no_measurement_not_available_wrong_skip_2 <- c(
  `-6` = "not available, no measurement",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available"
)

not_available_no_valid_data <- c(
  `-6` = "not available, no valid data",
  `-5` = "not available, interview terminated",
  `-4` = "not available, short interview",
  `-2` = "not available, routing",
  `-1` = "not available, asked"
)

not_available_not_available <- c(`-2` = "not available", `-1` = "not available")

not_available_not_available_2 <- c(`-2` = "not available", `-1` = "not available", `168` = NA_character_)

not_available_not_available_3 <- c(`-2` = "not available", `-1` = "not available", `0` = NA_character_, `168` = NA_character_)

not_available_not_available_4 <- c(`-2` = "not available", `-1` = "not available", `1` = NA_character_, `10` = NA_character_)

not_available_not_living_independently <- c(
  `-4` = "not available, not living independently",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked"
)

not_available_routing <- c(`-2` = "not available, routing")

not_available_routing_no_answer <- c(`-2` = "not available, routing", `-1` = "no answer")

not_available_routing_not_available <- c(`-2` = "not available, routing", `-1` = "not available")

not_available_routing_not_available_asked <- c(`-2` = "not available, routing", `-1` = "not available, asked")

not_available_short_version_not_available_wrong_skip <- c(
  `-4` = "not available, short version",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked"
)

not_available_wrong_skip_not_available_routing <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked"
)

not_changed_gained_weight_lost_weight <- c(`-1` = "na, asked", `1` = "not changed", `2` = "gained weight", `3` = "lost weight")

not_changed_gained_weight_lost_weight_2 <- c(
  `-5` = "na, interview terminated",
  `-1` = "na, asked",
  `1` = "not changed",
  `2` = "gained weight",
  `3` = "lost weight"
)

not_changed_gained_weight_lost_weight_3 <- c(
  `-3` = "na, section not done",
  `-1` = "na, asked",
  `1` = "not changed",
  `2` = "gained weight",
  `3` = "lost weight"
)

not_died_died <- c(
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version",
  `-4` = "do not know",
  `-3` = "died earlier",
  `-2` = "na: died earlier",
  `-1` = "no answer",
  `1` = "not died",
  `2` = "died"
)

not_died_died_10 <- c(
  `-10` = "not asked: no data available",
  `-8` = "technical problems",
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version interview",
  `-4` = "do not know",
  `-3` = "not asked: no sons alive",
  `-2` = "answer: no sons",
  `-1` = "no answer",
  `1` = "not died",
  `2` = "died"
)

not_died_died_11 <- c(
  `-11` = "not asked: routing error",
  `-10` = "not asked: no data available",
  `-8` = "technical problems",
  `-7` = "refusal/skip by interviewer",
  `-6` = "interview nonresponse",
  `-5` = "interview nonresponse",
  `-4` = "response unavailable",
  `-3` = "died earlier",
  `-2` = "prior-death/routing status",
  `-1` = "no answer",
  `1` = "not died",
  `2` = "died"
)

not_died_died_2 <- c(
  `-10` = "not asked: no data available",
  `-8` = "technical problems",
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version interview",
  `-4` = "do not know",
  `-3` = "not asked: died earlier",
  `-2` = "answer: died earlier",
  `-1` = "no answer",
  `1` = "not died",
  `2` = "died"
)

not_died_died_3 <- c(
  `-11` = "not asked: routing error",
  `-10` = "not asked: no data available",
  `-8` = "technical problems",
  `-7` = "refusal/skip by interviewer",
  `-6` = "interview nonresponse",
  `-5` = "interview nonresponse",
  `-4` = "response unavailable",
  `-3` = "no living relative of this type",
  `-2` = "answer: no relative of this type",
  `-1` = "no answer",
  `1` = "not died",
  `2` = "died"
)

not_died_died_4 <- c(
  `-10` = "not asked: no data available",
  `-8` = "technical problems",
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version interview",
  `-4` = "do not know",
  `-3` = "not asked: no brothers alive",
  `-2` = "answer: no brothers",
  `-1` = "no answer",
  `1` = "not died",
  `2` = "died"
)

not_died_died_5 <- c(
  `-10` = "not asked: no data available",
  `-8` = "technical problems",
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version interview",
  `-4` = "do not know",
  `-3` = "not asked: no daughters alive",
  `-2` = "answer: no daughters",
  `-1` = "no answer",
  `1` = "not died",
  `2` = "died"
)

not_died_died_6 <- c(
  `-6` = "refusal/skip by interviewer",
  `-5` = "terminated interview",
  `-4` = "short version",
  `-2` = "not asked",
  `-1` = "no answer",
  `1` = "not died",
  `2` = "died"
)

not_died_died_7 <- c(
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version",
  `-4` = "do not know",
  `-3` = "died earlier",
  `-2` = "not asked",
  `-1` = "no answer",
  `1` = "not died",
  `2` = "died"
)

not_died_died_8 <- c(
  `-11` = "not asked: routing error",
  `-10` = "not asked: no data available",
  `-8` = "technical problems",
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version interview",
  `-4` = "do not know",
  `-3` = "not asked: died earlier",
  `-2` = "answer: died earlier",
  `-1` = "no answer",
  `1` = "not died",
  `2` = "died"
)

not_died_died_9 <- c(
  `-10` = "not asked: no data available",
  `-8` = "technical problems",
  `-7` = "refusal/skip by interviewer",
  `-6` = "terminated interview",
  `-5` = "short version interview",
  `-4` = "do not know",
  `-3` = "not asked: no sisters alive",
  `-2` = "answer: no sisters",
  `-1` = "no answer",
  `1` = "not died",
  `2` = "died"
)

not_enough_room_time_r_refused_exercise_not_safe <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
  `-1` = "na, asked",
  `1` = "not enough room/time",
  `2` = "R refused",
  `3` = "exercise not safe",
  `4` = "physically not capable",
  `5` = "R did not understand",
  `6` = "other"
)

not_equal_equal <- c(`0` = "not equal", `1` = "equal")

not_impeded_unable_to_continue_activities <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JKNEEP1",
  `-1` = "na, asked",
  `0` = "not impeded",
  `10` = "unable to continue activities"
)

not_lonely_niet_eenzaam_moderately_lonely_sterk_eenzaam <- c(
  `-4` = "refusal/skip by interviewer",
  `-3` = "not asked (interview terminated)",
  `-1` = "no answer",
  `1` = "not lonely/niet eenzaam",
  `2` = "moderately lonely/sterk eenzaam",
  `3` = "severely lonely/sterk eenzaam",
  `4` = "extremely lonely/zeer sterk eenzaam"
)

not_mentioned <- c(`-1` = "mentioned", `0` = "not mentioned")

not_mentioned_2 <- c(`-1` = "not available", `0` = "not mentioned")

not_mentioned_binary_category_1_mentioned <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "binary category 1",
  `2` = "mentioned"
)

not_mentioned_binary_category_1_mentioned_2 <- c(
  `-5` = "not available, routing",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "binary category 1",
  `2` = "mentioned"
)

not_mentioned_coding_category_1_mentioned <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "coding category 1",
  `2` = "mentioned"
)

not_mentioned_coding_category_1_mentioned_2 <- c(
  `-6` = "not available, routing",
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "coding category 1",
  `2` = "mentioned"
)

not_mentioned_coding_category_1_mentioned_3 <- c(
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "coding category 1",
  `2` = "mentioned"
)

not_mentioned_coding_category_1_no <- c(`-1` = "no answer", `0` = "not mentioned", `1` = "coding category 1", `2` = "no")

not_mentioned_coding_category_1_no_2 <- c(
  `-2` = "not applicable",
  `-1` = "no answer",
  `0` = "not mentioned",
  `1` = "coding category 1",
  `2` = "no"
)

not_mentioned_coding_category_1_yes <- c(
  `-5` = "interview terminated",
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "coding category 1",
  `2` = "yes"
)

not_mentioned_coding_category_1_yes_2 <- c(
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "coding category 1",
  `2` = "yes"
)

not_mentioned_mentioned <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_10 <- c(`-2` = "na, see J/KMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_100 <- c(
  `-5` = "na, interview terminated",
  `-4` = "na, short interview",
  `-2` = "na, see BHINDEP",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_101 <- c(`-3` = "na, wrong skip", `-2` = "na, see JSOCP95", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_102 <- c(`-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_103 <- c(`-3` = "no test", `-2` = "no", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_104 <- c(`-2` = "na, see C/DMDIET", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_105 <- c(`-2` = "na, see F/G/HMWALKAID", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_106 <- c(`-2` = "na, see IMINDPGB", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_107 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_108 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_109 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see GDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_11 <- c(
  `-2` = "na, see J/KMCIZCTC",
  `-1` = "no answer, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_110 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_111 <- c(`-2` = "na, see klidasdiag", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_112 <- c(
  `-5` = "not available, interview terminated",
  `-4` = "not available, short interview",
  `-2` = "not available, routing",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_113 <- c(`-2` = "na, see DMFALLPHCYN2", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_114 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see IDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_115 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see IPHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_116 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see IRHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_117 <- c(`-2` = "na, see BRSICK01", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_118 <- c(`-2` = "na, see BRSICK15", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_119 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see INHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_12 <- c(
  `-2` = "na, see J/KMHWWCTC",
  `-1` = "no answer, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_120 <- c(`-2` = "na, see HSUFFIC4", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_121 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see IAHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_122 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see IGHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_123 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see JCANCER1 & JCANCE1X",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_124 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see KCANCER1 & KCANCE1X",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_125 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see ESOCPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_126 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see GSOCPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_127 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see JSOCPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_128 <- c(`-2` = "na, see IMEOL06", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_129 <- c(`-2` = "na, see BDHELPYN", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_13 <- c(`-3` = "no test", `-2` = "no particularities", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_130 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see CDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_131 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see EDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_132 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see FDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_133 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see GDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_134 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see HDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_135 <- c(`-3` = "na, wrong skip", `-2` = "na, see BPHELPYN", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_136 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CPHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_137 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see EPHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_138 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see FPHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_139 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see GPHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_14 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_140 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HPHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_141 <- c(`-3` = "na, wrong skip", `-2` = "na, see BRHELPYN", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_142 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see ERHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_143 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HRHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_144 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see HNHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_145 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see HAHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_146 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see HGHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_147 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see HPGBYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_148 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BCANCER6",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_149 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JCANCER6",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_15 <- c(`-2` = "no test", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_150 <- c(`-2` = "na, see KCHOUTD", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_151 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP55",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_152 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP55",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_153 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP72",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_154 <- c(`-2` = "na, see H/IQMUS1 & H/IQMUS3", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_155 <- c(`-2` = "na, see JMFALLLY", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_156 <- c(`-4` = "na, short/terminated interview", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_157 <- c(`-2` = "na, see DEOL05", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_158 <- c(`-2` = "na, see HMEOL06", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_159 <- c(`-2` = "na, see JMEOL06", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_16 <- c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_160 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JARTVEI8",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_161 <- c(
  `-7` = "tumor, uterus not asked, male",
  `-6` = "na, see D/E/F/G/HCANCER5",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCANCER1",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_162 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JHART15",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_163 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BRHEUM09",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_164 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see KRHEUM01&02",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_165 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see KRHEUM09",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_166 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BSOCPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_167 <- c(`-3` = "na, wrong skip", `-2` = "na, see JSOCP72", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_168 <- c(`-2` = "no particularities", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_169 <- c(`-2` = "no", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_17 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/BRHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_170 <- c(`-2` = "na, see H/BMCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_171 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/EMCALF02",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_172 <- c(`-2` = "na, see BMWALKAID", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_173 <- c(`-2` = "na, see DMWALKAID", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_174 <- c(
  `-5` = "na, see I/J/KHINDEP",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/J/KSPECADJ",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_175 <- c(`-2` = "na, see BSATIS", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_176 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BWALK09",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_177 <- c(
  `-6` = "na, see BCANCER5",
  `-3` = "na, wrong skip",
  `-2` = "na, see BCANCER1",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_178 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BCANCER1",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_179 <- c(
  `-6` = "na, see CCANCER5",
  `-3` = "na, wrong skip",
  `-2` = "na, see CCANCER1",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_18 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HRHEUM01&02",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_180 <- c(
  `-6` = "na, see ICANCER5",
  `-3` = "na, wrong skip",
  `-2` = "na, see ICANCER1",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_181 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CCANCER6",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_182 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CRHEUM01&02",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_183 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CRHEUM09",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_184 <- c(`-2` = "na, see bqhhyn", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_185 <- c(`-2` = "na, see bqphyn", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_186 <- c(`-2` = "na, see BMHHYN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_187 <- c(`-2` = "na, see BMPHYN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_188 <- c(`-2` = "na, see BPETS", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_189 <- c(`-2` = "na, see D/EPETS", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_19 <- c(`-2` = "no recall test", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_190 <- c(
  `-5` = "na, see BHINDEP",
  `-3` = "na, wrong skip",
  `-2` = "na, see BSPECADJ",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_191 <- c(
  `-3` = "not available, wrong skip",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_192 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BCANCER1",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_193 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see ESOCP78",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_194 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see GSOCP78",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_195 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see JSOCP97",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_196 <- c(`-2` = "na, see DEOL26", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_197 <- c(`-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_198 <- c(`-3` = "na, wrong skip", `-2` = "na, see C/DMDIZZR", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_199 <- c(`-2` = "na, see F/GMDIZZR", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_2 <- c(`-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_20 <- c(`0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_200 <- c(`-2` = "na, see DMFALLMHLPYN2", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_201 <- c(`-2` = "na, see DMFALLPHCYN1", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_202 <- c(
  `-4` = "na, short/terminated interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see IHINDEP",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_203 <- c(`-2` = "na, see DMFALLMHLPYN1", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_204 <- c(`-2` = "na, see KMEOL06", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_205 <- c(`-2` = "na, see GHOUSE2", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_206 <- c(
  `-4` = "no answer, short version",
  `-3` = "na, wrong skip",
  `-2` = "na, see BRETIFUT",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_207 <- c(`-2` = "na, see HRETIFUT", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_208 <- c(
  `-4` = "no answer, short version",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_209 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/B/I/J/KWALK09",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_21 <- c(
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_210 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see KCANCER6",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_211 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see GSOCP55",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_212 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see JSOCP55",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_213 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see ESOCP72",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_214 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see GSOCP72",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_215 <- c(`-2` = "na, see DEOL01", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_216 <- c(`-2` = "na, see DEOL02", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_217 <- c(
  `-4` = "interview terminated",
  `-3` = "no recall test",
  `-2` = "no particularities",
  `-1` = "no other reason",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_218 <- c(`-2` = "na, see d/e/b/f/gm15wtp0", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_219 <- c(
  `-2` = "na, see HMWMOMUN",
  `-1` = "no answer, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_22 <- c(
  `-4` = "na, short/terminated interview",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_220 <- c(`-2` = "na, see HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_221 <- c(`-2` = "na, see CMCONFBED", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_222 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HSPECADJ",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_223 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CARTVEI8",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_224 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see KARTVEI8",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_225 <- c(
  `-7` = "tumor, prostate not asked, female",
  `-6` = "na, see D/E/F/G/HCANCER5",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCANCER1",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_226 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BCANCER6",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_227 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CHART15",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_228 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HHART15",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_229 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see KHART15",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_23 <- c(
  `-6` = "na, see D/E/F/G/HCANCER5",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCANCER1",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_230 <- c(`-2` = "no answer, see jqvalu18", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_231 <- c(`-2` = "na, see d/e/b/f/gm15wrp0", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_232 <- c(`-2` = "na, see h/b/i/j/km15wrp0", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_233 <- c(`-2` = "na, see H/B/I/J/KM15WTP0", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_234 <- c(
  `-4` = "interview terminated",
  `-3` = "no recall test",
  `-2` = "no particularities / no recall test",
  `-1` = "no other reason",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_235 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BMCALF02",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_236 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see GMCALF02",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_237 <- c(`-2` = "na, see EMWALKAID", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_238 <- c(
  `-2` = "not applicable based on routing/PGB indication status",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_239 <- c(`-2` = "na, see FMEOL14", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_24 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HRHEUM09",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_240 <- c(`-2` = "na, see FMEOL04", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_241 <- c(`-2` = "na, see GMEOL04", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_242 <- c(`-2` = "na, see HMEOL04", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_243 <- c(`-2` = "na, see IMEOL04", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_244 <- c(`-2` = "na, see JMEOL04", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_245 <- c(`-2` = "na, see KMEOL04", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_246 <- c(`-2` = "na, see CPETS", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_247 <- c(
  `-5` = "na, see HHINDEP",
  `-3` = "na, wrong skip",
  `-2` = "na, see HSPECADJ",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_248 <- c(
  `-5` = "not available, routing",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_249 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see ICANCER1",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_25 <- c(
  `-4` = "no valid data",
  `-3` = "no test",
  `-2` = "no particularities",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_250 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/C/D/E/BLPHYA39",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_251 <- c(`-2` = "na, see DMARMPAR", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_252 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/I/JMGRIPLP1",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_253 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/I/JMGRIPRP1",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_254 <- c(
  `-2` = "na, see H/B/I/JMHEIGHTP",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_255 <- c(`-2` = "na, see H/B/I/JMHIPP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_256 <- c(`-2` = "na, see H/B/I/JMWAISTP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_257 <- c(
  `-2` = "na, see H/B/I/JMWEIHGTP",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_258 <- c(`-2` = "na, see H/B/I/JMARMP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_259 <- c(`-2` = "na, see CMDIET", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_26 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see KRETIRED",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_260 <- c(`-3` = "na, wrong skip", `-2` = "na, see CMBOT6", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_261 <- c(`-2` = "na, see DMBOT6", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_262 <- c(`-3` = "na, wrong skip", `-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_263 <- c(
  `-3` = "section not done",
  `-2` = "na, no contact about services",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_264 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BDIABE05",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_265 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CDIABE05",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_266 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see IDIABE05",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_267 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see F/G/HRHEUM01&02",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_268 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see F/G/HRHEUM09",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_269 <- c(`-2` = "na, see KDIABE03", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_27 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see FRHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_270 <- c(`-2` = "na, see BFACIL", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_271 <- c(
  `-5` = "not available, interview terminated",
  `-4` = "not available",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_272 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP93",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_273 <- c(`-2` = "na, see CMARMPAR", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_274 <- c(
  `-2` = "no answer, see F/GMATTW",
  `-1` = "no answer, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_275 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DMBICEPP",
  `-1` = "no valid data",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_276 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DMTRICEPP",
  `-1` = "no valid data",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_277 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see KSPECADJ",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_278 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JSPECADJ",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_279 <- c(
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_28 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_280 <- c(
  `-7` = "tumor, uterus not asked, male",
  `-6` = "na, see CCANCER5",
  `-3` = "na, wrong skip",
  `-2` = "na, see CCANCER1",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_281 <- c(
  `-7` = "tumor, uterus not asked, male",
  `-6` = "na, see ICANCER5",
  `-3` = "na, wrong skip",
  `-2` = "na, see ICANCER1",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_282 <- c(
  `-7` = "tumor, uterus not asked, male",
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see JCANCER1 & JCANCE1X",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_283 <- c(
  `-7` = "tumor, uterus not asked, male",
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see KCANCER1 & KCANCE1X",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_284 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_285 <- c(
  `-4` = "not available, interview terminated",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_286 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DMHIPP",
  `-1` = "no valid data",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_287 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DMWAISTP",
  `-1` = "no valid data",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_288 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DMARMP",
  `-1` = "no valid data",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_289 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CMSUBSCAPP",
  `-1` = "no valid data",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_29 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP95",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_290 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CMSUPRAILP",
  `-1` = "no valid data",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_291 <- c(`-2` = "na, see H/BRM171", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_292 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see MCALF02",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_3 <- c(
  `-5` = "na, interview terminated",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_30 <- c(`-2` = "not available", `-1` = "not available", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_31 <- c(`-1` = "no answer", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_32 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_33 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP72",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_34 <- c(`-2` = "na, see I/J/KQPHYN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_35 <- c(`-2` = "na, see G/HMWMOMUN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_36 <- c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_37 <- c(
  `-2` = "na, see C/D/E/F/GRETIFUT",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_38 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see J/KDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_39 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KPHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_4 <- c(`-2` = "na, routing", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_40 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KRHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_41 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see J/KNHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_42 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KAHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_43 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see J/KGHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_44 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCANCER6",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_45 <- c(
  `-4` = "na, short/terminated interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see H/BHINDEP",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_46 <- c(
  `-5` = "not available, interview terminated",
  `-4` = "not available, interview terminated",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_47 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see F/G/H/B/I/JLPHYA39",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_48 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_49 <- c(`-2` = "na, see J/KMINDTYPE", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_5 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_50 <- c(`-2` = "na, see F/G/H/B/I/JPTS", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_51 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/BDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_52 <- c(`-2` = "na, see I/J/KQHHYN", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_53 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CRHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_54 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see GRHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_55 <- c(`-2` = "na, see BSUFFIC4", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_56 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_57 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_58 <- c(
  `-2` = "na, see IMCIZCTC",
  `-1` = "no answer, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_59 <- c(
  `-2` = "na, see IMHWWCTC",
  `-1` = "no answer, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_6 <- c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_60 <- c(
  `-5` = "na, see C/D/E/F/GHINDEP",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GSPECADJ",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_61 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HARTVEI8",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_62 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see D/BDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_63 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see BDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_64 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/BPHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_65 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BPHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_66 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BRHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_67 <- c(
  `-3` = "na wrong skip",
  `-2` = "na, see BNHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_68 <- c(`-2` = "na, see I/JCHOUTD", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_69 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP97",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_7 <- c(
  `-5` = "na, interview terminated",
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/GHINDEP",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_70 <- c(`-2` = "na, see b/fqphyn", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_71 <- c(`-2` = "na, see g/hqphyn", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_72 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/I/JRM161",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_73 <- c(
  `-2` = "na, see C/DMFEETINSP",
  `-1` = "no valid data / na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_74 <- c(`-2` = "na, see JJOBS", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_75 <- c(`-2` = "na, see KJOBS", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_76 <- c(`-2` = "na, see DMFALLADJ", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_77 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BRHEUM01&02",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_78 <- c(
  `-4` = "na, terminated interview",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_79 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCANCER1",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_8 <- c(`-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_80 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JRHEUM01&02",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_81 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JRHEUM09",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_82 <- c(`-2` = "na, see IMWMOCTC", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_83 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BRHEUM09",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_84 <- c(
  `-5` = "na, interview terminated",
  `-4` = "na, short interview",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_85 <- c(
  `-5` = "not available, interview terminated",
  `-4` = "not available, short interview",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_86 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BSPECADJ",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_87 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/ISOCP55",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_88 <- c(`-2` = "na, see b/fqhhyn", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_89 <- c(`-2` = "na, see g/hqhhyn", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_9 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GSPECADJ",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_90 <- c(`-2` = "na, never experienced", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_91 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BSPECADJ",
  `-1` = "na, asked",
  `1` = "not mentioned",
  `2` = "mentioned"
)

not_mentioned_mentioned_92 <- c(
  `-4` = "na, short version",
  `-3` = "na, wrong skip",
  `-2` = "na, see BCANCER1",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_93 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see IDHELPYN",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_94 <- c(`-2` = "na, see BMCARCO", `0` = "not mentioned", `1` = "mentioned")

not_mentioned_mentioned_95 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP78",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_96 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/J/KSPECADJ",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_97 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BARTVEI8",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_98 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HDIABE05",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_99 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BHART15",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "mentioned"
)

not_mentioned_mentioned_other_to_be_coded <- c(
  `-2` = "not available",
  `-1` = "not available",
  `0` = "not mentioned",
  `1` = "mentioned",
  `2` = "other to be coded"
)

not_mentioned_no_mentioned_yes <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BRM161",
  `-1` = "no valid data / na, asked",
  `0` = "not mentioned",
  `1` = "no / mentioned",
  `2` = "yes"
)

not_mentioned_no_mentioned_yes_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see DRM161",
  `-1` = "no valid data / na, asked",
  `0` = "not mentioned",
  `1` = "no / mentioned",
  `2` = "yes"
)

not_mentioned_no_yes <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CMBOT6",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "no",
  `2` = "yes"
)

not_mentioned_particularity_status_yes <- c(
  `-3` = "not applicable / skipped",
  `-2` = "na, see MCALF02",
  `-1` = "na, asked",
  `0` = "not mentioned",
  `1` = "particularity status",
  `2` = "yes",
  `3` = "not done various reasons"
)

not_needed_prefer_self_regulation_did_not_know <- c(
  `-2` = "na, routing",
  `-1` = "na, asked",
  `1` = "not needed",
  `2` = "prefer self-regulation",
  `3` = "did not know",
  `4` = "do not dare/not able",
  `5` = "other reason"
)

not_recognizing_content_recognizing_content <- c(
  `-2` = "na, see D/E/BRMGL",
  `-1` = "na, asked",
  `1` = "not recognizing content",
  `2` = "recognizing content"
)

not_recognizing_content_recognizing_content_2 <- c(
  `-2` = "na, see CRMGL",
  `-1` = "na, asked",
  `1` = "not recognizing content",
  `2` = "recognizing content"
)

not_recognizing_content_recognizing_content_3 <- c(
  `-2` = "na, see FRMGL",
  `-1` = "na, asked",
  `1` = "not recognizing content",
  `2` = "recognizing content"
)

not_recognizing_content_recognizing_content_4 <- c(
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "not recognizing content",
  `2` = "recognizing content"
)

not_reported_heel_ankle_hip_coccyx_other_place <- c(
  `-3` = "no valid data",
  `-1` = "no answer, asked",
  `0` = "not reported",
  `1` = "heel",
  `2` = "ankle",
  `3` = "hip",
  `4` = "coccyx",
  `5` = "other place"
)

not_reported_no_decubitus_phase_1 <- c(`-3` = "no valid data", `0` = "not reported", `1` = "no decubitus", `2` = "phase 1")

not_reported_nurse_other_elderly_care <- c(
  `-3` = "no valid data",
  `-2` = "living at home",
  `-1` = "no answer, asked",
  `0` = "not reported",
  `4` = "nurse",
  `7` = "other: elderly care"
)

not_reported_oneself <- c(
  `-3` = "no valid data",
  `-2` = "in nursing home",
  `-1` = "no answer, asked",
  `0` = "not reported",
  `1` = "oneself"
)

not_reported_reported <- c(`-2` = "na, see BMSPEC#", `0` = "not reported", `1` = "reported")

not_reported_reported_2 <- c(
  `-2` = "not applicable, see number of specialists reported",
  `0` = "not reported",
  `1` = "reported"
)

not_reported_reported_3 <- c(`-2` = "na, see FMSPEC#", `0` = "not reported", `1` = "reported")

not_reported_reported_4 <- c(`-2` = "na, see GMSPEC#", `0` = "not reported", `1` = "reported")

not_reported_reported_5 <- c(`-2` = "na, see DMSPEC#", `0` = "not reported", `1` = "reported")

not_reported_reported_6 <- c(`-2` = "na, see EMSPEC#", `0` = "not reported", `1` = "reported")

not_reported_reported_7 <- c(`-2` = "na, see HMSPEC#", `0` = "not reported", `1` = "reported")

not_reported_reported_8 <- c(`-2` = "na, see IMSPEC#", `0` = "not reported", `1` = "reported")

not_reported_reported_9 <- c(`-2` = "na, see CMSPEC#", `0` = "not reported", `1` = "reported")

not_sharing_sharing_household <- c(`-1` = "unknown", `0` = "not sharing", `1` = "sharing household")

not_the_a_confidant_1st_confidant_2nd_confidant <- c(
  `-6` = "identified persons is your confidant? / Welke van alle hiervoor genoemde personen beschouwt U als Uw vertrouwenspersoon?) see 247",
  `-3` = "RCF/SYS addition",
  `0` = "not the/a confidant",
  `1` = "(1st) confidant",
  `2` = "2nd confidant",
  `3` = "3rd confidant",
  `4` = "4th confidant",
  `5` = "5th confidant",
  `6` = "6th confidant",
  `7` = "7th confidant",
  `8` = "8th confidant",
  `9` = "9th/last confidant"
)

number_unknown_no_specific_information <- c(
  `-2` = "number unknown/no specific information",
  `-1` = "no answer/refusal/interview terminated",
  `0` = NA_character_,
  `1` = NA_character_,
  `4` = NA_character_,
  `6` = NA_character_,
  `10` = NA_character_
)

obtain_information_application_for_a_new_facility <- c(
  `-2` = "na, see GMWMOMUN",
  `-1` = "no answer, asked",
  `1` = "obtain information",
  `2` = "application for a new facility",
  `3` = "re-evaluation domestic care",
  `4` = "extension of an indication",
  `5` = "filing a complaint",
  `6` = "other reason"
)

once_two_times_or_more <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCVA02A",
  `-1` = "na, asked",
  `1` = "once",
  `2` = "two times or more"
)

once_two_times_or_more_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HHART05",
  `-1` = "na, asked",
  `1` = "once",
  `2` = "two times or more"
)

once_two_times_or_more_3 <- c(
  `-4` = "na, no short version",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/GCVA01",
  `-1` = "na, asked",
  `1` = "once",
  `2` = "two times or more"
)

once_two_times_or_more_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BHART05",
  `-1` = "na, asked",
  `1` = "once",
  `2` = "two times or more"
)

once_two_times_or_more_5 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BCVA02A",
  `-1` = "na, asked",
  `1` = "once",
  `2` = "two times or more"
)

once_two_times_or_more_6 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "once",
  `2` = "two times or more"
)

only_once_short_cure_na_see_d_e_b_fmmedcort <- c(
  `-3` = "only once/ short cure",
  `-2` = "na, see D/E/B/FMMEDCORT",
  `-1` = "R does not know period / na, asked"
)

only_stairs_elevator_present_other <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GFDOOR",
  `-1` = "na, asked",
  `1` = "only stairs",
  `2` = "elevator present",
  `3` = "other"
)

ordinal_category_0_ordinal_category_1 <- c(
  `-5` = "not available",
  `-1` = "not available, asked",
  `0` = "ordinal category 0",
  `1` = "ordinal category 1",
  `2` = "ordinal category 2",
  `3` = "ordinal category 3"
)

other_method <- c(`15` = "other method")

own_and_use_own_no_use_no <- c(`-1` = "na, asked", `1` = "own and use", `2` = "own, no use", `3` = "no")

owner_tenant_subtenant_resident_free <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/H/I/J/KHINDEP in LASAC/D/E/F/H/I/J/K014",
  `-1` = "na, asked",
  `1` = "owner",
  `2` = "tenant",
  `3` = "subtenant",
  `4` = "resident",
  `5` = "free"
)

parquet_tiles_low_carpet_high_carpet <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/HWALK03",
  `-1` = "na, asked",
  `1` = "parquet/tiles",
  `2` = "low carpet",
  `3` = "high carpet",
  `4` = "not done/terminated"
)

proxy_unit_nonresponse <- c(
  `-5` = "short version",
  `-4` = "refusal/skip by interviewer",
  `-3` = "terminated interview",
  `-1` = ">1 missing items",
  `0` = NA_character_,
  `6` = NA_character_,
  `7` = "proxy (unit nonresponse)",
  `8` = "telephone interview (unit nonresponse)",
  `9` = "born <=1907 or >1937"
)

pulse <- c(`1` = "Pulse")

pulse_2 <- c(`2` = "Pulse")

pulse_wrist_colles_forearm_humerus_hand_fingers <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CMBOT8#",
  `1` = "pulse/wrist, colles",
  `2` = "forearm, humerus",
  `3` = "hand, fingers",
  `4` = "other upper extremities",
  `5` = "rib",
  `6` = "cymbal/pelvis",
  `7` = "ankle",
  `8` = "feet, toes",
  `9` = "hip",
  `10` = "other lower extremities",
  `11` = "head, neck",
  `12` = "vertebra",
  `13` = "unknown"
)

pulse_wrist_colles_forearm_humerus_hand_fingers_2 <- c(
  `-2` = "na, see D/EMBOT1#",
  `1` = "pulse/wrist, colles",
  `2` = "forearm, humerus",
  `3` = "hand, fingers",
  `4` = "other upper extremities",
  `5` = "rib",
  `6` = "cymbal/pelvis",
  `7` = "ankle",
  `8` = "feet, toes",
  `9` = "hip",
  `10` = "other lower extremities",
  `11` = "head, neck",
  `12` = "vertebra",
  `13` = "unknown"
)

pulse_wrist_colles_forearm_humerus_hand_fingers_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CMBOT1#",
  `1` = "pulse/wrist, colles",
  `2` = "forearm, humerus",
  `3` = "hand, fingers",
  `4` = "other upper extremities",
  `5` = "rib",
  `6` = "cymbal/pelvis",
  `7` = "ankle",
  `8` = "feet, toes",
  `9` = "hip",
  `10` = "other lower extremities",
  `11` = "head, neck",
  `12` = "vertebra",
  `13` = "unknown"
)

pulse_wrist_colles_forearm_humerus_hand_fingers_4 <- c(
  `-2` = "na, see BMBOT1#",
  `-1` = "na, asked",
  `1` = "pulse/wrist, colles",
  `2` = "forearm, humerus",
  `3` = "hand, fingers",
  `4` = "other upper extremities",
  `5` = "rib",
  `6` = "cymbal/pelvis",
  `7` = "ankle",
  `8` = "feet, toes",
  `9` = "hip",
  `10` = "other lower extremities",
  `11` = "head, neck",
  `12` = "vertebra",
  `13` = "unknown"
)

questions_048_not_asked_no_answer <- c(
  `-2` = "questions 048 not asked",
  `-1` = "no answer",
  `0` = NA_character_,
  `1` = NA_character_,
  `13` = NA_character_
)

r_cannot_sit_measurement_error <- c(
  `-3` = "section not done",
  `-2` = "normal test",
  `-1` = "partially no valid measurement",
  `1` = "R cannot sit",
  `2` = "measurement error",
  `3` = "painful arm, no measurement",
  `4` = "measurement on right arm",
  `5` = "(part of) test refused",
  `6` = "part of test wrongfully not done",
  `8` = "- to be coded -"
)

r_cannot_sit_measurement_error_2 <- c(
  `-3` = "not available",
  `-2` = "not available",
  `-1` = "not available",
  `1` = "R cannot sit",
  `2` = "measurement error",
  `3` = "painful arm, no measurement",
  `4` = "measurement on right arm",
  `5` = "(part of) test refused",
  `6` = "part of test wrongfully not done",
  `8` = "- to be coded -"
)

r_gets_no_help <- c(
  `0` = "R gets no help",
  `1` = "R gets any help (personal, domestic, nursing, guidance or administrative)"
)

r_refused_no_valid_measurement <- c(`-2` = "R refused", `-1` = "no valid measurement")

rarely_or_never_monthly_weekly_or_more_often <- c(`-1` = "no answer", `1` = "rarely or never", `2` = "monthly", `3` = "weekly or more often")

rarely_or_never_monthly_weekly_or_more_often_2 <- c(
  `-1` = "not available",
  `1` = "rarely or never",
  `2` = "monthly",
  `3` = "weekly or more often"
)

rarely_or_never_some_of_the_time_occasionally <- c(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
  `-1` = "na, asked",
  `0` = "rarely or never",
  `1` = "some of the time",
  `2` = "occasionally",
  `3` = "mostly or always"
)

rarely_or_never_some_of_the_time_occasionally_2 <- c(
  `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
  `-1` = "na, asked",
  `0` = "rarely or never",
  `1` = "some of the time",
  `2` = "occasionally",
  `3` = "mostly or always"
)

rarely_or_never_some_of_the_time_occasionally_3 <- c(
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "rarely or never",
  `1` = "some of the time",
  `2` = "occasionally",
  `3` = "mostly or always"
)

rarely_or_never_some_of_the_time_occasionally_4 <- c(
  `-2` = "na, see bmrmanx in LASMB226",
  `-1` = "na, asked",
  `0` = "rarely or never",
  `1` = "some of the time",
  `2` = "occasionally",
  `3` = "mostly or always"
)

rarely_sometimes_often_almost_always <- c(
  `-1` = "no answer, asked",
  `1` = "rarely",
  `2` = "sometimes",
  `3` = "often",
  `4` = "almost always"
)

rarely_sometimes_often_almost_always_2 <- c(
  `-3` = "no valid data",
  `-2` = "no measurement done",
  `-1` = "no answer, asked",
  `1` = "rarely",
  `2` = "sometimes",
  `3` = "often",
  `4` = "almost always"
)

rarely_sometimes_often_almost_always_3 <- c(
  `-3` = "no valid data",
  `-1` = "no answer, asked",
  `1` = "rarely",
  `2` = "sometimes",
  `3` = "often",
  `4` = "almost always"
)

recall_done_see_cm15wtrm_refused <- c(`-4` = "interview terminated", `0` = "recall done", `1` = "see cm15wtrm", `2` = "refused")

recall_test_not_done_no_valid_time_data <- c(`-2` = "recall test not done", `-1` = "no valid time data")

recall_test_not_done_recall_test_done <- c(`1` = "recall test not done", `2` = "recall test done")

refusal_skip_by_interviewer_terminated_interview <- c(
  `-4` = "refusal/skip by interviewer",
  `-3` = "terminated interview",
  `-2` = ">1 missing items",
  `0` = NA_character_,
  `11` = NA_character_
)

refused_not_able_cognitive_not_able_physical <- c(
  `-2` = "valid data",
  `4` = "refused",
  `5` = "not able (cognitive)",
  `6` = "not able (physical)",
  `7` = "technical problem",
  `8` = "unknown"
)

refused_not_able_to_cognitive_not_able_to_physical <- c(
  `-2` = "na, see CMEYETES",
  `4` = "refused",
  `5` = "not able to [cognitive]",
  `6` = "not able to [physical]",
  `7` = "technical problems",
  `8` = "unknown"
)

regular_hours_9_to_5 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GJOBC",
  `-1` = "na, asked",
  `1` = "regular hours (9 to 5)",
  `2` = "regular hours, including night/weekend shifts",
  `3` = "shift work, no weekend shifts",
  `4` = "shift work, including weekend shifts",
  `5` = "irregular hours, no weekend shifts",
  `6` = "irregular hours, including weekend shifts"
)

regular_hours_9_to_5_2 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "regular hours (9 to 5)",
  `2` = "regular hours, including night/weekend shifts",
  `3` = "shift work, no weekend shifts",
  `4` = "shift work, including weekend shifts",
  `5` = "irregular hours, no weekend shifts",
  `6` = "irregular hours, including weekend shifts"
)

regular_hours_9_to_5_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BJOB1",
  `-1` = "na, asked",
  `1` = "regular hours (9 to 5)",
  `2` = "regular hours, including night/weekend shifts",
  `3` = "shift work, no weekend shifts",
  `4` = "shift work, including weekend shifts",
  `5` = "irregular hours, no weekend shifts",
  `6` = "irregular hours, including weekend shifts"
)

regular_hours_9_to_5_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BJOBL1",
  `-1` = "na, asked",
  `1` = "regular hours (9 to 5)",
  `2` = "regular hours, including night/weekend shifts",
  `3` = "shift work, no weekend shifts",
  `4` = "shift work, including weekend shifts",
  `5` = "irregular hours, no weekend shifts",
  `6` = "irregular hours, including weekend shifts"
)

regular_hours_9_to_5_5 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BPJOB1",
  `-1` = "na, asked",
  `1` = "regular hours (9 to 5)",
  `2` = "regular hours, including night/weekend shifts",
  `3` = "shift work, no weekend shifts",
  `4` = "shift work, including weekend shifts",
  `5` = "irregular hours, no weekend shifts",
  `6` = "irregular hours, including weekend shifts"
)

regular_hours_9_to_5_6 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BPJOBL1",
  `-1` = "na, asked",
  `1` = "regular hours (9 to 5)",
  `2` = "regular hours, including night/weekend shifts",
  `3` = "shift work, no weekend shifts",
  `4` = "shift work, including weekend shifts",
  `5` = "irregular hours, no weekend shifts",
  `6` = "irregular hours, including weekend shifts"
)

regular_version_mmse_regular_version_mmse <- c(`-2` = "MMSE version", `1` = "regular version MMSE", `2` = "regular version MMSE")

related_to_eating_physical_inactivity <- c(
  `-3` = "no valid data",
  `-2` = "no weight gain",
  `-1` = "no answer, asked",
  `1` = "related to eating",
  `2` = "physical inactivity",
  `3` = "eating and physical inactivity",
  `4` = "medical reasons",
  `5` = "other"
)

replacements_slim_fast <- c(`7` = "replacements (Slim Fast)")

respondent_already_walked_can_walk_with_aid <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
  `-1` = "na, asked",
  `1` = "respondent already walked",
  `2` = "can walk (with aid)",
  `3` = "can walk with aid not available",
  `4` = "cannot walk"
)

respondent_bedridden_respondent_in_elec_wheelchair <- c(
  `-5` = "na, interview terminated",
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-1` = "na, asked",
  `1` = "respondent bedridden",
  `2` = "respondent in elec. wheelchair",
  `3` = "respondent in mech. wheelchair",
  `4` = "not 1, 2 or 3"
)

respondent_bedridden_respondent_in_elec_wheelchair_2 <- c(
  `-5` = "na, interview terminated",
  `-4` = "na, short interview",
  `-3` = "not done, wrong skip",
  `-1` = "na, asked",
  `1` = "respondent bedridden",
  `2` = "respondent in elec. wheelchair",
  `3` = "respondent in mech. wheelchair",
  `4` = "not 1, 2 or 3"
)

respondent_spouse_child_ren_private_help_other <- c(
  `-2` = "na, routing",
  `-1` = "na, asked",
  `1` = "respondent",
  `2` = "spouse",
  `3` = "child(ren)",
  `4` = "private help",
  `5` = "other"
)

rheumatic_hands_no_rheumatic_hands <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HRHEUM01&02",
  `-1` = "na, asked",
  `1` = "rheumatic hands",
  `2` = "no rheumatic hands",
  `3` = "observation not possible"
)

rheumatic_hands_no_rheumatic_hands_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BRHEUM01&02",
  `-1` = "na, asked",
  `1` = "rheumatic hands",
  `2` = "no rheumatic hands",
  `3` = "observation not possible"
)

rheumatic_hands_no_rheumatic_hands_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JRHEUM01&02",
  `-1` = "na, asked",
  `1` = "rheumatic hands",
  `2` = "no rheumatic hands",
  `3` = "observation not possible"
)

right_left_right_and_left <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "right",
  `2` = "left",
  `3` = "right and left"
)

right_left_right_and_left_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JRHEUM10A",
  `-1` = "na, asked",
  `1` = "right",
  `2` = "left",
  `3` = "right and left"
)

right_left_right_and_left_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JRHEUM10A2",
  `-1` = "na, asked",
  `1` = "right",
  `2` = "left",
  `3` = "right and left"
)

right_left_right_and_left_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JRHEUM10A3",
  `-1` = "na, asked",
  `1` = "right",
  `2` = "left",
  `3` = "right and left"
)

right_side_left_side_not_applicable <- c(
  `-2` = "na, see H/B/IMBOT1#",
  `-1` = "na, asked",
  `1` = "right side",
  `2` = "left side",
  `3` = "not applicable"
)

right_side_left_side_not_applicable_2 <- c(
  `-2` = "na, see JMBOT#",
  `-1` = "na, asked",
  `1` = "right side",
  `2` = "left side",
  `3` = "not applicable"
)

right_side_left_side_not_applicable_3 <- c(
  `-2` = "na, see BMBOT1#",
  `-1` = "na, asked",
  `1` = "right side",
  `2` = "left side",
  `3` = "not applicable"
)

right_side_left_side_not_applicable_4 <- c(
  `-2` = "na, see FMBOT1#",
  `-1` = "na, asked",
  `1` = "right side",
  `2` = "left side",
  `3` = "not applicable"
)

right_side_left_side_not_applicable_5 <- c(
  `-2` = "na, see GMBOT1#",
  `-1` = "na, asked",
  `1` = "right side",
  `2` = "left side",
  `3` = "not applicable"
)

right_side_left_side_not_applicable_6 <- c(
  `-2` = "na, see KMBOT#",
  `-1` = "na, asked",
  `1` = "right side",
  `2` = "left side",
  `3` = "not applicable"
)

see_bmmeno03_na_asked <- c(`-2` = "see BMMENO03", `-1` = "na, asked")

see_bmmeno07 <- c(`-2` = "see BMMENO07")

see_bmmeno14 <- c(`-2` = "see BMMENO14")

see_bmmeno61_na_asked <- c(`-2` = "see BMMENO61", `-1` = "na, asked")

see_bmmeno63_na_asked <- c(`-2` = "see BMMENO63", `-1` = "na, asked")

see_bmmeno82 <- c(`-2` = "see BMMENO82")

see_chart02_no_yes <- c(`1` = "see chart02, no", `2` = "yes")

severe_underweight_underweight_approx_normal_weight <- c(
  `-1` = "na, asked",
  `1` = "severe underweight",
  `2` = "underweight",
  `3` = "approx.. normal weight",
  `4` = "overweight",
  `5` = "severe overweight",
  `6` = "do not know"
)

severe_underweight_underweight_approx_normal_weight_2 <- c(
  `-3` = "na, section not done",
  `-1` = "na, asked",
  `1` = "severe underweight",
  `2` = "underweight",
  `3` = "approx. normal weight",
  `4` = "overweight",
  `5` = "severe overweight",
  `6` = "do not know"
)

short_interview <- c(`-2` = "valid data", `1` = "short interview")

short_interview_insufficient_light <- c(
  `-3` = "no data",
  `-2` = "(partial) valid data",
  `1` = "short interview",
  `2` = "insufficient light",
  `3` = "visually impaired/(partially) blind",
  `4` = "physically unable",
  `5` = "aphasia/illiterate",
  `6` = "equipment failure",
  `7` = "refused"
)

short_interview_interview_terminated <- c(`-2` = "valid data", `1` = "short interview", `2` = "interview terminated")

short_interview_interview_terminated_2 <- c(
  `-2` = "valid data",
  `1` = "short interview",
  `2` = "interview terminated",
  `3` = "PF not done, not able"
)

short_interview_interview_terminated_no_valid_data <- c(
  `-2` = "not missing",
  `1` = "short interview",
  `2` = "interview terminated",
  `5` = "no valid data"
)

short_interview_interview_terminated_too_many_missings <- c(
  `-2` = "valid score",
  `1` = "short interview",
  `2` = "interview terminated",
  `3` = "too many missings"
)

short_interview_interview_terminated_too_many_missings_2 <- c(
  `-2` = "valid score",
  `1` = "short interview",
  `2` = "interview terminated",
  `3` = "too many missings",
  `4` = "refusal / lack of understanding"
)

short_interview_interview_terminated_too_many_missings_3 <- c(
  `-2` = "valid score",
  `1` = "short interview",
  `2` = "interview terminated",
  `3` = "too many missings",
  `4` = "refused test"
)

short_interview_interview_terminated_too_many_missings_4 <- c(
  `-2` = "valid score",
  `1` = "short interview",
  `2` = "interview terminated",
  `3` = "too many missings",
  `4` = "language problem"
)

short_version_interview_terminated <- c(`-2` = "valid score", `1` = "short version", `2` = "interview terminated")

short_version_interview_terminated_2 <- c(`-2` = "valid data", `1` = "short version", `2` = "interview terminated")

short_version_interview_terminated_too_many_missings <- c(
  `-2` = "valid score",
  `1` = "short version",
  `2` = "interview terminated",
  `3` = "too many missings",
  `4` = "refused test",
  `5` = "not able to [cognitive]",
  `6` = "not able to [physical]",
  `7` = "emotional reasons",
  `8` = "unknown / to be coded"
)

short_version_interview_terminated_too_many_missings_2 <- c(
  `-2` = "valid score",
  `1` = "short version",
  `2` = "interview terminated",
  `3` = "too many missings",
  `4` = "refused test",
  `5` = "not able to (cognitive)",
  `6` = "not able to (physical)",
  `7` = "technical problems",
  `8` = "unknown"
)

short_version_interview_terminated_too_many_missings_3 <- c(
  `-2` = "valid score",
  `1` = "short version",
  `2` = "interview terminated",
  `3` = "too many missings",
  `4` = "refused test",
  `5` = "not able to [cognitive]",
  `6` = "not able to [physical]",
  `7` = "emotional reasons",
  `8` = "unknown"
)

short_version_interview_terminated_too_many_missings_4 <- c(
  `-2` = "valid score",
  `1` = "short version",
  `2` = "interview terminated",
  `3` = "too many missings",
  `4` = "refused test",
  `5` = "not able to (cognitive)",
  `6` = "not able to (physical): visus",
  `7` = "technical problems",
  `8` = "unknown"
)

short_version_interview_terminated_too_many_missings_5 <- c(
  `-2` = "valid score",
  `-1` = "see FMRMCRAV",
  `1` = "short version",
  `2` = "interview terminated",
  `3` = "too many missings",
  `4` = "refused test",
  `5` = "not able to (cognitive)",
  `6` = "not able to (physical)",
  `7` = "technical problems",
  `8` = "unknown"
)

short_version_refusal_skip_by_interviewer <- c(
  `-5` = "short version",
  `-4` = "refusal/skip by interviewer",
  `-3` = "interview terminated",
  `-1` = ">2 missing items",
  `0` = NA_character_,
  `11` = NA_character_
)

short_version_refusal_skip_by_interviewer_2 <- c(
  `-5` = "short version",
  `-4` = "refusal/skip by interviewer",
  `-3` = "interview terminated",
  `-1` = ">1 missing items",
  `0` = NA_character_,
  `6` = NA_character_
)

short_version_refusal_skip_by_interviewer_3 <- c(
  `-5` = "short version",
  `-4` = "refusal/skip by interviewer",
  `-3` = "interview terminated",
  `-1` = ">1 missing items",
  `0` = NA_character_,
  `5` = NA_character_
)

short_version_refusal_skip_by_interviewer_4 <- c(
  `-5` = "short version",
  `-4` = "refusal/skip by interviewer",
  `-3` = "terminated interview",
  `-1` = ">1 missing items",
  `0` = NA_character_,
  `6` = NA_character_
)

short_version_refusal_skip_by_interviewer_5 <- c(
  `-5` = "short version",
  `-4` = "refusal/skip by interviewer",
  `-3` = "terminated interview",
  `-1` = ">1 missing items",
  `0` = NA_character_,
  `5` = NA_character_
)

sickness_diet_social_factors <- c(
  `-2` = "na, see C/D/E/BMWEIGHTCH",
  `-1` = "na, asked",
  `1` = "sickness",
  `2` = "diet",
  `3` = "social factors",
  `4` = "other, see C/D/E/BMWEIGHTCHRC",
  `5` = "do not know"
)

sickness_diet_social_factors_other_see_f_gmweightchrc <- c(
  `-2` = "na, see F/GMWEIGHTCH",
  `-1` = "na, asked",
  `1` = "sickness",
  `2` = "diet",
  `3` = "social factors",
  `4` = "other, see F/GMWEIGHTCHRC",
  `5` = "do not know"
)

sickness_eating_more_or_different <- c(
  `-2` = "na, see H/BMWEIGHTCH",
  `-1` = "na, asked",
  `1` = "sickness",
  `2` = "eating more or different",
  `3` = "less physical activity",
  `4` = "combination of eating more/different and physical inactive",
  `5` = "reason unknown",
  `6` = "other reason"
)

sickness_eating_more_or_different_2 <- c(
  `-2` = "na, see IMWEIGHTCH",
  `-1` = "na, asked",
  `1` = "sickness",
  `2` = "eating more or different",
  `3` = "less physical activity",
  `4` = "combination of eating more/different and physical inactive",
  `5` = "reason unknown",
  `6` = "other reason"
)

sickness_related_to_eating_physical_inactivity <- c(
  `-3` = "no valid data",
  `-2` = "na, see HMWEIGHTGR2",
  `-1` = "na, asked",
  `1` = "sickness",
  `2` = "related to eating",
  `3` = "physical inactivity",
  `4` = "eating and physical inactivity",
  `5` = "reason unknown",
  `6` = "other reason",
  `7` = "aging",
  `8` = "social factors"
)

sickness_unintentional_diet_intentional <- c(
  `-2` = "na, see H/BMWEIGHTCH",
  `-1` = "na, asked",
  `1` = "sickness (unintentional)",
  `2` = "diet (intentional)",
  `3` = "other diet (unintentional)",
  `4` = "more physical activity (intentional)",
  `5` = "reason unknown (unintentional)",
  `6` = "social factors (unintentional)",
  `7` = "other reason"
)

sickness_unintentional_diet_intentional_2 <- c(
  `-3` = "no valid data",
  `-2` = "na, see HMWEIGHTLR2",
  `-1` = "na, asked",
  `1` = "sickness (unintentional)",
  `2` = "diet (intentional)",
  `3` = "different diet (unintentional)",
  `4` = "physical activity (intentional)",
  `5` = "reason unknown (unintentional)",
  `6` = "social factors (unintentional)",
  `7` = "other reason (7)",
  `8` = "eating less or different (unknown)",
  `9` = "eating less and physical active (intentional)",
  `10` = "physical activity (unintentional)",
  `11` = "physical activity (unknown)",
  `12` = "aging (unintentional)"
)

sickness_unintentional_diet_intentional_3 <- c(
  `-2` = "na, see I/JMWEIGHTCH",
  `-1` = "na, asked",
  `1` = "sickness (unintentional)",
  `2` = "diet (intentional)",
  `3` = "other diet (unintentional)",
  `4` = "more physical activity (intentional)",
  `5` = "reason unknown (unintentional)",
  `6` = "social factors (unintentional)",
  `7` = "other reason"
)

sickness_unintentional_medication_unintentional <- c(
  `-3` = "no valid data",
  `-2` = "no weight change",
  `-1` = "no answer, asked see *Table reason",
  `1` = "sickness (unintentional)",
  `1.1` = "medication (unintentional)",
  `1.2` = "physical inactive due to sickness (unintentional)",
  `1.3` = "lost weight due to sickness; now gained weight (unintentional)",
  `2` = "diet (intentional)",
  `2.1` = "eating less or different (unknown)",
  `2.2` = "eating more or different (unintentional)",
  `2.3` = "eating more and physical inactive (unintentional)",
  `2.4` = "quit smoking (unknown)",
  `2.5` = "smoking (unknown)",
  `3` = "social factors (unintentional)",
  `3.1` = "social factors recoded (unintentional)",
  `5` = "do not know (unintentional)",
  `6` = "physical activities (intentional)",
  `6.1` = "physical activity (unknown)",
  `6.2` = "physical inactivity (unintentional)",
  `6.3` = "working harder (unintentional)",
  `7` = "older age (unintentional)",
  `8` = "loss of appetite (unintentional)",
  `9` = "diuretics or dehydration",
  `9.1` = "oedeme/ascites",
  `9.2` = "quit prednison"
)

sickness_unintentional_medication_unintentional_2 <- c(
  `-3` = "no valid data",
  `-2` = "na, see H/BMWEIGHTLR2/GR2",
  `-1` = "na, asked see *Table Reason",
  `1` = "sickness (unintentional)",
  `1.1` = "medication (unintentional)",
  `1.2` = "physical inactive due to sickness (unintentional)",
  `2` = "diet (intentional)",
  `2.1` = "eating less or different (unknown)",
  `2.2` = "eating more or different (unintentional)",
  `2.3` = "eating more and physical inactive (unintentional)",
  `2.4` = "quit smoking (unknown)",
  `2.5` = "smoking (unknown)",
  `2.6` = "eating less and physical active (intentional)",
  `2.7` = "eating less or different (unintentional)",
  `3` = "social factors (unintentional)",
  `3.1` = "social factors recoded (unintentional)",
  `5` = "do not know (unintentional)",
  `5.1` = "other reason (implausible reason) (unknown)",
  `6` = "physical activities (intentional)",
  `6.1` = "physical activity (unknown)",
  `6.2` = "physical inactivity (unintentional)",
  `6.3` = "working harder (unintentional)",
  `6.4` = "physical activity (unintentional)",
  `7` = "older age (unintentional)",
  `8` = "loss of appetite (unintentional)",
  `9` = "diuretics or dehydration",
  `9.1` = "oedeme/ascites",
  `9.2` = "quit prednison"
)

silhouette_1_extremely_thin_silhouette_2_silhouette_3 <- c(
  `-1` = "no valid data",
  `1` = "silhouette 1 (extremely thin)",
  `2` = "silhouette 2",
  `3` = "silhouette 3",
  `4` = "silhouette 4",
  `5` = "silhouette 5",
  `6` = "silhouette 6",
  `7` = "silhouette 7",
  `8` = "silhouette 8",
  `9` = "silhouette 9 (very large)"
)

silhouette_1_extremely_thin_silhouette_2_silhouette_3_2 <- c(
  `-1` = "not available",
  `1` = "silhouette 1 (extremely thin)",
  `2` = "silhouette 2",
  `3` = "silhouette 3",
  `4` = "silhouette 4",
  `5` = "silhouette 5",
  `6` = "silhouette 6",
  `7` = "silhouette 7",
  `8` = "silhouette 8",
  `9` = "silhouette 9 (very large)"
)

slides_forward_without_using_arms <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
  `-1` = "na, asked",
  `1` = "slides forward without using arms",
  `2` = "slides forward using arms",
  `3` = "cannot slide forward",
  `4` = "not done/terminated"
)

slimming_pills <- c(`12` = "slimming pills")

slimming_program_ww <- c(`8` = "slimming program (WW)")

somatic_psychogeriatric <- c(`-2` = "na, routing", `-1` = "na, asked", `1` = "somatic", `2` = "psychogeriatric")

some_of_the_time_most_of_the_time_all_of_the_time <- c(
  `-2` = "na, see BSENSE18",
  `-1` = "na, asked",
  `1` = "some of the time",
  `2` = "most of the time",
  `3` = "all of the time"
)

some_of_the_time_most_of_the_time_all_of_the_time_2 <- c(
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "some of the time",
  `2` = "most of the time",
  `3` = "all of the time"
)

son_daughter <- c(`-5` = "RCF/SYS addition", `-1` = "unknown", `1` = "son", `2` = "daughter")

son_daughter_2 <- c(`-1` = "unknown", `1` = "son", `2` = "daughter")

spouse_or_partner_biological_son_or_daughter <- c(
  `1` = "spouse or partner",
  `11` = "biological son or daughter",
  `12` = "son/daughter of partner, step, adoptive, foster (specification available)",
  `13` = "stepchild",
  `14` = "adoptive child",
  `15` = "foster child (= non-kin)",
  `21` = "child-in-law",
  `22` = "former child-in-law",
  `30` = "brother or sister (including half or step)",
  `40` = "brother/sister-in-law",
  `51` = "father or mother",
  `52` = "father/mother-in-law",
  `53` = "grandchild",
  `54` = "partner of grandchild",
  `55` = "cousin/niece/nephew",
  `56` = "uncle/aunt",
  `57` = "other kin; specification unknown",
  `60` = "friend",
  `71` = "neighbor",
  `72` = "(living in) neighborhood",
  `81` = "(former) colleague or his/her spouse",
  `82` = "known through volunteer work",
  `83` = "known through school, course, education",
  `84` = "known through voluntary organization (e.g. church, sports, political)",
  `85` = "acquaintance",
  `86` = "former neighbor",
  `87` = "known through contact at street",
  `88` = "housekeeper/nurse/home helper",
  `89` = "professional, e.g. pastor, reverend, general practitioner",
  `90` = "boarder, landlord",
  `91` = "catholic sister",
  `92` = "parent-in-law of child",
  `93` = "former parent-in-law",
  `94` = "former spouse/partner",
  `95` = "other non-kin; specification unknown",
  `96` = "other kin or non-kin; specification unknown"
)

standing_sitting_lying <- c(`-1` = "na, asked", `1` = "standing", `2` = "sitting", `3` = "lying")

standing_sitting_otherway <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/BCARDIG1",
  `-1` = "na, asked",
  `1` = "standing",
  `2` = "sitting",
  `3` = "otherway"
)

standing_sitting_test_not_done_other_way <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see F/G/H/3B/I/J/KCARDIG1",
  `-1` = "na, asked",
  `1` = "standing",
  `2` = "sitting",
  `3` = "test not done",
  `4` = "other way"
)

steady_job_temporary_job_with_contract <- c(
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
)

steady_job_temporary_job_with_contract_2 <- c(
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
)

steady_job_temporary_job_with_contract_3 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "steady job",
  `2` = "temporary job with contract",
  `3` = "temporary job via employment agency",
  `4` = "self-employed",
  `5` = "free-lance basis",
  `6` = "family company",
  `7` = "other"
)

steady_job_temporary_job_with_contract_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BJOBL1",
  `-1` = "na, asked",
  `1` = "steady job",
  `2` = "temporary job with contract",
  `3` = "temporary job via employment agency",
  `4` = "self-employed",
  `5` = "free-lance basis",
  `6` = "family company",
  `7` = "other"
)

steady_job_temporary_job_with_contract_5 <- c(
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
)

steady_job_temporary_job_with_contract_6 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BPJOBL1",
  `-1` = "na, asked",
  `1` = "steady job",
  `2` = "temporary job with contract",
  `3` = "temporary job via employment agency",
  `4` = "self-employed",
  `5` = "free-lance basis",
  `6` = "family company",
  `7` = "other"
)

steady_job_temporary_job_with_contract_7 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "steady job",
  `2` = "temporary job with contract",
  `3` = "temporary job via employment agency",
  `4` = "self-employed",
  `5` = "free-lance basis",
  `6` = "family company",
  `7` = "other",
  `8` = "0-hours/stand-by contract"
)

still_perception_of_light_no_perception_of_light <- c(
  `-2` = "no valid data",
  `1` = "still perception of light",
  `2` = "no perception of light",
  `3` = "prosthesis"
)

stomach_reduction <- c(`13` = "stomach reduction")

stress_and_pressure_of_work_too_high <- c(
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
)

stress_and_pressure_of_work_too_high_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see JRETIRED",
  `-1` = "na, asked",
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
)

strongly_agree_agree_no_agreement_disagreement_disagree <- c(
  `-1` = "no answer",
  `1` = "strongly agree",
  `2` = "agree",
  `3` = "no agreement/disagreement",
  `4` = "disagree",
  `5` = "strongly disagree"
)

strongly_agree_agree_no_agreement_disagreement_disagree_2 <- c(
  `-1` = "not available",
  `1` = "strongly agree",
  `2` = "agree",
  `3` = "no agreement/disagreement",
  `4` = "disagree",
  `5` = "strongly disagree"
)

strongly_agree_agree_no_agreement_no_disagree_disagree <- c(
  `-2` = "na, see D/E/BRMGL",
  `-1` = "na, asked",
  `1` = "strongly agree",
  `2` = "agree",
  `3` = "no agreement/no disagree",
  `4` = "disagree",
  `5` = "strongly disagree"
)

strongly_agree_agree_no_agreement_no_disagree_disagree_2 <- c(
  `-2` = "na, see CRMGL",
  `-1` = "na, asked",
  `1` = "strongly agree",
  `2` = "agree",
  `3` = "no agreement/no disagree",
  `4` = "disagree",
  `5` = "strongly disagree"
)

strongly_agree_agree_no_agreement_no_disagree_disagree_3 <- c(
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "strongly agree",
  `2` = "agree",
  `3` = "no agreement/no disagree",
  `4` = "disagree",
  `5` = "strongly disagree"
)

strongly_disagree_disagree_agree_strongly_agree <- c(
  `-1` = "no answer",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "agree",
  `4` = "strongly agree"
)

strongly_disagree_disagree_neither_agree_nor_disagree <- c(
  `-1` = "not available",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "neither agree nor disagree",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_neither_agree_nor_disagree_2 <- c(
  `-2` = "not available, interview terminated",
  `-1` = "not available",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "neither agree nor disagree",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_no_agreement_agreement_agree <- c(
  `-1` = "no answer",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no agreement/agreement",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_no_agreement_agreement_agree_2 <- c(
  `-1` = "not available",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no agreement/agreement",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_no_agreement_disagreement <- c(
  `-1` = "no answer",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no agreement/disagreement",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_no_agreement_disagreement_2 <- c(
  `-1` = "not available",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no agreement/disagreement",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_no_agreement_disagreement_3 <- c(
  `-1` = "na, asked",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no agreement/disagreement",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_no_agreement_disagreement_4 <- c(
  `-2` = "na, interview broken off",
  `-1` = "na, asked",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no agreement/disagreement",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_no_dis_agreement_agree <- c(
  `-1` = "no answer",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no (dis)agreement",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_no_dis_agreement_agree_2 <- c(
  `-1` = "no answer",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no (dis)agreement",
  `4` = "agree",
  `5` = "strongly agree",
  `6` = "not applicable"
)

strongly_disagree_disagree_no_disagreement_agreement <- c(
  `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
  `-1` = "na, asked",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no disagreement/ agreement",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_no_disagreement_agreement_2 <- c(
  `-2` = "na, see BRMALC in LASAB228",
  `-1` = "na, asked",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no disagreement/agreement",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_no_disagreement_agreement_3 <- c(
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no disagreement/agreement",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_no_disagreement_agreement_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HR-, HD-, HN-, HG- & HAHELPYN",
  `-1` = "na, asked",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no disagreement/agreement",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_no_disagreement_agreement_5 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no disagreement/agreement",
  `4` = "agree",
  `5` = "strongly agree"
)

strongly_disagree_disagree_slightly_disagree <- c(
  `-1` = "no answer",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "slightly disagree",
  `4` = "slightly agree",
  `5` = "agree",
  `6` = "strongly agree"
)

strongly_disagree_disagree_slightly_disagree_2 <- c(
  `-1` = "not available",
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "slightly disagree",
  `4` = "slightly agree",
  `5` = "agree",
  `6` = "strongly agree"
)

strongly_in_disagreement_reasonably_in_disagreement <- c(
  `-2` = "no partner",
  `-1` = "no answer",
  `1` = "strongly in disagreement",
  `2` = "reasonably in disagreement",
  `3` = "a little in disagreement",
  `4` = "totally not in disagreement"
)

strongly_in_disagreement_reasonably_in_disagreement_2 <- c(
  `-2` = "not available",
  `-1` = "not available",
  `1` = "strongly in disagreement",
  `2` = "reasonably in disagreement",
  `3` = "a little in disagreement",
  `4` = "totally not in disagreement"
)

succeeded_without_using_arms_succeeded_using_arms <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
  `-1` = "na, asked",
  `1` = "succeeded without using arms",
  `2` = "succeeded using arms",
  `3` = "cannot",
  `4` = "not done/terminated"
)

succeeded_without_using_arms_succeeded_using_arms_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
  `-1` = "na, asked",
  `1` = "succeeded without using arms",
  `2` = "succeeded using arms",
  `3` = "cannot"
)

tablet_capsule_drops_effervescent_tablet_injection <- c(
  `-2` = "na, see G/HM#MED",
  `-1` = "na, asked",
  `1` = "tablet",
  `2` = "capsule",
  `3` = "drops",
  `4` = "effervescent tablet",
  `5` = "injection",
  `6` = "inhaler",
  `7` = "powder",
  `8` = "ointment",
  `9` = "other form"
)

tablet_capsule_drops_effervescent_tablet_injection_2 <- c(
  `-2` = "na, see B/B/I/J/KM#MED",
  `-1` = "na, asked",
  `1` = "tablet",
  `2` = "capsule",
  `3` = "drops",
  `4` = "effervescent tablet",
  `5` = "injection",
  `6` = "inhaler",
  `7` = "powder",
  `8` = "ointment",
  `9` = "plaster",
  `10` = "suppository",
  `11` = "spray",
  `12` = "other form"
)

tablet_capsule_drops_effervescent_tablet_injection_3 <- c(
  `-2` = "na, see G/HM#MED",
  `-1` = "na, asked",
  `1` = "tablet",
  `2` = "capsule",
  `3` = "drops",
  `4` = "effervescent tablet",
  `5` = "injection",
  `6` = "inhaler",
  `7` = "powder",
  `8` = "ointment",
  `9` = "other form / plaster",
  `10` = "suppository",
  `11` = "spray",
  `12` = "other form"
)

tablet_capsule_drops_effervescent_tablet_injection_4 <- c(
  `-2` = "na, see IM#SUP",
  `-1` = "na, asked",
  `1` = "tablet",
  `2` = "capsule",
  `3` = "drops",
  `4` = "effervescent tablet",
  `5` = "injection",
  `6` = "inhaler",
  `7` = "powder",
  `8` = "ointment",
  `9` = "plaster",
  `10` = "suppository",
  `11` = "spray",
  `12` = "other form, see imsupformoth"
)

test_not_done <- c(`-3` = "test not done")

test_not_done_1_trial_done_2_trials_done_3_trials_done <- c(
  `-4` = "no valid data",
  `0` = "test not done",
  `1` = "1 trial done",
  `2` = "2 trials done",
  `3` = "3 trials done"
)

test_not_done_2 <- c(`-9` = "test not done")

test_not_done_no_score_too_many_missings <- c(`-3` = "test not done", `-1` = "no score, too many missings")

test_not_done_test_done_test_done_score_0 <- c(
  `-1` = "missing/interview terminated",
  `0` = "test not done",
  `1` = "test done",
  `2` = "test done, score 0"
)

test_not_done_test_done_test_done_score_0_2 <- c(`-1` = "missing", `0` = "test not done", `1` = "test done", `2` = "test done, score 0")

test_not_done_test_not_done_no_score_too_many_missings <- c(`-9` = "test not done", `-3` = "test not done", `-1` = "no score, too many missings")

test_partially_done_skipped_refused_cognitive_physical <- c(
  `-4` = "interview terminated",
  `0` = "test [partially] done",
  `1` = "skipped",
  `2` = "refused",
  `3` = "cognitive",
  `4` = "physical",
  `5` = "technical",
  `6` = "unknown"
)

to_be_coded <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCANCE5L",
  `-1` = "na, asked",
  `0` = "to be coded"
)

to_be_coded_10 <- c(`-3` = "na, wrong skip", `-2` = "na, see BPJOB1", `-1` = "na, asked", `0` = "- to be coded -")

to_be_coded_11 <- c(`-2` = "not available, routing", `0` = "to be coded")

to_be_coded_12 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "to be coded"
)

to_be_coded_13 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP79",
  `-1` = "na, asked",
  `0` = "- to be coded -"
)

to_be_coded_14 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP88",
  `-1` = "na, asked",
  `0` = "- to be coded -"
)

to_be_coded_15 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "- to be coded -"
)

to_be_coded_16 <- c(`-2` = "see BMMENO82", `-1` = "na, asked", `0` = "to be coded")

to_be_coded_17 <- c(`-2` = "na, see BMWALKAID5", `0` = "to be coded")

to_be_coded_18 <- c(`-2` = "na, see DMWALKAID5", `0` = "to be coded")

to_be_coded_19 <- c(`-2` = "na, see F/GMWALKAID5", `0` = "to be coded")

to_be_coded_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HCANCE6F",
  `-1` = "na, asked",
  `0` = "to be coded"
)

to_be_coded_20 <- c(`-2` = "na, see DMFALLADJ11", `0` = "to be coded")

to_be_coded_21 <- c(`-2` = "na, see DMFALLDO1", `-1` = "na, asked", `0` = "to be coded")

to_be_coded_22 <- c(`-2` = "na, see DMFALLDO2", `-1` = "na, asked", `0` = "to be coded")

to_be_coded_23 <- c(`-2` = "na, see DMFALLHOW1", `-1` = "na, asked", `0` = "to be coded")

to_be_coded_24 <- c(`-2` = "na, see DMFALLHOW2", `-1` = "na, asked", `0` = "to be coded")

to_be_coded_25 <- c(`-2` = "na, see DMFALLMHLP9", `0` = "to be coded")

to_be_coded_26 <- c(`-2` = "na ,see DMFALLMHLP4", `0` = "to be coded")

to_be_coded_27 <- c(`-2` = "na, see DMFALLPHC15", `0` = "to be coded")

to_be_coded_28 <- c(`-2` = "na, see DMFALLPHC7", `0` = "to be coded")

to_be_coded_29 <- c(`-2` = "na, see DMFALLWH1", `-1` = "na, asked", `0` = "to be coded")

to_be_coded_3 <- c(`-2` = "not available, routing", `0` = "-to be coded-")

to_be_coded_30 <- c(`-2` = "na, see DMFALLWH2", `-1` = "na, asked", `0` = "to be coded")

to_be_coded_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GJOB1",
  `-1` = "na, asked",
  `0` = "- to be coded -"
)

to_be_coded_5 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "-to be coded-"
)

to_be_coded_6 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DMFEETINSP8",
  `-1` = "no valid data / na, asked",
  `0` = "to be coded"
)

to_be_coded_7 <- c(`-2` = "na, see GH21OWN", `0` = "-to be coded-")

to_be_coded_8 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "<to be coded>"
)

to_be_coded_9 <- c(`-3` = "na, wrong skip", `-2` = "na, see BJOB1", `-1` = "na, asked", `0` = "- to be coded -")

to_be_coded_elementary_low_medium_high_scientific <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "unknown",
  `0` = "-to be coded-",
  `1` = "elementary",
  `2` = "low",
  `3` = "medium",
  `4` = "high",
  `5` = "scientific"
)

to_be_coded_elementary_low_medium_high_scientific_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GJOB1",
  `-1` = "na, asked",
  `0` = "- to be coded -",
  `1` = "elementary",
  `2` = "low",
  `3` = "medium",
  `4` = "high",
  `5` = "scientific"
)

to_be_coded_elementary_occupations <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
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
)

to_be_coded_elementary_occupations_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GJOB1",
  `-1` = "na, asked",
  `0` = "- to be coded -",
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
)

to_be_coded_extra_instructions_other_disturbing_factors <- c(
  `-2` = "na, see d/e/b/f/gm15wrp0",
  `0` = "to be coded",
  `1` = "extra instructions",
  `2` = "other disturbing factors",
  `3` = "R confused/not fit"
)

to_be_coded_extra_instructions_other_disturbing_factors_2 <- c(
  `-2` = "na, see h/b/i/j/km15wrp5",
  `0` = "to be coded",
  `1` = "extra instructions",
  `2` = "other disturbing factors",
  `3` = "R confused/not fit",
  `4` = "stopped/technical",
  `5` = "not specified"
)

to_be_coded_extra_instructions_other_disturbing_factors_3 <- c(
  `-2` = "na, see d/e/b/f/gm15wtp5",
  `-1` = "no other reason",
  `0` = "to be coded",
  `1` = "extra instructions",
  `2` = "other disturbing factors",
  `3` = "R confused/not fit",
  `4` = "stopped/technical",
  `5` = "not specified"
)

to_be_coded_extra_instructions_other_disturbing_factors_4 <- c(
  `-2` = "na, see h/b/i/j/km15wtp5",
  `-1` = "no other reason",
  `0` = "to be coded",
  `1` = "extra instructions",
  `2` = "other disturbing factors",
  `3` = "R confused/not fit",
  `4` = "stopped/technical",
  `5` = "not specified"
)

to_be_coded_garden_pets_cult_hist_ass_housing_ass_other <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP13",
  `-1` = "na, asked",
  `0` = "- to be coded -",
  `1` = "garden & pets",
  `2` = "cult.hist. ass.",
  `3` = "housing ass.",
  `4` = "other"
)

to_be_coded_garden_pets_cult_hist_ass_housing_ass_other_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/DSOCP13",
  `-1` = "na, asked",
  `0` = "- to be coded -",
  `1` = "garden & pets",
  `2` = "cult.hist. ass.",
  `3` = "housing ass.",
  `4` = "other"
)

to_be_coded_general_pedagogical_agricultural <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
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
)

to_be_coded_general_pedagogical_agricultural_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GJOB1",
  `-1` = "na, asked",
  `0` = "- to be coded -",
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
)

to_be_coded_na_na <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "unknown",
  `0` = "-to be coded-",
  `13` = "NA",
  `87` = "NA"
)

to_be_coded_na_na_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see C/D/E/F/GJOB1",
  `-1` = "na, asked",
  `0` = "- to be coded -",
  `13` = "NA",
  `87` = "NA"
)

to_be_coded_no_specific_reason_bending_down <- c(
  `-2` = "na, see F/GMDIZZOTH",
  `0` = "to be coded",
  `1` = "no specific reason",
  `2` = "bending down",
  `3` = "tension/ tiredness",
  `4` = "sickness, medication"
)

to_be_coded_short_interview_interview_terminated <- c(
  `-2` = "valid score",
  `0` = "to be coded",
  `1` = "short interview",
  `2` = "interview terminated",
  `3` = "too many missings",
  `4` = "refused test",
  `5` = "not able to (cognitive)",
  `6` = "not able to (physical)",
  `7` = "technical/interruption"
)

to_be_coded_short_version_interview_terminated <- c(
  `-2` = "valid data",
  `0` = "- to be coded -",
  `1` = "short version",
  `2` = "interview terminated"
)

to_be_coded_short_version_interview_terminated_2 <- c(
  `-2` = "valid score",
  `0` = "to be coded",
  `1` = "short version",
  `2` = "interview terminated",
  `3` = "too many missings",
  `4` = "refused test",
  `5` = "not able to (cognitive)",
  `6` = "not able to (physical)",
  `7` = "technical problems",
  `8` = "unknown"
)

to_be_coded_short_version_interview_terminated_3 <- c(
  `-2` = "valid score",
  `-1` = "see GMRMCRAV",
  `0` = "- to be coded -",
  `1` = "short version",
  `2` = "interview terminated",
  `3` = "too many missings",
  `4` = "refused test",
  `5` = "not able to (cognitive)",
  `6` = "not able to (physical)",
  `7` = "technical problems",
  `8` = "unknown"
)

to_be_coded_visit_from_friend_family <- c(
  `-2` = "na, see B/C/D/E/BLPHYA45",
  `0` = "-to be coded-",
  `1` = "visit from friend/family",
  `2` = "positive activities",
  `3` = "illness partner",
  `4` = "good weather",
  `5` = "decease partner",
  `6` = "business-trip",
  `7` = "removal",
  `8` = "spring cleaning",
  `9` = "rebuilding",
  `10` = "other"
)

trust_very_strong_quite_strong_not_much_not_at_all <- c(
  `-2` = "na, see FMRMEOL",
  `-1` = "na, asked",
  `1` = "trust: very strong",
  `2` = "quite strong",
  `3` = "not much",
  `4` = "not at all",
  `5` = "no opinion"
)

trust_very_strong_quite_strong_not_much_not_at_all_2 <- c(
  `-2` = "na, see GMRMEOL",
  `-1` = "na, asked",
  `1` = "trust: very strong",
  `2` = "quite strong",
  `3` = "not much",
  `4` = "not at all",
  `5` = "no opinion"
)

trust_very_strong_quite_strong_not_much_not_at_all_3 <- c(
  `-2` = "na, see HMRMEOL",
  `-1` = "na, asked",
  `1` = "trust: very strong",
  `2` = "quite strong",
  `3` = "not much",
  `4` = "not at all",
  `5` = "no opinion"
)

trust_very_strong_quite_strong_not_much_not_at_all_4 <- c(
  `-2` = "na, see IMRMEOL",
  `-1` = "na, asked",
  `1` = "trust: very strong",
  `2` = "quite strong",
  `3` = "not much",
  `4` = "not at all",
  `5` = "no opinion"
)

trust_very_strong_quite_strong_not_much_not_at_all_5 <- c(
  `-2` = "na, see JMRMEOL",
  `-1` = "na, asked",
  `1` = "trust: very strong",
  `2` = "quite strong",
  `3` = "not much",
  `4` = "not at all",
  `5` = "no opinion"
)

trust_very_strong_quite_strong_not_much_not_at_all_6 <- c(
  `-2` = "no valid data",
  `-1` = "na, asked",
  `1` = "trust: very strong",
  `2` = "quite strong",
  `3` = "not much",
  `4` = "not at all",
  `5` = "no opinion"
)

trust_very_strong_trust_quite_strong_trust_not_much <- c(
  `-2` = "na, see KMRMEOL",
  `-1` = "na, asked",
  `1` = "trust: very strong",
  `2` = "trust: quite strong",
  `3` = "trust: not much",
  `4` = "trust: not at all",
  `5` = "trust: no opinion"
)

unit_nonresponse_proxy_unit_nonresponse <- c(
  `-5` = "short version",
  `-4` = "refusal/skip by interviewer",
  `-3` = "terminated interview",
  `-1` = ">1 missing items",
  `0` = NA_character_,
  `5` = NA_character_,
  `6` = "unit nonresponse",
  `7` = "proxy (unit nonresponse)",
  `8` = "telephone interview (unit nonresponse)",
  `9` = "born <=1907 or >1937"
)

unknown <- c(`-1` = "unknown")

unknown_no_job_not_changed_no_job_changed <- c(
  `-2` = "not available, routing",
  `-1` = "never had job, unknown before",
  `0` = "unknown",
  `1` = "no job, not changed",
  `2` = "no job, changed",
  `3` = "no job, unknown before",
  `4` = "job, not changed",
  `5` = "job, changed",
  `6` = "job, unknown before"
)

very_applicable_applicable_a_little_applicable <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCPYN,14-33",
  `-1` = "na, asked",
  `1` = "very applicable",
  `2` = "applicable",
  `3` = "a little applicable",
  `4` = "not applicable"
)

very_applicable_applicable_a_little_applicable_2 <- c(
  `-5` = "interview broken off",
  `-4` = "no answer, short version",
  `-3` = "no answer, wrong skip",
  `-2` = "no answer, routing",
  `-1` = "no answer, asked",
  `1` = "very applicable",
  `2` = "applicable",
  `3` = "a little applicable",
  `4` = "not applicable"
)

very_applicable_applicable_a_little_applicable_3 <- c(
  `-5` = "interview terminated",
  `-4` = "not available, short interview",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "very applicable",
  `2` = "applicable",
  `3` = "a little applicable",
  `4` = "not applicable"
)

very_applicable_applicable_a_little_applicable_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see B/FSOCP28 & 31",
  `-1` = "na, asked",
  `1` = "very applicable",
  `2` = "applicable",
  `3` = "a little applicable",
  `4` = "not applicable"
)

very_applicable_applicable_a_little_applicable_5 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see GSOCPYN,14-33",
  `-1` = "na, asked",
  `1` = "very applicable",
  `2` = "applicable",
  `3` = "a little applicable",
  `4` = "not applicable"
)

very_applicable_applicable_a_little_applicable_6 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see GSOCP28 & 31",
  `-1` = "na, asked",
  `1` = "very applicable",
  `2` = "applicable",
  `3` = "a little applicable",
  `4` = "not applicable"
)

very_bad_bad_moderate_good_very_good <- c(
  `-1` = "no answer",
  `1` = "very bad",
  `2` = "bad",
  `3` = "moderate",
  `4` = "good",
  `5` = "very good"
)

very_bad_bad_moderate_good_very_good_2 <- c(
  `-1` = "not available",
  `1` = "very bad",
  `2` = "bad",
  `3` = "moderate",
  `4` = "good",
  `5` = "very good"
)

very_dissatisfied_dissatisfied <- c(
  `-1` = "no answer",
  `1` = "very dissatisfied",
  `2` = "dissatisfied",
  `3` = "not dissatisfied/satisfied",
  `4` = "satisfied",
  `5` = "very satisfied"
)

very_dissatisfied_dissatisfied_2 <- c(
  `-1` = "not available",
  `1` = "very dissatisfied",
  `2` = "dissatisfied",
  `3` = "not dissatisfied/satisfied",
  `4` = "satisfied",
  `5` = "very satisfied"
)

very_dissatisfied_dissatisfied_3 <- c(
  `-1` = "na, asked",
  `1` = "very dissatisfied",
  `2` = "dissatisfied",
  `3` = "not satisfied/dissatisfied",
  `4` = "satisfied",
  `5` = "very satisfied",
  `6` = "do not know"
)

very_dissatisfied_dissatisfied_a_little_dissatisfied <- c(
  `-2` = "no partner",
  `-1` = "no answer",
  `1` = "very dissatisfied",
  `2` = "dissatisfied",
  `3` = "a little dissatisfied",
  `4` = "satisfied",
  `5` = "very satisfied"
)

very_dissatisfied_dissatisfied_a_little_dissatisfied_2 <- c(
  `-2` = "not available",
  `-1` = "not available",
  `1` = "very dissatisfied",
  `2` = "dissatisfied",
  `3` = "a little dissatisfied",
  `4` = "satisfied",
  `5` = "very satisfied"
)

very_easy_fairly_easy_fairly_difficult_very_difficult <- c(
  `-1` = "na, asked",
  `1` = "very easy",
  `2` = "fairly easy",
  `3` = "fairly difficult",
  `4` = "very difficult"
)

very_good_good_moderate_bad_very_bad <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see JJOBC/S",
  `-1` = "na, asked",
  `1` = "very good",
  `2` = "good",
  `3` = "moderate",
  `4` = "bad",
  `5` = "very bad"
)

very_good_good_moderate_bad_very_bad_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see KJOBC/S",
  `-1` = "na, asked",
  `1` = "very good",
  `2` = "good",
  `3` = "moderate",
  `4` = "bad",
  `5` = "very bad"
)

very_good_good_moderate_bad_very_bad_3 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "very good",
  `2` = "good",
  `3` = "moderate",
  `4` = "bad",
  `5` = "very bad"
)

very_good_somewhat_good_somewhat_bad_very_bad <- c(
  `-1` = "no answer",
  `1` = "very good",
  `2` = "somewhat good",
  `3` = "somewhat bad",
  `4` = "very bad"
)

very_often_often_some_of_the_time_never <- c(
  `-1` = "no answer",
  `1` = "very often",
  `2` = "often",
  `3` = "some of the time",
  `4` = "never"
)

very_often_often_some_of_the_time_never_2 <- c(
  `-1` = "not available",
  `1` = "very often",
  `2` = "often",
  `3` = "some of the time",
  `4` = "never"
)

very_poor_rather_poor_neither_poor_nor_good_rather_good <- c(
  `-1` = "asked, no answer",
  `1` = "very poor",
  `2` = "rather poor",
  `3` = "neither poor nor good",
  `4` = "rather good",
  `5` = "very good"
)

very_unhealthy_unhealthy_not_unhealthy_healthy_healthy <- c(
  `-1` = "no answer",
  `1` = "very unhealthy",
  `2` = "unhealthy",
  `3` = "not unhealthy/healthy",
  `4` = "healthy",
  `5` = "very healthy"
)

very_unimportant_unimportant <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BR-, BD-, & BNHELPYN",
  `-1` = "na, asked",
  `1` = "very unimportant",
  `2` = "unimportant",
  `3` = "not important / not unimportant",
  `4` = "important",
  `5` = "very important"
)

very_unimportant_unimportant_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KHELPR",
  `-1` = "na, asked",
  `1` = "very unimportant",
  `2` = "unimportant",
  `3` = "not important / not unimportant",
  `4` = "important",
  `5` = "very important"
)

very_unimportant_unimportant_not_unimportant_important <- c(
  `-1` = "no answer",
  `1` = "very unimportant",
  `2` = "unimportant",
  `3` = "not unimportant/important",
  `4` = "important",
  `5` = "very important"
)

very_unpleasant_unpleasant_not_unpleasant_pleasant <- c(
  `-1` = "no answer",
  `1` = "very unpleasant",
  `2` = "unpleasant",
  `3` = "not unpleasant/pleasant",
  `4` = "pleasant",
  `5` = "very pleasant",
  `6` = "not applicable"
)

very_unpleasant_unpleasant_not_unpleasant_pleasant_2 <- c(
  `-1` = "no answer",
  `1` = "very unpleasant",
  `2` = "unpleasant",
  `3` = "not unpleasant/pleasant",
  `4` = "pleasant",
  `5` = "very pleasant"
)

visit_from_friend_family_positive_activities <- c(
  `-2` = "na, see F/G/H/B/I/JLPHYA49",
  `1` = "visit from friend/family",
  `2` = "positive activities",
  `3` = "illness partner",
  `4` = "good weather",
  `5` = "death partner",
  `6` = "business-trip",
  `7` = "removal/moved",
  `8` = "spring cleaning",
  `9` = "rebuilding",
  `10` = "other"
)

visit_from_friend_family_positive_activities_2 <- c(
  `-2` = "na, see B/C/D/E/BLPHYA45",
  `1` = "visit from friend/family",
  `2` = "positive activities",
  `3` = "illness partner",
  `4` = "good weather",
  `5` = "decease partner",
  `6` = "business-trip",
  `7` = "removal",
  `8` = "spring cleaning",
  `9` = "rebuilding",
  `10` = "other"
)

voluntary_involuntary_eating_less_or_different <- c(
  `-3` = "no valid data",
  `-2` = "no weight loss",
  `-1` = "no answer, asked",
  `1` = "voluntary",
  `2` = "involuntary",
  `3` = "eating less or different"
)

vs_0_6_days_7_14_days_15_30_days_31_days_or_more <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/JKNEEP1",
  `-1` = "na, asked",
  `1` = "0-6 days",
  `2` = "7-14 days",
  `3` = "15-30 days",
  `4` = "31 days or more"
)

vs_0_correct_1_correct_2_correct <- c(
  `-3` = "test not done",
  `-2` = "not asked, previous answers incorrect",
  `0` = "0 correct",
  `1` = "1 correct",
  `2` = "2 correct"
)

vs_0_correct_1_correct_2_correct_2 <- c(
  `-3` = "na, see BRMDS",
  `-2` = "na, previous answers incorrect",
  `-1` = "test broken off",
  `0` = "0 correct",
  `1` = "1 correct",
  `2` = "2 correct"
)

vs_0_correct_1_correct_2_correct_3 <- c(
  `-3` = "not available, routing",
  `-2` = "not available, previous answers incorrect",
  `-1` = "not available, test broken off",
  `0` = "0 correct",
  `1` = "1 correct",
  `2` = "2 correct"
)

vs_0_correct_1_correct_2_correct_4 <- c(
  `-3` = "test not done",
  `-2` = "not asked, previous answers incorrect",
  `-1` = "asked, no answer",
  `0` = "0 correct",
  `1` = "1 correct",
  `2` = "2 correct"
)

vs_0_correct_1_correct_2_correct_5 <- c(
  `-9` = "test not done",
  `-2` = "not asked, previous answers incorrect",
  `-1` = "not asked",
  `0` = "0 correct",
  `1` = "1 correct",
  `2` = "2 correct"
)

vs_0_correct_1_correct_2_correct_6 <- c(
  `-9` = "test not done",
  `-3` = "test not done",
  `-2` = "not asked, previous answers incorrect",
  `-1` = "no item response",
  `0` = "0 correct",
  `1` = "1 correct",
  `2` = "2 correct"
)

vs_0_days_1_3_days_4_7_days_1_week_but_1_month <- c(
  `-3` = "na, wrong skip",
  `-1` = "na, asked",
  `1` = "0 days",
  `2` = "1-3 days",
  `3` = "4-7 days",
  `4` = "> 1 week but < 1 month",
  `5` = "all the time",
  `6` = "do not know",
  `7` = "refused to answer"
)

vs_0_days_1_3_days_4_7_days_1_week_but_1_month_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/BHEALTH1",
  `-1` = "na, asked",
  `1` = "0 days",
  `2` = "1-3 days",
  `3` = "4-7 days",
  `4` = "> 1 week but < 1 month",
  `5` = "all the time",
  `6` = "do not know",
  `7` = "refused to answer"
)

vs_0_days_1_3_days_4_7_days_1_week_but_1_month_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see BHEALTH1",
  `-1` = "na, asked",
  `1` = "0 days",
  `2` = "1-3 days",
  `3` = "4-7 days",
  `4` = "> 1 week but < 1 month",
  `5` = "all the time",
  `6` = "do not know",
  `7` = "refused to answer"
)

vs_0_days_1_3_days_4_7_days_1_week_but_1_month_4 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CHEALTH1",
  `-1` = "na, asked",
  `1` = "0 days",
  `2` = "1-3 days",
  `3` = "4-7 days",
  `4` = "> 1 week but < 1 month",
  `5` = "all the time",
  `6` = "do not know",
  `7` = "refused to answer"
)

vs_0_days_1_3_days_4_7_days_1_week_but_1_month_5 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see EHEALTH1",
  `-1` = "na, asked",
  `1` = "0 days",
  `2` = "1-3 days",
  `3` = "4-7 days",
  `4` = "> 1 week but < 1 month",
  `5` = "all the time",
  `6` = "do not know",
  `7` = "refused to answer"
)

vs_0_days_1_3_days_4_7_days_1_week_but_1_month_6 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see FHEALTH1",
  `-1` = "na, asked",
  `1` = "0 days",
  `2` = "1-3 days",
  `3` = "4-7 days",
  `4` = "> 1 week but < 1 month",
  `5` = "all the time",
  `6` = "do not know",
  `7` = "refused to answer"
)

vs_0_days_1_3_days_4_7_days_1_week_but_1_month_7 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see GHEALTH1",
  `-1` = "na, asked",
  `1` = "0 days",
  `2` = "1-3 days",
  `3` = "4-7 days",
  `4` = "> 1 week but < 1 month",
  `5` = "all the time",
  `6` = "do not know",
  `7` = "refused to answer"
)

vs_0_days_1_3_days_4_7_days_1_week_but_1_month_8 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see HHEALTH1",
  `-1` = "na, asked",
  `1` = "0 days",
  `2` = "1-3 days",
  `3` = "4-7 days",
  `4` = "> 1 week but < 1 month",
  `5` = "all the time",
  `6` = "do not know",
  `7` = "refused to answer"
)

vs_0_days_1_3_days_4_7_days_1_week_but_1_month_9 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "0 days",
  `2` = "1-3 days",
  `3` = "4-7 days",
  `4` = "> 1 week but < 1 month",
  `5` = "all the time",
  `6` = "do not know",
  `7` = "refused to answer"
)

vs_0_days_1_day_2_days_3_days_4_days_5_days_6_days_7_days <- c(
  `-4` = "na, interview terminated",
  `-1` = "na, asked",
  `0` = "0 days",
  `1` = "1 day",
  `2` = "2 days",
  `3` = "3 days",
  `4` = "4 days",
  `5` = "5 days",
  `6` = "6 days",
  `7` = "7 days"
)

vs_0_right_1_right_2_right_3_right <- c(
  `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
  `-1` = "na, asked",
  `0` = "0 right",
  `1` = "1 right",
  `2` = "2 right",
  `3` = "3 right"
)

vs_0_right_1_right_2_right_3_right_2 <- c(`-1` = "na, asked", `0` = "0 right", `1` = "1 right", `2` = "2 right", `3` = "3 right")

vs_0_right_1_right_2_right_3_right_3 <- c(
  `-2` = "na, see BMMSEVRS",
  `-1` = "na, asked",
  `0` = "0 right",
  `1` = "1 right",
  `2` = "2 right",
  `3` = "3 right"
)

vs_0_right_1_right_2_right_3_right_4 <- c(
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "0 right",
  `1` = "1 right",
  `2` = "2 right",
  `3` = "3 right"
)

vs_0_right_1_right_2_right_3_right_4_right_5_right <- c(
  `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
  `-1` = "na, asked",
  `0` = "0 right",
  `1` = "1 right",
  `2` = "2 right",
  `3` = "3 right",
  `4` = "4 right",
  `5` = "5 right"
)

vs_0_right_1_right_2_right_3_right_4_right_5_right_2 <- c(
  `-1` = "na, asked",
  `0` = "0 right",
  `1` = "1 right",
  `2` = "2 right",
  `3` = "3 right",
  `4` = "4 right",
  `5` = "5 right"
)

vs_0_right_1_right_2_right_3_right_4_right_5_right_3 <- c(
  `-2` = "na, see BMMSEVRS",
  `-1` = "na, asked",
  `0` = "0 right",
  `1` = "1 right",
  `2` = "2 right",
  `3` = "3 right",
  `4` = "4 right",
  `5` = "5 right"
)

vs_0_right_1_right_2_right_3_right_4_right_5_right_4 <- c(
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "0 right",
  `1` = "1 right",
  `2` = "2 right",
  `3` = "3 right",
  `4` = "4 right",
  `5` = "5 right"
)

vs_1040_euro_or_lower_more_than_1040_euro <- c(
  `-4` = "na, partner in hh",
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/BINCCAT",
  `-1` = "na, asked",
  `1` = "1040 euro or lower",
  `2` = "more than 1040 euro"
)

vs_11_glasses_or_more_8_10_glasses_6_7_glasses_4_5_glasses <- c(
  `-2` = "R does not drink",
  `-1` = "no answer, asked",
  `1` = "11 glasses or more",
  `2` = "8-10 glasses",
  `3` = "6-7 glasses",
  `4` = "4-5 glasses",
  `5` = "2-3 glasses",
  `6` = "1 glass"
)

vs_1425_euro_or_lower_more_than_1425_euro <- c(
  `-4` = "na, no partner in hh",
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/BINCCAT",
  `-1` = "na, asked",
  `1` = "1425 euro or lower",
  `2` = "more than 1425 euro"
)

vs_15_wt_not_done_15_wt_done <- c(`1` = "15 wt not done", `2` = "15 wt done")

vs_15_wt_not_done_15_wt_done_2 <- c(`-4` = "interview terminated", `1` = "15 wt not done", `2` = "15 wt done")

vs_1_a_week <- c(`-2` = "na, see I/J/KMSMOKECIGP", `-1` = "na, asked", `0` = "< 1 a week")

vs_1_a_week_2 <- c(`-2` = "na, see I/J/KMSMOKECIGA", `-1` = "na, asked", `0` = "< 1 a week")

vs_1_a_week_3 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see I/J/KMSMOKECIG",
  `-1` = "na, asked",
  `0` = "< 1 a week"
)

vs_1_fall_2_falls_or_more <- c(`-2` = "na, see DMFALLLY", `-1` = "na, asked", `1` = "1 fall", `2` = "2 falls or more")

vs_1_hr_a_day_1_4_hrs_a_day_4_8_hrs_a_day_all_day <- c(
  `-2` = "na, see BSENSE7A",
  `-1` = "na, asked",
  `1` = "< 1 hr a day",
  `2` = "1-4 hrs a day",
  `3` = "4-8 hrs a day",
  `4` = "all day"
)

vs_1_hr_a_day_1_4_hrs_a_day_4_8_hrs_a_day_all_day_2 <- c(
  `-2` = "na, see J/KMSENS7A",
  `-1` = "na, asked",
  `1` = "< 1 hr a day",
  `2` = "1-4 hrs a day",
  `3` = "4-8 hrs a day",
  `4` = "all day"
)

vs_1_hr_a_day_1_4_hrs_a_day_4_8_hrs_a_day_all_day_3 <- c(
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "< 1 hr a day",
  `2` = "1-4 hrs a day",
  `3` = "4-8 hrs a day",
  `4` = "all day"
)

vs_1_time <- c(
  `-3` = "no valid data",
  `-2` = "no answer, routing",
  `-1` = "no answer, asked",
  `1` = "1 time"
)

vs_2_times_a_month_or_less_3_4_times_a_month <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/E/F/G/HINCON1",
  `-1` = "na, asked",
  `1` = "2 times a month or less",
  `2` = "3-4 times a month",
  `3` = "a few times a week",
  `4` = "daily"
)

vs_2_times_a_month_or_less_3_4_times_a_month_2 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see BINCON1",
  `-1` = "na, asked",
  `1` = "2 times a month or less",
  `2` = "3-4 times a month",
  `3` = "a few times a week",
  `4` = "daily"
)

vs_2_times_a_month_or_less_3_4_times_a_month_3 <- c(
  `-5` = "na, see I/JRMCH",
  `-1` = "na, asked",
  `1` = "2 times a month or less",
  `2` = "3-4 times a month",
  `3` = "a few times a week",
  `4` = "daily"
)

vs_2_times_a_month_or_less_3_4_times_a_month_4 <- c(
  `-5` = "na, see I/JRMCH",
  `-2` = "not applicable: stoma, catheter or something else",
  `-1` = "na, asked",
  `1` = "2 times a month or less",
  `2` = "3-4 times a month",
  `3` = "a few times a week",
  `4` = "daily"
)

vs_2_times_a_month_or_less_3_4_times_a_month_5 <- c(
  `-5` = "na, see KRMCH",
  `-2` = "not applicable: stoma, catheter or something else",
  `-1` = "na, asked",
  `1` = "2 times a month or less",
  `2` = "3-4 times a month",
  `3` = "a few times a week",
  `4` = "daily"
)

vs_2_times_a_month_or_less_3_4_times_a_month_6 <- c(
  `-5` = "not available, routing",
  `-2` = "not applicable: stoma, catheter or something else",
  `-1` = "not available, asked",
  `1` = "2 times a month or less",
  `2` = "3-4 times a month",
  `3` = "a few times a week",
  `4` = "daily"
)

vs_30_minutes_continuously_day_and_night <- c(
  `-4` = "not available, refused",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_10 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see BPHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_11 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see BRHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_12 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see BNHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_13 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/BDHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_14 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/BPHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_15 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see D/BRHELP02",
  `-1` = "no (valid) answer",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_16 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see HDHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_17 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see IDHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_18 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see HPHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_19 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see IPHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_2 <- c(
  `-4` = "not available",
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available",
  `0` = "<30 minutes",
  `112` = "continuously day and night",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_20 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see HRHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_21 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see IRHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_22 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see HNHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_23 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see INHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_24 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see HAHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_25 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see IAHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_26 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see HGHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_27 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see IGHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_28 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CDHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_29 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see EDHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_3 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KDHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_30 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see FDHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_31 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see GDHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_32 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CPHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_33 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see EPHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_34 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see FPHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_35 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see GPHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_36 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see GRHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_37 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see CRHELP02",
  `-1` = "no (valid) answer",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_38 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see ERHELP02",
  `-1` = "no (valid) answer",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_39 <- c(
  `-4` = "na, short interview",
  `-3` = "na, wrong skip",
  `-2` = "na, see FRHELP02",
  `-1` = "no (valid) answer",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_4 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KPHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_40 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/BRHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `168` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_41 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KDHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_42 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KNHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_43 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KPHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_44 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KRHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_45 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KAHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_46 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KGHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_5 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KRHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_6 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KNHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_7 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KAHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_8 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KGHELP01",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_30_minutes_continuously_day_and_night_9 <- c(
  `-4` = "na, refused",
  `-3` = "na, wrong skip",
  `-2` = "na, see BDHELPYN",
  `-1` = "na, asked",
  `0` = "<30 minutes",
  `112` = "continuously day and night"
)

vs_3_missings <- c(`-1` = ">3 missings", `0` = NA_character_, `19` = NA_character_)

vs_3_months_3_months_do_not_know_refused_to_answer <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see D/BHEALTH1",
  `-1` = "na, asked",
  `1` = "> 3 months",
  `2` = "< 3 months",
  `3` = "do not know",
  `4` = "refused to answer"
)

vs_3_months_3_months_do_not_know_refused_to_answer_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see J/KHEALTH1",
  `-1` = "na, asked",
  `1` = "> 3 months",
  `2` = "< 3 months",
  `3` = "do not know",
  `4` = "refused to answer"
)

vs_454_567_euro_1000_1250_fl_568_680_euro_1251_1500_fl <- c(
  `-2` = "na, see H/B/BINCF",
  `1` = "454-567 euro (1000-1250 fl)",
  `2` = "568-680 euro (1251-1500 fl)",
  `3` = "681-794 euro (1501-1750 fl)",
  `4` = "795-907 euro (1751-2000 fl)",
  `5` = "908-1021 euro (2001-2250 fl)",
  `6` = "1022-1134 euro (2251-2500 fl)",
  `7` = "1135-1361 euro (2501-3000 fl)",
  `8` = "1362-1588 euro (3001-3500 fl)",
  `9` = "1589-1815 euro (3501-4000 fl)",
  `10` = "1816-2042 euro (4001-4500 fl)",
  `11` = "2043-2269 euro (4501-5000 fl)",
  `12` = "2270-2495 euro (5001-5500 fl)",
  `13` = "2496-2722 euro (5501-6000 fl)",
  `14` = "2723-2949 euro (6001-6500 fl)",
  `15` = "2950-3176 euro (6501-7000 fl)",
  `16` = "3177-3403 euro (7001-7500 fl)",
  `17` = "3404-3630 euro (7501-8000 fl)",
  `18` = "3631-3857 euro (8001-8500 fl)",
  `19` = "3858-4084 euro (8501-9000 fl)",
  `20` = "4085-4311 euro (9001-9500 fl)",
  `21` = "4312-4537 euro (9501-10000 fl)",
  `22` = "4538-4991 euro (10001-11000 fl)",
  `23` = "4992-5445 euro (11001-12000 fl)",
  `24` = "5446 or more (12000 fl or more)"
)

vs_98_times_or_more <- c(`-2` = "na, see H/BLST1C01", `-1` = "na, asked: R does not know", `98` = "98 times or more")

vs_99_months_or_longer <- c(`-2` = "na, see DMMENO82", `-1` = "R does not know period", `99` = "99 months or longer")

walking_hiking_long_distance_hiking <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/I/JLPHYA21",
  `-1` = "na, asked",
  `11` = "walking / hiking: long distance hiking",
  `12` = "walking / hiking: nordic walking",
  `13` = "walking / hiking: speed walking",
  `21` = "cycling: long distance cycling",
  `22` = "cycling: cycle racing / spinning / mountain biking",
  `23` = "cycling: treadmill at home / cycle ergometer at home",
  `31` = "gymnastics and fitness: gymnastics / exercising at home",
  `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
  `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
  `34` = "gymnastics and fitness: endurance training",
  `41` = "swimming: swimming",
  `42` = "swimming: aqua gym / aqua jogging",
  `51` = "racket sports: tennis",
  `52` = "racket sports: table tennis",
  `53` = "racket sports: squash",
  `54` = "racket sports: badminton",
  `61` = "running: running / jogging",
  `71` = "water sports: rowing",
  `72` = "water sports: sailing",
  `73` = "water sports: canoeing",
  `81` = "ball sports: soccer",
  `82` = "ball sports: futsal",
  `83` = "ball sports: hockey",
  `84` = "ball sports: volleyball",
  `85` = "ball sports: basketball",
  `86` = "ball sports: baseball / softball",
  `87` = "ball sports: golf / ball throwing game",
  `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
  `91` = "winter sports: skiing",
  `92` = "winter sports: cross country skiing",
  `93` = "winter sports: ice skating",
  `101` = "animal sports: horse riding",
  `102` = "animal sports: fishing / pigeon racing",
  `103` = "animal sports: dog training / horse carriage driving",
  `111` = "other sports: climbing",
  `112` = "other sports: billiards / darts",
  `113` = "other sports: (folk) dancing",
  `114` = "other sports: other"
)

walking_hiking_long_distance_hiking_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see H/B/I/JLPHYA25",
  `-1` = "na, asked",
  `11` = "walking / hiking: long distance hiking",
  `12` = "walking / hiking: nordic walking",
  `13` = "walking / hiking: speed walking",
  `21` = "cycling: long distance cycling",
  `22` = "cycling: cycle racing / spinning / mountain biking",
  `23` = "cycling: treadmill at home / cycle ergometer at home",
  `31` = "gymnastics and fitness: gymnastics / exercising at home",
  `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
  `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
  `34` = "gymnastics and fitness: endurance training",
  `41` = "swimming: swimming",
  `42` = "swimming: aqua gym / aqua jogging",
  `51` = "racket sports: tennis",
  `52` = "racket sports: table tennis",
  `53` = "racket sports: squash",
  `54` = "racket sports: badminton",
  `61` = "running: running / jogging",
  `71` = "water sports: rowing",
  `72` = "water sports: sailing",
  `73` = "water sports: canoeing",
  `81` = "ball sports: soccer",
  `82` = "ball sports: futsal",
  `83` = "ball sports: hockey",
  `84` = "ball sports: volleyball",
  `85` = "ball sports: basketball",
  `86` = "ball sports: baseball / softball",
  `87` = "ball sports: golf / ball throwing game",
  `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
  `91` = "winter sports: skiing",
  `92` = "winter sports: cross country skiing",
  `93` = "winter sports: ice skating",
  `101` = "animal sports: horse riding",
  `102` = "animal sports: fishing / pigeon racing",
  `103` = "animal sports: dog training / horse carriage driving",
  `111` = "other sports: climbing",
  `112` = "other sports: billiards / darts",
  `113` = "other sports: (folk) dancing",
  `114` = "other sports: other"
)

walkingbar_stick_rollator <- c(
  `-2` = "na, see E/B/F/G/H/B/B/I/JWALK03",
  `-1` = "na, asked",
  `1` = "walkingbar",
  `2` = "stick",
  `3` = "rollator",
  `4` = "leaning on objects/interviewer",
  `5` = "other",
  `6` = "none"
)

walkingbar_stick_rollator_2 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see E/B/F/G/H/B/B/I/JWALK03",
  `-1` = "na, asked",
  `1` = "walkingbar",
  `2` = "stick",
  `3` = "rollator",
  `4` = "leaning on objects/interviewer",
  `5` = "other",
  `6` = "none"
)

with_each_meal_3_or_more_glasses_a_day <- c(
  `-1` = "na, asked",
  `1` = "with each meal (3 or more glasses a day)",
  `2` = "not with each meal (1 or 2 glasses a day)",
  `3` = "every week, but not every day",
  `4` = "every week, but not every day",
  `5` = "less than once a week"
)

wrist_colles_humerus_hand_fingers <- c(
  `-2` = "na, see H/B/IMBOT1#",
  `-1` = "na, asked",
  `1` = "wrist, colles",
  `2` = "humerus",
  `3` = "hand, fingers",
  `4` = "other upper extremities",
  `5` = "rib",
  `6` = "pelvis",
  `7` = "ankle",
  `8` = "feet, toes",
  `9` = "hip",
  `10` = "other lower extremities",
  `11` = "head (skull, nose, jaw)",
  `12` = "vertebra (back, neck)",
  `13` = "unknown"
)

wrist_colles_humerus_hand_fingers_2 <- c(
  `-2` = "na, see BMBOT1#",
  `-1` = "na, asked",
  `1` = "wrist, colles",
  `2` = "humerus",
  `3` = "hand, fingers",
  `4` = "other upper extremities",
  `5` = "rib",
  `6` = "pelvis",
  `7` = "ankle",
  `8` = "feet, toes",
  `9` = "hip",
  `10` = "other lower extremities",
  `11` = "head (skull, nose, jaw)",
  `12` = "vertebra (back, neck)",
  `13` = "unknown"
)

wrist_colles_humerus_hand_fingers_3 <- c(
  `-2` = "na, see FMBOT1#",
  `-1` = "na, asked",
  `1` = "wrist, colles",
  `2` = "humerus",
  `3` = "hand, fingers",
  `4` = "other upper extremities",
  `5` = "rib",
  `6` = "pelvis",
  `7` = "ankle",
  `8` = "feet, toes",
  `9` = "hip",
  `10` = "other lower extremities",
  `11` = "head (skull, nose, jaw)",
  `12` = "vertebra (back, neck)",
  `13` = "unknown"
)

wrist_colles_humerus_hand_fingers_4 <- c(
  `-2` = "na, see GMBOT1#",
  `-1` = "na, asked",
  `1` = "wrist, colles",
  `2` = "humerus",
  `3` = "hand, fingers",
  `4` = "other upper extremities",
  `5` = "rib",
  `6` = "pelvis",
  `7` = "ankle",
  `8` = "feet, toes",
  `9` = "hip",
  `10` = "other lower extremities",
  `11` = "head (skull, nose, jaw)",
  `12` = "vertebra (back, neck)",
  `13` = "unknown"
)

wrist_colles_humerus_hand_fingers_5 <- c(
  `-2` = "na, see KMBOT#",
  `-1` = "na, asked",
  `1` = "wrist, colles",
  `2` = "humerus",
  `3` = "hand, fingers",
  `4` = "other upper extremities",
  `5` = "rib",
  `6` = "pelvis",
  `7` = "ankle",
  `8` = "feet, toes",
  `9` = "hip",
  `10` = "other lower extremities",
  `11` = "head (skull, nose, jaw)",
  `12` = "vertebra (back, neck)",
  `13` = "unknown"
)

wrist_colles_humerus_hand_fingers_6 <- c(
  `-2` = "na, see JMBOT#",
  `-1` = "na, asked",
  `1` = "wrist, colles",
  `2` = "humerus",
  `3` = "hand, fingers",
  `4` = "other upper extremities",
  `5` = "rib",
  `6` = "pelvis",
  `7` = "ankle",
  `8` = "feet, toes",
  `9` = "hip",
  `10` = "other lower extremities",
  `11` = "head (skull, nose, jaw)",
  `12` = "vertebra (back, neck)",
  `13` = "unknown"
)

wrist_colles_humerus_hand_fingers_7 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see JMBOT#",
  `-1` = "na, asked",
  `1` = "wrist, colles",
  `2` = "humerus",
  `3` = "hand, fingers",
  `4` = "other upper extremities",
  `5` = "rib",
  `6` = "pelvis",
  `7` = "ankle",
  `8` = "feet, toes",
  `9` = "hip",
  `10` = "other lower extremities",
  `11` = "head, neck",
  `12` = "vertebra",
  `13` = "unknown"
)

wrist_colles_humerus_hand_fingers_8 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see CMBOT1#",
  `-1` = "na, asked",
  `1` = "wrist, colles",
  `2` = "humerus",
  `3` = "hand, fingers",
  `4` = "other upper extremities",
  `5` = "rib",
  `6` = "pelvis",
  `7` = "ankle",
  `8` = "feet, toes",
  `9` = "hip",
  `10` = "other lower extremities",
  `11` = "head, neck",
  `12` = "vertebra",
  `13` = "unknown"
)

wrong_correct <- c(
  `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
  `-1` = "na, asked",
  `1` = "wrong",
  `2` = "correct"
)

wrong_correct_2 <- c(`-2` = "na, see BMMSEVRS", `-1` = "na, asked", `1` = "wrong", `2` = "correct")

wrong_correct_3 <- c(`-1` = "na, asked", `1` = "wrong", `2` = "correct")

wrong_correct_4 <- c(
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "wrong",
  `2` = "correct"
)

year <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "year"
)

year_2 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `2` = "year"
)

year_round_only_in_winter_only_in_spring_only_in_summer <- c(
  `-2` = "na, see jmDsup/jmMVsup",
  `-1` = "na asked",
  `1` = "year round",
  `2` = "only in winter",
  `3` = "only in spring",
  `4` = "only in summer",
  `5` = "only in fall",
  `6` = "irregular",
  `7` = "other, see jmDsupseasoth/jmMVsupseasoth"
)

year_round_only_in_winter_only_in_spring_only_in_summer_2 <- c(
  `-2` = "na, see jmDsup/jmMVsup",
  `-1` = "na, asked",
  `1` = "year round",
  `2` = "only in winter",
  `3` = "only in spring",
  `4` = "only in summer",
  `5` = "only in fall",
  `6` = "irregular",
  `7` = "other, see jmDsupseasoth/jmMVsupseasoth"
)

yes_approved_no_denied_informal_network <- c(
  `-2` = "na, see G/HMWMOMUN",
  `-1` = "na, asked",
  `1` = "yes, approved",
  `2` = "no, denied: informal network",
  `3` = "no, denied: not severe enough",
  `4` = "no, denied: other"
)

yes_blood_yes_plasma_no <- c(`-1` = "na, asked", `1` = "yes, blood", `2` = "yes, plasma", `3` = "no")

yes_complete_dentures_yes_partial_dentures_no <- c(`-1` = "no answer", `1` = "yes, complete dentures", `2` = "yes, partial dentures", `3` = "no")

yes_complete_dentures_yes_partial_dentures_no_2 <- c(
  `-1` = "not available",
  `1` = "yes, complete dentures",
  `2` = "yes, partial dentures",
  `3` = "no"
)

yes_limited_a_lot_yes_limited_a_little <- c(
  `-1` = "asked, no answer",
  `1` = "yes, limited a lot",
  `2` = "yes, limited a little",
  `3` = "no, not limited at all"
)

yes_limited_a_lot_yes_limited_a_little_2 <- c(
  `-1` = "not available",
  `1` = "yes, limited a lot",
  `2` = "yes, limited a little",
  `3` = "no, not limited at all"
)

yes_maybe_no_r_does_not_know <- c(
  `-2` = "na, see FMRMEOL",
  `-1` = "na, asked",
  `1` = "yes",
  `2` = "maybe",
  `3` = "no",
  `4` = "R does not know"
)

yes_maybe_no_r_does_not_know_2 <- c(
  `-2` = "no valid data",
  `-1` = "na, asked",
  `1` = "yes",
  `2` = "maybe",
  `3` = "no",
  `4` = "R does not know"
)

yes_no <- c(`-1` = "no answer", `1` = "yes", `2` = "no")

yes_no_10 <- c(`-2` = "not applicable", `-1` = "no answer", `1` = "yes", `2` = "no")

yes_no_11 <- c(`-5` = "interview terminated", `-1` = "no valid data / na, asked", `1` = "yes", `2` = "no")

yes_no_12 <- c(`-3` = "na, wrong skip", `-2` = "na, see DRMPAR", `-1` = "na, asked", `1` = "yes", `2` = "no")

yes_no_13 <- c(`-2` = "na, see I/JRM161", `-1` = "na, asked", `1` = "yes", `2` = "no")

yes_no_14 <- c(`-5` = "interview terminated", `-1` = "no valid data", `1` = "yes", `2` = "no")

yes_no_15 <- c(`-1` = "no valid data / na, asked", `1` = "yes", `2` = "no")

yes_no_2 <- c(`-1` = "not available", `1` = "yes", `2` = "no")

yes_no_3 <- c(`-1` = "asked, no answer", `1` = "yes", `2` = "no")

yes_no_4 <- c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no")

yes_no_5 <- c(
  `-3` = "R does not know",
  `-2` = "male respondent",
  `-1` = "na, asked",
  `1` = "yes",
  `2` = "no"
)

yes_no_6 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see E/B/F/G/HMSMOKEYN",
  `-1` = "na, asked",
  `1` = "yes",
  `2` = "no"
)

yes_no_7 <- c(`-2` = "male respondent", `-1` = "na, asked", `1` = "yes", `2` = "no")

yes_no_8 <- c(`-1` = "na, asked", `1` = "yes", `2` = "no")

yes_no_9 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available, asked",
  `1` = "yes",
  `2` = "no"
)

yes_no_no_opinion <- c(`-1` = "no answer", `1` = "yes", `2` = "no", `3` = "no opinion")

yes_no_not_entirely_voluntarily <- c(
  `-5` = "na, age >=67",
  `-3` = "na, wrong skip",
  `-2` = "na, see JJOBC",
  `-1` = "na, asked",
  `1` = "yes",
  `2` = "no, not (entirely) voluntarily"
)

yes_no_not_entirely_voluntarily_2 <- c(
  `-5` = "na, age >=67",
  `-3` = "na, wrong skip",
  `-2` = "na, see KJOBC",
  `-1` = "na, asked",
  `1` = "yes",
  `2` = "no, not (entirely) voluntarily"
)

yes_no_r_does_not_know <- c(`-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "R does not know")

yes_no_r_does_not_know_2 <- c(
  `-2` = "na, see FMRMEOL",
  `-1` = "na, asked",
  `1` = "yes",
  `2` = "no",
  `3` = "R does not know"
)

yes_no_r_does_not_know_3 <- c(`-2` = "no valid data", `-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "R does not know")

yes_no_r_does_not_know_4 <- c(
  `-2` = "na, terminated interview",
  `-1` = "na, asked",
  `1` = "yes",
  `2` = "no",
  `3` = "R does not know"
)

yes_no_r_does_not_know_5 <- c(
  `-2` = "interview terminated",
  `-1` = "not available, asked",
  `1` = "yes",
  `2` = "no",
  `3` = "R does not know"
)

yes_no_r_does_not_know_6 <- c(`-1` = "not available", `1` = "yes", `2` = "no", `3` = "R does not know")

yes_no_r_thinks_not_yet_applicable <- c(
  `-2` = "no data, age",
  `-1` = "no answer",
  `1` = "yes",
  `2` = "no",
  `3` = "R thinks not yet applicable"
)

yes_only_with_help_no <- c(
  `-5` = "na, see I/J/KHINDEP",
  `-3` = "na, wrong skip",
  `-2` = "na, see I/J/KMOVED",
  `-1` = "na, asked",
  `1` = "yes",
  `2` = "only with help",
  `3` = "no"
)

yes_probably_yes_probably_not_no <- c(
  `-1` = "no answer, asked",
  `1` = "yes",
  `2` = "probably yes",
  `3` = "probably not",
  `4` = "no"
)

yes_probably_yes_probably_not_no_2 <- c(`-1` = "not available", `1` = "yes", `2` = "probably yes", `3` = "probably not", `4` = "no")

yes_s_he_should_it_depends_no_s_he_should_not <- c(
  `-1` = "no answer",
  `1` = "yes, (s)he should",
  `2` = "it depends",
  `3` = "no, (s)he should not",
  `4` = "no opinion"
)

yes_severely_yes_slightly_no_do_not_know <- c(
  `-5` = "na, terminated interview",
  `-1` = "na, asked",
  `1` = "yes, severely",
  `2` = "yes, slightly",
  `3` = "no",
  `4` = "do not know",
  `5` = "refused to answer"
)

yes_there_are_no_there_are_not_no_opinion <- c(`-1` = "no answer", `1` = "yes, there are", `2` = "no, there are not", `3` = "no opinion")

yes_trying_to_lose_weight_yes_trying_not_gain_weight <- c(
  `-1` = "na, asked",
  `1` = "yes, trying to lose weight",
  `2` = "yes, trying not gain weight",
  `3` = "yes, trying not to lose weight",
  `4` = "yes, trying to gain weight",
  `5` = "no",
  `6` = "do not know"
)

yes_trying_to_lose_weight_yes_trying_not_to_gain_weight <- c(
  `-1` = "na, asked / do not know",
  `1` = "yes, trying to lose weight",
  `2` = "yes, trying not to gain weight",
  `3` = "yes, trying not to lose weight",
  `4` = "yes, trying to gain weight",
  `5` = "no"
)

yes_without_difficulty_yes_with_some_difficulty <- c(
  `-2` = "na, see D/ESENSE01",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_10 <- c(
  `-2` = "na, see J/KMSENS7A",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not wear a HA in this situation"
)

yes_without_difficulty_yes_with_some_difficulty_11 <- c(
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_12 <- c(
  `-2` = "na, see BSENSE03",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_13 <- c(
  `-2` = "na, see BSENSE7A",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_14 <- c(
  `-2` = "na, see HMSENS01",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_15 <- c(
  `-2` = "na, see IMSENS7A",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_16 <- c(
  `-2` = "na, see D/ESENSE03",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not use aid"
)

yes_without_difficulty_yes_with_some_difficulty_17 <- c(
  `-2` = "na, see BSENSE05",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not have glasses or contact lenses"
)

yes_without_difficulty_yes_with_some_difficulty_18 <- c(
  `-2` = "na, see D/ESENSE05",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not have glasses or contact lenses"
)

yes_without_difficulty_yes_with_some_difficulty_19 <- c(
  `-2` = "na, see D/ESENSE01",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_2 <- c(
  `-2` = "na, see F/GMSENS01",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_20 <- c(
  `-2` = "na, see BSENSE09",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not have a hearing aid"
)

yes_without_difficulty_yes_with_some_difficulty_21 <- c(
  `-2` = "na, see D/ESENSE09",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not have a hearing aid"
)

yes_without_difficulty_yes_with_some_difficulty_22 <- c(
  `-2` = "na, see BSENSE11",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not have a hearing aid"
)

yes_without_difficulty_yes_with_some_difficulty_23 <- c(
  `-2` = "na, see D/ESENSE11",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not have a hearing aid"
)

yes_without_difficulty_yes_with_some_difficulty_24 <- c(
  `-3` = "na, wrong skip",
  `-2` = "na, see IMSENS01",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_25 <- c(
  `-2` = "na, see F/GMSENS03",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not use aid"
)

yes_without_difficulty_yes_with_some_difficulty_26 <- c(
  `-2` = "na, see J/KMSENS01OF 03????",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not have glasses or contact lenses"
)

yes_without_difficulty_yes_with_some_difficulty_27 <- c(
  `-2` = "na, see F/GMSENS05",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_28 <- c(
  `-2` = "na, see J/KMSENS05",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not have glasses or contact lenses"
)

yes_without_difficulty_yes_with_some_difficulty_29 <- c(
  `-2` = "na, see HMSENS7A",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_3 <- c(
  `-2` = "na, see CSENSE01",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_30 <- c(
  `-2` = "na, see F/GMSENS01",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_31 <- c(
  `-2` = "na, see F/GMSENS09",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not have a hearing aid"
)

yes_without_difficulty_yes_with_some_difficulty_32 <- c(
  `-2` = "na, see F/GMSENS11",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not have a hearing aid"
)

yes_without_difficulty_yes_with_some_difficulty_33 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_34 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "coding category 5"
)

yes_without_difficulty_yes_with_some_difficulty_35 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not have glasses or contact lenses"
)

yes_without_difficulty_yes_with_some_difficulty_36 <- c(
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_37 <- c(
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not have a hearing aid"
)

yes_without_difficulty_yes_with_some_difficulty_38 <- c(
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not wear a HA in this situation"
)

yes_without_difficulty_yes_with_some_difficulty_39 <- c(
  `-3` = "not available, wrong skip",
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot",
  `5` = "R does not have a hearing aid"
)

yes_without_difficulty_yes_with_some_difficulty_4 <- c(
  `-4` = "na, short version",
  `-2` = "na, see BSENSE01",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_5 <- c(
  `-4` = "not available",
  `-2` = "not available, routing",
  `-1` = "not available",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_6 <- c(
  `-2` = "na, see BSENSE01",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_7 <- c(
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_8 <- c(
  `-2` = "na, see J/KMSENS01",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_difficulty_yes_with_some_difficulty_9 <- c(
  `-2` = "na, see J/KMSENS7A",
  `-1` = "na, asked",
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

yes_without_trouble_yes_with_some_trouble <- c(
  `-1` = "no value",
  `1` = "yes, without trouble",
  `2` = "yes, with some trouble",
  `3` = "yes, with much trouble",
  `4` = "no, I cannot"
)

