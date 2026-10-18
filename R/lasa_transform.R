# Long <-> wide reshaping of LASA data: `transform_lasa_data()` and the
# internal helpers behind it. `read_lasa_sav(format_as_long = TRUE)`
# (R/lasa_io.R) is a thin caller of `transform_lasa_data(format = "long")`.
#
# Wide format is how LASA stores information that spans waves (Z files such
# as lasazoa1.SAV): one row per respondent, one column per variable per wave
# (boak, coak, doak, ...), plus "stable" columns that hold for every wave
# (sex, byear, ...). Long format is how read_lasa_sav() returns a single
# wave file under `standardize`: one row per respondent per wave, the
# wave-stripped (canonical) variable name ("oak"), and a "Wave" column.
#
# Which columns are wave-specific is decided per column, in this order
# (`.lasa_wave_candidates()`):
#   1. the "LASA_wave"/"LASA_long_name" attributes transform_lasa_data()
#      attaches to the wide columns it creates whose name alone wouldn't
#      identify them;
#   2. lasa_label_db(): a documented wave-specific variable name (its
#      `variable_name` differs from its `canonical_name`), which also covers
#      LASA's irregular names (t2_dat, b_DM, b2oak, ...) -- or the
#      documented name the data's label report says the column was matched
#      to (fuzzy matching, `name_corrections`);
#   3. for wide data only (no "Wave" column, or a Z file's "Z"
#      placeholder): the naming pattern transform_lasa_data() uses for
#      wide columns (wave prefix + canonical name, or t<Time>_ + canonical
#      name), when the label database documents that canonical name for
#      that wave.
# Everything else is "stable" (one value per respondent).
#
# A name can be documented for several waves: LASA names the baseline of
# every cohort (B, 2B, 3B, MB, 4B) with the same "b" prefix. Each
# respondent's value is then placed at the wave the data show for that
# respondent (`.lasa_resolve_wide_columns()`): the row the value is on, the
# respondent's cohort, the data's provenance attributes, and only then a
# guess, with a message.
#
# "Time" counts the waves since each respondent's baseline (Time 0), along
# their cohort's own waves (`.lasa_cohort_times()`), so it needs the
# respondent's cohort, which the data must show (`.lasa_long_times()`).
#
# Round trips: every long column built from wide columns stores, per wave,
# the original wide column's name and whatever of its attributes the long
# column can't hold (attribute "LASA_wide_columns"), so wide -> long ->
# wide restores the original columns exactly as long as the long data
# weren't changed in a way that rules that out (see
# `.lasa_restore_wide_column()`).

