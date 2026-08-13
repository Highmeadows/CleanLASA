# Apply LASA 272 (Negative life events) SPSS variable and value labels
#
# Source: LASA272_varinfo_LifeEvents.pdf (30-May-2023)

#' Apply LASA272 (Negative Life Events) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to data imported from a LASA272 negative-life-events
#' `.sav` file. The function uses the wave-specific names, question wording,
#' and routing/missing-value codes documented for waves C through K.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive match, and (3) a
#' case-insensitive exact match. Variables that cannot be matched are left
#' unchanged and recorded in the `"label_report"` attribute.
#'
#' @param data A data frame or tibble imported from a LASA272 `.sav` file,
#'   containing wave-prefixed variables such as `cfadied`, `dfadied`, or
#'   `kfadied`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"C"`, `"D"`, `"E"`, `"F"`, `"G"`, `"H"`,
#'   `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit name
#'   overrides. Names are canonical LASA272 suffixes without the wave prefix
#'   (for example `fadied` or `illpart`), and values are the actual column
#'   names in `data`, for example `c(fadied = "C_FATHER_DIED")`.
#' @param to_factor Logical. If `FALSE` (default), variables remain numeric
#'   with SPSS-style value-label attributes. If `TRUE`, value-labelled
#'   variables are converted to factors. Observed codes absent from the
#'   codebook are retained as numeric-text levels rather than converted to
#'   `NA`.
#' @param to_numeric Logical. If `FALSE` (default), variables retain their
#'   value-label attributes. If `TRUE`, variables whose value labels consist
#'   exclusively of negative missing-reason codes are converted to plain
#'   numeric and negative values become `NA`. LASA272's documented variables
#'   all include substantive response codes, so this option normally leaves
#'   them labelled (or converts them to factors when `to_factor = TRUE`).
#' @param standardize_names Logical. If `FALSE` (default), original column
#'   names are retained. If `TRUE`, matched columns are renamed to their
#'   canonical lowercase LASA272 names, such as `cfadied` or `killpart`.
#'
#' @return `data`, with variable and value labels applied to matched LASA272
#'   columns, optional factor conversion and name standardization, and a
#'   `"label_report"` attribute retrievable with [lasa_label_report()].
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()],
#'   [apply_lasa046_labels()]
#' @export
#'
#' @examples
#' \dontrun{
#' dat_c <- haven::read_sav("LASAC272.SAV", user_na = TRUE)
#' dat_c <- apply_lasa272_labels(dat_c, wave = "C")
#'
#' dat_k <- read_lasa_sav(
#'   "LASAK272.SAV",
#'   to_factor = TRUE,
#'   standardize_names = TRUE
#' )
#'
#' lasa_label_report(dat_k, problems_only = TRUE)
#' }
apply_lasa272_labels <- function(data,
                                 wave,
                                 name_corrections = NULL,
                                 to_factor = FALSE,
                                 to_numeric = FALSE,
                                 standardize_names = FALSE) {
  wave <- toupper(wave)
  supported_waves <- c("C", "D", "E", "F", "G", "H", "I", "J", "K")

  if (!wave %in% supported_waves) {
    stop(
      "Unknown LASA 272 wave: ", wave,
      ". Use one of: ", paste(supported_waves, collapse = ", "), "."
    )
  }

  prefix <- tolower(wave)

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_name_corrections(name_corrections)

  correction_keys <- if (is.null(name_corrections)) {
    character(0)
  } else {
    tolower(names(name_corrections))
  }

  value_labels <- function(...) c(...)

  is_codebook_numeric <- function(value_label_map) {
    if (is.null(value_label_map) || length(value_label_map) == 0L) {
      return(FALSE)
    }
    codes <- as.numeric(unname(value_label_map))
    all(!is.na(codes) & is.finite(codes) & codes < 0)
  }

  restore_plain_numeric <- function(x) {
    values <- as.numeric(x)
    values[!is.na(values) & values < 0] <- NA_real_
    values
  }

  convert_to_labelled_factor <- function(x, value_label_map) {
    values <- as.numeric(x)
    label_codes <- as.numeric(unname(value_label_map))
    label_text <- names(value_label_map)

    keep <- !duplicated(label_codes)
    label_codes <- label_codes[keep]
    label_text <- label_text[keep]

    observed_codes <- unique(values[!is.na(values)])
    level_codes <- sort(unique(c(label_codes, observed_codes)))
    level_text <- vapply(
      level_codes,
      function(code) {
        i <- match(code, label_codes)
        if (!is.na(i)) label_text[[i]] else as.character(code)
      },
      character(1)
    )

    if (anyDuplicated(level_text)) {
      collided <- unique(
        level_text[duplicated(level_text) | duplicated(level_text, fromLast = TRUE)]
      )
      for (txt in collided) {
        i <- which(level_text == txt)
        level_text[i] <- paste0(txt, " [", level_codes[i], "]")
      }
    }

    factor(values, levels = level_codes, labels = level_text)
  }

  report_rows <- list()
  rename_plan <- character(0)

  record_match_result <- function(suffix, expected_name, matched_name, method) {
    report_rows[[length(report_rows) + 1L]] <<- data.frame(
      suffix = suffix,
      expected_name = expected_name,
      matched_name = if (is.na(matched_name)) NA_character_ else matched_name,
      method = method,
      stringsAsFactors = FALSE
    )
    invisible(NULL)
  }

  label_variable <- function(suffix, variable_label, value_label_map) {
    expected_name <- paste0(prefix, suffix)

    if (tolower(suffix) %in% correction_keys) {
      actual_name <- name_corrections[[match(tolower(suffix), correction_keys)]]
      idx <- match(tolower(actual_name), tolower(names(data)))

      if (is.na(idx)) {
        record_match_result(
          suffix, expected_name, matched_name = actual_name,
          method = "manual_not_found"
        )
        return(invisible(NULL))
      }
      method <- "manual correction"
    } else {
      idx <- match(expected_name, names(data))

      if (!is.na(idx)) {
        method <- "exact"
      } else {
        idx <- match(tolower(expected_name), tolower(names(data)))

        if (!is.na(idx)) {
          method <- "case-insensitive exact"
        } else {
          record_match_result(
            suffix, expected_name, matched_name = NA_character_,
            method = "not found"
          )
          return(invisible(NULL))
        }
      }
    }

    matched_name <- names(data)[idx]
    x <- data[[idx]]
    attr(x, "label") <- variable_label
    attr(x, "labels") <- value_label_map

    if (isTRUE(to_numeric) && is_codebook_numeric(value_label_map)) {
      x <- restore_plain_numeric(x)
      attr(x, "label") <- variable_label
    } else if (isTRUE(to_factor) && length(value_label_map) > 0L) {
      x <- convert_to_labelled_factor(x, value_label_map)
      attr(x, "label") <- variable_label
    }

    data[[idx]] <<- x
    record_match_result(suffix, expected_name, matched_name, method)

    if (isTRUE(standardize_names)) {
      rename_plan[[matched_name]] <<- tolower(expected_name)
    }

    invisible(NULL)
  }

  finalize_labelled_data <- function() {
    label_report <- if (length(report_rows) > 0L) {
      do.call(rbind, report_rows)
    } else {
      data.frame(
        suffix = character(0), expected_name = character(0),
        matched_name = character(0), method = character(0),
        stringsAsFactors = FALSE
      )
    }

    if (isTRUE(standardize_names) && length(rename_plan) > 0L) {
      old_names <- names(rename_plan)
      new_names <- unname(rename_plan)

      if (anyDuplicated(new_names)) {
        duplicated_names <- unique(new_names[duplicated(new_names)])
        stop(
          "standardize_names = TRUE would create duplicate column names: ",
          paste(duplicated_names, collapse = ", "),
          ". Resolve the conflict with 'name_corrections' or by renaming ",
          "the source column(s) before calling apply_lasa272_labels().",
          call. = FALSE
        )
      }

      idx <- match(old_names, names(data))
      names(data)[idx] <- new_names
      label_report$standardized_to <-
        new_names[match(label_report$matched_name, old_names)]
    } else {
      label_report$standardized_to <- NA_character_
    }

    rownames(label_report) <- NULL
    attr(data, "label_report") <- label_report
    data
  }

  parent_death_labels <- function() {
    if (wave == "C") {
      return(value_labels(
        "refusal/skip by I" = -6,
        "terminated interview" = -5,
        "short version Q" = -4,
        "not asked" = -2,
        "no answer" = -1,
        "not died" = 1,
        "died" = 2
      ))
    }

    if (wave == "D") {
      return(value_labels(
        "refusal/skip by I" = -7,
        "terminated" = -6,
        "short version" = -5,
        "do not know" = -4,
        "died earlier" = -3,
        "not asked" = -2,
        "no answer" = -1,
        "not died" = 1,
        "died" = 2
      ))
    }

    if (wave %in% c("E", "F", "G", "H")) {
      return(value_labels(
        "refusal/skip by I" = -7,
        "terminated" = -6,
        "short version" = -5,
        "do not know" = -4,
        "died earlier" = -3,
        "na:died earlier" = -2,
        "no answer" = -1,
        "not died" = 1,
        "died" = 2
      ))
    }

    c(
      if (wave == "K") value_labels("not asked (error routing)" = -11) else numeric(0),
      value_labels(
        "not asked: no data available" = -10,
        "technical problems" = -8,
        "refusal/skip by I" = -7,
        "terminated interview" = -6,
        "short version interview" = -5,
        "do not know" = -4,
        "not asked: died earlier" = -3,
        "answer: died earlier" = -2,
        "no answer" = -1,
        "not died" = 1,
        "died" = 2
      )
    )
  }

  relative_death_labels <- function(relationship) {
    if (wave == "C") {
      answer_prefix <- if (relationship == "brothers") "answ: no " else "answ:no "
      return(value_labels(
        "refusal/skip by I" = -6,
        "terminated interview" = -5,
        "short version Q" = -4,
        setNames(-3, paste0("na:no ", relationship)),
        setNames(-2, paste0(answer_prefix, relationship)),
        "no answer" = -1,
        "no" = 1,
        "yes" = 2
      ))
    }

    if (wave %in% c("D", "E", "F", "G", "H")) {
      answer_prefix <- if (relationship == "brothers") "answ: no " else "answ:no "
      return(value_labels(
        "refusal/skip by I" = -7,
        "terminated" = -6,
        "short version" = -5,
        setNames(-3, paste0("na:no ", relationship)),
        setNames(-2, paste0(answer_prefix, relationship)),
        "no answer" = -1,
        "no" = 1,
        "yes" = 2
      ))
    }

    c(
      if (wave == "K") value_labels("not asked (error routing)" = -11) else numeric(0),
      value_labels(
        "not asked: no data available" = -10,
        "technical problems" = -8,
        "refusal/skip by I" = -7,
        "terminated interview" = -6,
        "short version interview" = -5,
        "do not know" = -4,
        setNames(-3, paste0("not asked: no ", relationship, " (alive)")),
        setNames(-2, paste0("answer: no ", relationship)),
        "no answer" = -1,
        "not died" = 1,
        "died" = 2
      )
    )
  }

  grandchild_death_labels <- function() {
    if (wave == "C") {
      return(value_labels(
        "refusal/skip by I" = -6,
        "terminated interview" = -5,
        "short version Q" = -4,
        "no answer" = -1,
        "no" = 1,
        "yes" = 2
      ))
    }

    if (wave %in% c("D", "E", "F", "G", "H")) {
      return(value_labels(
        "refusal/skip by I" = -7,
        "terminated" = -6,
        "short version" = -5,
        "no answer" = -1,
        "no" = 1,
        "yes" = 2
      ))
    }

    value_labels(
      "technical problems" = -8,
      "refusal/skip by I" = -7,
      "terminated interview" = -6,
      "short version interview" = -5,
      "no answer" = -1,
      "no" = 1,
      "yes" = 2
    )
  }

  partner_illness_labels <- function() {
    if (wave == "C") {
      return(value_labels(
        "refusal/skip by I" = -6,
        "terminated interview" = -5,
        "short version Q" = -4,
        "not asked" = -2,
        "no answer" = -1,
        "no" = 1,
        "yes" = 2
      ))
    }

    if (wave == "D") {
      return(value_labels(
        "refusal/skip by I" = -7,
        "terminated" = -6,
        "short version" = -5,
        "not asked" = -2,
        "no answer" = -1,
        "no" = 1,
        "yes" = 2
      ))
    }

    if (wave %in% c("E", "F", "G", "H")) {
      return(value_labels(
        "refusal/skip by I" = -7,
        "terminated" = -6,
        "short version" = -5,
        "na:no partner" = -2,
        "no answer" = -1,
        "no" = 1,
        "yes" = 2
      ))
    }

    value_labels(
      "technical problems" = -8,
      "refusal/skip by I" = -7,
      "terminated interview" = -6,
      "short version interview" = -5,
      "not asked: partner not identified in demographic part" = -3,
      "not asked: no partner" = -2,
      "no answer" = -1,
      "no" = 1,
      "yes" = 2
    )
  }

  other_event_labels <- function() {
    if (wave == "C") {
      return(value_labels(
        "refusal/skip by I" = -6,
        "terminated interview" = -5,
        "short version Q" = -4,
        "no answer" = -1,
        "no" = 1,
        "yes" = 2
      ))
    }

    if (wave %in% c("D", "E", "F", "G", "H")) {
      return(value_labels(
        "refusal/skip by I" = -7,
        "terminated" = -6,
        "short version" = -5,
        "no answer" = -1,
        "no" = 1,
        "yes" = 2
      ))
    }

    value_labels(
      "technical problems" = -8,
      "refusal/skip by I" = -7,
      "terminated interview" = -6,
      "short version interview" = -5,
      "no answer" = -1,
      "no" = 1,
      "yes" = 2
    )
  }

  short_variable_labels <- c(
    fadied = "father died",
    modied = "mother died",
    brodied = "brothers died",
    sisdied = "sisters died",
    sondied = "sons died",
    daudied = "daughters died",
    gcdied = "grandchildren died",
    illpart = "illness partner/spouse",
    illoth = "illness relative(s)",
    crime = "victim of crime",
    conflic = "conflict /w other persons",
    financ = "financial problems"
  )

  wave_k_variable_labels <- c(
    fadied = paste(
      "Did your father pass away after previous interview / Is uw vader",
      "na Maand Jaar overleden"
    ),
    modied = paste(
      "Did your mother pass away after previous interview / Is uw moeder",
      "na Maand Jaar overleden"
    ),
    brodied = paste(
      "Did any of your brothers die after previous interview / Is één van",
      "uw broers na Maand Jaar overleden"
    ),
    sisdied = paste(
      "Did any of your sisters die after previous interview / Is één van",
      "uw zussen na Maand Jaar overleden"
    ),
    sondied = paste(
      "Did any of your sons die after previous interview / Is één van uw",
      "zonen na Maand Jaar overleden"
    ),
    daudied = paste(
      "Did any of your daughters die after previous interview / Is één van",
      "uw dochters na Maand Jaar overleden"
    ),
    gcdied = paste(
      "Did any of your grandchildren pass away after previous interview /",
      "Is een van uw kleinkinderen na Maand Jaar overleden"
    ),
    illpart = paste(
      "Has your partner been seriously ill or had a serious accident after",
      "previous interview / Is uw partner na Maand Jaar ernstig ziek geweest",
      "of heeft hij/zij een ernstig ongeluk gehad"
    ),
    illoth = paste(
      "After Month Year, has any of your family members been seriously ill",
      "or had a serious accident / Is één van uw familieleden na Maand Jaar",
      "ernstig ziek geweest of heeft een familielid een ernstig ongeluk gehad"
    ),
    crime = paste(
      "Have you been a victim of a serious crime after previous interview /",
      "Bent u na Maand Jaar slachtoffer geworden van een ernstig misdrijf"
    ),
    conflic = paste(
      "After Month Year, have you had a serious argument or conflict with",
      "someone important to you / Heeft u na Maand Jaar een ernstige ruzie",
      "of een conflict gehad met iemand die voor u belangrijk is"
    ),
    financ = paste(
      "Have you had any serious financial problems after previous interview /",
      "Heeft u na Maand Jaar ernstige financiële problemen gehad"
    )
  )

  variable_labels <- if (wave == "K") {
    wave_k_variable_labels
  } else {
    short_variable_labels
  }

  label_variable("fadied", variable_labels[["fadied"]], parent_death_labels())
  label_variable("modied", variable_labels[["modied"]], parent_death_labels())
  label_variable(
    "brodied", variable_labels[["brodied"]],
    relative_death_labels("brothers")
  )
  label_variable(
    "sisdied", variable_labels[["sisdied"]],
    relative_death_labels("sisters")
  )
  label_variable(
    "sondied", variable_labels[["sondied"]],
    relative_death_labels("sons")
  )
  label_variable(
    "daudied", variable_labels[["daudied"]],
    relative_death_labels("daughters")
  )
  label_variable("gcdied", variable_labels[["gcdied"]], grandchild_death_labels())
  label_variable("illpart", variable_labels[["illpart"]], partner_illness_labels())
  label_variable("illoth", variable_labels[["illoth"]], other_event_labels())
  label_variable("crime", variable_labels[["crime"]], other_event_labels())
  label_variable("conflic", variable_labels[["conflic"]], other_event_labels())
  label_variable("financ", variable_labels[["financ"]], other_event_labels())

  finalize_labelled_data()
}
