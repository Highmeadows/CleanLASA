# Apply LASA 015 (Ownership & neighbourhood) SPSS variable and value labels
#
# Source: LASA015_varinfo.pdf (29-Jun-2023)

#' Apply LASA015 (Ownership and Neighbourhood) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to a LASA015 ownership-and-neighbourhood data frame,
#' using the variable names, wording, routing references, and missing-value
#' codes documented for the requested wave. By default, matched variables
#' remain numeric. Optional arguments allow converting categorical variables
#' to factors, restoring years-in-neighbourhood to plain numeric, correcting
#' mismatched column names, and standardizing names to the canonical LASA
#' documentation spelling.
#'
#' LASA015 changes substantially across waves. Wave B uses a short-version
#' missing code and 0/1 response codes; wave 2B adds detailed intended-move
#' variables and an interview-terminated code; wave G adds a second-home
#' module; and wave 3B omits the routing code from two neighbourhood items.
#' The remaining waves share a core schema, although `movefut` is documented
#' only for C, D, and E. `wave` is therefore required, especially because B,
#' 2B, and 3B all use variable names beginning with `"b"`.
#'
#' The LASA015 PDF records the `gh22owns` routing label as
#' `"na, see GH21OWN"`, even though the variable describes an `gh22own`
#' follow-up. This function preserves the published wording verbatim so its
#' value-label metadata remains auditable against the source document.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive exact match. Variables documented for the selected wave
#' but absent from `data` are left untouched and recorded as `"not found"` in
#' the generic matching audit.
#'
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` are part of the parameter contract shared by every
#' `apply_*_labels()` function in this package. Regardless of
#' `to_factor`/`to_numeric`, every matched column keeps its original SPSS
#' value coding in `attr(x, "original_labels")` and
#' `attr(x, "original_values")`. The `"respnr"` column is matched in any
#' capitalization and, when `standardize_names = TRUE`, renamed to
#' `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA015 `.sav` file,
#'   for example via [haven::read_sav()]. Expected wave-prefixed names include
#'   `bhowner`, `cmovefut`, `ghouse2`, and `gh2locsp`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA015 suffixes without the wave
#'   prefix (for example `howner`, `movefut`, or `h2loc`), and values are the
#'   actual column names in `data`, for example
#'   `c(howner = "B_HOWNER")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their value labels as levels. Observed
#'   values without a codebook label are retained as numeric-text levels
#'   rather than converted to `NA`.
#' @param to_numeric Logical. If `FALSE` (default), years in the neighbourhood
#'   retains its SPSS-style missing-reason labels. If `TRUE`, `yneigh` is
#'   restored to an ordinary numeric vector, negative missing-reason codes
#'   are replaced with `NA`, and non-negative years are retained. This takes
#'   precedence over `to_factor` for `yneigh`; all other variables remain
#'   labelled or become factors according to `to_factor`.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA015 columns are renamed to their canonical lowercase
#'   suffixes with the wave code removed; `"respnr"` in any capitalization is
#'   renamed to `"respnr"`; and `split_wavecode` is always treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with the wave prefix removed (for example,
#'   `ghouse2` becomes `house2`) and a new `"LASA_wave"` column filled with
#'   `wave` is inserted immediately after the respondent-number column. It is
#'   always treated as `TRUE` when `standardize_names = TRUE`.
#'
#' @return `data`, with variable- and value-label attributes attached to every
#'   matched LASA015 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added after
#'   `"respnr"` when `standardize_names = TRUE` or `split_wavecode = TRUE`.
#'   The generic variable-name audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa014_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat_b <- data.frame(
#'   BHOWNER = c(-4, 1, 2),
#'   BMORTGA = c(-2, 1, 2),
#'   BYNEIGH = c(-4, 8, 20)
#' )
#' dat_b <- apply_lasa015_labels(dat_b, wave = "B")
#' attr(dat_b$BHOWNER, "labels")
#'
#' dat_g <- data.frame(
#'   RespNr = 1:3,
#'   GHOUSE2 = c(-1, 1, 2),
#'   GHS21 = c(-2, 0, 1),
#'   GH2DURA = c(-2, 1, 4)
#' )
#' dat_g <- apply_lasa015_labels(
#'   dat_g,
#'   wave = "G",
#'   to_factor = TRUE,
#'   standardize_names = TRUE
#' )
#' lasa_label_report(dat_g, problems_only = TRUE)
apply_lasa015_labels <- function(data,
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
      "Unknown LASA 015 wave: ", wave,
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
    fn_name = "apply_lasa015_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  spec <- function(suffix, variable_label, value_label_map,
                   force_numeric = FALSE) {
    list(
      suffix = suffix,
      variable_label = variable_label,
      value_label_map = value_label_map,
      force_numeric = force_numeric
    )
  }

  ownership_labels <- function(routing_label, short_version = FALSE,
                               asked_label = "na, asked") {
    labels <- c(
      "na, wrong skip" = -3,
      setNames(-2, routing_label),
      setNames(-1, asked_label),
      "owner" = 1,
      "tenant" = 2,
      "subtenant" = 3,
      "resident" = 4,
      "free" = 5
    )
    if (short_version) c("na, short version" = -4, labels) else labels
  }

  mortgage_labels <- function(routing_label, short_version = FALSE,
                              asked_label = "na, asked") {
    labels <- c(
      "na, wrong skip" = -3,
      setNames(-2, routing_label),
      setNames(-1, asked_label),
      "no mortgage" = 1,
      "mortgage" = 2
    )
    if (short_version) c("na, short version" = -4, labels) else labels
  }

  neighbourhood_binary <- function(routing_label = NULL,
                                   short_version = FALSE,
                                   terminated = FALSE) {
    labels <- c("na, wrong skip" = -3)
    if (short_version) labels <- c("na, short version" = -4, labels)
    if (!is.null(routing_label)) {
      labels <- c(labels, setNames(-2, routing_label))
    } else if (terminated) {
      labels <- c(labels, "na, interview terminated" = -2)
    }
    c(labels, "na, asked" = -1, "no" = 1, "yes" = 2)
  }

  if (wave == "B") {
    specs <- list(
      spec(
        "howner", "Ownership of house: owner/rented/free",
        ownership_labels(
          "na, routing",
          short_version = TRUE,
          asked_label = "no answer, asked"
        )
      ),
      spec(
        "mortga", "House is mortgage free",
        mortgage_labels(
          "na, routing",
          short_version = TRUE,
          asked_label = "no answer, asked"
        )
      ),
      spec(
        "movefut", "Want to move the next years",
        c(
          "na, short version" = -4, "na, wrong skip" = -3,
          "na, routing" = -2, "na, asked" = -1, "no" = 0, "yes" = 1
        )
      ),
      spec(
        "yneigh", "How many years in neighbourhood",
        c("na, short version" = -4), force_numeric = TRUE
      ),
      spec(
        "pleas", "Pleasant living in neighbourhood",
        c(
          "na, short version" = -4, "na, wrong skip" = -3,
          "na, routing" = -2, "na, asked" = -1, "no" = 0, "yes" = 1
        )
      ),
      spec(
        "safe", "Feeling safe in evening in neighbourhood",
        c(
          "na, short version" = -4, "na, wrong skip" = -3,
          "na, routing" = -2, "na, asked" = -1, "no" = 0, "yes" = 1
        )
      )
    )
  } else if (wave == "2B") {
    specs <- list(
      spec(
        "howner", "Ownership of house: owner/rented/free",
        ownership_labels("na, see BHINDEP in LAS2B014")
      ),
      spec(
        "mortga", "House is mortgage free",
        mortgage_labels("na, see BHOWNER")
      ),
      spec(
        "yneigh", "How many years in neighbourhood",
        c("na, interview terminated" = -2, "na, asked" = -1),
        force_numeric = TRUE
      ),
      spec(
        "pleas", "Pleasant living in neighbourhood",
        neighbourhood_binary(terminated = TRUE)
      ),
      spec(
        "safe", "Feeling safe in evening in neighbourhood",
        neighbourhood_binary(terminated = TRUE)
      ),
      spec(
        "movefut", "Want to move the next years",
        neighbourhood_binary(terminated = TRUE)
      ),
      spec(
        "movtyph", "Kind of home R wants to move to",
        c(
          "na, wrong skip" = -3,
          "na, see BMOVEFUT" = -2,
          "na, asked" = -1,
          "co-residence with children" = 1,
          "share home with family" = 2,
          "share home with friends" = 3,
          "commune" = 4,
          "service-flat" = 5,
          "apartment building elderly (elevator)" = 6,
          "home elderly (street level)" = 7,
          "home elderly (service provision)" = 8,
          "semi-independent" = 9,
          "old peoples home" = 10,
          "nursing home" = 11,
          "independent" = 12,
          "other" = 13
        )
      ),
      spec(
        "movtypi", "Type of independent home R wants to move to",
        c(
          "na, wrong skip" = -3,
          "na, see BMOVTYPH" = -2,
          "na, asked" = -1,
          "attached row" = 1,
          "semi-detached" = 2,
          "detached" = 3,
          "high rise (elevator)" = 4,
          "high rise (no elevator)" = 5,
          "farm" = 6,
          "low-level apt building" = 7
        )
      ),
      spec(
        "movtyps", "Other kind of home R wants to move to",
        c(
          "na, wrong skip" = -3,
          "na, see BMOVTYPH" = -2,
          "na, asked" = -1,
          "<to be coded>" = 0
        )
      ),
      spec(
        "movrea", "Most important reason for moving",
        c(
          "na, wrong skip" = -3,
          "na, see BMOVTYPH" = -2,
          "na, asked" = -1,
          "poor health R" = 1,
          "poor health partner" = 2,
          "marriage/cohabitation" = 3,
          "divorce" = 4,
          "more privacy" = 5,
          "more companionship" = 6,
          "no burden to others" = 7,
          "closer to (non)kin" = 8,
          "job" = 9,
          "house now too big" = 10,
          "house now too small" = 11,
          "house now too expensive" = 12,
          "house now inadequate" = 13,
          "dislike neighbourhood" = 14,
          "closer to facilities" = 15,
          "demolition house" = 16,
          "other" = 17
        )
      ),
      spec(
        "movreas", "Other reason for moving",
        c(
          "na, wrong skip" = -3,
          "na, see BMOVREA" = -2,
          "na, asked" = -1,
          "<to be coded>" = 0
        )
      )
    )
  } else if (wave == "G") {
    specs <- list(
      spec(
        "howner", "Ownership of house: owner/rented/free",
        ownership_labels("na, see GHINDEP in LASAG014")
      ),
      spec(
        "mortga", "House is mortgage free",
        mortgage_labels("na, see GHOWNER")
      ),
      spec(
        "yneigh", "How many years in neighbourhood",
        c("na, asked" = -1), force_numeric = TRUE
      ),
      spec(
        "pleas", "Pleasant living in neighbourhood",
        neighbourhood_binary("na, routing")
      ),
      spec(
        "safe", "Feeling safe in evening in neighbourhood",
        neighbourhood_binary("na, routing")
      ),
      spec(
        "house2", "Stay in second home more than a month a year",
        c("na, asked" = -1, "no" = 1, "yes" = 2)
      )
    )

    second_home_type <- function(reference) {
      c(
        setNames(-2, paste0("na, see ", reference)),
        "not mentioned" = 0,
        "mentioned" = 1
      )
    }
    specs <- c(
      specs,
      list(
        spec(
          "hs21", "Second home type: second house, apartment",
          second_home_type("GHOUSE2")
        ),
        spec(
          "hs22", "Second home type: caravan, tent on a fixed place",
          second_home_type("GHOUSE2")
        ),
        spec(
          "hs23", "Second home type: mobile home, camper (not fixed)",
          second_home_type("GHOUSE2")
        ),
        spec(
          "hs24", "Second home type: boat",
          second_home_type("GHOUSE2")
        ),
        spec(
          "hs25", "Second home type: home of family or friends",
          second_home_type("GHOUSE2")
        ),
        spec(
          "hs26", "Second home type: something else",
          second_home_type("GHOUSE2")
        ),
        spec(
          "hs26s", "Second home type: something else, specified",
          c("na, see GHS26" = -2, "-to be coded-" = 0)
        ),
        spec(
          "h21own", "Ownership second home, apartment",
          c(
            "na, see GHS21" = -2,
            "na, asked" = -1,
            "owner, without mortgage" = 1,
            "owner, with mortgage" = 2,
            "rented or paid residence" = 3,
            "other" = 4
          )
        ),
        spec(
          "h21owns", "Ownership second home, apartment: other specified",
          c("na, see GH21OWN" = -2, "-to be coded-" = 0)
        ),
        spec(
          "h22own", "Ownership caravan, tent (fixed)",
          c(
            "na, see GHS22" = -2,
            "na, asked" = -1,
            "owner, without mortgage" = 1,
            "owner, with mortgage" = 2,
            "rented or paid residence" = 3,
            "other" = 4
          )
        ),
        spec(
          "h22owns", "Ownership caravan, tent (fixed): other specified",
          c("na, see GH21OWN" = -2, "-to be coded-" = 0)
        ),
        spec(
          "h2dura", "Duration of stay in second home (total per year)",
          c(
            "na, see GHOUSE2" = -2,
            "na, asked" = -1,
            "1 or 2 months" = 1,
            "3 or 4 months" = 2,
            "about half a year" = 3,
            "the larger part of the year" = 4
          )
        ),
        spec(
          "h2loc", "Location of second home, place of stay",
          c(
            "na, see GHOUSE2" = -2,
            "na, asked" = -1,
            "own region, province" = 1,
            "somewhere else in the Netherlands" = 2,
            "in Europe" = 3,
            "outside Europe" = 4
          )
        ),
        spec(
          "h2locsp", "Location of second home, place of stay, specified",
          c("na, see GH2LOC" = -2, "- to be coded-" = 0)
        )
      )
    )
  } else if (wave == "3B") {
    specs <- list(
      spec(
        "howner", "Ownership of house: owner/rented/free",
        ownership_labels("na, see BHINDEP in LAS3B014")
      ),
      spec(
        "mortga", "House is mortgage free",
        mortgage_labels("na, see BHOWNER")
      ),
      spec(
        "yneigh", "How many years in neighbourhood",
        c("na, asked" = -1), force_numeric = TRUE
      ),
      spec(
        "pleas", "Pleasant living in neighbourhood",
        c("na, wrong skip" = -3, "na, asked" = -1, "no" = 1, "yes" = 2)
      ),
      spec(
        "safe", "Feeling safe in evening in neighbourhood",
        c("na, wrong skip" = -3, "na, asked" = -1, "no" = 1, "yes" = 2)
      )
    )
  } else {
    wave_upper <- toupper(prefix)
    specs <- list(
      spec(
        "howner", "Ownership of house: owner/rented/free",
        ownership_labels(
          paste0(
            "na, see ", wave_upper, "HINDEP in LASA", wave_upper, "014"
          )
        )
      ),
      spec(
        "mortga", "House is mortgage free",
        mortgage_labels(paste0("na, see ", wave_upper, "HOWNER"))
      )
    )

    if (wave %in% c("C", "D", "E")) {
      specs <- c(
        specs,
        list(
          spec(
            "movefut", "Want to move the next years",
            neighbourhood_binary("na, routing")
          )
        )
      )
    }

    specs <- c(
      specs,
      list(
        spec(
          "yneigh", "How many years in neighbourhood",
          c("na, asked" = -1), force_numeric = TRUE
        ),
        spec(
          "pleas", "Pleasant living in neighbourhood",
          neighbourhood_binary("na, routing")
        ),
        spec(
          "safe", "Feeling safe in evening in neighbourhood",
          neighbourhood_binary("na, routing")
        )
      )
    )
  }

  for (item in specs) {
    engine$label_variable(
      suffix = item$suffix,
      variable_label = item$variable_label,
      value_label_map = item$value_label_map,
      force_numeric = item$force_numeric
    )
  }

  engine$finalize()
}
