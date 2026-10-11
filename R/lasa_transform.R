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

.lasa_wave_column_label <- "LASA measurement wave"
.lasa_time_column_label <- "LASA waves since the respondent's baseline (baseline = 0)"
.lasa_baseline_column_label <- "LASA baseline wave of the respondent's cohort"

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
#' `NA`, so a missing-value code that is kept as a value (e.g. "dropout")
#' counts. Respondents of a later cohort therefore only get rows for the
#' waves before they joined LASA where the data hold such a code for them,
#' as LASA's Z files do ("no observation birth cohorts 1938-1947"). A
#' respondent without any value at any wave keeps a row for every wave, so
#' nobody disappears. Rows are sorted by respondent (in order of first
#' appearance) and wave, except in long data without wide columns, which
#' keep their order.
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
#' A row's Time depends on the respondent's cohort, so the data must show
#' it: a value (other than `NA` or a missing-value code) at the
#' respondent's baseline or at a wave only their cohort takes part in (B to
#' E for the first cohort), a `"Baseline"` column with each respondent's
#' baseline wave (as Time-prefixed wide data have, see below), or a
#' `"Time"` column already in long data. The waves from F on, which cohorts
#' share, don't show it: the rows of a respondent seen only at those waves
#' get no Time (unless every cohort the data leave open gives their wave
#' the same Time), with a message. Data showing waves of several cohorts
#' for one respondent give that respondent no Time, with a warning. So a
#' single LASA file of wave F or later has no Time until it is combined
#' with data that show the cohorts, such as the baseline files. A `"Time"`
#' column already in long data -- also the `Time.x`/`Time.y` columns
#' [merge()] makes of two -- must give each row a Time that some cohort's
#' waves give its wave; it is replaced by the recomputed one.
#'
#' **Stable variables** -- columns that hold for every wave, such as sex or
#' year of birth (`byear`) in `LASAZ004.SAV` -- keep one column and are
#' repeated on each of the respondent's rows.
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
#' long yet (no `"Wave"` column, or only the `"Z"` placeholder
#' [read_lasa_sav()] gives a Z file), when its name is a wave prefix
#' followed by a variable the label database documents for that wave (the
#' names wide format uses, see below). All other columns are treated as
#' stable, including columns the label database doesn't know. A warning
#' names columns kept stable that look like wave-specific variables: names
#' a merge suffixed with `.x`/`.y`, and, in wide data, variables read with
#' their wave stripped from their name.
#'
#' **Names of several waves.** LASA's wave files name the baseline of every
#' cohort (B, 2B, 3B, MB, and 4B) with the same `b` prefix, so a name such
#' as `blphya01` may belong to any of them, and a few other names stand for
#' several waves too (`bqvalu16` for waves 3B and J, `xcancer1` for waves B
#' and C). Each respondent's value in such a column goes to the wave the
#' data show for that respondent: in long data, a value already on a row of
#' one of those waves stays there; otherwise, the respondent's cohort, as
#' far as the data show it (the first cohort has no wave 3B, so its
#' respondents' `bqvalu16` is wave J's), and then the file the column came
#' from (the data's `"LASA_file_code"` and `"LASA_wave"` attributes, as far
#' as the data's label report lists the column, since a merge keeps at
#' most the first file's attributes). If nothing says, the value goes, with
#' a message naming the column, to the first of these waves the
#' respondent's cohort may take part in: the wave the column's other
#' respondents were placed at by their cohort, the wave of the data's
#' `"LASA_wave"` attribute, and the column's waves in calendar order. Such
#' a guess doesn't count as showing the respondent's cohort, so it gives
#' none of their rows a Time. To avoid guesses, transform each LASA file to
#' long format before combining files (with `format_as_long = TRUE` in
#' [read_lasa_sav()]).
#'
#' **Merged files.** `data` may be several LASA files merged together, in
#' any of three shapes:
#' * long (the most reliable), e.g. files read with `format_as_long = TRUE`
#'   (or wave files read with the default `standardize = TRUE`), stacked
#'   per file code with [rbind()] (or `dplyr::bind_rows()`, if the files'
#'   columns differ) and merged by `respnr` and `"Wave"`; the `Time.x` and
#'   `Time.y` columns that merge makes become one `"Time"` again, now also
#'   for the rows of files that didn't show the respondent's cohort on their
#'   own;
#' * wide, e.g. `LASAB046.SAV`, `LASAC046.SAV`, `LASAB030.SAV`, ... read
#'   with `standardize = FALSE` and merged by `respnr`, or a Z file merged
#'   with `LASAZ004.SAV`. Don't stack wide files of different cohorts that
#'   share column names (e.g. `LAS2B046.SAV` below `LASAB046.SAV`, or
#'   `LASAZDC2.SAV` below `LASAZDC1.SAV`): stack them in long format;
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
#' `bm15twtrh` at wave B and `c15wtrth` at wave C). A column that came from
#' a wide LASA file gets its original name back (e.g. `t2_dat` rather than
#' `bt_dat`), unless its values went to several waves or the name doesn't
#' say its wave by itself: the `b_dm` column of `LASAZDC2.SAV`, which holds
#' the second cohort's baseline, becomes `b2dm`.
#'
#' With `prefix = "Time"`, names are `t`, the `"Time"`, and an underscore
#' followed by the variable name: `t0_oak` holds each respondent's value at
#' their own baseline, `t1_oak` at their cohort's next wave (wave C for the
#' first cohort, F for the second), and so on, so the cohorts share
#' columns. A `"Baseline"` column after `respnr` gives each respondent's
#' baseline wave, which transforming the data back to long format uses.
#' Wave A, which has no Time, keeps its own column (`aoak`). Every other
#' value needs a Time: values at a wave without one for their respondent
#' are an error, except missing-value codes, which are left out with a
#' message. Original names aren't kept with `prefix = "Time"`, also not
#' when such data are made wide again with `prefix = "Wave"`.
#'
#' A column stays stable in wide format when it has a single value per
#' respondent and isn't a documented wave-specific variable; a documented
#' stable variable (such as `sex`) only needs to agree across the rows
#' where it isn't missing. A wide column whose name still doesn't say which
#' wave and variable it holds (a name the label database doesn't document,
#' or a wave B name the later cohorts' baselines share, such as
#' `blphya01`) carries the attributes `"LASA_wave"` and `"LASA_long_name"`,
#' which transforming it back uses. Base R's [merge()] and row subsetting
#' drop those attributes from factor and numeric columns (haven's labelled
#' columns keep them); the column is then placed like a column of LASA's
#' own files, see **Names of several waves**.
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
#' every wave's values convert to exactly, the first wave's if possible.
#' Converting back to wide restores each wide column's original type (also
#' from text), attributes, and user-missing codes, as long as its values
#' still fit them.
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
  .lasa_check_transform_columns(data)

  db_info <- .lasa_transform_db_info()

  if (identical(format, "long")) {
    return(.lasa_to_long(data, db_info)$data)
  }

  # Wide output always goes through long format first, so wide columns of
  # any origin (and any already-long rows they were merged into) are
  # combined before being spread out again under one naming convention.
  long <- .lasa_to_long(data, db_info, for_wide = TRUE)
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