## LASA's waves in calendar order, and the prefix each wave's variables
## carry in wide data. The later cohorts' baselines (2B, 3B, 4B, MB) all use
## the prefix "b" in LASA's own wave files, which would make their wide
## columns collide with wave B's; wide output keeps them apart as b2/b3/b4/mb,
## the convention LASA's own zoa2/zoa3 files use for 2B/3B. 4B and L are
## accepted by .lasa_parse_filename() but have no documentation yet.
.lasa_wave_table <- function() {
  data.frame(
    wave = c("A", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K", "4B", "L"),
    prefix = c("a", "b", "c", "d", "e", "b2", "f", "g", "h", "b3", "mb", "i", "j", "k", "b4", "l"),
    stringsAsFactors = FALSE
  )
}

## LASA's cohorts, named by their baseline wave.
.lasa_baselines <- c("B", "2B", "3B", "MB", "4B")

## The "Time" each cohort's waves have (a matrix: one row per wave of
## .lasa_wave_table(), one column per cohort; NA where the cohort doesn't
## take part): the number of waves since the cohort's baseline, which is 0.
## A cohort takes part in every wave after its baseline in calendar order,
## except the other cohorts' baselines. Wave A, the LSN pilot study a few
## months before wave B, isn't part of any cohort's waves.
.lasa_cohort_times <- function() {
  waves <- .lasa_wave_table()$wave
  times <- matrix(
    NA_integer_,
    nrow = length(waves), ncol = length(.lasa_baselines),
    dimnames = list(waves, .lasa_baselines)
  )
  for (baseline in .lasa_baselines) {
    after <- seq_along(waves) > match(baseline, waves) & !waves %in% c(.lasa_baselines, "A")
    own <- c(baseline, waves[after])
    times[own, baseline] <- seq_along(own) - 1L
  }
  times
}

## Waves only one cohort takes part in, each mapped to that cohort's
## baseline: waves B-E belong to the first cohort alone (the second cohort
## joined LASA at 2B, after wave E), and every later cohort's baseline is
## its own. From wave F on, cohorts share waves.
.lasa_cohort_of_wave <- c(
  B = "B", C = "B", D = "B", E = "B",
  `2B` = "2B", `3B` = "3B", MB = "MB", `4B` = "4B"
)

## LASA's cohorts as its cohort variable (LASAZ002.SAV's `cohort`) numbers
## them, by baseline: cohort 1 (B), 2 (2B), 3 (3B) -- and 4 (4B), which
## LASAZ002.SAV doesn't have yet. The migrant cohort (MB) has no number.
.lasa_cohort_numbers <- c(B = 1L, `2B` = 2L, `3B` = 3L, `4B` = 4L)

## The codes of the cohort column transform_lasa_data() makes (the order of
## its levels, see .lasa_cohort_column()): LASA's, and 5 for the migrant
## cohort.
.lasa_cohort_column_codes <- c(.lasa_cohort_numbers, MB = 5L)

## The cohort column's own wording for the cohorts LASAZ002.SAV doesn't
## have (see .lasa_cohort_column()), and its wording for all of them where
## the label database doesn't document LASAZ002.SAV's.
.lasa_cohort_texts <- c(
  B = "cohort 1", `2B` = "cohort 2", `3B` = "cohort 3", `4B` = "cohort 4", MB = "migrant cohort"
)

.lasa_wave_column_label <- "LASA measurement wave"
.lasa_time_column_label <- "LASA waves since the respondent's baseline (baseline = 0)"

## Attributes transform_lasa_data() manages itself. Wide columns it creates
## carry "LASA_wave"/"LASA_long_name" when their name alone doesn't say
## which wave and variable they hold, with "LASA_wide_name" the name they
## count for; long columns it builds from wide columns carry
## "LASA_wide_columns".
.lasa_transform_attrs <- c("LASA_wave", "LASA_long_name", "LASA_wide_name", "LASA_wide_columns")

## Attributes describing a vector's type rather than its content.
.lasa_structural_attrs <- c("names", "dim", "dimnames", "class", "levels", "tzone", "units")

#' Transform LASA data between long and wide format
#'
#' Reshapes LASA data between *wide* format -- one row per respondent, with
#' a separate column for each variable at each wave (`boak`, `coak`,
#' `doak`, ...), the way LASA's Z files (e.g. `LASAZOA1.SAV`) store
#' information that spans waves -- and *long* format: one row per
#' respondent per wave, one column per variable (`oak`), and a `"Wave"`
#' column saying which wave each row belongs to, the way [read_lasa_sav()]
#' returns a single wave file. Works on a file read by [read_lasa_sav()]
#' (`read_lasa_sav(format_as_long = TRUE)` calls it for you), on several
#' LASA files merged together, and on any data frame with a `respnr`
#' column.
#'
#' @param data A data frame or tibble with one respondent identifier column
#'   named `respnr` (in any capitalization), for example the result of
#'   [read_lasa_sav()], or several LASA files merged together. Long data
#'   also have a `"Wave"` column (in any capitalization) of LASA wave codes.
#' @param format `"long"` (the default) or `"wide"`: the format to transform
#'   `data` into.
#' @param prefix `"Wave"` (the default) or `"Time"`: what the names of
#'   wave-specific columns start with in wide format. Only used when
#'   `format = "wide"`; see Details.
#'
#' @details
#' **Long format** has one row per respondent per wave, with a `"Wave"`
#' column (the LASA wave code, e.g. `"B"`, `"2B"`, `"MB"`) and a `"Time"`
#' column right after `respnr`. Each wave-specific variable becomes one
#' column named after its wave-stripped (canonical) name, so `boak`, `coak`,
#' ... become `oak`. A respondent gets a row for each wave at which at least
#' one of the wave-specific columns has a value for them -- anything but
#' `NA` or blank text (which is how SPSS stores missing text), so a
#' missing-value code kept as a value (read with
#' `read_lasa_sav(keep_user_na = TRUE)`) counts too. Respondents of a
#' later cohort therefore only get rows for the waves before they joined
#' LASA where the data hold such a code for them, as LASA's Z files do
#' ("no observation birth cohorts 1938-1947"). A respondent without any
#' value at any wave keeps a row for every wave, so nobody disappears.
#' Rows are sorted by respondent (in order of first appearance) and wave,
#' except in long data without wide columns, which keep their order.
#'
#' **Time** counts the waves since the respondent's baseline, the wave at
#' which their cohort joined LASA, which is Time 0. A cohort takes part in
#' every later wave except the other cohorts' baselines:
#' * first cohort: B = 0, C = 1, D = 2, E = 3, F = 4, G = 5, H = 6, I = 7,
#'   J = 8, K = 9, L = 10;
#' * second cohort: 2B = 0, F = 1, G = 2, H = 3, I = 4, J = 5, K = 6, L = 7;
#' * third cohort and migrant cohort: 3B or MB = 0, I = 1, J = 2, K = 3,
#'   L = 4;
#' * fourth cohort: 4B = 0, L = 1.
#'
#' Wave A, the LSN pilot study a few months before wave B, isn't part of any
#' cohort's waves: its rows keep `"Wave"` `"A"` and have no Time (`NA`).
#' Time counts waves, not years, and it isn't LASA's own wave numbering,
#' which `LASAZ008.SAV` uses (`t2_dat` is wave B there); for time itself,
#' use the interview dates or ages in `LASAZ008.SAV`.
#'
#' A row's Time depends on the respondent's cohort, which the data show by:
#' * a value (other than `NA`, blank text, or a missing-value code) at the
#'   respondent's baseline or at a wave only their cohort takes part in (B
#'   to E for the first cohort);
#' * a single LASA file of such a wave, whose respondents all belong to its
#'   cohort, whatever their values (the data's `"LASA_file_code"` and
#'   `"LASA_wave"` attributes say which file; not a Z file, whose rows may
#'   hold codes for waves before a cohort joined): in long data all of whose
#'   rows are of that wave, any row, unless it holds nothing but values a
#'   guess put at its wave (see **Names of several waves**); in wide data
#'   (the file read with LASA's own names, `standardize = FALSE` in
#'   [read_lasa_sav()], or transformed to wide format), every respondent,
#'   as long as all columns are the file's (those its label report lists,
#'   and the names wide format gives columns of its wave) -- once other
#'   data are joined on, every respondent with a value in one of the file's
#'   columns (one the join added has none), also when the file in wide data
#'   was joined onto long data, keeping its attributes (as `dplyr`'s joins
#'   do with it first);
#' * LASA's `cohort` column, as `LASAZ002.SAV` and Time-prefixed wide data
#'   (see **Wide format**) have it: `"cohort 1 (1992)"` -- also written
#'   `"Cohort 1"` or `"cohort 1 (1992/1993)"` -- or its code 1 is the first
#'   cohort, whose baseline is B; cohort 2's is 2B, cohort 3's 3B, cohort
#'   4's 4B, and the `"migrant cohort"`'s MB;
#' * a `"Time"` column already in long data;
#' * the respondent number: LASA numbers its respondents with five digits,
#'   the first of which is 1, 2, or 3 in the first cohort, 4, 5, or 6 in
#'   the second cohort, and 7, 8, or 9 in the third. A 1 also numbers the
#'   LSN pilot study's respondents, so it only says the first cohort of a
#'   respondent the data show at a wave other than A, by a value there
#'   (rows that hold nothing but missing-value codes don't count). The
#'   fourth and the migrant cohort's numbers aren't known yet: if they have
#'   five digits too, they say one of the first three cohorts until the
#'   rest of the data show their own (their baseline file, say, or a
#'   `cohort` column). A number of any other form (the longer numbers the
#'   fourth cohort may have, or the small numbers of the examples below)
#'   says nothing. Where the rest of the data show another cohort than a
#'   respondent's number, they decide, with a warning in long and
#'   Time-prefixed wide format, which show the cohort -- also over a
#'   `"Time"` column that follows the number (as [read_lasa_sav()] gives
#'   it at waves several cohorts share).
#'
#' A missing-value code is what [read_lasa_sav()] turns into `NA` unless
#' `keep_user_na = TRUE`: an SPSS user-missing value; in a variable the
#' label database documents, any negative code, documented or not, except
#' in a variable whose values can be negative at that wave (such as the
#' speech-reception thresholds `msrttn`), where only its documented codes
#' are; and in any column, a negative code with a value label -- also as
#' the text or factor level read_lasa_sav() gives it (its label, or its own
#' number). Values show the cohort in the wave-specific variables the label
#' database documents (and long columns `transform_lasa_data()` made from
#' wide columns); in long data without any, in the columns whose values
#' differ between a respondent's rows (a variable computed per wave, say;
#' an `NA` counts as a value of its own), or else in all columns but the
#' documented stable variables; and in long data without such columns,
#' every row shows its wave. The waves from F on, which cohorts share,
#' don't show the cohort: the rows of a respondent seen only at those waves
#' get no Time, with a message, unless their respondent number or another
#' of the sources above shows it (or every cohort the data leave open gives
#' their wave the same Time). Data showing waves of several cohorts for one
#' respondent give that respondent no Time, with a warning.
#'
#' A `"Time"` column already in long data -- also the `Time.x`/`Time.y`
#' columns [merge()] makes of two, and the further copies merging more data
#' sets gives (`Time.x.x`, or several of the same name) -- must give each
#' row a Time that the respondent's cohort, as far as the rest of the data
#' show it, gives its wave, and copies must agree with each other, except
#' that a copy following the respondent number gives way to one that
#' doesn't (that of a file of a wave several cohorts share read on its
#' own, next to that of data that showed another cohort, say); it is
#' replaced by the recomputed one.
#'
#' A `cohort` column (in any capitalization) is LASA's when its values,
#' factor levels, or value labels name cohorts the way above, or when it
#' holds nothing but their codes (and missing values): LASA's codes 1 to 4,
#' and 5 for the migrant cohort, as Time-prefixed wide data code it, as
#' numbers, or as text or factor levels (`"4"`, the way [read_lasa_sav()]
#' reads a code the label database doesn't document) -- unless value labels
#' say they are something else (birth cohorts, say; labels of negative
#' missing-value codes aside). In a column whose value labels name cohorts,
#' a code without a value label names its cohort too, as does one labelled
#' with its own number (the level `"4"` in a `.sav` file). Any other
#' `cohort` column is an ordinary column. LASA's cohort column must give each
#' respondent one cohort, which the waves the data show must fit; values
#' that name no cohort (a missing-value code) say nothing. In long format,
#' it stays as it is; coded as Time-prefixed wide data have it (as
#' [read_lasa_sav()] reads `LASAZ002.SAV`'s), it gets back the labels
#' [merge()] and row subsetting drop. Several columns named `cohort` -- the
#' `cohort.x`/`cohort.y` columns of data sets with a `cohort` column merged
#' by `respnr` (`LASAZ002.SAV`, Time-prefixed wide data), the further
#' copies merging more of them gives (`cohort.x.x`, or several of the same
#' name), and columns whose names differ in capitalization only
#' (`LASAZ002.SAV`'s `COHORT` as [haven::read_sav()] reads it, next to
#' Time-prefixed wide data's `cohort`) -- are combined into one `cohort`,
#' coded as Time-prefixed wide data have it, and must agree. A copy that
#' names no cohort is another data set's own column, and stays as it is; a
#' column named `cohort` that names none, next to one that does, is an
#' error.
#'
#' **Stable variables** -- columns that hold for every wave, such as sex or
#' year of birth (`byear`) in `LASAZ004.SAV` -- keep one column and are
#' repeated on each of the respondent's rows: in long data, a stable
#' variable the label database documents is filled in on the respondent's
#' rows where it is missing (rows other files' columns added, or rows of
#' other waves merged in by `respnr` and `"Wave"`) from their other rows,
#' as long as those agree. A file without wave-specific columns, such as
#' `LASAZ004.SAV` or the migrant cohort's `LASMB004.SAV`, has no wave
#' dimension: it stays one row per respondent, without `"Wave"` and
#' `"Time"` columns, with a message.
#'
#' **Which columns are wave-specific** is decided per column: a column made
#' wide by `transform_lasa_data()` itself is recognized by its name, or by
#' attributes it carries where its name doesn't say enough (see **Wide
#' format**); any other column is wave-specific when [lasa_label_db()]
#' documents its name as a wave-specific variable -- which covers LASA's
#' irregular names too, such as `t2_dat` (`t_dat`, wave B), `b_dm` (`dm`),
#' `b2oak` (`oak`, wave 2B), or `totalalpha`, which LASA's wave H file uses
#' without a wave prefix, and a column [read_lasa_sav()] matched to such a
#' name by fuzzy matching or `name_corrections` -- or, for data that aren't
#' long yet (no `"Wave"` column, or one holding nothing but the `"Z"`
#' placeholder [read_lasa_sav()] gives a Z file and the missing values
#' merging with that file gives -- only missing values, too, in data with
#' one row per respondent), when its name is a wave prefix followed by a
#' variable the label database documents for that wave (the names wide
#' format uses, see below), by any wave-specific variable it documents if
#' the wave is 4B or L, which it doesn't document yet (`lhhnch`), or by a
#' variable LASA's wave files name without a wave prefix if the wave isn't
#' A (`kseh_reden`). All other columns are
#' treated as stable, including columns the label database doesn't know. A
#' warning names columns kept stable that look like wave-specific
#' variables: names a merge suffixed with `.x`/`.y`, and, in wide data,
#' variables read with their wave stripped from their name.
#'
#' In long data, a column named after a variable (its long-format name) is
#' that variable's long column, whose values stay at their rows' waves.
#' So is a column of a wave-specific name whose values are all on rows of
#' waves that name stands for: the waves the label database documents it
#' at, and the wave of the LASA file the data are (as far as the data's
#' label report lists the column) -- also where the label database doesn't
#' document the name at that wave, as for the files of waves 4B and L,
#' which it doesn't document yet -- and, for a name LASA's wave files use
#' without a wave prefix (`drinking`), those undocumented waves, any wave
#' once its values differ between a respondent's rows, and, in the data of
#' that name's LASA file (as far as the data's label report lists the
#' column; stacked files keep the first one's), the waves [lasa_topics()]
#' lists the file at that the label database doesn't document of it yet
#' (wave K for file 045's `seh_reden`), unless the file's wave-prefixed
#' columns are wide there (a wide file joined onto other long data). In the
#' data of a LASA file of wave L, a column the file's label report lists
#' named `l` followed by a wave-specific variable (`lhhnch`) is that variable's
#' long column too, so wave L's files become long as other waves' do. Wave
#' I's `immse01` to `immse23` are also the long names of the migrant
#' cohort's `bimmse01` to `bimmse23`: such a column is the migrant cohort's
#' long column when its values are on rows of wave MB (or its
#' `canonical_name` attribute says so), and wave I's column otherwise.
#'
#' **Names of several waves.** LASA's wave files name the baseline of every
#' cohort (B, 2B, 3B, MB, and 4B) with the same `b` prefix, so a name such
#' as `blphya01` may belong to any of them, and a few other names stand for
#' several waves too (`bqvalu16` for waves 3B and J, `xcancer1` for waves B
#' and C). Each respondent's value in such a column goes to the wave the
#' data show for that respondent: in long data, a value already on a row of
#' one of those waves stays there; otherwise, the respondent's cohort, as
#' far as the data (or else the respondent number) show it (the first
#' cohort has no wave 3B, so its respondents' `bqvalu16` is wave J's), and
#' then the file the column came from (the data's `"LASA_file_code"` and
#' `"LASA_wave"` attributes, as far as the data's label report lists the
#' column, since a merge keeps at most the first file's attributes). If
#' nothing says, the value goes, with a message naming the column, to the
#' first of these waves the respondent's cohort may take part in: the wave
#' the column's other respondents were placed at by their cohort, the wave
#' of the data's `"LASA_wave"` attribute, and the column's waves in
#' calendar order (and
#' for a name LASA's wave files use without a wave prefix, `drinking`, if
#' the respondent's cohort takes part in none of those: waves 4B and L,
#' which the label database doesn't document yet). Such a guess doesn't
#' count as showing the respondent's cohort, so it gives none of their
#' rows a Time unless something else, such as their respondent number,
#' shows the cohort (which may leave several of the column's waves open:
#' the third cohort takes part in both of `bqvalu16`'s) -- also when the
#' result is transformed again: the long
#' column remembers which of its values were placed by a guess, and wide
#' format gives those values one column, also when the guesses put them at
#' several waves, under a name that doesn't say the wave (its original
#' name, or else LASA's own, such as `blphya01`), so transforming that back
#' guesses again, with the message. The long column keeps that memory in
#' its attributes, which [rbind()], [merge()], `dplyr::bind_rows()`,
#' subsetting or sorting the rows of a data frame (rather than a tibble),
#' and writing the data to a `.sav` file can drop: after that, those values
#' count as showing the cohort of the wave they were put at. To avoid
#' guesses, transform each LASA file to long format before combining files
#' (with `format_as_long = TRUE` in [read_lasa_sav()]).
#'
#' One name stands for two variables at one wave: `bmmsesc1` is file 221's
#' `mmsesc` and file 421's `mmsesc1` at wave MB. The data's file (or the
#' column's `canonical_name` attribute) says which; otherwise it is taken
#' as the variable the name stands for at its other waves (`mmsesc1`), with
#' a message.
#'
#' **Merged files.** `data` may be several LASA files merged together, in
#' any of three shapes:
#' * long (the most reliable): files read with `format_as_long = TRUE`,
#'   which gives each file's rows their Time while the file still shows
#'   their cohort (in a baseline file, also rows holding nothing but
#'   missing-value codes), stacked per file code with `dplyr::bind_rows()`
#'   (or [rbind()], if the files have the same columns) and merged by
#'   `respnr` and `"Wave"` (with `all = TRUE`, to keep the rows of
#'   respondents missing from some files); the `Time.x` and `Time.y`
#'   columns that merge makes become one `"Time"` again, now also for the
#'   rows of files that didn't show the respondent's cohort on their own.
#'   Stacking and merging drop the columns' labels (or keep one file's for
#'   all rows), which `transform_lasa_data()` gives back (see **Labels**).
#'   A file without wave-specific columns (`LASAZ004.SAV`, `LASMB004.SAV`)
#'   read with `format_as_long = TRUE` has no `"Wave"` column: merge it by
#'   `respnr` alone;
#' * wide, e.g. `LASAB046.SAV`, `LASAC046.SAV`, `LASAB030.SAV`, ... read
#'   with `standardize = FALSE` and merged by `respnr` (with `all = TRUE`),
#'   or a Z file merged with `LASAZ004.SAV`. [merge()] drops the files'
#'   attributes (`dplyr`'s joins keep the first data set's), so the values
#'   in `b` columns of a respondent the data show nowhere else (one who
#'   dropped out after wave B, say) go to the baseline their respondent
#'   number says, or else are placed by a guess (see **Names of several
#'   waves**), which gives them no Time. So merge the baseline files of the
#'   migrant and the fourth cohort (`LASMB046.SAV`, `LAS4B046.SAV`), whose
#'   respondent numbers aren't known yet, in long format. Don't stack
#'   wide files of different cohorts that share column names (e.g.
#'   `LAS2B046.SAV` below `LASAB046.SAV`, or `LASAZDC2.SAV` below
#'   `LASAZDC1.SAV`): stack them in long format;
#' * a mix: long data that wide columns were merged into by `respnr`, for
#'   example a Z file's -- without the placeholder `"Wave"` column
#'   [read_lasa_sav()] gives a Z file, or the two `"Wave"` columns end up as
#'   `Wave.x` and `Wave.y`, which is an error. `format = "long"` moves each
#'   wide column's values to its wave's row, adding a row where a
#'   respondent has a value at a wave the long data don't have a row for
#'   yet. On those added rows, stable variables the label database
#'   documents (such as `sex`) are filled in from the respondent's other
#'   rows, and other columns are left missing, since they weren't measured
#'   at that wave.
#'
#' **Wide format** has one row per respondent and drops the `"Wave"` and
#' `"Time"` columns. Each wave-specific variable gets one column per wave
#' at which it has any value, and a long column made from wide columns gets
#' all of those columns back, also ones without any value. With
#' `prefix = "Wave"`, a column's name is its wave's lowercase LASA prefix
#' followed by the variable name: `boak`, `coak`, `doak`, ... Waves 2B, 3B,
#' 4B, and MB get the prefixes `b2`, `b3`, `b4`, and `mb` (as LASA's own
#' `zoa2`/`zoa3` files do for 2B and 3B), so they don't collide with wave
#' B's columns. Where LASA's own name for the variable at that wave stands
#' for nothing else, the column gets that name instead (`m15wrth` is
#' `bm15twtrh` at wave B and `c15wtrth` at wave C; `totalalpha`, wave H's
#' name without a wave prefix, stays `totalalpha`). A column that came from
#' a wide LASA file gets its original name back (e.g. `t2_dat` rather than
#' `bt_dat`), unless its values went to several waves or the name doesn't
#' say its wave by itself: the `b_dm` column of `LASAZDC2.SAV`, which holds
#' the second cohort's baseline, becomes `b2dm`.
#'
#' With `prefix = "Time"`, names are `t`, the `"Time"`, and an underscore
#' followed by the variable name: `t0_oak` holds each respondent's value at
#' their own baseline, `t1_oak` at their cohort's next wave (wave C for the
#' first cohort, F for the second), and so on, so the cohorts share
#' columns. A `cohort` column after `respnr` gives each respondent's
#' cohort, which transforming the data back to long format uses. It is
#' LASA's cohort variable the way [read_lasa_sav()] reads `LASAZ002.SAV`'s
#' -- a factor of its value labels (`"cohort 1 (1992)"`, `"cohort 2
#' (2002)"`, `"cohort 3 (2012)"`), with its labels -- so the result merges
#' with that file by `respnr` and `cohort`, read with `to_factor = TRUE`
#' (the default); read with `to_factor = FALSE`, merge it by `respnr`
#' alone (the `cohort.x` and `cohort.y` columns that gives are combined,
#' see above). The fourth cohort, whose code 4 the label database doesn't
#' document yet, gets the level `"4"`, as [read_lasa_sav()] reads that
#' code, and the migrant cohort, which `LASAZ002.SAV` doesn't have, the
#' level `"migrant cohort"` after it. These levels come where the data have
#' respondents of these cohorts -- `"4"` also with only the migrant
#' cohort's -- so that each cohort keeps its code (1 to 5) when the factor
#' becomes numbers (in a `.sav` file, say). The column replaces a `cohort`
#' column `data` have, which must then be LASA's: any other column named
#' `cohort` (in any capitalization) is an error, so rename it first. Wave
#' A, which has no Time, keeps its own column (`aoak`). Every other value
#' needs a Time: values at a wave without one for their respondent are an
#' error, except missing-value codes, which are left out with a message. A
#' respondent whose rows have a Time while the data leave their cohort
#' open (rows of waves I to L only, which the third and the migrant cohort
#' give the same Time, of a respondent whose number doesn't say the
#' cohort, or says one the data rule out) gets a missing `cohort`, with a
#' warning: their columns can't be transformed back, also not by their
#' respondent number. A column holding several cohorts' waves (`t0_oak`: B,
#' 2B, ...) gets those waves' types, value labels and user-missing codes,
#' combined the way long format combines waves, with a warning where their
#' user-missing codes don't combine, and their `"wave_label"`/`"labels_wave"`
#' as one entry per wave.
#' Original names aren't kept with `prefix = "Time"`, also not when such
#' data are made wide again with `prefix = "Wave"`.
#'
#' A column stays stable in wide format when it has a single value per
#' respondent and isn't a documented wave-specific variable; a documented
#' stable variable (such as `sex`) only needs to agree across the rows
#' where it isn't missing. A wide column whose name still doesn't say which
#' wave and variable it holds (a name the label database doesn't document,
#' or a wave B name the later cohorts' baselines share, such as
#' `blphya01`, and, in a result with wave 4B, whose files use the
#' baselines' `b` names, any baseline's `b` name) carries the attributes
#' `"LASA_wave"` and `"LASA_long_name"`, which transforming it back uses,
#' also without the result's other columns. Base R's [merge()] and row
#' subsetting drop those attributes from factor and numeric columns
#' (haven's labelled columns keep them); the column is then placed like a
#' column of LASA's own files, see **Names of several waves**.
#'
#' **Labels** travel with the data. A long column keeps each wave's own
#' `"wave_label"`/`"labels_wave"` as one entry per wave. Its variable label
#' is the one its waves share, or else their harmonized (cross-wave)
#' label, or else the first wave's. Its value labels are those of all
#' waves combined; if a code is labelled differently at different waves,
#' it gets the harmonized value labels, or none. SPSS user-missing codes
#' (`"na_values"`, `"na_range"`) are combined as long as that marks exactly
#' the same values missing on every wave's rows; otherwise the long column
#' gets none, with a warning. Factor levels are combined across waves;
#' wave-specific columns whose types don't combine (e.g. a factor at one
#' wave and numbers at another) become text, without value labels or
#' user-missing codes, with a warning. Time spans (`difftime`) get a unit
#' every wave's values convert to exactly, the first wave's if possible;
#' date-times that become text are written in UTC
#' (`"2021-10-31 00:30:00+0000"`), so they read back as the same moment.
#' Converting back to wide restores each wide column's original type (also
#' from text), attributes, and user-missing codes, as long as its values
#' still fit them.
#'
#' In long data, the column of a wave-specific variable the label database
#' documents that has lost its labels -- [rbind()], `dplyr::bind_rows()`
#' and [merge()] drop them from factor and numeric columns, and [rbind()]
#' keeps one file's for all rows of labelled columns -- gets back the
#' labels [read_lasa_sav()] gives the variable at each wave it has values
#' at, from the label database: `"wave_label"`/`"labels_wave"` with an
#' entry per wave, `"canonical_name"`, the harmonized label and value
#' labels where the database has them, and as `"label"` and `"labels"`
#' the harmonized ones, or else the waves' shared (or first) wording and
#' all their value labels. The data then get a `"variable.labels"`
#' attribute too, if they had none. So does a long column made of wide
#' columns that have all lost their labels (wide files merged with
#' [merge()]); wide format gives those columns back as they were. Labels
#' of a column's own (not ones the database gives the variable, such as a
#' user's own wording) are kept as they are, and a column with
#' `"wave_label"` entries for some of its waves only gets the other
#' waves', as long as those it has are the database's. A wave at which the
#' database documents the variable with different labels in several files
#' (`partner` at wave MB) gets none.
#'
#' @return `data` in the requested format, as a data frame (or a tibble if
#'   `data` is one), keeping `data`'s provenance attributes. Its
#'   `"LASA_wave"` attribute is updated to the data's single wave if there
#'   is only one, removed from long data that span several waves, and
#'   `"Z"` for wide data that span several waves (as for a Z file). Long
#'   data that span several waves can't be relabelled with
#'   [apply_lasa_labels()], which labels one file and wave at a time:
#'   label each file before transforming it.
#'
#' @seealso [read_lasa_sav()] (`format_as_long`), [apply_lasa_labels()],
#'   [lasa_label_db()]
#' @export
#'
#' @examples
#' # A Z-file-shaped data frame: knee osteoarthritis (oak) of two
#' # respondents of the first cohort (waves B, C, and F) and one of the
#' # second (waves 2B and F), plus a stable variable (sex).
#' wide <- data.frame(
#'   respnr = c(101, 102, 201),
#'   sex = c(1, 2, 2),
#'   boak = c(0, 2, NA),
#'   coak = c(1, 8, NA),
#'   b2oak = c(NA, NA, 1),
#'   foak = c(2, NA, 0)
#' )
#'
#' # format = "long" is the default. Time counts the waves since each
#' # respondent's own baseline: wave F is Time 4 for the first cohort, but
#' # Time 1 for the second.
#' long <- transform_lasa_data(wide)
#' long
#'
#' # And back again, with wave letters or Time numbers as prefixes:
#' transform_lasa_data(long, format = "wide")
#' transform_lasa_data(long, format = "wide", prefix = "Time")
#'
#' \dontrun{
#' # Read a Z file straight into long format:
#' oa <- read_lasa_sav("LASAZOA1.SAV", format_as_long = TRUE)
#' }
transform_lasa_data <- function(data, format = "long", prefix = "Wave") {
  if (!is.data.frame(data)) {
    stop("'data' must be a data frame.", call. = FALSE)
  }
  format <- .lasa_match_choice(format, c("long", "wide"), "format")
  prefix <- .lasa_match_choice(prefix, c("Wave", "Time"), "prefix")
  copies <- .lasa_unique_copies(data)
  data <- copies$data
  .lasa_check_transform_columns(data)

  db_info <- .lasa_transform_db_info()

  if (identical(format, "long")) {
    return(.lasa_to_long(data, db_info, renamed = copies$renamed)$data)
  }

  # Wide output always goes through long format first, so wide columns of
  # any origin (and any already-long rows they were merged into) are
  # combined before being spread out again under one naming convention.
  long <- .lasa_to_long(
    data, db_info, for_wide = TRUE, renamed = copies$renamed, warn_numbers = identical(prefix, "Time")
  )
  if (!"Wave" %in% names(long$data)) {
    # No wave dimension at all (e.g. LASAZ004.SAV): already wide.
    return(long$data)
  }
  .lasa_to_wide(long$data, prefix, db_info, added = long$added, baseline = long$baseline)
}

## Validates a scalar choice case-insensitively and returns its canonical
## spelling from `choices`.
.lasa_match_choice <- function(x, choices, argument) {
  if (!is.character(x) || length(x) != 1L || is.na(x) || !tolower(x) %in% tolower(choices)) {
    stop(
      "'", argument, "' must be ",
      paste0('"', choices, '"', collapse = " or "), ".",
      call. = FALSE
    )
  }
  choices[[match(tolower(x), tolower(choices))]]
}

## Whether each of `names` is the long format's "Time" column or a copy
## merge() made of it: "Time.x" and "Time.y", and the further copies that
## merging more data sets with a "Time" column gives ("Time.x.x", ...).
.lasa_is_time_copy <- function(names) {
  grepl("^Time(\\.x|\\.y)*(\\.\\.\\.[0-9]+)?$", names)
}

## Whether each of `names` is a copy merge() made of a "cohort" column (in
## any capitalization) -- that of Time-prefixed wide data, or LASA's own,
## as in LASAZ002.SAV: "cohort.x" and "cohort.y", and the further copies
## that merging more data sets with a "cohort" column gives ("cohort.x.x",
## or several of the same name).
.lasa_is_cohort_copy <- function(names) {
  grepl("^cohort((\\.x|\\.y)+(\\.\\.\\.[0-9]+)?|\\.\\.\\.[0-9]+)$", names, ignore.case = TRUE)
}

## Base R's merge() of four or more data sets with a "Time" or a "cohort"
## column gives several columns named "Time.x" and "Time.y" (or "cohort.x"
## and "cohort.y"). Time copies in long data (with a "Wave" column) are
## only ever dropped for the recomputed "Time", and cohort copies are
## combined into one "cohort" (see .lasa_combine_cohort_copies()), so they
## get unique names to be read by. Returns list(data, renamed): `renamed`
## gives the columns of a repeated name (by their new names) their names
## and positions in `data`, for messages (see .lasa_show_column()).
.lasa_unique_copies <- function(data) {
  copy <- .lasa_is_cohort_copy(names(data))
  if (any(tolower(names(data)) == "wave")) copy <- copy | .lasa_is_time_copy(names(data))
  repeated <- copy & names(data) %in% names(data)[copy][duplicated(names(data)[copy])]
  if (!any(repeated)) return(list(data = data, renamed = .lasa_no_renamed))
  original <- names(data)[repeated]
  names(data)[copy] <- make.unique(names(data)[copy], sep = "...")
  list(
    data = data,
    renamed = list(
      original = stats::setNames(original, names(data)[repeated]),
      position = stats::setNames(which(repeated), names(data)[repeated])
    )
  )
}

## No columns renamed by .lasa_unique_copies().
.lasa_no_renamed <- list(original = character(0), position = integer(0))

## How messages name column `name`, followed by `noun`: by the name the
## user's data gave it, with its position where several columns had that
## name (see .lasa_unique_copies()).
.lasa_show_column <- function(name, renamed, noun = "") {
  i <- match(name, names(renamed$original))
  if (is.na(i)) return(paste0("'", name, "'", noun))
  paste0("'", renamed$original[[i]], "'", noun, " (column ", renamed$position[[i]], ")")
}

## Stops with the error for duplicated column names if any of `names` had
## a name several columns of the user's data had (see
## .lasa_unique_copies()).
.lasa_stop_repeated <- function(names, renamed) {
  repeated <- intersect(names, names(renamed$original))
  if (length(repeated) == 0L) return(invisible(NULL))
  stop(
    "'data' has duplicated column names: ", paste(unique(renamed$original[repeated]), collapse = ", "), ".",
    call. = FALSE
  )
}

.lasa_check_transform_columns <- function(data) {
  if (anyDuplicated(names(data)) > 0L) {
    stop(
      "'data' has duplicated column names: ",
      paste(unique(names(data)[duplicated(names(data))]), collapse = ", "), ".",
      call. = FALSE
    )
  }
  unsupported <- names(data)[vapply(
    data,
    function(x) is.list(x) || !is.null(dim(x)),
    logical(1)
  )]
  if (length(unsupported) > 0L) {
    stop(
      "transform_lasa_data() supports plain vector columns only; these are lists, ",
      "matrices, or data frames: ", paste(unsupported, collapse = ", "), ".",
      call. = FALSE
    )
  }
  invisible(NULL)
}

## A hashed lookup table (an environment) of the named list `values`, so
## that looking up one of thousands of names takes constant time.
.lasa_hash <- function(values) {
  keep <- !is.na(names(values)) & nzchar(names(values))
  list2env(values[keep], hash = TRUE)
}

## A hashed set of the strings `keys`.
.lasa_hash_set <- function(keys) {
  keys <- unique(keys[!is.na(keys) & nzchar(keys)])
  .lasa_hash(stats::setNames(as.list(rep(TRUE, length(keys))), keys))
}

## The entry of hashed table `table` for the string `key` (NULL if none).
.lasa_lookup <- function(table, key) {
  if (is.null(table) || !is.character(key) || length(key) != 1L || is.na(key) || !nzchar(key)) {
    return(NULL)
  }
  table[[key]]
}

.lasa_has <- function(table, key) !is.null(.lasa_lookup(table, key))

## The last result of .lasa_transform_db_info(), with the label database
## and LASA topic overview it was computed from.
.lasa_transform_cache <- new.env(parent = emptyenv())

## Everything transform_lasa_data() needs from lasa_label_db() (and the
## topic overview behind lasa_topics()), computed once per label database
## (cached in .lasa_transform_cache, and computed again when the database
## changes). All names lowercase; the sets are hashed (.lasa_has()).
##   wide_rows      documented wave-specific names: vn, cn, fc (normalized
##                  file code), wave, `prefixed` -- whether vn differs from
##                  cn (the wave-prefixed names, also LASA's irregular
##                  ones), or is one of the names LASA's wave files use
##                  without a wave prefix (file 435's xcancer1 at B and C,
##                  file 233's totalalpha at H) -- and `z_file`, whether
##                  it is a Z (or MB Z) file's; `wide_index` gives their
##                  row numbers by vn.
##   wave_names     the wave-prefixed names of each "<canonical>\r<wave>".
##   file_names     the canonical name of each "<file code>\r<wave>\r<name>"
##                  of a wave file's name without a wave prefix that isn't
##                  in wide_rows because it is also the canonical name of
##                  wave-prefixed names (MB file 048's partner).
##   documented     every documented name, wave-specific or canonical.
##   canonical      the canonical names of wave-prefixed and of stable
##                  variables: in long data, such a name is a long column.
##   canonical_wave "<canonical>\r<wave>" for every documented pair.
##   time_varying   canonical names of wave-specific variables.
##   stable         canonical names only ever documented as Z/MB-file
##                  variables without a wave prefix (sex, byear, aedu, ...).
##   baseline_stems canonical names of the "b" names of the baselines' wave
##                  files, which wave 4B's files use too.
##   unprefixed_stems
##                  canonical names of the names LASA's wave files use
##                  without a wave prefix (wide_rows that aren't `prefixed`).
##   file_gaps      per file code, the waves LASA's topic overview lists
##                  the file at that the database documents none of the
##                  file's variables at yet (file 045 at K).
##   missing_codes, missing_labels
##                  per variable or canonical name, the codes and value-label
##                  texts LASA marks as missing-value codes (is_missing: its
##                  negative codes), as numbers and as text (the factor
##                  levels or text read_lasa_sav() may turn them into).
##   signed         the variable and canonical names of the variables whose
##                  values can be negative (can_be_negative: msrttn's dB
##                  thresholds, say), by themselves (at any of their waves)
##                  and as "<name>\r<wave>" (at that wave).
##   cohort_codes   LASA's cohort variable (LASAZ002.SAV's cohort) as
##                  read_lasa_sav() reads its codes 1 to 4 (a code the
##                  database doesn't document reads as its own number), for
##                  the cohort column of Time-prefixed wide data
##                  (.lasa_cohort_column()); NULL if that fails.
.lasa_transform_db_info <- function() {
  db <- .lasa_load_label_db()
  topic_db <- .lasa_topic_database()
  if (!is.null(.lasa_transform_cache$info) && identical(.lasa_transform_cache$db, db) &&
    identical(.lasa_transform_cache$topics, topic_db)) {
    return(.lasa_transform_cache$info)
  }
  v <- db$variables
  vn <- tolower(v$variable_name)
  cn <- tolower(v$canonical_name)
  missing_cn <- is.na(cn) | !nzchar(cn)
  cn[missing_cn] <- vn[missing_cn]
  fc <- .lasa_normalize_filecode(v$filecode)
  wave <- toupper(v$wave)

  prefixed <- vn != cn
  z_file <- grepl("^(z|mb)", fc)
  z_stable <- !prefixed & z_file
  # A wave file's name without a wave prefix is still that wave's variable,
  # unless it is also the canonical name of wave-prefixed names (MB file
  # 048's partner, which Z file z010 has as apartner, bpartner, ...) or of
  # a stable variable.
  unprefixed <- !prefixed & !z_file & !cn %in% cn[prefixed | z_stable]
  wide <- prefixed | unprefixed
  # The others are only that wave's variable in their own file.
  own_file <- !prefixed & !z_file & !unprefixed & cn %in% cn[prefixed]
  wide_rows <- data.frame(
    vn = vn[wide], cn = cn[wide], fc = fc[wide], wave = wave[wide], prefixed = prefixed[wide],
    z_file = z_file[wide],
    stringsAsFactors = FALSE
  )
  time_varying <- unique(cn[!z_stable])
  stem_wave <- paste(cn, wave, sep = "\r")

  override_names <- tolower(db$manual_overrides$variables$variable_name)
  # A local database saved before can_be_negative existed lacks it.
  signed <- v$can_be_negative %in% TRUE

  # Missing-value codes, by the variable's own and its canonical name.
  vl <- db$value_labels
  vl_names <- tolower(vl$variable_name)
  vl_canonical <- cn[match(
    paste(.lasa_normalize_filecode(vl$filecode), toupper(vl$wave), vl_names, sep = "\r"),
    paste(fc, wave, vn, sep = "\r")
  )]
  harmonized <- db$value_labels_harmonized
  codes <- data.frame(
    name = c(vl_names, vl_canonical, tolower(harmonized$canonical_name)),
    code = c(vl$value_numeric, vl$value_numeric, harmonized$value_numeric),
    text = c(vl$value_label, vl$value_label, harmonized$value_label),
    missing = c(vl$is_missing, vl$is_missing, harmonized$is_missing) %in% TRUE,
    stringsAsFactors = FALSE
  )
  codes <- codes[!is.na(codes$name), , drop = FALSE]
  missing_of <- function(column) {
    key <- paste(codes$name, codes[[column]], sep = "\r")
    # A code or text also used as a regular value of the same name isn't
    # one.
    keep <- codes$missing & !is.na(codes[[column]]) & !key %in% key[!codes$missing] & !duplicated(key)
    .lasa_hash(split(codes[[column]][keep], codes$name[keep]))
  }

  # Long-format names of the "b" names of the baselines' wave files, which
  # wave 4B's files use too.
  in_baseline_file <- wide_rows$wave %in% c("B", "2B", "3B", "MB") & startsWith(wide_rows$vn, "b") &
    !wide_rows$z_file

  # What read_lasa_sav() labels each variable with at each wave, for long
  # columns that lost their labels (.lasa_restore_db_labels()): a code
  # listed without wording is named after its own number.
  value_rows <- !is.na(vl$value_numeric)
  vl_key <- paste(.lasa_normalize_filecode(vl$filecode), toupper(vl$wave), vl_names, sep = "\r")
  harmonized_rows <- !is.na(harmonized$value_numeric)
  harmonized_key <- paste(
    .lasa_normalize_filecode(harmonized$filecode), tolower(harmonized$canonical_name), sep = "\r"
  )
  labels <- list(
    rows = .lasa_hash(split(seq_len(nrow(v)), stem_wave)),
    canonical_name = ifelse(missing_cn, v$variable_name, v$canonical_name),
    variable_label = v$variable_label,
    harmonized_label = v$harmonized_var_label,
    value_key = paste(fc, wave, vn, sep = "\r"),
    harmonized_key = paste(fc, cn, sep = "\r"),
    value_maps = .lasa_hash(split(.lasa_value_map(vl[value_rows, , drop = FALSE]), vl_key[value_rows])),
    harmonized_maps = .lasa_hash(split(
      .lasa_value_map(harmonized[harmonized_rows, , drop = FALSE]), harmonized_key[harmonized_rows]
    ))
  )

  # The waves LASA's topic overview lists each file at, against those the
  # database documents any of the file's variables at.
  topics <- topic_db[!is.na(topic_db$filecode), , drop = FALSE]
  topic_waves <- lapply(split(topics$waves, .lasa_normalize_filecode(topics$filecode)), function(w) {
    unique(toupper(trimws(unlist(strsplit(w, ",", fixed = TRUE)))))
  })
  file_waves <- lapply(split(wave, fc), unique)
  file_gaps <- lapply(stats::setNames(nm = names(topic_waves)), function(f) {
    setdiff(topic_waves[[f]], c("A", file_waves[[f]]))
  })

  info <- list(
    wide_rows = wide_rows,
    labels = labels,
    baseline_stems = .lasa_hash_set(wide_rows$cn[in_baseline_file]),
    wide_index = .lasa_hash(split(seq_len(nrow(wide_rows)), wide_rows$vn)),
    wave_names = .lasa_hash(split(vn[prefixed], stem_wave[prefixed])),
    file_names = .lasa_hash(as.list(stats::setNames(
      cn[own_file], paste(fc[own_file], wave[own_file], vn[own_file], sep = "\r")
    ))),
    documented = .lasa_hash_set(c(vn, cn, override_names)),
    canonical = .lasa_hash_set(c(cn[prefixed], cn[z_stable])),
    canonical_wave = .lasa_hash_set(stem_wave),
    time_varying = .lasa_hash_set(time_varying),
    unprefixed_stems = .lasa_hash_set(wide_rows$cn[!wide_rows$prefixed]),
    file_gaps = .lasa_hash(file_gaps[lengths(file_gaps) > 0L]),
    stable = .lasa_hash_set(setdiff(unique(cn[z_stable]), time_varying)),
    missing_codes = missing_of("code"),
    missing_labels = missing_of("text"),
    signed = .lasa_hash_set(c(vn[signed], cn[signed], paste(c(vn[signed], cn[signed]), wave[signed], sep = "\r"))),
    cohort_codes = tryCatch(
      suppressWarnings(suppressMessages(.lasa_apply_labels(
        data.frame(respnr = seq_along(.lasa_cohort_numbers), cohort = as.numeric(.lasa_cohort_numbers)),
        filecode = "z002", wave = "Z"
      )$cohort)),
      error = function(e) NULL
    )
  )
  .lasa_transform_cache$db <- db
  .lasa_transform_cache$topics <- topic_db
  .lasa_transform_cache$info <- info
  info
}

## The respondent-identifier column's name.
.lasa_find_respnr <- function(data) {
  hits <- names(data)[tolower(names(data)) == "respnr"]
  if (length(hits) == 0L) {
    stop(
      "transform_lasa_data() needs a respondent identifier column named ",
      "'respnr' (in any capitalization).",
      call. = FALSE
    )
  }
  if (length(hits) > 1L) {
    stop(
      "'data' has more than one respondent identifier column: ",
      paste(hits, collapse = ", "), ".",
      call. = FALSE
    )
  }
  hits
}

## The wave column: list(name, placeholders). `name` is "Wave" in any
## capitalization, or NULL if there is none. Copies merge() made of it
## ("Wave.x"/"Wave.y") are fine when they only hold the "Z" placeholder of
## Z files (`placeholders`, to drop); otherwise two data sets with a "Wave"
## column were merged by respondent alone, which mixes up their waves.
.lasa_find_wave <- function(data) {
  lower <- tolower(names(data))
  hits <- names(data)[lower == "wave"]
  if (length(hits) > 1L) {
    stop(
      "'data' has more than one wave column: ", paste(hits, collapse = ", "), ".",
      call. = FALSE
    )
  }
  if (length(hits) == 1L) return(list(name = hits, placeholders = character(0)))
  copies <- names(data)[grepl("^wave(\\.x|\\.y|\\.\\.\\.[0-9]+)$", lower)]
  placeholders <- vapply(copies, function(name) {
    codes <- .lasa_normalize_wave_codes(data[[name]])
    all(is.na(codes) | codes == "Z")
  }, logical(1))
  if (length(copies) > 0L && !all(placeholders)) {
    stop(
      "'data' has ", paste(copies, collapse = ", "), " instead of one 'Wave' column, ",
      "as merging two data sets that both have a 'Wave' column by respnr alone gives. ",
      "Merge long data by respnr and Wave. A file without wave-specific columns (a Z file ",
      "such as LASAZ004.SAV, or LASMB004.SAV) has no wave dimension: read it with ",
      "format_as_long = TRUE, which leaves it without a 'Wave' column, or drop its 'Wave' ",
      "column, and merge it by respnr alone.",
      call. = FALSE
    )
  }
  list(name = NULL, placeholders = copies)
}

## Wave codes as uppercase text, whatever the "Wave" column's type.
.lasa_normalize_wave_codes <- function(x) {
  if (is.factor(x)) x <- as.character(x)
  x <- as.character(unclass(x))
  attributes(x) <- NULL
  toupper(trimws(x))
}

## Checks the wave codes of long data, which must all be real LASA waves.
.lasa_check_wave_codes <- function(codes, wave_name = "Wave") {
  if (anyNA(codes) || any(!nzchar(codes))) {
    stop(
      "The '", wave_name, "' column has missing values; every row of long data needs a wave.",
      call. = FALSE
    )
  }
  known <- .lasa_wave_table()$wave
  if ("Z" %in% codes) {
    stop(
      "The '", wave_name, "' column mixes \"Z\" (a Z file's placeholder) with real waves. ",
      "Transform the Z file to long format first, then combine it with the other data.",
      call. = FALSE
    )
  }
  unknown <- setdiff(unique(codes), known)
  if (length(unknown) > 0L) {
    stop(
      "Unknown LASA wave code(s) in the '", wave_name, "' column: ", paste(unknown, collapse = ", "),
      ". Expected one of ", paste(known, collapse = ", "), ".",
      call. = FALSE
    )
  }
  invisible(codes)
}

## The long format's own Time column(s) in `data`: "Time", and the copies
## merge() makes of it (see .lasa_is_time_copy()). transform_lasa_data()
## computes Time itself, so data that aren't long yet can't have a "Time"
## column. In long data, its values must be Times some cohort's numbering
## gives the row's wave, and copies must agree -- except that a Time
## following the cohort the respondent number gives (.lasa_id_cohorts()),
## as read_lasa_sav() gives it at waves several cohorts share, gives way to
## another copy's, as it gives way to the rest of the data (see
## .lasa_possible_cohorts()); they help tell which cohort a respondent is
## of, and the columns are replaced by the recomputed one. `row_ids` names
## each row's respondent in errors (and holds their respondent numbers).
## Returns list(names, values): the columns to drop, and each row's Time
## (NA if none; NULL without a Time column).
.lasa_existing_time <- function(data, long_mode, wave_codes, row_ids, renamed = .lasa_no_renamed) {
  found <- names(data)[.lasa_is_time_copy(names(data))]
  if (!long_mode) {
    if ("Time" %in% found) {
      stop(
        "'data' has no wave dimension yet but already has a 'Time' column; long format ",
        "constructs its own 'Time' column, so rename or drop it first.",
        call. = FALSE
      )
    }
    return(list(names = character(0), values = NULL))
  }
  if (length(found) == 0L) return(list(names = character(0), values = NULL))

  times <- .lasa_cohort_times()[wave_codes, , drop = FALSE]
  values <- rep(NA_real_, nrow(data))
  given_by <- rep(NA_character_, nrow(data))
  by_id <- .lasa_id_cohorts(row_ids)
  ## Whether `time` is the Time of rows `rows` that the cohort their
  ## respondent number gives gives their wave.
  follows_number <- function(rows, time) {
    if (is.null(by_id)) return(rep(FALSE, length(rows)))
    number <- by_id[rows, , drop = FALSE]
    fits <- times[rows, , drop = FALSE] == time
    rowSums(!number) > 0L & rowSums(number & !is.na(fits) & fits) > 0L
  }
  for (name in found) {
    x <- data[[name]]
    text <- if (is.factor(x)) as.character(x) else .lasa_bare(x)
    # Blank text is how SPSS stores a missing text value.
    if (is.character(text)) text[!is.na(text) & !nzchar(trimws(text))] <- NA_character_
    numbers <- suppressWarnings(as.numeric(text))
    fits <- rowSums(times == numbers, na.rm = TRUE) > 0L
    wrong <- !is.na(text) & (is.na(numbers) | !fits)
    if (any(wrong)) {
      i <- which(wrong)[[1L]]
      own <- sort(unique(times[i, !is.na(times[i, ])]))
      expected <- if (length(own) == 0L) {
        "which has no Time"
      } else {
        paste0(
          "where Time is ", paste(own, collapse = " or "),
          if (length(own) > 1L) ", depending on the cohort"
        )
      }
      stop(
        "'data' has a ", .lasa_show_column(name, renamed, " column"), " that doesn't match its waves (e.g. ", text[[i]],
        " at wave ", wave_codes[[i]], ", ", expected, "). Long format constructs its own ",
        "'Time' column from the waves, so rename or drop it first.",
        call. = FALSE
      )
    }
    disagree <- which(!is.na(numbers) & !is.na(values) & numbers != values)
    old_follows <- follows_number(disagree, values[disagree])
    new_follows <- follows_number(disagree, numbers[disagree])
    replaced <- disagree[old_follows & !new_follows]
    values[replaced] <- numbers[replaced]
    given_by[replaced] <- name
    stuck <- disagree[old_follows == new_follows]
    if (length(stuck) > 0L) {
      i <- stuck[[1L]]
      stop(
        "'data' has Time columns that disagree: for respondent ", row_ids[[i]], " at wave ",
        wave_codes[[i]], ", ", .lasa_show_column(given_by[[i]], renamed), " says ", values[[i]], " and ",
        .lasa_show_column(name, renamed), " says ", numbers[[i]], ", so the data sets merged into 'data' ",
        "put the respondent in different cohorts. Long format constructs its own 'Time' column from ",
        "the waves; drop these columns to have it computed from the data alone.",
        call. = FALSE
      )
    }
    new <- is.na(values) & !is.na(numbers)
    values[new] <- numbers[new]
    given_by[new] <- name
  }
  list(names = found, values = values)
}

## The cohort (by its baseline wave) each of the texts `text` names, the way
## LASA's cohort variable (LASAZ002.SAV's cohort) and the cohort column of
## Time-prefixed wide data name them: "cohort 1 (1992)" -- also without the
## years, capitalized, or "cohort 1 (1992/1993)" -- is the first cohort,
## whose baseline is B; cohort 2's is 2B, cohort 3's 3B, and cohort 4's 4B;
## "migrant cohort" is the migrant cohort's (MB). NA for anything else.
.lasa_cohort_of_text <- function(text) {
  hits <- regmatches(text, regexec("^\\s*cohort\\s*([0-9]+)", text, ignore.case = TRUE))
  number <- vapply(hits, function(hit) if (length(hit) == 2L) as.numeric(hit[[2L]]) else NA_real_, numeric(1))
  out <- names(.lasa_cohort_numbers)[match(number, .lasa_cohort_numbers)]
  out[!is.na(text) & grepl("^\\s*migrant", text, ignore.case = TRUE)] <- "MB"
  out
}

## The cohort (by baseline wave, see .lasa_cohort_of_text()) each element of
## column `x` names: by its text, a factor's level, or a code's value label;
## and by its code (.lasa_cohort_column_codes: LASA's codes 1 to 4, and 5,
## the migrant cohort's in the cohort column transform_lasa_data() makes) a
## plain number, and a level, text, or value without a value label (or with
## its own number for one) that is a code -- as read_lasa_sav() reads a
## code the label database doesn't document (LASAZ002.SAV's 4, say), by its
## own number, and haven::write_sav() writes that level. NA for anything else
## (a missing value or missing-value code). NULL when `x` names no cohort at
## all -- none of its values, levels, or value labels does, and it holds
## other things than codes too (negative missing-value codes aside), or has
## value labels for codes that are no missing-value codes (birth cohorts,
## say) -- which makes it an ordinary column. Attribute "says" holds each
## element as text.
.lasa_cohort_codes <- function(x) {
  values <- .lasa_bare(x)
  of_code <- function(number) names(.lasa_cohort_column_codes)[match(number, .lasa_cohort_column_codes)]
  ## Whether `number` holds codes, and nothing else but NA and negative
  ## missing-value codes.
  codes_only <- function(number) {
    present <- !is.na(number) & number >= 0
    any(present) && all(number[present] %in% .lasa_cohort_column_codes)
  }
  ## The cohorts that texts `text` name, or that those holding a code have:
  ## NULL if none names one, unless all are codes (or missing).
  of_texts <- function(text) {
    named <- .lasa_cohort_of_text(text)
    number <- suppressWarnings(as.numeric(text))
    if (all(is.na(named))) {
      blank <- is.na(text) | !nzchar(trimws(text))
      if (!all(blank | !is.na(number)) || !codes_only(number)) return(NULL)
    }
    ifelse(is.na(named), of_code(number), named)
  }
  if (is.factor(x)) {
    of_level <- of_texts(levels(x))
    if (is.null(of_level)) return(NULL)
    return(structure(of_level[values], says = levels(x)[values]))
  }
  if (is.character(values)) {
    named <- of_texts(values)
    if (is.null(named)) return(NULL)
    return(structure(named, says = values))
  }
  if (!is.numeric(values)) return(NULL)
  labels <- attr(x, "labels", exact = TRUE)
  if (is.numeric(labels) && !is.null(names(labels))) {
    of_label <- .lasa_cohort_of_text(names(labels))
    if (any(!is.na(of_label))) {
      at <- match(values, labels)
      named <- of_label[at]
      # A code without a value label, or whose label is its own number (the
      # level "4" of the cohort column, written to a .sav file).
      label_number <- suppressWarnings(as.numeric(names(labels)))[at]
      by_code <- is.na(at) | (is.na(named) & !is.na(label_number) & label_number == values)
      named[by_code] <- of_code(values[by_code])
      says <- ifelse(is.na(at), as.character(values), names(labels)[at])
      return(structure(named, says = says))
    }
    if (any(labels >= 0, na.rm = TRUE)) return(NULL)
  }
  if (!codes_only(values)) return(NULL)
  structure(of_code(values), says = as.character(values))
}

## How the cohort column of Time-prefixed wide data words each cohort (by
## baseline wave): list(texts, own), `texts` by cohort and `own` the levels
## it always has. Those of LASA's cohort variable as read_lasa_sav() reads
## LASAZ002.SAV's codes 1 to 4 (db_info$cohort_codes): its value labels
## ("cohort 1 (1992)", ...), which are its levels, and a code the label
## database doesn't document (the fourth cohort's 4, for now) by its own
## number ("4"), a level only where respondents have it. The migrant
## cohort, which has no code, has a wording of its own ("migrant cohort").
## Without the label database's LASAZ002.SAV, .lasa_cohort_texts.
.lasa_cohort_wording <- function(db_info) {
  texts <- .lasa_cohort_texts
  own <- unname(texts[c("B", "2B", "3B")])
  template <- db_info$cohort_codes
  if (is.factor(template) && length(template) == length(.lasa_cohort_numbers)) {
    read_as <- as.character(template)
    texts[names(.lasa_cohort_numbers)[!is.na(read_as)]] <- read_as[!is.na(read_as)]
    own <- levels(template)[!is.na(.lasa_cohort_of_text(levels(template)))]
  }
  list(texts = texts, own = own)
}

## The cohort column of Time-prefixed wide data, from each respondent's
## cohort by baseline wave (`baselines`, NA where unknown): LASA's cohort
## variable the way read_lasa_sav() reads LASAZ002.SAV's (see
## .lasa_cohort_wording()) -- a factor of its value labels ("cohort 1
## (1992)", ...), with its labels -- so that it merges with that file's
## cohort column. The cohorts LASAZ002.SAV doesn't have get levels after
## its levels, where respondents (or `also`, cohorts by baseline wave) have
## them: the fourth and the migrant cohort, which comes with the fourth's
## level too, so that each cohort always has the same code
## (.lasa_cohort_column_codes).
.lasa_cohort_column <- function(baselines, db_info, also = character(0)) {
  wording <- .lasa_cohort_wording(db_info)
  texts <- wording$texts
  present <- c(baselines, also)
  extra <- c("4B", "MB")[c(any(present %in% c("4B", "MB")), "MB" %in% present)]
  levels <- unique(c(wording$own, texts[c("B", "2B", "3B", extra)]))
  out <- factor(unname(texts[baselines]), levels = unname(levels))
  template <- db_info$cohort_codes
  if (is.factor(template)) {
    a <- attributes(template)
    for (nm in setdiff(names(a), c("levels", "class", "names"))) attr(out, nm) <- a[[nm]]
  } else {
    attr(out, "label") <- .lasa_cohort_column_label
  }
  out
}

.lasa_cohort_column_label <- "LASA cohort of the respondent"

## A cohort column coded as .lasa_cohort_column() codes it, whose labels
## merge() or base R's row subsetting dropped (as they drop any factor's
## attributes but its levels), or whose levels merge() put in another
## order: with them back, as long format gives other columns the
## database's labels back (.lasa_restore_db_labels()). NULL for any other
## column.
.lasa_restore_cohort_labels <- function(x, db_info) {
  if (!identical(class(x), "factor") || !setequal(names(attributes(x)), c("levels", "class"))) return(NULL)
  wording <- .lasa_cohort_wording(db_info)
  texts <- wording$texts
  if (!all(wording$own %in% levels(x)) || !all(levels(x) %in% texts)) return(NULL)
  cohort_of <- function(text) names(texts)[match(text, texts)]
  .lasa_cohort_column(cohort_of(as.character(x)), db_info, also = cohort_of(levels(x)))
}

## Merges the copies merge() made of a cohort column (see
## .lasa_is_cohort_copy(); merging Time-prefixed wide data, or LASA's
## LASAZ002.SAV, by respnr alone gives them), and several columns named
## "cohort" in different capitalizations (LASAZ002.SAV's "COHORT", as
## haven::read_sav() reads it, merged with Time-prefixed wide data, say),
## into one "cohort" column where the first of them was, coded as
## Time-prefixed wide data have it (.lasa_cohort_column()). They must agree
## on each respondent's cohort (.lasa_cohort_codes(); a value that names
## none says nothing). A copy that names no cohort at all (another data
## set's own "cohort") is an ordinary column; a column named "cohort" that
## names none, next to one that does, is an error. `id` is the respondent
## identifier column; `renamed` (see .lasa_unique_copies()) names columns in
## errors.
.lasa_combine_cohort_copies <- function(data, id, db_info, renamed = .lasa_no_renamed) {
  copies <- names(data)[.lasa_is_cohort_copy(names(data))]
  own <- names(data)[tolower(names(data)) == "cohort"]
  if (length(copies) == 0L && length(own) < 2L) return(data)
  columns <- c(own, copies)
  codes <- lapply(stats::setNames(columns, columns), function(name) .lasa_cohort_codes(data[[name]]))
  of_cohorts <- !vapply(codes, is.null, logical(1))
  other <- columns[!of_cohorts & vapply(columns, function(name) any(!.lasa_is_na(data[[name]])), logical(1))]
  if (!any(of_cohorts)) {
    .lasa_stop_repeated(copies, renamed)
    return(data)
  }
  if (length(intersect(own, other)) > 0L) {
    stop(
      "'data' has a '", intersect(own, other)[[1L]], "' column that doesn't hold LASA's cohorts next to LASA's ",
      "cohort column (", paste(columns[of_cohorts], collapse = ", "), "); rename it first.",
      call. = FALSE
    )
  }
  # The data's own cohort column, next to other data sets' columns named
  # "cohort" that merge() made copies of.
  if (!any(of_cohorts[copies]) && length(own) == 1L) {
    .lasa_stop_repeated(copies, renamed)
    return(data)
  }
  .lasa_stop_repeated(other, renamed)
  columns <- setdiff(columns, other)
  code_of <- function(name) if (is.null(codes[[name]])) rep(NA_character_, nrow(data)) else as.vector(codes[[name]])
  says_of <- function(name) if (is.null(codes[[name]])) code_of(name) else attr(codes[[name]], "says", exact = TRUE)
  combined <- code_of(columns[[1L]])
  says <- says_of(columns[[1L]])
  given_by <- ifelse(is.na(combined), NA_character_, columns[[1L]])
  for (name in columns[-1L]) {
    these <- code_of(name)
    disagree <- !is.na(combined) & !is.na(these) & combined != these
    if (any(disagree)) {
      i <- which(disagree)[[1L]]
      stop(
        "'data' has cohort columns that disagree: for respondent ", .lasa_text_key(.lasa_slice(data[[id]], i)),
        ", ", .lasa_show_column(given_by[[i]], renamed), " says '", says[[i]], "' and ",
        .lasa_show_column(name, renamed), " says '", says_of(name)[[i]], "'. Merging data sets with a ",
        "cohort column needs them to agree on each respondent's cohort.",
        call. = FALSE
      )
    }
    new <- is.na(combined) & !is.na(these)
    combined[new] <- these[new]
    says[new] <- says_of(name)[new]
    given_by[new] <- name
  }
  positions <- match(columns, names(data))
  first <- min(positions)
  data[[first]] <- .lasa_cohort_column(combined, db_info)
  others <- setdiff(positions, first)
  if (length(others) > 0L) data[others] <- NULL
  names(data)[[first]] <- "cohort"
  data
}

## The cohort column of `data` -- a column named "cohort" (in any
## capitalization) that names LASA cohorts (.lasa_cohort_codes()), as
## LASAZ002.SAV and Time-prefixed wide data have -- as each row's cohort by
## baseline wave (NA where it names none), or NULL if `data` has no such
## column (one that names no cohort is an ordinary column). In long data
## (respondents `r` of `n`), it must give each respondent one cohort;
## `row_ids` names each row's respondent in the error saying otherwise.
## Attribute "says" holds each row's value as text, and "column" the
## column's name.
.lasa_find_cohort <- function(data, r = NULL, n = NULL, row_ids = NULL) {
  name <- names(data)[tolower(names(data)) == "cohort"]
  if (length(name) != 1L) return(NULL)
  codes <- .lasa_cohort_codes(data[[name]])
  if (is.null(codes)) return(NULL)
  says <- attr(codes, "says", exact = TRUE)
  codes <- as.vector(codes)
  if (!is.null(r)) {
    several <- .lasa_distinct_values(r, codes, n) > 1L
    if (any(several)) {
      i <- which(several[r])[[1L]]
      cohorts <- unique(says[r == r[[i]] & !is.na(codes)])
      who <- if (is.null(row_ids)) paste0("row ", i) else paste0("respondent ", row_ids[[i]])
      stop(
        "'data' has a '", name, "' column that gives ", who, " several cohorts ('",
        paste(cohorts, collapse = "' and '"), "') on different rows; it must give each respondent one.",
        call. = FALSE
      )
    }
  }
  structure(codes, says = says, column = name)
}

## Each respondent's (1..n, of rows `r`) baseline wave as the data give it
## themselves: in a cohort column (.lasa_find_cohort()). Returns
## list(baseline, time_columns): `baseline` NA where it says nothing, NULL
## without such a column, with attributes "column" (its name) and "says"
## (what it says for each respondent, for errors); `time_columns` TRUE
## when there is one, as Time-prefixed wide columns come with. `row_ids`
## names each row's respondent in errors.
.lasa_given_baselines <- function(data, r, n, row_ids = NULL) {
  from_cohort <- .lasa_find_cohort(data, r, n, row_ids)
  if (is.null(from_cohort)) return(list(baseline = NULL, time_columns = FALSE))
  at <- .lasa_first_row(r, n, keep = !is.na(from_cohort))
  baseline <- as.vector(from_cohort)[at]
  attr(baseline, "column") <- attr(from_cohort, "column", exact = TRUE)
  attr(baseline, "says") <- attr(from_cohort, "says", exact = TRUE)[at]
  list(baseline = baseline, time_columns = TRUE)
}

## The cohorts each respondent may belong to by their LASA respondent
## number (`ids`, each respondent's identifier as text, see
## .lasa_text_key()). LASA's respondent numbers have five digits, the first
## of which says the cohort: 2 or 3 the first cohort, 4, 5, or 6 the
## second, and 7, 8, or 9 the third; 1 is the LSN pilot study's (wave A)
## and/or the first cohort's, so it says the first cohort only of a
## respondent the data show at a wave of LASA's cohorts (`in_lasa`, per
## respondent; NULL: every respondent). An identifier of any other form says
## nothing -- the fourth cohort's numbers are likely longer, which is
## unconfirmed -- but a five-digit one is read by its first digit, also if
## it is a migrant respondent's, whose numbering isn't known. A logical
## matrix, respondents x cohorts of .lasa_cohort_times(), with every cohort
## open where the number says nothing; NULL if no identifier is such a
## number.
.lasa_id_cohorts <- function(ids, in_lasa = NULL) {
  if (length(ids) == 0L) return(NULL)
  text <- trimws(ids)
  lasa <- !is.na(text) & grepl("^[1-9][0-9]{4}$", text)
  if (!is.null(in_lasa)) lasa <- lasa & (in_lasa | !startsWith(text, "1"))
  if (!any(lasa)) return(NULL)
  cohorts <- colnames(.lasa_cohort_times())
  by_digit <- rep(c("B", "2B", "3B"), each = 3L)
  out <- matrix(TRUE, nrow = length(ids), ncol = length(cohorts), dimnames = list(NULL, cohorts))
  out[lasa, ] <- outer(by_digit[as.integer(substr(text[lasa], 1L, 1L))], cohorts, `==`)
  out
}

## Whether column `x` (named `name`) holds a wave-specific variable as far
## as lasa_label_db() or transform_lasa_data() itself (a long column it
## built from wide columns) says.
.lasa_documented_varying <- function(x, name, db_info) {
  canonical <- attr(x, "canonical_name", exact = TRUE)
  !is.null(attr(x, "LASA_wide_columns", exact = TRUE)) ||
    .lasa_has(db_info$time_varying, tolower(name)) ||
    (is.character(canonical) && length(canonical) == 1L && .lasa_has(db_info$time_varying, tolower(canonical)))
}

## Which elements of column `x` show that the respondent took part:
## anything but NA and a missing-value code, which LASA's Z files also use
## for waves before a respondent's cohort joined (e.g. "no observation
## birth cohorts 1938-1947"). A missing-value code is what read_lasa_sav()
## turns into NA unless keep_user_na = TRUE: an SPSS user-missing value; in
## a variable the label database documents, any negative code, documented
## or not -- except in a variable whose values can be negative
## (can_be_negative) at the element's wave, where only its documented
## codes are; and in any column, a negative code it has a value label for.
## Codes count also as the factor level or text read_lasa_sav() gives them
## (their label, or their own number for a code without wording). The
## label database is looked up by `names` (the column's name, the
## variable's long-format name) and the column's canonical_name attribute.
## `waves` are the waves the elements may be at (NULL, or NA among them:
## any wave), or with `each = TRUE`, each element's own wave (NA if
## unknown).
.lasa_real_value <- function(x, names, db_info, waves = NULL, each = FALSE) {
  values <- .lasa_bare(x)
  real <- !.lasa_is_na(x)
  if (!any(real)) return(real)
  if (inherits(x, "haven_labelled_spss")) {
    definition <- list(na_values = attr(x, "na_values", exact = TRUE), na_range = attr(x, "na_range", exact = TRUE))
    real <- real & !.lasa_user_missing(values, definition)
  }

  canonical <- attr(x, "canonical_name", exact = TRUE)
  lookup_names <- unique(tolower(c(names, if (is.character(canonical) && length(canonical) == 1L) canonical)))
  documented <- function(table) unlist(lapply(lookup_names, function(nm) .lasa_lookup(table, nm)))
  documented_codes <- documented(db_info$missing_codes)
  labels <- attr(x, "labels", exact = TRUE)
  label_codes <- if (is.numeric(labels) && !is.null(names(labels))) labels else NULL
  label_text <- names(label_codes)

  # Whether an undocumented negative value is a measurement rather than a
  # missing-value code, per element: never in a column the database
  # doesn't document (which keeps it as it is), and in one it does, only
  # where the variable can be negative at the element's wave.
  in_database <- any(vapply(lookup_names, function(nm) .lasa_has(db_info$documented, nm), logical(1)))
  signed_at <- function(w) {
    keys <- if (length(w) == 0L || anyNA(w)) lookup_names else paste(rep(lookup_names, each = length(w)), w, sep = "\r")
    any(vapply(keys, function(key) .lasa_has(db_info$signed, key), logical(1)))
  }
  measured <- if (!in_database) {
    TRUE
  } else if (isTRUE(each) && length(waves) == length(values)) {
    distinct <- unique(waves)
    vapply(distinct, signed_at, logical(1))[match(waves, distinct)]
  } else {
    signed_at(waves)
  }
  measured <- rep_len(measured, length(values))

  ## Which of the texts `text` are missing-value codes: texts the database
  ## documents as missing values for this variable, the text of a missing
  ## code read_lasa_sav() disambiguated, texts only negative codes have, and
  ## a negative code's own number -- unless `signed` (see `measured`), only
  ## a documented one's.
  missing_label <- function(text) {
    !is.na(text) & (text %in% documented(db_info$missing_labels) | grepl(" \\[-[0-9.]+\\]$", text))
  }
  missing_text <- function(text, signed) {
    negative_only <- vapply(text, function(t) {
      codes <- unname(label_codes)[which(label_text == t)]
      length(codes) > 0L && all(codes < 0)
    }, logical(1), USE.NAMES = FALSE)
    number <- suppressWarnings(as.numeric(text))
    negative_number <- !is.na(number) & number < 0 & (!signed | number %in% documented_codes)
    negative_only | missing_label(text) | negative_number
  }
  ## Which elements hold a text `missing_text()` says is a code, each by
  ## its own `measured`.
  text_missing <- function(text, element_text) {
    out <- rep(FALSE, length(element_text))
    for (signed in unique(measured)) {
      here <- measured == signed
      out[here] <- element_text[here] %in% text[missing_text(text, signed)]
    }
    out
  }
  if (is.factor(x)) {
    return(real & !text_missing(levels(x), levels(x)[values]))
  }
  if (is.character(values)) {
    return(real & !text_missing(unique(values[real]), values))
  }
  if (is.numeric(values)) {
    negative <- real & !is.na(values) & values < 0
    if (any(negative)) {
      coded <- values %in% c(unname(label_codes)[label_codes < 0], documented_codes)
      real <- real & !(negative & (coded | !measured))
    }
    # A code labelled as a missing value, whatever its number (a factor
    # saved with haven::write_sav() numbers its levels from 1) -- by its own
    # label: several codes may share a text.
    if (!is.null(label_codes)) {
      real <- real & !values %in% unname(label_codes)[missing_label(label_text)]
    }
  }
  real
}

## Which of the `n_rows` rows of long data hold a value placed at their
## wave by a guess (`exclude`, by column, see .lasa_guessed_rows()) and no
## other value in `columns`.
.lasa_only_guessed_rows <- function(columns, exclude, n_rows) {
  if (length(exclude) == 0L) return(rep(FALSE, n_rows))
  any_guess <- Reduce(`|`, exclude, rep(FALSE, n_rows))
  other <- Reduce(`|`, lapply(names(columns), function(name) {
    held <- !.lasa_is_na(columns[[name]])
    if (!is.null(exclude[[name]])) held <- held & !exclude[[name]]
    held
  }), rep(FALSE, n_rows))
  any_guess & !other
}

## Which of the `n_rows` rows of long data (of waves `wave_codes`) hold a
## value that shows their respondent took part (.lasa_real_value()) in one
## of `columns` (a named list of the long data's wave-specific columns, see
## .lasa_evidence_columns()) -- every row, without such columns.
## `exclude[[name]]` marks rows whose value in column `name` doesn't count
## (its wave was a guess).
.lasa_long_real_rows <- function(columns, n_rows, db_info, wave_codes, exclude = list()) {
  if (length(columns) == 0L) return(rep(TRUE, n_rows))
  shown <- rep(FALSE, n_rows)
  for (name in names(columns)) {
    real <- .lasa_real_value(columns[[name]], name, db_info, wave_codes, each = TRUE)
    if (!is.null(exclude[[name]])) real <- real & !exclude[[name]]
    shown <- shown | real
  }
  shown
}

## The waves at which long column `x`'s "LASA_wide_columns" store (see
## .lasa_wide_store()) says its values were placed by a guess, as a list of
## the respondents' identifiers (.lasa_text_key()) by wave; empty for none.
.lasa_store_guessed <- function(x) {
  store <- attr(x, "LASA_wide_columns", exact = TRUE)
  guessed <- if (is.list(store)) store$guessed else NULL
  if (is.list(guessed)) guessed else list()
}

## Which rows of long data (of respondents with identifiers `keys`, at
## waves `wave_codes`) hold a value of each of `columns` (a named list) that
## was placed at a guessed wave (.lasa_store_guessed()): a named list of
## logical vectors, for .lasa_long_real_rows()'s `exclude`. `also` adds
## rows already known (a named list of the same kind).
.lasa_guessed_rows <- function(columns, keys, wave_codes, also = list()) {
  out <- also
  for (name in names(columns)) {
    guessed <- .lasa_store_guessed(columns[[name]])
    if (length(guessed) == 0L) next
    rows <- if (is.null(out[[name]])) rep(FALSE, length(keys)) else out[[name]]
    for (w in names(guessed)) rows <- rows | (wave_codes == w & keys %in% guessed[[w]])
    out[[name]] <- rows
  }
  out
}

## Which of the `n_rows` rows of long data hold any value (missing-value
## codes too) in one of `columns` -- every row, without such columns.
.lasa_long_held_rows <- function(columns, n_rows) {
  if (length(columns) == 0L) return(rep(TRUE, n_rows))
  Reduce(`|`, lapply(columns, function(x) !.lasa_is_na(x)), rep(FALSE, n_rows))
}

## Whether some respondent's rows (respondent `r` of `n`) hold different
## values of `x`, a missing value counting as a value of its own.
.lasa_varies_within <- function(x, r, n) {
  key <- .lasa_value_key(x)
  first_key <- key[.lasa_first_row(r, n)[r]]
  same <- (is.na(key) & is.na(first_key)) | (!is.na(key) & !is.na(first_key) & key == first_key)
  !all(same)
}

## The columns of long data (`columns`, a named list of all but its
## identifier, "Wave" and "Time" columns, with rows of respondents `r` of
## `n`) whose values show at which waves a respondent took part. Returns
## list(evidence, held): `evidence` are the wave-specific variables
## lasa_label_db() documents or transform_lasa_data() built from wide
## columns (.lasa_documented_varying(), and the columns named `documented`)
## -- or, in data without any, the other columns that differ between a
## respondent's rows (a variable a user computed per wave, say), or else
## all of those other columns -- and NULL when `columns` has none at all,
## so every row counts; `held` are the columns whose values belong to a
## row's wave, those of either kind. Documented stable variables and a
## "cohort" column (in any capitalization) are neither: they hold for all
## of a respondent's rows.
.lasa_evidence_columns <- function(columns, r, n, db_info, documented = character(0)) {
  is_documented <- vapply(names(columns), function(name) {
    name %in% documented || .lasa_documented_varying(columns[[name]], name, db_info)
  }, logical(1))
  stable <- vapply(names(columns), function(name) {
    tolower(name) == "cohort" || .lasa_documented_stable(columns[[name]], name, db_info)
  }, logical(1))
  other <- !is_documented & !stable
  varies <- other
  if (any(other) && any(tabulate(r, n) > 1L)) {
    varies[other] <- vapply(names(columns)[other], function(name) .lasa_varies_within(columns[[name]], r, n), logical(1))
    if (!any(varies)) varies <- other
  }
  evidence <- if (any(is_documented)) columns[is_documented] else if (any(varies)) columns[varies] else NULL
  list(evidence = evidence, held = columns[is_documented | varies])
}

## Long column `x` (named `name`) of a variable lasa_label_db() documents,
## on rows of waves `wave_codes`, with the labels read_lasa_sav() gives it at
## each wave it has values at -- when base R's rbind() or merge(), or
## dplyr::bind_rows(), dropped them, or left one file's on rows of several
## waves: "wave_label" and "labels_wave" with an entry per wave,
## "canonical_name", the harmonized label and value labels where the
## database has them, and as "label" and "labels" the harmonized ones, else
## the waves' shared (or first) wording and all their value labels. A
## column whose per-wave "wave_label" lacks some of its waves only gets
## their entries, unless those it has differ from the database's. A wave at
## which the database documents the variable in several files with
## different labels gets nothing. NULL when nothing was lost, when the
## column's own labels aren't ones the database gives the variable at its
## waves (a user's own, or the codes haven::write_sav() gives a factor's
## levels), when the database documents none of its waves, or for a long
## column transform_lasa_data() built from wide columns (with a
## "LASA_wide_columns" store).
.lasa_restore_db_labels <- function(x, name, wave_codes, db_info) {
  # A long column transform_lasa_data() built from wide columns got its
  # labels from them then (and from the database where they had none).
  if (!is.null(attr(x, "LASA_wide_columns", exact = TRUE))) return(NULL)
  all_waves <- .lasa_wave_table()$wave
  waves <- all_waves[all_waves %in% wave_codes[!.lasa_is_na(x)]]
  if (length(waves) == 0L) return(NULL)
  is_text <- function(v) is.character(v) && length(v) == 1L && !is.na(v)
  canonical <- attr(x, "canonical_name", exact = TRUE)
  stem <- tolower(if (is_text(canonical)) canonical else name)
  if (!.lasa_has(db_info$time_varying, stem)) return(NULL)

  # What read_lasa_sav() gives the variable at each of its waves.
  db <- db_info$labels
  maps_of <- function(keys, table) unique(lapply(keys, function(key) .lasa_lookup(table, key)))
  info <- list()
  canonical_names <- character(0)
  for (w in waves) {
    rows <- .lasa_lookup(db$rows, paste(stem, w, sep = "\r"))
    if (is.null(rows)) next
    here <- list(
      label = unique(db$variable_label[rows]),
      map = maps_of(db$value_key[rows], db$value_maps),
      harmonized_label = unique(db$harmonized_label[rows]),
      harmonized_map = maps_of(db$harmonized_key[rows], db$harmonized_maps)
    )
    # Several files' variables of the same name at one wave: unless they
    # agree, which this column holds is unknown.
    if (any(lengths(here) > 1L)) next
    info[[w]] <- lapply(here, `[[`, 1L)
    canonical_names <- c(canonical_names, db$canonical_name[rows])
  }
  if (length(info) == 0L) return(NULL)
  per_wave <- function(field) {
    values <- lapply(info, `[[`, field)
    values[!vapply(values, function(v) is.null(v) || (length(v) == 1L && is.na(v)), logical(1))]
  }
  wave_labels <- per_wave("label")
  value_maps <- per_wave("map")
  pairs_of <- function(map) {
    if (!is.numeric(map) || is.null(names(map))) return(NA_character_)
    paste(.lasa_text_key(unname(map)), names(map), sep = "\r")
  }

  wave_label <- attr(x, "wave_label", exact = TRUE)
  labels_wave <- attr(x, "labels_wave", exact = TRUE)
  if (!is.null(names(wave_label))) {
    if (!all(names(wave_label) %in% all_waves)) return(NULL)
    # Per-wave labels (of a long column) lacking the waves of rows added
    # since: only those waves' entries -- as long as the entries it has are
    # the database's own where it documents their wave, not a user's own
    # wording, which the database's would mix with.
    same_label <- function(w) identical(as.character(unlist(wave_label[[w]])), wave_labels[[w]])
    same_map <- function(w) setequal(pairs_of(labels_wave[[w]]), pairs_of(value_maps[[w]]))
    if (!all(vapply(intersect(names(wave_label), names(wave_labels)), same_label, logical(1)))) return(NULL)
    if (is.list(labels_wave) && !all(vapply(intersect(names(labels_wave), names(value_maps)), same_map, logical(1)))) {
      return(NULL)
    }
    add <- setdiff(names(wave_labels), names(wave_label))
    add_maps <- if (is.list(labels_wave) || is.null(labels_wave)) setdiff(names(value_maps), names(labels_wave)) else character(0)
    if (length(add) == 0L && length(add_maps) == 0L) return(NULL)
    order_of <- function(v) v[order(match(names(v), all_waves))]
    if (length(add) > 0L) attr(x, "wave_label") <- order_of(c(wave_label, unlist(wave_labels[add])))
    if (length(add_maps) > 0L) attr(x, "labels_wave") <- order_of(c(as.list(labels_wave), value_maps[add_maps]))
    return(x)
  }

  # Labels left on the column must be ones read_lasa_sav() gives the
  # variable at one of its waves -- as when dplyr::bind_rows() kept the
  # first file's "label" and "labels", or rbind() all of its attributes --
  # not a user's own, or the codes haven::write_sav() gave a factor's
  # levels, which the database's labels would misread.
  own_label <- attr(x, "label", exact = TRUE)
  own_labels <- attr(x, "labels", exact = TRUE)
  known_labels <- unique(c(unlist(wave_labels), unlist(per_wave("harmonized_label"))))
  known_pairs <- unique(unlist(lapply(c(value_maps, per_wave("harmonized_map")), pairs_of)))
  fits <- function(label) is.null(label) || (is_text(label) && label %in% known_labels)
  fits_map <- function(map) is.null(map) || all(pairs_of(map) %in% known_pairs)
  if (!fits(own_label) || !fits(wave_label) || !fits_map(own_labels) || !(is.list(labels_wave) || fits_map(labels_wave))) {
    return(NULL)
  }
  # Nothing lost: one wave's labels, on rows of that wave only.
  if (!is.null(wave_label) && length(waves) == 1L) return(NULL)

  first_of <- function(values) {
    values <- unlist(values)
    if (length(values) > 0L) values[[1L]] else NA_character_
  }
  harmonized_label <- first_of(per_wave("harmonized_label"))
  harmonized_maps <- per_wave("harmonized_map")
  harmonized_map <- if (length(harmonized_maps) > 0L) harmonized_maps[[1L]] else NULL
  shared <- unique(unlist(wave_labels))
  label <- if (!is.na(harmonized_label)) harmonized_label else first_of(shared)
  labels <- if (!is.null(harmonized_map)) {
    harmonized_map
  } else if (length(value_maps) > 0L) {
    .lasa_union_value_labels(unname(value_maps))
  }

  attrs <- list(
    wave_label = if (length(wave_labels) == 1L && length(waves) == 1L) wave_labels[[1L]] else if (length(wave_labels) > 0L) unlist(wave_labels),
    label = if (!is.na(label)) label,
    labels_wave = if (length(value_maps) == 1L && length(waves) == 1L) value_maps[[1L]] else if (length(value_maps) > 0L) value_maps,
    labels = labels,
    canonical_name = canonical_names[[1L]],
    harmonized_label = if (!is.na(harmonized_label)) harmonized_label,
    labels_harmonized = harmonized_map
  )
  for (nm in names(attrs)) attr(x, nm) <- NULL
  .lasa_set_attributes(x, attrs[!vapply(attrs, is.null, logical(1))])
}

## Data frame `out` with a "variable.labels" attribute (as read_lasa_sav()
## gives one) from its columns' "label" attributes, if it has none.
.lasa_add_variable_labels <- function(out) {
  if (!is.null(attr(out, "variable.labels", exact = TRUE))) return(out)
  attr(out, "variable.labels") <- stats::setNames(vapply(names(out), function(name) {
    label <- attr(out[[name]], "label", exact = TRUE)
    if (is.character(label) && length(label) == 1L) label else NA_character_
  }, character(1)), names(out))
  out
}

## Whether column `x` (named `name`) is a stable variable lasa_label_db()
## documents (by its name or canonical_name attribute): one that holds for
## every wave.
.lasa_documented_stable <- function(x, name, db_info) {
  canonical <- attr(x, "canonical_name", exact = TRUE)
  .lasa_has(db_info$stable, tolower(name)) ||
    (is.character(canonical) && length(canonical) == 1L && .lasa_has(db_info$stable, tolower(canonical)))
}

## Whether long data `data` (at waves `wave_codes`) are the rows of one of
## the migrant cohort's files of stable variables (LASMB004.SAV: sex,
## byear, ...), which LASA files apart from its wave files, under an "mb"
## file code, like a Z file: all at wave MB, with documented stable
## variables and, among its other columns (but those in `skip`), no
## wave-specific ones -- columns the label database doesn't document (a
## weight someone added, say) don't count.
.lasa_stable_mb_file <- function(data, skip, wave_codes, db_info) {
  file_code <- .lasa_provenance(data)$file_code
  if (is.null(file_code) || !startsWith(file_code, "mb") || length(wave_codes) == 0L || !all(wave_codes == "MB")) {
    return(FALSE)
  }
  columns <- setdiff(names(data), skip)
  stable <- vapply(columns, function(name) .lasa_documented_stable(data[[name]], name, db_info), logical(1))
  varying <- vapply(columns, function(name) .lasa_documented_varying(data[[name]], name, db_info), logical(1))
  any(stable) && !any(varying)
}

## The wave whose LASA file `data` is, as far as its provenance attributes
## say (see .lasa_provenance()), when only one cohort takes part in that
## wave (a baseline, or waves C to E): every respondent in such a file
## belongs to that cohort, whatever their values. NULL otherwise, also for
## Z files, which hold several waves (a later cohort's earlier waves with
## codes such as "no observation birth cohorts 1938-1947").
.lasa_cohort_file_wave <- function(provenance) {
  wave <- provenance$wave
  file_code <- provenance$file_code
  if (is.null(wave) || is.null(file_code) || startsWith(file_code, "z")) return(NULL)
  if (!wave %in% names(.lasa_cohort_of_wave)) return(NULL)
  wave
}

## has_data[r, w] (respondents x waves of .lasa_wave_table()) of long data
## whose rows belong to respondent `r` (of `n`) at wave `wave_codes`, of
## which `real_rows` (see .lasa_long_real_rows()) show the respondent took
## part: whether the respondent has such a row at w.
.lasa_long_has_data <- function(real_rows, r, n, wave_codes) {
  all_waves <- .lasa_wave_table()$wave
  has_data <- matrix(FALSE, nrow = n, ncol = length(all_waves), dimnames = list(NULL, all_waves))
  has_data[cbind(r[real_rows], match(wave_codes[real_rows], all_waves))] <- TRUE
  has_data
}

## Which cohorts each respondent may belong to, as far as the data show: a
## logical matrix with one row per respondent and one column per cohort
## (.lasa_baselines). Data at a wave (`has_data`, see .lasa_long_has_data())
## rule out the cohorts that don't take part in it -- wave A, which isn't
## part of any cohort's waves, says nothing -- and `allowed` (respondents x
## cohorts) rules out more; a known baseline (`baseline`, per respondent,
## NA if none, see .lasa_given_baselines()) rules out every other cohort;
## and a Time already in long data (`time`, per row, of respondent `r` at
## wave `wave_codes`) the cohorts whose numbering doesn't give that wave
## that Time. A baseline or Time contradicting the rest of the data is an
## error, naming the respondent by `ids` (each respondent's identifier as
## text) -- except Times that follow the cohort a LASA respondent number
## gives (`by_id`, the cohorts each respondent's number leaves open, see
## .lasa_id_cohorts(); NULL for none), as read_lasa_sav() gives them at
## waves several cohorts share: those yield to the rest of the data like
## the number itself. Last, the respondent number rules out the other
## cohorts, unless the rest of the data rule out its cohort: then the
## number is ignored, and attribute "id_contradicted" lists those
## respondents.
.lasa_possible_cohorts <- function(has_data, baseline = NULL, time = NULL, r = NULL, wave_codes = NULL,
                                   ids = NULL, allowed = NULL, by_id = NULL) {
  times <- .lasa_cohort_times()
  possible <- matrix(TRUE, nrow = nrow(has_data), ncol = ncol(times), dimnames = list(NULL, colnames(times)))
  if (!is.null(by_id) && nrow(by_id) != nrow(possible)) by_id <- NULL
  if (!is.null(allowed)) possible <- possible & allowed
  for (w in colnames(has_data)) {
    at <- has_data[, w]
    taking_part <- !is.na(times[w, ])
    if (any(at) && any(taking_part)) possible[at, !taking_part] <- FALSE
  }
  if (!is.null(baseline)) {
    known <- which(!is.na(baseline))
    before <- rowSums(possible[known, , drop = FALSE]) > 0L
    possible[known, ] <- possible[known, , drop = FALSE] & outer(baseline[known], colnames(times), `==`)
    contradicted <- before & rowSums(possible[known, , drop = FALSE]) == 0L
    if (any(contradicted)) {
      i <- known[contradicted][[1L]]
      says <- attr(baseline, "says", exact = TRUE)
      stop(
        "'data' has a '", attr(baseline, "column", exact = TRUE) %||% "cohort", "' column that doesn't match ",
        "its waves: for respondent ", ids[[i]], " it says '", if (is.null(says)) baseline[[i]] else says[[i]],
        "' (baseline ", baseline[[i]], "), but the rest of the data show them at a wave that cohort ",
        "doesn't take part in.",
        call. = FALSE
      )
    }
  }

  given <- if (is.null(time)) integer(0) else which(!is.na(time))
  if (length(given) > 0L) {
    fits <- times[wave_codes[given], , drop = FALSE] == time[given]
    fits[is.na(fits)] <- FALSE
    # possible[who, ] narrowed by the Times of rows `rows` of `given`.
    by_times <- function(rows) {
      ruled_out <- rowsum(1L * !fits[rows, , drop = FALSE], r[given[rows]], reorder = FALSE)
      who <- as.integer(rownames(ruled_out))
      list(who = who, possible = possible[who, , drop = FALSE] & ruled_out == 0L)
    }
    all_rows <- by_times(seq_along(given))
    who <- all_rows$who
    contradicted <- rowSums(possible[who, , drop = FALSE]) > 0L & rowSums(all_rows$possible) == 0L
    if (any(contradicted) && !is.null(by_id)) {
      # Without the Times that follow the respondent number's cohort.
      number <- by_id[r[given], , drop = FALSE]
      follows <- rowSums(fits & number) > 0L & rowSums(!number) > 0L
      rest <- by_times(which(!follows))
      without <- possible[who, , drop = FALSE]
      kept <- match(who, rest$who)
      without[!is.na(kept), ] <- rest$possible[kept[!is.na(kept)], , drop = FALSE]
      yields <- contradicted & rowSums(without) > 0L
      all_rows$possible[yields, ] <- without[yields, , drop = FALSE]
      contradicted <- contradicted & !yields
    }
    if (any(contradicted)) {
      stop(
        "'data' has a 'Time' column that doesn't match its waves: for respondent ",
        ids[[who[contradicted][[1L]]]], ", it contradicts the cohort the rest of the data show. ",
        "Long format constructs its own 'Time' column from the waves, so rename or drop it first.",
        call. = FALSE
      )
    }
    possible[who, ] <- all_rows$possible
  }

  if (!is.null(by_id)) {
    narrowed <- possible & by_id
    fits <- rowSums(narrowed) > 0L
    possible[fits, ] <- narrowed[fits, , drop = FALSE]
    contradicted <- which(!fits & rowSums(possible) > 0L)
    if (length(contradicted) > 0L) attr(possible, "id_contradicted") <- contradicted
  }
  possible
}

## Each row's Time: the one that every cohort its respondent may belong to
## (`possible`, see .lasa_possible_cohorts()) gives the row's wave -- NA
## unless the data narrow the respondent down to cohorts that agree on it.
.lasa_row_times <- function(possible, r, wave_codes) {
  times <- .lasa_cohort_times()[wave_codes, , drop = FALSE]
  p <- possible[r, , drop = FALSE]
  defined <- rowSums(p) > 0L & rowSums(p & is.na(times)) == 0L
  times[!p] <- NA
  columns <- lapply(seq_len(ncol(times)), function(j) times[, j])
  low <- do.call(pmin, c(columns, na.rm = TRUE))
  high <- do.call(pmax, c(columns, na.rm = TRUE))
  as.integer(unname(ifelse(defined & !is.na(low) & low == high, low, NA_integer_)))
}

## Each respondent's baseline wave: the one cohort `possible` (see
## .lasa_possible_cohorts()) leaves them, NA if it leaves several or none.
.lasa_known_baselines <- function(possible) {
  one <- rowSums(possible) == 1L
  out <- rep(NA_character_, nrow(possible))
  out[one] <- colnames(possible)[max.col(possible[one, , drop = FALSE], ties.method = "first")]
  out
}

## The Time of long data's rows (respondent `r` at wave `wave_codes`) and
## each respondent's baseline, from what the rows that show their
## respondent took part (`real_rows`, see .lasa_long_real_rows()), the
## waves the data show each respondent at besides (`shown`, respondents x
## waves of .lasa_wave_table(), NULL for none), `baseline` and `time` show
## about their cohort (see .lasa_possible_cohorts()) -- and their LASA
## respondent number, a 1 only for respondents shown at a wave other than
## A, by those or by `in_lasa` (per respondent, NULL for none: values a
## guess placed at such a wave, say). Says which
## respondents' rows get no Time,
## unless `quiet`: in a message when the data don't show their cohort (as
## far as those rows hold values, missing-value codes too: `held_rows`, see
## .lasa_long_held_rows(); an empty row loses nothing), and in a warning
## when they show waves of several cohorts -- and, unless `warn_numbers` is
## FALSE, in a warning, which respondents' LASA respondent numbers the rest
## of the data contradict. Returns list(time, baseline).
.lasa_long_times <- function(r, wave_codes, real_rows, baseline, time, ids, quiet = FALSE,
                             held_rows = real_rows, warn_numbers = !quiet, shown = NULL, in_lasa = NULL) {
  has_data <- .lasa_long_has_data(real_rows, r, length(ids), wave_codes)
  if (!is.null(shown)) has_data <- has_data | shown
  # A respondent number starting with 1 may be an LSN pilot respondent's
  # who never joined LASA: it only counts for those the data show at a wave
  # other than A.
  at_lasa_wave <- rowSums(has_data[, colnames(has_data) != "A", drop = FALSE]) > 0L
  if (!is.null(in_lasa)) at_lasa_wave <- at_lasa_wave | in_lasa
  possible <- .lasa_possible_cohorts(
    has_data, baseline, time, r, wave_codes, ids,
    by_id = .lasa_id_cohorts(ids, at_lasa_wave)
  )
  id_contradicted <- attr(possible, "id_contradicted", exact = TRUE)
  row_time <- .lasa_row_times(possible, r, wave_codes)

  times <- .lasa_cohort_times()[wave_codes, , drop = FALSE]
  conflicting <- rowSums(possible) == 0L
  # Rows holding values at a wave whose Time depends on a cohort the data
  # don't show.
  undecided <- held_rows & is.na(row_time) & !conflicting[r] &
    rowSums(possible[r, , drop = FALSE] & !is.na(times)) > 0L
  # An example row, preferably one whose values show the respondent took
  # part, at a wave of some cohort.
  example <- function(who) {
    preferred <- who & real_rows & wave_codes != "A"
    i <- if (any(preferred)) which(preferred)[[1L]] else which(who)[[1L]]
    paste0("e.g. respondent ", ids[[r[[i]]]], " at wave ", wave_codes[[i]])
  }
  if (!quiet && any(conflicting[r])) {
    warning(
      "The data show ", sum(conflicting), " respondent(s) at waves of different cohorts (",
      example(conflicting[r]), "), so their rows have no Time.",
      call. = FALSE
    )
  }
  if (warn_numbers && length(id_contradicted) > 0L) {
    i <- id_contradicted[[1L]]
    digit <- as.integer(substr(trimws(ids[[i]]), 1L, 1L))
    warning(
      "The respondent numbers of ", length(id_contradicted), " respondent(s) say a cohort the rest of the ",
      "data rule out, so their cohort and Time come from the rest of the data alone (e.g. respondent ", ids[[i]],
      ", whose number says cohort ", (digit - 1L) %/% 3L + 1L, "). LASA numbers its respondents with five ",
      "digits, the first of which is 1, 2, or 3 in the first cohort, 4, 5, or 6 in the second, and 7, 8, or ",
      "9 in the third.",
      call. = FALSE
    )
  }
  if (!quiet && any(undecided)) {
    message(
      "transform_lasa_data(): Time counts the waves since each respondent's baseline (Time 0), but ",
      "nothing in 'data' shows the cohort of ", length(unique(r[undecided])), " respondent(s) (",
      example(undecided), "), so those rows have no Time. A cohort shows in values (other than ",
      "missing-value codes) at its baseline or at a wave only it takes part in (B to E for the ",
      "first cohort), in every row of a LASA file of such a wave, in LASA's 'cohort' column (as ",
      "LASAZ002.SAV has), or in a LASA respondent number (five digits, the first of which says the cohort)."
    )
  }
  list(time = row_time, baseline = .lasa_known_baselines(possible))
}

## Values of `x` that are equal exactly where the values of `x` are: a
## factor's level codes, otherwise its bare values. Only comparable with
## keys of the same vector (or vectors of the same type).
.lasa_value_key <- function(x) {
  if (is.factor(x)) return(as.integer(x))
  v <- .lasa_bare(x)
  if (is.complex(v) || is.raw(v)) v <- as.character(v)
  v
}

## An exact text form of each element (NA stays NA), comparable across
## vectors of different types: factor level text, all digits of a double.
.lasa_text_key <- function(x) {
  if (is.factor(x)) return(as.character(x))
  v <- .lasa_bare(x)
  out <- if (is.double(v)) sprintf("%.17g", v) else as.character(v)
  out[is.na(v)] <- NA_character_
  out
}

## Which elements are truly missing: NA, and blank text, which is how SPSS
## stores a missing text value (haven::write_sav() writes NA text as "").
## Unlike is.na(), never counts an SPSS user-defined missing code
## (haven_labelled_spss) as missing: such a code is a value LASA recorded.
.lasa_is_na <- function(x) {
  values <- .lasa_bare(x)
  if (is.character(values)) is.na(values) | !nzchar(trimws(values)) else is.na(values)
}

## Respondent bookkeeping for the identifier column: each row's respondent
## number (in order of first appearance) and how many respondents there are.
.lasa_respondents <- function(id_values, id_name) {
  if (any(.lasa_is_na(id_values))) {
    stop("The respondent identifier column '", id_name, "' has missing values.", call. = FALSE)
  }
  key <- .lasa_value_key(id_values)
  levels <- unique(key)
  list(r = match(key, levels), n = length(levels))
}

## For each respondent 1..n, the first row (index) where `keep` holds, or NA.
.lasa_first_row <- function(r, n, keep = rep(TRUE, length(r))) {
  out <- rep(NA_integer_, n)
  rows <- which(keep)
  first <- rows[!duplicated(r[rows])]
  out[r[first]] <- first
  out
}

## Number of distinct non-missing values each respondent 1..n has in `key`
## (see .lasa_value_key()).
.lasa_distinct_values <- function(r, key, n) {
  ok <- which(!is.na(key))
  if (length(ok) == 0L) return(integer(n))
  ok <- ok[order(r[ok], key[ok], method = "radix")]
  rr <- r[ok]
  kk <- key[ok]
  m <- length(ok)
  new_value <- c(TRUE, rr[-1L] != rr[-m] | kk[-1L] != kk[-m])
  tabulate(rr[new_value], nbins = n)
}

## `x[i]`, keeping every attribute of `x` -- base subsetting drops e.g.
## "label" from plain vectors and factors. `i` may contain NA.
.lasa_slice <- function(x, i) {
  out <- x[i]
  a <- attributes(x)
  for (nm in setdiff(names(a), c("names", "dim", "dimnames"))) {
    if (is.null(attr(out, nm, exact = TRUE))) attr(out, nm) <- a[[nm]]
  }
  out
}

## Assembles a data frame (or tibble, following `template`) from a named
## list of equal-length columns, carrying over `template`'s own attributes
## such as "label_report" and "LASA_file_code". Its "variable.labels" (as
## read_lasa_sav() sets them) come from each column's "label", or -- for a
## column that lost it (base R's row subsetting drops it from most
## columns) -- from `template`'s own entry for the first of the columns it
## was made of (`label_sources`, by column name; the same name if none).
.lasa_build_frame <- function(columns, template, label_sources = list()) {
  n <- if (length(columns) > 0L) length(columns[[1L]]) else nrow(template)
  out <- columns
  attr(out, "row.names") <- if (n > 0L) c(NA_integer_, -n) else integer(0)
  class(out) <- if (inherits(template, "tbl_df")) c("tbl_df", "tbl", "data.frame") else "data.frame"

  drop <- c(
    "names", "row.names", "class", "groups", ".internal.selfref", "sorted", "index",
    "variable.labels", "LASA_wave"
  )
  template_attrs <- attributes(template)
  for (nm in setdiff(names(template_attrs), drop)) {
    attr(out, nm) <- template_attrs[[nm]]
  }
  old_labels <- template_attrs[["variable.labels"]]
  if (!is.null(old_labels)) {
    attr(out, "variable.labels") <- stats::setNames(
      vapply(
        names(out),
        function(name) {
          label <- attr(out[[name]], "label", exact = TRUE)
          if (is.character(label) && length(label) == 1L) return(label)
          sources <- if (name %in% names(label_sources)) label_sources[[name]] else name
          known <- old_labels[intersect(sources, names(old_labels))]
          known <- known[!is.na(known)]
          if (length(known) > 0L) unname(known[[1L]]) else NA_character_
        },
        character(1)
      ),
      names(out)
    )
  }
  out
}

## Kind of a column, as far as combining columns across waves is concerned.
## "na" is an all-missing logical vector, which fits any other kind.
.lasa_column_kind <- function(x) {
  if (is.null(x)) return("missing")
  if (is.factor(x)) return("factor")
  if (inherits(x, "haven_labelled")) return(paste0("labelled_", typeof(unclass(x))))
  if (inherits(x, "Date")) return("Date")
  if (inherits(x, "POSIXct")) return("POSIXct")
  if (is.object(x)) return("other")
  if (is.logical(x)) return(if (all(is.na(x))) "na" else "logical")
  if (is.character(x)) return("character")
  if (is.integer(x)) return("integer")
  if (is.double(x)) return("double")
  "other"
}

## The kind columns of `kinds` can be combined into, with `fallback = TRUE`
## when they don't fit together and are combined as text instead.
.lasa_unify_kinds <- function(kinds) {
  kinds <- unique(kinds)
  if (length(kinds) == 1L) return(list(kind = kinds, fallback = FALSE))
  plain_numbers <- c("logical", "integer", "double")
  labelled_numbers <- c("labelled_integer", "labelled_double")
  if (all(kinds %in% plain_numbers)) {
    kind <- if ("double" %in% kinds) "double" else "integer"
    return(list(kind = kind, fallback = FALSE))
  }
  if (all(kinds %in% c(plain_numbers, labelled_numbers))) {
    kind <- if (any(kinds %in% c("double", "labelled_double"))) "labelled_double" else "labelled_integer"
    return(list(kind = kind, fallback = FALSE))
  }
  if (all(kinds %in% c("character", "labelled_character"))) {
    return(list(kind = "labelled_character", fallback = FALSE))
  }
  if (all(kinds %in% c("character", "factor"))) {
    return(list(kind = "character", fallback = FALSE))
  }
  list(kind = "character", fallback = TRUE)
}

## Stacks `columns` (a list of vectors; NULL for a wave without a column,
## standing for `n` missing values) into one vector of their common kind.
## Returns the values, their kind, and whether they had to fall back to
## text (see .lasa_fallback_text()).
.lasa_stack_columns <- function(columns, n) {
  columns <- lapply(columns, function(x) if (is.null(x)) rep(NA, n) else x)
  factors <- Filter(is.factor, columns)
  kinds <- vapply(columns, .lasa_column_kind, character(1))
  # A column without any value (a wave nobody answered) fits whatever the
  # other waves hold, so only columns with values decide the kind, and
  # they are the first to give their type (haven's class, say).
  informative <- !vapply(columns, function(x) all(.lasa_is_na(x)), logical(1))
  if (!any(informative)) informative <- kinds != "na"
  if (!any(informative)) {
    return(list(values = rep(NA, n * length(columns)), kind = "na", fallback = FALSE))
  }
  templates <- c(columns[informative], columns[!informative])
  columns[!informative] <- lapply(columns[!informative], function(x) rep(NA, length(x)))
  unified <- .lasa_unify_kinds(kinds[informative])
  kind <- unified$kind
  first <- templates[[1L]]
  as_text <- function() unlist(lapply(columns, .lasa_fallback_text))

  values <- switch(kind,
    factor = {
      # Levels of every wave, including waves without any value.
      level_sets <- lapply(factors, levels)
      all_levels <- unique(unlist(level_sets))
      ordered <- all(vapply(factors, is.ordered, logical(1))) &&
        length(unique(level_sets)) == 1L
      factor(
        unlist(lapply(columns, as.character)),
        levels = all_levels,
        ordered = ordered
      )
    },
    character = as_text(),
    logical = as.logical(unlist(lapply(columns, .lasa_bare))),
    integer = as.integer(unlist(lapply(columns, .lasa_bare))),
    double = as.double(unlist(lapply(columns, .lasa_bare))),
    labelled_integer = ,
    labelled_double = ,
    labelled_character = {
      base <- switch(kind,
        labelled_integer = as.integer,
        labelled_double = as.double,
        labelled_character = as.character
      )
      stacked <- base(unlist(lapply(columns, .lasa_bare)))
      labelled <- Filter(function(x) inherits(x, "haven_labelled"), templates)
      spss <- Filter(function(x) inherits(x, "haven_labelled_spss"), labelled)
      # haven's class names the values' type last ("integer", "double", ...),
      # which must be the stacked values' type.
      classes <- class(if (length(spss) > 0L) spss[[1L]] else labelled[[1L]])
      classes[classes %in% c("logical", "integer", "double", "character")] <- typeof(stacked)
      structure(stacked, class = classes)
    },
    Date = structure(as.double(unlist(lapply(columns, .lasa_bare))), class = "Date"),
    POSIXct = .POSIXct(as.double(unlist(lapply(columns, .lasa_bare))), tz = attr(first, "tzone", exact = TRUE)),
    other = {
      # Time spans (difftime) in different units are converted to a unit
      # every wave's values convert to and back from exactly.
      same_class <- length(unique(lapply(columns[informative], class))) == 1L
      if (same_class && inherits(first, "difftime") && !inherits(first, "hms")) {
        unit <- .lasa_exact_unit(columns[informative])
        if (is.null(unit)) {
          same_class <- FALSE
        } else {
          for (i in which(informative)) units(columns[[i]]) <- unit
        }
      }
      structures <- lapply(columns[informative], .lasa_structure_of)
      if (same_class && length(unique(structures)) == 1L) {
        out <- unlist(lapply(columns, .lasa_bare))
        attributes(out) <- structures[[1L]]
        out
      } else {
        unified$fallback <- TRUE
        kind <- "character"
        as_text()
      }
    }
  )
  list(values = values, kind = kind, fallback = unified$fallback)
}

## Union of several waves' value-label vectors (names = label text,
## values = codes). A code labelled differently by different waves can't be
## represented by one set: then use the harmonized set if there is one,
## and drop the value labels otherwise rather than mislabel a wave's codes.
.lasa_union_value_labels <- function(label_sets, harmonized = NULL) {
  codes <- unlist(lapply(label_sets, unname))
  texts <- unlist(lapply(label_sets, names))
  code_key <- .lasa_text_key(codes)
  pairs <- !duplicated(paste(code_key, texts, sep = "\r"))
  if (anyDuplicated(code_key[pairs]) > 0L) return(harmonized)
  keep <- !duplicated(code_key)
  stats::setNames(codes[keep], texts[keep])
}

## Which of `values` (bare) the SPSS user-missing definition `definition`
## (list(na_values, na_range)) marks missing; NA values count as not.
.lasa_user_missing <- function(values, definition) {
  out <- rep(FALSE, length(values))
  known <- !is.na(values)
  if (!is.null(definition$na_values)) {
    out[known] <- values[known] %in% definition$na_values
  }
  if (!is.null(definition$na_range) && is.numeric(values)) {
    range <- definition$na_range
    out[known] <- out[known] | (values[known] >= range[[1L]] & values[known] <= range[[2L]])
  }
  out
}

## The SPSS user-missing definition (list(na_values, na_range)) of a long
## column combining `columns` (one per wave), which must mark exactly the
## values each wave marks missing on that wave's own rows: the waves'
## shared definition; else their missing codes and range together; else
## just the codes the waves actually hold as missing. `ok` is FALSE when no
## single definition fits, and the long column then gets none.
.lasa_long_user_missing <- function(columns) {
  definitions <- lapply(columns, function(x) list(
    na_values = attr(x, "na_values", exact = TRUE),
    na_range = attr(x, "na_range", exact = TRUE)
  ))
  none <- list(na_values = NULL, na_range = NULL)
  if (length(definitions) == 0L) return(list(definition = none, ok = TRUE))
  if (length(unique(definitions)) == 1L) return(list(definition = definitions[[1L]], ok = TRUE))

  values <- lapply(columns, .lasa_bare)
  own <- Map(.lasa_user_missing, values, definitions)
  fits <- function(definition) {
    all(vapply(
      seq_along(values),
      function(i) identical(.lasa_user_missing(values[[i]], definition), own[[i]]),
      logical(1)
    ))
  }
  sorted_or_null <- function(x) if (length(x) > 0L) sort(unique(x)) else NULL

  ranges <- unique(Filter(Negate(is.null), lapply(definitions, `[[`, "na_range")))
  together <- list(
    na_values = sorted_or_null(unlist(lapply(definitions, `[[`, "na_values"))),
    na_range = if (length(ranges) == 1L) ranges[[1L]] else NULL
  )
  if (length(ranges) <= 1L && fits(together)) return(list(definition = together, ok = TRUE))

  held <- list(na_values = sorted_or_null(unlist(Map(`[`, values, own))), na_range = NULL)
  if (fits(held)) return(list(definition = held, ok = TRUE))
  list(definition = none, ok = FALSE)
}

## The attributes (other than structural ones) of a long column built from
## the wide `columns` (a list named by wave): what all waves share, the
## harmonized version where they differ, "wave_label"/"labels_wave" as one
## entry per wave, and a user-missing definition that fits every wave.
## Returns list(attributes, user_missing_lost), the latter TRUE when the
## waves' user-missing definitions couldn't be combined.
.lasa_long_attributes <- function(columns) {
  per_wave <- lapply(columns, function(x) {
    a <- attributes(x)
    a[setdiff(names(a), c(.lasa_structural_attrs, .lasa_transform_attrs))]
  })
  first_of <- function(name) {
    for (a in per_wave) if (!is.null(a[[name]])) return(a[[name]])
    NULL
  }
  user_missing <- .lasa_long_user_missing(columns)

  out <- list()
  for (nm in union(unique(unlist(lapply(per_wave, names))), c("na_values", "na_range"))) {
    if (nm %in% c("na_values", "na_range")) {
      if (!is.null(user_missing$definition[[nm]])) out[[nm]] <- user_missing$definition[[nm]]
      next
    }
    present <- !vapply(per_wave, function(a) is.null(a[[nm]]), logical(1))
    values <- lapply(per_wave[present], function(a) a[[nm]])

    if (identical(nm, "wave_label")) {
      scalar_text <- all(vapply(values, function(v) is.character(v) && length(v) == 1L, logical(1)))
      out[[nm]] <- if (scalar_text) unlist(values) else values
      next
    }
    if (identical(nm, "labels_wave")) {
      out[[nm]] <- values
      next
    }
    if (length(unique(values)) == 1L) {
      out[[nm]] <- values[[1L]]
      next
    }
    merged <- switch(nm,
      label = {
        harmonized <- first_of("harmonized_label")
        if (!is.null(harmonized)) harmonized else values[[1L]]
      },
      labels = .lasa_union_value_labels(values, harmonized = first_of("labels_harmonized")),
      values[[1L]]
    )
    if (!is.null(merged)) out[[nm]] <- merged
  }
  list(attributes = out, user_missing_lost = !user_missing$ok)
}

## Gives a stacked long column its non-structural attributes, keeping the
## value-label vectors' type in line with a labelled column's values.
.lasa_set_attributes <- function(x, attrs) {
  if (inherits(x, "haven_labelled")) {
    base_type <- typeof(unclass(x))
    for (nm in intersect(names(attrs), c("labels", "na_values"))) {
      if (!is.null(attrs[[nm]]) && typeof(attrs[[nm]]) != base_type) {
        converted <- .lasa_as_type(attrs[[nm]], base_type)
        names(converted) <- names(attrs[[nm]])
        attrs[[nm]] <- converted
      }
    }
  }
  for (nm in names(attrs)) attr(x, nm) <- attrs[[nm]]
  x
}

## `x` converted to the base type `type` (as given by typeof()).
.lasa_as_type <- function(x, type) {
  switch(type,
    logical = as.logical(x),
    integer = as.integer(x),
    double = as.double(x),
    character = as.character(x),
    complex = as.complex(x),
    stop("Can't convert values to type '", type, "'.", call. = FALSE)
  )
}

## What `data`'s own provenance says: its "LASA_file_code" and "LASA_wave"
## (as read_lasa_sav() sets them); `listed`, the columns its label report
## lists (NULL without a label report); and `alias`, for columns matched to
## a documented name other than their own (fuzzy matching,
## name_corrections, or a standardized wave-stripped name), that name. A
## merge keeps the first data set's attributes, so they only describe the
## columns of the file they came from: those its label report lists.
.lasa_provenance <- function(data) {
  is_scalar_text <- function(x) is.character(x) && length(x) == 1L && !is.na(x) && nzchar(x)
  file_code <- attr(data, "LASA_file_code", exact = TRUE)
  wave <- attr(data, "LASA_wave", exact = TRUE)
  out <- list(
    file_code = if (is_scalar_text(file_code)) .lasa_normalize_filecode(file_code) else NULL,
    wave = if (is_scalar_text(wave)) toupper(wave) else NULL,
    listed = NULL,
    alias = NULL
  )
  report <- attr(data, "label_report", exact = TRUE)
  if (is.data.frame(report) && all(c("suffix", "matched_name", "direction") %in% names(report))) {
    matched <- !is.na(report$direction) & report$direction == "matched"
    # The file's columns the label database doesn't document (all of a 4B
    # file's, say) are its columns too.
    undocumented <- !is.na(report$direction) & report$direction == "data_not_documented"
    standardized <- if ("standardized_to" %in% names(report)) {
      report$standardized_to[matched]
    } else {
      rep(NA_character_, sum(matched))
    }
    in_data <- tolower(c(report$matched_name[matched], standardized))
    documented <- rep(tolower(report$suffix[matched]), 2L)
    out$listed <- .lasa_hash_set(c(in_data, tolower(report$matched_name[undocumented])))
    keep <- !is.na(in_data) & !is.na(documented) & in_data != documented & !duplicated(in_data)
    out$alias <- .lasa_hash(stats::setNames(as.list(documented[keep]), in_data[keep]))
  }
  out
}

## Returns a function(name, x) telling whether column `x`, named `name`, is
## a wave-specific (wide) column: NULL if not; otherwise a "candidate", a
## list of
##   wave, stem, fc  the label-database rows the name may stand for, in
##                   calendar order: wave, long-format (canonical) name,
##                   and file code;
##   place           which of those rows the column's own canonical_name
##                   attribute points to (all of them if it points to none);
##   stem_4b         for a "b" name of a cohort baseline's wave file, its
##                   long-format name at wave 4B, whose files use the same
##                   names but which the label database doesn't document
##                   yet (NA otherwise);
##   stem_other      its long-format name at a wave the label database
##                   doesn't document it for (see `own_wave`): stem_4b, or
##                   else the one of `place`, or the latest of them;
##   own_wave        the wave of the data's own file (the data's
##                   "LASA_wave"), for a column the data's label report lists
##                   under a name LASA's wave files share across waves --
##                   one without a wave prefix, or a baseline wave file's
##                   "b" name in a baseline's file -- whether or not the
##                   label database documents the name for that wave (it
##                   doesn't for waves 4B and L yet); NA otherwise;
##   unprefixed      whether it is one of the names LASA's wave files use
##                   without a wave prefix, which are their own long-format
##                   names too;
##   also_long       in long data, whether the name is also another
##                   variable's long-format name, and the column doesn't
##                   say which it is (see .lasa_resolve_wide_columns());
##   trusted         whether the data's provenance describes the column;
##   time            for a Time-prefixed column (t<Time>_<name>, read when
##                   `time_columns` is TRUE), its Time, with `stem` its
##                   long-format name and no `wave`; NA otherwise.
## In long data (`long_mode`), canonical names are long columns.
.lasa_wave_candidates <- function(db_info, provenance, long_mode, time_columns = FALSE) {
  waves_table <- .lasa_wave_table()
  is_scalar_text <- function(x) is.character(x) && length(x) == 1L && !is.na(x) && nzchar(x)
  rows_of <- db_info$wide_rows
  max_time <- max(.lasa_cohort_times(), na.rm = TRUE)
  # Waves the label database documents no variable for yet (4B, L).
  undocumented <- setdiff(waves_table$wave, c("A", rows_of$wave))

  candidate <- function(wave, stem, fc = rep(NA_character_, length(wave)), place = seq_along(wave),
                        stem_4b = NA_character_, unprefixed = FALSE, trusted = TRUE, time = NA_integer_,
                        own_wave = NA_character_, stem_other = if (length(stem) > 0L) stem[[length(stem)]] else NA_character_,
                        also_long = FALSE) {
    list(
      wave = wave, stem = stem, fc = fc, place = place, stem_4b = stem_4b, stem_other = stem_other,
      own_wave = own_wave, unprefixed = unprefixed, also_long = also_long, trusted = trusted, time = time
    )
  }

  ## The wave of the data's own file for column `lower`, if its label report
  ## lists the column and the name is one LASA's wave files share across
  ## waves (see `own_wave` above).
  own_wave_of <- function(lower, unprefixed, baseline_name) {
    wave <- provenance$wave
    if (is.null(wave) || !wave %in% waves_table$wave) return(NA_character_)
    if (is.null(provenance$listed) || !.lasa_has(provenance$listed, lower)) return(NA_character_)
    if (unprefixed || (baseline_name && wave %in% .lasa_baselines)) wave else NA_character_
  }

  from_rows <- function(rows, lower, canonical_attr, trusted, also_long = FALSE) {
    rows <- rows[order(match(rows_of$wave[rows], waves_table$wave))]
    wave <- rows_of$wave[rows]
    stem <- rows_of$cn[rows]
    place <- seq_along(rows)
    if (!is.na(canonical_attr) && any(stem == canonical_attr)) place <- which(stem == canonical_attr)
    # Every cohort's baseline wave files use plain "b" names (Z files have
    # their own, such as b2oak), and wave 4B's do too. At 4B, a name most
    # likely stands for what it is at the latest replenishment cohort's
    # baseline (3B); for what it is at the migrant cohort's (MB) last.
    in_baseline_file <- which(
      wave %in% c("B", "2B", "3B", "MB") & startsWith(rows_of$vn[rows], "b") & !rows_of$z_file[rows]
    )
    stem_4b <- NA_character_
    if (length(in_baseline_file) > 0L) {
      preferred <- intersect(in_baseline_file, place)
      if (length(preferred) == 0L) preferred <- in_baseline_file
      stem_4b <- stem[[preferred[[which.min(match(wave[preferred], c("3B", "2B", "B", "MB")))]]]]
    }
    unprefixed <- !any(rows_of$prefixed[rows])
    candidate(
      wave, stem, rows_of$fc[rows], place, stem_4b, unprefixed, trusted,
      own_wave = own_wave_of(lower, unprefixed, length(in_baseline_file) > 0L),
      stem_other = if (!is.na(stem_4b)) stem_4b else stem[[place[[length(place)]]]],
      also_long = also_long
    )
  }

  ## A wave prefix followed by a canonical name documented for that wave
  ## (for wave 4B, whose files use the baselines' names, at a baseline): the
  ## names .lasa_to_wide() gives columns without a LASA name. Also, as long
  ## data keep values at waves the label database doesn't document them for:
  ## a wave-specific variable at the waves it documents nothing for yet (4B,
  ## L; lhhnch, the name LASA's wave L files use too), and a variable LASA's
  ## wave files name without a wave prefix at any wave (kseh_reden).
  match_prefix <- function(lower) {
    for (i in order(-nchar(waves_table$prefix))) {
      p <- waves_table$prefix[[i]]
      if (!startsWith(lower, p)) next
      stem <- substring(lower, nchar(p) + 1L)
      wave <- waves_table$wave[[i]]
      documented <- .lasa_has(db_info$canonical_wave, paste(stem, wave, sep = "\r")) ||
        (identical(wave, "4B") && .lasa_has(db_info$baseline_stems, stem)) ||
        (wave %in% undocumented && .lasa_has(db_info$time_varying, stem)) ||
        (!identical(wave, "A") && .lasa_has(db_info$unprefixed_stems, stem))
      if (nzchar(stem) && documented) return(candidate(wave, stem))
    }
    NULL
  }

  ## In long data, a name the data's own file lists, if that is a LASA file
  ## of a wave the label database documents nothing for yet (L): that
  ## wave's prefix followed by a wave-specific variable (lhhnch), as for the
  ## waves it documents.
  match_own_file <- function(lower) {
    wave <- provenance$wave
    if (is.null(provenance$file_code) || !isTRUE(wave %in% undocumented) || !.lasa_has(provenance$listed, lower)) {
      return(NULL)
    }
    p <- waves_table$prefix[[match(wave, waves_table$wave)]]
    stem <- substring(lower, nchar(p) + 1L)
    if (!startsWith(lower, p) || !nzchar(stem) || !.lasa_has(db_info$time_varying, stem)) return(NULL)
    candidate(wave, stem, own_wave = wave)
  }

  ## t<Time>_<name>: the names .lasa_to_wide() gives with prefix = "Time".
  match_time <- function(name) {
    parts <- regmatches(name, regexec("^[tT](0|[1-9][0-9]?)_(.+)$", name))[[1L]]
    if (length(parts) != 3L || as.integer(parts[[2L]]) > max_time) return(NULL)
    candidate(character(0), parts[[3L]], time = as.integer(parts[[2L]]))
  }

  function(name, x) {
    # 1. A wide column transform_lasa_data() made itself and tagged, as long
    # as it keeps the name it was tagged under: R gives a column computed
    # from it (a change score, say) the same attributes, but that is
    # another variable.
    tagged_wave <- attr(x, "LASA_wave", exact = TRUE)
    tagged_name <- attr(x, "LASA_long_name", exact = TRUE)
    if (is_scalar_text(tagged_wave) && toupper(tagged_wave) %in% waves_table$wave && is_scalar_text(tagged_name) &&
      identical(attr(x, "LASA_wide_name", exact = TRUE), name)) {
      return(candidate(toupper(tagged_wave), tagged_name))
    }

    lower <- tolower(name)
    canonical_attr <- attr(x, "canonical_name", exact = TRUE)
    canonical_attr <- if (is_scalar_text(canonical_attr)) tolower(canonical_attr) else NA_character_
    rows <- .lasa_lookup(db_info$wide_index, lower)

    # In long data, a canonical name is a long column, unless the column's
    # own canonical_name attribute says it is another variable whose
    # wave-specific name it is (MB's immse01, the long name of bimmse01, is
    # wave I's name for mmse01). Without that attribute (merge() drops it),
    # the rows its values are on decide (also_long). A name LASA's wave
    # files use without a wave prefix is both (see
    # .lasa_resolve_wide_columns()).
    unprefixed <- !is.null(rows) && !any(rows_of$prefixed[rows])
    also_long <- FALSE
    if (long_mode && !unprefixed && (.lasa_has(db_info$canonical, lower) || identical(canonical_attr, lower))) {
      other_variable <- !is.na(canonical_attr) && canonical_attr != lower &&
        !is.null(rows) && any(rows_of$cn[rows] == canonical_attr)
      also_long <- is.na(canonical_attr) && !is.null(rows) && any(rows_of$cn[rows] != lower)
      if (!other_variable && !also_long) return(NULL)
    }

    # 2. The documented name the label report says the column was matched
    # to (fuzzy matching, name_corrections), or a documented wave-specific
    # name.
    trusted <- is.null(provenance$listed) || .lasa_has(provenance$listed, lower)
    alias <- .lasa_lookup(provenance$alias, lower)
    alias_rows <- .lasa_lookup(db_info$wide_index, alias)
    if (!is.null(alias_rows) && (is.na(canonical_attr) || any(rows_of$cn[alias_rows] == canonical_attr))) {
      return(from_rows(alias_rows, lower, canonical_attr, TRUE))
    }
    if (!is.null(rows)) return(from_rows(rows, lower, canonical_attr, trusted, also_long))
    if (long_mode) return(match_own_file(lower))
    # A name LASA's wave files use without a wave prefix that stands for a
    # variable measured at several waves (MB file 048's partner), as the
    # data's own file documents it.
    if (!is.null(provenance$file_code) && !is.null(provenance$wave) && .lasa_has(provenance$listed, lower)) {
      stem <- .lasa_lookup(db_info$file_names, paste(provenance$file_code, provenance$wave, lower, sep = "\r"))
      if (!is.null(stem)) {
        return(candidate(provenance$wave, stem, provenance$file_code, unprefixed = TRUE, own_wave = provenance$wave))
      }
    }
    if (.lasa_has(db_info$documented, lower)) return(NULL)

    # 3. In wide data, transform_lasa_data()'s own wide names: Time-prefixed
    # ones (when the cohort column they come with is there), and
    # wave-prefixed ones.
    if (time_columns) {
      time_candidate <- match_time(name)
      if (!is.null(time_candidate)) return(time_candidate)
    }
    match_prefix(lower)
  }
}

## The wave the data's provenance gives candidate `cand` (see
## .lasa_wave_candidates()) among the waves `options`, or NA: the wave of
## the data's own file for a name its wave files share (`own_wave`, such as
## 4B for a "b" name in a 4B file); else the only one of its waves
## documented in the data's file; else the data's own wave -- as long as
## the provenance describes the column at all, and is a LASA file's: a
## "LASA_wave" without a file code may be transform_lasa_data()'s own,
## naming the single wave its result spans, which may have been a guess.
.lasa_provenance_wave <- function(cand, provenance, options) {
  if (!isTRUE(cand$trusted) || !is.na(cand$time)) return(NA_character_)
  if (isTRUE(cand$own_wave %in% options)) return(cand$own_wave)
  place <- cand$place[cand$wave[cand$place] %in% options]
  waves <- unique(cand$wave[place])
  if (!is.null(provenance$file_code)) {
    in_file <- unique(cand$wave[place][!is.na(cand$fc[place]) & cand$fc[place] == provenance$file_code])
    if (length(in_file) == 1L) return(in_file)
    if (length(in_file) > 1L) waves <- in_file
  }
  if (!is.null(provenance$file_code) && !is.null(provenance$wave) && provenance$wave %in% waves) {
    return(provenance$wave)
  }
  NA_character_
}

## The long-format name of candidate `cand` at `wave`: preferably the one
## its canonical_name attribute points to, else the one documented in the
## data's own file, else the one the name stands for at most of its other
## waves (wave MB's bmmsesc1 is file 221's mmsesc and file 421's mmsesc1,
## which bmmsesc1 is at waves B, 2B and 3B) -- then with attribute
## "alternatives", the names it might have been. At a wave the label
## database doesn't document the name for, `stem_other`.
.lasa_candidate_stem <- function(cand, wave, provenance) {
  if (!is.na(cand$time)) return(cand$stem)
  at_wave <- which(cand$wave == wave)
  if (length(at_wave) == 0L) return(cand$stem_other)
  preferred <- intersect(at_wave, cand$place)
  if (length(preferred) == 0L) preferred <- at_wave
  in_file <- preferred[isTRUE(cand$trusted) & !is.na(cand$fc[preferred]) & cand$fc[preferred] %in% provenance$file_code]
  if (length(in_file) > 0L) preferred <- in_file
  stems <- unique(cand$stem[preferred])
  if (length(stems) == 1L) return(stems)
  elsewhere <- cand$stem[-at_wave]
  counts <- vapply(stems, function(s) sum(elsewhere == s), integer(1))
  structure(stems[[which.max(counts)]], alternatives = stems)
}

## open[r, k]: whether respondent r's cohort may take part in wave
## `options[[k]]` as far as `possible` (see .lasa_possible_cohorts()) shows
## it -- always for wave A, which isn't any cohort's. `takes_part` is
## !is.na(.lasa_cohort_times()).
.lasa_open_waves <- function(options, possible, takes_part) {
  open <- matrix(TRUE, nrow = nrow(possible), ncol = length(options))
  for (k in seq_along(options)) {
    cohorts <- takes_part[options[[k]], ]
    if (any(cohorts)) open[, k] <- rowSums(possible[, cohorts, drop = FALSE]) > 0L
  }
  open
}

## Decides which columns of `data` are wave-specific (wide) columns, and
## the wave each of their values belongs to. Returns list(spec, sources,
## guessed_sources, guessed, guessed_columns, ambiguous, candidates, shown):
## `spec` has one row per wide column and wave -- `column`, `stem` (its
## long-format name), `wave`, `position` (its index in `data`), and
## `original` (its name, NA if its values went to several waves or it is
## Time-prefixed); `sources[[k]]` gives, per respondent, the row of `data`
## holding spec row k's value (NA for none), and `guessed_sources[[k]]`
## whether that value's wave was guessed; `guessed_columns` are the columns
## whose wave had to be guessed for some respondents' values, `guessed` the
## same with those waves, and `ambiguous` the columns whose name stands for
## several variables at a wave (see .lasa_candidate_stem()), for messages;
## `candidates` the wide columns' candidates (see .lasa_wave_candidates());
## `shown` (respondents x waves of .lasa_wave_table()) the wave of the
## data's LASA file, when only one cohort takes part in it, at which that
## file shows its respondents (see the comment in the code). `ids` names
## each respondent in messages; `time` is the Time long data already have
## (per row) and `baseline` each respondent's baseline wave as a cohort
## column gives it (NULL without either, see .lasa_given_baselines());
## `cohort_column` says whether there is such a column, with which wide
## data's Time-prefixed columns are read.
## `simulate` = TRUE reads `data` the way transform_lasa_data() would
## without its provenance attributes (which a merge drops), clashing
## columns or warnings: how wide data it made itself will be read back.
##
## In long data, a column whose values are all on rows of waves its name
## stands for (see the comment in the code) holds each value at its row's
## wave. Otherwise a column holds one value per respondent (a wide
## column's, or one merged into long data by respnr), which goes to the
## column's wave -- or, for a name LASA uses at several waves (every
## cohort's baseline files use the same "b" names), to the only one of them
## the respondent's cohort takes part in, as far as the data show it
## (.lasa_possible_cohorts()); else to the wave the data's provenance gives
## the column; else to a guess: the data's own wave if it is one of them,
## or the earliest. A Time-prefixed column's values go to the wave with
## that Time in each respondent's cohort.
.lasa_resolve_wide_columns <- function(data, skip, long_mode, wave_codes, resp, db_info, ids,
                                       time = NULL, baseline = NULL, cohort_column = !is.null(baseline),
                                       simulate = FALSE) {
  all_waves <- .lasa_wave_table()$wave
  cohort_times <- .lasa_cohort_times()
  takes_part <- !is.na(cohort_times)
  n_resp <- resp$n
  # Waves the label database documents no variable for yet (4B, L).
  undocumented <- setdiff(all_waves, c("A", db_info$wide_rows$wave))
  provenance <- if (simulate) list() else .lasa_provenance(data)
  candidates_of <- .lasa_wave_candidates(
    db_info, provenance, long_mode,
    time_columns = !long_mode && cohort_column
  )

  cands <- list()
  for (j in seq_along(data)) {
    name <- names(data)[[j]]
    if (name %in% skip) next
    cand <- candidates_of(name, data[[j]])
    if (is.null(cand)) next
    cand$position <- j
    cands[[name]] <- cand
  }
  has_value <- lapply(cands, function(cand) !.lasa_is_na(data[[cand$position]]))

  row_of <- NULL
  already_long <- stats::setNames(rep(FALSE, length(cands)), names(cands))
  if (long_mode) {
    row_of <- matrix(NA_integer_, nrow = n_resp, ncol = length(all_waves), dimnames = list(NULL, all_waves))
    row_of[cbind(resp$r, match(wave_codes, all_waves))] <- seq_along(wave_codes)
    long_columns <- character(0)
    # Values all on rows of waves the column's name stands for are long
    # already: wave files of several cohorts' baselines, say, read with
    # LASA's own names and stacked. That includes wave 4B for a "b" name,
    # the wave of the data's own file for a name its wave files share
    # (`own_wave`), and for a name without a wave prefix, the waves the
    # label database doesn't document yet -- and any wave, when its values
    # differ between a respondent's rows, as a column merged in by respnr
    # never does.
    waves_of <- list()
    for (name in names(cands)) {
      cand <- cands[[name]]
      has <- has_value[[name]]
      if (isTRUE(cand$also_long)) {
        # A name that is another variable's long name too (MB's immse01) is
        # that long column, unless its values are on rows of other waves.
        long_waves <- all_waves[vapply(all_waves, function(w) {
          .lasa_has(db_info$canonical_wave, paste(tolower(name), w, sep = "\r"))
        }, logical(1))]
        if (!any(has) || all(wave_codes[has] %in% long_waves)) {
          long_columns <- c(long_columns, name)
          next
        }
      }
      waves_of[[name]] <- c(
        cand$wave, if (!is.na(cand$stem_4b)) "4B", if (!is.na(cand$own_wave)) cand$own_wave,
        if (cand$unprefixed) undocumented
      )
      already_long[[name]] <- any(has) && (all(wave_codes[has] %in% waves_of[[name]]) ||
        (cand$unprefixed && .lasa_varies_within(data[[cand$position]], resp$r, n_resp)))
    }
    # In the data of a LASA file (its waves stacked), a name of the file
    # without a wave prefix is long also at the waves LASA's topic overview
    # lists the file at that the label database doesn't document of it yet
    # (file 045 at K): those rows are the file's -- unless the file's
    # wave-prefixed columns are wide here (a wide file joined onto other
    # long data, keeping its attributes), so the rows are the other data's.
    gaps <- if (is.null(provenance$file_code)) NULL else .lasa_lookup(db_info$file_gaps, provenance$file_code)
    in_file <- function(cand) isTRUE(cand$trusted) && isTRUE(provenance$file_code %in% cand$fc)
    file_wide <- any(vapply(names(waves_of), function(name) {
      !cands[[name]]$unprefixed && in_file(cands[[name]]) && any(has_value[[name]]) && !already_long[[name]]
    }, logical(1)))
    if (length(gaps) > 0L && !file_wide) {
      for (name in names(waves_of)) {
        cand <- cands[[name]]
        has <- has_value[[name]]
        if (!already_long[[name]] && cand$unprefixed && in_file(cand)) {
          already_long[[name]] <- any(has) && all(wave_codes[has] %in% c(waves_of[[name]], gaps))
        }
      }
    }
    cands[long_columns] <- NULL
    has_value[long_columns] <- NULL
    already_long <- already_long[names(cands)]
    if (!simulate) .lasa_warn_repeated(data, names(cands)[already_long], has_value, wave_codes, resp)
    # A name LASA's wave files use without a wave prefix (xcancer1) is its
    # own long-format name: long already, it is simply a long column.
    kept <- names(cands)[already_long & vapply(cands, `[[`, logical(1), "unprefixed")]
    cands[kept] <- NULL
    has_value[kept] <- NULL
    already_long <- already_long[names(cands)]
  }

  # Wave 4B's own files are read with LASA's "b" names, which the label
  # database documents for the other cohorts' baselines only: where the
  # data show any 4B, a "b" name may stand for 4B too.
  consider_4b <- (long_mode && "4B" %in% wave_codes) || identical(provenance$wave, "4B") ||
    "4B" %in% baseline || any(vapply(cands, function(cand) "4B" %in% cand$wave, logical(1)))
  options_of <- function(cand) {
    options <- unique(cand$wave[cand$place])
    if (consider_4b && !is.na(cand$stem_4b)) options <- c(options, "4B")
    if (!is.na(cand$own_wave)) options <- c(options, cand$own_wave)
    all_waves[all_waves %in% options]
  }

  # What the data show about each respondent's cohort: in the data of a
  # LASA file of a wave only one cohort takes part in
  # (.lasa_cohort_file_wave()), every respondent of the file, whatever
  # their values (`shown`, which .lasa_to_long() takes for their Time too):
  # in long data all of whose rows are of that wave, every respondent with
  # a row that holds more than values an earlier transformation placed
  # there by a guess; in wide data, every respondent, as long as nothing is
  # joined on (every column is one of the file's own, `of_file`); once other
  # data are joined on, also onto long data (a wide file joined onto other
  # long data keeps its attributes), every respondent with a value in a wide
  # column of the file's own. Further, values (other than missing-value
  # codes) of the long data's wave-specific columns on their row's wave, and
  # of columns with a single wave -- for a "b" name that may stand for 4B,
  # at that wave or 4B (`allowed`, by cohort, below).
  file_wave <- .lasa_cohort_file_wave(provenance)
  has_data <- matrix(FALSE, nrow = n_resp, ncol = length(all_waves), dimnames = list(NULL, all_waves))
  in_file <- rep(FALSE, n_resp)
  # The file's own columns: those its label report lists, and the names
  # wide format gives columns of its wave (mblphya09) -- not a column of
  # that wave another LASA file has (a Z file's).
  of_file <- function(name) {
    cand <- cands[[name]]
    .lasa_has(provenance$listed, tolower(name)) ||
      (!is.null(cand) && is.na(cand$time) && identical(options_of(cand), file_wave) &&
        all(is.na(cand$fc) | cand$fc %in% provenance$file_code))
  }
  if (long_mode) {
    # The long data's own columns, without the wide ones merged into them.
    columns <- list()
    for (j in seq_along(data)) {
      name <- names(data)[[j]]
      if (name %in% skip || (name %in% names(cands) && !already_long[[name]])) next
      columns[[name]] <- data[[j]]
    }
    chosen <- .lasa_evidence_columns(columns, resp$r, n_resp, db_info, documented = names(cands))
    # A value an earlier transformation placed at a guessed wave doesn't
    # show the wave either.
    exclude <- .lasa_guessed_rows(chosen$held, ids[resp$r], wave_codes)
    if (!is.null(file_wave) && all(wave_codes == file_wave)) {
      in_file[resp$r[!.lasa_only_guessed_rows(chosen$held, exclude, nrow(data))]] <- TRUE
    } else {
      real_rows <- .lasa_long_real_rows(chosen$evidence, nrow(data), db_info, wave_codes, exclude = exclude)
      has_data <- .lasa_long_has_data(real_rows, resp$r, n_resp, wave_codes)
    }
  } else if (!is.null(file_wave)) {
    # Without a label report, every column counts as the file's.
    if (is.null(provenance$listed) || all(vapply(setdiff(names(data), skip), of_file, logical(1)))) {
      in_file[] <- TRUE
    }
  }
  if (!is.null(file_wave) && !all(in_file)) {
    for (name in names(cands)) {
      if (is.na(cands[[name]]$time) && !already_long[[name]] && of_file(name)) {
        in_file[resp$r[has_value[[name]]]] <- TRUE
      }
    }
  }
  shown <- matrix(FALSE, nrow = n_resp, ncol = length(all_waves), dimnames = list(NULL, all_waves))
  if (any(in_file)) shown[in_file, file_wave] <- TRUE
  has_data <- has_data | shown

  if (length(cands) == 0L) {
    return(list(
      spec = .lasa_spec(), sources = list(), guessed_sources = list(), guessed = character(0),
      guessed_columns = character(0), ambiguous = character(0), ambiguous_columns = character(0),
      candidates = list(), shown = shown
    ))
  }
  ## Which values of candidate column `name` show that their respondent took
  ## part (.lasa_real_value()), at the waves `waves` they may be at -- with
  ## `each = TRUE`, each row's own.
  real_at <- function(name, waves, each = FALSE) {
    .lasa_real_value(data[[name]], c(name, cands[[name]]$stem), db_info, waves, each = each)
  }

  allowed <- matrix(TRUE, nrow = n_resp, ncol = ncol(takes_part))
  # Respondents with a value (other than a missing-value code) in a column
  # of waves other than A: the data show them at such a wave, also where
  # the column's name doesn't say which.
  in_lasa <- rep(FALSE, n_resp)
  for (name in names(cands)) {
    cand <- cands[[name]]
    if (!is.na(cand$time) || already_long[[name]]) next
    options <- options_of(cand)
    who <- unique(resp$r[real_at(name, options)])
    if (!"A" %in% options) in_lasa[who] <- TRUE
    if (length(options) == 1L) {
      has_data[who, options] <- TRUE
    } else if (length(options) == 2L && identical(options[[2L]], "4B") && !is.na(cand$stem_4b) &&
      length(unique(cand$wave[cand$place])) == 1L) {
      either <- takes_part[options[[1L]], ] | takes_part["4B", ]
      allowed[who, ] <- allowed[who, , drop = FALSE] &
        matrix(either, nrow = length(who), ncol = length(either), byrow = TRUE)
    }
  }
  # Time-prefixed wide data give a respondent with values in Time-prefixed
  # columns no cohort only where their respondent number doesn't say it, or
  # the rest of the data ruled it out: the number doesn't count for them.
  numbers <- ids
  if (!long_mode && !is.null(baseline)) {
    timed <- rep(FALSE, n_resp)
    for (name in names(cands)) {
      if (!is.na(cands[[name]]$time)) timed[unique(resp$r[has_value[[name]]])] <- TRUE
    }
    numbers[timed & is.na(baseline)] <- NA_character_
  }
  ## The cohorts each respondent's number leaves open (.lasa_id_cohorts()),
  ## a 1 only for respondents the data show at a wave other than A.
  numbers_say <- function(has_data) {
    .lasa_id_cohorts(numbers, in_lasa | rowSums(has_data[, all_waves != "A", drop = FALSE]) > 0L)
  }
  by_id <- numbers_say(has_data)
  possible <- .lasa_possible_cohorts(has_data, baseline, time, resp$r, wave_codes, ids, allowed, by_id)

  ## Each respondent's single value of long-data column `x`: the row it is
  ## on (the first, if repeated). A respondent's rows may not disagree.
  value_rows <- function(x, name, waves, has) {
    conflicts <- which(.lasa_distinct_values(resp$r, .lasa_value_key(x), n_resp) > 1L)
    if (length(conflicts) > 0L) {
      stop(
        "Column '", name, "' holds the values of wave ", paste(waves, collapse = "/"),
        ", but has different values on different rows of ", length(conflicts),
        " respondent(s) (e.g. respondent ", ids[[conflicts[[1L]]]], "); a ",
        "wave-specific column can hold only one value per respondent.",
        call. = FALSE
      )
    }
    .lasa_first_row(resp$r, n_resp, keep = has)
  }

  ## Places column `name` (see the comment above): list(waves, sources,
  ## guessed_waves, guessed), `guessed` marking the respondents whose value
  ## (other than a missing-value code) was placed at a guessed wave, one of
  ## `guessed_waves`.
  place <- function(name, possible) {
    cand <- cands[[name]]
    x <- data[[cand$position]]
    has <- has_value[[name]]
    nobody <- rep(FALSE, n_resp)
    placed <- function(waves, sources, guessed_waves = character(0), guessed = nobody) {
      list(waves = waves, sources = sources, guessed_waves = guessed_waves, guessed = guessed)
    }
    if (!is.na(cand$time)) return(place_time(name, cand, has, possible, placed))
    options <- options_of(cand)

    if (!any(has)) {
      wave <- .lasa_provenance_wave(cand, provenance, options)
      return(placed(if (is.na(wave)) options[[1L]] else wave, list(rep(NA_integer_, n_resp))))
    }
    if (already_long[[name]]) {
      observed <- all_waves[all_waves %in% wave_codes[has]]
      return(placed(observed, lapply(observed, function(w) row_of[, w])))
    }

    # One value per respondent: a wide column's, or one merged into long
    # data by respnr (and so repeated on the respondent's rows).
    rows <- if (long_mode) value_rows(x, name, options, has) else ifelse(has, seq_len(n_resp), NA_integer_)
    if (length(options) == 1L) {
      if (!long_mode) return(placed(options, list(seq_len(n_resp))))
      own <- row_of[, options]
      own_has_value <- !is.na(own) & has[ifelse(is.na(own), 1L, own)]
      return(placed(options, list(ifelse(own_has_value, own, rows))))
    }

    holders <- !is.na(rows)
    open <- .lasa_open_waves(options, possible, takes_part)
    assigned <- rep(NA_character_, n_resp)
    one <- holders & rowSums(open) == 1L
    assigned[one] <- options[max.col(open[one, , drop = FALSE], ties.method = "first")]
    rest <- holders & is.na(assigned)
    guessed <- nobody
    if (any(rest)) {
      wave <- .lasa_provenance_wave(cand, provenance, options)
      if (!is.na(wave)) {
        assigned[rest] <- wave
      } else {
        # A guess: for each respondent, the first wave their cohort may take
        # part in of the wave every respondent placed by their cohort got
        # (in data merged by respnr, a column holds one file's values), the
        # data's own wave, and the column's waves in calendar order.
        agreed <- unique(assigned[one])
        preference <- unique(c(
          if (length(agreed) == 1L) agreed,
          if (isTRUE(provenance$wave %in% options)) provenance$wave,
          options
        ))
        open_rest <- open[rest, match(preference, options), drop = FALSE]
        assigned[rest] <- preference[max.col(open_rest, ties.method = "first")]
        # A name LASA's wave files use without a wave prefix may stand for
        # the waves the label database doesn't document yet (4B, L) too: a
        # respondent whose cohort takes part in none of its documented waves
        # (the fourth cohort, say) gets the first of those their cohort
        # does, the data's own wave first.
        closed <- rest & rowSums(open) == 0L
        if (cand$unprefixed && any(closed)) {
          extra <- unique(c(if (isTRUE(provenance$wave %in% undocumented)) provenance$wave, undocumented))
          extra_open <- .lasa_open_waves(extra, possible[closed, , drop = FALSE], takes_part)
          to_extra <- which(closed)[rowSums(extra_open) > 0L]
          assigned[to_extra] <- extra[max.col(extra_open[rowSums(extra_open) > 0L, , drop = FALSE], ties.method = "first")]
        }
        # Only a value that shows the respondent took part makes the guess
        # matter: a missing-value code ("no observation ...") says nothing
        # about the wave it is placed at.
        row_wave <- rep(NA_character_, nrow(data))
        row_wave[rows[holders]] <- assigned[holders]
        real_holder <- nobody
        real_holder[holders] <- real_at(name, row_wave, each = TRUE)[rows[holders]]
        guessed <- rest & real_holder
      }
    }
    waves <- all_waves[all_waves %in% assigned]
    sources <- lapply(waves, function(w) ifelse(!is.na(assigned) & assigned == w, rows, NA_integer_))
    placed(waves, sources, all_waves[all_waves %in% assigned[guessed]], guessed)
  }

  ## Places Time-prefixed column `name` (wide data only): each value at the
  ## wave with that Time in its respondent's cohort.
  place_time <- function(name, cand, has, possible, placed) {
    at_time <- !is.na(cohort_times) & cohort_times == cand$time
    open <- (possible %*% t(at_time)) > 0
    if (!any(has)) {
      cohorts <- c(.lasa_baselines[.lasa_baselines %in% baseline], .lasa_baselines)
      cohort <- cohorts[colSums(at_time[, cohorts, drop = FALSE]) > 0L][[1L]]
      return(placed(all_waves[at_time[, cohort]], list(rep(NA_integer_, n_resp))))
    }
    n_open <- rowSums(open)
    unknown <- has & n_open != 1L
    if (any(unknown) && !simulate) {
      i <- which(unknown)[[1L]]
      if (!any(possible[i, ])) {
        stop(
          "Column '", name, "' holds a value for respondent ", ids[[i]], ", whom the rest of the data show at ",
          "waves of different cohorts, so the wave with Time ", cand$time, " is unknown for them.",
          call. = FALSE
        )
      }
      if (n_open[[i]] == 0L) {
        says <- attr(baseline, "says", exact = TRUE)
        shown_by <- if (!is.null(baseline) && !is.na(baseline[[i]])) {
          paste0(
            "('", if (is.null(says)) baseline[[i]] else says[[i]], "' in the '",
            attr(baseline, "column", exact = TRUE) %||% "cohort", "' column)"
          )
        } else {
          "(as the rest of the data show it)"
        }
        stop(
          "Column '", name, "' holds a value for respondent ", ids[[i]], ", whose cohort ", shown_by,
          " has no wave with Time ", cand$time, ".",
          call. = FALSE
        )
      }
      stop(
        "Column '", name, "' holds values for ", sum(unknown), " respondent(s) whose cohort ",
        "'data' don't show (e.g. respondent ", ids[[i]], ", without one in the 'cohort' column), so ",
        "the wave with Time ", cand$time, " is unknown for them.",
        call. = FALSE
      )
    }
    assigned <- rep(NA_character_, n_resp)
    known <- has & n_open == 1L
    assigned[known] <- all_waves[max.col(open[known, , drop = FALSE], ties.method = "first")]
    waves <- all_waves[all_waves %in% assigned]
    respondents <- seq_len(n_resp)
    placed(waves, lapply(waves, function(w) ifelse(!is.na(assigned) & assigned == w, respondents, NA_integer_)))
  }

  placed <- lapply(stats::setNames(names(cands), names(cands)), place, possible = possible)

  # In wide data, the waves the other columns were placed at without
  # guessing (by the data's provenance, say) may tell where a guessed
  # column's values belong: place those again.
  guessed_any <- vapply(placed, function(p) length(p$guessed_waves) > 0L, logical(1))
  if (!long_mode && any(guessed_any)) {
    for (name in names(cands)) {
      if (!is.na(cands[[name]]$time)) next
      p <- placed[[name]]
      for (k in seq_along(p$waves)) {
        has_data[!is.na(p$sources[[k]]) & real_at(name, p$waves[[k]]) & !p$guessed, p$waves[[k]]] <- TRUE
      }
    }
    possible <- .lasa_possible_cohorts(has_data, baseline, ids = ids, allowed = allowed, by_id = numbers_say(has_data))
    placed[guessed_any] <- lapply(names(cands)[guessed_any], place, possible = possible)
  }

  column <- character(0)
  stem <- character(0)
  wave <- character(0)
  position <- integer(0)
  original <- character(0)
  sources <- list()
  guessed_sources <- list()
  guessed <- character(0)
  guessed_columns <- character(0)
  ambiguous <- character(0)
  ambiguous_columns <- character(0)
  for (name in names(cands)) {
    cand <- cands[[name]]
    p <- placed[[name]]
    if (length(p$guessed_waves) > 0L) {
      guessed <- c(guessed, paste0(name, " (", paste(p$guessed_waves, collapse = "/"), ")"))
      guessed_columns <- c(guessed_columns, name)
    }
    for (k in seq_along(p$waves)) {
      stem_k <- .lasa_candidate_stem(cand, p$waves[[k]], provenance)
      alternatives <- attr(stem_k, "alternatives", exact = TRUE)
      if (!is.null(alternatives)) {
        ambiguous <- c(ambiguous, paste0(
          name, " at wave ", p$waves[[k]], " (", paste(alternatives, collapse = " or "), "; taken as ",
          stem_k, ")"
        ))
        ambiguous_columns <- c(ambiguous_columns, name)
      }
      column <- c(column, name)
      stem <- c(stem, as.vector(stem_k))
      wave <- c(wave, p$waves[[k]])
      position <- c(position, cand$position)
      original <- c(original, if (length(p$waves) == 1L && is.na(cand$time)) name else NA_character_)
      sources[[length(sources) + 1L]] <- p$sources[[k]]
      guessed_sources[[length(guessed_sources) + 1L]] <- p$guessed & !is.na(p$sources[[k]])
    }
  }
  spec <- .lasa_spec(column, stem, wave, position, original)
  if (!simulate) .lasa_check_clash(spec, sources)
  list(
    spec = spec, sources = sources, guessed_sources = guessed_sources, guessed = guessed,
    guessed_columns = guessed_columns, ambiguous = ambiguous, ambiguous_columns = ambiguous_columns,
    candidates = cands, shown = shown
  )
}

## The table of wide columns .lasa_resolve_wide_columns() returns.
.lasa_spec <- function(column = character(0), stem = character(0), wave = character(0),
                       position = integer(0), original = character(0)) {
  data.frame(
    column = column, stem = stem, wave = wave, position = position, original = original,
    stringsAsFactors = FALSE
  )
}

## Stops when several columns hold the same variable at the same wave for
## the same respondent (`spec` and `sources` as .lasa_resolve_wide_columns()
## returns them). Columns that do so for different respondents -- the
## Time-prefixed columns of different cohorts -- are combined.
.lasa_check_clash <- function(spec, sources) {
  key <- paste(spec$stem, spec$wave, sep = "\r")
  details <- character(0)
  for (k in unique(key[duplicated(key)])) {
    rows <- which(key == k)
    holders <- 0L
    for (i in rows) holders <- holders + !is.na(sources[[i]])
    if (any(holders > 1L)) {
      details <- c(details, paste0(
        spec$stem[[rows[[1L]]]], " at wave ", spec$wave[[rows[[1L]]]],
        " (", paste(spec$column[rows], collapse = ", "), ")"
      ))
    }
  }
  if (length(details) > 0L) {
    stop(
      "Several columns hold the same variable for the same wave: ",
      paste(details, collapse = "; "), ". Keep one of each before transforming.",
      call. = FALSE
    )
  }
  invisible(NULL)
}

## Warns about columns of long data (`names`, each value on a row of a wave
## its name stands for) that look like a wide column merged in by respnr
## rather than long already: the same value on every row of each
## respondent with one, at several waves (`has_value` per column).
.lasa_warn_repeated <- function(data, names, has_value, wave_codes, resp) {
  rows_per_respondent <- tabulate(resp$r, resp$n)
  repeated <- character(0)
  for (name in names) {
    has <- has_value[[name]]
    if (length(unique(wave_codes[has])) < 2L) next
    holders <- unique(resp$r[has])
    values_per_respondent <- tabulate(resp$r[has], resp$n)[holders]
    if (all(values_per_respondent == rows_per_respondent[holders]) && any(values_per_respondent > 1L) &&
      all(.lasa_distinct_values(resp$r, .lasa_value_key(data[[name]]), resp$n) <= 1L)) {
      repeated <- c(repeated, name)
    }
  }
  if (length(repeated) > 0L) {
    warning(
      "Column(s) ", paste(repeated, collapse = ", "), " hold the same value on every row of each ",
      "respondent, at several waves, as a wide column merged into long data by respnr would; each ",
      "value was kept at its row's wave. If such a column holds a single wave's values, add its ",
      "file in long format instead: transform it to long format, then merge by respnr and Wave.",
      call. = FALSE
    )
  }
  invisible(NULL)
}

## Warns about columns kept as they are although they look like LASA
## variables measured at several waves: names a merge suffixed (.x/.y), so
## their wave is unknown; in data that aren't long yet, columns
## read_lasa_sav() gave a wave-stripped name; and Time-prefixed names,
## which only wide data with their cohort column can be read with
## (`time_columns`: whether they were). Returns the Time-prefixed ones
## (invisibly).
.lasa_warn_unplaced <- function(data, columns, long_mode, db_info, time_columns = FALSE) {
  suffixed <- character(0)
  stripped <- character(0)
  time_named <- character(0)
  for (name in columns) {
    lower <- tolower(name)
    base <- sub("(\\.x|\\.y|\\.\\.\\.[0-9]+)$", "", lower)
    if (!identical(base, lower) && (.lasa_has(db_info$wide_index, base) || .lasa_has(db_info$time_varying, base))) {
      suffixed <- c(suffixed, name)
      next
    }
    parts <- regmatches(name, regexec("^[tT](0|[1-9][0-9]?)_(.+)$", name))[[1L]]
    if (!time_columns && length(parts) == 3L && .lasa_has(db_info$time_varying, tolower(parts[[3L]]))) {
      time_named <- c(time_named, name)
      next
    }
    canonical <- attr(data[[name]], "canonical_name", exact = TRUE)
    if (!long_mode && is.character(canonical) && length(canonical) == 1L &&
      .lasa_has(db_info$time_varying, tolower(canonical))) {
      stripped <- c(stripped, name)
    }
  }
  if (length(suffixed) > 0L) {
    warning(
      "Column(s) ", paste(suffixed, collapse = ", "), " look like wave-specific LASA ",
      "variables renamed by a merge (.x/.y), so ",
      if (long_mode) "they're kept as separate columns" else "their wave is unknown and they're kept as they are",
      ". Stack, rather than merge, files that hold the same columns for different respondents ",
      "(such as the files of different cohorts), and merge long data by respnr and Wave.",
      call. = FALSE
    )
  }
  if (length(stripped) > 0L) {
    warning(
      "Column(s) ", paste(stripped, collapse = ", "), " hold LASA variables measured at ",
      "several waves, but nothing in 'data' says which wave, so they're kept as columns ",
      "that hold for every wave. If they come from one wave's file (read with standardize ",
      "= TRUE, which strips the wave from names), add that file in long format instead: ",
      "transform the rest to long format, then merge by respnr and Wave.",
      call. = FALSE
    )
  }
  if (length(time_named) > 0L) {
    warning(
      "Column(s) ", paste(time_named, collapse = ", "), " look like the Time-prefixed columns of ",
      "transform_lasa_data(format = \"wide\", prefix = \"Time\"), which can only be read back from ",
      "wide data together with their 'cohort' column (each respondent's cohort), so they're kept ",
      "as they are.",
      call. = FALSE
    )
  }
  invisible(time_named)
}

## Adds (or refreshes) the "Wave" and "Time" columns of long data and puts
## them right after `id`; `drop` names columns they replace.
.lasa_place_wave_time <- function(columns, id, wave_codes, time, drop = character(0)) {
  wave <- wave_codes
  attr(wave, "label") <- .lasa_wave_column_label
  attr(time, "label") <- .lasa_time_column_label
  rest <- columns[setdiff(names(columns), c(id, "Wave", "Time", drop))]
  c(columns[id], list(Wave = wave, Time = time), rest)
}

## format = "long". Returns list(data, added, baseline): the long data;
## which of its rows were added for values of wide columns (rows `data`
## didn't have, always FALSE for data that weren't long yet); and each
## row's respondent's baseline wave (NA where the data don't show it; NULL
## for data without a wave dimension). `for_wide` = TRUE when the long data
## are a step towards wide format: then nothing is said about their Time,
## nor about long columns whose waves' types or user-missing codes don't
## combine, since wide format gives each wave its own back -- except, with
## `warn_numbers`, about respondent numbers the rest of the data rule out
## (see .lasa_long_times()), as the cohorts of Time-prefixed wide format
## follow the data. `renamed` (see .lasa_unique_copies()) names columns in
## errors.
.lasa_to_long <- function(data, db_info, for_wide = FALSE, renamed = .lasa_no_renamed, warn_numbers = !for_wide) {
  id <- .lasa_find_respnr(data)
  all_waves <- .lasa_wave_table()$wave
  data <- .lasa_combine_cohort_copies(data, id, db_info, renamed)

  wave_column <- .lasa_find_wave(data)
  wave_name <- wave_column$name
  wave_codes <- if (!is.null(wave_name)) .lasa_normalize_wave_codes(data[[wave_name]]) else NULL
  # A Z file read with standardize = TRUE has a placeholder "Wave" = "Z":
  # still wide data -- also merged with data without that column, which
  # leaves it missing on their rows, and on every row of data with one row
  # per respondent where none of them matched.
  placeholder <- !is.null(wave_name) && nrow(data) > 0L &&
    all(is.na(wave_codes) | !nzchar(wave_codes) | wave_codes == "Z") &&
    (any(wave_codes %in% "Z") || anyDuplicated(.lasa_value_key(data[[id]])) == 0L)
  long_mode <- !is.null(wave_name) && !placeholder
  if (long_mode) .lasa_check_wave_codes(wave_codes, wave_name)

  resp <- .lasa_respondents(data[[id]], id)
  row_ids <- .lasa_text_key(data[[id]])
  existing_time <- .lasa_existing_time(data, long_mode, wave_codes, row_ids, renamed)
  if (long_mode) {
    if (anyDuplicated(paste(resp$r, wave_codes, sep = "\r")) > 0L) {
      stop(
        "'data' has more than one row for the same respondent and wave; long data need ",
        "one row per respondent per wave.",
        call. = FALSE
      )
    }
  } else if (resp$n != nrow(data)) {
    i <- which(duplicated(resp$r))[[1L]]
    rows <- which(resp$r == resp$r[[i]])
    # Merging data sets by respnr and cohort gives a respondent they give
    # different cohorts a row for each.
    cohort <- .lasa_find_cohort(data)
    cohorts <- if (is.null(cohort)) NULL else unique(attr(cohort, "says", exact = TRUE)[rows][!is.na(cohort[rows])])
    differ <- length(cohorts) > 1L || (length(cohorts) == 1L && anyNA(cohort[rows]))
    stop(
      "The respondent identifier column '", id, "' has duplicated values (e.g. respondent ",
      .lasa_text_key(.lasa_slice(data[[id]], i)), ", on ", length(rows), " rows), but 'data' has no ",
      if (is.null(wave_name)) {
        "'Wave' column"
      } else {
        paste0("waves (its '", wave_name, "' column holds nothing but a Z file's placeholder \"Z\" and missing values)")
      },
      ": wide data need one row per respondent, and long data a 'Wave' column.",
      if (differ) {
        paste0(
          " That respondent's rows have different values in the '", attr(cohort, "column", exact = TRUE),
          "' column (", paste0("'", cohorts, "'", collapse = " and "), if (anyNA(cohort[rows])) " and a missing value",
          "), as merging data sets by respondent number and cohort gives where they don't give a respondent ",
          "the same cohort; merge them by respondent number alone to have their cohorts combined (which ",
          "must agree)."
        )
      },
      call. = FALSE
    )
  }
  n_resp <- resp$n
  respondent_row <- .lasa_first_row(resp$r, n_resp)
  ids <- .lasa_text_key(.lasa_slice(data[[id]], respondent_row))
  given <- .lasa_given_baselines(data, resp$r, n_resp, row_ids)
  baseline <- given$baseline

  skip <- c(id, wave_name, wave_column$placeholders, existing_time$names)
  found <- .lasa_resolve_wide_columns(
    data, skip, long_mode, wave_codes, resp, db_info, ids,
    time = existing_time$values, baseline = baseline, cohort_column = given$time_columns
  )
  wide <- found$spec
  time_named <- .lasa_warn_unplaced(
    data, setdiff(names(data), c(skip, wide$column)), long_mode, db_info,
    time_columns = !long_mode && given$time_columns
  )
  if (length(found$guessed) > 0L) {
    message(
      "transform_lasa_data(): these columns' names may stand for several waves (LASA uses some ",
      "names at several waves, such as the same \"b\" names at every cohort's baseline), and ",
      "nothing in 'data' says which one they hold for some respondents, so their values were ",
      "placed at the wave shown: ", paste(found$guessed, collapse = ", "), ". To avoid guessing, ",
      "transform each LASA file to long format before combining files (read_lasa_sav(), with ",
      "format_as_long = TRUE)."
    )
  }
  if (length(found$ambiguous) > 0L) {
    message(
      "transform_lasa_data(): LASA uses these columns' names for several variables at a wave, and ",
      "nothing in 'data' says which one they hold, so each was taken as the variable its name ",
      "stands for at most of its other waves: ", paste(found$ambiguous, collapse = ", "), ". To ",
      "avoid this, transform each LASA file to long format before combining files ",
      "(read_lasa_sav(), with format_as_long = TRUE)."
    )
  }

  ## The Time of long data's rows (respondent `r` at wave `w`, from rows
  ## `source_row` of `data`, NA for added rows) and their respondents'
  ## baselines (.lasa_long_times()), from what the long data's wave-specific
  ## `columns` show about each respondent's cohort -- except for values
  ## placed at a guessed wave, now (`guessed`, see .lasa_long_real_rows())
  ## or by an earlier transformation (.lasa_store_guessed()) -- and from
  ## the respondents of a LASA file of a wave only one cohort takes part in,
  ## whom the file shows at its wave whatever their values, as their wide
  ## columns' values were placed (`found$shown`). A value placed at a
  ## guessed wave still shows that its respondent took part at a wave other
  ## than A, which their respondent number needs (`in_lasa`): no guess
  ## chooses between wave A and another, as the label database documents no
  ## name of wave A at other waves.
  times_of <- function(columns, r, w, source_row, guessed = list()) {
    chosen <- .lasa_evidence_columns(columns, r, n_resp, db_info)
    exclude <- .lasa_guessed_rows(chosen$held, ids[r], w, also = guessed)
    real_rows <- .lasa_long_real_rows(chosen$evidence, length(r), db_info, w, exclude = exclude)
    guessed_real <- rep(FALSE, length(r))
    for (name in intersect(names(exclude), names(chosen$evidence))) {
      real <- .lasa_real_value(chosen$evidence[[name]], name, db_info, w, each = TRUE)
      guessed_real <- guessed_real | (exclude[[name]] & real)
    }
    time <- if (is.null(existing_time$values)) NULL else existing_time$values[source_row]
    .lasa_long_times(
      r, w, real_rows, baseline, time, ids,
      quiet = for_wide, held_rows = .lasa_long_held_rows(chosen$held, length(r)), warn_numbers = warn_numbers,
      shown = found$shown, in_lasa = tabulate(r[guessed_real & w != "A"], nbins = n_resp) > 0L
    )
  }

  ## Rows `rows` of `data`'s column `name` (NA for a row added for
  ## respondent `row_r`) -- for a documented stable variable, or the cohort
  ## column, which hold for every wave, with a missing value filled in from
  ## the respondent's single value (rows another file's columns added, or
  ## rows of other waves merged in by respnr and Wave).
  cohort_name <- attr(baseline, "column", exact = TRUE)
  stable_rows <- function(name, rows, row_r) {
    if (!(.lasa_documented_stable(data[[name]], name, db_info) || identical(name, cohort_name))) {
      return(rows)
    }
    key <- .lasa_value_key(data[[name]])
    single <- .lasa_distinct_values(resp$r, key, n_resp) == 1L
    source_row <- .lasa_first_row(resp$r, n_resp, keep = !is.na(key))
    fill <- is.na(key[rows]) & single[row_r]
    rows[fill] <- source_row[row_r[fill]]
    rows
  }

  if (nrow(wide) == 0L) {
    # The rows of a migrant-cohort file of stable variables only
    # (LASMB004.SAV: sex, byear, ...), which LASA files apart from the wave
    # files like a Z file, have no wave dimension either.
    if (long_mode && .lasa_stable_mb_file(data, skip, wave_codes, db_info)) long_mode <- FALSE
    if (long_mode) {
      times <- times_of(as.list(data)[setdiff(names(data), skip)], resp$r, wave_codes, seq_len(nrow(data)))
      columns <- as.list(data)
      relabelled <- FALSE
      for (name in setdiff(names(data), skip)) {
        rows <- stable_rows(name, seq_len(nrow(data)), resp$r)
        if (!identical(rows, seq_len(nrow(data)))) columns[[name]] <- .lasa_slice(data[[name]], rows)
        restored <- if (identical(name, cohort_name)) {
          .lasa_restore_cohort_labels(columns[[name]], db_info)
        } else {
          .lasa_restore_db_labels(columns[[name]], name, wave_codes, db_info)
        }
        if (!is.null(restored)) {
          columns[[name]] <- restored
          relabelled <- TRUE
        }
      }
      columns <- .lasa_place_wave_time(columns, id, wave_codes, times$time, drop = setdiff(skip, id))
      out <- .lasa_build_frame(columns, data)
      if (relabelled) out <- .lasa_add_variable_labels(out)
      out <- .lasa_set_wave_attr(out, unique(wave_codes), long = TRUE, template = data)
      return(list(data = out, added = rep(FALSE, nrow(data)), baseline = times$baseline[resp$r]))
    }
    if (!for_wide && length(time_named) == 0L) {
      message(
        "transform_lasa_data(): no wave-specific columns found in 'data', so it has no ",
        "wave dimension; returned with one row per respondent."
      )
    }
    columns <- as.list(data)
    columns[setdiff(skip, id)] <- NULL
    restored <- if (!is.null(cohort_name)) .lasa_restore_cohort_labels(columns[[cohort_name]], db_info)
    if (!is.null(restored)) columns[[cohort_name]] <- restored
    out <- .lasa_build_frame(columns, data)
    if (!is.null(restored)) out <- .lasa_add_variable_labels(out)
    return(list(
      data = .lasa_set_wave_attr(out, character(0), long = TRUE, template = data),
      added = rep(FALSE, nrow(data)),
      baseline = NULL
    ))
  }

  stems <- unique(wide$stem)
  clashing <- intersect(stems, c(id, "Wave", "Time"))
  if (length(clashing) > 0L) {
    stop(
      "Wave-specific columns would become a long column named ",
      paste(clashing, collapse = ", "), ", which transform_lasa_data() reserves.",
      call. = FALSE
    )
  }
  other_columns <- setdiff(names(data), c(skip, wide$column))
  merged_into <- character(0)
  if (long_mode) {
    # Long data a variable's wide columns were merged into may have that
    # variable's long column already: the two are combined.
    merged_into <- intersect(stems, other_columns)
  } else {
    clashing <- intersect(stems, other_columns)
    if (length(clashing) > 0L) {
      stop(
        "'data' has both a column named ", paste(clashing, collapse = ", "),
        " and wave-specific columns of the same variable (",
        paste(unique(wide$column[wide$stem %in% clashing]), collapse = ", "),
        "); rename one of them first.",
        call. = FALSE
      )
    }
  }

  wide_waves <- all_waves[all_waves %in% wide$wave]

  # The rows of the result: every respondent at every wave the wide
  # columns cover, plus (for long data) every existing row.
  grid_r <- rep(seq_len(n_resp), each = length(wide_waves))
  grid_w <- rep(wide_waves, times = n_resp)
  if (long_mode) {
    grid_r <- c(resp$r, grid_r)
    grid_w <- c(wave_codes, grid_w)
    keep <- !duplicated(paste(grid_r, grid_w, sep = "\r"))
    grid_r <- grid_r[keep]
    grid_w <- grid_w[keep]
  }
  grid_order <- order(grid_r, match(grid_w, all_waves))
  grid_r <- grid_r[grid_order]
  grid_w <- grid_w[grid_order]
  grid_waves <- all_waves[all_waves %in% grid_w]
  grid_wpos <- match(grid_w, grid_waves)

  # The row of `data` each result row comes from (NA for added rows), and
  # for long data each respondent's row at each of its waves.
  present_waves <- character(0)
  cells <- NULL
  if (long_mode) {
    data_row <- match(paste(grid_r, grid_w, sep = "\r"), paste(resp$r, wave_codes, sep = "\r"))
    present_waves <- all_waves[all_waves %in% wave_codes]
    cells <- matrix(NA_integer_, nrow = n_resp, ncol = length(present_waves))
    cells[cbind(resp$r, match(wave_codes, present_waves))] <- seq_along(wave_codes)
  } else {
    data_row <- grid_r
  }

  fallback_stems <- character(0)
  lost_missing <- character(0)
  unlabelled <- character(0)
  long_columns <- list()
  guessed_cells <- list()
  stores <- list()
  label_sources <- list()
  for (stem in stems) {
    # Which of the long column's values were placed at a guessed wave.
    guessed <- matrix(FALSE, nrow = n_resp, ncol = length(grid_waves))
    for (k in which(wide$stem == stem)) {
      g <- match(wide$wave[[k]], grid_waves)
      guessed[, g] <- guessed[, g] | found$guessed_sources[[k]]
    }
    if (stem %in% merged_into) {
      # And those an earlier transformation guessed for the long column the
      # wide columns were merged into.
      earlier <- .lasa_store_guessed(data[[stem]])
      for (w in intersect(names(earlier), grid_waves)) {
        g <- match(w, grid_waves)
        guessed[, g] <- guessed[, g] | ids %in% earlier[[w]]
      }
    }
    if (any(guessed)) guessed_cells[[stem]] <- guessed[cbind(grid_r, grid_wpos)]

    pieces <- lapply(which(wide$stem == stem), function(k) list(
      wave = wide$wave[[k]],
      column = .lasa_narrow_wave_attrs(.lasa_slice(data[[wide$column[[k]]]], found$sources[[k]]), wide$wave[[k]]),
      original = wide$original[[k]],
      position = wide$position[[k]],
      name = wide$column[[k]]
    ))
    if (stem %in% merged_into) {
      # The long column the wide columns were merged into, as the wide
      # columns it stands for.
      j <- match(stem, names(data))
      existing <- .lasa_wide_pieces(data[[j]], stem, cells, present_waves, single_wave = length(present_waves) == 1L)
      pieces <- c(lapply(existing, function(p) {
        list(wave = p$wave, column = p$column, original = p$original, position = j, name = stem)
      }), pieces)
    }
    piece_waves <- vapply(pieces, `[[`, character(1), "wave")
    label_attrs <- c("label", "labels", "wave_label", "labels_wave")
    if (!any(vapply(pieces, function(p) any(label_attrs %in% names(attributes(p$column))), logical(1)))) {
      unlabelled <- c(unlabelled, stem)
    }
    originals <- list()
    names_by_wave <- character(0)
    positions_by_wave <- integer(0)
    for (w in all_waves[all_waves %in% piece_waves]) {
      at <- pieces[piece_waves == w]
      if (length(at) == 1L) {
        originals[[w]] <- at[[1L]]$column
        names_by_wave[[w]] <- at[[1L]]$original
      } else {
        combined <- .lasa_coalesce_wave(
          lapply(at, `[[`, "column"), vapply(at, `[[`, character(1), "name"), stem, w, ids
        )
        originals[[w]] <- combined$values
        names_by_wave[[w]] <- NA_character_
        if (combined$fallback) fallback_stems <- c(fallback_stems, stem)
        if (combined$user_missing_lost) lost_missing <- c(lost_missing, stem)
      }
      positions_by_wave[[w]] <- min(vapply(at, function(p) as.integer(p$position), integer(1)))
    }

    # Waves of the long column's store without rows (see .lasa_wide_pieces())
    # stay in the store only.
    by_wave <- stats::setNames(vector("list", length(grid_waves)), grid_waves)
    in_grid <- intersect(names(originals), grid_waves)
    by_wave[in_grid] <- originals[in_grid]
    stacked <- .lasa_stack_columns(unname(by_wave), n_resp)
    attrs <- .lasa_long_attributes(originals)
    if (stacked$fallback) {
      fallback_stems <- c(fallback_stems, stem)
    } else if (attrs$user_missing_lost) {
      lost_missing <- c(lost_missing, stem)
    }
    values <- .lasa_set_attributes(stacked$values, .lasa_fallback_attributes(attrs$attributes, stacked$fallback))
    stores[[stem]] <- list(originals = originals, names = names_by_wave, positions = positions_by_wave)
    long_columns[[stem]] <- .lasa_slice(values, (grid_wpos - 1L) * n_resp + grid_r)
    label_sources[[stem]] <- unique(vapply(pieces, `[[`, character(1), "name"))
  }

  # A row the wide columns added but hold no value for (e.g. a wave of
  # another cohort) is dropped, unless the respondent has no value at any
  # wave: then all of its rows stay, so no respondent disappears.
  existing <- if (long_mode) !is.na(data_row) else rep(FALSE, length(grid_r))
  filled <- Reduce(`|`, lapply(long_columns, function(x) !.lasa_is_na(x)), existing)
  filled <- filled | !(tabulate(grid_r[filled], nbins = n_resp) > 0L)[grid_r]
  kept <- which(filled)
  long_columns <- lapply(long_columns, .lasa_slice, kept)
  guessed_cells <- lapply(guessed_cells, `[`, kept)
  grid_r <- grid_r[kept]
  grid_w <- grid_w[kept]
  data_row <- data_row[kept]

  # Assemble the result in the order of `data`'s columns, each variable's
  # long column where its first wide column (or its long column) was.
  result <- list()
  relabelled <- FALSE
  result[[id]] <- .lasa_slice(data[[id]], respondent_row[grid_r])
  first_position <- tapply(
    c(wide$position, match(merged_into, names(data))), c(wide$stem, merged_into), min
  )
  for (j in seq_along(data)) {
    name <- names(data)[[j]]
    if (name %in% skip) next
    stem_here <- names(first_position)[first_position == j]
    if (length(stem_here) > 0L) {
      for (s in stem_here) if (!s %in% names(result)) result[[s]] <- long_columns[[s]]
      next
    }
    if (name %in% c(wide$column, merged_into)) next

    x <- data[[j]]
    result[[name]] <- .lasa_slice(x, if (long_mode) stable_rows(name, data_row, grid_r) else data_row)
    restored <- if (identical(name, cohort_name)) {
      .lasa_restore_cohort_labels(result[[name]], db_info)
    } else if (long_mode) {
      .lasa_restore_db_labels(result[[name]], name, grid_w, db_info)
    }
    if (!is.null(restored)) {
      result[[name]] <- restored
      relabelled <- TRUE
    }
  }

  # What each long column built from wide columns needs to give them back,
  # recorded against its final type and attributes -- with the labels
  # merge() stripped from all of the wide columns given back (not where some
  # of them have labels, which the long column combines, nor where it holds
  # text because their types don't combine), which the wide columns then
  # lose again.
  for (stem in stems) {
    restored <- if (stem %in% setdiff(unlabelled, fallback_stems)) {
      .lasa_restore_db_labels(result[[stem]], stem, grid_w, db_info)
    }
    if (!is.null(restored)) {
      result[[stem]] <- restored
      relabelled <- TRUE
    }
    cells <- guessed_cells[[stem]]
    if (!is.null(cells)) cells <- cells & !.lasa_is_na(result[[stem]])
    guessed_by_wave <- if (is.null(cells) || !any(cells)) list() else {
      lapply(split(ids[grid_r[cells]], factor(grid_w[cells], levels = all_waves[all_waves %in% grid_w[cells]])), function(k) sort(unique(k)))
    }
    attr(result[[stem]], "LASA_wide_columns") <- .lasa_wide_store(
      stores[[stem]]$originals, stores[[stem]]$names, stores[[stem]]$positions, stem, result[[stem]],
      guessed = guessed_by_wave
    )
  }

  if (!for_wide && length(fallback_stems) > 0L) {
    warning(
      "The wave-specific columns of ", paste(unique(fallback_stems), collapse = ", "),
      " have types that don't combine (e.g. a factor at one wave and numbers at another), ",
      "so their long column holds text.",
      call. = FALSE
    )
  }
  if (!for_wide && length(lost_missing) > 0L) {
    warning(
      "The SPSS user-missing codes (na_values/na_range) of ", paste(unique(lost_missing), collapse = ", "),
      " differ between waves in a way no single definition can represent, so their long ",
      "column has none: codes missing at one wave are regular values there. Converting ",
      "back to wide format restores each wave's own.",
      call. = FALSE
    )
  }

  times <- times_of(result[setdiff(names(result), id)], grid_r, grid_w, data_row, guessed_cells)
  result <- .lasa_place_wave_time(result, id, grid_w, times$time)
  out <- .lasa_build_frame(result, data, label_sources)
  if (relabelled) out <- .lasa_add_variable_labels(out)
  out <- .lasa_set_wave_attr(out, all_waves[all_waves %in% grid_w], long = TRUE, template = data)
  list(
    data = out,
    added = if (long_mode) is.na(data_row) else rep(FALSE, length(data_row)),
    baseline = times$baseline[grid_r]
  )
}

## A vector's values without any attributes.
.lasa_bare <- function(x) {
  x <- unclass(x)
  attributes(x) <- NULL
  x
}

## The attributes that make up a vector's type (class, factor levels, ...),
## in a fixed order; an empty list for a plain vector.
.lasa_structure_of <- function(x) {
  a <- attributes(x)
  keep <- intersect(c("class", "levels", "tzone", "units"), names(a))
  stats::setNames(lapply(keep, function(nm) a[[nm]]), keep)
}

## The attributes that describe a vector's content (labels, ...): all but
## the structural ones and those transform_lasa_data() manages.
.lasa_content_attributes <- function(x) {
  .lasa_content_of(attributes(x))
}

.lasa_content_of <- function(a) {
  if (is.null(a)) return(list())
  a[setdiff(names(a), c(.lasa_structural_attrs, .lasa_transform_attrs))]
}

## What long column `long` must remember to give each wave's wide column
## (`originals`, named by wave) back exactly: its name (`names`, by wave, NA
## for none) and position in the wide data (`positions`), which waves had no
## value at all (their rows don't make it into long format), and -- only for
## waves where they differ from what the long column itself implies for
## that wave -- its type and attributes. `guessed` lists, by wave, the
## respondents (.lasa_text_key() of their identifier) whose value was placed
## there by a guess: it shows no wave in later transformations either.
.lasa_wide_store <- function(originals, names, positions, stem, long, guessed = list()) {
  waves <- names(originals)
  long_kind <- .lasa_column_kind(long)
  long_structure <- .lasa_structure_of(long)
  long_type <- typeof(.lasa_bare(long))
  long_attributes <- attributes(long)

  changes <- list()
  for (wave in waves) {
    x <- originals[[wave]]
    # What a wide column gets without the store, whether or not the long
    # data have a single wave then.
    baselines <- lapply(c(FALSE, TRUE), function(single_wave) {
      .lasa_content_of(.lasa_generic_wide_attributes(long_attributes, wave, single_wave = single_wave))
    })
    content <- .lasa_content_attributes(x)
    change <- list()
    differs <- vapply(names(content), function(nm) {
      !all(vapply(baselines, function(baseline) identical(content[[nm]], baseline[[nm]]), logical(1)))
    }, logical(1))
    if (any(differs)) change$set <- content[differs]
    dropped <- setdiff(unique(unlist(lapply(baselines, function(baseline) base::names(baseline)))), names(content))
    if (length(dropped) > 0L) change$drop <- dropped
    if (!identical(.lasa_structure_of(x), long_structure)) change["structure"] <- list(.lasa_structure_of(x))
    if (!identical(typeof(.lasa_bare(x)), long_type)) change$type <- typeof(.lasa_bare(x))
    if (!identical(.lasa_column_kind(x), long_kind)) change$kind <- .lasa_column_kind(x)
    if (length(change) > 0L) changes[[wave]] <- change
  }

  store <- list(
    long_name = stem,
    kind = long_kind,
    names = stats::setNames(unname(names[waves]), waves),
    positions = stats::setNames(unname(positions[waves]), waves),
    empty = waves[vapply(originals, function(x) all(.lasa_is_na(x)), logical(1))],
    changes = changes
  )
  if (length(guessed) > 0L) store$guessed <- guessed
  store
}

## The waves the "LASA_wide_columns" store `store` gives back wide columns
## for, of which the long data have rows at `present_waves`: a wave without
## rows gets its (all missing) column back when no respondent had a value
## there -- such a wave leaves no rows in long format -- but not when waves
## with values are gone too: then rows were filtered out on purpose.
.lasa_store_waves <- function(store, present_waves) {
  if (is.null(store)) return(character(0))
  waves <- intersect(names(store$names), .lasa_wave_table()$wave)
  gone <- setdiff(waves, present_waves)
  if (length(gone) > 0L && !all(gone %in% store$empty)) waves <- setdiff(waves, gone)
  waves
}

## The wide columns long column `x` (named `name`) gives back, one per wave
## at which it has a value or its "LASA_wide_columns" store (see
## .lasa_wide_store()) had a column: a list of list(wave, column, original,
## position, guessed), in calendar order. `cell[, k]` gives each
## respondent's row at wave `present_waves[[k]]` (NA for none), `keys` the
## respondents' identifiers (.lasa_text_key()). A column comes back as the
## store recorded it where it can (.lasa_restore_wide_column()), and with
## its original name while `x` keeps its own; `guessed` says whether it
## holds a value whose wave was a guess (.lasa_store_guessed()).
.lasa_wide_pieces <- function(x, name, cell, present_waves, single_wave, keys = NULL) {
  all_waves <- .lasa_wave_table()$wave
  store <- attr(x, "LASA_wide_columns", exact = TRUE)
  if (!is.list(store)) store <- NULL
  store_waves <- .lasa_store_waves(store, present_waves)
  # The original names only apply while the long column keeps its name,
  # and its type only while the long column keeps its kind.
  original_names <- if (!is.null(store) && identical(store$long_name, name)) store$names else NULL
  store_usable <- !is.null(store) && identical(store$kind, .lasa_column_kind(x))
  guessed <- .lasa_store_guessed(x)

  pieces <- list()
  for (wave in all_waves[all_waves %in% c(present_waves, store_waves)]) {
    k <- match(wave, present_waves)
    v <- .lasa_slice(x, if (is.na(k)) rep(NA_integer_, nrow(cell)) else cell[, k])
    in_store <- wave %in% store_waves
    if (!in_store && all(.lasa_is_na(v))) next

    column <- .lasa_generic_wide_column(v, wave, single_wave)
    if (store_usable && in_store) {
      column <- .lasa_restore_wide_column(column, store$changes[[wave]], store$kind)$column
    }
    pieces[[length(pieces) + 1L]] <- list(
      wave = wave,
      column = column,
      original = if (wave %in% names(original_names)) unname(original_names[[wave]]) else NA_character_,
      position = if (in_store) unname(store$positions[[wave]]) else NA_integer_,
      guessed = !is.null(keys) && !is.null(guessed[[wave]]) && any(!.lasa_is_na(v) & keys %in% guessed[[wave]])
    )
  }
  pieces
}

## One wave's column of a variable that several columns hold at that wave
## for different respondents (the Time-prefixed columns of different
## cohorts, or a long column and a wide column merged into it): each
## respondent's value from whichever column (named `names`) has one. Columns
## holding different values for the same respondent are an error. Returns
## list(values, fallback, user_missing_lost), as for a long column.
.lasa_coalesce_wave <- function(columns, names, stem, wave, ids) {
  n <- length(columns[[1L]])
  stacked <- .lasa_stack_columns(columns, n)
  key <- matrix(.lasa_value_key(stacked$values), nrow = n)
  has <- !is.na(key)
  first <- if (n > 0L) max.col(has, ties.method = "first") else integer(0)
  first_key <- key[cbind(seq_len(n), first)]
  conflict <- rowSums(has & key != first_key, na.rm = TRUE) > 0L
  if (any(conflict)) {
    i <- which(conflict)[[1L]]
    stop(
      "Columns ", paste(names[has[i, ]], collapse = " and "), " hold different values of ", stem,
      " at wave ", wave, " for ", sum(conflict), " respondent(s) (e.g. respondent ", ids[[i]], ").",
      call. = FALSE
    )
  }
  combined <- .lasa_long_attributes(columns)
  attrs <- .lasa_fallback_attributes(combined$attributes, stacked$fallback)
  # One wave's wording and coding: the first column's.
  for (nm in c("wave_label", "labels_wave")) {
    attrs[[nm]] <- NULL
    for (x in columns) {
      value <- attr(x, nm, exact = TRUE)
      if (!is.null(value)) {
        attrs[[nm]] <- value
        break
      }
    }
  }
  values <- .lasa_set_attributes(stacked$values, attrs)
  list(
    values = .lasa_slice(values, (first - 1L) * n + seq_len(n)),
    fallback = stacked$fallback,
    user_missing_lost = combined$user_missing_lost && !stacked$fallback
  )
}

## The attributes `attrs` for a long column, without value labels and
## user-missing codes when its values fell back to text (`fallback`): those
## are codes of the waves' own types, which text values don't hold.
.lasa_fallback_attributes <- function(attrs, fallback) {
  if (fallback) attrs[c("labels", "na_values", "na_range")] <- NULL
  attrs
}

`%||%` <- function(x, y) if (is.null(x)) y else x

## Sets the data-level "LASA_wave" attribute: the single wave if there is
## only one; otherwise removed from long data and "Z" for wide data (the
## way LASA files cross-wave data).
.lasa_set_wave_attr <- function(out, waves, long, template) {
  waves <- unique(waves)
  if (length(waves) == 1L) {
    attr(out, "LASA_wave") <- waves
  } else if (length(waves) == 0L) {
    attr(out, "LASA_wave") <- attr(template, "LASA_wave", exact = TRUE)
  } else {
    attr(out, "LASA_wave") <- if (long) NULL else "Z"
  }
  out
}

## Numbers as text that reads back as exactly the same numbers, in as few
## digits as that takes.
.lasa_number_text <- function(v) {
  out <- as.character(v)
  inexact <- which(!is.na(v) & suppressWarnings(as.numeric(out)) != v)
  out[inexact] <- sprintf("%.17g", v[inexact])
  out
}

## The text a column's values become in a long column that falls back to
## text, which .lasa_parse_text() reads back exactly: factor levels, all
## the digits a number needs, a date-time in UTC, a time span with its
## unit.
.lasa_fallback_text <- function(x) {
  if (is.factor(x)) return(as.character(x))
  values <- .lasa_bare(x)
  if (inherits(x, "POSIXct")) {
    # In UTC, saying so, so that it reads back as the same moment in any
    # time zone: also the hour a clock repeats when daylight saving time
    # ends, and a local mean time whose offset from UTC has seconds
    # (Amsterdam's, until 1937), which no offset in the text could give.
    out <- format(x, "%Y-%m-%d %H:%M:%S+0000", tz = "UTC")
    fraction <- which(!is.na(values) & values != floor(values))
    out[fraction] <- format(x[fraction], "%Y-%m-%d %H:%M:%OS6+0000", tz = "UTC")
    out[is.na(values)] <- NA_character_
    return(unname(out))
  }
  if (inherits(x, "difftime") && !inherits(x, "hms")) {
    out <- paste(.lasa_number_text(as.double(values)), attr(x, "units", exact = TRUE))
    out[is.na(values)] <- NA_character_
    return(out)
  }
  if (is.object(x) && !inherits(x, "haven_labelled")) return(as.character(x))
  if (is.double(values)) return(.lasa_number_text(values))
  as.character(values)
}

## Date-time text as .lasa_fallback_text() writes it (with its offset from
## UTC, or without, in time zone `tz`) as the number of seconds since 1970.
.lasa_parse_date_time <- function(text, tz) {
  out <- .lasa_bare(as.POSIXct(text, tz = tz, format = "%Y-%m-%d %H:%M:%OS%z"))
  plain <- is.na(out) & !is.na(text)
  if (any(plain)) out[plain] <- .lasa_bare(as.POSIXct(text[plain], tz = tz, format = "%Y-%m-%d %H:%M:%OS"))
  out
}

## A unit all of `columns` (time spans) convert to and back from exactly:
## the first column's, or else another's; NULL if none.
.lasa_exact_unit <- function(columns) {
  for (unit in unique(vapply(columns, function(x) attr(x, "units", exact = TRUE), character(1)))) {
    exact <- vapply(columns, function(x) {
      converted <- x
      units(converted) <- unit
      units(converted) <- attr(x, "units", exact = TRUE)
      identical(.lasa_bare(converted), .lasa_bare(x))
    }, logical(1))
    if (all(exact)) return(unit)
  }
  NULL
}

## Time spans .lasa_fallback_text() wrote (a number and its unit, or hms
## "[-]HH:MM:SS"), as numbers in the unit of `structure` (seconds for hms);
## NULL for other kinds of columns.
.lasa_parse_span <- function(text, structure) {
  classes <- structure$class
  if ("hms" %in% classes) {
    parts <- regmatches(text, regexec("^(-?)([0-9]+):([0-9]{2}):([0-9]{2}(\\.[0-9]*)?)$", text))
    return(vapply(seq_along(text), function(i) {
      p <- parts[[i]]
      if (length(p) == 0L) return(suppressWarnings(as.numeric(text[[i]])))
      (if (nzchar(p[[2L]])) -1 else 1) *
        (as.numeric(p[[3L]]) * 3600 + as.numeric(p[[4L]]) * 60 + as.numeric(p[[5L]]))
    }, numeric(1)))
  }
  if ("difftime" %in% classes) {
    unit <- structure$units %||% "secs"
    with_unit <- !is.na(text) & grepl(" [a-z]+$", text)
    numbers <- suppressWarnings(as.numeric(sub(" [a-z]+$", "", text)))
    text_units <- sub("^.* ", "", text[with_unit])
    other_unit <- which(with_unit)[text_units != unit]
    for (i in other_unit) {
      numbers[[i]] <- tryCatch(
        as.numeric(as.difftime(numbers[[i]], units = sub("^.* ", "", text[[i]])), units = unit),
        error = function(e) NA_real_
      )
    }
    return(numbers)
  }
  NULL
}

## Text values of a long column that fell back to text, read back as the
## kind `kind` of one wave's original column (`structure`: its class, time
## zone, unit), as bare values -- or NULL if they don't all read as such.
.lasa_parse_text <- function(text, kind, structure) {
  given <- !is.na(text)
  parsed <- switch(kind,
    logical = as.logical(text),
    integer = ,
    double = ,
    labelled_integer = ,
    labelled_double = suppressWarnings(as.numeric(text)),
    Date = .lasa_bare(as.Date(text, optional = TRUE)),
    POSIXct = .lasa_parse_date_time(text, structure$tzone %||% ""),
    other = .lasa_parse_span(text, structure),
    NULL
  )
  if (is.null(parsed) || any(given & is.na(parsed))) return(NULL)
  parsed
}

## The values of wide column `v` (sliced from its long column) in the type
## the original wide column had -- `kind`/`type` as recorded by
## .lasa_wide_store(), `structure` its class/levels/... -- or NULL when
## they no longer fit it (e.g. a factor level that wave never had).
.lasa_restore_values <- function(v, kind, type, structure) {
  if (all(.lasa_is_na(v))) {
    return(.lasa_as_type(rep(NA, length(v)), if (identical(kind, "factor")) "integer" else type))
  }
  kind_now <- .lasa_column_kind(v)
  if (identical(kind, "factor")) {
    if (!kind_now %in% c("factor", "character")) return(NULL)
    text <- as.character(v)
    if (!all(is.na(text) | text %in% structure$levels)) return(NULL)
    return(match(text, structure$levels))
  }

  values <- .lasa_bare(v)
  numeric_kinds <- c("logical", "integer", "double", "labelled_integer", "labelled_double")
  if (identical(kind_now, "character") && kind %in% c(numeric_kinds, "Date", "POSIXct", "other")) {
    # The long column fell back to text (see .lasa_stack_columns()).
    values <- .lasa_parse_text(values, kind, structure)
    if (is.null(values)) return(NULL)
  } else {
    compatible <- switch(kind,
      logical = ,
      integer = ,
      double = ,
      labelled_integer = ,
      labelled_double = kind_now %in% numeric_kinds,
      character = ,
      labelled_character = kind_now %in% c("character", "labelled_character"),
      Date = kind_now == "Date",
      POSIXct = kind_now == "POSIXct",
      other = kind_now == "other" && identical(class(v), structure$class),
      FALSE
    )
    if (!isTRUE(compatible)) return(NULL)
    if (inherits(v, "difftime") && !is.null(structure$units) &&
      !identical(attr(v, "units", exact = TRUE), structure$units)) {
      values <- as.numeric(v, units = structure$units)
    }
  }

  if (typeof(values) == type) return(values)
  known <- values[!is.na(values)]
  if (identical(type, "logical") && is.numeric(values) && all(known %in% c(0, 1))) {
    return(as.logical(values))
  }
  whole <- is.numeric(values) && all(is.finite(known) & known == round(known) &
    abs(known) <= .Machine$integer.max)
  if (identical(type, "integer") && whole) return(as.integer(values))
  if (identical(type, "double") && (is.numeric(values) || is.logical(values))) return(as.double(values))
  NULL
}

## Wide column `v` (as .lasa_generic_wide_column() makes it) with the
## differences .lasa_wide_store() recorded for its wave (`change`, NULL if
## none) applied. `exact` tells whether its type could be restored too.
## The long column's current attributes are the starting point, so a
## change made in long format (e.g. a new variable label) carries over to
## every wave that didn't have its own version.
.lasa_restore_wide_column <- function(v, change, long_kind) {
  if (is.null(change)) return(list(column = v, exact = TRUE))

  content <- .lasa_content_attributes(v)
  content <- content[setdiff(names(content), change$drop)]
  for (nm in names(change$set)) content[nm] <- list(change$set[[nm]])

  structure <- if ("structure" %in% names(change)) change$structure else .lasa_structure_of(v)
  values <- .lasa_restore_values(
    v,
    kind = change$kind %||% long_kind,
    type = change$type %||% typeof(.lasa_bare(v)),
    structure = structure
  )
  exact <- !is.null(values)
  if (!exact) {
    values <- .lasa_bare(v)
    structure <- .lasa_structure_of(v)
  }
  all_attrs <- c(structure, content)
  attributes(values) <- if (length(all_attrs) > 0L) all_attrs else NULL
  list(column = values, exact = exact)
}

## The attributes `a` of a long column as a wide column holding its values
## at `waves` gets them without a usable store entry: without the
## attributes transform_lasa_data() manages, and with "wave_label" and
## "labels_wave" narrowed to `waves` where they hold one entry per wave
## (one entry when every one of `waves` has the same one), or kept when the
## long data have a single wave (`single_wave`).
.lasa_generic_wide_attributes <- function(a, waves, single_wave) {
  a[intersect(names(a), .lasa_transform_attrs)] <- NULL
  narrow <- function(per_wave) {
    kept <- per_wave[intersect(waves, names(per_wave))]
    if (length(kept) == 0L) return(NULL)
    if (length(kept) == length(waves) && length(unique(kept)) == 1L) return(kept[[1L]])
    kept
  }
  wave_label <- a[["wave_label"]]
  if (!is.null(wave_label)) {
    per_wave <- !is.null(names(wave_label)) && all(names(wave_label) %in% .lasa_wave_table()$wave)
    a["wave_label"] <- list(if (per_wave) narrow(wave_label) else if (single_wave) wave_label)
  }
  labels_wave <- a[["labels_wave"]]
  if (!is.null(labels_wave)) {
    a["labels_wave"] <- list(if (is.list(labels_wave)) narrow(labels_wave) else if (single_wave) labels_wave)
  }
  a[!vapply(a, is.null, logical(1))]
}

## A wide column built from long column values `v` without a usable store
## entry (see .lasa_generic_wide_attributes()).
.lasa_generic_wide_column <- function(v, waves, single_wave) {
  attributes(v) <- .lasa_generic_wide_attributes(attributes(v), waves, single_wave)
  v
}

## Wide column `x`'s values of wave `wave`, with its "wave_label" and
## "labels_wave" narrowed to that wave's entry where they hold one per wave
## (as a Time-prefixed column combining several cohorts' waves does) --
## removed where they hold none for that wave.
.lasa_narrow_wave_attrs <- function(x, wave) {
  all_waves <- .lasa_wave_table()$wave
  wave_label <- attr(x, "wave_label", exact = TRUE)
  if (!is.null(names(wave_label)) && all(names(wave_label) %in% all_waves)) {
    attr(x, "wave_label") <- if (!wave %in% names(wave_label)) {
      NULL
    } else if (is.list(wave_label)) {
      wave_label[[wave]]
    } else {
      unname(wave_label[[wave]])
    }
  }
  labels_wave <- attr(x, "labels_wave", exact = TRUE)
  if (is.list(labels_wave) && !is.null(names(labels_wave)) && all(names(labels_wave) %in% all_waves)) {
    attr(x, "labels_wave") <- if (wave %in% names(labels_wave)) labels_wave[[wave]]
  }
  x
}

## Wide columns (`entries`, see .lasa_to_wide()) of one variable holding
## values a guess placed at several waves, which would get the same name
## that doesn't say the wave (their original one, or a "b" name LASA uses
## at several cohorts' baselines): as one column under that name -- named
## after their waves, they would read back as fact -- as long as no
## respondent has values in more than one of them, with a warning where
## their waves' types or user-missing codes don't combine. `ids`
## identifies the respondents.
.lasa_merge_guessed_entries <- function(entries, ids, db_info) {
  key <- vapply(entries, function(e) {
    if (!isTRUE(e$guessed)) return(NA_character_)
    name <- if (!is.na(e$original)) {
      e$original
    } else {
      .lasa_lookup(db_info$wave_names, paste(tolower(e$stem), e$wave, sep = "\r"))[1L]
    }
    if (is.null(name) || is.na(name)) NA_character_ else paste(e$stem, name, sep = "\r")
  }, character(1))
  retyped <- character(0)
  lost_missing <- character(0)
  for (k in unique(key[!is.na(key) & duplicated(key)])) {
    at <- which(key == k)
    held <- vapply(entries[at], function(e) !.lasa_is_na(e$column), logical(length(ids)))
    if (any(rowSums(matrix(held, nrow = length(ids))) > 1L)) next
    parts <- stats::setNames(
      lapply(entries[at], `[[`, "column"), vapply(entries[at], `[[`, character(1), "wave")
    )
    merged <- entries[[at[[1L]]]]
    combined <- .lasa_combine_wave_parts(parts, merged$stem, ids)
    if (combined$fallback) {
      retyped <- c(retyped, merged$stem)
    } else if (combined$user_missing_lost) {
      lost_missing <- c(lost_missing, merged$stem)
    }
    merged$column <- combined$column
    merged$waves <- unlist(lapply(entries[at], `[[`, "waves"))
    merged$position <- suppressWarnings(min(vapply(entries[at], `[[`, numeric(1), "position"), na.rm = TRUE))
    if (!is.finite(merged$position)) merged$position <- NA_real_
    entries[[at[[1L]]]] <- merged
    entries[at[-1L]] <- list(NULL)
  }
  if (length(retyped) > 0L || length(lost_missing) > 0L) {
    warning(
      "The values of ", paste(unique(c(retyped, lost_missing)), collapse = ", "), " that were placed at ",
      "guessed waves keep one wide column, so transforming it back guesses again, but ",
      if (length(retyped) > 0L) {
        "the types of those waves don't combine (e.g. a factor at one wave and numbers at another), so it holds text"
      } else {
        "the SPSS user-missing codes (na_values/na_range) of those waves differ, so it has none"
      },
      ".",
      call. = FALSE
    )
  }
  entries[!vapply(entries, is.null, logical(1))]
}

## Wide columns `parts` (named by wave, one respondent's value in at most
## one of them) as one column holding all their values, combined the way
## long format combines waves (.lasa_coalesce_wave()), with each wave's
## "wave_label" and "labels_wave" as one entry per wave (one entry when
## every wave has the same one). Returns list(column, fallback,
## user_missing_lost).
.lasa_combine_wave_parts <- function(parts, name, ids) {
  combined <- .lasa_coalesce_wave(
    unname(parts), paste(name, "at wave", names(parts)), name, paste(names(parts), collapse = "/"), ids
  )
  column <- combined$values
  for (nm in c("wave_label", "labels_wave")) {
    per_wave <- lapply(parts, function(x) attr(x, nm, exact = TRUE))
    per_wave <- per_wave[!vapply(per_wave, is.null, logical(1))]
    value <- if (length(per_wave) == 0L) {
      NULL
    } else if (length(per_wave) == length(parts) && length(unique(per_wave)) == 1L) {
      per_wave[[1L]]
    } else if (identical(nm, "wave_label") &&
      all(vapply(per_wave, function(v) is.character(v) && length(v) == 1L, logical(1)))) {
      unlist(per_wave)
    } else {
      per_wave
    }
    attr(column, nm) <- value
  }
  list(column = column, fallback = combined$fallback, user_missing_lost = combined$user_missing_lost)
}

## format = "wide", from long data as .lasa_to_long() makes them (with
## "Wave" and "Time" columns). `added` marks rows .lasa_to_long() added for
## values of wide columns (NULL if none): columns that aren't wave-specific
## were never measured there, so such rows don't count against their being
## stable. `baseline` gives each row's respondent's baseline wave (NA where
## the data don't show it), which prefix = "Time" puts in a "cohort" column
## (.lasa_cohort_column()).
.lasa_to_wide <- function(long, prefix, db_info, added = NULL, baseline = NULL) {
  id <- .lasa_find_respnr(long)
  waves_table <- .lasa_wave_table()
  all_waves <- waves_table$wave
  by_time <- identical(prefix, "Time")
  wave_codes <- .lasa_normalize_wave_codes(long[["Wave"]])
  resp <- .lasa_respondents(long[[id]], id)
  n_resp <- resp$n
  present_waves <- all_waves[all_waves %in% wave_codes]
  single_wave <- length(present_waves) == 1L
  measured <- if (is.null(added)) rep(TRUE, nrow(long)) else !added

  # cell[r, w]: the row of respondent r at present wave w (NA if none).
  cell <- matrix(NA_integer_, nrow = n_resp, ncol = length(present_waves))
  cell[cbind(resp$r, match(wave_codes, present_waves))] <- seq_len(nrow(long))
  respondent_row <- .lasa_first_row(resp$r, n_resp)
  measured_row <- .lasa_first_row(resp$r, n_resp, keep = measured)
  measured_row[is.na(measured_row)] <- respondent_row[is.na(measured_row)]

  reserved <- c(id, "Wave", "Time")
  own_cohort <- names(long)[tolower(names(long)) == "cohort"]
  if (by_time && length(own_cohort) > 0L) {
    # Several such columns are left only where none holds LASA's cohorts
    # (see .lasa_combine_cohort_copies()).
    if (length(own_cohort) > 1L || is.null(.lasa_find_cohort(long))) {
      stop(
        "'data' has ", if (length(own_cohort) > 1L) "columns" else "a column", " named ",
        paste0("'", own_cohort, "'", collapse = " and "), " that ", if (length(own_cohort) > 1L) "don't" else "doesn't",
        " hold LASA's cohorts, but Time-prefixed wide format adds a 'cohort' column with each respondent's ",
        "cohort; rename ", if (length(own_cohort) > 1L) "them" else "it", " first.",
        call. = FALSE
      )
    }
    # LASA's own (LASAZ002.SAV's) or one an earlier transformation made,
    # which the cohorts found agree with: replaced by the one made now.
    reserved <- c(reserved, own_cohort)
  }

  stable <- list()
  varying <- character(0)
  inconsistent_stable <- character(0)
  for (name in setdiff(names(long), reserved)) {
    x <- long[[name]]
    lower <- tolower(name)
    canonical_attr <- attr(x, "canonical_name", exact = TRUE)
    canonical_attr <- if (is.character(canonical_attr) && length(canonical_attr) == 1L) tolower(canonical_attr) else NA_character_

    if (.lasa_documented_varying(x, name, db_info)) {
      varying <- c(varying, name)
      next
    }

    key <- .lasa_value_key(x)
    if (.lasa_has(db_info$stable, lower) || .lasa_has(db_info$stable, canonical_attr)) {
      # A documented stable variable: missing values on some of a
      # respondent's rows (e.g. rows another file added) don't count.
      if (all(.lasa_distinct_values(resp$r, key, n_resp) <= 1L)) {
        source_row <- .lasa_first_row(resp$r, n_resp, keep = !is.na(key))
        source_row[is.na(source_row)] <- respondent_row[is.na(source_row)]
        stable[[name]] <- .lasa_slice(x, source_row)
      } else {
        inconsistent_stable <- c(inconsistent_stable, name)
        varying <- c(varying, name)
      }
      next
    }

    # Anything else is stable only if it has exactly one value (missing
    # included) per respondent, on the rows it was measured at.
    first_key <- key[measured_row[resp$r]]
    same <- !measured | (is.na(key) & is.na(first_key)) |
      (!is.na(key) & !is.na(first_key) & key == first_key)
    if (all(same)) {
      stable[[name]] <- .lasa_slice(x, measured_row)
    } else {
      varying <- c(varying, name)
    }
  }

  if (length(inconsistent_stable) > 0L) {
    warning(
      "Documented stable variable(s) ", paste(inconsistent_stable, collapse = ", "),
      " differ between waves for some respondents, so they get one column per wave.",
      call. = FALSE
    )
  }

  # The wide columns: one per variable and wave (prefix = "Wave"), or per
  # variable and Time, with wave A's apart (prefix = "Time"). `rank` orders
  # them by wave or Time; `waves` are the waves a column holds values of.
  entries <- list()
  if (!by_time) {
    keys <- .lasa_text_key(.lasa_slice(long[[id]], respondent_row))
    for (v_index in seq_along(varying)) {
      name <- varying[[v_index]]
      for (piece in .lasa_wide_pieces(long[[name]], name, cell, present_waves, single_wave, keys)) {
        entries[[length(entries) + 1L]] <- list(
          column = piece$column, stem = name, wave = piece$wave, time = NA_integer_,
          original = piece$original, position = as.numeric(piece$position),
          rank = match(piece$wave, all_waves), variable = v_index, waves = piece$wave,
          guessed = piece$guessed
        )
      }
    }
    entries <- .lasa_merge_guessed_entries(entries, keys, db_info)
  } else {
    time <- suppressWarnings(as.integer(.lasa_bare(long[["Time"]])))
    slot <- ifelse(wave_codes == "A", -1L, time)
    no_slot <- is.na(slot)
    ## Rows holding a value `test` says yes to in a wave-specific column.
    holding <- function(test) {
      Reduce(`|`, lapply(varying, function(name) test(long[[name]], name)), rep(FALSE, nrow(long)))
    }
    # A respondent whose rows have a Time without the data showing their
    # cohort (the third cohort and the migrant cohort give their waves the
    # same Time) gets no cohort, which reading the columns back needs.
    known_baseline <- if (is.null(baseline)) rep(NA_character_, n_resp) else baseline[respondent_row]
    unknown <- !no_slot & slot >= 0L & is.na(known_baseline[resp$r]) & holding(function(x, name) !.lasa_is_na(x))
    if (any(unknown)) {
      i <- which(unknown)[[1L]]
      warning(
        "Time-prefixed wide format has no baseline wave for ", length(unique(resp$r[unknown])),
        " respondent(s) whose rows have a Time (e.g. respondent ", .lasa_text_key(.lasa_slice(long[[id]], i)),
        " at wave ", wave_codes[[i]], "): the data leave several cohorts open that give their waves ",
        "the same Time, such as the third cohort and the migrant cohort. Their 'cohort' stays ",
        "missing, so their Time-prefixed columns can't be transformed back to long format. Keep ",
        "their baseline rows, or give 'data' LASA's 'cohort' column (as LASAZ002.SAV has).",
        call. = FALSE
      )
    }
    if (any(no_slot)) {
      stuck <- no_slot & holding(function(x, name) .lasa_real_value(x, name, db_info, wave_codes, each = TRUE))
      if (any(stuck)) {
        i <- which(stuck)[[1L]]
        stop(
          "Time-prefixed wide format needs the Time of every value, but ", length(unique(resp$r[stuck])),
          " respondent(s) have values at waves without one (e.g. respondent ",
          .lasa_text_key(.lasa_slice(long[[id]], i)), " at wave ", wave_codes[[i]], "): the data ",
          "don't show their cohort, or show waves of several cohorts. Use prefix = \"Wave\", or give ",
          "'data' LASA's 'cohort' column (as LASAZ002.SAV has).",
          call. = FALSE
        )
      }
      left_out <- no_slot & holding(function(x, name) !.lasa_is_na(x))
      if (any(left_out)) {
        i <- which(left_out)[[1L]]
        message(
          "transform_lasa_data(): ", sum(left_out), " row(s) hold nothing but missing-value codes at ",
          "a wave without a Time for their respondent (e.g. respondent ",
          .lasa_text_key(.lasa_slice(long[[id]], i)), " at wave ", wave_codes[[i]], "). Such codes ",
          "don't show a respondent's cohort (Z files hold them at a later cohort's waves before it ",
          "joined LASA, say), and Time-prefixed wide format has no column for a row without a Time, ",
          "so they're left out."
        )
      }
    }
    slots <- sort(unique(slot[!no_slot]))
    slot_cell <- matrix(NA_integer_, nrow = n_resp, ncol = length(slots))
    slot_cell[cbind(resp$r[!no_slot], match(slot[!no_slot], slots))] <- which(!no_slot)
    keys <- .lasa_text_key(.lasa_slice(long[[id]], respondent_row))

    retyped <- character(0)
    lost_missing <- character(0)
    for (v_index in seq_along(varying)) {
      name <- varying[[v_index]]
      x <- long[[name]]
      store <- attr(x, "LASA_wide_columns", exact = TRUE)
      if (!is.list(store)) store <- NULL
      store_usable <- !is.null(store) && identical(store$kind, .lasa_column_kind(x))
      store_waves <- .lasa_store_waves(store, present_waves)
      for (s in seq_along(slots)) {
        rows <- slot_cell[, s]
        v <- .lasa_slice(x, rows)
        held <- !.lasa_is_na(v)
        if (!any(held)) next
        waves <- all_waves[all_waves %in% wave_codes[rows[held]]]
        column <- .lasa_generic_wide_column(v, waves, single_wave)
        if (store_usable && length(waves) == 1L && waves %in% store_waves) {
          column <- .lasa_restore_wide_column(column, store$changes[[waves]], store$kind)$column
        } else if (store_usable && any(waves %in% store_waves)) {
          # A Time shared by several cohorts' waves: each wave's values as
          # that wave's own column, then combined the way long format
          # combines waves -- so a column has its waves' own types, value
          # labels and user-missing codes, not every wave's.
          parts <- lapply(stats::setNames(waves, waves), function(w) {
            at_w <- !is.na(rows) & wave_codes[ifelse(is.na(rows), 1L, rows)] == w
            part <- .lasa_generic_wide_column(.lasa_slice(x, ifelse(at_w, rows, NA_integer_)), w, single_wave)
            if (w %in% store_waves) part <- .lasa_restore_wide_column(part, store$changes[[w]], store$kind)$column
            part
          })
          combined <- .lasa_combine_wave_parts(parts, name, keys)
          column <- combined$column
          if (combined$fallback) {
            retyped <- c(retyped, name)
          } else if (combined$user_missing_lost) {
            lost_missing <- c(lost_missing, name)
          }
        }
        if (slots[[s]] < 0L) {
          original <- if (!is.null(store) && identical(store$long_name, name) && "A" %in% names(store$names)) {
            unname(store$names[["A"]])
          } else {
            NA_character_
          }
          entries[[length(entries) + 1L]] <- list(
            column = column, stem = name, wave = "A", time = NA_integer_, original = original,
            position = NA_real_, rank = 0L, variable = v_index, waves = "A"
          )
        } else {
          entries[[length(entries) + 1L]] <- list(
            column = column, stem = name, wave = NA_character_, time = slots[[s]],
            original = NA_character_, position = NA_real_, rank = slots[[s]] + 1L,
            variable = v_index, waves = waves
          )
        }
      }
    }
    if (length(retyped) > 0L) {
      warning(
        "The wave-specific columns of ", paste(unique(retyped), collapse = ", "), " have types that ",
        "don't combine (e.g. a factor at one wave and numbers at another), so their Time-prefixed ",
        "columns that combine the waves of several cohorts hold text.",
        call. = FALSE
      )
    }
    if (length(lost_missing) > 0L) {
      warning(
        "The SPSS user-missing codes (na_values/na_range) of ", paste(unique(lost_missing), collapse = ", "),
        " differ between the waves of several cohorts that share a Time in a way no single definition ",
        "can represent, so their Time-prefixed columns combining those waves have none: codes missing ",
        "at one wave are regular values there. Wave-prefixed wide format keeps each wave's own.",
        call. = FALSE
      )
    }
  }

  stems <- vapply(entries, `[[`, character(1), "stem")
  entry_waves <- vapply(entries, `[[`, character(1), "wave")
  times <- vapply(entries, `[[`, integer(1), "time")
  originals <- vapply(entries, `[[`, character(1), "original")
  guessed_entry <- vapply(entries, function(e) isTRUE(e$guessed), logical(1))

  ## LASA's own name for `stem` at `wave` where the label database documents
  ## one for that variable and wave alone (bm15twtrh, wave B's m15wrth,
  ## rather than bm15wrth, wave 2B's name), else NA.
  lasa_name <- function(stem, wave) {
    # The wave-prefixed names, and a name LASA's wave files use without a
    # wave prefix (totalalpha, wave H), which is the variable's name itself.
    for (vn in c(.lasa_lookup(db_info$wave_names, paste(tolower(stem), wave, sep = "\r")), tolower(stem))) {
      rows <- .lasa_lookup(db_info$wide_index, vn)
      if (!is.null(rows) && all(db_info$wide_rows$cn[rows] == tolower(stem) & db_info$wide_rows$wave[rows] == wave)) {
        return(vn)
      }
    }
    NA_character_
  }
  ## The name of wide column k: t<Time>_<variable>; else its original name
  ## (if `use_original`); else LASA's own; else the wave's prefix and the
  ## variable's name: boak, b2oak, ... A column holding values placed at a
  ## guessed wave (`guessed_entry`) keeps a name that doesn't say the wave
  ## either (while `use_original`): its original one, or else a name LASA
  ## uses at several waves (blphya04), so transforming it back guesses
  ## again rather than taking the guess as fact.
  name_of <- function(k, use_original) {
    if (!is.na(times[[k]])) return(paste0("t", times[[k]], "_", stems[[k]]))
    if (use_original && !is.na(originals[[k]])) return(originals[[k]])
    if (use_original && guessed_entry[[k]]) {
      shared <- .lasa_lookup(db_info$wave_names, paste(tolower(stems[[k]]), entry_waves[[k]], sep = "\r"))
      if (length(shared) > 0L) return(shared[[1L]])
    }
    documented <- lasa_name(stems[[k]], entry_waves[[k]])
    if (!is.na(documented)) return(documented)
    paste0(waves_table$prefix[match(entry_waves[[k]], all_waves)], stems[[k]])
  }
  use_original <- !is.na(originals) | guessed_entry
  wide_names <- vapply(seq_along(entries), function(k) name_of(k, use_original[[k]]), character(1))
  # An original name may be the name another wave's column gets (a b name
  # from one cohort's file, after files of several cohorts were stacked in
  # long format): then it yields -- a column of guessed values last.
  repeat {
    taken <- c(id, if (by_time) "cohort", names(stable), wide_names)
    clash <- use_original & wide_names %in% taken[duplicated(taken)]
    if (!any(clash)) break
    yield <- clash & !guessed_entry
    if (!any(yield)) yield <- clash
    use_original[yield] <- FALSE
    wide_names[yield] <- vapply(which(yield), function(k) name_of(k, FALSE), character(1))
  }

  # Columns that came from a wide file keep their original order; the rest
  # follow, wave by wave (or Time by Time).
  positions <- vapply(entries, `[[`, numeric(1), "position")
  ranks <- vapply(entries, `[[`, integer(1), "rank")
  variables <- vapply(entries, `[[`, integer(1), "variable")
  wide_order <- if (by_time) order(ranks, variables) else order(is.na(positions), positions, ranks, variables)
  entries <- entries[wide_order]
  wide_names <- wide_names[wide_order]
  stems <- stems[wide_order]
  entry_waves <- entry_waves[wide_order]
  times <- times[wide_order]
  originals <- originals[wide_order]
  use_original <- use_original[wide_order]
  guessed_entry <- guessed_entry[wide_order]

  result <- stats::setNames(list(.lasa_slice(long[[id]], respondent_row)), id)
  if (by_time) {
    result[["cohort"]] <- .lasa_cohort_column(known_baseline, db_info)
  }
  result <- c(result, stable, stats::setNames(lapply(entries, `[[`, "column"), wide_names))
  duplicated_names <- unique(names(result)[duplicated(names(result))])
  if (length(duplicated_names) > 0L) {
    stop(
      "Wide format would have duplicated column names: ", paste(duplicated_names, collapse = ", "),
      ". Rename the long column(s) involved first.",
      call. = FALSE
    )
  }
  output_waves <- all_waves[all_waves %in% c(present_waves, unlist(lapply(entries, `[[`, "waves")))]

  # Transforming the result back must find each wide column's wave and
  # variable without the data's provenance attributes, which a merge drops.
  # An original name that doesn't say them by itself (a "b" name of several
  # cohorts' baselines, a name read_lasa_sav() matched by fuzzy matching)
  # makes way for LASA's own or the generic name where that does. A column
  # whose name still doesn't (a name the label database doesn't document,
  # wave B's "b" names, which the later cohorts' baselines share) says so
  # itself: attributes "LASA_wave" and "LASA_long_name", with
  # "LASA_wide_name" its name, as they only count while it keeps that name
  # (base R's merge() and row subsetting drop them from factor and numeric
  # columns, though). A Time-prefixed name says it all, as long as it isn't
  # LASA's own name of another variable.
  out_resp <- .lasa_respondents(result[[id]], id)
  out_ids <- .lasa_text_key(result[[id]])
  for (pass in 1:4) {
    out <- .lasa_build_frame(result, long)
    given <- .lasa_given_baselines(out, out_resp$r, n_resp)
    back <- .lasa_resolve_wide_columns(
      out, skip = id, long_mode = FALSE, wave_codes = NULL, resp = out_resp, db_info = db_info,
      ids = out_ids, baseline = given$baseline, cohort_column = given$time_columns, simulate = TRUE
    )
    changed <- FALSE
    for (k in seq_along(wide_names)) {
      name <- wide_names[[k]]
      if (!is.na(times[[k]])) {
        cand <- back$candidates[[name]]
        if (is.null(cand) || !identical(cand$time, times[[k]]) || !identical(cand$stem, stems[[k]])) {
          stop(
            "Time-prefixed wide format would name a column ", name, ", which is LASA's own name ",
            "of another variable; rename the long column ", stems[[k]], " first.",
            call. = FALSE
          )
        }
        next
      }
      # A column of values placed at a guessed wave keeps its name that
      # doesn't say the wave, without tags.
      if (guessed_entry[[k]] && use_original[[k]]) next
      found <- back$spec[back$spec$column == name, , drop = FALSE]
      # A name that is another variable's long-format name (wave I's immse01
      # is MB's long name of bimmse01) reads as that variable once merged
      # into long data without these attributes.
      other_long_name <- .lasa_has(db_info$canonical, tolower(name)) && tolower(name) != tolower(stems[[k]])
      # Nor does a name of several waves (blphya01, and in a result with
      # wave 4B, whose files use the baselines' "b" names, any of those),
      # which the other columns place only as long as they come along.
      cand_back <- back$candidates[[name]]
      several_waves <- length(unique(c(
        cand_back$wave, if (!is.null(cand_back) && !is.na(cand_back$stem_4b) && "4B" %in% entry_waves) "4B"
      ))) > 1L
      read_back <- nrow(found) == 1L && identical(found$stem, stems[[k]]) &&
        identical(found$wave, entry_waves[[k]]) && !name %in% c(back$guessed_columns, back$ambiguous_columns) &&
        !other_long_name && !several_waves
      if (read_back || !is.null(attr(result[[name]], "LASA_wide_name", exact = TRUE))) next
      renamed <- if (use_original[[k]]) name_of(k, FALSE) else name
      if (!identical(renamed, name) && !renamed %in% names(result)) {
        use_original[[k]] <- FALSE
        names(result)[match(name, names(result))] <- renamed
        wide_names[[k]] <- renamed
      } else {
        attr(result[[name]], "LASA_wave") <- entry_waves[[k]]
        attr(result[[name]], "LASA_long_name") <- stems[[k]]
        attr(result[[name]], "LASA_wide_name") <- name
      }
      changed <- TRUE
    }
    if (!changed) break
  }
  label_sources <- c(stats::setNames(as.list(stems), wide_names), if (by_time) list(cohort = character(0)))
  .lasa_set_wave_attr(.lasa_build_frame(result, long, label_sources), output_waves, long = FALSE, template = long)
}
