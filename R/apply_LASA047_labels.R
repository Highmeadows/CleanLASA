# Apply LASA 047 (network domain and significance) SPSS labels
#
# Source: LASA047_varinfo.pdf (31-May-2023)

#' Apply LASA047 (Network domain identification and significance) labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to member-level social-network variables documented
#' in LASA047. The implementation covers waves B, C, D, E, 2B, F, G, H, 3B,
#' I, J, and K; the PDF does not document an MB file.
#'
#' The file contains one record for each nominated network member. It records
#' the nomination domain, household status, relationship type, contact
#' frequency, travel time, support-question order, and four types of support.
#' Wave B additionally contains partner status and most-supportive-member
#' indicators. Later waves contain confidant identification instead. The
#' ranking-tie variable `random` is present only through wave G.
#'
#' This function labels variables stored in the member-level LASA047 files
#' only. Network-size and aggregate variables stored under constructed
#' filecode 247 are outside its scope.
#'
#' `nwmem`, `freqran`, and `nwtrav` are numeric identifiers, ranks, or
#' measurements. With `to_numeric = TRUE`, these fields are restored to plain
#' numeric and all observed negative values become `NA`; substantive values
#' such as travel-time boundaries 0, 60, and 1440 remain numeric. Other
#' LASA047 variables are categorical and are unaffected by `to_numeric`.
#' With `to_factor = TRUE`, categorical variables become factors and observed
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
#' @param data A data frame or tibble imported from a LASA047 `.sav` file,
#'   for example via [haven::read_sav()]. Depending on `wave`, names include
#'   `bnwmem`, `gnwtrav`, `bnwmsupp`, and `knwconf`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA047 suffixes without the wave
#'   prefix (for example `nwmem`, `nwtype`, `nwtrav`, `emo_rec`, or `nwconf`),
#'   and values are actual column names in `data`.
#' @param to_factor Logical. If `FALSE` (default), variables retain their
#'   numeric representation with SPSS-style value-label attributes. If
#'   `TRUE`, categorical variables are converted to factors using the
#'   documented labels. Observed unlabelled codes remain numeric-text levels.
#' @param to_numeric Logical. If `TRUE`, `nwmem`, `freqran`, and `nwtrav` are
#'   restored to plain numeric and negative values are replaced by `NA`.
#'   Other LASA047 variables remain categorical. This conversion takes
#'   precedence over `to_factor` for eligible numeric fields.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA047 columns are renamed to their canonical lowercase
#'   suffixes with the wave prefix removed; `"respnr"` is standardized; and
#'   `split_wavecode` is always treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with their wave prefix removed and a new
#'   `"LASA_wave"` column filled with `wave` is inserted immediately after
#'   the respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA047 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa045_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   gnwmem = c(10101, 10102, 10103),
#'   gnwfreq = c(-6, 4, 8),
#'   gnwtrav = c(-7, 60, 1440)
#' )
#' dat <- apply_lasa047_labels(dat, wave = "G", to_numeric = TRUE)
#' attr(dat$gnwfreq, "labels")
apply_lasa047_labels <- function(data,
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
  wave_prefix <- c(
    B = "b", C = "c", D = "d", E = "e", `2B` = "b", F = "f",
    G = "g", H = "h", `3B` = "b", I = "i", J = "j", K = "k"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 047 wave: ", wave,
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
    fn_name = "apply_lasa047_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_labels <- function(labels, values) {
    stats::setNames(as.numeric(values), labels)
  }

  engine$label_variable(
    "nwmem",
    paste0(
      "network member id = respondent id followed by 2 digits 01..99(max). ",
      "Each occurrence describes a network relation with R"
    ),
    force_numeric = TRUE
  )
  engine$label_variable(
    "domain", "domain in which nominated",
    value_labels(
      c(
        "household", "children/-in-law", "other kin", "neighborhood",
        "work/school", "organizations", "other non-kin", "forgotten",
        "RCF/SYS addition"
      ),
      1:9
    )
  )
  engine$label_variable(
    "nwinhh", "sharing the household with R",
    value_labels(c("unknown", "not sharing", "sharing household"), c(-1, 0, 1))
  )

  nwtype <- value_labels(
    c(
      "spouse or partner",
      "biological son or daughter",
      "son/daughter of partner, step, adoptive, foster (specification available)",
      "stepchild",
      "adoptive child",
      "foster child (= non-kin)",
      "child-in-law",
      "former child-in-law",
      "brother or sister (including half or step)",
      "brother/sister-in-law",
      "father or mother",
      "father/mother-in-law",
      "grandchild",
      "partner of grandchild",
      "cousin/niece/nephew",
      "uncle/aunt",
      "other kin; specification unknown",
      "friend",
      "neighbor",
      "(living in) neighborhood",
      "(former) colleague or his/her spouse",
      "known through volunteer work",
      "known through school, course, education",
      "known through voluntary organization (e.g. church, sports, political)",
      "acquaintance",
      "former neighbor",
      "known through contact at street",
      "housekeeper/nurse/home helper",
      "professional, e.g. pastor, reverend, general practitioner",
      "boarder, landlord",
      "catholic sister",
      "parent-in-law of child",
      "former parent-in-law",
      "former spouse/partner",
      "other non-kin; specification unknown",
      "other kin or non-kin; specification unknown"
    ),
    c(1, 11:15, 21, 22, 30, 40, 51:57, 60, 71, 72, 81:96)
  )
  engine$label_variable(
    "nwtype",
    paste0(
      "relationship type (What relationship do you have with ...? / ",
      "In welke relatie staat ... tot u?)"
    ),
    nwtype
  )

  domtyp <- value_labels(
    c(
      "housekeeper (in household)",
      "acquaintance (in household)",
      "catholic sister (in household)",
      "parent (in household)",
      "parent inlaw (in household)",
      "niece/nephew (in household)",
      "son/daughter-in-law (in household)",
      "brother/sister-in-law (in household)",
      "former partner (in household)",
      "boarder/landlord (in household)",
      "partner/spouse (in household)",
      "biological son/daughter (in household)",
      "brother/sister (in household)",
      "grandson/daughter (in household)",
      "friend (in household)",
      "other, not specified (in household)",
      "other nonkin, not specified (in household)",
      "other kin, not specified (in household)",
      "son/daughter of partner, step, adoptive, foster (in household)",
      "biological son/daughter",
      "son/daughter-in-law",
      "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)",
      "former son/daughter-in-law, other specific cases",
      "stepchild",
      "adoptive child",
      "foster child",
      "parent",
      "brother/sister (including half or step)",
      "brother/sister-in-law",
      "grandson/daughter",
      "cousin/niece/nephew",
      "uncle/aunt",
      "other family; specification unknown",
      "father/mother-in-law",
      "partner/spouse of grandchild",
      "neighbor",
      "former neighbor",
      "living in neighborhood",
      "(former) colleague or his/her spouse",
      "known through volunteer work",
      "known through school, course, education",
      "known through voluntary organization (e.g. church, sports, political)",
      "other nonkin; specification unknown",
      "friend",
      "acquaintance",
      "(former) colleague or his/her spouse ->51",
      "known through voluntary organization (e.g. church, sports, political) ->60",
      "known through contact at street",
      "professional helper",
      "professional, e.g. pastor, reverend, general practitioner",
      "other kin or nonkin; specification unknown",
      "professional helper (frequent contact)",
      "partner/spouse outside household",
      "former spouse/partner",
      "parent of child-in-law",
      "former parent-in-law",
      "landlord",
      "catholic sister",
      "other kin or nonkin; specification unknown"
    ),
    c(1:19, 21:27, 31:42, 51:53, 60, 70:86)
  )
  engine$label_variable(
    "domtyp", "domain type (variable is recoded in Xnwinhh en Xnwtype)",
    domtyp
  )
  engine$label_variable(
    "nwsex", "sex network member",
    value_labels(c("unknown", "male", "female"), c(-1, 1, 2))
  )
  engine$label_variable(
    "nwfreq",
    paste0(
      "frequency of contact <1-8> (How often are you in touch with ...? / ",
      "Hoe vaak heeft u contact met ...?)"
    ),
    value_labels(
      c(
        "NA: see 247", "RCF/SYS addition", "no answer", "never",
        "yearly or less often", "few times year", "monthly",
        "once every 2 weeks", "weekly", "few times week",
        "daily or household member"
      ),
      c(-6, -3, -1, 1:8)
    )
  )

  if (wave %in% c("B", "C", "D", "E", "2B", "F", "G")) {
    engine$label_variable(
      "random", "used in ranking ties frequency",
      value_labels(
        c(
          "NA: see 247", "RCF/SYS addition", "missing", "lowest",
          "highest (LSNa)", "highest (LASA)"
        ),
        c(-6, -3, -1, 0, 59, 99)
      )
    )
  }

  engine$label_variable(
    "freqran", "ranking # frequency",
    value_labels(
      c("NA: see 247", "RCF/SYS addition", "deleted by Interviewer"),
      c(-6, -3, -1)
    ),
    force_numeric = TRUE
  )
  engine$label_variable(
    "nwtrav", "travelling time to network member (minutes)",
    value_labels(
      c(
        "NA:rank>10/12", "NA:see 247", "NA:miss techn",
        "RCF/SYS addition", "no answer", "no time", "1 hour", ">24 hours"
      ),
      c(-7, -6, -4, -3, -1, 0, 60, 1440)
    ),
    force_numeric = TRUE
  )

  if (wave == "B") {
    engine$label_variable(
      "nwpart", "marital/partner status network member",
      value_labels(
        c(
          "NA:rank>10/12", "NA:see 247", "NA:miss techn",
          "RCF/SYS addition", "no answer", "w/partner", "no partner"
        ),
        c(-7, -6, -4, -3, -1, 1, 5)
      )
    )
  }

  sequence_labels <- c(
    "er ir eg ig", "er ir ig eg", "er eg ir ig", "er eg ig ir",
    "er ig ir eg", "er ig eg ir", "ir er eg ig", "ir er ig eg",
    "ir eg er ig", "ir eg ig er", "ir ig er eg", "ir ig eg er",
    "eg er ir ig", "eg er ig ir", "eg ir er ig", "eg ir ig er",
    "eg ig er ir", "eg ig ir er", "ig er ir eg", "ig er eg ir",
    "ig ir er eg", "ig ir eg er", "ig eg er ir", "ig eg ir er"
  )
  sequence_values <- c(
    1234, 1243, 1324, 1342, 1423, 1432,
    2134, 2143, 2314, 2341, 2413, 2431,
    3124, 3142, 3214, 3241, 3412, 3421,
    4123, 4132, 4213, 4231, 4312, 4321
  )
  engine$label_variable(
    "sequenc",
    paste0(
      "sequence questions on support (e=emotional i=instrumental ",
      "r=received g=given)"
    ),
    value_labels(
      c(
        "NA:rank>10/12", "NA:see 247", "RCF/SYS addition",
        "only missings", sequence_labels
      ),
      c(-7, -6, -3, -1, sequence_values)
    )
  )

  support <- value_labels(
    c(
      "NA:rank>10/12", "NA:see 247", "RCF/SYS addition", "no answer",
      "never", "seldom", "sometimes", "often"
    ),
    c(-7, -6, -3, -1, 1:4)
  )
  engine$label_variable(
    "emo_rec",
    paste0(
      "emotional support received (you told ... about your personal ",
      "experiences and feelings)"
    ),
    support
  )
  engine$label_variable(
    "emo_giv",
    paste0(
      "emotional support given (... told you about his/her personal ",
      "experiences and feelings)"
    ),
    support
  )
  engine$label_variable(
    "ins_rec",
    paste0(
      "instrumental support received (... helped you with daily chores ",
      "in and around the house)"
    ),
    support
  )
  engine$label_variable(
    "ins_giv",
    paste0(
      "instrumental support given (you helped ... with daily chores in ",
      "and around the house)"
    ),
    support
  )

  if (wave == "B") {
    engine$label_variable(
      "nwmsupp", "most supportive network member",
      value_labels(
        c(
          "support Q's:no answer", "NA:rank>10", "NA:see 247",
          "NA:only 1 network member", "RCF/SYS addition",
          "as -1,partner not listed", "nobody/refusal/all",
          "<>partner,<>most supportive, no partner in network",
          "<>partner,<>most supportive, partner in network",
          ">partner,<>most supportive, partner not on list in Q",
          "partner, but not most supportive",
          "most supportive=partner",
          "most supportive, no partner in network",
          "most supportive<>partner, partner on list in Q",
          "most supportive<>partner, partner not on list in Q"
        ),
        c(-8, -7, -6, -4, -3, -2, -1, 0:7)
      )
    )
  } else {
    engine$label_variable(
      "nwconf",
      paste0(
        "confidant identification (Which of all the identified persons is ",
        "your confidant? / Welke van alle hiervoor genoemde personen ",
        "beschouwt U als Uw vertrouwenspersoon?)"
      ),
      value_labels(
        c(
          "see 247", "RCF/SYS addition", "not the/a confidant",
          "(1st) confidant", "2nd confidant", "3rd confidant",
          "4th confidant", "5th confidant", "6th confidant",
          "7th confidant", "8th confidant", "9th/last confidant"
        ),
        c(-6, -3, 0:9)
      )
    )
  }

  engine$finalize()
}