## The last result of .lasa_transform_db_info(), with the label database it
## was computed from.
.lasa_transform_cache <- new.env(parent = emptyenv())

## Everything transform_lasa_data() needs from lasa_label_db(), computed
## once per label database (cached in .lasa_transform_cache, and computed
## again when the database changes). All names lowercase; the sets are
## hashed (.lasa_has()).
##   wide_rows      documented wave-specific names: vn, cn, fc (normalized
##                  file code), wave, `prefixed` -- whether vn differs from
##                  cn (the wave-prefixed names, also LASA's irregular
##                  ones), or is one of the names LASA's wave files use
##                  without a wave prefix (file 435's xcancer1 at B and C,
##                  file 233's totalalpha at H) -- and `z_file`, whether
##                  it is a Z (or MB Z) file's; `wide_index` gives their
##                  row numbers by vn.
##   wave_names     the wave-prefixed names of each "<canonical>\r<wave>".
##   documented     every documented name, wave-specific or canonical.
##   canonical      the canonical names of wave-prefixed and of stable
##                  variables: in long data, such a name is a long column.
##   canonical_wave "<canonical>\r<wave>" for every documented pair.
##   time_varying   canonical names of wave-specific variables.
##   stable         canonical names only ever documented as Z/MB-file
##                  variables without a wave prefix (sex, byear, aedu, ...).
##   baseline_stems canonical names of the "b" names of the baselines' wave
##                  files, which wave 4B's files use too.
##   missing_codes, missing_labels
##                  per variable or canonical name, the codes and value-label
##                  texts LASA marks as missing-value codes (is_missing: its
##                  negative codes), as numbers and as text (the factor
##                  levels or text read_lasa_sav() may turn them into).
.lasa_transform_db_info <- function() {
  db <- .lasa_load_label_db()
  if (!is.null(.lasa_transform_cache$info) && identical(.lasa_transform_cache$db, db)) {
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
  wide_rows <- data.frame(
    vn = vn[wide], cn = cn[wide], fc = fc[wide], wave = wave[wide], prefixed = prefixed[wide],
    z_file = z_file[wide],
    stringsAsFactors = FALSE
  )
  time_varying <- unique(cn[!z_stable])
  stem_wave <- paste(cn, wave, sep = "\r")

  override_names <- tolower(db$manual_overrides$variables$variable_name)

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

  info <- list(
    wide_rows = wide_rows,
    baseline_stems = .lasa_hash_set(wide_rows$cn[in_baseline_file]),
    wide_index = .lasa_hash(split(seq_len(nrow(wide_rows)), wide_rows$vn)),
    wave_names = .lasa_hash(split(vn[prefixed], stem_wave[prefixed])),
    documented = .lasa_hash_set(c(vn, cn, override_names)),
    canonical = .lasa_hash_set(c(cn[prefixed], cn[z_stable])),
    canonical_wave = .lasa_hash_set(stem_wave),
    time_varying = .lasa_hash_set(time_varying),
    stable = .lasa_hash_set(setdiff(unique(cn[z_stable]), time_varying)),
    missing_codes = missing_of("code"),
    missing_labels = missing_of("text")
  )
  .lasa_transform_cache$db <- db
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
      "Merge long data by respnr and Wave. To merge a Z file read with read_lasa_sav() ",
      "into long data, drop its placeholder 'Wave' column first, or read it with ",
      "format_as_long = TRUE and merge by respnr and Wave.",
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
## merge() makes of it ("Time.x"/"Time.y"). transform_lasa_data() computes
## Time itself, so data that aren't long yet can't have a "Time" column. In
## long data, its values must be Times some cohort's numbering gives the
## row's wave; they help tell which cohort a respondent is of (see
## .lasa_possible_cohorts()), and the columns are replaced by the
## recomputed one. Returns list(names, values): the columns to drop, and
## each row's Time (NA if none; NULL without a Time column).
.lasa_existing_time <- function(data, long_mode, wave_codes) {
  found <- names(data)[names(data) %in% c("Time", "Time.x", "Time.y")]
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
  for (name in found) {
    x <- data[[name]]
    text <- if (is.factor(x)) as.character(x) else .lasa_bare(x)
    numbers <- suppressWarnings(as.numeric(text))
    fits <- rowSums(times == numbers, na.rm = TRUE) > 0L
    wrong <- !is.na(text) & (is.na(numbers) | !fits | (!is.na(values) & numbers != values))
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
        "'data' has a '", name, "' column that doesn't match its waves (e.g. ", text[[i]],
        " at wave ", wave_codes[[i]], ", ", expected, "). Long format constructs its own ",
        "'Time' column from the waves, so rename or drop it first.",
        call. = FALSE
      )
    }
    values[is.na(values)] <- numbers[is.na(values)]
  }
  list(names = found, values = values)
}

