# Apply LASA 069 (ties with country of origin) SPSS labels
#
# Source: LASA069_varinfo.pdf (06-Mar-2018)

#' Apply LASA069 (Ties with country of origin) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the 20 bilingual variables documented in the
#' LASMB069 ties-with-country-of-origin file.
#'
#' The file contains seven cultural-identity activities rated from never to
#' often, three Dutch-language and three Dutch-acquaintance statements rated
#' from strongly disagree to strongly agree, and seven yes/no belonging,
#' cultural-loss, and homesickness statements. The English/Dutch variable
#' labels and all three shared value maps are retained.
#'
#' All LASA069 variables are categorical. Consequently, `to_numeric` is
#' accepted for consistency with the shared apply-labels interface but does
#' not convert them. With `to_factor = TRUE`, matched variables become
#' factors and observed unlabelled codes remain numeric-text levels.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive exact match. Documented variables absent from `data` are
#' recorded as `"not found"` in the generic matching audit.
#'
#' The five reshaping arguments follow the package's shared apply-labels
#' contract. Every matched column preserves the original SPSS coding in
#' `original_labels` and `original_values`; `respnr` is standardized when
#' requested.
#'
#' @param data A data frame or tibble imported from a LASMB069 `.sav` file.
#'   Names include `bcultid1`, `bNLlang1`, `bcultdis1`, and `bloss1`.
#' @param wave Character scalar identifying the LASA wave. Only `"MB"` is
#'   documented and accepted; matching is case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the `b` prefix (for example `cultid1`, `nllang1`, or
#'   `loss1`) to actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, matched variables are converted to
#'   factors using the documented labels; observed unlabelled codes remain
#'   numeric-text levels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA069 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical suffixes without the `b` prefix, `respnr` is standardized, and
#'   `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have their `b`
#'   prefix removed and a `LASA_wave` column filled with `"MB"` is inserted
#'   after the respondent-number column.
#'
#' @return `data`, with LASA069 labels, requested conversion/renaming,
#'   preserved original coding, and a `label_report` matching audit.
#'
#' @seealso [apply_lasa068_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(bcultid1 = c(-1, 1, 4), bNLlang1 = c(1, 3, 4))
#' dat <- apply_lasa069_labels(dat, wave = "MB")
#' attr(dat$bcultid1, "labels")
apply_lasa069_labels <- function(data,
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
  if (wave != "MB") {
    stop("Unknown LASA 069 wave: ", wave, ". Use: MB.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = "b",
    fn_name = "apply_lasa069_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  activity <- c(
    "no answer" = -1, "never" = 1, "sometimes" = 2,
    "regularly" = 3, "often" = 4
  )
  agreement <- c(
    "no answer" = -1, "strongly disagree" = 1, "disagree" = 2,
    "agree" = 3, "strongly agree" = 4
  )
  yes_no <- c("no answer" = -1, "no" = 1, "yes" = 2)

  cultural_labels <- c(
    paste0("Follow political and other current events / Het volgen van ",
           "recente gebeurtenissen van mijn groep"),
    paste0("Active in an association or organization within my own group / ",
           "Het actief zijn in een vereniging of een organisatie binnen mijn groep"),
    paste0("Spend time studying the history or culture / De geschiedenis of ",
           "cultuur van mijn groep bestuderen"),
    paste0("Learn the dances and music of the group / De dansen of muziek ",
           "van mijn groep leren of beoefenen"),
    paste0("Talking to or discuss what's new with others from my group / ",
           "Praten of nieuwtjes bespreken met anderen uit mijn groep"),
    paste0("Interact with close friends from my group / Samen zijn met goede ",
           "vrienden uit mijn groep"),
    paste0("Celebrate holidays with family and good friends from my group / ",
           "Met familie of goede vrienden de feestdagen van mijn groep vieren")
  )
  for (i in seq_along(cultural_labels)) {
    engine$label_variable(paste0("cultid", i), cultural_labels[[i]], activity)
  }

  agreement_specs <- c(
    nllang1 = paste0("I can understand spoken Dutch well / ",
                     "Ik kan gesproken NLs goed begrijpen"),
    nllang2 = "I can speak Dutch well / Ik kan NLs goed spreken",
    nllang3 = "I can read Dutch well / Ik kan NLs goed lezen",
    cultdis1 = paste0("I sometimes get visits from Dutch acquaintances / ",
                      "Ik krijg thuis soms bezoek van Nederlandse kennissen"),
    cultdis2 = paste0("I would like to speak to Dutch acquaintances about what ",
                      "worries me / Ik zou met Nederlandse kennissen ook over ",
                      "mijn zorgen willen praten"),
    cultdis3 = paste0("It is all right for a Dutch acquaintance to babysit my ",
                      "children / Een Nederlandse kennis zou op mijn kind(eren) ",
                      "mogen passen")
  )
  for (suffix in names(agreement_specs)) {
    engine$label_variable(suffix, unname(agreement_specs[[suffix]]), agreement)
  }

  loss_labels <- c(
    paste0("I belong here less than in Turkey/Morocco / Ik behoor hier minder ",
           "dan in Turkije/Marokko"),
    paste0("Although I live here, it does not feel as my country / Hoewel ik ",
           "hier leef, voelt het niet als mijn land"),
    paste0("Most friends have a cultural background similar to mine / De ",
           "meeste vrienden hebben dezelfde culturele achtergrond"),
    paste0("For a day or night out, I prefer to visit places where I meet ",
           "people from Turkey/Morocco / Wanneer ik uitga, ga ik het liefst ",
           "naar plaatsen waar ik mensen uit Turkije/Marokko kan ontmoeten"),
    paste0("Turkey/Morocco is always in my mind and in my memories / ",
           "Turkije/Marokko is altijd in gedachten/herinneringen"),
    paste0("I miss the people I left behind in Turkey/Morocco / Ik mis mensen ",
           "die ik achterliet in Turkije/Marokko"),
    "I am homesick / Ik heb heimwee"
  )
  for (i in seq_along(loss_labels)) {
    engine$label_variable(paste0("loss", i), loss_labels[[i]], yes_no)
  }

  engine$finalize()
}
