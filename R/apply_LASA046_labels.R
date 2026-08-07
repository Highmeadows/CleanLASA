# Apply LASA 046 (LAPAQ / Physical activity) SPSS variable and value labels
#
# Source: LASA046_varinfo_PhysicalActivity.pdf (19-Jan-2024)
#
# This script keeps variables numeric and stores labels in the same attributes
# used by haven/labelled:
#   attr(x, "label")  = SPSS variable label
#   attr(x, "labels") = named numeric vector of SPSS value labels
#
# Usage:
#   dat_b <- apply_lasa046_labels(dat_b, wave = "B")
#   dat_2b <- apply_lasa046_labels(dat_2b, wave = "2B")
#   dat_h <- apply_lasa046_labels(dat_h, wave = "H")
#   dat_3b <- apply_lasa046_labels(dat_3b, wave = "3B")
#   dat_k <- apply_lasa046_labels(dat_k, wave = "K")
#
# Wave must be supplied because B, 2B, 3B and MB all use variable names
# beginning with "b", while some labels/codings differ between those waves.

apply_lasa046_labels <- function(data, wave) {

  wave <- toupper(wave)

  wave_prefix <- c(
    B = "b", C = "c", D = "d", E = "e", `2B` = "b",
    F = "f", G = "g", H = "h", `3B` = "b", MB = "b",
    I = "i", J = "j", K = "k"
  )

  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 046 wave: ", wave,
      ". Use one of: ", paste(names(wave_prefix), collapse = ", "), "."
    )
  }

  prefix <- unname(wave_prefix[[wave]])

  # ---- Helpers -------------------------------------------------------------

  vl <- function(...) {
    # Named numeric vector: names = value labels, values = numeric codes.
    c(...)
  }

  ref_name <- function(suffix) {
    toupper(paste0(prefix, suffix))
  }

  missing_vl <- function(ref = NULL,
                         include_wrong_skip = TRUE,
                         wrong_skip_label = "na, wrong skip",
                         include_asked = TRUE,
                         include_interview_terminated = FALSE,
                         include_short_interview = FALSE) {
    out <- numeric(0)

    if (include_interview_terminated) {
      out <- c(out, setNames(-5, "na, interview terminated"))
    }
    if (include_short_interview) {
      out <- c(out, setNames(-4, "na, short interview"))
    }
    if (include_wrong_skip) {
      out <- c(out, setNames(-3, wrong_skip_label))
    }
    if (!is.null(ref)) {
      out <- c(out, setNames(-2, paste0("na, see ", ref_name(ref))))
    }
    if (include_asked) {
      out <- c(out, setNames(-1, "na, asked"))
    }

    out
  }

  yes_no_vl <- function(ref = NULL, ...) {
    c(
      missing_vl(ref = ref, ...),
      vl("no" = 1, "yes" = 2)
    )
  }

  mentioned_vl <- function(ref = "lphya39") {
    c(
      missing_vl(ref = ref),
      vl("not mentioned" = 0, "mentioned" = 1)
    )
  }

  sports_old_common <- vl(
    "distance walking" = 1,
    "distance cycling" = 2,
    "gymnastics" = 3,
    "home trainer" = 4,
    "swimming" = 5,
    "(folk)dancing" = 6,
    "bowling" = 7,
    "tennis" = 8,
    "jogging/running/speed walking" = 9,
    "rowing" = 10,
    "sailing" = 11,
    "billiards" = 12,
    "fishing" = 13,
    "soccer/basketball/korfball" = 14,
    "volleybal/baseball" = 15,
    "winter sports" = 16
  )

  sports_old <- function(wave) {
    if (wave %in% c("B", "C", "D", "E")) {
      c(sports_old_common, vl("other sports" = 17))
    } else if (wave %in% c("2B", "F", "G")) {
      c(sports_old_common, vl("golf" = 17, "other sports" = 18))
    } else {
      numeric(0)
    }
  }

  sports_new <- vl(
    "walking / hiking: long distance hiking" = 11,
    "walking / hiking: nordic walking" = 12,
    "walking / hiking: speed walking" = 13,
    "cycling: long distance cycling" = 21,
    "cycling: cycle racing / spinning / mountain biking" = 22,
    "cycling: treadmill at home / cycle ergometer at home" = 23,
    "gymnastics and fitness: gymnastics / exercising at home" = 31,
    "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics" = 32,
    "gymnastics and fitness: yoga / tai chi / qi gong / healing tao" = 33,
    "gymnastics and fitness: endurance training" = 34,
    "swimming: swimming" = 41,
    "swimming: aqua gym / aqua jogging" = 42,
    "racket sports: tennis" = 51,
    "racket sports: table tennis" = 52,
    "racket sports: squash" = 53,
    "racket sports: badminton" = 54,
    "running: running / jogging" = 61,
    "water sports: rowing" = 71,
    "water sports: sailing" = 72,
    "water sports: canoeing" = 73,
    "ball sports: soccer" = 81,
    "ball sports: futsal" = 82,
    "ball sports: hockey" = 83,
    "ball sports: volleyball" = 84,
    "ball sports: basketball" = 85,
    "ball sports: baseball / softball" = 86,
    "ball sports: golf / ball throwing game" = 87,
    "ball sports: bowling / skittles / lawn bowling / kolf / bowls" = 88,
    "winter sports: skiing" = 91,
    "winter sports: cross country skiing" = 92,
    "winter sports: ice skating" = 93,
    "animal sports: horse riding" = 101,
    "animal sports: fishing / pigeon racing" = 102,
    "animal sports: dog training / horse carriage driving" = 103,
    "other sports: climbing" = 111,
    "other sports: billiards / darts" = 112,
    "other sports: (folk) dancing" = 113,
    "other sports: other" = 114
  )

  apply_one <- function(suffix, variable_label, value_labels = NULL) {
    target <- tolower(paste0(prefix, suffix))
    idx <- match(target, tolower(names(data)))

    if (is.na(idx)) {
      return(invisible(NULL))
    }

    x <- data[[idx]]
    attr(x, "label") <- variable_label

    if (!is.null(value_labels)) {
      attr(x, "labels") <- value_labels
    }

    data[[idx]] <<- x
    invisible(NULL)
  }

  # ---- LASMB046 has a small, wave-specific subset --------------------------
  if (wave == "MB") {

    apply_one(
      "lphya07", "Walking outside:last two weeks",
      c(
        missing_vl(
          ref = "lphya06",
          include_interview_terminated = TRUE,
          include_short_interview = TRUE
        ),
        vl("no" = 1, "yes" = 2)
      )
    )

    apply_one(
      "lphya08", "Walking outside: #times last two weeks",
      missing_vl(ref = "lphya07")
    )

    apply_one(
      "lphya09", "Walking: time in minutes",
      missing_vl(ref = "lphya07")
    )

    apply_one(
      "lphya11", "Bicycling: last two weeks",
      c(
        missing_vl(
          ref = NULL,
          include_interview_terminated = TRUE,
          include_short_interview = TRUE
        ),
        vl("no" = 1, "yes" = 2)
      )
    )

    apply_one(
      "lphya12", "Bicycling: # times last two weeks",
      missing_vl(ref = "lphya11")
    )

    apply_one(
      "lphya13", "Bicycling: time in minutes",
      missing_vl(ref = "lphya11")
    )

    apply_one(
      "lphya21", "Sport 1: past two weeks yes/no",
      c(
        missing_vl(
          ref = NULL,
          include_interview_terminated = TRUE,
          include_short_interview = TRUE
        ),
        vl("no" = 1, "yes" = 2)
      )
    )

    apply_one(
      "lphya22", "Sport 1: past two weeks",
      c(missing_vl(ref = "lphya21"), sports_new)
    )

    apply_one(
      "lphya23", "Sport 1: # times past two weeks",
      missing_vl(ref = "lphya21")
    )

    apply_one(
      "lphya24", "Sport 1: time in minutes",
      missing_vl(ref = "lphya23")
    )

    apply_one(
      "lphya37", "Heavy household: # days past two weeks",
      missing_vl(
        ref = NULL,
        include_interview_terminated = TRUE,
        include_short_interview = TRUE
      )
    )

    apply_one(
      "lphya38", "Heavy household: time in minutes",
      missing_vl(ref = "lphya36")
    )

    return(data)
  }

  # ---- Main LASA 046 variables, in numeric order ---------------------------

  # LPHYA01
  apply_one(
    "lphya01", "Physical condition respondent: observation",
    c(
      missing_vl(
        ref = NULL,
        wrong_skip_label = if (wave %in% c("H", "3B", "I", "J", "K")) {
          "not done, wrong skip"
        } else {
          "na, wrong skip"
        },
        include_interview_terminated = TRUE,
        include_short_interview = TRUE
      ),
      vl(
        "respondent bedridden" = 1,
        "respondent in elec. wheelchair" = 2,
        "respondent in mech. wheelchair" = 3,
        "not 1, 2 or 3" = 4
      )
    )
  )

  # LPHYA02
  apply_one(
    "lphya02", "Wheelchair go outside",
    yes_no_vl(ref = "lphya01")
  )

  # LPHYA03
  apply_one(
    "lphya03", "Wheelchair go outside: last two weeks",
    yes_no_vl(ref = "lphya02")
  )

  # LPHYA04
  apply_one(
    "lphya04", "Wheelchair go outside: #times last two weeks",
    missing_vl(ref = "lphya03")
  )

  # LPHYA05
  apply_one(
    "lphya05", "Wheelchair: time in minutes",
    missing_vl(ref = "lphya03")
  )

  # LPHYA06
  apply_one(
    "lphya06", "Walking outside",
    yes_no_vl(ref = "lphya01")
  )

  # LPHYA07
  apply_one(
    "lphya07", "Walking outside:last two weeks",
    yes_no_vl(ref = "lphya06")
  )

  # LPHYA08
  apply_one(
    "lphya08", "Walking outside: #times last two weeks",
    missing_vl(ref = "lphya07")
  )

  # LPHYA09
  apply_one(
    "lphya09", "Walking: time in minutes",
    missing_vl(ref = "lphya07")
  )

  # LPHYA10
  apply_one(
    "lphya10", "Bicycling",
    yes_no_vl(ref = "lphya01")
  )

  # LPHYA11
  apply_one(
    "lphya11", "Bicycling: last two weeks",
    yes_no_vl(ref = "lphya10")
  )

  # LPHYA12
  apply_one(
    "lphya12", "Bicycling: # times last two weeks",
    missing_vl(ref = "lphya11")
  )

  # LPHYA13
  apply_one(
    "lphya13", "Bicycling: time in minutes",
    missing_vl(ref = "lphya11")
  )

  # LPHYA14 (not in I/J/K)
  apply_one(
    "lphya14", "Have garden: yes/no",
    yes_no_vl(ref = "lphya01")
  )

  # LPHYA15
  apply_one(
    "lphya15", "Gardening: yes/no",
    yes_no_vl(
      ref = if (wave %in% c("I", "J", "K")) "lphya01" else "lphya14"
    )
  )

  # LPHYA16 (not in I/J/K)
  apply_one(
    "lphya16", "Gardening: # months a year",
    missing_vl(ref = "lphya15")
  )

  # LPHYA17
  apply_one(
    "lphya17", "Gardening: last two weeks",
    yes_no_vl(ref = "lphya15")
  )

  # LPHYA18
  apply_one(
    "lphya18", "Gardening: # last two weeks",
    missing_vl(ref = "lphya17")
  )

  # LPHYA19
  apply_one(
    "lphya19", "Gardening: time in minutes",
    missing_vl(ref = "lphya17")
  )

  # LPHYA20 (not in I/J/K)
  apply_one(
    "lphya20", "Gardening: digging last two weeks",
    yes_no_vl(ref = "lphya17")
  )

  # LPHYASP (H/3B/I/J/K only)
  apply_one(
    "lphyasp", "Sport: yes/no",
    yes_no_vl(ref = "lphya01")
  )

  # LPHYA21
  apply_one(
    "lphya21", "Sport 1: past two weeks yes/no",
    yes_no_vl(
      ref = if (wave %in% c("H", "3B", "I", "J", "K")) {
        "lphyasp"
      } else {
        "lphya01"
      }
    )
  )

  # LPHYA22
  apply_one(
    "lphya22", "Sport 1: past two weeks",
    c(
      missing_vl(ref = "lphya21"),
      if (wave %in% c("H", "3B", "I", "J", "K")) sports_new else sports_old(wave)
    )
  )

  # LPHYA23
  apply_one(
    "lphya23", "Sport 1: # times past two weeks",
    missing_vl(ref = "lphya21")
  )

  # LPHYA24
  apply_one(
    "lphya24", "Sport 1: time in minutes",
    missing_vl(ref = "lphya23")
  )

  # LPHYA25
  apply_one(
    "lphya25", "Sport 2: yes/no",
    yes_no_vl(ref = "lphya21")
  )

  # LPHYA26
  apply_one(
    "lphya26", "Sport 2: past two weeks",
    c(
      missing_vl(ref = "lphya25"),
      if (wave %in% c("H", "3B", "I", "J", "K")) sports_new else sports_old(wave)
    )
  )

  # LPHYA27
  apply_one(
    "lphya27", "Sport 2: # times past two weeks",
    missing_vl(ref = "lphya25")
  )

  # LPHYA28
  apply_one(
    "lphya28", "Sport 2 : time in minutes",
    missing_vl(ref = "lphya27")
  )

  # LPHYA29 (B/C/D/E/2B/F/G only)
  apply_one(
    "lphya29", "Sport: sweating past two weeks yes/no",
    c(
      missing_vl(ref = "lphya21"),
      vl("no" = 1, "yes" = 2, "do not know" = 3)
    )
  )

  # LPHYA30 (B/C/D/E/2B/F/G only)
  apply_one(
    "lphya30", "Sport: #times sweating past two weeks",
    missing_vl(ref = "lphya29")
  )

  # LSPIN1 (3B only)
  if (wave == "3B") {
    apply_one(
      "lspin1", "Sport: most intensive",
      c(
        vl("sport: most intensive" = -3),
        setNames(-2, paste0("na, see ", ref_name("lphya22"), " & ", ref_name("lphya26"))),
        vl("na, asked" = -1),
        sports_new
      )
    )
  }

  # LSPIN2 (3B only)
  if (wave == "3B") {
    apply_one(
      "lspin2", "Most intensive sport: # times past two weeks",
      missing_vl(ref = "lspin1")
    )
  }

  # LSPIN3 (3B only)
  if (wave == "3B") {
    apply_one(
      "lspin3", "Most intensive sport: time in minutes",
      missing_vl(ref = "lspin2")
    )
  }

  # LPHYA31
  apply_one(
    "lphya31", "Light household: yes/no",
    yes_no_vl(ref = "lphya01")
  )

  # LPHYA32
  apply_one(
    "lphya32", "Light household: past two weeks yes/no",
    c(
      missing_vl(ref = "lphya31"),
      vl("no" = 1, "yes" = 2, "do not know" = 3, "refusal" = 4)
    )
  )

  # LPHYA33
  apply_one(
    "lphya33", "Light household: # days past two weeks",
    missing_vl(ref = "lphya32")
  )

  # LPHYA34
  apply_one(
    "lphya34", "Light household: time in minutes",
    missing_vl(ref = "lphya32")
  )

  # LPHYA35
  apply_one(
    "lphya35", "Heavy household: yes/no",
    yes_no_vl(ref = "lphya01")
  )

  # LPHYA36
  apply_one(
    "lphya36", "Heavy household: past two weeks yes/no",
    c(
      missing_vl(ref = "lphya35"),
      vl("no" = 1, "yes" = 2, "do not know" = 3, "refusal" = 4)
    )
  )

  # LPHYA37
  apply_one(
    "lphya37", "Heavy household: # days past two weeks",
    missing_vl(ref = "lphya36")
  )

  # LPHYA38
  apply_one(
    "lphya38", "Heavy household: time in minutes",
    missing_vl(ref = "lphya36")
  )

  # LPHYA39
  apply_one(
    "lphya39", "Past two weeks normal: yes/no",
    yes_no_vl(ref = "lphya01")
  )

  # LPHYA40
  apply_one(
    "lphya40", "not normal: sick",
    mentioned_vl(ref = "lphya39")
  )

  # LPHYA41
  apply_one(
    "lphya41", "not normal: depressed",
    mentioned_vl(ref = "lphya39")
  )

  # LPHYA42
  apply_one(
    "lphya42", "not normal: bad weather",
    mentioned_vl(ref = "lphya39")
  )

  # LPHYA43
  apply_one(
    "lphya43", "not normal: family affairs",
    mentioned_vl(ref = "lphya39")
  )

  # LPHYA44
  apply_one(
    "lphya44", "not normal: vacation",
    mentioned_vl(ref = "lphya39")
  )

  # LPHYA45: meaning changes from wave F onwards
  apply_one(
    "lphya45",
    if (wave %in% c("B", "C", "D", "E", "2B")) {
      "not normal: other reason"
    } else {
      "not normal: cleaning/repairs"
    },
    mentioned_vl(ref = "lphya39")
  )

  # LPHYA46: meaning/coding changes from wave F onwards
  if (wave %in% c("B", "C", "D", "E", "2B")) {

    lphya46_old <- c(
      setNames(-2, paste0("na, see ", ref_name("lphya45"))),
      if (wave %in% c("D", "E", "2B")) vl("-to be coded-" = 0) else numeric(0),
      vl(
        "visit from friend/family" = 1,
        "positive activities" = 2,
        "illness partner" = 3,
        "good weather" = 4,
        "decease partner" = 5,
        "business-trip" = 6,
        "removal" = 7,
        "spring cleaning" = 8,
        "rebuilding" = 9,
        "other" = 10
      )
    )

    apply_one(
      "lphya46", "not normal: other reasons coded",
      lphya46_old
    )

  } else {

    apply_one(
      "lphya46", "not normal: good weather",
      mentioned_vl(ref = "lphya39")
    )
  }

  # LPHYA47 (F/G/H/3B/I/J/K only)
  apply_one(
    "lphya47", "not normal: season break",
    mentioned_vl(ref = "lphya39")
  )

  # LPHYA48 (F/G/H/3B/I/J/K only)
  apply_one(
    "lphya48", "not normal: sickness partner/others",
    mentioned_vl(ref = "lphya39")
  )

  # LPHYA49 (F/G/H/3B/I/J/K only)
  apply_one(
    "lphya49", "not normal: other reason",
    mentioned_vl(ref = "lphya39")
  )

  # LPHYA50 (F/G/H/3B/I/J/K only)
  lphya50_vl <- c(
    setNames(-2, paste0("na, see ", ref_name("lphya49"))),
    vl(
      "visit from friend/family" = 1,
      "positive activities" = 2,
      "illness partner" = 3,
      "good weather" = 4,
      "death partner" = 5,
      "business-trip" = 6,
      "removal/moved" = 7,
      "spring cleaning" = 8,
      "rebuilding" = 9,
      "other" = 10
    ),
    if (wave == "K") vl("COVID19" = 11) else numeric(0)
  )

  apply_one(
    "lphya50", "not normal: other reasons coded",
    lphya50_vl
  )

  data
}

# ---------------------------------------------------------------------------
# Optional quick checks after applying labels
# ---------------------------------------------------------------------------
# attr(dat$bphya01, "label")   # variable label
# attr(dat$bphya01, "labels")  # value labels
#
# If you use the labelled package:
# labelled::var_label(dat$bphya01)
# labelled::val_labels(dat$bphya01)