## The "Baseline" column of `data` -- each respondent's baseline wave (B,
## 2B, 3B, MB or 4B), as transform_lasa_data(prefix = "Time") gives wide
## data -- as each row's uppercase code (NA if none), or NULL if `data` has
## no such column: a column of another name, or with other values, or (in
## long data, with respondents `r`) not one value per respondent, is an
## ordinary column.
.lasa_find_baseline <- function(data, r = NULL, n = NULL) {
  if (!"Baseline" %in% names(data)) return(NULL)
  codes <- .lasa_normalize_wave_codes(data[["Baseline"]])
  codes[!is.na(codes) & !nzchar(codes)] <- NA_character_
  if (!all(is.na(codes) | codes %in% .lasa_baselines)) return(NULL)
  if (!is.null(r) && any(.lasa_distinct_values(r, codes, n) > 1L)) return(NULL)
  codes
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
## anything but NA and a missing-value code -- an SPSS user-missing value,
## or a code LASA marks as missing (a negative code, also as the factor
## level or text read_lasa_sav() gives it), which LASA's Z files also use
## for waves before a respondent's cohort joined (e.g. "no observation
## birth cohorts 1938-1947"). The label database's missing-value codes are
## looked up by `names` (the column's name, the variable's long-format
## name) and the column's canonical_name attribute.
.lasa_real_value <- function(x, names, db_info) {
  values <- .lasa_bare(x)
  real <- !is.na(values)
  if (!any(real)) return(real)
  if (inherits(x, "haven_labelled_spss")) {
    definition <- list(na_values = attr(x, "na_values", exact = TRUE), na_range = attr(x, "na_range", exact = TRUE))
    real <- real & !.lasa_user_missing(values, definition)
  }

  canonical <- attr(x, "canonical_name", exact = TRUE)
  lookup_names <- unique(tolower(c(names, if (is.character(canonical) && length(canonical) == 1L) canonical)))
  documented <- function(table) unlist(lapply(lookup_names, function(nm) .lasa_lookup(table, nm)))
  labels <- attr(x, "labels", exact = TRUE)
  label_codes <- if (is.numeric(labels) && !is.null(names(labels))) labels else NULL

  ## Which of the texts `text` are missing-value codes.
  missing_text <- function(text) {
    code <- if (is.null(label_codes)) rep(NA_real_, length(text)) else unname(label_codes)[match(text, names(label_codes))]
    (!is.na(code) & code < 0) |
      text %in% documented(db_info$missing_labels) |
      grepl(" \\[-[0-9.]+\\]$", text) # a code read_lasa_sav() disambiguated
  }
  if (is.factor(x)) {
    level_missing <- missing_text(levels(x))
    return(real & !level_missing[values])
  }
  if (is.character(values)) {
    text <- unique(values[real])
    return(real & !values %in% text[missing_text(text)])
  }
  if (is.numeric(values)) {
    negative <- unique(values[real & values < 0])
    if (length(negative) > 0L) {
      coded <- negative[negative %in% c(unname(label_codes), documented(db_info$missing_codes))]
      real <- real & !values %in% coded
    }
  }
  real
}

## Which of the `n_rows` rows of long data hold a value that shows their
## respondent took part (.lasa_real_value()) in one of `columns` (a named
## list of the long data's wave-specific columns) -- every row, without
## such columns. `exclude[[name]]` marks rows whose value in column `name`
## doesn't count (its wave was a guess).
.lasa_long_real_rows <- function(columns, n_rows, db_info, exclude = list()) {
  if (length(columns) == 0L) return(rep(TRUE, n_rows))
  shown <- rep(FALSE, n_rows)
  for (name in names(columns)) {
    real <- .lasa_real_value(columns[[name]], name, db_info)
    if (!is.null(exclude[[name]])) real <- real & !exclude[[name]]
    shown <- shown | real
  }
  shown
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
## NA if none) rules out every other cohort; and a Time already in long
## data (`time`, per row, of respondent `r` at wave `wave_codes`) the
## cohorts whose numbering doesn't give that wave that Time. A baseline or
## Time contradicting the rest of the data is an error, naming the
## respondent by `ids` (each respondent's identifier as text).
.lasa_possible_cohorts <- function(has_data, baseline = NULL, time = NULL, r = NULL, wave_codes = NULL,
                                   ids = NULL, allowed = NULL) {
  times <- .lasa_cohort_times()
  possible <- matrix(TRUE, nrow = nrow(has_data), ncol = ncol(times), dimnames = list(NULL, colnames(times)))
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
      stop(
        "'data' has a 'Baseline' column that doesn't match its waves: for respondent ", ids[[i]],
        " it says ", baseline[[i]], ", but the rest of the data show them at a wave that cohort ",
        "doesn't take part in.",
        call. = FALSE
      )
    }
  }

  given <- if (is.null(time)) integer(0) else which(!is.na(time))
  if (length(given) > 0L) {
    fits <- times[wave_codes[given], , drop = FALSE] == time[given]
    fits[is.na(fits)] <- FALSE
    ruled_out <- rowsum(1L * !fits, r[given], reorder = FALSE)
    who <- as.integer(rownames(ruled_out))
    before <- rowSums(possible[who, , drop = FALSE]) > 0L
    possible[who, ] <- possible[who, , drop = FALSE] & ruled_out == 0L
    contradicted <- before & rowSums(possible[who, , drop = FALSE]) == 0L
    if (any(contradicted)) {
      stop(
        "'data' has a 'Time' column that doesn't match its waves: for respondent ",
        ids[[who[contradicted][[1L]]]], ", it contradicts the cohort the rest of the data show. ",
        "Long format constructs its own 'Time' column from the waves, so rename or drop it first.",
        call. = FALSE
      )
    }
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
## respondent took part (`real_rows`, see .lasa_long_real_rows()),
## `baseline` and `time` show about their cohort (see
## .lasa_possible_cohorts()). Says which respondents' rows get no Time,
## unless `quiet`: in a message when the data don't show their cohort (as
## far as those rows hold values: an empty row loses nothing), and in a
## warning when they show waves of several cohorts. Returns list(time,
## baseline).
.lasa_long_times <- function(r, wave_codes, real_rows, baseline, time, ids, quiet = FALSE) {
  has_data <- .lasa_long_has_data(real_rows, r, length(ids), wave_codes)
  possible <- .lasa_possible_cohorts(has_data, baseline, time, r, wave_codes, ids)
  row_time <- .lasa_row_times(possible, r, wave_codes)

  times <- .lasa_cohort_times()[wave_codes, , drop = FALSE]
  conflicting <- rowSums(possible) == 0L
  # Rows holding values at a wave whose Time depends on a cohort the data
  # don't show.
  undecided <- real_rows & is.na(row_time) & !conflicting[r] &
    rowSums(possible[r, , drop = FALSE] & !is.na(times)) > 0L
  example <- function(who) {
    i <- which(who)[[1L]]
    paste0("e.g. respondent ", ids[[r[[i]]]], " at wave ", wave_codes[[i]])
  }
  if (!quiet && any(conflicting[r])) {
    warning(
      "The data show ", sum(conflicting), " respondent(s) at waves of different cohorts (",
      example(conflicting[r]), "), so their rows have no Time.",
      call. = FALSE
    )
  }
  if (!quiet && any(undecided)) {
    message(
      "transform_lasa_data(): Time counts the waves since each respondent's baseline (Time 0), but ",
      "nothing in 'data' shows the cohort of ", length(unique(r[undecided])), " respondent(s) (",
      example(undecided), "), so those rows have no Time. A cohort shows in values (other than ",
      "missing-value codes) at its baseline or at a wave only it takes part in (B to E for the ",
      "first cohort), or in a 'Baseline' column with each respondent's baseline wave (B, 2B, 3B, ",
      "MB, or 4B)."
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

## Which elements are truly missing. Unlike is.na(), never counts an SPSS
## user-defined missing code (haven_labelled_spss) as missing: such a code
## is a value LASA recorded.
.lasa_is_na <- function(x) is.na(.lasa_bare(x))

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
##   unprefixed      whether it is one of the names LASA's wave files use
##                   without a wave prefix, which are their own long-format
##                   names too;
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

  candidate <- function(wave, stem, fc = rep(NA_character_, length(wave)), place = seq_along(wave),
                        stem_4b = NA_character_, unprefixed = FALSE, trusted = TRUE, time = NA_integer_) {
    list(
      wave = wave, stem = stem, fc = fc, place = place, stem_4b = stem_4b,
      unprefixed = unprefixed, trusted = trusted, time = time
    )
  }

  from_rows <- function(rows, canonical_attr, trusted) {
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
    candidate(wave, stem, rows_of$fc[rows], place, stem_4b, !any(rows_of$prefixed[rows]), trusted)
  }

  ## A wave prefix followed by a canonical name documented for that wave
  ## (for wave 4B, whose files use the baselines' names, at a baseline): the
  ## names .lasa_to_wide() gives columns without a LASA name.
  match_prefix <- function(lower) {
    for (i in order(-nchar(waves_table$prefix))) {
      p <- waves_table$prefix[[i]]
      if (!startsWith(lower, p)) next
      stem <- substring(lower, nchar(p) + 1L)
      wave <- waves_table$wave[[i]]
      documented <- .lasa_has(db_info$canonical_wave, paste(stem, wave, sep = "\r")) ||
        (identical(wave, "4B") && .lasa_has(db_info$baseline_stems, stem))
      if (nzchar(stem) && documented) return(candidate(wave, stem))
    }
    NULL
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
    own_wave <- attr(x, "LASA_wave", exact = TRUE)
    own_name <- attr(x, "LASA_long_name", exact = TRUE)
    if (is_scalar_text(own_wave) && toupper(own_wave) %in% waves_table$wave && is_scalar_text(own_name) &&
      identical(attr(x, "LASA_wide_name", exact = TRUE), name)) {
      return(candidate(toupper(own_wave), own_name))
    }

    lower <- tolower(name)
    canonical_attr <- attr(x, "canonical_name", exact = TRUE)
    canonical_attr <- if (is_scalar_text(canonical_attr)) tolower(canonical_attr) else NA_character_
    rows <- .lasa_lookup(db_info$wide_index, lower)

    # In long data, a canonical name is a long column -- even where it
    # equals another variable's wave-specific name (wave MB's immse01 is
    # wave I's name for mmse01) -- unless the column's own canonical_name
    # attribute says it is that other variable. A name LASA's wave files
    # use without a wave prefix is both (see .lasa_resolve_wide_columns()).
    unprefixed <- !is.null(rows) && !any(rows_of$prefixed[rows])
    if (long_mode && !unprefixed && (.lasa_has(db_info$canonical, lower) || identical(canonical_attr, lower))) {
      other_variable <- !is.na(canonical_attr) && canonical_attr != lower &&
        !is.null(rows) && any(rows_of$cn[rows] == canonical_attr)
      if (!other_variable) return(NULL)
    }

    # 2. A documented wave-specific name, or one the label report says the
    # column was matched to.
    trusted <- is.null(provenance$listed) || .lasa_has(provenance$listed, lower)
    if (!is.null(rows)) return(from_rows(rows, canonical_attr, trusted))
    alias <- .lasa_lookup(provenance$alias, lower)
    alias_rows <- .lasa_lookup(db_info$wide_index, alias)
    if (!is.null(alias_rows) && (is.na(canonical_attr) || any(rows_of$cn[alias_rows] == canonical_attr))) {
      return(from_rows(alias_rows, canonical_attr, TRUE))
    }
    if (long_mode || .lasa_has(db_info$documented, lower)) return(NULL)

    # 3. In wide data, transform_lasa_data()'s own wide names: Time-prefixed
    # ones (when the "Baseline" column they come with is there), and
    # wave-prefixed ones.
    if (time_columns) {
      time_candidate <- match_time(name)
      if (!is.null(time_candidate)) return(time_candidate)
    }
    match_prefix(lower)
  }
}

## The wave the data's provenance gives candidate `cand` (see
## .lasa_wave_candidates()) among the waves `options`, or NA: wave 4B for a
## "b" name in a 4B file; else the only one of its waves documented in the
## data's file; else the data's own wave -- as long as the provenance
## describes the column at all.
.lasa_provenance_wave <- function(cand, provenance, options) {
  if (!isTRUE(cand$trusted) || !is.na(cand$time)) return(NA_character_)
  if (identical(provenance$wave, "4B") && "4B" %in% options) return("4B")
  place <- cand$place[cand$wave[cand$place] %in% options]
  waves <- unique(cand$wave[place])
  if (!is.null(provenance$file_code)) {
    in_file <- unique(cand$wave[place][!is.na(cand$fc[place]) & cand$fc[place] == provenance$file_code])
    if (length(in_file) == 1L) return(in_file)
    if (length(in_file) > 1L) waves <- in_file
  }
  if (!is.null(provenance$wave) && provenance$wave %in% waves) return(provenance$wave)
  NA_character_
}

## The long-format name of candidate `cand` at `wave`: preferably the one
## its canonical_name attribute points to, else the one documented in the
## data's own file.
.lasa_candidate_stem <- function(cand, wave, provenance) {
  if (!is.na(cand$time)) return(cand$stem)
  at_wave <- which(cand$wave == wave)
  if (length(at_wave) == 0L) return(cand$stem_4b)
  preferred <- intersect(at_wave, cand$place)
  if (length(preferred) == 0L) preferred <- at_wave
  in_file <- preferred[isTRUE(cand$trusted) & !is.na(cand$fc[preferred]) & cand$fc[preferred] %in% provenance$file_code]
  cand$stem[[if (length(in_file) > 0L) in_file[[1L]] else preferred[[1L]]]]
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
## guessed_sources, guessed, guessed_columns, candidates): `spec` has one
## row per wide column and wave -- `column`, `stem` (its long-format name),
## `wave`, `position` (its index in `data`), and `original` (its name, NA if
## its values went to several waves or it is Time-prefixed);
## `sources[[k]]` gives, per respondent, the row of `data` holding spec row
## k's value (NA for none), and `guessed_sources[[k]]` whether that value's
## wave was guessed; `guessed_columns` are the columns whose wave had to be
## guessed for some respondents' values, `guessed` the same with those
## waves, for messages; `candidates` the wide columns' candidates (see
## .lasa_wave_candidates()). `ids` names each respondent in messages;
## `time` is the Time long data already have (per row) and `baseline` each
## respondent's "Baseline" (NULL without either). `simulate` = TRUE reads
## `data` the way transform_lasa_data() would without its provenance
## attributes (which a merge drops), clashing columns or warnings: how wide
## data it made itself will be read back.
##
## In long data, a column whose values are all on rows of waves its name
## stands for holds each value at its row's wave. Otherwise a column holds
## one value per respondent (a wide column's, or one merged into long data
## by respnr), which goes to the column's wave -- or, for a name LASA uses
## at several waves (every cohort's baseline files use the same "b" names),
## to the only one of them the respondent's cohort takes part in, as far as
## the data show it (.lasa_possible_cohorts()); else to the wave the data's
## provenance gives the column; else to a guess: the data's own wave if it
## is one of them, or the earliest. A Time-prefixed column's values go to
## the wave with that Time in each respondent's cohort.
.lasa_resolve_wide_columns <- function(data, skip, long_mode, wave_codes, resp, db_info, ids,
                                       time = NULL, baseline = NULL, simulate = FALSE) {
  all_waves <- .lasa_wave_table()$wave
  cohort_times <- .lasa_cohort_times()
  takes_part <- !is.na(cohort_times)
  n_resp <- resp$n
  provenance <- if (simulate) list() else .lasa_provenance(data)
  candidates_of <- .lasa_wave_candidates(
    db_info, provenance, long_mode,
    time_columns = !long_mode && !is.null(baseline)
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
    # Values all on rows of waves the column's name stands for (wave 4B
    # too, for a "b" name) are long already: wave files of several cohorts'
    # baselines, say, read with LASA's own names and stacked.
    for (name in names(cands)) {
      cand <- cands[[name]]
      has <- has_value[[name]]
      already_long[[name]] <- any(has) && all(wave_codes[has] %in% c(cand$wave, if (!is.na(cand$stem_4b)) "4B"))
    }
    if (!simulate) .lasa_warn_repeated(data, names(cands)[already_long], has_value, wave_codes, resp)
    # A name LASA's wave files use without a wave prefix (xcancer1) is its
    # own long-format name: long already, it is simply a long column.
    kept <- names(cands)[already_long & vapply(cands, `[[`, logical(1), "unprefixed")]
    cands[kept] <- NULL
    has_value[kept] <- NULL
    already_long <- already_long[names(cands)]
  }
  if (length(cands) == 0L) {
    return(list(
      spec = .lasa_spec(), sources = list(), guessed_sources = list(), guessed = character(0),
      guessed_columns = character(0), candidates = list()
    ))
  }
  real <- lapply(stats::setNames(names(cands), names(cands)), function(name) {
    .lasa_real_value(data[[name]], c(name, cands[[name]]$stem), db_info)
  })

  # Wave 4B's own files are read with LASA's "b" names, which the label
  # database documents for the other cohorts' baselines only: where the
  # data show any 4B, a "b" name may stand for 4B too.
  consider_4b <- (long_mode && "4B" %in% wave_codes) || identical(provenance$wave, "4B") ||
    "4B" %in% baseline || any(vapply(cands, function(cand) "4B" %in% cand$wave, logical(1)))
  options_of <- function(cand) {
    options <- unique(cand$wave[cand$place])
    if (consider_4b && !is.na(cand$stem_4b)) options <- c(options, "4B")
    all_waves[all_waves %in% options]
  }

  # What the data show about each respondent's cohort: values (other than
  # missing-value codes) of the long data's wave-specific columns on their
  # row's wave, and of columns with a single wave -- for a "b" name that
  # may stand for 4B, at that wave or 4B (`allowed`, by cohort).
  has_data <- matrix(FALSE, nrow = n_resp, ncol = length(all_waves), dimnames = list(NULL, all_waves))
  if (long_mode) {
    columns <- list()
    for (j in seq_along(data)) {
      name <- names(data)[[j]]
      if (name %in% skip) next
      if (name %in% names(cands)) {
        if (already_long[[name]]) columns[[name]] <- data[[j]]
      } else if (.lasa_documented_varying(data[[j]], name, db_info)) {
        columns[[name]] <- data[[j]]
      }
    }
    has_data <- .lasa_long_has_data(.lasa_long_real_rows(columns, nrow(data), db_info), resp$r, n_resp, wave_codes)
  }
  allowed <- matrix(TRUE, nrow = n_resp, ncol = ncol(takes_part))
  for (name in names(cands)) {
    cand <- cands[[name]]
    if (!is.na(cand$time) || already_long[[name]]) next
    options <- options_of(cand)
    who <- unique(resp$r[real[[name]]])
    if (length(options) == 1L) {
      has_data[who, options] <- TRUE
    } else if (length(options) == 2L && identical(options[[2L]], "4B") && !is.na(cand$stem_4b) &&
      length(unique(cand$wave[cand$place])) == 1L) {
      either <- takes_part[options[[1L]], ] | takes_part["4B", ]
      allowed[who, ] <- allowed[who, , drop = FALSE] &
        matrix(either, nrow = length(who), ncol = length(either), byrow = TRUE)
    }
  }
  possible <- .lasa_possible_cohorts(has_data, baseline, time, resp$r, wave_codes, ids, allowed)

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
        # Only a value that shows the respondent took part makes the guess
        # matter: a missing-value code ("no observation ...") says nothing
        # about the wave it is placed at.
        real_holder <- nobody
        real_holder[holders] <- real[[name]][rows[holders]]
        guessed <- rest & real_holder
      }
    }
    waves <- options[options %in% assigned]
    sources <- lapply(waves, function(w) ifelse(!is.na(assigned) & assigned == w, rows, NA_integer_))
    placed(waves, sources, options[options %in% assigned[guessed]], guessed)
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
      if (n_open[[i]] == 0L) {
        stop(
          "Column '", name, "' holds a value for respondent ", ids[[i]], ", whose cohort ",
          "(see the 'Baseline' column) has no wave with Time ", cand$time, ".",
          call. = FALSE
        )
      }
      stop(
        "Column '", name, "' holds values for ", sum(unknown), " respondent(s) whose cohort ",
        "'data' don't show (e.g. respondent ", ids[[i]], ", without a 'Baseline'), so the wave ",
        "with Time ", cand$time, " is unknown for them.",
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
        has_data[!is.na(p$sources[[k]]) & real[[name]] & !p$guessed, p$waves[[k]]] <- TRUE
      }
    }
    possible <- .lasa_possible_cohorts(has_data, baseline, ids = ids, allowed = allowed)
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
  for (name in names(cands)) {
    cand <- cands[[name]]
    p <- placed[[name]]
    if (length(p$guessed_waves) > 0L) {
      guessed <- c(guessed, paste0(name, " (", paste(p$guessed_waves, collapse = "/"), ")"))
      guessed_columns <- c(guessed_columns, name)
    }
    for (k in seq_along(p$waves)) {
      column <- c(column, name)
      stem <- c(stem, .lasa_candidate_stem(cand, p$waves[[k]], provenance))
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
    guessed_columns = guessed_columns, candidates = cands
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
## which only wide data with their "Baseline" column can be read with
## (`time_columns`: whether they were).
.lasa_warn_unplaced <- function(data, columns, long_mode, db_info, time_columns = FALSE) {
  suffixed <- character(0)
  stripped <- character(0)
  time_named <- character(0)
  for (name in columns) {
    lower <- tolower(name)
    base <- sub("(\\.x|\\.y|\\.\\.\\.[0-9]+)$", "", lower)
    if (!identical(base, lower) && (.lasa_has(db_info$wide_index, base) ||
      (!long_mode && .lasa_has(db_info$time_varying, base)))) {
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
      "variables renamed by a merge (.x/.y), so their wave is unknown and they're kept as ",
      "they are. Stack, rather than merge, files that hold the same columns for different ",
      "respondents (such as Z files of different cohorts), and merge long data by respnr ",
      "and Wave.",
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
      "wide data together with their 'Baseline' column (each respondent's baseline wave), so ",
      "they're kept as they are.",
      call. = FALSE
    )
  }
  invisible(NULL)
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
## combine, since wide format gives each wave its own back.
.lasa_to_long <- function(data, db_info, for_wide = FALSE) {
  id <- .lasa_find_respnr(data)
  all_waves <- .lasa_wave_table()$wave

  wave_column <- .lasa_find_wave(data)
  wave_name <- wave_column$name
  wave_codes <- if (!is.null(wave_name)) .lasa_normalize_wave_codes(data[[wave_name]]) else NULL
  # A Z file read with standardize = TRUE has a placeholder "Wave" = "Z":
  # still wide data.
  long_mode <- !is.null(wave_name) &&
    !(nrow(data) > 0L && all(!is.na(wave_codes) & wave_codes == "Z"))
  if (long_mode) .lasa_check_wave_codes(wave_codes, wave_name)
  existing_time <- .lasa_existing_time(data, long_mode, wave_codes)

  resp <- .lasa_respondents(data[[id]], id)
  if (long_mode) {
    if (anyDuplicated(paste(resp$r, wave_codes, sep = "\r")) > 0L) {
      stop(
        "'data' has more than one row for the same respondent and wave; long data need ",
        "one row per respondent per wave.",
        call. = FALSE
      )
    }
  } else if (resp$n != nrow(data)) {
    stop(
      "The respondent identifier column '", id, "' has duplicated values, but 'data' has no ",
      "'Wave' column: wide data need one row per respondent, and long data a 'Wave' column.",
      call. = FALSE
    )
  }
  n_resp <- resp$n
  respondent_row <- .lasa_first_row(resp$r, n_resp)
  ids <- .lasa_text_key(.lasa_slice(data[[id]], respondent_row))
  baseline <- .lasa_find_baseline(data, resp$r, n_resp)
  if (!is.null(baseline)) baseline <- baseline[.lasa_first_row(resp$r, n_resp, keep = !is.na(baseline))]

  skip <- c(id, wave_name, wave_column$placeholders, existing_time$names)
  found <- .lasa_resolve_wide_columns(
    data, skip, long_mode, wave_codes, resp, db_info, ids,
    time = existing_time$values, baseline = baseline
  )
  wide <- found$spec
  .lasa_warn_unplaced(
    data, setdiff(names(data), c(skip, wide$column)), long_mode, db_info,
    time_columns = !long_mode && !is.null(baseline)
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

  ## The Time of long data's rows (respondent `r` at wave `w`, from rows
  ## `source_row` of `data`, NA for added rows) and their respondents'
  ## baselines (.lasa_long_times()), from what the long data's wave-specific
  ## `columns` show about each respondent's cohort -- except for values
  ## placed at a guessed wave (`guessed`, see .lasa_long_real_rows()).
  times_of <- function(columns, r, w, source_row, guessed = list()) {
    varying <- vapply(names(columns), function(name) {
      .lasa_documented_varying(columns[[name]], name, db_info)
    }, logical(1))
    real_rows <- .lasa_long_real_rows(columns[varying], length(r), db_info, exclude = guessed)
    time <- if (is.null(existing_time$values)) NULL else existing_time$values[source_row]
    .lasa_long_times(r, w, real_rows, baseline, time, ids, quiet = for_wide)
  }

  if (nrow(wide) == 0L) {
    if (long_mode) {
      times <- times_of(as.list(data)[setdiff(names(data), skip)], resp$r, wave_codes, seq_len(nrow(data)))
      columns <- .lasa_place_wave_time(as.list(data), id, wave_codes, times$time, drop = setdiff(skip, id))
      out <- .lasa_build_frame(columns, data)
      out <- .lasa_set_wave_attr(out, unique(wave_codes), long = TRUE, template = data)
      return(list(data = out, added = rep(FALSE, nrow(data)), baseline = times$baseline[resp$r]))
    }
    if (!for_wide) {
      message(
        "transform_lasa_data(): no wave-specific columns found in 'data', so it has no ",
        "wave dimension; returned with one row per respondent."
      )
    }
    columns <- as.list(data)
    columns[setdiff(skip, id)] <- NULL
    out <- .lasa_build_frame(columns, data)
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
    if (any(guessed)) guessed_cells[[stem]] <- guessed[cbind(grid_r, grid_wpos)]

    pieces <- lapply(which(wide$stem == stem), function(k) list(
      wave = wide$wave[[k]],
      column = .lasa_slice(data[[wide$column[[k]]]], found$sources[[k]]),
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
    if (!long_mode) {
      result[[name]] <- .lasa_slice(x, data_row)
      next
    }
    rows <- data_row
    added <- is.na(rows)
    if (any(added) && (.lasa_has(db_info$stable, tolower(name)) || (identical(name, "Baseline") && !is.null(baseline)))) {
      # A documented stable variable holds for every wave (and a respondent's
      # baseline for all their rows): fill added rows from the respondent's
      # (single) value.
      key <- .lasa_value_key(x)
      single <- .lasa_distinct_values(resp$r, key, n_resp) == 1L
      source_row <- .lasa_first_row(resp$r, n_resp, keep = !is.na(key))
      fill <- added & single[grid_r]
      rows[fill] <- source_row[grid_r[fill]]
    }
    result[[name]] <- .lasa_slice(x, rows)
  }

  # What each long column built from wide columns needs to give them back,
  # recorded against its final type and attributes.
  for (stem in stems) {
    attr(result[[stem]], "LASA_wide_columns") <- .lasa_wide_store(
      stores[[stem]]$originals, stores[[stem]]$names, stores[[stem]]$positions, stem, result[[stem]]
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
## that wave -- its type and attributes.
.lasa_wide_store <- function(originals, names, positions, stem, long) {
  waves <- names(originals)
  long_kind <- .lasa_column_kind(long)
  long_structure <- .lasa_structure_of(long)
  long_type <- typeof(.lasa_bare(long))
  long_attributes <- attributes(long)

  changes <- list()
  for (wave in waves) {
    x <- originals[[wave]]
    baseline <- .lasa_content_of(.lasa_generic_wide_attributes(long_attributes, wave, single_wave = FALSE))
    content <- .lasa_content_attributes(x)
    change <- list()
    differs <- vapply(names(content), function(nm) !identical(content[[nm]], baseline[[nm]]), logical(1))
    if (any(differs)) change$set <- content[differs]
    dropped <- setdiff(names(baseline), names(content))
    if (length(dropped) > 0L) change$drop <- dropped
    if (!identical(.lasa_structure_of(x), long_structure)) change["structure"] <- list(.lasa_structure_of(x))
    if (!identical(typeof(.lasa_bare(x)), long_type)) change$type <- typeof(.lasa_bare(x))
    if (!identical(.lasa_column_kind(x), long_kind)) change$kind <- .lasa_column_kind(x)
    if (length(change) > 0L) changes[[wave]] <- change
  }

  list(
    long_name = stem,
    kind = long_kind,
    names = stats::setNames(unname(names[waves]), waves),
    positions = stats::setNames(unname(positions[waves]), waves),
    empty = waves[vapply(originals, function(x) all(.lasa_is_na(x)), logical(1))],
    changes = changes
  )
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
## position), in calendar order. `cell[, k]` gives each respondent's row at
## wave `present_waves[[k]]` (NA for none). A column comes back as the
## store recorded it where it can (.lasa_restore_wide_column()), and with
## its original name while `x` keeps its own.
.lasa_wide_pieces <- function(x, name, cell, present_waves, single_wave) {
  all_waves <- .lasa_wave_table()$wave
  store <- attr(x, "LASA_wide_columns", exact = TRUE)
  if (!is.list(store)) store <- NULL
  store_waves <- .lasa_store_waves(store, present_waves)
  # The original names only apply while the long column keeps its name,
  # and its type only while the long column keeps its kind.
  original_names <- if (!is.null(store) && identical(store$long_name, name)) store$names else NULL
  store_usable <- !is.null(store) && identical(store$kind, .lasa_column_kind(x))

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
      position = if (in_store) unname(store$positions[[wave]]) else NA_integer_
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
## the digits a number needs, a date-time in its own time zone, a time span
## with its unit.
.lasa_fallback_text <- function(x) {
  if (is.factor(x)) return(as.character(x))
  values <- .lasa_bare(x)
  if (inherits(x, "POSIXct")) {
    out <- format(x, "%Y-%m-%d %H:%M:%S")
    fraction <- which(!is.na(values) & values != floor(values))
    out[fraction] <- format(x[fraction], "%Y-%m-%d %H:%M:%OS6")
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
    POSIXct = .lasa_bare(as.POSIXct(text, tz = structure$tzone %||% "", format = "%Y-%m-%d %H:%M:%OS")),
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
## (one entry when those agree), or kept when the long data have a single
## wave (`single_wave`).
.lasa_generic_wide_attributes <- function(a, waves, single_wave) {
  a[intersect(names(a), .lasa_transform_attrs)] <- NULL
  narrow <- function(per_wave) {
    kept <- per_wave[intersect(waves, names(per_wave))]
    if (length(kept) == 0L) return(NULL)
    if (length(unique(kept)) == 1L) return(kept[[1L]])
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

## format = "wide", from long data as .lasa_to_long() makes them (with
## "Wave" and "Time" columns). `added` marks rows .lasa_to_long() added for
## values of wide columns (NULL if none): columns that aren't wave-specific
## were never measured there, so such rows don't count against their being
## stable. `baseline` gives each row's respondent's baseline wave (NA where
## the data don't show it), which prefix = "Time" puts in a "Baseline"
## column.
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
  if (by_time && "Baseline" %in% names(long)) {
    if (is.null(.lasa_find_baseline(long, resp$r, n_resp))) {
      stop(
        "'data' has a 'Baseline' column of its own, but Time-prefixed wide format adds one ",
        "with each respondent's baseline wave; rename it first.",
        call. = FALSE
      )
    }
    # One an earlier transformation made: replaced by the one made now.
    reserved <- c(reserved, "Baseline")
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
    for (v_index in seq_along(varying)) {
      name <- varying[[v_index]]
      for (piece in .lasa_wide_pieces(long[[name]], name, cell, present_waves, single_wave)) {
        entries[[length(entries) + 1L]] <- list(
          column = piece$column, stem = name, wave = piece$wave, time = NA_integer_,
          original = piece$original, position = as.numeric(piece$position),
          rank = match(piece$wave, all_waves), variable = v_index, waves = piece$wave
        )
      }
    }
  } else {
    time <- suppressWarnings(as.integer(.lasa_bare(long[["Time"]])))
    slot <- ifelse(wave_codes == "A", -1L, time)
    no_slot <- is.na(slot)
    if (any(no_slot)) {
      ## Rows holding a value `test` says yes to in a wave-specific column.
      holding <- function(test) {
        Reduce(`|`, lapply(varying, function(name) test(long[[name]], name)), rep(FALSE, nrow(long)))
      }
      stuck <- no_slot & holding(function(x, name) .lasa_real_value(x, name, db_info))
      if (any(stuck)) {
        i <- which(stuck)[[1L]]
        stop(
          "Time-prefixed wide format needs the Time of every value, but ", length(unique(resp$r[stuck])),
          " respondent(s) have values at waves without one (e.g. respondent ",
          .lasa_text_key(.lasa_slice(long[[id]], i)), " at wave ", wave_codes[[i]], "): the data ",
          "don't show their cohort, or show waves of several cohorts. Use prefix = \"Wave\", or give ",
          "'data' a 'Baseline' column with each respondent's baseline wave (B, 2B, 3B, MB, or 4B).",
          call. = FALSE
        )
      }
      left_out <- no_slot & holding(function(x, name) !.lasa_is_na(x))
      if (any(left_out)) {
        i <- which(left_out)[[1L]]
        message(
          "transform_lasa_data(): ", sum(left_out), " row(s) hold nothing but missing-value codes at ",
          "a wave without a Time for their respondent (e.g. respondent ",
          .lasa_text_key(.lasa_slice(long[[id]], i)), " at wave ", wave_codes[[i]], "), such as a ",
          "later cohort's waves before it joined LASA; Time-prefixed wide format has no column for ",
          "them, so they're left out."
        )
      }
    }
    slots <- sort(unique(slot[!no_slot]))
    slot_cell <- matrix(NA_integer_, nrow = n_resp, ncol = length(slots))
    slot_cell[cbind(resp$r[!no_slot], match(slot[!no_slot], slots))] <- which(!no_slot)

    retyped <- character(0)
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
        } else if (store_usable && identical(store$kind, "character") && length(waves) > 1L &&
          any(vapply(waves, function(w) !is.null(store$changes[[w]]$kind), logical(1)))) {
          retyped <- c(retyped, name)
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
  }

  stems <- vapply(entries, `[[`, character(1), "stem")
  entry_waves <- vapply(entries, `[[`, character(1), "wave")
  times <- vapply(entries, `[[`, integer(1), "time")
  originals <- vapply(entries, `[[`, character(1), "original")

  ## LASA's own name for `stem` at `wave` where the label database documents
  ## one for that variable and wave alone (bm15twtrh, wave B's m15wrth,
  ## rather than bm15wrth, wave 2B's name), else NA.
  lasa_name <- function(stem, wave) {
    for (vn in .lasa_lookup(db_info$wave_names, paste(tolower(stem), wave, sep = "\r"))) {
      rows <- .lasa_lookup(db_info$wide_index, vn)
      if (all(db_info$wide_rows$cn[rows] == tolower(stem) & db_info$wide_rows$wave[rows] == wave)) return(vn)
    }
    NA_character_
  }
  ## The name of wide column k: t<Time>_<variable>; else its original name
  ## (if `use_original`); else LASA's own; else the wave's prefix and the
  ## variable's name: boak, b2oak, ...
  name_of <- function(k, use_original) {
    if (!is.na(times[[k]])) return(paste0("t", times[[k]], "_", stems[[k]]))
    if (use_original && !is.na(originals[[k]])) return(originals[[k]])
    documented <- lasa_name(stems[[k]], entry_waves[[k]])
    if (!is.na(documented)) return(documented)
    paste0(waves_table$prefix[match(entry_waves[[k]], all_waves)], stems[[k]])
  }
  use_original <- !is.na(originals)
  wide_names <- vapply(seq_along(entries), function(k) name_of(k, use_original[[k]]), character(1))
  # An original name may be the name another wave's column gets (a b name
  # from one cohort's file, after files of several cohorts were stacked in
  # long format): then it yields.
  repeat {
    taken <- c(id, if (by_time) "Baseline", names(stable), wide_names)
    yield <- use_original & wide_names %in% taken[duplicated(taken)]
    if (!any(yield)) break
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

  result <- stats::setNames(list(.lasa_slice(long[[id]], respondent_row)), id)
  if (by_time) {
    baseline_column <- if (is.null(baseline)) rep(NA_character_, n_resp) else baseline[respondent_row]
    attr(baseline_column, "label") <- .lasa_baseline_column_label
    result[["Baseline"]] <- baseline_column
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
    back <- .lasa_resolve_wide_columns(
      out, skip = id, long_mode = FALSE, wave_codes = NULL, resp = out_resp, db_info = db_info,
      ids = out_ids, baseline = .lasa_find_baseline(out, out_resp$r, n_resp), simulate = TRUE
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
      found <- back$spec[back$spec$column == name, , drop = FALSE]
      read_back <- nrow(found) == 1L && identical(found$stem, stems[[k]]) &&
        identical(found$wave, entry_waves[[k]]) && !name %in% back$guessed_columns
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
  label_sources <- c(stats::setNames(as.list(stems), wide_names), if (by_time) list(Baseline = character(0)))
  .lasa_set_wave_attr(.lasa_build_frame(result, long, label_sources), output_waves, long = FALSE, template = long)
}
