# Apply LASA 014 (Residence characteristics / Relocation) SPSS labels
#
# Source: LASA014_varinfo_Relocation.pdf (29-Jun-2023)

#' Apply LASA014 (Residence characteristics / Relocation) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to a LASA014 data frame, using the coding scheme
#' documented for the requested wave. By default variables remain numeric.
#' Optional arguments can convert categorical variables to factors, restore
#' count/continuous variables to plain numeric, correct mismatched source
#' names, and standardize matched names to the canonical LASA spelling.
#'
#' LASA014 variable names and codings differ across waves. In particular,
#' waves B, 2B, 3B, and MB all use a `b` prefix while representing distinct
#' questionnaires. The `wave` argument is therefore required.
#'
#' Column matching follows the same contract as [apply_lasa046_labels()]: an
#' explicit `name_corrections` override is tried first, followed by an exact
#' match and a case-insensitive exact match. Any variable expected for the
#' selected wave that cannot be matched is recorded as `"not found"` in the
#' generic labelling audit rather than causing an error.
#'
#' The companion LASAB214, LASAC214, and LASAD214 files listed at the end of
#' the same codebook are not LASA014 files and are therefore outside this
#' function's scope. The `bospec1`-`bospec6` items are included for wave 2B,
#' because the codebook explicitly places them in LAS2B014 for that wave.
#'
#' Regardless of `to_factor`/`to_numeric`, every matched column also keeps
#' its original SPSS value coding available as reference attributes --
#' `attr(x, "original_labels")` and `attr(x, "original_values")` -- and the
#' `"respnr"` column (in any capitalization) is matched and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA014 `.sav` file.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector of manual column
#'   overrides. Names are canonical LASA014 suffixes without the wave prefix;
#'   values are actual column names in `data`, for example
#'   `c(momonth = "BMOMNTH")`.
#' @param to_factor Logical. If `TRUE`, categorical variables are converted
#'   to factors using their value labels. Observed but unlabelled values are
#'   retained as numeric-text levels.
#' @param to_numeric Logical. If `TRUE`, count/continuous variables whose
#'   labels consist only of negative missing-reason codes are converted to
#'   plain numeric and negative values are replaced with `NA`. This takes
#'   precedence over `to_factor` for those variables. LASA014's "constructed"
#'   variables (e.g. `fdoorc`, `nroomsc`) use negative codes for substantive
#'   categories rather than missing reasons, so they are never restored to
#'   numeric even when all their codes are negative.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   their canonical lowercase LASA014 documentation names with the wave code
#'   removed, `"respnr"` (in any capitalization) is renamed to `"respnr"`,
#'   and `split_wavecode` is always treated as `TRUE` as well, regardless of
#'   what was passed for `split_wavecode`.
#' @param split_wavecode Logical. If `TRUE`, matched columns are renamed with
#'   the wave-letter prefix removed (e.g. `bhindep` becomes `hindep`), and a
#'   new `"LASA_wave"` column, filled with `wave`, is inserted right after
#'   `"respnr"`. Always treated as `TRUE` when `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value labels applied and a generic
#'   `"label_report"` attribute containing the name-matching audit, plus
#'   reference `original_labels`/`original_values` attributes preserving the
#'   original SPSS value coding regardless of `to_factor`/`to_numeric`
#'   reshaping. A new `"LASA_wave"` column is added after `"respnr"` when
#'   `standardize_names = TRUE` or `split_wavecode = TRUE`.
#'
#' @seealso [apply_lasa046_labels()], [read_lasa_sav()], [lasa_label_report()]
#' @export
#'
#' @examples
#' dat <- data.frame(BHINDEP = c(1, 2), BMOVED = c(1, 2))
#' dat <- apply_lasa014_labels(dat, wave = "B")
#' attr(dat$BHINDEP, "labels")
#'
#' dat_factor <- apply_lasa014_labels(
#'   dat, wave = "B", to_factor = TRUE, standardize_names = TRUE
#' )
#' levels(dat_factor$bhindep)
apply_lasa014_labels <- function(data,
                                 wave,
                                 name_corrections = NULL,
                                 to_factor = FALSE,
                                 to_numeric = FALSE,
                                 standardize_names = FALSE,
                                 split_wavecode = FALSE) {

  wave <- toupper(wave)
  wave_prefix <- c(
    B = "b", C = "c", D = "d", E = "e", `2B` = "b",
    F = "f", G = "g", H = "h", `3B` = "b", MB = "b",
    I = "i", J = "j", K = "k"
  )

  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 014 wave: ", wave,
      ". Use one of: ", paste(names(wave_prefix), collapse = ", "), ".",
      call. = FALSE
    )
  }
  prefix <- unname(wave_prefix[[wave]])

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  # LASA014 uses negative codes for both missing-reason labels (e.g. "na,
  # wrong skip") *and* substantive "constructed/derived" categories (e.g.
  # "monastery" = -3, "institution" = -2, "unknown" = -1 for the *c-suffixed
  # variables). Unlike the package's default is_codebook_numeric() rule (all
  # codes negative), LASA014 additionally requires the label text itself to
  # look like a missing-reason label, so a "constructed" categorical
  # variable is never mistaken for a to_numeric-eligible count variable.
  is_codebook_numeric <- function(value_label_map) {
    if (is.null(value_label_map) || length(value_label_map) == 0L) {
      return(FALSE)
    }
    codes <- as.numeric(unname(value_label_map))
    labels <- tolower(names(value_label_map))
    all(!is.na(codes) & is.finite(codes) & codes < 0) &&
      all(grepl("^(na\\b|wrong skip\\b)", labels))
  }

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa014_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode,
    is_codebook_numeric = is_codebook_numeric
  )
  label_variable <- engine$label_variable

  value_labels <- function(...) c(...)

  skip_reference_var <- function(suffix) {
    toupper(paste0(prefix, suffix))
  }

  see <- function(suffix) {
    paste0("na, see ", skip_reference_var(suffix))
  }

  missing_codes <- function(code5 = NULL,
                            code4 = NULL,
                            code3 = "na, wrong skip",
                            code2 = NULL,
                            code1 = "na, asked") {
    out <- numeric(0)
    entries <- list(
      `-5` = code5,
      `-4` = code4,
      `-3` = code3,
      `-2` = code2,
      `-1` = code1
    )
    for (code in names(entries)) {
      label <- entries[[code]]
      if (!is.null(label)) {
        out <- c(out, setNames(as.numeric(code), label))
      }
    }
    out
  }

  month_labels <- value_labels(
    January = 1, February = 2, March = 3, April = 4,
    May = 5, June = 6, July = 7, August = 8,
    September = 9, October = 10, November = 11, December = 12
  )

  housing_observation <- value_labels(
    independent = 1,
    `residential home` = 2,
    `nursing h-somatic` = 3,
    `nursing h-psych` = 4,
    hospital = 5,
    `psychiatric hospital` = 6,
    monastery = 8
  )
  housing_observation_added <- housing_observation
  names(housing_observation_added)[
    unname(housing_observation_added) == 8
  ] <- "monastery (added)"

  housing_legacy_moved <- value_labels(
    `attached row` = 1,
    `semi-detached` = 2,
    detached = 3,
    `high rise (elevator)` = 4,
    `high rise (no elevator)` = 5,
    `low-level apt building` = 6,
    `ground floor apartment` = 7,
    `apt build elderly (elevator)` = 8,
    `home elderly (street level)` = 9,
    `service flat (home elderly)` = 10,
    `semi-independent` = 11,
    farm = 12,
    houseboat = 13,
    commune = 14,
    other = 15
  )

  housing_legacy_constructed <- c(
    value_labels(unknown = -1),
    housing_legacy_moved,
    value_labels(institution = 16, monastery = 17)
  )
  housing_legacy_moved_documented <- housing_legacy_moved
  names(housing_legacy_moved_documented)[
    unname(housing_legacy_moved_documented) == 15
  ] <- "other (documented)"

  housing_revised_moved_h <- value_labels(
    `attached row or semi-detached` = 1,
    detached = 2,
    `high rise (elevator)` = 3,
    `high rise (no elevator)` = 4,
    `ground floor apartment` = 5,
    `apt build elderly (elevator)` = 6,
    `home elderly (street level)` = 7,
    `semi-independent` = 8,
    `farm / corporate housing` = 9,
    houseboat = 10,
    `other (documented)` = 11
  )

  housing_revised_constructed_h <- c(
    value_labels(`na, wrong skip` = -3, unknown = -1),
    housing_revised_moved_h[unname(housing_revised_moved_h) != 11],
    value_labels(other = 11, institution = 12, monastery = 13)
  )

  housing_revised <- value_labels(
    `attached row or semi-detached` = 1,
    detached = 2,
    `high rise (elevator)` = 3,
    `high rise (no elevator)` = 4,
    `ground floor apartment` = 5,
    `apt build elderly (elevator)` = 6,
    `home elderly (street level)` = 7,
    `semi-independent` = 8,
    `farm / corporate housing` = 9,
    houseboat = 10,
    `housing with communal facilities` = 11,
    other = 12,
    institution = 13,
    monastery = 14
  )
  housing_revised_moved_documented <- housing_revised[unname(housing_revised) <= 12]
  names(housing_revised_moved_documented)[
    unname(housing_revised_moved_documented) == 12
  ] <- "other (documented)"

  satisfaction_labels <- value_labels(
    dissatisfied = 1,
    `not satisfied/dissatisfied` = 2,
    satisfied = 3
  )

  wheelchair_access_labels <- value_labels(
    yes = 1,
    `only with help` = 2,
    no = 3
  )

  label_many <- function(definitions, value_label_map) {
    for (suffix in names(definitions)) {
      label_variable(suffix, definitions[[suffix]], value_label_map)
    }
  }

  # ---- LASAB014 ------------------------------------------------------------
  if (wave == "B") {
    label_variable(
      "hindep", "OBSERVATION: type of housing", housing_observation_added
    )
    label_variable("moved", "Moved since last interview", value_labels(no = 1, yes = 2))
    label_variable(
      "momonth", "Moved since last interview: month",
      c(missing_codes(
        code4 = "na, short version", code2 = see("moved")
      ), month_labels)
    )
    label_variable(
      "moyear", "Moved since last interview: year",
      missing_codes(code4 = "na, short version", code2 = see("moved"))
    )
    label_variable(
      "housem", "Type of housing: moved since last interview",
      c(missing_codes(
        code5 = see("hindep"), code4 = "na, short version",
        code2 = see("moved")
      ), housing_legacy_moved)
    )
    label_variable(
      "houstyp", "Type of housing: constructed", housing_legacy_constructed
    )
    label_variable(
      "fdoor", "Floor of front door",
      missing_codes(code5 = see("hindep"), code2 = see("moved"), code1 = "na")
    )
    constructed_labels <- value_labels(
      monastery = -3, institution = -2, unknown = -1
    )
    label_variable("fdoorc", "Floor of front door: constructed", constructed_labels)
    label_variable(
      "rfdoor", "How to reach front door",
      c(missing_codes(
        code4 = "na, short version", code3 = NULL,
        code2 = see("fdoor"), code1 = "na"
      ), value_labels(`only stairs` = 1, `elevator present` = 2, other = 3))
    )
    label_variable(
      "nrooms", "# rooms in house",
      missing_codes(
        code5 = see("hindep"), code4 = "na, short version",
        code2 = see("moved"), code1 = "na"
      )
    )
    label_variable("nroomsc", "# rooms: constructed", constructed_labels)
    label_variable(
      "lrooms", "All rooms on the same floor",
      c(missing_codes(
        code5 = see("hindep"), code4 = "na, short version",
        code2 = see("moved"), code1 = "na"
      ), value_labels(no = 1, yes = 2))
    )
    label_variable(
      "specadj", "House has special adjustments/adaptation",
      c(missing_codes(code2 = NULL), value_labels(no = 0, yes = 1))
    )

    special_definitions_b <- c(
      spec01 = "Specially adjusted: telephone e.g. amplified sound",
      spec02 = "Specially adjusted: lowered doorstep",
      spec03 = "Specially adjusted: alarm system",
      spec04 = "Specially adjusted: handgrips or supports",
      spec05 = "Specially adjusted: lowered/raised draining board",
      spec06 = "Specially adjusted: stair elevator",
      spec07 = "Specially adjusted: bedrooms same floor level",
      spec08 = "Specially adjusted: adjusted or raised toilet",
      spec09 = "Specially adjusted: lowered/raised washbasin",
      spec10 = "Specially adjusted: non-skid in bathroom",
      spec11 = "Specially adjusted: seating equipment in bathroom",
      spec12 = "spec. adjust: raised bed",
      spec13 = "Specially adjusted: handgrip above bed",
      spec14 = "Specially adjusted: extra handrails inside the house",
      spec15 = "Specially adjusted: extra handrails outside the house",
      spec16 = "Specially adjusted: sloping ramp to pavement",
      spec17 = "Specially adjusted: other"
    )
    special_basic_b <- c(
      missing_codes(code2 = see("specadj")),
      value_labels(`not mentioned` = 0, mentioned = 1)
    )
    special_housing_b <- c(
      missing_codes(code5 = see("hindep"), code2 = see("specadj")),
      value_labels(`not mentioned` = 0, mentioned = 1)
    )
    housing_specific <- c("spec06", "spec07", "spec14", "spec15", "spec16")
    for (suffix in names(special_definitions_b)) {
      labels <- if (suffix %in% housing_specific) {
        special_housing_b
      } else {
        special_basic_b
      }
      label_variable(suffix, special_definitions_b[[suffix]], labels)
    }

    label_variable(
      "satis", "How (dis)satisfied with housing condition",
      c(missing_codes(
        code4 = "na, short version", code3 = "wrong skip",
        code2 = "na, routing"
      ), value_labels(
        dissatisfied = 1,
        `no satisfied/dissatisfy` = 2,
        satisfied = 3
      ))
    )
    dissatisfaction_definitions <- c(
      satis01 = "Dissatisfied: House is too big",
      satis02 = "Dissatisfied: House is too small",
      satis03 = "Dissatisfied: House is in bad condition",
      satis04 = "Dissatisfied: Rooms in house not on the same floor",
      satis05 = "Dissatisfied: House can only be reached by stairs",
      satis06 = "Dissatisfied: Doorsteps in house too high",
      satis07 = "Dissatisfied: House is too expensive",
      satis08 = "Dissatisfied: House is vulnerable to burglar",
      satis09 = "Dissatisfied: other reason"
    )
    label_many(
      dissatisfaction_definitions,
      c(
        missing_codes(code3 = NULL, code2 = see("satis")),
        value_labels(`not mentioned` = 0, mentioned = 1)
      )
    )
    return(engine$finalize())
  }

  # ---- LASAC014 through LASAG014 ------------------------------------------
  if (wave %in% c("C", "D", "E", "F", "G")) {
    label_variable(
      "hindep", "OBSERVATION: type of housing",
      c(missing_codes(code2 = see("moved")), housing_observation)
    )
    moved_labels <- value_labels(no = 1, yes = 2)
    if (wave %in% c("F", "G")) {
      moved_labels <- c(moved_labels, value_labels(
        `yes, temporarily living elsewhere` = 3,
        `lived temporarily elsewhere` = 4
      ))
    }
    label_variable(
      "moved", "Moved since last interview",
      c(missing_codes(code3 = NULL, code2 = NULL), moved_labels)
    )
    label_variable(
      "momonth", "Moved since last int: month",
      c(missing_codes(code2 = see("moved")), month_labels)
    )
    label_variable(
      "moyear", "Moved since last int: year",
      missing_codes(code2 = see("moved"))
    )
    label_variable(
      "housem", "Type of housing: moved since last interview",
      c(missing_codes(code5 = see("hindep"), code2 = see("moved")),
        housing_legacy_moved_documented)
    )
    label_variable(
      "houstyp", "Type of housing: constructed",
      c(
        if (wave %in% c("E", "F", "G")) {
          value_labels(`na, wrong skip` = -3)
        } else {
          numeric(0)
        },
        housing_legacy_constructed
      )
    )
    label_variable(
      "fdoor", "Floor of front door",
      missing_codes(code5 = see("hindep"), code2 = see("moved"))
    )
    constructed_labels <- value_labels(
      monastery = -3, institution = -2, unknown = -1
    )
    label_variable("fdoorc", "Floor of front door: constructed", constructed_labels)
    label_variable(
      "rfdoor", "How to reach front door",
      c(missing_codes(code2 = see("fdoor")),
        value_labels(`only stairs` = 1, `elevator present` = 2, other = 3))
    )
    label_variable(
      "nrooms", "# rooms in house",
      missing_codes(code5 = see("hindep"), code2 = see("moved"))
    )
    label_variable("nroomsc", "# rooms: constructed", constructed_labels)
    label_variable(
      "lrooms", "All rooms on the same floor",
      c(missing_codes(code5 = see("hindep"), code2 = see("moved")),
        value_labels(no = 1, yes = 2))
    )
    label_variable(
      "specadj", "House has special adjustments/adaptation",
      c(missing_codes(code2 = see("moved")), value_labels(no = 1, yes = 2))
    )

    special_definitions <- c(
      spec01 = "Specially adjusted: telephone eg. amplified sound",
      spec02 = "Specially adjusted: lowered doorstep",
      spec03 = "Specially adjusted: alarm system",
      spec04 = "Specially adjusted: handgrips/handrails or supports",
      spec05 = "Specially adjusted: lowered/raised draining board",
      spec06 = "Specially adjusted: stair elevator",
      spec07 = "Specially adjusted: bedrooms same floor level",
      spec08 = "Specially adjusted: adjusted or raised toilet",
      spec09 = "Specially adjusted: lowered/raised washbasin",
      spec10 = "Specially adjusted: non-skid in bathroom",
      spec11 = "Specially adjusted: seating equipment in bathroom",
      spec12 = "Specially adjusted: raised bed",
      spec13 = "Specially adjusted: handgrip above bed",
      spec14 = "Specially adjusted: extra handrails inside the house",
      spec15 = "Specially adjusted: extra handrails outside the house",
      spec16 = "Specially adjusted: sloping ramp to pavement",
      spec17 = "Specially adjusted: other"
    )
    special_basic <- c(
      missing_codes(code2 = see("specadj")),
      value_labels(`not mentioned` = 0, mentioned = 1)
    )
    special_housing <- c(
      missing_codes(code5 = see("hindep"), code2 = see("specadj")),
      value_labels(`not mentioned` = 0, mentioned = 1)
    )
    housing_specific <- c("spec06", "spec07", "spec14", "spec15", "spec16")
    for (suffix in names(special_definitions)) {
      labels <- if (suffix %in% housing_specific) {
        special_housing
      } else {
        special_basic
      }
      label_variable(suffix, special_definitions[[suffix]], labels)
    }
    label_variable(
      "satis", "How (dis)satisfied with housing condition",
      c(missing_codes(code2 = "na, routing"), satisfaction_labels)
    )
    return(engine$finalize())
  }

  # ---- LAS2B014 ------------------------------------------------------------
  if (wave == "2B") {
    label_variable(
      "hindep", "OBSERVATION: type of housing",
      c(missing_codes(
        code3 = NULL, code2 = "na, interview terminated"
      ), housing_observation_added)
    )
    label_variable(
      "momonth", "Moved to current residence: month",
      c(missing_codes(code2 = see("hindep")), month_labels)
    )
    label_variable(
      "moyear", "Moved to current residence: year",
      missing_codes(code2 = see("hindep"))
    )
    label_variable(
      "houstyp", "Type of housing",
      c(value_labels(`na, see BHINDEP` = -2), housing_legacy_constructed)
    )
    label_variable(
      "fdoor", "Floor of front door",
      missing_codes(code3 = "wrong skip", code2 = see("hindep"))
    )
    label_variable(
      "rfdoor", "How to reach front door",
      c(missing_codes(code2 = see("fdoor")),
        value_labels(`only stairs` = 1, `elevator present` = 2, other = 3))
    )
    label_variable(
      "nrooms", "Number of rooms in house",
      missing_codes(code2 = see("hindep"))
    )
    lrooms_labels <- c(
      missing_codes(code2 = see("hindep")), value_labels(no = 1, yes = 2)
    )
    label_variable("lrooms", "All rooms on the same floor", lrooms_labels)
    label_variable(
      "specadj", "House has special adjustments/adaptation", lrooms_labels
    )

    special_definitions_2b <- c(
      spec01 = "Specially adjusted: telephone eg. amplified sound",
      spec02 = "Specially adjusted: lowered doorstep",
      spec03 = "Specially adjusted: alarm system",
      spec04 = "Specially adjusted: handgrips or supports",
      spec05 = "Specially adjusted: lowered/raised draining board",
      spec06 = "Specially adjusted: stair elevator",
      spec07 = "Specially adjusted: bedrooms same floor level",
      spec08 = "Specially adjusted: adjusted or raised toilet",
      spec09 = "Specially adjusted: lowered/raised washbasin",
      spec10 = "Specially adjusted: non-skid in bathroom",
      spec11 = "Specially adjusted: seating equipment in bathroom",
      spec12 = "Specially adjusted: raised bed",
      spec13 = "Specially adjusted: handgrip above bed",
      spec14 = "Specially adjusted: extra handrails inside the house",
      spec15 = "Specially adjusted: extra handrails outside the house",
      spec16 = "Specially adjusted: sloping ramp to pavement",
      spec17 = "Specially adjusted: other"
    )
    label_many(
      special_definitions_2b,
      c(missing_codes(code2 = see("specadj")),
        value_labels(`not mentioned` = 1, mentioned = 2))
    )

    other_special_definitions <- c(
      ospec1 = "Other special adjustments: for wheel chair users",
      ospec2 = "Other special adjustments: for deaf people",
      ospec3 = "Other special adjustments: faucets",
      ospec4 = "Other special adjustments: chair lift",
      ospec5 = "Other special adjustments: chairs",
      ospec6 = "Other special adjustments: other, documented"
    )
    label_many(
      other_special_definitions,
      c(setNames(-2, see("spec17")), value_labels(no = 0, yes = 1))
    )
    label_variable(
      "satis", "How (dis)satisfied with housing condition",
      c(missing_codes(code2 = see("hindep")), satisfaction_labels)
    )
    return(engine$finalize())
  }

  # ---- LASAH014 ------------------------------------------------------------
  if (wave == "H") {
    label_variable(
      "hindep", "OBSERVATION: type of housing",
      c(missing_codes(code2 = see("moved")), housing_observation)
    )
    label_variable(
      "moved", "Moved since last interview",
      c(missing_codes(code3 = NULL, code2 = NULL), value_labels(
        no = 1, yes = 2,
        `yes, temporarily living elsewhere` = 3,
        `lived temporarily elsewhere` = 4
      ))
    )
    label_variable(
      "momonth", "Moved since last int: month",
      c(missing_codes(code2 = see("moved")), month_labels)
    )
    label_variable(
      "moyear", "Moved since last int: year",
      missing_codes(code2 = see("moved"))
    )
    label_variable(
      "housem", "Type of housing: moved since last interview",
      c(missing_codes(code5 = see("hindep"), code2 = see("moved")),
        housing_revised_moved_h)
    )
    label_variable(
      "houstyp", "Type of housing: constructed",
      housing_revised_constructed_h
    )
    label_variable(
      "hwhacc", "House accessible by wheelchair",
      c(missing_codes(
        code5 = see("hindep"), code3 = NULL, code2 = see("moved")
      ), wheelchair_access_labels)
    )
    label_variable(
      "nrooms", "# rooms in house",
      missing_codes(code5 = see("hindep"), code2 = see("moved"))
    )
    label_variable(
      "nroomsc", "# rooms: constructed",
      value_labels(monastery = -3, institution = -2, unknown = -1)
    )
    label_variable(
      "lrooms", "All rooms on the same floor",
      c(missing_codes(code5 = see("hindep"), code2 = see("moved")),
        value_labels(no = 1, yes = 2))
    )
    label_variable(
      "specadj", "House has special adjustments/adaptation",
      c(missing_codes(code2 = see("moved")), value_labels(no = 1, yes = 2))
    )
    .lasa014_add_revised_special_adjustments(
      label_variable, missing_codes, see, value_labels,
      include_wrong_skip_who = FALSE, wave = "H"
    )
    label_variable(
      "satis", "How (dis)satisfied with housing condition",
      c(missing_codes(code2 = "na, routing"), satisfaction_labels)
    )
    return(engine$finalize())
  }

  # ---- LAS3B014 ------------------------------------------------------------
  if (wave == "3B") {
    label_variable(
      "hindep", "OBSERVATION: type of housing",
      c(missing_codes(code2 = NULL), housing_observation)
    )
    label_variable(
      "houstyp", "Type of housing",
      c(missing_codes(code2 = see("hindep"), code1 = "unknown"), housing_revised)
    )
    label_variable(
      "momonth", "Moved to current residence: month",
      c(missing_codes(code2 = see("hindep")), month_labels)
    )
    label_variable(
      "moyear", "Moved to current residence: year",
      missing_codes(code2 = see("hindep"))
    )
    label_variable(
      "hwhacc", "House accessible by wheelchair",
      c(missing_codes(code5 = see("hindep"), code2 = see("hindep")),
        wheelchair_access_labels)
    )
    label_variable(
      "specadj", "House has special adjustments/adaptation",
      c(missing_codes(code2 = see("hindep")), value_labels(no = 1, yes = 2))
    )
    .lasa014_add_revised_special_adjustments(
      label_variable, missing_codes, see, value_labels,
      include_wrong_skip_who = TRUE, wave = "3B"
    )
    label_variable(
      "satis", "How (dis)satisfied with housing condition",
      c(missing_codes(code2 = NULL), satisfaction_labels)
    )
    return(engine$finalize())
  }

  # ---- LASMB014 ------------------------------------------------------------
  if (wave == "MB") {
    label_variable(
      "hindep", "OBSERVATION: type of housing",
      c(
        missing_codes(code2 = NULL),
        value_labels(
          independent = 1,
          `residential home` = 2,
          `nursing h-somatic` = 3,
          `nursing h-psych` = 4,
          hospital = 5,
          `psychiatric hospital` = 6,
          other = 7
        )
      )
    )
    return(engine$finalize())
  }

  # ---- LASAI014 through LASAK014 ------------------------------------------
  label_variable(
    "hindep", "OBSERVATION: type of housing",
    c(missing_codes(code2 = see("moved")), housing_observation)
  )
  label_variable(
    "moved", "Moved since last interview",
    c(missing_codes(code3 = NULL, code2 = NULL), value_labels(
      no = 1, yes = 2,
      `yes, temporarily living elsewhere` = 3,
      `lived temporarily elsewhere` = 4
    ))
  )
  label_variable(
    "momonth", "Moved since last int: month",
    c(missing_codes(code2 = see("moved")), month_labels)
  )
  label_variable(
    "moyear", "Moved since last int: year",
    missing_codes(code2 = see("moved"))
  )
  label_variable(
    "housem", "Type of housing: moved since last interview",
    c(missing_codes(code5 = see("hindep"), code2 = see("moved")),
      housing_revised_moved_documented)
  )
  previous_interview_label <- if (wave == "K") {
    "na, previous interview unknown"
  } else {
    "na, previous interview telephonic"
  }
  label_variable(
    "houstyp", "Type of housing: constructed",
    c(setNames(-4, previous_interview_label), value_labels(
      `na, wrong skip` = -3, unknown = -1
    ), housing_revised)
  )
  label_variable(
    "hwhacc", "House accessible by wheelchair",
    c(missing_codes(code5 = see("hindep"), code2 = see("moved")),
      wheelchair_access_labels)
  )
  if (wave == "I") {
    label_variable(
      "nrooms", "# rooms in house",
      missing_codes(code5 = see("hindep"), code2 = see("moved"))
    )
    label_variable(
      "lrooms", "All rooms on the same floor",
      c(missing_codes(code5 = see("hindep"), code2 = see("moved")),
        value_labels(no = 1, yes = 2))
    )
  }
  label_variable(
    "specadj", "House has special adjustments / adaptation",
    c(missing_codes(code2 = see("moved")), value_labels(no = 1, yes = 2))
  )
  .lasa014_add_revised_special_adjustments(
    label_variable, missing_codes, see, value_labels,
    include_wrong_skip_who = TRUE, wave = wave
  )
  label_variable(
    "satis", "How (dis)satisfied with housing condition",
    c(missing_codes(code2 = "na, routing"), satisfaction_labels)
  )
  engine$finalize()
}

