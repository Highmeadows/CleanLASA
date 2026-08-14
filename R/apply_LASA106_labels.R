# Apply LASA 106 (work perception) SPSS labels
#
# Source: LASA106_varinfo.pdf (07-May-2025)

#' Apply LASA106 (Work perception) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the work-perception variables documented in
#' LASA106 for waves 3B, MB, I, J, and K.
#'
#' Waves 3B, I, J, and K contain an employment-history item followed by 21
#' work-demand items. Items 1--17 permit `not applicable` only in wave I;
#' social-support items 18--21 permit it in waves I, J, and K. Wave MB uses a
#' redesigned medical-interview schema: a four-level employment-history item
#' and 13 paired `work demands`/`work demanded` items, for 27 variables total.
#' The documented wave-specific inventories, labels, and response maps are
#' retained.
#'
#' LASA106 fields are categorical. `to_numeric` is accepted for consistency
#' with the shared interface but does not convert them. With
#' `to_factor = TRUE`, matched variables become factors using the documented
#' response labels; observed unlabelled codes remain numeric-text levels.
#'
#' Column matching tries an explicit `name_corrections` override, an exact
#' case-sensitive name, then a case-insensitive exact name. Every matched
#' field preserves the original SPSS coding in `original_labels` and
#' `original_values`. Requested standardization removes the wave prefix,
#' standardizes `respnr`, and inserts `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA106 `.sav` file.
#'   Depending on `wave`, names include `bqworkd`, `iqworkd1`, `jqworkd18`,
#'   `kqworkd21`, `bqworkYN`, `bqworkn1`, and `bqworkp13`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (for example `qworkd`, `qworkd18`,
#'   `qworkyn`, `qworkn1`, or `qworkp1`) to actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, matched variables are converted to
#'   factors using the documented labels; observed unlabelled codes remain
#'   numeric-text levels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA106 has
#'   no variables eligible for numeric conversion.
#' @param standardize_names Logical. If `TRUE`, matched variables are renamed
#'   to canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched names have their wave
#'   prefix removed and a `LASA_wave` column is inserted immediately after
#'   the respondent-number column.
#'
#' @return `data`, with LASA106 labels, optional factor conversion and name
#'   standardization, preserved original SPSS coding, the `LASA_wave`
#'   provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(iqworkd = c(1, 2), iqworkd1 = c(1, 5))
#' dat <- apply_lasa106_labels(dat, wave = "I")
#' attr(dat$iqworkd1, "labels")
apply_lasa106_labels <- function(data,
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
  wave_prefix <- c(`3B` = "b", MB = "b", I = "i", J = "j", K = "k")
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 106 wave: ", wave,
      ". Use one of: 3B, MB, I, J, K.",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = unname(wave_prefix[[wave]]),
    fn_name = "apply_lasa106_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_labels <- function(labels, values) {
    stats::setNames(as.numeric(values), labels)
  }

  if (wave != "MB") {
    engine$label_variable(
      "qworkd", "work demands: ever had a job?",
      value_labels(
        c("na, asked", "never had a job", "has/had a job"),
        c(-1, 1, 2)
      ),
      force_numeric = FALSE
    )

    demand_labels <- c(
      "work demands: use of force",
      "work demands: using tools that cause vibration or shaking",
      "work demands: uncomfortable position",
      "work demands: standing for a long time",
      "work demands: kneeling down or squatting",
      "work demands: working very fast",
      "work demands: a lot of work",
      "work demands: control over how to do the job",
      "work demands: control over sequence of tasks",
      "work demands: think of solutions",
      "work demands: when to take time off",
      "work demands: variation in tasks",
      "work demands: learn new things",
      "work demands: requires creativity",
      "work demands: requires thinking intensively",
      "work demands: requires focus",
      "work demands: requires attention",
      "work demands: help and support of colleagues",
      "work demands: colleagues willing to listen to work related problems",
      "work demands: help and support of supervisor",
      "work demands: supervisor willing to listen to work related problems"
    )
    base_response <- value_labels(
      c(
        "na, see B/I/J/KQWORKD", "na, asked", "never", "sometimes",
        "often", "all the time"
      ),
      c(-2, -1, 1:4)
    )

    for (i in seq_along(demand_labels)) {
      allow_not_applicable <- wave == "I" || (i >= 18L && wave %in% c("J", "K"))
      response <- if (allow_not_applicable) {
        c(base_response, "not applicable" = 5)
      } else {
        base_response
      }
      engine$label_variable(
        paste0("qworkd", i), demand_labels[[i]], response,
        force_numeric = FALSE
      )
    }
  }

  if (wave == "MB") {
    engine$label_variable(
      "qworkYN", "work demands: ever had a job?",
      value_labels(
        c("na, asked", "never had a job", "had a job", "has a job"),
        c(-1, 1, 2, 3)
      ),
      force_numeric = FALSE
    )

    mb_response <- value_labels(
      c(
        "na, see BQWORKYN", "na, asked", "never", "sometimes", "often",
        "all the time"
      ),
      c(-2, -1, 1:4)
    )
    mb_topics <- c(
      "use of force",
      "using tools that cause vibration or shaking",
      "uncomfortable position",
      "standing for a long time",
      "kneeling down or squatting",
      "working very fast",
      "a lot of work",
      "control over how to do the job",
      "control over sequence of tasks",
      "variation in tasks",
      "requires thinking intensively",
      "colleagues willing to listen to work related problems",
      "supervisor willing to listen to work related problems"
    )

    for (i in seq_along(mb_topics)) {
      engine$label_variable(
        paste0("qworkn", i), paste0("work demands: ", mb_topics[[i]]),
        mb_response, force_numeric = FALSE
      )
      engine$label_variable(
        paste0("qworkp", i), paste0("work demanded: ", mb_topics[[i]]),
        mb_response, force_numeric = FALSE
      )
    }
  }

  engine$finalize()
}
