# Apply LASA 048 (children) SPSS labels
#
# Source: LASA048_varinfo.pdf (27-Jun-2022)

#' Apply LASA048 (Children) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to child-record variables documented in LASA048.
#' The implementation covers waves C, E, 2B, F, 3B, MB, and I.
#'
#' The child file was repeatedly redesigned. Wave C contains four network
#' selection fields. Wave E reconstructs child status across earlier waves.
#' Wave 2B adds detailed source/status information, and wave F adds marital
#' history and grandchildren. Wave 3B uses a shorter harmonized child record,
#' MB is a six-field medical-interview file with Dutch variable names, and
#' wave I contains extensive reasons for items not being asked. Each wave's
#' documented inventory, order, wording, sparse codes, and missing reasons
#' are retained.
#'
#' This function labels child-level LASA048 variables only. Constructed
#' respondent-level child summaries stored under filecode 248 are outside its
#' scope.
#'
#' Child/network identifiers, ages, travel/distance measures, ranking fields,
#' and documented year fields are numeric. With `to_numeric = TRUE`, these
#' fields are restored to plain numeric and all observed negative values
#' become `NA`; substantive nonnegative values remain numeric. Other LASA048
#' variables are categorical and are unaffected by `to_numeric`. With
#' `to_factor = TRUE`, categorical variables become factors and observed
#' unlabelled codes remain numeric-text levels. For eligible numeric fields,
#' `to_numeric` takes precedence when both conversions are requested.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive exact match. Variables documented for the selected wave
#' but absent from `data` are left untouched and recorded as `"not found"` in
#' the generic matching audit.
#'
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` follow the parameter contract shared by the package's
#' other `apply_*_labels()` functions. Regardless of conversion, every
#' matched column keeps its original SPSS coding in
#' `attr(x, "original_labels")` and `attr(x, "original_values")`. The
#' `"respnr"` column is matched in any capitalization and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA048 `.sav` file,
#'   for example via [haven::read_sav()]. Depending on `wave`, names include
#'   `cnwmem`, `echstat`, `fchmar`, `bchtrav`, `kindnr`, and `ichfreq`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"C"`, `"E"`, `"2B"`, `"F"`, `"3B"`, `"MB"`,
#'   or `"I"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA048 suffixes without the wave
#'   prefix (for example `chid`, `chstat`, `chage`, `chtrav`, or `nwmem`). For
#'   MB's unprefixed Dutch names, use `kindnr`, `geslacht`, `leeftijd`,
#'   `partner`, `afstand`, or `contact`. Values are actual column names.
#' @param to_factor Logical. If `FALSE` (default), variables retain their
#'   numeric representation with SPSS-style value-label attributes. If
#'   `TRUE`, categorical variables are converted to factors using the
#'   documented labels. Observed unlabelled codes remain numeric-text levels.
#' @param to_numeric Logical. If `TRUE`, documented identifiers, ages,
#'   distances/travel times, ranks, and year fields are restored to plain
#'   numeric and negative values are replaced by `NA`. Other variables remain
#'   categorical. This takes precedence over `to_factor` for eligible fields.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA048 columns are renamed to their canonical lowercase
#'   suffixes with the wave prefix removed; `"respnr"` is standardized; and
#'   `split_wavecode` is always treated as `TRUE`. MB names are already
#'   unprefixed and therefore remain unchanged.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched prefixed columns are renamed with their wave prefix removed and a
#'   new `"LASA_wave"` column filled with `wave` is inserted immediately after
#'   the respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA048 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa047_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   bchid = c(101, 102, 103),
#'   bchage = c(-5, 35, 62),
#'   bchtrav = c(-7, 30, 1440)
#' )
#' dat <- apply_lasa048_labels(dat, wave = "3B", to_numeric = TRUE)
#' attr(dat$bchtrav, "original_labels")
apply_lasa048_labels <- function(data,
                                 wave,
                                 name_corrections = NULL,
                                 to_factor = FALSE,
                                 to_numeric = FALSE,
                                 standardize_names = FALSE,
                                 split_wavecode = FALSE) {
  if (length(wave) != 1L || is.na(wave) || !nzchar(wave)) {
    stop("'wave' must be a single non-empty character value.", call. = FALSE)
  }

  wave <- toupper(wave)
  wave_prefix <- c(C = "c", E = "e", `2B` = "b", F = "f", `3B` = "b",
                   MB = "", I = "i")
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 048 wave: ", wave,
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

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa048_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_labels <- function(labels, values) {
    stats::setNames(as.numeric(values), labels)
  }
  sex <- function(extra = numeric(0)) {
    c(extra, value_labels(c("unknown", "son", "daughter"), c(-1, 1, 2)))
  }
  frequency <- function(missing) {
    c(
      missing,
      value_labels(
        c(
          "never", "yearly or less often", "few times year", "monthly",
          "once every 2 weeks", "weekly", "few times week", "daily/hh member"
        ),
        1:8
      )
    )
  }
  travel <- function(missing) {
    c(
      missing,
      value_labels(c("no time", "30 minutes", "1 hour", ">24 hours"),
                   c(0, 30, 60, 1440))
    )
  }
  employment <- function(missing) {
    c(
      missing,
      value_labels(c("not employed", "<=27 hours/week", ">= 28 hours a week"),
                   1:3)
    )
  }

  if (wave == "C") {
    engine$label_variable("nwmem", "network member id T3", force_numeric = TRUE)
    engine$label_variable(
      "domain", "random number, used in ranking ties",
      value_labels(
        c(
          "household", "children/-in-law", "other kin", "neighborhood",
          "work/school", "organizations", "other non-kin", "forgotten",
          "SYSTEM addition", "RCF addition"
        ),
        1:10
      )
    )
    engine$label_variable(
      "random", "random number, used in ranking ties",
      value_labels(c("SYS/RCF addition", "lowest", "highest"), c(-3, 0, 99)),
      force_numeric = TRUE
    )
    engine$label_variable(
      "freqran", "ranking number frequency",
      value_labels(
        c(
          "SYS/RCF addition", "exists?,del by iter", "highest frequency",
          "2nd highest frequency", ">10 not selected"
        ),
        c(-3, -1, 1, 2, 11)
      ),
      force_numeric = TRUE
    )
  }

  if (wave == "E") {
    engine$label_variable("chid", "child ID", force_numeric = TRUE)
    engine$label_variable(
      "chstat", "status child identification",
      value_labels(
        c(
          "identified, new", "identified, match", "not id:forgotten",
          "not id:died", "not id:died<wave D", "not id:contact broken",
          "not id&<>lasaz047", "!not id:reason unclear",
          "!not id:Q not understood", "!not id:refusal",
          "identified<wave E", "identified@wave E"
        ),
        0:11
      )
    )
    engine$label_variable(
      "chstep", "type child",
      value_labels(
        c(
          "see Echstat", "contact broken", "own child",
          "step:current partner", "step:former partner", "foster",
          "step/foster/adoptive"
        ),
        c(-5, -3, 1, 2, 3, 5, 6)
      )
    )
    engine$label_variable("chsex", "sex of child", sex())
    engine$label_variable(
      "chdead", "year child deceased",
      value_labels(
        c(
          "dbf:died", "alive", "died<=LASAd", "no answer year",
          "not deceased", "before wave A", "before wave C", "before wave D"
        ),
        c(-9, -3, -2, -1, 0, 1, 3, 4)
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chbrok", "year contact /w child broken",
      value_labels(
        c("deceased", "not broken&no ctc", "not broken", "no answer",
          "broken, year?"),
        c(-4, -3, -2, -1, 1)
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chinhh", "child sharing household with R",
      value_labels(
        c(
          "see Echstat", "deceased", "contact broken", "not (not asked)",
          "no answer", "not sharing household", "sharing household"
        ),
        c(-5:-1, 0, 1)
      )
    )
    engine$label_variable(
      "chages", "source of data on age child",
      value_labels(
        c("deceased", "not asked(error)", "asked LASAdc", "asked LASAe",
          "LSNa 1992"),
        c(-4, -2, 1, 2, 3)
      )
    )
    engine$label_variable(
      "chage", "age child (@ time: see ECHAGES)",
      value_labels(c("see Echstat", "deceased", "contact broken", "no answer"),
                   c(-5, -4, -3, -1)),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chpart", "partner status child",
      value_labels(
        c(
          "see Echstat", "deceased", "contact broken", "not asked(error)",
          "no answer", "no partner", "partner in hh child",
          "partner outs hh child"
        ),
        c(-5:-1, 0:2)
      )
    )
    engine$label_variable(
      "gcage", "age youngest child of child",
      value_labels(
        c("see Echstat", "parent deceased", "contact broken", "no children",
          "no answer"),
        -5:-1
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chempl", "no/part/fulltime work child",
      employment(value_labels(
        c("see Echstat", "deceased", "contact broken", "not asked(error)",
          "no answer"),
        -5:-1
      ))
    )
    engine$label_variable(
      "chtrav", "travelling time to child (minutes)",
      travel(value_labels(
        c("see Echstat", "deceased", "contact broken", "no answer"),
        c(-5, -4, -3, -1)
      )),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chfreq", "contact frequency",
      frequency(value_labels(
        c("see Echstat", "deceased", "contact broken", "no answer"),
        c(-5, -4, -3, -1)
      ))
    )
  }

  if (wave == "2B") {
    engine$label_variable("chid", "child ID", force_numeric = TRUE)
    engine$label_variable(
      "chstat", "identification status",
      value_labels(
        c(
          "identified in interview", "added:iter error", "added:R error",
          "added:refusal", "added:no contact", "added:no ctc w/ mother",
          "added:step", "added:in household", "added:foster",
          "added:young child", "added:RCF/SYS"
        ),
        c(1:10, 99)
      )
    )
    engine$label_variable(
      "chtype", "type child",
      value_labels(
        c(
          "RCF/SYS addition", "contact broken", "own child",
          "step:current partner", "step:former partner", "adoptive", "foster",
          "step/foster/adoptive"
        ),
        c(-5, -3, 1:6)
      )
    )
    engine$label_variable(
      "chsex", "sex of child",
      sex(value_labels("RCF/SYS addition", -5))
    )
    engine$label_variable(
      "chinhh", "child sharing household with R",
      value_labels(
        c("RCF/SYS addition", "no answer", "not sharing household",
          "sharing household"),
        c(-5, -1, 0, 1)
      )
    )
    engine$label_variable(
      "chfreq", "contact frequency",
      frequency(value_labels(c("RCF/SYS addition", "no answer"), c(-5, -1)))
    )
    engine$label_variable(
      "chbrok", "contact broken",
      value_labels(
        c("RCF/SYS addition", "not asked (freq<>1)", "not broken", "broken",
          "other"),
        c(-5, -2, 1:3)
      )
    )
    engine$label_variable(
      "chage", "age child",
      value_labels(
        c("RCF/SYS addition", "deceased", "contact broken", "no answer"),
        c(-5, -4, -3, -1)
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chpart", "partner status child",
      value_labels(
        c("RCF/SYS addition", "not asked: age<18", "no answer", "no partner",
          "partner in hh child", "partner outs hh child"),
        c(-5, -2, -1, 0:2)
      )
    )
    engine$label_variable(
      "gcage", "age youngest child of child",
      value_labels(
        c("RCF/SYS addition", "not asked: age<16", "no answer children",
          "no children", "no answer age"),
        c(-5, -4, -3, -2, -1)
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chempl", "employment child: no/part/fulltime",
      employment(value_labels(
        c("RCF addition", "not asked: age<16", "no answer"), c(-5, -2, -1)
      ))
    )
    engine$label_variable(
      "chtrav", "travelling time to child (minutes)",
      travel(value_labels(c("RCF/SYS addition", "no answer"), c(-5, -1))),
      force_numeric = TRUE
    )
    engine$label_variable(
      "datasrc", "data source: sex type inhh freq trav",
      value_labels(
        c(
          "from network", "trav asked", "trav asked changed", "freq asked",
          "freq+trav asked", "inhh asked", "inhh+trav asked",
          "inhh+freq+trav asked", "inhh changed", "type asked",
          "type+trav asked", "type asked changed", "asked",
          "asked;trav changed", "asked;freq changed", "asked,changed",
          "RCF/SYS addition"
        ),
        c(
          11111, 11112, 11113, 11121, 11122, 11211, 11212, 11222, 11311,
          12111, 12112, 13111, 22222, 22223, 22232, 33333, 44444
        )
      )
    )
    engine$label_variable(
      "nwmem", "network member ID",
      value_labels(
        c(
          "missing network", "identified;age 0-17", "not identified;age 0-17",
          "not identified;SYS/RCF addition", "not identified"
        ),
        -5:-1
      ),
      force_numeric = TRUE
    )
  }

  if (wave == "F") {
    engine$label_variable("chid", "child ID", force_numeric = TRUE)
    engine$label_variable(
      "nwmem", "network member ID",
      value_labels("not identified in network", -1), force_numeric = TRUE
    )
    engine$label_variable("chsex", "sex of child", sex())
    engine$label_variable(
      "chtype", "type child",
      value_labels(
        c(
          "unknown", "biological child", "step:current partner",
          "step:former partner", "foster", "step/foster/adoptive"
        ),
        c(-1, 1, 2, 3, 5, 6)
      )
    )
    engine$label_variable(
      "chinhh", "child sharing household with R",
      value_labels(
        c(
          "see Fchstat", "deceased", "contact broken", "not (not asked)",
          "no answer", "not sharing household", "sharing household"
        ),
        c(-5:-1, 0, 1)
      )
    )
    engine$label_variable(
      "chdead", "year child deceased",
      value_labels(
        c(
          "dbf:died", "alive", "ctc broken", "no answer year", "not deceased",
          "before wave A", "before wave C", "before wave D"
        ),
        c(-9, -3, -2, -1, 0, 1, 3, 4)
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chbrok", "year contact /w child broken",
      value_labels(
        c("deceased", "not broken&no ctc", "not broken", "unknown",
          "broken, year?"),
        c(-4, -3, -2, -1, 1)
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chages", "source of data on age child",
      value_labels(
        c("RCF addition", "deceased", "not asked(error)", "asked KK",
          "LASAa 2002"),
        c(-6, -4, -2, 2, 3)
      )
    )
    engine$label_variable(
      "chage", "age child @ wave A | wave F (see fchages)",
      value_labels(
        c("RCF addition", "see Fchstat", "deceased", "contact broken",
          "no answer"),
        c(-6, -5, -4, -3, -1)
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "gc", "grandchildren (children of this child)",
      value_labels(
        c(
          "RCF addition", "deceased", "age<16", "no answer",
          "f048:yes f049:no", "f048:no", "yes(asked)",
          "yes(known from A)", "yes(SYS-RCF)", "yes(broken ctc)",
          "yes(broken;no f049)", "yes(miss #;no f049)", "yes(error;no f049)"
        ),
        c(-6, -4, -2, -1, 0:8)
      )
    )
    engine$label_variable(
      "chmar", "marital status",
      value_labels(
        c(
          "RCF addition", "died", "age<18yrs", "no answer", "never married",
          "married", "registered partnership", "divorced", "widowhood"
        ),
        c(-6, -4, -2, -1, 1:5)
      )
    )
    engine$label_variable(
      "chdiv", "previous marriages",
      value_labels(
        c(
          "RCF addition", "currently divorced", "died", "never married",
          "age<18yrs", "no answer", "no previous marriage",
          "ended by divorce", "ended by widowhood", "1+prev partner relationship",
          "3+eerdere p-rel"
        ),
        c(-6:-1, 1, 2, 3, 4, 6)
      )
    )
    engine$label_variable(
      "chfreq", "contact frequency",
      frequency(value_labels(
        c("RCF addition", "see Fchstat", "deceased", "contact broken",
          "no answer"),
        c(-6, -5, -4, -3, -1)
      ))
    )
    engine$label_variable(
      "chtrav", "travelling time to child (minutes)",
      travel(value_labels(
        c("RCF addition", "see Fchstat", "deceased", "contact broken",
          "no answer"),
        c(-6, -5, -4, -3, -1)
      )),
      force_numeric = TRUE
    )
    common_missing <- value_labels(
      c(
        "RCF addition", "see Fchstat", "deceased", "contact broken",
        "not asked(error)", "no answer"
      ),
      c(-6, -5, -4, -3, -2, -1)
    )
    engine$label_variable(
      "chpart", "partner status child",
      c(common_missing, value_labels(
        c("no partner", "partner in hh child", "partner outs hh child"), 0:2
      ))
    )
    engine$label_variable(
      "chempl", "no/part/fulltime work child", employment(common_missing)
    )
    engine$label_variable(
      "chstat", "status child identification",
      value_labels(
        c(
          "refusal @ A", "ident @ A", "ident @ A (network)",
          "ident @ F (network)", "(old)ident @ F (network)",
          "(new)ident @ F (network)", "(old)ident @ F (RCF)"
        ),
        c(-1, 11:16)
      )
    )
  }

  if (wave == "3B") {
    engine$label_variable("chid", "child ID", force_numeric = TRUE)
    engine$label_variable(
      "chstat", "identification status",
      value_labels(
        c(
          "child+name from network", "child (not name) from network",
          "child added in interview", "from network, added after interview",
          "from RCF, added after interview"
        ),
        11:15
      )
    )
    engine$label_variable(
      "chtype", "type child",
      value_labels(
        c(
          "own child", "step:current partner", "step:former partner", "adoptive",
          "foster", "step/foster/adoptive", "step (which partner?)",
          "other person"
        ),
        c(1:6, 8, 9)
      )
    )
    engine$label_variable(
      "chsex", "sex of child", sex(value_labels("RCF/SYS addition", -5))
    )
    engine$label_variable(
      "chinhh", "child sharing household with R",
      value_labels(c("no answer", "not sharing household", "sharing household"),
                   c(-1, 0, 1))
    )
    engine$label_variable(
      "chfreq", "contact frequency",
      frequency(value_labels(c("RCF/SYS addition", "no answer"), c(-5, -1)))
    )
    engine$label_variable(
      "chage", "age child",
      value_labels(c("RCF/SYS addition", "contact broken", "no answer"),
                   c(-5, -3, -1)),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chpart", "partner status child",
      value_labels(
        c("RCF/SYS addition", "not asked: age<18", "no answer", "no partner",
          "partner in hh child", "partner outs hh child"),
        c(-5, -2, -1, 0:2)
      )
    )
    engine$label_variable(
      "gcage", "age youngest child of child",
      value_labels(
        c(
          "RCF/SYS addition", "not asked: too young",
          "don't know about grandchildren", "no children from this child",
          "no answer"
        ),
        -5:-1
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chempl", "employment child: no/part/fulltime",
      employment(value_labels(
        c("RCF/SYS addition", "not asked: age<16", "no answer"), c(-5, -2, -1)
      ))
    )
    engine$label_variable(
      "chtrav", "travelling time to child (minutes)",
      travel(value_labels(
        c(
          "not asked (child in network, not in top10)", "RCF/SYS addition",
          "not asked (child in network)", "no answer"
        ),
        c(-7, -5, -2, -1)
      )),
      force_numeric = TRUE
    )
    engine$label_variable(
      "nwmem", "network member ID",
      value_labels(
        c(
          "missing network", "identified;age 0-17", "not identified;age 0-17",
          "not identified;interview/SYS/RCF addition", "not identified"
        ),
        -5:-1
      ),
      force_numeric = TRUE
    )
  }

  if (wave == "MB") {
    engine$label_variable("kindnr", "child ID", force_numeric = TRUE)
    engine$label_variable(
      "geslacht", "sex of child", value_labels("no answer", -1),
      force_numeric = FALSE
    )
    engine$label_variable("leeftijd", "age", force_numeric = TRUE)
    engine$label_variable(
      "partner", "partner sharing household with child",
      value_labels("no answer", -1), force_numeric = FALSE
    )
    engine$label_variable(
      "afstand", "distance", value_labels("no answer", -1),
      force_numeric = TRUE
    )
    engine$label_variable(
      "contact", "contact frequency", value_labels("no answer", -1),
      force_numeric = FALSE
    )
  }

  if (wave == "I") {
    engine$label_variable("chid", "child ID", force_numeric = TRUE)
    engine$label_variable(
      "chstat", "identification status",
      value_labels(
        c(
          "child+name from network", "child (not name) from network",
          "child added in KK interview", "from network, added after NW interview",
          "SYS/RCF, added after NW/KK interview",
          "from network, in household, not asked in KK",
          "from network, in household, added in KK interview",
          "from network, not in household, added in KK interview",
          "added in KK interview",
          "from previous observation (excluding step, adoptive, foster)"
        ),
        11:20
      )
    )
    engine$label_variable(
      "chtype", "type child",
      value_labels(
        c(
          "own/biological child", "step: current partner", "step: former partner",
          "adoptive", "foster", "step/foster/adoptive",
          "step (which partner?)", "other person"
        ),
        c(1:6, 8, 9)
      )
    )
    i_common <- value_labels(
      c(
        "deceased", "not asked: added from previous observation",
        "added manually", "in network, not in KK",
        "not asked: skip by interviewer", "child added in or after interview",
        "RCF/SYS addition", "not asked: never contact or died", "no answer"
      ),
      c(-12, -11, -10, -9, -8, -7, -5, -4, -1)
    )
    engine$label_variable(
      "chsex", "sex of child", c(i_common, value_labels(c("son", "daughter"), 1:2))
    )
    engine$label_variable(
      "chdead", "year child deceased",
      value_labels(
        c("not asked / unknown", "alive", "died < observation H or 3B",
          "died, no answer year"),
        c(-5, -3, -2, -1)
      ),
      force_numeric = TRUE
    )
    i_no_rcf <- i_common[unname(i_common) != -5]
    engine$label_variable(
      "chinhh", "child sharing household with R",
      c(i_no_rcf, value_labels(c("not sharing household", "sharing household"),
                               0:1))
    )
    engine$label_variable(
      "chfreq", "contact frequency",
      frequency(c(
        i_common[names(i_common) != "no answer"],
        value_labels("child added after network; not identified in KK", -2),
        value_labels("no answer", -1)
      ))
    )
    engine$label_variable(
      "chbrok", "year contact /w child broken",
      value_labels(
        c("not asked / unknown", "deceased", "not broken & no contact",
          "not broken", "no answer"),
        -5:-1
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chage", "age child",
      c(
        i_common[names(i_common) != "no answer"],
        value_labels("contact broken", -3), value_labels("no answer", -1)
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chpart", "partner status child",
      c(
        i_common[names(i_common) != "no answer"],
        value_labels("not asked: age<18", -2), value_labels("no answer", -1),
        value_labels(c("no partner", "partner in hh child", "partner outs hh child"),
                     0:2)
      )
    )
    engine$label_variable(
      "gcage", "age youngest child of child",
      c(
        i_common[names(i_common) != "no answer"],
        value_labels("don't know about grandchildren", -3),
        value_labels("no children from this child", -2),
        value_labels("no answer", -1)
      ),
      force_numeric = TRUE
    )
    engine$label_variable(
      "chempl", "employment child: no/part/fulltime",
      employment(c(
        i_common[names(i_common) != "no answer"],
        value_labels("not asked: age<16", -2), value_labels("no answer", -1)
      ))
    )
    engine$label_variable(
      "chtrav", "travelling time to child (minutes)",
      travel(c(
        i_common[names(i_common) != "no answer"],
        value_labels("not asked (child in network)", -2),
        value_labels("no answer", -1)
      )),
      force_numeric = TRUE
    )
    engine$label_variable(
      "nwmem", "network member ID",
      value_labels(
        c(
          "missing network", "identified;age 0-17", "not identified;age 0-17",
          "not identified;interview/SYS/RCF addition", "not identified"
        ),
        -5:-1
      ),
      force_numeric = TRUE
    )
  }

  engine$finalize()
}