# Internal metadata helper for the compact H/3B/I/J/K special-adjustment
# blocks. Function arguments are injected so the generated labels retain the
# correct wave prefix and matching state from apply_lasa014_labels().
.lasa014_add_revised_special_adjustments <- function(label_variable,
                                                     missing_codes,
                                                     see,
                                                     value_labels,
                                                     include_wrong_skip_who,
                                                     wave) {
  definitions <- c(
    spec1 = "Spec. adjust: lowered or no doorstep",
    spec2 = "Spec. adjust: adjusted toilet, supports, handgrips",
    spec3 = if (wave %in% c("H", "3B")) {
      "Spec. adjust: non-skid in bathroom, seating equip"
    } else {
      "Spec. adjust: non-skid in bathroom, seating equipment"
    },
    spec4 = "Spec. adjust: bedroom on same floor",
    spec5 = "Spec. adjust: sloping ramp to pavement",
    spec6 = "Spec. adjust: adjusted sink cupboards kitchen",
    spec7 = "Spec. adjust: fall alarm",
    spec8 = "Spec. adjust: stair elevator"
  )
  basic_labels <- c(
    missing_codes(code2 = see("specadj")),
    value_labels(`not mentioned` = 0, mentioned = 1)
  )
  housing_labels <- c(
    missing_codes(
      code5 = see("hindep"),
      code2 = see("specadj")
    ),
    value_labels(`not mentioned` = 0, mentioned = 1)
  )
  for (suffix in names(definitions)) {
    housing_specific <- c("spec4", "spec5", "spec8")
    if (identical(wave, "H")) {
      housing_specific <- c(housing_specific, "spec7")
    }
    labels <- if (suffix %in% housing_specific) {
      housing_labels
    } else {
      basic_labels
    }
    label_variable(suffix, definitions[[suffix]], labels)
  }

  if (wave %in% c("H", "3B", "I", "J")) {
    label_variable("spec9", "Spec. adjust: other", basic_labels)
  } else if (wave == "K") {
    label_variable(
      "spec9", "Spec. adjust: sensors to monitor movement", basic_labels
    )
    label_variable("spec10", "Spec. adjust: other", basic_labels)
  }

  who_labels <- c(
    missing_codes(
      code3 = if (isTRUE(include_wrong_skip_who)) "na, wrong skip" else NULL,
      code2 = see("specadj")
    ),
    value_labels(
      `for respondent` = 1,
      `for (former) inmate` = 2,
      `for both` = 3,
      `for none, already present` = 4
    )
  )
  label_variable("specwho", "Spec. adjust: for who", who_labels)
  invisible(NULL)
}
