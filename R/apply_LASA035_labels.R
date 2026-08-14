# Apply LASA 035 (Chronic diseases) SPSS variable and value labels
#
# Sources: LASA035_varinfo.pdf (25-Aug-2023) and
# LASA035_headtrauma_varinfo.pdf (08-Aug-2023)

#' Apply LASA035 (Chronic diseases) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the chronic-disease variables documented in
#' LASA035 and its separate head-trauma supplement. All 13 main-interview
#' waves are supported. The selected inventories contain between eight
#' variables in wave MB and 185 variables in wave K.
#'
#' The function follows seven independently documented schema families (B,
#' C, 2B/3B, D--H, MB, I/J, and K). It retains changes in disease-history
#' coding, month/year fields, tumor and metastasis checklists, joint surgery,
#' knee pain, hypertension, care-limitation items, and the K-wave COVID-19
#' and vaccination questions. The separate head-trauma codebook contributes
#' four variables to waves D through K.
#'
#' Repeated `see ...` rows inherit the complete value-label map of the
#' referenced earlier item. Month, other-disease, and joint-location tables
#' are expanded to their full documented value sets. Explicit wave-specific
#' exceptions are applied where a shared PDF table gives different labels or
#' routing codes for 2B versus 3B, D--F versus G/H, or I versus J.
#'
#' By default, matched variables remain numeric with their SPSS-style labels.
#' With `to_factor = TRUE`, categorical variables become factors and observed
#' unlabelled codes remain numeric-text levels. Age, year, distance, and other
#' fields whose codebooks contain only negative missing codes qualify
#' automatically for numeric restoration. Head-trauma counts and the 0--10
#' knee-pain scales are also numeric: with `to_numeric = TRUE`, their negative
#' routing/missing codes become `NA` and non-negative values are retained.
#' Numeric conversion takes precedence over factor conversion.
#'
#' The chronic-disease PDF also documents the derived filecodes 235 and 435.
#' They are intentionally outside LASA035 and are not changed by this
#' function.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive exact match. Variables documented for the selected wave
#' but absent from `data` are left untouched and recorded as `"not found"` in
#' the generic matching audit.
#'
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` are part of the parameter contract shared by every
#' `apply_*_labels()` function in this package. Regardless of conversion,
#' every matched column keeps its original SPSS coding in
#' `attr(x, "original_labels")` and `attr(x, "original_values")`. The
#' `"respnr"` column is matched in any capitalization and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA035 `.sav` file,
#'   for example via [haven::read_sav()]. Depending on `wave`, names include
#'   `bcara01`, `hcance5m`, `irh10_1j`, and `KCORONA1_LC1`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA035 suffixes without the wave
#'   prefix (for example `cara01`, `cance5m`, or `corona1_lc1`), and values
#'   are actual column names in `data`, for example
#'   `c(cara01 = "chronic_lung_disease")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their documented labels. An observed
#'   value without a label remains a numeric-text factor level. Numeric
#'   variables are also factored unless `to_numeric = TRUE`.
#' @param to_numeric Logical. If `FALSE` (default), numeric variables retain
#'   their SPSS-style missing/routing labels. If `TRUE`, documented numeric
#'   fields become ordinary numeric, negative codes become `NA`, and
#'   non-negative values are retained. Other variables remain categorical.
#'   This takes precedence over `to_factor` for numeric fields.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA035 columns are renamed to their canonical lowercase
#'   suffixes with the wave code removed; `"respnr"` is standardized; and
#'   `split_wavecode` is always treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with their wave prefix removed and a new
#'   `"LASA_wave"` column filled with `wave` is inserted immediately after
#'   the respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA035 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa034_labels()], [lasa_label_report()],
#'   [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   kcara01 = c(-5, 0, 3),
#'   kkneep2 = c(-3, 0, 10),
#'   KCORONA1 = c(-5, 1, 2)
#' )
#' dat <- apply_lasa035_labels(dat, wave = "K")
#' attr(dat$kcara01, "labels")
apply_lasa035_labels <- function(data,
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
    G = "g", H = "h", `3B` = "b", MB = "b", I = "i", J = "j", K = "k"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 035 wave: ", wave,
      ". Use one of: ", paste(names(wave_prefix), collapse = ", "), ".",
      call. = FALSE
    )
  }

  prefix <- unname(wave_prefix[[wave]])
  schema <- if (wave == "B") {
    "B"
  } else if (wave == "C") {
    "C"
  } else if (wave %in% c("2B", "3B")) {
    "2B3B"
  } else if (wave %in% c("D", "E", "F", "G", "H")) {
    "DEFGH"
  } else if (wave == "MB") {
    "MB"
  } else if (wave %in% c("I", "J")) {
    "IJ"
  } else {
    "K"
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa035_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  metadata <- list(
    B = list(
      c("bcara01", "CNSLD: asthma, chr bronch, emphysema", "na, interview terminated(-5), na, asked(-1), no(0), yes(1)"),
      c("bcara02", "CNSLD: from which age", "na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1)"),
      c("bcara03", "CNSLD: take medicine", "na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1), no(0), yes(1)"),
      c("bcara04", "CNSLD: treatment doctor", "na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1), no(0), yes, family physician(1), yes, specialist(2)"),
      c("bcara05", "CNSLD: cough almost daily", "na, short version(-4), na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1), no(0), yes(1)"),
      c("bcara06", "CNSLD: phlegm almost daily", "na, short version(-4), na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1), no(0), yes(1)"),
      c("bcara07", "CNSLD: period increased phlegm past year", "see bcara06"),
      c("bcara08", "CNSLD: shortness of breath sometimes", "na, short version(-4), na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1), no(0), yes, with heavy exertion(1), yes, with light exertion(2), yes, at rest(3)"),
      c("bcara09", "CNSLD: wheezing breath ever", "see bcara06"),
      c("bcara10", "CNSLD: wheezing breath during rest", "see bcara06"),
      c("bcara11", "CNSLD: disturbed night-rest or sleeping", "na, short version(-4), na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("bcara12", "CNSLD: going outdoors less because of CNSLD", "na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("bhart01", "Heart: heart disease", "na, interview terminated(-5), na, asked(-1), no(0), yes(1)"),
      c("bhart02", "Heart: from which age", "na, wrong skip(-3), na, see BHART01(-2), na, asked(-1)"),
      c("bhart03", "Heart: take medicine", "na, wrong skip(-3), na, see BHART01(-2), na, asked(-1), no(0), yes(1)"),
      c("bhart04", "Heart: treatment doctor", "na, wrong skip(-3), na, see BHART01(-2), na, asked(-1), no(0), yes, family physician(1), yes, specialist(2)"),
      c("bhart05", "Heart: myocardial infarction", "na, short version(-4), na, wrong skip(-3), na, see BHART01(-2), na, asked(-1), no(0), yes(1)"),
      c("bhart06", "Heart: myocardial inf no of times", "na, wrong skip(-3), na, see BHART05(-2), na, asked(-1), once(1), two times or more(2)"),
      c("bhart07", "Heart: one infarction age", "na, wrong skip(-3), na, see BHART06(-2), na, asked(-1)"),
      c("bhart08", "Heart: first infarction age", "see bhart07"),
      c("bhart09", "Heart: last infarction age", "see bhart07"),
      c("bhart10", "Heart: chest pain during exertion", "na, short version(-4), na, wrong skip(-3), na, see BHART01(-2), na, asked(-1), no(0), yes(1), no exertion: chest pain(2), no exertion: pain legs(3), no exertion: shortness of breath(4), no exertion: joint complaints(5), no exertion: other reason(6)"),
      c("bhart11", "Heart: exertion pain disappears in 10 minutes", "na, wrong skip(-3), na, see BHART10(-2), na, asked(-1), no(0), yes(1)"),
      c("bhart12", "Heart: >1 pillow for shortness of breath", "na, short version(-4), na, wrong skip(-3), na, see BHART01(-2), na, asked(-1), no(0), yes(1)"),
      c("bhart13", "Heart: edema morning; legs, feet, ankles", "see bhart07"),
      c("bhart14", "Heart: edema evening; legs, feet, ankles", "see bhart07"),
      c("bhart15", "Heart: cardiac surgery", "see bhart07"),
      c("bhart15a", "Heart: surgery valves", "na, wrong skip(-3), na, see BHART15(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("bhart15b", "Heart: surgery bypass", "see bhart15a"),
      c("bhart15c", "Heart: surgery dotter", "see bhart15a"),
      c("bhart15d", "Heart: surgery pacemaker", "see bhart15a"),
      c("bhart15e", "Heart: surgery other", "see bhart15a"),
      c("bhart16", "Heart: going outdoors less because of heart disease", "na, wrong skip(-3), na, see BHART01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("bartvei1", "Arteries: disease or abnormalities", "na, interview terminated(-5), na, asked(-1), no(0), yes(1)"),
      c("bartvei2", "Arteries: from which age", "na, wrong skip(-3), na, see BARTVEI1(-2), na, asked(-1)"),
      c("bartvei3", "Arteries: take medicine", "na, wrong skip(-3), na, see BARTVE1(-2), na, asked(-1), no(0), yes(1)"),
      c("bartvei4", "Arteries: treatment doctor", "na, wrong skip(-3), na, see BARTVEI1(-2), na, asked(-1), no(0), yes, family physician(1), yes, specialist(2)"),
      c("bartvei5", "Arteries: pain when walking", "na, short version(-4), na, wrong skip(-3), na, see BARTVEI1(-2), na, asked(-1), no(0), yes(1)"),
      c("bartvei6", "Arteries: pain when walking: meters", "na, wrong skip(-3), na, see BARTVEI5(-2), na, asked(-1)"),
      c("bartvei7", "Arteries: pain disappears standing still", "na, wrong skip(-3), na, see BARTVEI5(-2), na, asked(-1), no(0), yes(1)"),
      c("bartvei8", "Arteries: surgery", "na, short version(-4), na, wrong skip(-3), na, see BARTVEI1(-2), na, asked(-1), no(0), yes(1)"),
      c("bartve8a", "Arteries: surgery bifurcation", "na, wrong skip(-3), na, see BARTVEI8(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("bartve8b", "Arteries: surgery femoral legs", "see bartve8a"),
      c("bartve8c", "Arteries: surgery femoral groin", "see bartve8a"),
      c("bartve8d", "Arteries: surgery dotter", "see bartve8a"),
      c("bartve8e", "Arteries: surgery other", "see bartve8a"),
      c("bartvei9", "Arteries: going outdoors less because of these diseases or abnormalities of the arteries or blood vessels", "na, wrong skip(-3), na, see BARTVEI1(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("bdiabe01", "Diabetes: yes/no", "na, interview terminated(-5), na, asked(-1), no(0), yes(1)"),
      c("bdiabe02", "Diabetes: from which age", "na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1)"),
      c("bdiabe03", "Diabetes: take medicine", "na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1), no(0), yes, insulin injections(1), yes, tablets only(2)"),
      c("bdiabe04", "Diabetes: treatment doctor", "na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1), no(0), yes, family physician(1), yes, specialist(2)"),
      c("bdiabe05", "Diabetes: treatment related eye problems", "na, short version(-4), na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1), no(0), yes(1)"),
      c("bdiabe06", "Diabetes: type of treatment eye problems", "na, wrong skip(-3), na, see BDIABE05(-2), na, asked(-1), laser coagulation treatment(1), cataract surgery(2), both(3), other(4)"),
      c("bdiabe07", "Diabetes: pain when walking already asked BARTVEI5(-6),", "na, short version(-4), na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1), no(0), yes(1)"),
      c("bdiabe08", "Diabetes: pain when walking: no of meter", "na, wrong skip(-3), na, see BDIABE07(-2), na, asked(-1)"),
      c("bdiabe09", "Diabetes: pain disappears standing still", "na, wrong skip(-3), na, see BDIABE07(-2), na, asked(-1), no(0), yes(1)"),
      c("bdiabe10", "Diabetes: pain in legs during rest", "na, short version(-4), na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1), no(0), yes(1)"),
      c("bdiabe11", "Diabetes: chest pain during exertion already asked BHART10(-6),", "na, short version(-4), na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1), no(0), yes(1), no exertion: chest pain(2), no exertion: pain legs(3), no exertion: shortness of breath(4), no exertion: joint complaints(5), no exertion: other reason(6)"),
      c("bdiabe12", "Diabetes: exertion pain disappears in 10 minutes", "na, wrong skip(-3), na, see BDIABE11(-2), na, asked(-1), no(0), yes(1)"),
      c("bdiabe13", "Diabetes: going outdoors less because of diabetes", "na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("bcva01", "CVA: yes/no", "na, interview terminated(-5), na, asked(-1), no(0), yes(1)"),
      c("bcva02", "CVA: how many times", "na, wrong skip(-3), na, see BCVA01(-2), na, asked(-1), once(1), two times or more(2)"),
      c("bcva03", "CVA: one stroke age", "na, wrong skip(-3), na, see BCVA02(-2), na, asked(-1)"),
      c("bcva04", "CVA: first stroke age", "see bcva03"),
      c("bcva05", "CVA: last stroke age", "see bcva03"),
      c("bcva06", "CVA: take medicine", "na, wrong skip(-3), na, see BCVA01(-2), na, asked(-1), no(0), yes(1)"),
      c("bcva07", "CVA: treatment doctor", "na, wrong skip(-3), na, see BCVA01(-2), na, asked(-1), no(0), yes, family physician(1), yes, specialist(2)"),
      c("bcva08", "CVA: still problems with arms and legs", "na, short version(-4), na, wrong skip(-3), na, see BCVA01(-2), na, asked(-1), no(0), yes(1)"),
      c("bcva09", "CVA: still problems with vision", "see bcva08"),
      c("bcva10", "CVA: still problems speech", "see bcva08"),
      c("bcva11", "CVA: still problems understanding written text", "see bcva08"),
      c("bcva12", "CVA: going outdoors less because of CVA", "na, wrong skip(-3), na, see BCVA01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("bincon1", "Incontinence: yes/no", "na, interview terminated(-5), na, asked(-1), no(0), yes(1)"),
      c("bincon2", "Incontinence: from which age", "na, wrong skip(-3), na, see BINCON1(-2), na, asked(-1)"),
      c("bincon3", "Incontinence: take medicine", "na, wrong skip(-3), na, see BINCON1(-2), na, asked(-1), no(0), yes(1)"),
      c("bincon4", "Incontinence: treatment doctor", "na, wrong skip(-3), na, see BINCON1(-2), na, asked(-1), no(0), yes, family physician(1), yes, specialist(2)"),
      c("bincon5", "Incontinence: how often loss of urine", "na, short version(-4), na, wrong skip(-3), na, see BINCON1(-2), na, asked(-1), 2 times a month or less(1), 3-4 times a month(2), a few times a week(3), daily(4)"),
      c("bincon6", "Incontinence: use special material", "na, short version(-4), na, wrong skip(-3), na, see BINCON1(-2), na, asked(-1), no(0), only by certain occasion(1), yes, most of the time(2)"),
      c("bincon7", "Incontinence: surgery yes/no", "na, short version(-4), na, wrong skip(-3), na, see BINCON1(-2), na, asked(-1), no(0), yes(1)"),
      c("bincon8", "Incontinence: going outdoors less because of loss of urine", "na, wrong skip(-3), na, see BINCON1(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("brheum01", "Rheum/arthrosis: osteoarthritis", "na, interview terminated(-5), na, asked(-1), no(0), yes(1)"),
      c("brheum02", "Rheum/arthrosis: rheumatoid arthritis", "na, interview terminated(-5), na, asked(-1), no(0), yes(1)"),
      c("brheum03", "Rheum/arthrosis: from which age", "na, wrong skip(-3), na, see BRHEUM01&02(-2), na, asked(-1)"),
      c("brheum04", "Rheum/arthrosis: take medicine", "na, wrong skip(-3), na, see BRHEUM01&02(-2), na, asked(-1), no(0), yes(1)"),
      c("brheum05", "Rheum/arthrosis: treatment doctor", "na, wrong skip(-3), na, see BRHEUM01&02(-2), na, asked(-1), no(0), yes, family physician(1), yes, specialist(2)"),
      c("brheum06", "Rheum/arthrosis: pain in joints past 3 months", "na, short version(-4), na, wrong skip(-3), na, see BRHEUM01&02(-2), na, asked(-1), no(0), yes(1)"),
      c("brheum07", "Rheum/arthrosis: stiffness joints past 3 month", "see brheum06"),
      c("brheum08", "Rheum/arthrosis: swelling joints past month", "see brheum06"),
      c("brheum8a", "Rheum/arthrosis: complaints fingers", "see brheum06"),
      c("brheum8b", "Rheum/arthrosis: complaints hand/wrist", "see brheum06"),
      c("brheum8c", "Rheum/arthrosis: complaints elbows", "see brheum06"),
      c("brheum8d", "Rheum/arthrosis: complaints shoulders", "see brheum06"),
      c("brheum8e", "Rheum/arthrosis: complaints toes", "see brheum06"),
      c("brheum8f", "Rheum/arthrosis: complaints feet/ankles", "see brheum06"),
      c("brheum8g", "Rheum/arthrosis: complaints knees", "see brheum06"),
      c("brheum8h", "Rheum/arthrosis: complaints hip", "see brheum06"),
      c("brheum8i", "Rheum/arthrosis: complaints neck", "see brheum06"),
      c("brheum09", "Rheum/arthrosis: surgery yes/no", "na, short version(-4), na, wrong skip(-3), na, see BRHEUM01&02(-2), na, asked(-1), no(0), yes(1)"),
      c("brheum9a", "Rheum/arthrosis: surgery fingers", "na, wrong skip(-3), na, see BRHEUM09(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("brheum9b", "Rheum/arthrosis: surgery hand/wrist", "see brheum9a"),
      c("brheum9c", "Rheum/arthrosis: surgery elbows", "see brheum9a"),
      c("brheum9d", "Rheum/arthrosis: surgery shoulders", "see brheum9a"),
      c("brheum9e", "Rheum/arthrosis: surgery toes", "see brheum9a"),
      c("brheum9f", "Rheum/arthrosis: surgery feet/ankles", "see brheum9a"),
      c("brheum9g", "Rheum/arthrosis: surgery knees", "see brheum9a"),
      c("brheum9h", "Rheum/arthrosis: surgery hip", "see brheum9a"),
      c("brheum9i", "Rheum/arthrosis: surgery neck", "see brheum9a"),
      c("brheum10", "Rheum/arthrosis: joint prostheses", "see brheum9a"),
      c("brheum11", "Rheum/arthrosis: going outdoors less because of complaints of joints", "na, wrong skip(-3), na, see BRHEUM01&02(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("brheum12", "Rheum/arthrosis: observation hands", "na, wrong skip(-3), na, see BRHEUM01&02(-2), na, asked(-1), rheumatic hands(1), no rheumatic hands(2), observation not possible(3)"),
      c("bcancer1", "Cancer: yes/no", "na, interview terminated(-5), na, asked(-1), no(0), yes(1)"),
      c("bcancer2", "Cancer: from which age", "na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1)"),
      c("bcancer3", "Cancer: take medicine", "na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), no(0), yes(1)"),
      c("bcancer4", "Cancer: treatment doctor", "na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), no(0), yes, family physician(1), yes, specialist(2)"),
      c("bcance5a", "Cancer: lungs", "na, short version(-4), na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("bcance5b", "Cancer: breast", "see bcance5a"),
      c("bcance5c", "Cancer: uterus", "see bcance5a"),
      c("bcance5d", "Cancer: cervix", "see bcance5a"),
      c("bcance5e", "Cancer: intestines", "see bcance5a"),
      c("bcance5f", "Cancer: prostate", "see bcance5a"),
      c("bcance5g", "Cancer: larynx", "see bcance5a"),
      c("bcance5h", "Cancer: esophagus", "see bcance5a"),
      c("bcance5i", "Cancer: stomach", "see bcance5a"),
      c("bcance5j", "Cancer: blood", "see bcance5a"),
      c("bcance5k", "Cancer: skin", "see bcance5a"),
      c("bcance5l", "Cancer: other", "see bcance5a"),
      c("bcancer6", "Cancer: metastases yes/no", "see bcance5a"),
      c("bcance6a", "Cancer: metastases bone/skeleton", "na, wrong skip(-3), na, see BCANCER6(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("bcance6b", "Cancer: metastases liver", "see bcance6a"),
      c("bcance6c", "Cancer: metastases brain", "see bcance6a"),
      c("bcance6d", "Cancer: metastases lungs", "see bcance6a"),
      c("bcance6e", "Cancer: metastases other", "see bcance6a"),
      c("bcance7a", "Cancer: treatment surgery", "see bcance5a"),
      c("bcance7b", "Cancer: treatment chemotherapy", "see bcance5a"),
      c("bcance7c", "Cancer: treatment radiotherapy", "see bcance5a"),
      c("bcance7d", "Cancer: treatment alternative (Moerman etc)", "see bcance5a"),
      c("bcancer8", "Cancer: going outdoors less because of cancer", "na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("bothsi01", "Other: other diseases yes/no (first)", "na, interview terminated(-5), na, asked(-1), no(0), yes(1)"),
      c("bothsi02", "Other: first disease", "na, wrong skip(-3), na, see BOTHSI01(-2), na, asked(-1), see Table Other diseases*"),
      c("bothsi04", "Other: from which age (first)", "na, wrong skip(-3), na, see BOTHSI01(-2), na, asked(-1)"),
      c("bothsi05", "Other: take medicine (first)", "na, wrong skip(-3), na, see BOTHSI01(-2), na, asked(-1), no(0), yes(1)"),
      c("bothsi06", "Other: treatment doctor (first)", "na, wrong skip(-3), na, see BOTHSI01(-2), na, asked(-1), no(0), yes, family physician(1), yes, specialist(2)"),
      c("bothsi07", "Other: other diseases yes/no (second)", "na, short version(-4), na, wrong skip(-3), na, see BOTHSI01(-2), na, asked(-1), no(0), yes(1)"),
      c("bothsi08", "Other: second disease", "na, wrong skip(-3), na, see BOTHSI07(-2), na, asked(-1), see Table Other diseases*"),
      c("bothsi10", "Other: from which age (second)", "na, wrong skip(-3), na, see BOTHSI07(-2), na, asked(-1)"),
      c("bothsi11", "Other: take medicine (second)", "na, wrong skip(-3), na, see BOTHSI07(-2), na, asked(-1), no(0), yes(1)"),
      c("bothsi12", "Other: treatment doctor (second)", "na, wrong skip(-3), na, see BOTHSI07(-2), na, asked(-1), no(0), yes, family physician(1), yes, specialist(2)"),
      c("brmch", "Reason missing chronic diseases", "valid data(-2), terminated interview(1), short interview(2)")
    ),
    C = list(
      c("ccara01", "CNSLD: asthma, chr bronch, emphysema", "na, see CRMCH(-5), na, asked(-1), no, never(0), no, BCARA01 yes(1), yes, BCARA01 no(2), yes, BCARA01 yes(3)"),
      c("ccara02", "CNSLD: from which age", "na, wrong skip(-3), na, see CCARA01(-2), na, asked(-1)"),
      c("ccara03", "CNSLD: taking medication", "na, wrong skip(-3), na, see CCARA01(-2), na, asked(-1), no(1), yes(2)"),
      c("ccara04", "CNSLD: treatment doctor", "na, wrong skip(-3), na, see CCARA01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("ccara05", "CNSLD: cough almost daily", "see ccara03"),
      c("ccara06", "CNSLD: phlegm almost daily", "see ccara03"),
      c("ccara07", "CNSLD: period increased phlegm past year", "see ccara03"),
      c("ccara08", "CNSLD: shortness of breath sometimes", "na, wrong skip(-3), na, see CCARA01(-2), na, asked(-1), no(1), yes, with heavy exertion(2), yes, with light exertion(3), yes, at rest(4)"),
      c("ccara09", "CNSLD: wheezing breath ever", "see ccara03"),
      c("ccara10", "CNSLD: wheezing breath during rest", "see ccara03"),
      c("ccara11", "CNSLD: disturbed night-rest or sleep", "na, wrong skip(-3), na, see CCARA01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("ccara12", "CNSLD: outdoors less often", "see ccara11"),
      c("chart01", "Heart: heart disease", "na, see CRMCH(-5), na, asked(-1), no, never(0), no, BHART01 yes(1), yes, BHART01 no(2), yes, BHART01 yes(3)"),
      c("chart02", "Heart: from which age", "na, wrong skip(-3), na, see CHART01(-2), na, asked(-1)"),
      c("chart03", "Heart: taking medication", "see chart02, no(1), yes(2)"),
      c("chart04", "Heart: treatment doctor", "na, wrong skip(-3), na, see CHART01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("chart05", "Heart: myocardial infarction since last", "see chart03"),
      c("chart06", "Heart: no of myocardial inf since last interview", "na, wrong skip(-3), na, see CHART05(-2), na, asked(-1), once(1), two times or more(2)"),
      c("chart07m", "Heart: one infarction month", "na, wrong skip(-3), na, see CHART06(-2), na, asked(-1)"),
      c("chart07j", "Heart: one infarction year", "see chart07m"),
      c("chart08m", "Heart: >1; first infarction month", "see chart07m"),
      c("chart08j", "Heart: >1; first infarction year", "see chart07m"),
      c("chart09m", "Heart: >1; last infarction month", "see chart07m"),
      c("chart09j", "Heart: >1; last infarction year", "see chart07m"),
      c("chart10", "Heart: chest pain during exertion", "na, wrong skip(-3), na, see CHART01(-2), na, asked(-1), no(1), yes(2), no exertion: chest pain(3), no exertion: pain legs(4), no exertion: shortness of breath(5), no exertion: joint complaints(6), no exertion: other reason(7)"),
      c("chart11", "Heart: exertion pain disappears in 10 minutes", "na, wrong skip(-3), na, see CHART10(-2), na, asked(-1), no(1), yes(2)"),
      c("chart12", "Heart: >1 pillow for shortness of breath", "na, wrong skip(-3), na, see CHART01(-2), na, asked(-1), no(1), yes(2)"),
      c("chart13", "Heart: edema morning; legs, feet, ankles", "see chart12"),
      c("chart14", "Heart: edema evening; legs, feet, ankles", "see chart12"),
      c("chart15", "Heart: cardiac surgery sin 3be last interview", "see chart12"),
      c("chart15a", "Heart: valves/cardiac surgery since last", "na, wrong skip(-3), na, see CHART15(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("chart15b", "Heart: bypass/cardiac surgery since last int.", "see chart15a"),
      c("chart15c", "Heart: dotter/cardiac surgery since last int.", "see chart15a"),
      c("chart15d", "Heart: pacemaker/cardiac surgery since last interview", "see chart15a"),
      c("chart15e", "Heart: other/cardiac surgery since last int.", "see chart15a"),
      c("chart16", "Heart: outdoors less often", "na, wrong skip(-3), na, see CHART01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("cartvei1", "Arteries: disease or abnormalities", "na, see CRMCH(-5), na, asked(-1), no, never(0), no, BARTVEI1 yes(1), yes, BARTVEI1 no(2), yes, BARTVEI1 yes(3)"),
      c("cartvei2", "Arteries: from which age", "na, wrong skip(-3), na, see CARTVEI1(-2), na, asked(-1)"),
      c("cartvei3", "Arteries: taking medication", "na, wrong skip(-3), na, see CARTVE1(-2), na, asked(-1), no(1), yes(2)"),
      c("cartvei4", "Arteries: treatment doctor", "na, wrong skip(-3), na, see CARTVEI1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("cartvei5", "Arteries: pain when walking", "na, wrong skip(-3), na, see CARTVEI1(-2), na, asked(-1), no(1), yes(2)"),
      c("cartvei6", "Arteries: pain when walking: meters", "na, wrong skip(-3), na, see CARTVEI5(-2), na, asked(-1)"),
      c("cartvei7", "Arteries: pain disappears standing still", "see cartvei6, no(1), yes(2)"),
      c("cartvei8", "Arteries: surgery since last interview", "na, wrong skip(-3), na, see CARTVEI1(-2), na, asked(-1), no(1), yes(2)"),
      c("cartve8a", "Arteries: surgery, bifurcation", "na, wrong skip(-3), na, see CARTVEI8(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("cartve8b", "Arteries: surgery, femoral", "see cartve8a"),
      c("cartve8c", "Arteries: surgery, groins", "see cartve8a"),
      c("cartve8d", "Arteries: surgery, dotter", "see cartve8a"),
      c("cartve8e", "Arteries: surgery, other", "see cartve8a"),
      c("cartvei9", "Arteries: outdoors less often", "na, wrong skip(-3), na, see CARTVEI1(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("cdiabe01", "Diabetes", "na, see CRMCH(-5), na, asked(-1), no, never(0), no, BDIABE01 yes(1), yes, BDIABE01 no(2), yes, BDIABE01 yes(3)"),
      c("cdiabe02", "Diabetes: from which age", "na, wrong skip(-3), na, see CDIABE01(-2), na, asked(-1)"),
      c("cdiabe03", "Diabetes: taking medication", "na, wrong skip(-3), na, see CDIABE01(-2), na, asked(-1), no(1), yes, insulin injections(2), yes, tablets only(3)"),
      c("cdiabe04", "Diabetes: treatment doctor", "na, wrong skip(-3), na, see CDIABE01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("cdiabe05", "Diabetes: treatment related eye problems", "na, wrong skip(-3), na, see CDIABE01(-2), na, asked(-1), no(1), yes(2)"),
      c("cdiabe6a", "Diabetes: eye probl, laser", "na, wrong skip(-3), na, see CDIABE05(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("cdiabe6b", "Diabetes: eye probl, cataract", "see cdiabe6a"),
      c("cdiabe6c", "Diabetes: eye probl, other treatment", "see cdiabe6a"),
      c("cdiabe07", "Diabetes: pain when walking", "na, see CARTVEI1(-6), na, wrong skip(-3), na, see CDIABE01(-2), na, asked(-1), no(1), yes(2)"),
      c("cdiabe08", "Diabetes: pain when walking: no of meter", "na, wrong skip(-3), na, see CDIABE07(-2), na, asked(-1)"),
      c("cdiabe09", "Diabetes: pain disappears standing still", "see cdiabe08, no(1), yes(2)"),
      c("cdiabe10", "Diabetes: pain in legs during rest", "na, wrong skip(-3), na, see CDIABE01(-2), na, asked(-1), no(1), yes(2)"),
      c("cdiabe11", "Diabetes: chest pain during exertion already asked CHART01(-6),", "na, wrong skip(-3), na, see CDIABE01(-2), na, asked(-1), no(1), yes(2), no exertion: chest pain(3), no exertion: pain legs(4), no exertion: shortness of breath(5), no exertion: joint complaints(6), no exertion: other reason(7)"),
      c("cdiabe12", "Diabetes: exertion pain disappears in 10 minutes", "na, wrong skip(-3), na, see CDIABE11(-2), na, asked(-1), no(1), yes(2)"),
      c("cdiabe13", "Diabetes: outdoors less often", "na, wrong skip(-3), na, see CDIABE01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("ccva01", "CVA", "na, see CRMCH(-5), na, asked(-1), no never(0), no, BCVA01 yes(1), yes, BCVA01 no(2), yes, BCVA01 yes(3)"),
      c("ccva02a", "CVA: stroke since last interview", "na, wrong skip(-3), na, see CCVA01(-2), na, asked(-1), no(1), yes(2)"),
      c("ccva02b", "CVA: no of strokes", "na, wrong skip(-3), na, see CCVA02A(-2), na, asked(-1), once(1), two times or more(2)"),
      c("ccva03m", "CVA: 1, stroke month", "na, wrong skip(-3), na, see CCVA02B(-2), na, asked(-1)"),
      c("ccva03j", "CVA: 1, stroke year", "see ccva03m"),
      c("ccva04m", "CVA: > 1, first stroke month", "see ccva03m"),
      c("ccva04j", "CVA: > 1, first stroke year", "see ccva03m"),
      c("ccva05m", "CVA: > 1, last stroke month", "see ccva03m"),
      c("ccva05j", "CVA: > 1, last stroke year", "see ccva03m"),
      c("ccva06", "CVA: taking medication", "na, wrong skip(-3), na, see CCVA01(-2), na, asked(-1), no(1), yes(2)"),
      c("ccva07", "CVA: treatment doctor", "na, wrong skip(-3), na, see CCVA01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("ccva08", "CVA: still problems with arms and legs", "na, wrong skip(-3), na, see CCVA01(-2), na, asked(-1), no(1), yes(2)"),
      c("ccva09", "CVA: still problems with vision", "see ccva08"),
      c("ccva10", "CVA: still problems speech", "see ccva08"),
      c("ccva11", "CVA: still problems understanding written text", "see ccva08"),
      c("ccva12", "CVA: outdoors less often", "na, wrong skip(-3), na, see CCVA01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("cincon1", "Incontinence", "na, see CRMCH(-5), na, asked(-1), no never(0), no, BINCON1 yes(1), yes, BINCON1 no(2), yes, BINCON1 yes(3)"),
      c("cincon2", "Incontinence: from which age", "na, wrong skip(-3), na, see CINCON1(-2), na, asked(-1)"),
      c("cincon3", "Incontinence: taking medication", "na, wrong skip(-3), na, see CINCON1(-2), na, asked(-1), no(1), yes(2)"),
      c("cincon4", "Incontinence: treatment doctor", "na, wrong skip(-3), na, see CINCON1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("cincon5", "Incontinence: how often loss of urine", "na, wrong skip(-3), na, see CINCON1(-2), na, asked(-1), 2 times a month or less(1), 3-4 times a month(2), a few times a week(3), daily(4)"),
      c("cincon6", "Incontinence: use special material", "na, wrong skip(-3), na, see CINCON1(-2), na, asked(-1), no(1), only on certain occasion(2), yes, most of the time(3)"),
      c("cincon7", "Incontinence: surgery since last interview", "na, wrong skip(-3), na, see CINCON1(-2), na, asked(-1), no(1), yes(2)"),
      c("cincon8", "Incontinence: outdoors less often", "na, wrong skip(-3), na, see CINCON1(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("crheum01", "Osteo/rheum art: osteoarthritis", "na, see CRMCH(-5), na, asked(-1), no never(0), no, BRHEUM01 yes(1), yes, BRHEUM01 no(2), yes, BRHEUM01 yes(3)"),
      c("crheum02", "Osteo/rheum art: rheumatoid arthritis", "na, see CRMCH(-5), na, asked(-1), no never(0), no, BRHEUM02 yes(1), yes, BRHEUM02 no(2), yes, BRHEUM02 yes(3)"),
      c("crheum03", "Osteo/rheum art: from which age", "na, wrong skip(-3), na, see CRHEUM01&02(-2), na, asked(-1)"),
      c("crheum04", "Osteo/rheum art: taking medication", "na, wrong skip(-3), na, see CRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("crheum05", "Osteo/rheum art: treatment doctor", "na, wrong skip(-3), na, see CRHEUM01&02(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("crheum06", "Osteo/rheum art: pain in joints past 3 m", "na, wrong skip(-3), na, see CRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("crheum07", "Osteo/rheum art: morning stiffness joint", "see crheum06"),
      c("crheum08", "Osteo/rheum art: swelling joints past month", "see crheum06"),
      c("crheum8a", "Osteo/rheum art: complaints fingers", "na, wrong skip(-3), na, see CRHEUM01&02(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("crheum8b", "Osteo/rheum art: complaints hand/wrist", "see crheum8a"),
      c("crheum8c", "Osteo/rheum art: complaints elbows", "see crheum8a"),
      c("crheum8d", "Osteo/rheum art: complaints shoulders", "see crheum8a"),
      c("crheum8e", "Osteo/rheum art: complaints toes", "see crheum8a"),
      c("crheum8f", "Osteo/rheum art: complaints feet/ankles", "see crheum8a"),
      c("crheum8g", "Osteo/rheum art: complaints knees", "see crheum8a"),
      c("crheum8h", "Osteo/rheum art: complaints hip", "see crheum8a"),
      c("crheum8i", "Osteo/rheum art: complaints neck", "see crheum8a"),
      c("crheum09", "Osteo/rheum art: surgery since last int", "na, wrong skip(-3), na, see CRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("crheum9a", "Osteo/rheum art: surgery fingers", "na, wrong skip(-3), na, see CRHEUM09(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("crheum9b", "Osteo/rheum art: surgery hand/wrist", "see crheum9a"),
      c("crheum9c", "Osteo/rheum art: surgery elbows", "see crheum9a"),
      c("crheum9d", "Osteo/rheum art: surgery shoulders", "see crheum9a"),
      c("crheum9e", "Osteo/rheum art: surgery toes since", "see crheum9a"),
      c("crheum9f", "Osteo/rheum art: surgery feet/ankles", "see crheum9a"),
      c("crheum9g", "Osteo/rheum art: surgery knees", "see crheum9a"),
      c("crheum9h", "Osteo/rheum art: surgery hip", "see crheum9a"),
      c("crheum9i", "Osteo/rheum art: surgery neck", "see crheum9a"),
      c("crheum10", "Osteo/rheum art: joint prostheses", "na, wrong skip(-3), na, see CRHEUM01(-2), na, asked(-1), no(1), yes(2)"),
      c("crheum11", "Osteo/rheum art: outdoors less often", "na, wrong skip(-3), na, see CRHEUM01&02(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("crheum12", "Osteo/rheum art: observation hands", "na, wrong skip(-3), na, see CRHEUM01&02(-2), na, asked(-1), rheumatic hands(1), no rheumatic hands(2), observation not possible(3)"),
      c("ccancer1", "Cancer", "na, see CRMCH(-5), na, asked(-1), no never(0), no, BCANCER1 yes(1), yes, BCANCER1 no(2), yes, BCANCER1 yes(3)"),
      c("ccancer2", "Cancer: from which age", "na, wrong skip(-3), na, see CCANCER1(-2), na, asked(-1)"),
      c("ccancer3", "Cancer: taking medication", "na, wrong skip(-3), na, see CCANCER1(-2), na, asked(-1), no(1), yes(2)"),
      c("ccancer4", "Cancer: treatment doctor", "na, wrong skip(-3), na, see CCANCER1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("ccancer5", "Cancer: tumor since last interview", "na, wrong skip(-3), na, see CCANCER1(-2), na, asked(-1), no(1), yes(2)"),
      c("ccance5a", "Cancer: tumor, lungs", "na, see CCANCER5(-6), na, wrong skip(-3), na, see CCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("ccance5b", "Cancer: tumor, breast", "see ccance5a"),
      c("ccance5c", "Cancer: tumor, uterus", "not asked, male(-7), na, see CCANCER5(-6), na, wrong skip(-3), na, see CCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("ccance5d", "Cancer: tumor, cervix", "see ccance5c"),
      c("ccance5e", "Cancer: tumor, intestines", "see ccance5a"),
      c("ccance5f", "Cancer: tumor, prostate", "not asked, female(-7), na, see CCANCER5(-6), na, wrong skip(-3), na, see CCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("ccance5g", "Cancer: tumor, larynx", "see ccance5a"),
      c("ccance5h", "Cancer: tumor, esophagus", "see ccance5a"),
      c("ccance5i", "Cancer: tumor, stomach", "see ccance5a"),
      c("ccance5j", "Cancer: tumor, blood", "see ccance5a"),
      c("ccance5k", "Cancer: tumor, skin", "see ccance5a"),
      c("ccance5l", "Cancer: tumor, other", "see ccance5a"),
      c("ccance5m", "Cancer: tumor, which other", "na, wrong skip(-3), na, see CCANCE5L(-2), na, asked(-1), to be coded(0)"),
      c("ccancer6", "Cancer: metastases since last interview", "na, wrong skip(-3), na, see CCANCER1(-2), na, asked(-1), no(1), yes(2)"),
      c("ccance6a", "Cancer: metastases, bone/skeleton", "na, wrong skip(-3), na, see CCANCER6(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("ccance6b", "Cancer: metastases, liver", "see ccance6a"),
      c("ccance6c", "Cancer: metastases, brain", "see ccance6a"),
      c("ccance6d", "Cancer: metastases, lungs", "see ccance6a"),
      c("ccance6e", "Cancer: metastases, lymph nodes", "see ccance6a"),
      c("ccance6f", "Cancer: metastases, other", "see ccance6a"),
      c("ccance6g", "Cancer: metastases, which other", "na, wrong skip(-3), na, see CCANCE6F(-2), na, asked(-1), to be coded(0)"),
      c("ccance7a", "Cancer: surgery, since last interview", "na, wrong skip(-3), na, see CCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("ccance7b", "Cancer: chemotherapy, since last interview", "see ccance6a"),
      c("ccance7c", "Cancer: radiotherapy, since last interview", "see ccance6a"),
      c("ccance7d", "Cancer: alternative treatment, since last interview", "see ccance6a"),
      c("ccancer8", "Cancer: outdoors less often", "na, wrong skip(-3), na, see CCANCER1(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("cothsi01", "Other1: other chronic diseases", "na, see CRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("cothsi02", "Other1: disease", "na, wrong skip(-3), na, see COTH1(-2), na, asked(-1), see Table Other diseases*"),
      c("cothsi04", "Other1: from which age", "na, wrong skip(-3), na, see COTH1(-2), na, asked(-1)"),
      c("cothsi05", "Other1: taking medication", "na, wrong skip(-3), na, see COTH1(-2), na, asked(-1), no(1), yes(2)"),
      c("cothsi06", "Other1: treatment doctor", "na, wrong skip(-3), na, see COTH1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("cothsi07", "Other2: other chronic diseases", "na, wrong skip(-3), na, see COTH1(-2), na, asked(-1), no(1), yes(2)"),
      c("cothsi08", "Other2: disease", "na, wrong skip(-3), na, see COTH71(-2), na, asked(-1), see Table Other diseases*"),
      c("cothsi10", "Other2: from which age", "na, wrong skip(-3), na, see COTH71(-2), na, asked(-1)"),
      c("cothsi11", "Other2: taking medication", "na, wrong skip(-3), na, see COTH71(-2), na, asked(-1), no(1), yes(2)"),
      c("cothsi12", "Other2: treatment doctor", "na, wrong skip(-3), na, see COTH71 (-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("chbd1", "Hypertension", "na, see CRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("chbd2", "Hypertension: from which age", "na, wrong skip(-3), na, see CHBD1(-2), na, asked(-1)"),
      c("chbd2a", "Hypertension: taking medication", "na, wrong skip(-3), na, see CHBD1(-2), na, asked(-1), no(1), yes(2)"),
      c("chbd3", "Hypertension: treatment doctor", "na, wrong skip(-3), na, see CHBD1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("crmch", "Reason missing: chronical diseases", "valid data(-2), interview terminated(2), refused test(4)")
    ),
    `2B3B` = list(
      c("bcara01", "CNSLD: asthma, chr bronch, emphysema", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bcara02", "CNSLD: from which age", "na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1)"),
      c("bcara03", "CNSLD: taking medication", "na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1), no(1), yes(2)"),
      c("bcara04", "CNSLD: treatment doctor", "na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("bcara05", "CNSLD: cough almost daily", "na, short interview(-4), na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1), no(1), yes(2)"),
      c("bcara06", "CNSLD: phlegm almost daily", "see bcara05"),
      c("bcara07", "CNSLD: period increased phlegm past year", "see bcara05"),
      c("bcara08", "CNSLD: shortness of breath sometimes", "na, short interview(-4), na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1), no(1), yes, with heavy exertion(2), yes, with light exertion(3), yes, at rest(4)"),
      c("bcara09", "CNSLD: wheezing breath ever", "see bcara05"),
      c("bcara10", "CNSLD: wheezing breath during rest", "see bcara05"),
      c("bcara11", "CNSLD: disturbed night-rest or sleep", "na, short interview(-4), na, wrong skip(-3), na, see BCARA01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("bhart01", "Heart: heart disease", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bhart02", "Heart: from which age", "na, wrong skip(-3), na, see BHART01(-2), na, asked(-1)"),
      c("bhart03", "Heart: taking medication", "na, wrong skip(-3), na, see BHART01(-2), na, asked(-1), no(1), yes(2)"),
      c("bhart04", "Heart: treatment doctor", "na, wrong skip(-3), na, see BHART01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("bhart05", "Heart: myocardial infarction", "na, short interview(-4), na, wrong skip(-3), na, see BHART01(-2), na, asked(-1), no(1), yes(2)"),
      c("bhart06", "Heart: no of myocardial infarctions", "na, wrong skip(-3), na, see BHART05(-2), na, asked(-1), once(1), two times or more(2)"),
      c("bhart07m", "Heart: one infarction month", "na, wrong skip(-3), na, see BHART06(-2), na, asked(-1), see Table Month****"),
      c("bhart07j", "Heart: one infarction year", "na, wrong skip(-3), na, see BHART06(-2), na, asked(-1)"),
      c("bhart08m", "Heart: >1; first infarction month", "see bhart07m"),
      c("bhart08j", "Heart: >1; first infarction year", "see bhart07j"),
      c("bhart09m", "Heart: >1; last infarction month", "see bhart07m"),
      c("bhart09j", "Heart: >1; last infarction year", "see bhart07j"),
      c("bhart10", "Heart: chest pain during exertion", "na, short interview(-4), na, wrong skip(-3), na, see BHART01(-2), na, asked(-1), no(1), yes(2), no exertion: chest pain(3), no exertion: pain legs(4), no exertion: shortness of breath(5), no exertion: joint complaints(6), no exertion: other reason(7)"),
      c("bhart11", "Heart: exertion pain disappears in 10 minutes", "na, wrong skip(-3), na, see BHART10(-2), na, asked(-1), no(1), yes(2)"),
      c("bhart12", "Heart: >1 pillow for shortness of breath", "na, short interview(-4), na, wrong skip(-3), na, see BHART01(-2), na, asked(-1), no(1), yes(2)"),
      c("bhart13", "Heart: edema morning; legs, feet, ankles", "see bhart12"),
      c("bhart14", "Heart: edema evening; legs, feet, ankles", "see bhart12"),
      c("bhart15", "Heart: cardiac surgery", "see bhart12"),
      c("bhart15a", "Heart: valves/cardiac surgery", "na, wrong skip(-3), na, see BHART15(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("bhart15b", "Heart: bypass/cardiac surgery", "see bhart15a"),
      c("bhart15c", "Heart: dotter/cardiac surgery", "see bhart15a"),
      c("bhart15d", "Heart: pacemaker/cardiac surgery", "see bhart15a"),
      c("bhart15e", "Heart: other/cardiac surgery", "see bhart15a"),
      c("bartvei1", "Arteries: disease or abnormalities", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bartvei2", "Arteries: from which age", "na, wrong skip(-3), na, see BARTVEI1(-2), na, asked(-1)"),
      c("bartvei3", "Arteries: taking medication", "na, wrong skip(-3), na, see BARTVE1(-2), na, asked(-1), no(1), yes(2)"),
      c("bartvei4", "Arteries: treatment doctor", "na, wrong skip(-3), na, see BARTVEI1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("bartvei5", "Arteries: pain when walking", "na, short interview(-4), na, wrong skip(-3), na, see BARTVEI1(-2), na, asked(-1), no(1), yes(2)"),
      c("bartvei6", "Arteries: pain when walking: meters", "na, wrong skip(-3), na, see BARTVEI5(-2), na, asked(-1)"),
      c("bartvei7", "Arteries: pain disappears standing still", "na, wrong skip(-3), na, see BARTVEI5(-2), na, asked(-1), no(1), yes(2)"),
      c("bartvei8", "Arteries: surgery", "na, short interview(-4), na, wrong skip(-3), na, see BARTVEI1(-2), na, asked(-1), no(1), yes(2)"),
      c("bartve8a", "Arteries: surgery, bifurcation", "na, wrong skip(-3), na, see BARTVEI8(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("bartve8b", "Arteries: surgery, femoral", "see bartve8a"),
      c("bartve8c", "Arteries: surgery, groins", "see bartve8a"),
      c("bartve8d", "Arteries: surgery, dotter", "see bartve8a"),
      c("bartve8e", "Arteries: surgery, other", "see bartve8a"),
      c("bdiabe01", "Diabetes", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bdiabe02", "Diabetes: from which age", "na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1)"),
      c("bdiabe03", "Diabetes: taking medication", "na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1), no(1), yes, insulin injections(2), yes, tablets only(3) In wave 3B extra: yes, insulin and tablets(4)"),
      c("bdiabe04", "Diabetes: treatment doctor", "na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("bdiabe05", "Diabetes: treatment related eye problems", "na, short interview(-4), na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1), no(1), yes(2) Only in 2B:"),
      c("bdiabe6a", "Diabetes: eye probl, laser", "na, wrong skip(-3), na, see BDIABE05(-2), na, asked(-1), not mentioned(0), mentioned(1) Only in 2B: bbdiabe6b Diabetes: eye probl, cataract see bdiabe6a Only in 2B: bdiabe6c Diabetes: eye probl, other treatment see bdiabe6a Only in 3B:"),
      c("bdiabe06", "Diabetes: eye problems: type of treatment", "na, see BDIABE05(-2), na, asked(-1), laser treatment(1), cataract operation(2), other treatment(3)"),
      c("bdiabe07", "Diabetes: pain when walking", "na, see BARTVEI1(-6), na, short interview(-4), na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1), no(1), yes(2)"),
      c("bdiabe08", "Diabetes: pain when walking: no of meter", "na, wrong skip(-3), na, see BDIABE07(-2), na, asked(-1)"),
      c("bdiabe09", "Diabetes: pain disappears standing still", "na, wrong skip(-3), na, see BDIABE07(-2), na, asked(-1), no(1), yes(2)"),
      c("bdiabe10", "Diabetes: pain in legs during rest", "na, short interview(-4), na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1), no(1), yes(2)"),
      c("bdiabe11", "Diabetes: chest pain during exertion already asked/na,", "see BHART01(-6), na, short interview(-4), na, wrong skip(-3), na, see BDIABE01(-2), na, asked(-1), no(1), yes(2), no exertion: chest pain(3), no exertion: pain legs(4), no exertion: shortness of breath(5), no exertion: joint complaints(6), no exertion: other reason(7)"),
      c("bdiabe12", "Diabetes: exertion pain disappears in 10 minutes", "na, wrong skip(-3), na, see BDIABE11(-2), na, asked(-1), no(1), yes(2)"),
      c("bcva01", "CVA", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bcva02b", "CVA: number of strokes", "na, short interview(-4), na, wrong skip(-3), na, see BCVA02A(-2), na, asked(-1), once(1), two times or more(2)"),
      c("bcva03m", "CVA: 1, stroke month", "na, wrong skip(-3), na, see BCVA02B(-2), na, asked(-1), see Table Month****"),
      c("bcva03j", "CVA: 1, stroke year", "na, wrong skip(-3), na, see BCVA02B(-2), na, asked(-1)"),
      c("bcva04m", "CVA: > 1, first stroke month", "see bcva03m"),
      c("bcva04j", "CVA: > 1, first stroke year", "see bcva03j"),
      c("bcva05m", "CVA: > 1, last stroke month", "see bcva03m"),
      c("bcva05j", "CVA: > 1, last stroke year", "see bcva03j"),
      c("bcva06", "CVA: taking medication In wave 2B:", "na, wrong skip(-3), na, asked(-1), no(1), yes(2) In wave 3B: na, wrong skip(-3), na, see BCVA01(-2), na, asked(-1), no(1), yes(2)"),
      c("bcva07", "CVA: treatment doctor", "na, wrong skip(-3), na, see BCVA01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("bcva08", "CVA: still problems with arms and legs", "na, short interview(-4), na, wrong skip(-3), na, see BCVA01(-2), na, asked(-1), no(1), yes(2)"),
      c("bcva09", "CVA: still problems with vision", "na, short interview(-4), na, wrong skip(-3), na, see BCVA01(-2), na, asked(-1), no(1), yes(2)"),
      c("bcva10", "CVA: still problems speech", "see bcva09"),
      c("bcva11", "CVA: still problems understanding written text", "see bcva09"),
      c("bincon1", "Incontinence", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bincon2", "Incontinence: from which age", "na, wrong skip(-3), na, see BINCON1(-2), na, asked(-1)"),
      c("bincon3", "Incontinence: taking medication", "na, wrong skip(-3), na, see BINCON1(-2), na, asked(-1), no(1), yes(2)"),
      c("bincon4", "Incontinence: treatment doctor", "na, wrong skip(-3), na, see BINCON1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("bincon5", "Incontinence: how often loss of urine", "na, short interview(-4), na, wrong skip(-3), na, see BINCON1(-2), na, asked(-1), 2 times a month or less(1), 3-4 times a month(2), a few times a week(3), daily(4)"),
      c("bincon6", "Incontinence: use special material", "na, short interview(-4), na, wrong skip(-3), na, see BINCON1(-2), na, asked(-1), no(1), only on certain occasion(2), yes, most of the time(3)"),
      c("bincon7", "Incontinence: surgery", "na, short interview(-4), na, wrong skip(-3), na, see BINCON1(-2), na, asked(-1), no(1), yes(2)"),
      c("brheum01", "Osteo/rheum art: osteoarthritis", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("brheum02", "Osteo/rheum art: rheumatoid arthritis In wave 2B:", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2) In wave 3B: na, see BRMCH(-5), no(1), yes(2)"),
      c("brheum03", "Osteo/rheum art: from which age", "na, wrong skip(-3), na, see BRHEUM01&02(-2), na, asked(-1)"),
      c("brheum04", "Osteo/rheum art: taking medication", "na, wrong skip(-3), na, see BRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("brheum05", "Osteo/rheum art: treatment doctor", "na, wrong skip(-3), na, see BRHEUM01&02(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("brheum06", "Osteo/rheum art: pain in joints past 3 months", "na, short interview(-4), na, wrong skip(-3), na, see BRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("brheum07", "Osteo/rheum art: morning stiffness joint", "see brheum06"),
      c("brheum08", "Osteo/rheum art: swelling joints past month", "see brheum06"),
      c("brheum8a", "Osteo/rheum art: complaints fingers", "na, short interview(-4), na, wrong skip(-3), na, see BRHEUM01&02(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("brheum8b", "Osteo/rheum art: complaints hand/wrist", "see brheum8a"),
      c("brheum8c", "Osteo/rheum art: complaints elbows", "see brheum8a"),
      c("brheum8d", "Osteo/rheum art: complaints shoulders", "see brheum8a"),
      c("brheum8e", "Osteo/rheum art: complaints toes", "see brheum8a"),
      c("brheum8f", "Osteo/rheum art: complaints feet/ankles", "see brheum8a"),
      c("brheum8g", "Osteo/rheum art: complaints knees", "see brheum8a"),
      c("brheum8h", "Osteo/rheum art: complaints hip", "see brheum8a"),
      c("brheum8i", "Osteo/rheum art: complaints neck", "see brheum8a Only in 3B: brheum8j Osteo/rheum art: complaints back see brheum8a"),
      c("brheum09", "Osteo/rheum art: surgery", "see brheum8a"),
      c("brheum9a", "Osteo/rheum art: surgery fingers", "na, wrong skip(-3), na, see BRHEUM09(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("brheum9b", "Osteo/rheum art: surgery hand/wrist", "see brheum9a"),
      c("brheum9c", "Osteo/rheum art: surgery elbows", "see brheum9a"),
      c("brheum9d", "Osteo/rheum art: surgery shoulders", "see brheum9a"),
      c("brheum9e", "Osteo/rheum art: surgery toes since", "see brheum9a"),
      c("brheum9f", "Osteo/rheum art: surgery feet/ankles", "see brheum9a"),
      c("brheum9g", "Osteo/rheum art: surgery knees", "see brheum9a"),
      c("brheum9h", "Osteo/rheum art: surgery hip", "see brheum9a"),
      c("brheum9i", "Osteo/rheum art: surgery neck", "see brheum9a Only in 3B: brheum9j Osteo/rheum art: surgery back see brheum9a"),
      c("brheum10", "Osteo/rheum art: joint prostheses", "na, short interview(-4), na, wrong skip(-3), na, see BRHEUM01(-2), na, asked(-1), no(1), yes(2)"),
      c("brheum12", "Osteo/rheum art: observation hands", "na, wrong skip(-3), na, see BRHEUM01&02(-2), na, asked(-1), rheumatic hands(1), no rheumatic hands(2), observation not possible(3)"),
      c("bcancer1", "Cancer", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bcancer2", "Cancer: from which age", "na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1)"),
      c("bcancer3", "Cancer: taking medication", "na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), no(1), yes(2)"),
      c("bcancer4", "Cancer: treatment doctor", "na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3) Only in 2B:"),
      c("bcancer5", "Cancer: tumor", "na, short interview(-4), na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), no(1), yes(2)"),
      c("bcance5a", "Cancer: tumor, lungs In wave 2B:", "na, see BCANCER5(-6), In waves 2B and 3B: na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("bcance5b", "Cancer: tumor, breast", "see bcance5a"),
      c("bcance5c", "Cancer: tumor, uterus", "not asked, male(-7), In wave 2B: na, see BCANCER5(-6), In waves 2B and 3B: na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("bcance5d", "Cancer: tumor, cervix", "not asked, male(-7), In wave 2B: na, see BCANCER5(-6), In waves 2B and 3B: na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("bcance5e", "Cancer: tumor, intestines In wave 2B:", "na, see BCANCER5(-6), In waves 2B and 3B: na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("bcance5f", "Cancer: tumor, prostate", "not asked, female(-7), In wave 2B: na, see BCANCER5(-6), In waves 2B and 3B: na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("bcance5g", "Cancer: tumor, larynx In wave 2B:", "na, see BCANCER5(-6), In waves 2B and 3B: na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("bcance5h", "Cancer: tumor, esophagus", "see bcance5g"),
      c("bcance5i", "Cancer: tumor, stomach", "see bcance5g"),
      c("bcance5j", "Cancer: tumor, blood", "see bcance5g"),
      c("bcance5k", "Cancer: tumor, skin", "see bcance5g"),
      c("bcance5l", "Cancer: tumor, other", "see bcance5g"),
      c("bcance5m", "Cancer: tumor, which other In 2B:", "na, wrong skip(-3), na, see BCANCE5L(-2), na, asked(-1), to be coded(0) In 3B (string): none"),
      c("bcancer6", "Cancer: metastases", "na, short interview(-4), na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), no(1), yes(2)"),
      c("bcance6a", "Cancer: metastases, bone/skeleton", "na, wrong skip(-3), na, see BCANCER6(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("bcance6b", "Cancer: metastases, liver", "see bcance6a"),
      c("bcance6c", "Cancer: metastases, brain", "see bcance6a"),
      c("bcance6d", "Cancer: metastases, lungs", "see bcance6a"),
      c("bcance6e", "Cancer: metastases, lymph nodes", "see bcance6a"),
      c("bcance6f", "Cancer: metastases, other", "see bcance6a"),
      c("bcance6g", "Cancer: metastases, which other In 2B:", "na, wrong skip(-3), na, see BCANCE6F(-2), na, asked(-1), to be coded(0) In 3B: (string) none"),
      c("bcance7a", "Cancer: surgery", "na, short interview(-4), na, wrong skip(-3), na, see BCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("bcance7b", "Cancer: chemotherapy surgery", "see bcance7a"),
      c("bcance7c", "Cancer: radiotherapy surgery", "see bcance7a"),
      c("bcance7d", "Cancer: alternative treatment", "see bcance7a"),
      c("bothsi01", "Other1: other chronic diseases", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bothsi02", "Other1: disease", "na, wrong skip(-3), na, see BOTHSI01(-2), na, asked(-1), In wave 2B: see Table Other diseases*, In wave 3B: see Table Other diseases***"),
      c("bothsi04", "Other1: from which age", "na, wrong skip(-3), na, see BOTHSI01(-2), na, asked(-1)"),
      c("bothsi05", "Other1: taking medication", "na, wrong skip(-3), na, see BOTHSI01(-2), na, asked(-1), no(1), yes(2)"),
      c("bothsi06", "Other1: treatment doctor", "na, wrong skip(-3), na, see BOTHSI01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("bothsi07", "Other2: other chronic diseases", "na, wrong skip(-3), na, see BOTHSI01(-2), na, asked(-1), no(1), yes(2)"),
      c("bothsi08", "Other2: disease", "na, wrong skip(-3), na, see BOTHSI07(-2), na, asked(-1), In wave 2B: see Table Other diseases*, In wave 3B: see Table Other diseases***"),
      c("bothsi10", "Other2: from which age", "na, wrong skip(-3), na, see BOTHSI07(-2), na, asked(-1)"),
      c("bothsi12", "Other2: treatment doctor", "na, wrong skip(-3), na, see BOTHSI07(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("bhbd1", "Hypertension", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bhbd2", "Hypertension: from which age", "na, wrong skip(-3), na, see BHBD1 (-2), na, asked(-1)"),
      c("bhbd2a", "Hypertension: taking medication", "na, wrong skip(-3), na, see BHBD1(-2), na, asked(-1), no(1), yes(2)"),
      c("bhbd3", "Hypertension: treatment doctor", "na, wrong skip(-3), na, see BHBD1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3) Only in 3B:"),
      c("brchmodus", "Long or short interview", "na, see BRMCH(-2), long interview(1), short interview(2)"),
      c("brmch", "Reason missing: chronical diseases", "valid data(-2), interview terminated(2), refused test(4)")
    ),
    DEFGH = list(
      c("d/e/f/g/hcara01", "CNSLD: asthma, chr bronch, emphysema", "na, see D/E/F/G/HRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("d/e/f/g/hcara02", "CNSLD: from which age", "na, wrong skip(-3), na, see D/E/F/G/HCARA01(-2), na, asked(-1)"),
      c("d/e/f/g/hcara03", "CNSLD: taking medication", "na, wrong skip(-3), na, see D/E/F/G/HCARA01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hcara04", "CNSLD: treatment doctor", "na, wrong skip(-3), na, see D/E/F/G/HCARA01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("d/e/f/g/hcara05", "CNSLD: cough almost daily", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HCARA01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hcara06", "CNSLD: phlegm almost daily", "see d/e/f/g/hcara05"),
      c("d/e/f/g/hcara07", "CNSLD: period increased phlegm past year", "see d/e/f/g/hcara05"),
      c("d/e/f/g/hcara08", "CNSLD: shortness of breath sometimes", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HCARA01(-2), na, asked(-1), no(1), yes, with heavy exertion(2), yes, with light exertion(3), yes, at rest(4)"),
      c("d/e/f/g/hcara09", "CNSLD: wheezing breath ever", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HCARA01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hcara10", "CNSLD: wheezing breath during rest", "see d/e/f/g/hcara09"),
      c("d/e/f/g/hcara11", "CNSLD: disturbed night-rest or sleep", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HCARA01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("d/e/f/g/hcara12", "CNSLD: outdoors less often", "na, wrong skip(-3), na, see D/E/F/G/HCARA01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("d/e/f/g/hhart01", "Heart: heart disease", "na, see D/E/F/G/HRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("d/e/f/g/hhart02", "Heart: from which age", "na, wrong skip(-3), na, see D/E/F/G/HHART01(-2), na, asked(-1)"),
      c("d/e/f/g/hhart03", "Heart: taking medication", "na, wrong skip(-3), na, see D/E/F/G/HHART01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hhart04", "Heart: treatment doctor", "na, wrong skip(-3), na, see D/E/F/G/HHART01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("d/e/f/g/hhart05", "Heart: myocardial infarction since last interview", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HHART01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hhart06", "Heart: no of myocardial inf since last interview", "na, wrong skip(-3), na, see D/E/F/G/HHART05(-2), na, asked(-1), once(1), two times or more(2)"),
      c("d/e/f/g/hhart07m", "Heart: one infarction month", "na, wrong skip(-3), na, see D/E/F/G/HHART06(-2), na, asked(-1), see Table Month****"),
      c("d/e/f/g/hhart07j", "Heart: one infarction year", "na, wrong skip(-3), na, see D/E/F/G/HHART06(-2), na, asked(-1)"),
      c("d/e/f/g/hhart08m", "Heart: >1; first infarction month", "see d/e/f/g/hhart07m"),
      c("d/e/f/g/hhart08j", "Heart: >1; first infarction year", "see d/e/f/g/hhart07j"),
      c("d/e/f/g/hhart09m", "Heart: >1; last infarction month", "see d/e/f/g/hhart07m"),
      c("d/e/f/g/hhart09j", "Heart: >1; last infarction year", "see d/e/f/g/hhart07j"),
      c("d/e/f/g/hhart10", "Heart: chest pain during exertion", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HHART01(-2), na, asked(-1), no(1), yes(2), no exertion: chest pain(3), no exertion: pain legs(4), no exertion: shortness of breath(5), no exertion: joint complaints(6), no exertion: other reason(7)"),
      c("d/e/f/g/hhart11", "Heart: exertion pain disappears in 10 minutes", "na, wrong skip(-3), na, see D/E/F/G/HHART10(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hhart12", "Heart: >1 pillow for shortness of breath", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HHART01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hhart13", "Heart: edema morning; legs, feet, ankles", "see d/e/f/g/hhart12"),
      c("d/e/f/g/hhart14", "Heart: edema evening; legs, feet, ankles", "see d/e/f/g/hhart12"),
      c("d/e/f/g/hhart15", "Heart: cardiac surgery since last int.", "see d/e/f/g/hhart12"),
      c("d/e/f/g/hhart15a", "Heart: valves/cardiac surgery since last interview", "na, wrong skip(-3), na, see D/E/F/G/HHART15(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("d/e/f/g/hhart15b", "Heart: bypass/cardiac surgery since last interview", "see d/e/f/g/hhart12"),
      c("d/e/f/g/hhart15c", "Heart: dotter/cardiac surgery since last interview", "see d/e/f/g/hhart12"),
      c("d/e/f/g/hhart15d", "Heart: pacemaker/cardiac surgery since last interview", "see d/e/f/g/hhart12"),
      c("d/e/f/g/hhart15e", "Heart: other/cardiac surgery since l. int.", "see d/e/f/g/hhart12"),
      c("d/e/f/g/hhart16", "Heart: outdoors less often", "na, wrong skip(-3), na, see D/E/F/G/HHART01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("d/e/f/g/hartvei1", "Arteries: disease or abnormalities", "na, see D/E/F/G/HRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("d/e/f/g/hartvei2", "Arteries: from which age", "na, wrong skip(-3), na, see D/E/F/G/HARTVEI1(-2), na, asked(-1)"),
      c("d/e/f/g/hartvei3", "Arteries: taking medication", "na, wrong skip(-3), na, see D/E/F/G/HARTVE1(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hartvei4", "Arteries: treatment doctor", "na, wrong skip(-3), na, see D/E/F/G/HARTVEI1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("d/e/f/g/hartvei5", "Arteries: pain when walking", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HARTVEI1(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hartvei6", "Arteries: pain when walking: meters", "na, wrong skip(-3), na, see D/E/F/G/HARTVEI5(-2), na, asked(-1)"),
      c("d/e/f/g/hartvei7", "Arteries: pain disappears standing still", "na, wrong skip(-3), na, see D/E/F/G/HARTVEI5(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hartvei8", "Arteries: surgery since last interview", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HARTVEI1(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hartve8a", "Arteries: surgery, bifurcation", "na, wrong skip(-3), na, see D/E/F/G/HARTVEI8(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("d/e/f/g/hartve8b", "Arteries: surgery, femoral", "see d/e/f/g/hartve8a"),
      c("d/e/f/g/hartve8c", "Arteries: surgery, groins", "see d/e/f/g/hartve8a"),
      c("d/e/f/g/hartve8d", "Arteries: surgery, dotter", "see d/e/f/g/hartve8a"),
      c("d/e/f/g/hartve8e", "Arteries: surgery, other", "see d/e/f/g/hartve8a"),
      c("d/e/f/g/hartvei9", "Arteries: outdoors less often", "na, wrong skip(-3), na, see D/E/F/G/HARTVEI1(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("d/e/f/g/hdiabe01", "Diabetes", "na, see D/E/F/G/HRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("d/e/f/g/hdiabe02", "Diabetes: from which age", "na, wrong skip(-3), na, see D/E/F/G/HDIABE01(-2), na, asked(-1)"),
      c("d/e/f/g/hdiabe03", "Diabetes: taking medication", "na, wrong skip(-3), na, see D/E/F/G/HDIABE01(-2), na, asked(-1), no(1), yes, insulin injections(2), yes, tablets only(3)"),
      c("d/e/f/g/hdiabe04", "Diabetes: treatment doctor", "na, wrong skip(-3), na, see D/E/F/G/HDIABE01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("d/e/f/g/hdiabe05", "Diabetes: treatment related eye problems", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HDIABE01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hdiabe6a", "Diabetes: eye probl, laser", "na, wrong skip(-3), na, see D/E/F/G/HDIABE05(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("d/e/f/g/hdiabe6b", "Diabetes: eye probl, cataract", "see d/e/f/g/hdiabe6a"),
      c("d/e/f/g/hdiabe6c", "Diabetes: eye probl, other treatment", "see d/e/f/g/hdiabe6a"),
      c("d/e/f/g/hdiabe07", "Diabetes: pain when walking", "na, see DARTVEI1(-6), na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HDIABE01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hdiabe08", "Diabetes: pain when walking: no of meter", "na, wrong skip(-3), na, see D/E/F/G/HDIABE07(-2), na, asked(-1)"),
      c("d/e/f/g/hdiabe09", "Diabetes: pain disappears standing still", "na, wrong skip(-3), na, see D/E/F/G/HDIABE07(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hdiabe10", "Diabetes: pain in legs during rest", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HDIABE01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hdiabe11", "Diabetes: chest pain during exertion", "na, see D/E/F/G/HHART01(-6), na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HDIABE01(-2), na, asked(-1), no(1), yes(2), no exertion: chest pain(3), no exertion: pain legs(4), no exertion: shortness of breath(5), no exertion: joint complaints(6), no exertion: other reason(7)"),
      c("d/e/f/g/hdiabe12", "Diabetes: exertion pain disappears in 10 minutes", "na, wrong skip(-3), na, see D/E/F/G/HDIABE11(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hdiabe13", "Diabetes: outdoors less often", "na, wrong skip(-3), na, see D/E/F/G/HDIABE01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("d/e/f/g/hcva01", "CVA", "na, see D/E/F/G/HRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("d/e/f/g/hcva02a", "CVA: stroke since last interview", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HCVA01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hcva02b", "CVA: no of strokes", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HCVA02A(-2), na, asked(-1), once(1), two times or more(2)"),
      c("d/e/f/gcva02c", "CVA: (short) no of strokes", "na, no short version(-4), na, wrong skip(-3), na, see D/E/F/GCVA01(-2), na, asked(-1), once(1), two times or more(2)"),
      c("d/e/f/g/hcva03m", "CVA: 1, stroke month", "na, wrong skip(-3), na, see D/E/F/G/HCVA02B(-2), na, asked(-1), see Table Month****"),
      c("d/e/f/g/hcva03j", "CVA: 1, stroke year", "na, wrong skip(-3), na, see D/E/F/G/HCVA02B(-2), na, asked(-1) Not in H :"),
      c("d/e/f/gcva03a", "CVA: (short) 1 stroke age", "na, wrong skip(-3), na, see D/E/F/GCVA02C(-2), na, asked(-1)"),
      c("d/e/f/g/hcva04m", "CVA: > 1, first stroke month", "na, wrong skip(-3), na, see D/E/F/G/HCVA02B(-2), na, asked(-1), see Table Month****"),
      c("d/e/f/g/hcva04j", "CVA: > 1, first stroke year", "na, wrong skip(-3), na, see D/E/F/G/HCVA02B(-2), na, asked(-1) Not in H :"),
      c("d/e/f/gcva04a", "CVA: (short) > 1, first stroke age", "na, wrong skip(-3), na, see D/E/F/GCVA02C(-2), na, asked(-1)"),
      c("d/e/f/g/hcva05m", "CVA: > 1, last stroke month", "na, wrong skip(-3), na, see D/E/F/G/HCVA02B(-2), na, asked(-1), see Table Month****"),
      c("d/e/f/g/hcva05j", "CVA: > 1, last stroke year", "na, wrong skip(-3), na, see D/E/F/G/HCVA02B(-2), na, asked(-1) Not in H :"),
      c("d/e/f/gcva05a", "CVA: (short) > 1, last stroke age", "na, wrong skip(-3), na, see D/E/F/GCVA02C(-2), na, asked(-1)"),
      c("d/e/f/g/hcva06", "CVA: taking medication", "na, wrong skip(-3), na, see D/E/F/G/HCVA01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hcva07", "CVA: treatment doctor", "na, wrong skip(-3), na, see D/E/F/G/HCVA01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("d/e/f/g/hcva08", "CVA: still problems with arms and legs", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HCVA01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hcva09", "CVA: still problems with vision", "see d/e/f/g/hcva08"),
      c("d/e/f/g/hcva10", "CVA: still problems speech", "see d/e/f/g/hcva08"),
      c("d/e/f/g/hcva11", "CVA: still problems understanding written text", "see d/e/f/g/hcva08"),
      c("d/e/f/g/hcva12", "CVA: outdoors less often", "na, wrong skip(-3), na, see D/E/F/G/HCVA01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("d/e/f/g/hincon1", "Incontinence", "na, see D/E/F/G/HRMCH(-5), na, asked(-1), no (0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("d/e/f/g/hincon2", "Incontinence: from which age", "na, wrong skip(-3), na, see D/E/F/G/HINCON1(-2), na, asked(-1)"),
      c("d/e/f/g/hincon3", "Incontinence: taking medication", "na, wrong skip(-3), na, see D/E/F/G/HINCON1(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hincon4", "Incontinence: treatment doctor", "na, wrong skip(-3), na, see D/E/F/G/HINCON1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("d/e/f/g/hincon5", "Incontinence: how often loss of urine", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HINCON1(-2), na, asked(-1), 2 times a month or less(1), 3-4 times a month(2), a few times a week(3), daily(4)"),
      c("d/e/f/g/hincon6", "Incontinence: use special material", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HINCON1(-2), na, asked(-1), no(1), only on certain occasion(2), yes, most of the time(3)"),
      c("d/e/f/g/hincon7", "Incontinence: surgery since last interview", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HINCON1(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hincon8", "Incontinence: outdoors less often", "na, wrong skip(-3), na, see D/E/F/G/HINCON1 (-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("d/e/f/g/hrheum01", "Osteo/rheum art: osteoarthritis", "na, see D/E/F/G/HRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("d/e/f/g/hrheum02", "Osteo/rheum art: rheumatoid arthritis", "na, see D/E/F/G/HRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("d/e/f/g/hrheum03", "Osteo/rheum art: from which age", "na, wrong skip(-3), na, see D/E/F/G/HRHEUM01&02(-2), na, asked(-1)"),
      c("d/e/f/g/hrheum04", "Osteo/rheum art: taking medication", "na, wrong skip(-3), na, see D/E/F/G/HRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hrheum05", "Osteo/rheum art: treatment doctor", "na, wrong skip(-3), na, see D/E/F/G/HRHEUM01&02(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("d/e/f/g/hrheum06", "Osteo/rheum art: pain in joints past 3 months", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hrheum07", "Osteo/rheum art: morning stiffness joint", "see d/e/f/g/hrheum06"),
      c("d/e/f/g/hrheum08", "Osteo/rheum art: swelling joints past month", "see d/e/f/g/hrheum06"),
      c("d/e/f/g/hrheum8a", "Osteo/rheum art: complaints fingers", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HRHEUM01&02(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("d/e/f/g/hrheum8b", "Osteo/rheum art: complaints hand/wrist", "see d/e/f/g/hrheum8a"),
      c("d/e/f/g/hrheum8c", "Osteo/rheum art: complaints elbows", "see d/e/f/g/hrheum8a"),
      c("d/e/f/g/hrheum8d", "Osteo/rheum art: complaints shoulders", "see d/e/f/g/hrheum8a"),
      c("d/e/f/g/hrheum8e", "Osteo/rheum art: complaints toes", "see d/e/f/g/hrheum8a"),
      c("d/e/f/g/hrheum8f", "Osteo/rheum art: complaints feet/ankles", "see d/e/f/g/hrheum8a"),
      c("d/e/f/g/hrheum8g", "Osteo/rheum art: complaints knees", "see d/e/f/g/hrheum8a"),
      c("d/e/f/g/hrheum8h", "Osteo/rheum art: complaints hip", "see d/e/f/g/hrheum8a"),
      c("d/e/f/g/hrheum8i", "Osteo/rheum art: complaints neck", "see d/e/f/g/hrheum8a Not in D, E:"),
      c("f/g/hrheum8j", "Osteo/rheum art: complaints back", "na, short interview(-4), na, wrong skip(-3), na, see F/G/HRHEUM01&02(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("d/e/f/g/hrheum09", "Osteo/rheum art: surgery since last int.", "see d/e/f/g/hrheum8a"),
      c("d/e/f/g/hrheum9a", "Osteo/rheum art: surgery fingers", "na, wrong skip(-3), na, see D/E/F/G/HRHEUM09(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("d/e/f/g/hrheum9b", "Osteo/rheum art: surgery hand/wrist", "see d/e/f/g/hrheum9a"),
      c("d/e/f/g/hrheum9c", "Osteo/rheum art: surgery elbows", "see d/e/f/g/hrheum9a"),
      c("d/e/f/g/hrheum9d", "Osteo/rheum art: surgery shoulders", "see d/e/f/g/hrheum9a"),
      c("d/e/f/g/hrheum9e", "Osteo/rheum art: surgery toes since", "see d/e/f/g/hrheum9a"),
      c("d/e/f/g/hrheum9f", "Osteo/rheum art: surgery feet/ankles", "see d/e/f/g/hrheum9a"),
      c("d/e/f/g/hrheum9g", "Osteo/rheum art: surgery knees", "see d/e/f/g/hrheum9a"),
      c("d/e/f/g/hrheum9h", "Osteo/rheum art: surgery hip", "see d/e/f/g/hrheum9a"),
      c("d/e/f/g/hrheum9i", "Osteo/rheum art: surgery neck", "see d/e/f/g/hrheum9a Not in D, E:"),
      c("f/g/hrheum9j", "Osteo/rheum art: surgery back", "na, wrong skip(-3), na, see F/G/HRHEUM09(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("d/e/f/g/hrheum10", "Osteo/rheum art: joint prostheses", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HRHEUM01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hrheum11", "Osteo/rheum art: outdoors less often", "na, wrong skip(-3), na, see D/E/F/G/HRHEUM01&02(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("d/e/f/g/hrheum12", "Osteo/rheum art: observation hands", "na, wrong skip(-3), na, see D/E/F/G/HRHEUM01&02(-2), na, asked(-1), rheumatic hands(1), no rheumatic hands(2), observation not possible(3)"),
      c("d/e/f/g/hcancer1", "Cancer", "na, see D/E/F/G/HRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("d/e/f/g/hcancer2", "Cancer: from which age", "na, wrong skip(-3), na, see D/E/F/G/HCANCER1(-2), na, asked(-1)"),
      c("d/e/f/g/hcancer3", "Cancer: taking medication", "na, wrong skip(-3), na, see D/E/F/G/HCANCER1(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hcancer4", "Cancer: treatment doctor", "na, wrong skip(-3), na, see D/E/F/G/HCANCER1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("d/e/f/g/hcancer5", "Cancer: tumor since last interview", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HCANCER1(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hcance5a", "Cancer: tumor, lungs", "na, see D/E/F/G/HCANCER5(-6), na, wrong skip(-3), na, see D/E/F/G/HCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("d/e/f/g/hcance5b", "Cancer: tumor, breast", "see d/e/f/g/hcance5a"),
      c("d/e/f/g/hcance5c", "Cancer: tumor, uterus", "not asked, male(-7), na, see D/E/F/G/HCANCER5(-6), na, wrong skip(-3), na, see D/E/F/G/HCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("d/e/f/g/hcance5d", "Cancer: tumor, cervix", "see d/e/f/g/hcance5c"),
      c("d/e/f/g/hcance5e", "Cancer: tumor, intestines", "see d/e/f/g/hcance5a"),
      c("d/e/f/g/hcance5f", "Cancer: tumor, prostate", "not asked, female(-7), na, see D/E/F/G/HCANCER5(-6), na, wrong skip(-3), na, see D/E/F/G/HCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("d/e/f/g/hcance5g", "Cancer: tumor, larynx", "see d/e/f/g/hcance5a"),
      c("d/e/f/g/hcance5h", "Cancer: tumor, esophagus", "see d/e/f/g/hcance5a"),
      c("d/e/f/g/hcance5i", "Cancer: tumor, stomach", "see d/e/f/g/hcance5a"),
      c("d/e/f/g/hcance5j", "Cancer: tumor, blood", "see d/e/f/g/hcance5a"),
      c("d/e/f/g/hcance5k", "Cancer: tumor, skin", "see d/e/f/g/hcance5a"),
      c("d/e/f/g/hcance5l", "Cancer: tumor, other", "see d/e/f/g/hcance5a"),
      c("d/e/f/g/hcance5m", "Cancer: tumor, which other", "na, wrong skip(-3), na, see D/E/F/G/HCANCE5L(-2), na, asked(-1), to be coded(0)"),
      c("d/e/f/g/hcancer6", "Cancer: metastases since last interview", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HCANCER1(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hcance6a", "Cancer: metastases, bone/skeleton", "na, wrong skip(-3), na, see D/E/F/G/HCANCER6(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("d/e/f/g/hcance6b", "Cancer: metastases, liver", "see d/e/f/g/hcance6a"),
      c("d/e/f/g/hcance6c", "Cancer: metastases, brain", "see d/e/f/g/hcance6a"),
      c("d/e/f/g/hcance6d", "Cancer: metastases, lungs", "see d/e/f/g/hcance6a"),
      c("d/e/f/g/hcance6e", "Cancer: metastases, lymph nodes", "see d/e/f/g/hcance6a"),
      c("d/e/f/g/hcance6f", "Cancer: metastases, other", "see d/e/f/g/hcance6a"),
      c("d/e/f/g/hcance6g", "Cancer: metastases, which other", "na, wrong skip(-3), na, see D/E/F/G/HCANCE6F(-2), na, asked(-1), to be coded(0)"),
      c("d/e/f/g/hcance7a", "Cancer: surgery, since last interview", "na, short interview(-4), na, wrong skip(-3), na, see D/E/F/G/HCANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("d/e/f/g/hcance7b", "Cancer: chemotherapy, since last int.", "see d/e/f/g/hcance7a"),
      c("d/e/f/g/hcance7c", "Cancer: radiotherapy, since last int.", "see d/e/f/g/hcance7a"),
      c("d/e/f/g/hcance7d", "Cancer: altern. treatment, since l. int.", "see d/e/f/g/hcance7a"),
      c("d/e/f/g/hcancer8", "Cancer: outdoors less often", "na, wrong skip(-3), na, see D/E/F/G/HCANCER1(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("d/e/f/g/hothsi01", "Other1: other chronic diseases", "na, see DRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hothsi02", "Other1: disease", "na, wrong skip(-3), na, see D/E/F/G/HOTHSI01(-2), na, asked(-1), In waves D/E/F: see Table Other diseases*, In wave G: see Table Other diseases**, In wave H: see Table Other diseases***"),
      c("d/e/f/g/hothsi04", "Other1: from which age", "na, wrong skip(-3), na, see D/E/F/G/HOTHSI01(-2), na, asked(-1)"),
      c("d/e/f/g/hothsi05", "Other1: taking medication", "na, wrong skip(-3), na, see D/E/F/G/HOTHSI01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hothsi06", "Other1: treatment doctor", "na, wrong skip(-3), na, see D/E/F/G/HOTHSI01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("d/e/f/g/hothsi07", "Other2: other chronic diseases", "na, wrong skip(-3), na, see D/E/F/G/HOTHSI01(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hothsi08", "Other2: disease", "na, wrong skip(-3), na, see D/E/F/G/HOTHSI07(-2), na, asked(-1), In waves D/E/F: see Table Other diseases*, In wave G: see Table Other diseases**, In wave H: see Table Other diseases***"),
      c("d/e/f/g/hothsi10", "Other2: from which age", "na, wrong skip(-3), na, see D/E/F/G/HOTHSI07(-2), na, asked(-1)"),
      c("d/e/f/g/hothsi11", "Other2: taking medication", "na, wrong skip(-3), na, see D/E/F/G/HOTHSI07 (-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hothsi12", "Other2: treatment doctor", "na, wrong skip(-3), na, see D/E/F/G/HOTHSI07(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("d/e/f/g/hhbd1", "Hypertension", "na, see D/E/F/G/HRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hhbd2", "Hypertension: from which age", "na, wrong skip(-3), na, see D/E/F/G/HHBD1(-2), na, asked(-1)"),
      c("d/e/f/g/hhbd2a", "Hypertension: taking medication", "na, wrong skip(-3), na, see D/E/F/G/HHBD1(-2), na, asked(-1), no(1), yes(2)"),
      c("d/e/f/g/hhbd3", "Hypertension: treatment doctor", "na, wrong skip(-3), na, see D/E/F/G/HHBD1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("d/e/f/g/hchmodus", "Long or short interview In waves D, E, and F:", "valid data(-2), long interview(1), short interview(2) In wave G and H: na, see G/HRMCH(-5), long interview(1), short interview(2)"),
      c("d/e/f/g/hrmch", "Reason missing: chronical diseases", "valid data(-2), interview terminated(2), refused test(4)")
    ),
    MB = list(
      c("bcara01", "CNSLD: asthma, chr bronch, emphysema", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bhart01", "Heart: heart disease", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bartvei1", "Arteries: disease or abnormalities", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bdaiabe01", "Diabetes", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bcva01", "CVA", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("brheum01", "Osteo/rheum art: osteoarthritis", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("brheum02", "Osteo/rheum art: rheumatoid arthritis", "na, see BRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("bcancer1", "Reason missing: chronical diseases", "valid data(-2), interview terminated(2), refused test(4)")
    ),
    IJ = list(
      c("i/jcara01", "CNSLD: asthma, chr bronch, emphysema", "na, see I/JRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("i/jcara02", "CNSLD: from which age", "na, wrong skip(-3), na, see I/JCARA01(-2), In I: na, asked(-1) In J: na, asked / R does not know(-1)"),
      c("i/jcara04", "CNSLD: treatment doctor", "na, wrong skip(-3), na, see I/JCARA01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("i/jcara08", "CNSLD: shortness of breath sometimes", "na, short interview(-4), na, wrong skip(-3), na, see I/JCARA01(-2), na, asked(-1), no(1), yes, with heavy exertion(2), yes, with light exertion(3), yes, at rest(4)"),
      c("i/jcara11", "CNSLD: disturbed night-rest or sleep", "na, short interview(-4), na, wrong skip(-3), na, see I/JCARA01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("i/jhart01", "Heart: heart disease", "na, see I/JRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("i/jhart04", "Heart: treatment doctor", "na, wrong skip(-3), na, see I/JHART01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("i/jhart05", "Heart: myocardial infarction since last interview", "na, short interview(-4), na, wrong skip(-3), na, see I/JHART01(-2), na, asked(-1), no(1), yes(2) Only in I:"),
      c("ihart06", "Heart: no of myocardial inf since last interview", "na, wrong skip(-3), na, see IHART05(-2), na, asked(-1), once(1), two times or more(2)"),
      c("i/jhart07m", "In I: Heart: one infarction month In J: Heart: (first) infarction month", "na, wrong skip(-3), In I: na, see IHART06(-2) In J: na, see JHART05(-2) na, asked(-1), see Table Month****"),
      c("i/jhart07j", "In I: Heart: one infarction year In J: Heart: (first) infarction year", "na, wrong skip(-3), In I: na, see IHART06(-2) In J: na, see JHART05(-2) na, asked(-1) Only in I:"),
      c("ihart08m", "Heart: >1; first infarction month", "na, wrong skip(-3), na, see IHART06(-2), na, asked(-1), see Table Month**** Only in I:"),
      c("ihart08j", "Heart: >1; first infarction year", "na, wrong skip(-3), na, see IHART06(-2), na, asked(-1) Only in I:"),
      c("ihart09m", "Heart: >1; last infarction month", "na, wrong skip(-3), na, see IHART06(-2), na, asked(-1), see Table Month**** Only in I:"),
      c("ihart09j", "Heart: >1; last infarction year", "na, wrong skip(-3), na, see IHART06(-2), na, asked(-1)"),
      c("i/jhart10", "Heart: chest pain during exertion", "na, short interview(-4), na, wrong skip(-3), na, see I/JHART01(-2), na, asked(-1), no(1), yes(2), no exertion: chest pain(3), no exertion: pain legs(4), no exertion: shortness of breath(5), no exertion: joint complaints(6), no exertion: other reason(7)"),
      c("i/jhart11", "Heart: exertion pain disappears in 10 min", "na, wrong skip(-3), na, see I/JHART10(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jhart12", "Heart: >1 pillow for shortness of breath", "na, short interview(-4), na, wrong skip(-3), na, see I/JHART01(-2), na, asked(-1), no(1), yes(2) Not in J:"),
      c("ihart13", "Heart: edema morning; legs, feet, ankles", "na, short interview(-4), na, wrong skip(-3), na, see IHART01(-2), na, asked(-1), no(1), yes(2) Not in I:"),
      c("jhart14", "Heart: edema evening; legs, feet, ankles", "na, short interview(-4), na, wrong skip(-3), na, see JHART01(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jhart15", "Heart: cardiac surgery since last interview", "na, short interview(-4), na, wrong skip(-3), na, see I/JHART01(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jhart15a", "Heart: valves/cardiac surgery since last interview", "na, wrong skip(-3), na, see I/JHART15(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("i/jhart15b", "Heart: bypass/cardiac surgery since last interview", "see i/jhart15a"),
      c("i/jhart15c", "Heart: dotter/cardiac surgery since last interview", "see i/jhart15a"),
      c("i/jhart15d", "Heart: pacemaker/cardiac surgery since interview", "see i/jhart15a"),
      c("i/jhart15e", "Heart: other/cardiac surgery since last interview", "see i/jhart15a"),
      c("i/jartvei1", "Arteries: disease or abnormalities", "na, see I/JRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("i/jartvei4", "Arteries: treatment doctor", "na, wrong skip(-3), na, see I/JARTVEI1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("i/jartvei5", "Arteries: pain when walking", "na, short interview(-4), na, wrong skip(-3), na, see I/JARTVEI1(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jartvei7", "Arteries: pain disappears standing still", "na, wrong skip(-3), na, see I/JARTVEI5(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jartvei8", "Arteries: surgery since last interview", "na, short interview(-4), na, wrong skip(-3), na, see I/JARTVEI1(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jartve8a", "Arteries: surgery, bifurcation", "na, wrong skip(-3), na, see I/JARTVEI8(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("i/jartve8b", "Arteries: surgery, femoral", "see i/jartve8a"),
      c("i/jartve8c", "Arteries: surgery, groins", "see i/jartve8a"),
      c("i/jartve8d", "Arteries: surgery, dotter", "see i/jartve8a"),
      c("i/jartve8e", "Arteries: surgery, other", "see i/jartve8a Only in I:"),
      c("iartvei9", "Arteries: outdoors less often", "na, wrong skip(-3), na, see IARTVEI1(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("i/jdiabe01", "Diabetes", "na, see I/JRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("i/jdiabe02", "Diabetes: from which age", "na, wrong skip(-3), na, see I/JDIABE01(-2), na, asked(-1)"),
      c("i/jdiabe03a", "Diabetes: which medication from onset", "na, wrong skip(-3), na, see I/JDIABE01(-2), na, asked(-1), none(1), insulin injections(2), tablets(3), Not in I: insulin pump"),
      c("i/jdiabe04", "Diabetes: treatment doctor", "na, wrong skip(-3), na, see I/JDIABE01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3) Only in I :"),
      c("idiabe05", "Diabetes: treatment related eye problems", "na, short interview(-4), na, wrong skip(-3), na, see IDIABE01(-2), na, asked(-1), no(1), yes(2)"),
      c("idiabe6a", "Diabetes eye problems: laser treatment", "na, wrong skip(-3), na, see IDIABE05(-2), na, asked(-1), not mentioned(0), mentioned(1) Only in I :"),
      c("idiabe6b", "Diabetes eye problems: cataract operation", "see idiabe6a Only in I :"),
      c("idiabe6c", "Diabetes eye problems: other treatment", "see idiabe6a"),
      c("i/jdiabe07", "Diabetes: pain when walking", "na, see I/JARTVEI1(-6), na, short interview(-4), na, wrong skip(-3), na, see I/JDIABE01(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jdiabe09", "Diabetes: pain disappears standing still", "na, wrong skip(-3), na, see I/JDIABE07(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jdiabe11", "Diabetes: chest pain during exertion In I:", "na, see IHART01(-6) In J: na, see IHART10(-6), na, short interview(-4), na, wrong skip(-3), na, see I/JDIABE01(-2), na, asked(-1), no(1), yes(2), no exertion: chest pain(3), no exertion: pain legs(4), no exertion: shortness of breath(5), no exertion: joint complaints(6), no exertion: other reason(7)"),
      c("i/jdiabe12", "Diabetes: exertion pain disappears in 10 minutes", "na, wrong skip(-3), na, see I/JDIABE11(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jcva01", "CVA", "na, see I/JRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("i/jcva02a", "CVA: stroke since last interview", "na, short interview(-4), na, wrong skip(-3), na, see I/JCVA01(-2), na, asked(-1), no(1), yes(2) Only in I :"),
      c("icva02b", "CVA: no of strokes", "na, short interview(-4), na, wrong skip(-3), na, see ICVA02A(-2), na, asked(-1), once(1), two times or more(2)"),
      c("i/jcva03m", "In I: CVA: 1, stroke month In J: CVA: (first) stroke month", "na, wrong skip(-3), In I: na, see ICVA02B(-2) In J: na, see JCVA02A(-2), na, asked(-1), see Table Month****"),
      c("i/jcva03j", "In I: CVA: 1, stroke year In J: CVA: (first) stroke year", "na, wrong skip(-3), In I: na, see ICVA02B(-2) In J: na, see JCVA02A(-2), na, asked(-1) Only in I :"),
      c("icva04m", "CVA: > 1, first stroke month", "na, wrong skip(-3), na, see ICVA02B(-2), na, asked(-1), see Table Month**** Only in I :"),
      c("icva04j", "CVA: > 1, first stroke year", "na, wrong skip(-3), na, see ICVA02B(-2), na, asked(-1) Only in I :"),
      c("icva05m", "CVA: > 1, last stroke month", "na, wrong skip(-3), na, see ICVA02B(-2), na, asked(-1), see Table Month**** Only in I :"),
      c("icva05j", "CVA: > 1, last stroke year", "na, wrong skip(-3), na, see ICVA02B(-2), na, asked(-1)"),
      c("i/jcva07", "CVA: treatment doctor", "na, wrong skip(-3), na, see I/JCVA01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("icva09", "CVA: still problems with vision", "na, short interview(-4), na, wrong skip(-3), na, see ICVA01(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jincon9", "Past month: unintentional urine loss with physical exertion", "na, see I/JRMCH(-5), Not in I: not applicable: stoma, catheter or something else(-2), In I, J: na, asked(-1), 2 times a month or less(1), 3-4 times a month(2), a few times a week (3), daily(4)"),
      c("i/jincon10", "Past month: strong urge to urinate and unable to make it to the toilet on time", "see i/jincon9"),
      c("i/jrheum01", "Osteo/rheum art: osteoarthritis", "na, see I/JRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("i/jrheum02", "Osteo/rheum art: rheumatoid arthritis", "na, see I/JRMCH(-5), Not in I: na, wrong skip(-3), In I, J: na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("i/jrheum04", "Osteo/rheum art: taking medication", "na, wrong skip(-3), na, see I/JRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jrheum05", "Osteo/rheum art: treatment doctor", "na, wrong skip(-3), na, see I/JRHEUM01&02(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("i/jrheum06", "Osteo/rheum art: pain in joints past 3 months", "na, short interview(-4), na, wrong skip(-3), na, see I/JRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jrheum07", "Osteo/rheum art: morning stiffness joint", "na, short interview(-4), na, wrong skip(-3), na, see I/JRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jrheum08", "Osteo/rheum art: swelling joints past month", "na, short interview(-4), na, wrong skip(-3), na, see I/JRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jrheum8a", "Osteo/rheum art: complaints fingers", "na, short interview(-4), na, wrong skip(-3), na, see I/JRHEUM01&02(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("i/jrheum8b", "Osteo/rheum art: complaints hand/wrist", "see i/jrheum8a"),
      c("i/jrheum8c", "Osteo/rheum art: complaints elbows", "see i/jrheum8a"),
      c("i/jrheum8d", "Osteo/rheum art: complaints shoulders", "see i/jrheum8a"),
      c("i/jrheum8e", "Osteo/rheum art: complaints toes", "see i/jrheum8a"),
      c("i/jrheum8f", "Osteo/rheum art: complaints feet/ankles", "see i/jrheum8a"),
      c("i/jrheum8g", "Osteo/rheum art: complaints knees", "see i/jrheum8a"),
      c("i/jrheum8h", "Osteo/rheum art: complaints hip", "see i/jrheum8a"),
      c("i/jrheum8i", "Osteo/rheum art: complaints neck", "see i/jrheum8a"),
      c("i/jrheum8j", "Osteo/rheum art: complaints back", "see i/jrheum8a"),
      c("i/jrheum09", "Osteo/rheum art: surgery since last interview", "na, short interview(-4), na, wrong skip(-3), na, see I/JRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jrheum9a", "Osteo/rheum art: surgery fingers", "na, wrong skip(-3), na, see I/JRHEUM09(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("i/jrheum9b", "Osteo/rheum art: surgery hand/wrist", "see i/jrheum9a"),
      c("i/jrheum9c", "Osteo/rheum art: surgery elbows", "see i/jrheum9a"),
      c("i/jrheum9d", "Osteo/rheum art: surgery shoulders", "see i/jrheum9a"),
      c("i/jrheum9e", "Osteo/rheum art: surgery toes since", "see i/jrheum9a"),
      c("i/jrheum9f", "Osteo/rheum art: surgery feet/ankles", "see i/jrheum9a"),
      c("i/jrheum9g", "Osteo/rheum art: surgery knees", "see i/jrheum9a"),
      c("i/jrheum9h", "Osteo/rheum art: surgery hip", "see i/jrheum9a"),
      c("i/jrheum9i", "Osteo/rheum art: surgery neck", "see i/jrheum9a"),
      c("i/jrheum9j", "Osteo/rheum art: surgery back", "see i/jrheum9a"),
      c("i/jrheum10a", "Osteo/rheum art: joint replacement surgery", "na, short interview(-4), na, wrong skip(-3), na, see I/JRHEUM01(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jrh10_1j", "Joint replacement surgery (1): joint Not in I:", "na wrong skip(-3), In I, J: na, see I/JRHEUM10A(-2), na, asked(-1), In wave I: see Table Joints(I)***** In wave J: see Table Joints(J)******"),
      c("i/jrh10_1s", "Joint replacement surgery (1): side", "na, wrong skip(-3), na, see I/JRHEUM10A(-2), na, asked(-1), right(1), left(2), right and left(3)"),
      c("i/jrh10_1y1", "Joint replacement surgery (1): year (1)", "na, wrong skip(-3), na, see I/JRHEUM10A(-2), na, asked(-1)"),
      c("i/jrh10_1y2", "Joint replacement surgery (1): year (2)", "na, wrong skip(-3), na, see I/JRH10_1S(-2), na, asked(-1)"),
      c("i/jrh10_1r", "Joint replacement surgery (1): reason Not in I:", "na, wrong skip, In I, J: na, see I/JRHEUM10A(-2), na, asked(-1), osteoarthritis/wear and tear/loss of cartilage(1), rheumatoid arthritis(2), infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)(3), fracture (due to accident)(4), pain(5), other (unable to stand or walk/immobility/etc)(6)"),
      c("i/jrheum10a2", "Osteo/rheum art: joint replacement surgery (2)", "na, short interview(-4), na, wrong skip(-3), na, see I/JRHEUM10A2(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jrh10_2j", "Joint replacement surgery (2): joint In wave I:", "na, see IRHEUM10A2(-2), na, asked(-1), see Table Joints(I)***** In wave J: na wrong skip(-3), na, see JRHEUM10A2(-2), na, asked(-1), see Table Joints(J)******"),
      c("i/jrh10_2s", "Joint replacement surgery (2): side", "na, wrong skip(-3), na, see I/JRHEUM10A2(-2), na, asked(-1), right(1), left(2), right and left(3)"),
      c("i/jrh10_2y1", "Joint replacement surgery (2): year (1)", "na, wrong skip(-3), na, see I/JRHEUM10A2(-2), na, asked(-1)"),
      c("i/jrh10_2y2", "Joint replacement surgery (2): year (2)", "na, wrong skip(-3), na, see I/JRH10_2S(-2), na, asked(-1)"),
      c("i/jrh10_2r", "Joint replacement surgery (2): reason Not in I:", "na, wrong skip, In I, J: na, see I/JRHEUM10A2(-2), na, asked(-1), osteoarthritis/wear and tear/loss of cartilage(1), rheumatoid arthritis(2), infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)(3), fracture (due to accident)(4), pain(5), other (unable to stand or walk/immobility/etc)(6)"),
      c("i/jrheum10a3", "Osteo/rheum art: joint replacement surgery (3)", "na, short interview(-4), na, wrong skip(-3), na, see I/JRHEUM10A2(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jrh10_3j", "Joint replacement surgery (3): joint In wave I:", "na, see IRHEUM10A3(-2), na, asked(-1), see Table Joints(I)***** In wave J: na wrong skip(-3), na, see JRHEUM10A3(-2), na, asked(-1), see Table Joints(J)******"),
      c("i/jrh10_3s", "Joint replacement surgery (3): side", "na, wrong skip(-3), na, see I/JRHEUM10A3(-2), na, asked(-1), right(1), left(2), right and left(3)"),
      c("i/jrh10_3y1", "Joint replacement surgery (3): year (1)", "na, wrong skip(-3), na, see I/JRHEUM10A3(-2), na, asked(-1)"),
      c("i/jrh10_3y2", "Joint replacement surgery (3): year (2)", "na, wrong skip(-3), na, see I/JRH10_3S(-2), na, asked(-1)"),
      c("i/jrh10_3r", "Joint replacement surgery (3): reason Not in I:", "na, wrong skip(-3), In I, J: na, see I/JRHEUM10A3(-2), na, asked(-1), osteoarthritis/wear and tear/loss of cartilage(1), rheumatoid arthritis(2), infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)(3), fracture (due to accident)(4), pain(5), other (unable to stand or walk/immobility/etc)(6)"),
      c("i/jrheum12", "Osteo/rheum art: observation hands", "na, wrong skip(-3), na, see I/JRHEUM01&02(-2), na, asked(-1), rheumatic hands(1), no rheumatic hands(2), observation not possible(3)"),
      c("i/jkneep1", "Knee pain past 6 months", "na, see I/JRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("i/jkneep2", "Knee pain: pain level now", "na, wrong skip(-3), na, see I/JKNEEP1(-2), na, asked(-1), no pain(0), worst conceivable pain(10)"),
      c("i/jkneep3", "Knee pain: worst pain past 6 months", "see i/jkneep2"),
      c("i/jkneep4", "Knee pain: average pain past 6 months", "see i/jkneep2"),
      c("i/jkneep5", "Knee pain: number of days unable to perform normal activities", "na, wrong skip(-3), na, see I/JKNEEP1(-2), na, asked(-1), 0-6 days(1), 7-14 days(2), 15-30 days(3), 31 days or more(4)"),
      c("i/jkneep6", "Knee pain: to which extent impeded daily activities", "na, wrong skip(-3), na, see I/JKNEEP1(-2), na, asked(-1), not impeded(0), unable to continue activities(10)"),
      c("i/jkneep7", "Knee pain: to which extent changed social activities", "na, wrong skip(-3), na, see I/JKNEEP1(-2), na, asked(-1), no change(0), extreme change(10)"),
      c("i/jkneep8", "Knee pain: to which extent changed daily work activities", "na, wrong skip(-3), na, see I/JKNEEP1(-2), na, asked(-1), no change(0), extreme change(10)"),
      c("i/jkneep9", "Knee pain: number of days pain past 6 months", "na, wrong skip(-3), na, see I/JKNEEP1(-2), na, asked(-1), not a single day(1), 1-30 days(2), 31-89 days(3), 90 days or more(4)"),
      c("i/jcancer1", "Cancer", "na, see I/JRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3) Not in I:"),
      c("jcance1x", "Cancer: nature of tumor", "na, technical error(-8), na, wrong skip(-3), na, see JCANCER1(-2), na, asked(-1), benign(1), maligh(2), unknown(3)"),
      c("i/jcancer4", "Cancer: treatment doctor", "na, wrong skip(-3), In I: na, see ICANCER1(-2) In J: na, see JCANCER1 & JCANCE1X(-2), In I, J: na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("i/jcancer5", "Cancer: tumor since last interview", "na, previous interview no cancer(-6), na, short interview(-4), na, wrong skip(-3), In I: na, see ICANCER1(-2) In J: na, see JCANCER1 & JCANCE1X(-2), In I, J: na, asked(-1), no(1), yes(2) Only in I:"),
      c("icance5a", "Cancer: tumor, lungs", "na, see ICANCER5(-6), na, wrong skip(-3), na, see ICANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("jcance5a", "Cancer: tumor, lungs", "na, short interview(-4), na, wrong skip(-3), na, see JCANCER1 & JCANCE1X(-2), na, asked(-1), not mentioned(1), mentioned(2) Only in I: icance5b Cancer: tumor, breast see icance5a Only in J: jcance5b Cancer: tumor, breast see jcance5a Only in I:"),
      c("icance5c", "Cancer: tumor, uterus", "not asked, male(-7), na, see ICANCER5(-6), na, wrong skip(-3), na, see ICANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2) Only in J:"),
      c("jcance5c", "Cancer: tumor, uterus", "not asked, male(-7), na, short interview(-4), na, wrong skip(-3), na, see JCANCER1 & JCANCE1X(-2), na, asked(-1), not mentioned(1), mentioned(2) Only in I: icance5d Cancer: tumor, cervix see icance5c Only in J: jcance5d Cancer: tumor, cervix see jcance5c Only in I: icance5e Cancer: tumor, intestines see icance5a Only in J: jcance5e Cancer: tumor, intestines see icance5a Only in I:"),
      c("icance5f", "Cancer: tumor, prostate", "not asked, female(-7), na, see ICANCER5(-6), na, wrong skip(-3), na, see ICANCER1(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("jcance5f", "Cancer: tumor, prostate", "not asked, female(-7), na, short interview(-4), na, wrong skip(-3), na, see JCANCER1 & JCANCE1X(-2), na, asked(-1), not mentioned(1), mentioned(2) Only in I: icance5g Cancer: tumor, larynx see icance5a Only in J: jcance5g Cancer: tumor, larynx see jcance5a Only in I: icance5h Cancer: tumor, esophagus see icance5a Only in J: jcance5h Cancer: tumor, esophagus see jcance5a Only in I: icance5i Cancer: tumor, stomach see icance5a Only in J: jcance5i Cancer: tumor, stomach see jcance5a Only in I: icance5j Cancer: tumor, blood see icance5a Only in J: jcance5j Cancer: tumor, blood see jcance5a Only in I: icance5k Cancer: tumor, skin see icance5a Only in J: jcance5k Cancer: tumor, skin see jcance5a Only in I: icance5l Cancer: tumor, other see icance5a Only in J: jcance5l Cancer: tumor, other see jcance5a Only in I: icance5m Cancer: tumor, which other none"),
      c("i/jcancer6", "Cancer: metastases since last interview", "na, short interview(-4), na, wrong skip(-3), In I: na, see ICANCER1(-2) In J: na, see JCANCER1 & JCANCE1X(-2), In I, J: na, asked(-1), no(1), yes(2)"),
      c("i/jcance6a", "Cancer: metastases, bone/skeleton", "na, wrong skip(-3), na, see I/JCANCER6(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("i/jcance6b", "Cancer: metastases, liver", "see i/jcance6a"),
      c("i/jcance6c", "Cancer: metastases, brain", "see i/jcance6a"),
      c("i/jcance6d", "Cancer: metastases, lungs", "see i/jcance6a"),
      c("i/jcance6e", "Cancer: metastases, lymph nodes", "see i/jcance6a"),
      c("i/jcance6f", "Cancer: metastases, other", "see i/jcance6a Only in I:"),
      c("icance6g", "Cancer: metastases, which other", "none"),
      c("i/jcance7a", "Cancer: surgery, since last interview", "na, short interview(-4), na, wrong skip(-3), In I: na, see ICANCER1(-2), In J: na, see JCANCER1 & JCANCE1X(-2), In I, J: na, asked(-1), not mentioned(1), mentioned(2)"),
      c("i/jcance7b", "Cancer: chemotherapy, since last interview", "see i/jcance7a"),
      c("i/jcance7c", "Cancer: radiotherapy, since last interview", "see i/jcance7a"),
      c("i/jcance7d", "Cancer: alternative treatment, since last interview", "see i/jcance7a"),
      c("i/jothsi01", "Other1: other chronic diseases", "na, see I/JRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("i/jothsi02", "Other1: disease", "na, wrong skip(-3), na, see I/JOTHSI01(-2), na, asked(-1), see Table Other diseases***"),
      c("i/jothsi04", "Other1: from which age", "na, wrong skip(-3), na, see I/JOTHSI01(-2), na, asked(-1) Only in I:"),
      c("iothsi05", "Other1: taking medication", "na, wrong skip(-3), na, see IOTHSI01(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jothsi06", "Other1: treatment doctor", "na, wrong skip(-3), na, see I/JOTHSI01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("i/jothsi07", "Other2: other chronic diseases", "na, wrong skip(-3), na, see I/JOTHSI01(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jothsi08", "Other2: disease", "na, wrong skip(-3), na, see I/JOTHSI07(-2), na, asked(-1), see Table Other diseases***"),
      c("i/jothsi10", "Other2: from which age", "na, wrong skip(-3), na, see I/JOTHSI07(-2), na, asked(-1)"),
      c("i/jothsi12", "Other2: treatment doctor", "na, wrong skip(-3), na, see I/JOTHSI07(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("i/jhbd1", "Hypertension", "na, see I/JRMCH(-5), na, asked(-1), no(1), yes(2), Not in I: R does not know(3)"),
      c("i/jhbd1a", "Hypertension: taking medication", "na, wrong skip(-3), na, see I/JHBD1(-2), na, asked(-1), no(1), yes(2)"),
      c("i/jhbd2", "Hypertension: from which age", "na, wrong skip(-3), na, see I/JHBD1 & I/JHBD1A1(-2), na, asked(-1)"),
      c("i/jhbd3", "Hypertension: treatment doctor", "na, wrong skip(-3), na, see I/JHBD1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3) i/jhtrauma, i/jtrau#, i/jtraum, i/jtrauy see LASA035_headtrauma_varinfo"),
      c("i/jchoutd", "Chronic diseases: outdoors less often", "na, see I/JRMCH(-5), na, wrong skip(-3), In I: na, see IHEALTH1 & not any chronic disease(-2), In J: na, not any chronic disease(-2), In I, J: na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("i/jchoutd01", "Ch. dis. outdoors less often: CNSLD", "na, see I/JCHOUTD(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("i/jchoutd02", "Ch. dis. outdoors less often: heart", "see i/jchoutd01"),
      c("i/jchoutd03", "Ch. dis. outdoors less often: arteries", "see i/jchoutd01"),
      c("i/jchoutd04", "Ch. dis. outdoors less often: diabetes", "see i/jchoutd01"),
      c("i/jchoutd05", "Ch. dis. outdoors less often: CVA", "see i/jchoutd01"),
      c("i/jchoutd06", "Ch. dis. outdoors less often: incontinence", "see i/jchoutd01"),
      c("i/jchoutd07", "Ch. dis. outdoors less often: osteoarthritis", "see i/jchoutd01"),
      c("i/jchoutd08", "Ch. dis. outdoors less often: rheumatoid arthritis", "see i/jchoutd01"),
      c("i/jchoutd09", "Ch. dis. outdoors less often: cancer", "see i/jchoutd01"),
      c("i/jchoutd10", "Ch. dis. outdoors less often: other chronic disease 1", "see i/jchoutd01"),
      c("i/jchoutd11", "Ch. dis. outdoors less often: other chronic disease 2", "see i/jchoutd01"),
      c("i/jchoutd12", "Ch. dis. outdoors less often: hypertension", "see i/jchoutd01"),
      c("i/jchmodus", "Long or short interview", "na, see I/JRMCH(-2), long interview(1), short interview(2)"),
      c("i/jrmch", "Reason missing: chronical diseases", "valid data(-2), interview terminated(2), refused test(4)")
    ),
    K = list(
      c("kcara01", "CNSLD: asthma, chr bronch, emphysema", "na, see KRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("kcara02", "CNSLD: from which age", "na, wrong skip(-3), na, see KCARA01(-2), na, asked / R does not know(-1)"),
      c("kcara04", "CNSLD: treatment doctor", "na, wrong skip(-3), na, see KCARA01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("kcara08", "CNSLD: shortness of breath sometimes", "na, short interview(-4), na, wrong skip(-3), na, see KCARA01(-2), na, asked(-1), no(1), yes, with heavy exertion(2), yes, with light exertion(3), yes, at rest(4)"),
      c("kcara11", "CNSLD: disturbed night-rest or sleep", "na, short interview(-4), na, wrong skip(-3), na, see KCARA01(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("khart01", "Heart: heart disease", "na, see KRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("khart02", "Heart: from which age", "na, wrong skip(-3), na, see KHART01(-2), na, asked(-1)"),
      c("khart04", "Heart: treatment doctor", "na, wrong skip(-3), na, see KHART01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("khart05", "Heart: myocardial infarction since last interview", "na, short interview(-4), na, wrong skip(-3), na, see KHART01(-2), na, asked(-1), no(1), yes(2)"),
      c("khart10", "Heart: chest pain during exertion", "na, short interview(-4), na, wrong skip(-3), na, see KHART01(-2), na, asked(-1), no(1), yes(2), no exertion: chest pain(3), no exertion: pain legs(4), no exertion: shortness of breath(5), no exertion: joint complaints(6), no exertion: other reason(7)"),
      c("khart11", "Heart: exertion pain disappears in 10 min", "na, wrong skip(-3), na, see KHART10(-2), na, asked(-1), no(1), yes(2)"),
      c("khart12", "Heart: >1 pillow for shortness of breath", "na, short interview(-4), na, wrong skip(-3), na, see KHART01(-2), na, asked(-1), no(1), yes(2)"),
      c("khart14", "Heart: edema evening; legs, feet, ankles", "na, short interview(-4), na, wrong skip(-3), na, see KHART01(-2), na, asked(-1), no, do not have compression stockings(1), no, because of use compression stockings(2), yes(3)"),
      c("khart15", "Heart: cardiac surgery since last interview", "na, short interview(-4), na, wrong skip(-3), na, see KHART01(-2), na, asked(-1), no(1), yes(2)"),
      c("khart15a", "Heart: valves/cardiac surgery since last interview", "na, wrong skip(-3), na, see KHART15(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("khart15b", "Heart: bypass/cardiac surgery since last interview", "see khart15a"),
      c("khart15c", "Heart: dotter/cardiac surgery since last interview", "see khart15a"),
      c("khart15d", "Heart: pacemaker/cardiac surgery since interview", "see khart15a"),
      c("khart15e", "Heart: other/cardiac surgery since last interview", "see khart15a"),
      c("kartvei1", "Arteries: disease or abnormalities", "na, see KRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("kartvei1b", "Arteries: No, previous interview Yes", "na, wrong skip(-3), na, see original (raw data) ARTVE1(-1), na, asked(-1), no, disease still exists(1), yes, disease not present anymore(2), R has complaints, but doctor says no disease(3), R says he/she never had the disease(4), interviewer error(5)"),
      c("kartvei1c", "Arteries: disease not present since", "na, wrong skip(-3), na, see KKARTVEI1B(-2), na, asked / R does not know(-1)"),
      c("kartvei1d", "Arteries: reason disease not present", "na, wrong skip(-3), na, see KARTVE1B(-2), no trouble anymore, complaints disappeared by itself(1), no trouble anymore, disease is under control(2), no trouble anymore, complaints disappeared after surgery(3), according to the doctor, the disease is no longer present(4), previous measurement is wrong(5), other reason mentioned(6), R does not know(7)"),
      c("kartvei4", "Arteries: treatment doctor", "na, wrong skip(-3), na, see KARTVEI1(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("kartvei5", "Arteries: pain when walking", "na, short interview(-4), na, wrong skip(-3), na, see KARTVEI1(-2), na, asked(-1), no(1), yes(2)"),
      c("kartvei7", "Arteries: pain disappears standing still", "na, wrong skip(-3), na, see KARTVEI5(-2), na, asked(-1), no(1), yes(2)"),
      c("kartvei8", "Arteries: surgery since last interview", "na, short interview(-4), na, wrong skip(-3), na, see KARTVEI1(-2), na, asked(-1), no(1), yes(2)"),
      c("kartve8a", "Arteries: surgery, bifurcation", "na, wrong skip(-3), na, see KARTVEI8(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("kartve8b", "Arteries: surgery, femoral", "see kartve8a"),
      c("kartve8c", "Arteries: surgery, groins", "see kartve8a"),
      c("kartve8d", "Arteries: surgery, dotter", "see kartve8a"),
      c("kartve8e", "Arteries: surgery, other", "see kartve8a"),
      c("kdiabe01", "Diabetes", "na, see KRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("kdiabe02", "Diabetes: from which age", "na, wrong skip(-3), na, see KDIABE01(-2), na, asked(-1)"),
      c("kdiabe03", "Diabetes: medication from onset", "na, see KDIABE01(-2), no medication use(1), medication use(2)"),
      c("kdiabe03a", "Diabetes: medication; insulin injections", "na, see KDIABE03(-2), not mentioned(0), mentioned(1)"),
      c("kdiabe03b", "Diabetes: medication; insulin tablets", "see kdiabe03a"),
      c("kdiabe03c", "Diabetes: medication; insulin pump", "see kdiabe03a"),
      c("kdiabe04", "Diabetes: treatment doctor", "na, wrong skip(-3), na, see KDIABE01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("kdiabe07", "Diabetes: pain when walking", "na, see KARTVEI5(-6), na, short interview(-4), na, wrong skip(-3), na, see KDIABE01(-2), na, asked(-1), no(1), yes(2)"),
      c("kdiabe09", "Diabetes: pain disappears standing still", "na, wrong skip(-3), na, see KDIABE07(-2), na, asked(-1), no(1), yes(2)"),
      c("kdiabe11", "Diabetes: chest pain during exertion", "na, see KHART10(-6), na, short interview(-4), na, wrong skip(-3), na, see KDIABE01(-2), na, asked(-1), no(1), yes(2), no exertion: chest pain(3), no exertion: pain legs(4), no exertion: shortness of breath(5), no exertion: joint complaints(6), no exertion: other reason(7)"),
      c("kdiabe12", "Diabetes: exertion pain disappears in 10 minutes", "na, short interview(-4), na, wrong skip(-3), na, see KDIABE11(-2), na, asked(-1), no(1), yes(2)"),
      c("kcva01", "CVA", "na, see KRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("kcva02a", "CVA: stroke since last interview", "na, short interview(-4), na, wrong skip(-3), na, see KCVA01(-2), na, asked(-1), no(1), yes(2)"),
      c("kcva03m", "CVA: (first) stroke month", "na, wrong skip(-3), na, see KCVA02A(-2), na, asked(-1), see Table Month****"),
      c("kcva03j", "CVA: (first) stroke year", "na, wrong skip(-3), na, see KCVA02A(-2), na, asked(-1)"),
      c("kcva07", "CVA: treatment doctor", "na, wrong skip(-3), na, see KCVA01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("kincon9", "Past month: unintentional urine loss with physical exertion", "na, see KRMCH(-5), not applicable: stoma, catheter or something else(-2), na, asked(-1), 2 times a month or less(1), 3-4 times a month(2), a few times a week (3), daily(4)"),
      c("kincon10", "Past month: strong urge to urinate and unable to make it to the toilet on time", "see kincon9"),
      c("krheum01", "Osteo/rheum art: osteoarthritis (knee, hip or hand)", "na, see KRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("krheum01a", "Osteo/rheum art: osteoarthritis (other than knee, hip or hand)", "na, see KRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("krheum02", "Osteo/rheum art: rheumatoid arthritis", "na, see KRMCH(-5), na, wrong skip(-3), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("krheum04", "Osteo/rheum art: taking medication", "na, wrong skip(-3), na, see KRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("krheum05", "Osteo/rheum art: treatment doctor", "na, wrong skip(-3), na, see KRHEUM01&02(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("krheum06", "Osteo/rheum art: pain in joints past 3 months", "na, short interview(-4), na, wrong skip(-3), na, see KRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("krheum07", "Osteo/rheum art: morning stiffness joint", "na, short interview(-4), na, wrong skip(-3), na, see KRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("krheum08", "Osteo/rheum art: swelling joints past month", "na, short interview(-4), na, wrong skip(-3), na, see KRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("krheum8a", "Osteo/rheum art: complaints fingers", "na, short interview(-4), na, wrong skip(-3), na, see KRHEUM01&02(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("krheum8b", "Osteo/rheum art: complaints hand/wrist", "see krheum8a"),
      c("krheum8c", "Osteo/rheum art: complaints elbows", "see krheum8a"),
      c("krheum8d", "Osteo/rheum art: complaints shoulders", "see krheum8a"),
      c("krheum8e", "Osteo/rheum art: complaints toes", "see krheum8a"),
      c("krheum8f", "Osteo/rheum art: complaints feet/ankles", "see krheum8a"),
      c("krheum8g", "Osteo/rheum art: complaints knees", "see krheum8a"),
      c("krheum8h", "Osteo/rheum art: complaints hip", "see krheum8a"),
      c("krheum8i", "Osteo/rheum art: complaints neck", "see krheum8a"),
      c("krheum8j", "Osteo/rheum art: complaints back", "see krheum8a"),
      c("krheum09", "Osteo/rheum art: surgery since last interview", "na, short interview(-4), na, wrong skip(-3), na, see KRHEUM01&02(-2), na, asked(-1), no(1), yes(2)"),
      c("krheum9a", "Osteo/rheum art: surgery fingers", "na, wrong skip(-3), na, see KRHEUM09(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("krheum9b", "Osteo/rheum art: surgery hand/wrist", "see krheum9a"),
      c("krheum9c", "Osteo/rheum art: surgery elbows", "see krheum9a"),
      c("krheum9d", "Osteo/rheum art: surgery shoulders", "see krheum9a"),
      c("krheum9e", "Osteo/rheum art: surgery toes since", "see krheum9a"),
      c("krheum9f", "Osteo/rheum art: surgery feet/ankles", "see krheum9a"),
      c("krheum9g", "Osteo/rheum art: surgery knees", "see krheum9a"),
      c("krheum9h", "Osteo/rheum art: surgery hip", "see krheum9a"),
      c("krheum9i", "Osteo/rheum art: surgery neck", "see krheum9a"),
      c("krheum9j", "Osteo/rheum art: surgery back", "see krheum9a"),
      c("krheum10a", "Osteo/rheum art: joint replacement surgery", "na, short interview(-4), na, wrong skip(-3), na, see KRHEUM01(-2), na, asked(-1), no(1), yes(2)"),
      c("krh10_1j", "Joint replacement surgery (1): joint", "na wrong skip(-3), na, see KRHEUM10A(-2), na, asked(-1), see Table Joints(K)******"),
      c("krh10_1s", "Joint replacement surgery (1): side", "na, wrong skip(-3), na, see KRHEUM10A(-2), na, asked(-1), right(1), left(2), right and left(3)"),
      c("krh10_1y1", "Joint replacement surgery (1): year (1)", "na, wrong skip(-3), na, see KRHEUM10A(-2), na, asked(-1)"),
      c("krh10_1y2", "Joint replacement surgery (1): year (2)", "na, wrong skip(-3), na, see KRH10_1S(-2), na, asked(-1)"),
      c("krh10_1r", "Joint replacement surgery (1): reason", "na, wrong skip, na, see KRHEUM10A(-2), na, asked(-1), osteoarthritis/wear and tear/loss of cartilage(1), rheumatoid arthritis(2), infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)(3), fracture (due to accident)(4), pain(5), other (unable to stand or walk/immobility/etc)(6)"),
      c("krheum10a2", "Osteo/rheum art: joint replacement surgery (2)", "na, short interview(-4), na, wrong skip(-3), na, see KRHEUM10A2(-2), na, asked(-1), no(1), yes(2)"),
      c("krh10_2j", "Joint replacement surgery (2): joint", "na wrong skip(-3), na, see KRHEUM10A2(-2), na, asked(-1), see Table Joints(K)******"),
      c("krh10_2s", "Joint replacement surgery (2): side", "na, wrong skip(-3), na, see KRHEUM10A2(-2), na, asked(-1), right(1), left(2), right and left(3)"),
      c("krh10_2y1", "Joint replacement surgery (2): year (1)", "na, wrong skip(-3), na, see KRHEUM10A2(-2), na, asked(-1)"),
      c("krh10_2y2", "Joint replacement surgery (2): year (2)", "na, wrong skip(-3), na, see KRH10_2S(-2), na, asked(-1)"),
      c("krh10_2r", "Joint replacement surgery (2): reason", "na, wrong skip(-3), na, see KRHEUM10A2(-2), na, asked(-1), osteoarthritis/wear and tear/loss of cartilage(1), rheumatoid arthritis(2), infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)(3), fracture (due to accident)(4), pain(5), other (unable to stand or walk/immobility/etc)(6)"),
      c("krheum10a3", "Osteo/rheum art: joint replacement surgery (3)", "na, short interview(-4), na, wrong skip(-3), na, see KRHEUM10A2(-2), na, asked(-1), no(1), yes(2)"),
      c("krh10_3j", "Joint replacement surgery (3): joint", "na wrong skip(-3), na, see JRHEUM10A3(-2), na, asked(-1), see Table Joints(K)******"),
      c("krh10_3s", "Joint replacement surgery (3): side", "na, wrong skip(-3), na, see KRHEUM10A3(-2), na, asked(-1), right(1), left(2), right and left(3)"),
      c("krh10_3y1", "Joint replacement surgery (3): year (1)", "na, wrong skip(-3), na, see KRHEUM10A3(-2), na, asked(-1)"),
      c("krh10_3y2", "Joint replacement surgery (3): year (2)", "na, wrong skip(-3), na, see KRH10_3S(-2), na, asked(-1)"),
      c("krh10_3r", "Joint replacement surgery (3): reason", "na, see KRHEUM10A3(-2), na, asked(-1), osteoarthritis/wear and tear/loss of cartilage(1), rheumatoid arthritis(2), infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)(3), fracture (due to accident)(4), pain(5), other (unable to stand or walk/immobility/etc)(6)"),
      c("krheum12", "Osteo/rheum art: observation hands", "na, wrong skip(-3), na, see KRHEUM01&02(-2), na, asked(-1), rheumatic hands(1), no rheumatic hands(2), observation not possible(3)"),
      c("kcancer1", "Cancer", "na, see KRMCH(-5), na, asked(-1), no(0), no, previous interview yes(1), yes, previous interview no(2), yes, previous interview yes(3)"),
      c("kcance1x", "Cancer: nature of tumor", "na, technical error(-8), na, wrong skip(-3), na, see KCANCER1(-2), na, asked(-1), benign(1), maligh(2), unknown(3)"),
      c("kcancer4", "Cancer: treatment doctor", "na, wrong skip(-3), na, see KCANCER1 & KCANCE1X(-2) na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("kcancer5", "Cancer: tumor since last interview", "na, previous interview no cancer(-6), na, short interview(-4), na, wrong skip(-3), na, see KCANCER1 & KCANCE1X(-2) na, asked(-1), no(1), yes(2)"),
      c("kcance5x", "Cancer: nature of new tumor", "na, wrong skip(-3), na, see KCANCER5(-2), na, asked(-1), benign(1), maligh(2), unknown(3)"),
      c("kcance5a", "Cancer: tumor, lungs", "na, short interview(-4), na, wrong skip(-3), na, see KCANCER1 & KCANCE1X(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("kcance5b", "Cancer: tumor, breast", "see kcance5a"),
      c("kcance5c", "Cancer: tumor, uterus", "not asked, male(-7), na, short interview(-4), na, wrong skip(-3), na, see KCANCER1 & KCANCE1X(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("kcance5d", "Cancer: tumor, cervix", "see kcance5c"),
      c("kcance5e", "Cancer: tumor, intestines", "see kcance5a"),
      c("kcance5f", "Cancer: tumor, prostate", "not asked, female(-7), na, short interview(-4), na, wrong skip(-3), na, see KCANCER1 & KCANCE1X(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("kcance5g", "Cancer: tumor, larynx", "see kcance5a"),
      c("kcance5h", "Cancer: tumor, esophagus", "see kcance5a"),
      c("kcance5i", "Cancer: tumor, stomach", "see kcance5a"),
      c("kcance5j", "Cancer: tumor, blood", "see kcance5a"),
      c("kcance5k", "Cancer: tumor, skin", "see kcance5a"),
      c("kcance5l", "Cancer: tumor, other", "see kcance5a"),
      c("kcancer6", "Cancer: metastases since last interview", "na, short interview(-4), na, wrong skip(-3), na, see KCANCER1 & KCANCE1X(-2), na, asked(-1), no(1), yes(2)"),
      c("kcance6a", "Cancer: metastases, bone/skeleton", "na, wrong skip(-3), na, see KCANCER6(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("kcance6b", "Cancer: metastases, liver", "see kcance6a"),
      c("kcance6c", "Cancer: metastases, brain", "see kcance6a"),
      c("kcance6d", "Cancer: metastases, lungs", "see kcance6a"),
      c("kcance6e", "Cancer: metastases, lymph nodes", "see kcance6a"),
      c("kcance6f", "Cancer: metastases, other", "see kcance6a"),
      c("kcance7a", "Cancer: surgery, since last interview", "na, short interview(-4), na, wrong skip(-3), na, see KCANCER1 & KCANCE1X(-2), na, asked(-1), not mentioned(1), mentioned(2)"),
      c("kcance7b", "Cancer: chemotherapy, since last interview", "see kcance7a"),
      c("kcance7c", "Cancer: radiotherapy, since last interview", "see kcance7a"),
      c("kcance7d", "Cancer: alternative treatment, since last interview", "see kcance7a"),
      c("kothsi01", "Other1: other chronic diseases", "na, see KRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("kothsi02", "Other1: disease", "na, wrong skip(-3), na, see KOTHSI01(-2), na, asked(-1), see Table Other diseases(K)"),
      c("kothsi04", "Other1: from which age", "na, wrong skip(-3), na, see KOTHSI01(-2), na, asked(-1)"),
      c("kothsi06", "Other1: treatment doctor", "na, wrong skip(-3), na, see KOTHSI01(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("kothsi07", "Other2: other chronic diseases", "na, wrong skip(-3), na, see KOTHSI01(-2), na, asked(-1), no(1), yes(2)"),
      c("kothsi08", "Other2: disease", "na, wrong skip(-3), na, see KOTHSI07(-2), na, asked(-1), see Table Other diseases(K)"),
      c("kothsi10", "Other2: from which age", "na, wrong skip(-3), na, see KOTHSI07(-2), na, asked(-1)"),
      c("kothsi12", "Other2: treatment doctor", "na, wrong skip(-3), na, see KOTHSI07(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("khbd1", "Hypertension", "na, see KRMCH(-5), na, asked(-1), no(1), yes(2), R does not know(3)"),
      c("khbd1a", "Hypertension: taking medication", "na, see KRMCH(-5), na, wrong skip(-3), na, see KHBD1(-2), na, asked(-1), no(1), yes(2)"),
      c("khbd2", "Hypertension: from which age", "na, wrong skip(-3), na, see KHBD1 & KHBD1A1(-2), na, asked(-1)"),
      c("khbd3", "Hypertension: treatment doctor", "na, wrong skip(-3), na, see KHBD1 & KHBD1A(-2), na, asked(-1), no(1), yes, family physician(2), yes, specialist(3)"),
      c("kchol1", "Hypercholesterolemia", "na, see KRMCH(-5), na, asked(-1), no(1), yes(2), R does not know(3)"),
      c("kchol2", "Hypercholesterolemia: taking medication", "see kchol1 khtrauma, kntraum, khtraumm, khtraumj see LASA035_headtrauma_varinfo"),
      c("kchoutd", "Chronic diseases: outdoors less often", "na, see KRMCH(-5), na, wrong skip(-3), na, not any chronic disease(-2), na, asked(-1), not at all(1), sometimes(2), often(3), always(4)"),
      c("kchoutd01", "Ch. dis. outdoors less often: CNSLD", "na, see KCHOUTD(-2), na, asked(-1), not mentioned(0), mentioned(1)"),
      c("kchoutd02", "Ch. dis. outdoors less often: heart", "see kchoutd01"),
      c("kchoutd03", "Ch. dis. outdoors less often: arteries", "see kchoutd01"),
      c("kchoutd04", "Ch. dis. outdoors less often: diabetes", "see kchoutd01"),
      c("kchoutd05", "Ch. dis. outdoors less often: CVA", "see kchoutd01"),
      c("kchoutd06", "Ch. dis. outdoors less often: incontinence", "see kchoutd01"),
      c("kchoutd07", "Ch. dis. outdoors less often: osteoarthritis", "see kchoutd01"),
      c("kchoutd08", "Ch. dis. outdoors less often: rheumatoid arthritis", "see kchoutd01"),
      c("kchoutd09", "Ch. dis. outdoors less often: cancer", "see kchoutd01"),
      c("kchoutd10", "Ch. dis. outdoors less often: other chronic disease 1", "see kchoutd01"),
      c("kchoutd11", "Ch. dis. outdoors less often: other chronic disease 2", "see kchoutd01"),
      c("kchoutd12", "Ch. dis. outdoors less often: hypertension", "see kchoutd01"),
      c("kkneep1", "Knee pain past 6 months", "na, see KRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("kkneep2", "Knee pain: pain level now", "na, wrong skip(-3), na, see KKNEEP1(-2), na, asked(-1), no pain(0), worst conceivable pain(10)"),
      c("kkneep3", "Knee pain: worst pain past 6 months", "see kkneep2"),
      c("kkneep4", "Knee pain: average pain past 6 months", "see kkneep2"),
      c("kkneep5", "Knee pain: number of days unable to perform normal activities", "na, wrong skip(-3), na, see KKNEEP1(-2), na, asked(-1), 0-6 days(1), 7-14 days(2), 15-30 days(3), 31 days or more(4)"),
      c("kkneep6", "Knee pain: to which extent impeded daily activities", "na, wrong skip(-3), na, see KKNEEP1(-2), na, asked(-1), not impeded(0), unable to continue activities(10)"),
      c("kkneep7", "Knee pain: to which extent changed social activities", "na, wrong skip(-3), na, see KKNEEP1(-2), na, asked(-1), no change(0), extreme change(10)"),
      c("kkneep8", "Knee pain: to which extent changed daily work activities", "na, wrong skip(-3), na, see KKNEEP1(-2), na, asked(-1), no change(0), extreme change(10)"),
      c("kkneep9", "Knee pain: number of days pain past 6 months", "na, wrong skip(-3), na, see KKNEEP1(-2), na, asked(-1), not a single day(1), 1-30 days(2), 31-89 days(3), 90 days or more(4)"),
      c("KCORONA1", "Since March, 2020: R tested positive on corona test", "na, see KRMCH(-5), na, asked(-1), no(1), yes(2)"),
      c("KCORONA1_M", "Month positive corona test", "na, wrong skip(-3), na, see KCORONA1(-2), na, asked(-1), see Table Month****"),
      c("KCORONA1_Y", "Year positive corona test", "na, wrong skip(-3), na, see KCORONA1(-2), na, asked(-1)"),
      c("KCORONA1_LC1", "Long-Covid 1: shortness of breath / fatigue", "Not applicable, positive corona test less than 3 months ago(-4), na, wrong skip(-3), na, see KCORONA1 & KCORONA2(-2), na, asked(-1), no(1), yes(2)"),
      c("KCORONA1_LC2", "Long-Covid 1: gloom / anxious", "see kcorona1_lc1"),
      c("KCORONA1_LC3", "Long-Covid 1: forgetfulness / concentration problems", "see kcorona1_lc1"),
      c("KCORONA1_LC4", "Long-Covid 1: more help from others / decreased working ability", "see kcorona1_lc1"),
      c("KCORONA2", "Second positive corona test", "na, wrong skip(-3), na, see KCORONA1(-2), na, asked(-1), no(1), yes(2)"),
      c("KCORONA2_M", "Month second positive corona test", "na, wrong skip(-3), na, see KCORONA2(-2), na, asked(-1), see Table Month****"),
      c("KCORONA2_Y", "Year second positive corona test", "na, wrong skip(-3), na, see KCORONA2(-2), na, asked(-1)"),
      c("KCORONA2_LC1", "Long-Covid 2: shortness of breath / fatigue", "Not applicable, positive corona test less than 3 months ago(-4), na, wrong skip(-3), na, see KCORONA2(-2), na, asked(-1), no(1), yes(2)"),
      c("KCORONA2_LC2", "Long-Covid 2: gloom / anxious", "see kcorona2_lc1"),
      c("KCORONA2_LC3", "Long-Covid 2: forgetfulness / concentration problems", "see kcorona2_lc1"),
      c("KCORONA2_LC4", "Long-Covid 2: more help from others / decreased working ability", "see kcorona2_lc1"),
      c("KVACCIN", "R vaccinated against corona", "na, see KRMCH(-5), not asked(-4), na, asked(-1), no(1), yes(2)"),
      c("KVACCIN_M", "R vaccinated against corona: month first vaccination", "na, wrong skip(-3), na, see KVACCIN(-2), na, asked(-1), see Table Month****"),
      c("kvaccin_y", "R vaccinated against corona: year first vaccination", "na, wrong skip(-3), na, see KVACCIN(-2), na, asked(-1)"),
      c("kchmodus", "Long or short interview", "na, see KRMCH(-2), long interview(1), short interview(2)"),
      c("krmch", "Reason missing: chronical diseases", "valid data(-2), interview terminated(2), refused test(4) *) Table Other diseases: b/c/d/e/b/fothsi02, b/c/d/e/b/fothsi08 (in B, C, D, E, 2B, and F) value value label 1 hypertension 2 ulcer stomach or duodenum 3 serious intestinal disease 4 gall-stones/gall-bladder 5 liver disease or cirrhosis 6 inguinal hernia 7 kidney stone 8 kidney disease-serious 9 chronic cystitis 10 prostate complaints (males) 11 prolapse (females) 12 thyroid disease 13 back problems, hernia 14 epilepsy 15 dizziness with falling 16 migraine 17 serious skin disease 18 decubitus-ulcer 19 allergy/hay-fever 20 serious consequences accident 21 other serious consequences/burns 22 consequences surgery/operations 23 disease of nervous system")
    )
  )

  month_map <- setNames(seq_along(month.name), month.name)
  other_disease_legacy <- setNames(
    1:50,
    c(
      "hypertension", "ulcer stomach or duodenum",
      "serious intestinal disease", "gall-stones/gall-bladder",
      "liver disease or cirrhosis", "inguinal hernia", "kidney stone",
      "kidney disease-serious", "chronic cystitis",
      "prostate complaints (males)", "prolapse (females)",
      "thyroid disease", "back problems, hernia", "epilepsy",
      "dizziness with falling", "migraine", "serious skin disease",
      "decubitus-ulcer", "allergy/hay-fever",
      "serious consequences accident", "other serious consequences/burns",
      "consequences surgery/operations", "disease of nervous system",
      "mental problems, incl. depression",
      "in B/C: eye diseases; in D/E/2B/F: - to be coded -",
      "ear diseases/hearing problems", "venous insufficiency/varicose veins",
      "anaemia", "chronic headaches (no migraine)",
      "chronic neck-problems", "dizziness without falling",
      "congenital disorders", "hypercholesterolaemia", "gout",
      "menopausal complaints (females)", "osteoporosis",
      "other pulmonary disease (no CNSLD)", "systemic diseases",
      "other hormonal diseases (no diabetes/thyroid)",
      "other urological disease (no incontinence)",
      "other locomotor disease", "other vascular disease",
      "other neurological disease", "TIA", "other haematological disease",
      "pancreatitis-chronic", "no label", "addiction",
      "other chronic disease", "other non-chronic disease"
    )
  )
  other_disease_g <- other_disease_legacy[1:25]
  names(other_disease_g)[25] <- "other → to be coded"
  other_disease_h <- setNames(
    1:26,
    c(
      names(other_disease_legacy)[1:23], "Parkinson",
      "mental problems, incl. depression", "other → to be coded"
    )
  )
  other_disease_k <- setNames(
    1:31,
    c(
      names(other_disease_legacy)[1:23], "Parkinson",
      "mental problems, incl. depression", "hearing impairment", "gout",
      "eye complaints/diseases", "Sleep Apnea (OSAS)",
      "TIA (the past 3 years)", "other → to be coded"
    )
  )
  joints_i <- setNames(
    1:23,
    c(
      "right hip", "left hip", "both hips", "right knee", "left knee",
      "both knees", "right hand fingers", "left hand fingers",
      "both hands fingers", "right hand/wrist", "left hand/wrist",
      "both hands/wrists", "toes right foot", "toes left foot",
      "toes both feet", "right foot/ankle", "left foot/ankle",
      "both feet/ankles", "neck", "back", "right shoulder",
      "left shoulder", "other"
    )
  )
  joints_jk <- setNames(
    1:10,
    c(
      "hip", "knee", "fingers", "hand/wrist", "toes", "foot/ankle",
      "neck", "back", "shoulder", "other"
    )
  )

  normalize_record <- function(documented_name) {
    documented_name <- tolower(documented_name)
    if (schema == "DEFGH") {
      match <- regexec("^((?:[defgh]/)*[defgh])(.+)$", documented_name)
      parts <- regmatches(documented_name, match)[[1L]]
      if (length(parts) != 3L || !tolower(wave) %in% strsplit(parts[[2L]], "/", fixed = TRUE)[[1L]]) {
        return(NULL)
      }
      return(parts[[3L]])
    }
    if (schema == "IJ") {
      match <- regexec("^((?:[ij]/)*[ij])(.+)$", documented_name)
      parts <- regmatches(documented_name, match)[[1L]]
      if (length(parts) != 3L || !tolower(wave) %in% strsplit(parts[[2L]], "/", fixed = TRUE)[[1L]]) {
        return(NULL)
      }
      return(parts[[3L]])
    }
    substring(documented_name, 2L)
  }

  reference_suffix <- function(value_text) {
    matched <- regexec(
      "^see[[:space:]]+([A-Za-z][A-Za-z0-9_/]*)",
      value_text,
      ignore.case = TRUE
    )
    parts <- regmatches(value_text, matched)[[1L]]
    if (length(parts) != 2L || identical(tolower(parts[[2L]]), "table") ||
        identical(tolower(parts[[2L]]), "lasa035_headtrauma_varinfo")) {
      return(NULL)
    }
    reference <- tolower(parts[[2L]])
    if (grepl("/", reference, fixed = TRUE)) {
      reference <- sub("^.*/", "", reference)
    }
    substring(reference, 2L)
  }

  parse_value_map <- function(value_text) {
    locations <- gregexpr("\\(-?[0-9]+\\)", value_text, perl = TRUE)[[1L]]
    if (identical(locations[[1L]], -1L)) {
      return(NULL)
    }
    lengths <- attr(locations, "match.length")
    labels <- character(length(locations))
    codes <- numeric(length(locations))
    previous_end <- 1L
    for (i in seq_along(locations)) {
      labels[[i]] <- substr(value_text, previous_end, locations[[i]] - 1L)
      labels[[i]] <- sub("^[,[:space:]]+", "", labels[[i]])
      labels[[i]] <- sub(
        "^(?:In waves?[^:]*|In I, J|In I|In J|Not in I|Only in I)[[:space:]]*:[[:space:]]*",
        "", labels[[i]], ignore.case = TRUE, perl = TRUE
      )
      code_text <- substr(
        value_text,
        locations[[i]] + 1L,
        locations[[i]] + lengths[[i]] - 2L
      )
      codes[[i]] <- as.numeric(code_text)
      previous_end <- locations[[i]] + lengths[[i]]
    }
    setNames(codes, trimws(labels))
  }

  drop_codes <- function(value_map, codes) {
    value_map[!unname(value_map) %in% codes]
  }
  set_code <- function(value_map, code, label) {
    c(drop_codes(value_map, code), setNames(code, label))
  }
  deduplicate_codes <- function(value_map) {
    value_map[!duplicated(unname(value_map))]
  }
  order_map <- function(value_map) {
    if (is.null(value_map) || length(value_map) == 0L) return(value_map)
    value_map[order(unname(value_map), seq_along(value_map))]
  }

  clean_variable_label <- function(label, suffix) {
    if (grepl("^In I:", label)) {
      if (wave == "I") {
        label <- sub("^In I:[[:space:]]*", "", label)
        label <- sub("[[:space:]]+In J:.*$", "", label)
      } else {
        label <- sub("^.*[[:space:]]In J:[[:space:]]*", "", label)
      }
    }
    label <- sub(
      "[[:space:]]+(?:In waves?[^:]*|Only in I)[[:space:]]*:[[:space:]]*$",
      "", label, ignore.case = TRUE, perl = TRUE
    )
    trimws(label)
  }

  apply_wave_exceptions <- function(value_map, suffix) {
    needs_deduplication <- FALSE
    if (schema == "2B3B") {
      if (suffix == "diabe03" && wave == "2B") value_map <- drop_codes(value_map, 4)
      if (suffix == "cva06") {
        if (wave == "2B") value_map <- drop_codes(value_map, -2)
        needs_deduplication <- TRUE
      }
      if (suffix == "rheum02") {
        if (wave == "3B") value_map <- drop_codes(value_map, -1)
        needs_deduplication <- TRUE
      }
      if (suffix %in% c("cance5a", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g") && wave == "3B") {
        value_map <- drop_codes(value_map, -6)
      }
    }
    if (schema == "DEFGH" && suffix == "chmodus") {
      value_map <- if (wave %in% c("D", "E", "F")) {
        drop_codes(value_map, -5)
      } else {
        drop_codes(value_map, -2)
      }
      needs_deduplication <- TRUE
    }
    if (schema == "IJ") {
      if (suffix == "cara02") {
        value_map <- set_code(
          value_map, -1,
          if (wave == "I") "na, asked" else "na, asked / R does not know"
        )
        needs_deduplication <- TRUE
      }
      if (suffix %in% c("hart07m", "hart07j")) {
        value_map <- set_code(value_map, -2, paste0("na, see ", wave, if (wave == "I") "HART06" else "HART05"))
        needs_deduplication <- TRUE
      }
      if (suffix == "diabe11") {
        value_map <- set_code(value_map, -6, paste0("na, see IHART", if (wave == "I") "01" else "10"))
        needs_deduplication <- TRUE
      }
      if (suffix %in% c("cva03m", "cva03j")) {
        value_map <- set_code(value_map, -2, paste0("na, see ", wave, if (wave == "I") "CVA02B" else "CVA02A"))
        needs_deduplication <- TRUE
      }
      if (suffix == "incon9" && wave == "I") value_map <- drop_codes(value_map, -2)
      if (suffix == "rheum02" && wave == "I") value_map <- drop_codes(value_map, -3)
      if (suffix %in% c("rh10_2j", "rh10_3j")) {
        if (wave == "I") value_map <- drop_codes(value_map, -3)
        replacement_number <- sub("^rh10_([23])j$", "\\1", suffix)
        value_map <- set_code(
          value_map, -2,
          paste0("na, see ", wave, "RHEUM10A", replacement_number)
        )
        needs_deduplication <- TRUE
      }
      if (suffix %in% c("cancer4", "cancer5", "cancer6", "cance7a")) {
        value_map <- set_code(
          value_map, -2,
          if (wave == "I") "na, see ICANCER1" else "na, see JCANCER1 & JCANCE1X"
        )
        needs_deduplication <- TRUE
      }
      if (suffix == "choutd") {
        value_map <- set_code(
          value_map, -2,
          if (wave == "I") {
            "na, see IHEALTH1 & not any chronic disease"
          } else {
            "na, not any chronic disease"
          }
        )
        needs_deduplication <- TRUE
      }
    }
    if (needs_deduplication) value_map <- deduplicate_codes(value_map)
    order_map(value_map)
  }

  append_documented_table <- function(value_map, value_text) {
    if (grepl("Table Month", value_text, fixed = TRUE)) {
      value_map <- c(value_map, month_map)
    }
    if (grepl("Table Other diseases", value_text, fixed = TRUE)) {
      table_map <- if (wave %in% c("B", "C", "D", "E", "2B", "F")) {
        other_disease_legacy
      } else if (wave == "G") {
        other_disease_g
      } else if (wave %in% c("H", "3B", "I", "J")) {
        other_disease_h
      } else {
        other_disease_k
      }
      value_map <- c(value_map, table_map)
    }
    if (grepl("Table Joints", value_text, fixed = TRUE)) {
      value_map <- c(value_map, if (wave == "I") joints_i else joints_jk)
    }
    value_map
  }

  value_maps <- list()
  add_trauma <- function() {
    missing <- c(
      "na, see D/E/F/G/H/I/J/KRMCH" = -5,
      "na, asked" = -1
    )
    engine$label_variable(
      "htrauma",
      if (wave == "D") "Head trauma ever" else "Head trauma since last interview",
      c(missing, "no" = 1, "yes" = 2)
    )
    routed <- c(
      if (wave != "D") c("na, wrong skip" = -3) else numeric(0),
      setNames(
        -2,
        if (wave == "D") "na, see DHTRAUMA" else "na, see E/F/G/H/I/J/KHTRAUMA"
      ),
      "na, asked" = -1
    )
    engine$label_variable(
      "nhtraum", "Number of head traumas",
      c(routed, "8 times or more" = 8), force_numeric = TRUE
    )
    engine$label_variable(
      "htraumm", "Month last head trauma", c(routed, month_map)
    )
    engine$label_variable(
      "htraumj", "Year last head trauma", routed
    )
  }

  trauma_added <- FALSE
  for (record in metadata[[schema]]) {
    suffix <- normalize_record(record[[1L]])
    if (is.null(suffix)) next

    if (!trauma_added && wave %in% c("D", "E", "F", "G", "H", "I", "J", "K") &&
        suffix %in% c("choutd", "chmodus")) {
      add_trauma()
      trauma_added <- TRUE
    }

    variable_label <- clean_variable_label(record[[2L]], suffix)
    value_text <- record[[3L]]
    value_map <- parse_value_map(value_text)
    reference <- reference_suffix(value_text)
    if (is.null(value_map) && !is.null(reference)) {
      value_map <- value_maps[[reference]]
    }
    value_map <- append_documented_table(value_map, value_text)
    value_map <- apply_wave_exceptions(value_map, suffix)
    value_maps[suffix] <- list(value_map)

    force_numeric <- suffix == "nhtraum" ||
      grepl("^kneep[234678]$", suffix)
    engine$label_variable(
      suffix = suffix,
      variable_label = variable_label,
      value_label_map = value_map,
      force_numeric = force_numeric
    )
  }

  if (!trauma_added && wave %in% c("D", "E", "F", "G", "H", "I", "J", "K")) {
    add_trauma()
  }

  engine$finalize()
}
