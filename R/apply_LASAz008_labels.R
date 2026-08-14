# Apply LASAz008 (longitudinal interview dates and age) SPSS labels
#
# Source: LASAz008_varinfo.pdf (29-Jun-2023)

#' Apply LASAz008 (Age) SPSS labels
#'
#' Attaches the variable and value labels documented for the longitudinal
#' LASAz008 age file. The file combines LSN wave A and LASA waves B through K,
#' including the 2B and 3B cohorts, and stores interview dates plus age in
#' years and days for the main/telephone and medical interviews. LASMB008 is
#' documented in the same PDF but belongs to a separate data file and is not
#' labelled by this function.
#'
#' LASAz008 is a wave-spanning `Z` file, so `wave` must be `"Z"`. Variables
#' whose only value label is the documented `-2` no-interview code are
#' eligible for `to_numeric`; negative observed values then become `NA`.
#' Date variables retain their date-valued no-interview label where the
#' codebook documents 03.10.1582 and are not treated as plain numeric.
#'
#' Matching tries an explicit `name_corrections` entry, an exact match, and a
#' case-insensitive exact match, in that order. `standardize_names` lowercases
#' matched names and standardizes `respnr`; either `standardize_names` or
#' `split_wavecode` adds `LASA_wave = "Z"`. Original values and labels are
#' preserved in `original_values` and `original_labels` attributes.
#'
#' @param data A data frame or tibble imported from `LASAz008.sav`.
#' @param wave Character scalar `"Z"`, matched case-insensitively.
#' @param name_corrections Optional named character vector mapping canonical
#'   LASAz008 names to actual column names in `data`.
#' @param to_factor Logical. Convert value-labelled variables to factors while
#'   retaining observed undocumented values as numeric-text levels.
#' @param to_numeric Logical. Restore eligible age/count variables to plain
#'   numeric and replace negative values with `NA`.
#' @param standardize_names Logical. Lowercase matched names, standardize
#'   `respnr`, and add `LASA_wave`.
#' @param split_wavecode Logical. Add `LASA_wave`; implied by
#'   `standardize_names = TRUE`.
#'
#' @return `data` with LASAz008 metadata, requested conversions and naming,
#'   an `LASA_wave` attribute, and a `label_report` matching audit.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, bage = c(65, -2), bdays = c(24000, -2))
#' apply_lasaz008_labels(dat, wave = "Z", to_numeric = TRUE)
apply_lasaz008_labels <- function(data,
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
  if (wave != "Z") {
    stop("Unknown LASAz008 wave: ", wave, ". Use: Z.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = "",
    fn_name = "apply_lasaz008_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  date_names <- c(
    "t1_dat", "t2_dat", "t2m_dat", "t3_dat", "t3m_dat", "t4_dat",
    "t4m_dat", "t5_dat", "t5m_dat", "t6_dat", "t6m_dat", "t7_dat",
    "t7m_dat", "t8_dat", "t8m_dat", "t9_dat", "t9m_dat", "t10_dat",
    "t10m_dat", "t11_dat", "t11m_dat"
  )
  date_labels <- c(
    "LSN interview date (w1)",
    "LASA main interview date (w2)",
    "LASA medical interview date (w2)",
    "LASA main/telephonic interview date (w3)",
    "LASA medical interview date (w3)",
    "LASA main/telephonic interview date (w4)",
    "LASA medical interview date (w4)",
    "LASA main/telephonic interview date (w5)",
    "LASA medical interview date (w5)",
    "LASA main/telephonic interview date (w6)",
    "LASA medical interview date (w6)",
    "LASA main/telephonic interview date (w7)",
    "LASA medical interview date (w7)",
    "LASA main/telephonic interview date (w8)",
    "LASA medical interview date (w8)",
    "LASA main/telephonic interview date (w9)",
    "LASA medical interview date (w9)",
    "LASA main/telephonic interview date (w10)",
    "LASA medical interview date (w10)",
    "LASA main/telephonic interview date (w11)",
    "LASA medical interview date (w11)"
  )
  date_missing <- stats::setNames(
    as.Date("1582-10-03"), "no interview available"
  )
  date_missing_names <- c(
    "t2m_dat", "t3_dat", "t3m_dat", "t4_dat", "t4m_dat", "t5_dat",
    "t5m_dat", "t6_dat", "t6m_dat", "t7_dat", "t7m_dat"
  )
  for (i in seq_along(date_names)) {
    value_map <- if (date_names[[i]] %in% date_missing_names) {
      date_missing
    } else {
      NULL
    }
    label_variable(
      date_names[[i]], date_labels[[i]], value_map, force_numeric = FALSE
    )
  }

  interview_labels <- c(
    A = "LSN interview",
    B = "LASA main interview",
    C = "LASA main/telephonic interview",
    D = "LASA main/telephonic interview",
    E = "LASA main interview",
    F = "LASA main/telephonic interview",
    G = "LASA main/telephonic interview",
    H = "LASA main/telephonic interview",
    I = "LASA main/telephonic interview",
    J = "LASA main/telephonic interview",
    K = "LASA main/telephonic interview"
  )
  wave_numbers <- stats::setNames(seq_along(interview_labels), names(interview_labels))
  age_missing <- c("no interview available" = -2)

  for (wave_letter in names(interview_labels)) {
    prefix <- tolower(wave_letter)
    number <- unname(wave_numbers[[wave_letter]])
    main_label <- unname(interview_labels[[wave_letter]])
    main_map <- if (wave_letter %in% LETTERS[1:7]) age_missing else NULL

    label_variable(
      paste0(prefix, "age"),
      paste0("Age at ", main_label, " (w", number, ")"),
      main_map,
      force_numeric = TRUE
    )
    label_variable(
      paste0(prefix, "days"),
      paste0("Age at ", main_label, " in days (w", number, ")"),
      main_map,
      force_numeric = TRUE
    )

    if (wave_letter != "A") {
      medical_map <- if (wave_letter %in% LETTERS[2:7]) age_missing else NULL
      label_variable(
        paste0(prefix, "mage"),
        paste0("Age at LASA medical interview (w", number, ")"),
        medical_map,
        force_numeric = TRUE
      )
      label_variable(
        paste0(prefix, "mdays"),
        paste0("Age at LASA medical interview in days (w", number, ")"),
        medical_map,
        force_numeric = TRUE
      )
    }
  }

  engine$finalize()
}
