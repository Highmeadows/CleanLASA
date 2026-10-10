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
# every cohort (B, 2B, 3B, MB) with the same "b" prefix. Each respondent's
# value is then placed at the wave the data show for that respondent
# (`.lasa_resolve_wide_columns()`): the row the value is on, the
# respondent's other waves, the data's provenance attributes, and only
# then the earliest wave, with a message.
#
# Round trips: every long column built from wide columns stores, per wave,
# the original wide column's name and whatever of its attributes the long
# column can't hold (attribute "LASA_wide_columns"), so wide -> long ->
# wide restores the original columns exactly as long as the long data
# weren't changed in a way that rules that out (see
# `.lasa_restore_wide_column()`).

## LASA's waves in calendar order: the prefix each wave's variables carry
## in wide data, and the number used for the "Time" column (and for
## prefix = "Time"). The later cohorts' baselines (2B, 3B, 4B, MB) all use
## the prefix "b" in LASA's own wave files, which would make their wide
## columns collide with wave B's; wide output keeps them apart as b2/b3/b4/mb,
## the convention LASA's own zoa2/zoa3 files use for 2B/3B. "Time" counts
## the waves in calendar order (B = 1), with the pre-baseline LSN wave A as 0.
## 4B and L are accepted by .lasa_parse_filename() but have no documentation
## or Time number yet.
.lasa_wave_table <- function() {
  data.frame(
    wave = c("A", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K", "4B", "L"),
    prefix = c("a", "b", "c", "d", "e", "b2", "f", "g", "h", "b3", "mb", "i", "j", "k", "b4", "l"),
    time = c(0:13, NA_integer_, NA_integer_),
    stringsAsFactors = FALSE
  )
}

## Waves only one cohort takes part in, each mapped to that cohort's
## baseline: the LSN wave (A) and waves B-E belong to the first cohort
## alone (the second cohort joined LASA at 2B, after wave E), and every
## later cohort's baseline is its own. From wave F on, cohorts share waves.
.lasa_cohort_of_wave <- c(
  A = "B", B = "B", C = "B", D = "B", E = "B",
  `2B` = "2B", `3B` = "3B", MB = "MB", `4B` = "4B"
)

.lasa_wave_column_label <- "LASA measurement wave"
.lasa_time_column_label <- "LASA measurement time (waves in calendar order, B = 1)"

## Attributes transform_lasa_data() manages itself. Wide columns it creates
## carry "LASA_wave"/"LASA_long_name" when their name alone doesn't say
## which wave and variable they hold; long columns it builds from wide
## columns carry "LASA_wide_columns".
.lasa_transform_attrs <- c("LASA_wave", "LASA_long_name", "LASA_wide_columns")

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
#' counts -- and respondents of a later cohort therefore get no rows for the
#' waves before they joined LASA. A respondent without any value at any
#' wave keeps a row for every wave, so nobody disappears. Rows are sorted by
#' respondent (in order of first appearance) and wave, except in long data
#' without wide columns, which keep their order.
#'
#' **Time** numbers the waves in calendar order: A (LSN) = 0, B = 1, C = 2,
#' D = 3, E = 4, 2B = 5, F = 6, G = 7, H = 8, 3B = 9, MB = 10, I = 11,
#' J = 12, K = 13; waves 4B and L have no Time number yet (`NA`). It orders
#' the waves; it is not a time scale (waves are one to four years apart,
#' and each cohort skips the other cohorts' baselines), nor LASA's own wave
#' numbering, which `LASAZ008.SAV` uses (`t2_dat` is wave B there). For
#' time itself, use the interview dates or ages in `LASAZ008.SAV`. A
#' `"Time"` column already in long data is recomputed, so it must match
#' these numbers.
#'
#' **Stable variables** -- columns that hold for every wave, such as sex or
#' year of birth (`byear`) in `LASAZ004.SAV` -- keep one column and are
#' repeated on each of the respondent's rows.
#'
#' **Which columns are wave-specific** is decided per column: a column made
#' wide by `transform_lasa_data()` itself is recognized from attributes it
#' carries; any other column is wave-specific when [lasa_label_db()]
#' documents its name as a wave-specific variable -- which covers LASA's
#' irregular names too, such as `t2_dat` (`t_dat`, wave B), `b_dm` (`dm`)
#' or `b2oak` (`oak`, wave 2B), and a column [read_lasa_sav()] matched to
#' such a name by fuzzy matching or `name_corrections` -- or, for data that
#' aren't long yet (no `"Wave"` column, or only the `"Z"` placeholder
#' [read_lasa_sav()] gives a Z file), when its name is a wave prefix
#' followed by a variable the label database documents for that wave (the
#' names wide format uses, see below). All other columns are treated as
#' stable, including columns the label database doesn't know. A warning
#' names columns kept stable that look like wave-specific variables: names
#' a merge suffixed with `.x`/`.y`, and, in wide data, variables read with
#' their wave stripped from their name.
#'
#' **Cohort baselines.** LASA's wave files name the baseline of every cohort
#' (B, 2B, 3B, MB) with the same `b` prefix, so a name such as `blphya01`
#' may belong to any of them. Each respondent's value goes to the baseline
#' the data show for that respondent: in long data, a value already on a
#' row of one of those waves stays there; otherwise, the respondent's
#' other waves decide (a row or value at 2B, say, or at LSN or waves B-E,
#' which only the first cohort has), and then the file the column came
#' from (the data's `"LASA_file_code"` and `"LASA_wave"` attributes, as far
#' as the data's label report lists the column, since a merge keeps at most
#' the first file's attributes). If nothing says, the value goes to the
#' earliest of those waves, and a message names the column.
#'
#' **Merged files.** `data` may be several LASA files merged together, in
#' any of three shapes:
#' * long (the most reliable), e.g. wave files read with the default
#'   `standardize = TRUE`, stacked with [rbind()] per file code and merged
#'   by `respnr` and `"Wave"`; Z files read with `format_as_long = TRUE`
#'   combine with those the same way;
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
#' at which it has any non-missing value, and a long column made from wide
#' columns gets all of those columns back, also ones without any value.
#' With `prefix = "Wave"`, a column's name is its wave's lowercase LASA
#' prefix followed by the variable name: `boak`, `coak`, `doak`, ... Waves
#' 2B, 3B, 4B, and MB get the prefixes `b2`, `b3`, `b4`, and `mb` (as
#' LASA's own `zoa2`/`zoa3` files do for 2B and 3B), so they don't collide
#' with wave B's columns. A column that came from a wide LASA file gets its
#' original name back (e.g. `t2_dat` rather than `bt_dat`), unless its
#' values went to several waves. With `prefix = "Time"`, names are `t`, the
#' wave's `"Time"` number, and an underscore followed by the variable name
#' (`t1_oak`, `t2_oak`, ...), and original names aren't kept, also not when
#' such data are made wide again with `prefix = "Wave"`. A column stays
#' stable in wide format when it has a single value per respondent and
#' isn't a documented wave-specific variable; a documented stable variable
#' (such as `sex`) only needs to agree across the rows where it isn't
#' missing. A wide column whose name alone doesn't say which wave and
#' variable it holds (a name the label database doesn't document, or a `b`
#' name it documents for several cohorts) carries the attributes
#' `"LASA_wave"` and `"LASA_long_name"`, which transforming it back uses.
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
#' user-missing codes, with a warning. Time spans (`difftime`) get the
#' first wave's unit. Converting back to wide restores each wide column's
#' original name, type (also from text), and attributes, as long as its
#' values still fit them.
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
#' # A Z-file-shaped data frame: knee osteoarthritis (oak) at waves B and C,
#' # plus a stable variable (sex).
#' wide <- data.frame(
#'   respnr = c(101, 102),
#'   sex = c(1, 2),
#'   boak = c(0, 2),
#'   coak = c(1, 8)
#' )
#'
#' long <- transform_lasa_data(wide) # format = "long" is the default
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
  long <- .lasa_to_long(data, db_info, quiet = TRUE)
  if (!"Wave" %in% names(long$data)) {
    # No wave dimension at all (e.g. LASAZ004.SAV): already wide.
    return(long$data)
  }
  .lasa_to_wide(long$data, prefix, db_info, added = long$added)
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
##   wide_rows      documented wave-specific names (variable_name differs
##                  from canonical_name): vn, cn, fc (normalized file code),
##                  wave; `wide_index` gives their row numbers by vn.
##   documented     every documented name, wave-specific or canonical.
##   canonical      every canonical name.
##   canonical_wave "<canonical>\r<wave>" for every documented pair.
##   time_varying   canonical names of wave-specific variables.
##   stable         canonical names only ever documented as Z/MB-file
##                  variables without a wave prefix (sex, byear, aedu, ...).
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
  z_stable <- !prefixed & grepl("^(z|mb)", fc)
  wide_rows <- data.frame(
    vn = vn[prefixed], cn = cn[prefixed], fc = fc[prefixed], wave = wave[prefixed],
    stringsAsFactors = FALSE
  )
  time_varying <- unique(cn[!z_stable])

  override_names <- tolower(db$manual_overrides$variables$variable_name)

  info <- list(
    wide_rows = wide_rows,
    wide_index = .lasa_hash(split(seq_len(nrow(wide_rows)), wide_rows$vn)),
    documented = .lasa_hash_set(c(vn, cn, override_names)),
    canonical = .lasa_hash_set(cn),
    canonical_wave = .lasa_hash_set(paste(cn, wave, sep = "\r")),
    time_varying = .lasa_hash_set(time_varying),
    stable = .lasa_hash_set(setdiff(unique(cn[z_stable]), time_varying))
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
## Time from the waves, so in long data they must agree with the waves (and
## are then dropped, to be recomputed); data that aren't long yet can't
## have a "Time" column. Returns the names of the columns to drop.
.lasa_time_columns <- function(data, long_mode, wave_codes) {
  found <- names(data)[names(data) %in% c("Time", "Time.x", "Time.y")]
  if (!long_mode) {
    if ("Time" %in% found) {
      stop(
        "'data' has no wave dimension yet but already has a 'Time' column; long format ",
        "constructs its own 'Time' column, so rename or drop it first.",
        call. = FALSE
      )
    }
    return(character(0))
  }
  waves_table <- .lasa_wave_table()
  expected <- waves_table$time[match(wave_codes, waves_table$wave)]
  for (name in found) {
    x <- data[[name]]
    values <- if (is.factor(x)) as.character(x) else .lasa_bare(x)
    numbers <- suppressWarnings(as.numeric(values))
    wrong <- !is.na(values) & (is.na(numbers) | is.na(expected) | numbers != expected)
    if (any(wrong)) {
      i <- which(wrong)[[1L]]
      stop(
        "'data' has a '", name, "' column that doesn't match its waves (e.g. ", values[[i]],
        " at wave ", wave_codes[[i]], ", which has Time ", expected[[i]], "). Long format ",
        "constructs its own 'Time' column from the waves, so rename or drop it first.",
        call. = FALSE
      )
    }
  }
  found
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
## such as "label_report" and "LASA_file_code".
.lasa_build_frame <- function(columns, template) {
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
  if (!is.null(template_attrs[["variable.labels"]])) {
    attr(out, "variable.labels") <- stats::setNames(
      vapply(
        out,
        function(x) {
          label <- attr(x, "label", exact = TRUE)
          if (is.character(label) && length(label) == 1L) label else NA_character_
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
## Returns the values and whether they had to fall back to text.
.lasa_stack_columns <- function(columns, n) {
  columns <- lapply(columns, function(x) if (is.null(x)) rep(NA, n) else x)
  factors <- Filter(is.factor, columns)
  kinds <- vapply(columns, .lasa_column_kind, character(1))
  # A column without any value (a wave nobody answered) fits whatever the
  # other waves hold, so only columns with values decide the kind.
  informative <- !vapply(columns, function(x) all(.lasa_is_na(x)), logical(1))
  if (!any(informative)) informative <- kinds != "na"
  if (!any(informative)) {
    return(list(values = rep(NA, n * length(columns)), kind = "na", fallback = FALSE))
  }
  columns[!informative] <- lapply(columns[!informative], function(x) rep(NA, length(x)))
  unified <- .lasa_unify_kinds(kinds[informative])
  kind <- unified$kind
  first <- columns[informative][[1L]]

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
    character = unlist(lapply(columns, function(x) {
      if (is.factor(x) || is.object(x)) as.character(x) else as.character(.lasa_bare(x))
    })),
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
      labelled <- columns[startsWith(kinds, "labelled_")]
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
      # Time spans (difftime) in different units are converted to the first
      # wave's unit.
      same_class <- length(unique(lapply(columns[informative], class))) == 1L
      if (same_class && inherits(first, "difftime") && !inherits(first, "hms")) {
        units_first <- attr(first, "units", exact = TRUE)
        for (i in which(informative)) units(columns[[i]]) <- units_first
      }
      structures <- lapply(columns[informative], .lasa_structure_of)
      if (same_class && length(unique(structures)) == 1L) {
        out <- unlist(lapply(columns, .lasa_bare))
        attributes(out) <- structures[[1L]]
        out
      } else {
        unified$fallback <- TRUE
        kind <- "character"
        unlist(lapply(columns, function(x) as.character(x)))
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
    standardized <- if ("standardized_to" %in% names(report)) {
      report$standardized_to[matched]
    } else {
      rep(NA_character_, sum(matched))
    }
    in_data <- tolower(c(report$matched_name[matched], standardized))
    documented <- rep(tolower(report$suffix[matched]), 2L)
    out$listed <- .lasa_hash_set(in_data)
    keep <- !is.na(in_data) & !is.na(documented) & in_data != documented & !duplicated(in_data)
    out$alias <- .lasa_hash(stats::setNames(as.list(documented[keep]), in_data[keep]))
  }
  out
}

## Returns a function(name, x) telling whether column `x`, named `name`, is
## a wave-specific (wide) column: NULL if not; otherwise the label-database
## rows it may stand for, as list(wave, stem, fc) in calendar order (`stem`
## is the long-format name, `fc` the file code), plus `trusted`: whether the
## data's provenance describes the column. In long data (`long_mode`),
## canonical names are long columns.
.lasa_wave_candidates <- function(db_info, provenance, long_mode) {
  waves_table <- .lasa_wave_table()
  is_scalar_text <- function(x) is.character(x) && length(x) == 1L && !is.na(x) && nzchar(x)
  rows_of <- db_info$wide_rows

  from_rows <- function(rows, canonical_attr, trusted) {
    if (!is.na(canonical_attr)) {
      same_variable <- rows[rows_of$cn[rows] == canonical_attr]
      if (length(same_variable) > 0L) rows <- same_variable
    }
    rows <- rows[order(match(rows_of$wave[rows], waves_table$wave))]
    list(wave = rows_of$wave[rows], stem = rows_of$cn[rows], fc = rows_of$fc[rows], trusted = trusted)
  }

  ## Wave prefix (or t<Time>_) followed by a canonical name documented for
  ## that wave: the names .lasa_to_wide() gives columns without an
  ## original LASA name.
  match_pattern <- function(name) {
    time_match <- regmatches(name, regexec("^t([0-9]+)_(.+)$", name))[[1L]]
    if (length(time_match) == 3L) {
      wave <- waves_table$wave[which(waves_table$time == as.integer(time_match[[2L]]))]
      if (length(wave) == 1L && .lasa_has(db_info$canonical_wave, paste(time_match[[3L]], wave, sep = "\r"))) {
        return(list(wave = wave, stem = time_match[[3L]], fc = NA_character_, trusted = TRUE))
      }
    }
    for (i in order(-nchar(waves_table$prefix))) {
      p <- waves_table$prefix[[i]]
      if (!startsWith(name, p)) next
      stem <- substring(name, nchar(p) + 1L)
      if (nzchar(stem) && .lasa_has(db_info$canonical_wave, paste(stem, waves_table$wave[[i]], sep = "\r"))) {
        return(list(wave = waves_table$wave[[i]], stem = stem, fc = NA_character_, trusted = TRUE))
      }
    }
    NULL
  }

  function(name, x) {
    # 1. A wide column transform_lasa_data() made itself.
    own_wave <- attr(x, "LASA_wave", exact = TRUE)
    own_name <- attr(x, "LASA_long_name", exact = TRUE)
    if (is_scalar_text(own_wave) && toupper(own_wave) %in% waves_table$wave && is_scalar_text(own_name)) {
      return(list(wave = toupper(own_wave), stem = own_name, fc = NA_character_, trusted = TRUE))
    }

    lower <- tolower(name)
    canonical_attr <- attr(x, "canonical_name", exact = TRUE)
    canonical_attr <- if (is_scalar_text(canonical_attr)) tolower(canonical_attr) else NA_character_
    rows <- .lasa_lookup(db_info$wide_index, lower)

    # In long data, a canonical name is a long column -- even where it
    # equals another variable's wave-specific name (wave MB's immse01 is
    # wave I's name for mmse01) -- unless the column's own canonical_name
    # attribute says it is that other variable.
    if (long_mode && (.lasa_has(db_info$canonical, lower) || identical(canonical_attr, lower))) {
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
    if (.lasa_has(db_info$documented, lower)) return(NULL)

    # 3. transform_lasa_data()'s own wide naming, in wide data only.
    if (!long_mode) return(match_pattern(lower))
    NULL
  }
}

## The wave the data's provenance gives a column documented for several
## waves (`cand`, from .lasa_wave_candidates()), or NA: the only one of its
## waves documented in the data's file, or else the data's own wave -- as
## long as the provenance describes the column at all.
.lasa_provenance_wave <- function(cand, provenance) {
  if (!isTRUE(cand$trusted)) return(NA_character_)
  waves <- unique(cand$wave)
  if (!is.null(provenance$file_code)) {
    in_file <- unique(cand$wave[!is.na(cand$fc) & cand$fc == provenance$file_code])
    if (length(in_file) == 1L) return(in_file)
    if (length(in_file) > 1L) waves <- in_file
  }
  if (!is.null(provenance$wave) && provenance$wave %in% waves) return(provenance$wave)
  NA_character_
}

## The long-format name of candidate `cand` at `wave`: the one documented in
## the data's own file if there is a choice.
.lasa_candidate_stem <- function(cand, wave, provenance) {
  at_wave <- which(cand$wave == wave)
  in_file <- at_wave[!is.na(cand$fc[at_wave]) & identical(cand$trusted, TRUE) &
    cand$fc[at_wave] %in% provenance$file_code]
  cand$stem[[if (length(in_file) > 0L) in_file[[1L]] else at_wave[[1L]]]]
}

## Decides which columns of `data` are wave-specific (wide) columns, and
## the wave each of their values belongs to. Returns list(spec, sources,
## guessed, guessed_columns): `spec` has one row per wide column and wave
## -- `column`, `stem` (its long-format name), `wave`, `position` (its
## index in `data`), and `original` (its name, NA if its values went to
## several waves); `sources[[k]]` gives, per respondent, the row of `data`
## holding spec row k's value (NA for none); `guessed_columns` are the
## columns whose wave had to be guessed for some respondents, `guessed`
## the same with that wave, for messages. `check_clash` = FALSE skips the
## error for several columns holding the same variable at the same wave.
##
## A column documented for several waves (e.g. blphya01, every cohort's
## baseline) is placed per respondent. In long data, values that are all on
## rows of those waves stay where they are. Otherwise each respondent's
## value goes to: the one of those waves the respondent has data at (rows
## in long data; values of columns with a single wave in wide data); else
## their cohort's baseline (.lasa_cohort_of_wave); else the wave the data's
## provenance gives the column; else the earliest wave (a guess).
.lasa_resolve_wide_columns <- function(data, skip, long_mode, wave_codes, resp, db_info, check_clash = TRUE) {
  waves_table <- .lasa_wave_table()
  all_waves <- waves_table$wave
  n_resp <- resp$n
  id <- .lasa_find_respnr(data)
  provenance <- .lasa_provenance(data)
  candidates_of <- .lasa_wave_candidates(db_info, provenance, long_mode)

  cands <- list()
  for (j in seq_along(data)) {
    name <- names(data)[[j]]
    if (name %in% skip) next
    cand <- candidates_of(name, data[[j]])
    if (is.null(cand)) next
    cand$position <- j
    cands[[name]] <- cand
  }

  # has_data[r, w]: respondent r has data at wave w. In long data: a row. In
  # wide data: a value in a column whose wave is certain.
  has_data <- matrix(FALSE, nrow = n_resp, ncol = length(all_waves), dimnames = list(NULL, all_waves))
  row_of <- NULL
  if (long_mode) {
    row_of <- matrix(NA_integer_, nrow = n_resp, ncol = length(all_waves), dimnames = list(NULL, all_waves))
    row_of[cbind(resp$r, match(wave_codes, all_waves))] <- seq_along(wave_codes)
    has_data <- !is.na(row_of)
  } else {
    for (cand in cands) {
      if (length(unique(cand$wave)) != 1L) next
      has_value <- !.lasa_is_na(data[[cand$position]])
      has_data[has_value, cand$wave[[1L]]] <- TRUE
    }
  }

  # Each respondent's cohort, as far as their waves show it (NA if not).
  cohort_of <- function(has_data) {
    baselines <- unname(.lasa_cohort_of_wave[all_waves])
    cohort <- rep(NA_character_, n_resp)
    count <- integer(n_resp)
    for (b in unique(baselines[!is.na(baselines)])) {
      has <- rowSums(has_data[, which(baselines == b), drop = FALSE]) > 0L
      cohort[has] <- b
      count <- count + has
    }
    cohort[count != 1L] <- NA_character_
    cohort
  }

  ## Each respondent's single value of long-data column `x`: the row it is
  ## on (the first, if repeated). A respondent's rows may not disagree.
  value_rows <- function(x, name, waves, has_value) {
    conflicts <- which(.lasa_distinct_values(resp$r, .lasa_value_key(x), n_resp) > 1L)
    if (length(conflicts) > 0L) {
      first_row <- .lasa_first_row(resp$r, n_resp)[[conflicts[[1L]]]]
      stop(
        "Column '", name, "' holds the values of wave ", paste(waves, collapse = "/"),
        ", but has different values on different rows of ", length(conflicts),
        " respondent(s) (e.g. ", id, " ", .lasa_text_key(data[[id]][first_row]), "); a ",
        "wave-specific column can hold only one value per respondent.",
        call. = FALSE
      )
    }
    .lasa_first_row(resp$r, n_resp, keep = has_value)
  }

  ## Places column `cand` (see the comment above): list(waves, sources,
  ## guessed_wave, guessed), `guessed` marking the respondents whose wave
  ## was guessed (as `guessed_wave`).
  place <- function(cand, has_data, cohort) {
    x <- data[[cand$position]]
    name <- names(data)[[cand$position]]
    waves <- unique(cand$wave)
    has_value <- !.lasa_is_na(x)
    nobody <- rep(FALSE, n_resp)
    single <- function(wave, rows) list(waves = wave, sources = list(rows), guessed_wave = NA_character_, guessed = nobody)

    if (length(waves) > 1L && !any(has_value)) {
      wave <- .lasa_provenance_wave(cand, provenance)
      return(single(if (is.na(wave)) waves[[1L]] else wave, rep(NA_integer_, n_resp)))
    }
    if (!long_mode && length(waves) == 1L) return(single(waves, seq_len(n_resp)))
    if (long_mode && length(waves) > 1L && all(wave_codes[has_value] %in% waves)) {
      # Already long: every value is on a row of one of the column's waves
      # (e.g. wave files of several cohorts' baselines, stacked with LASA's
      # own names), so each value belongs to its row's wave.
      observed <- waves[waves %in% wave_codes[has_value]]
      sources <- lapply(observed, function(w) row_of[, w])
      return(list(waves = observed, sources = sources, guessed_wave = NA_character_, guessed = nobody))
    }

    # One value per respondent: a wide column's, or one merged into long
    # data by respnr (and so repeated on the respondent's rows).
    rows <- if (long_mode) value_rows(x, name, waves, has_value) else ifelse(has_value, seq_len(n_resp), NA_integer_)
    if (length(waves) == 1L) {
      own <- row_of[, waves]
      own_has_value <- !is.na(own) & has_value[ifelse(is.na(own), 1L, own)]
      return(single(waves, ifelse(own_has_value, own, rows)))
    }

    holders <- !is.na(rows)
    assigned <- rep(NA_character_, n_resp)
    at <- has_data[, waves, drop = FALSE]
    one <- holders & rowSums(at) == 1L
    assigned[one] <- waves[max.col(at[one, , drop = FALSE], ties.method = "first")]
    by_cohort <- holders & is.na(assigned) & cohort %in% waves
    assigned[by_cohort] <- cohort[by_cohort]
    rest <- holders & is.na(assigned)
    guessed_wave <- NA_character_
    if (any(rest)) {
      wave <- .lasa_provenance_wave(cand, provenance)
      if (is.na(wave)) {
        wave <- waves[[1L]]
        guessed_wave <- wave
      }
      assigned[rest] <- wave
    }
    placed_waves <- waves[waves %in% assigned]
    sources <- lapply(placed_waves, function(w) ifelse(!is.na(assigned) & assigned == w, rows, NA_integer_))
    list(
      waves = placed_waves,
      sources = sources,
      guessed_wave = guessed_wave,
      guessed = if (is.na(guessed_wave)) nobody else rest
    )
  }

  cohort <- cohort_of(has_data)
  placed <- lapply(cands, place, has_data = has_data, cohort = cohort)

  # In wide data, the waves the other columns were placed at without
  # guessing (e.g. by the data's provenance) may tell where a guessed
  # column's values belong: place those again.
  guessed_any <- vapply(placed, function(p) !is.na(p$guessed_wave), logical(1))
  if (!long_mode && any(guessed_any)) {
    for (i in seq_along(placed)) {
      p <- placed[[i]]
      has_value <- !.lasa_is_na(data[[cands[[i]]$position]])
      for (k in seq_along(p$waves)) {
        known <- !is.na(p$sources[[k]]) & has_value & !p$guessed
        has_data[known, p$waves[[k]]] <- TRUE
      }
    }
    cohort <- cohort_of(has_data)
    placed[guessed_any] <- lapply(cands[guessed_any], place, has_data = has_data, cohort = cohort)
  }

  column <- character(0)
  stem <- character(0)
  wave <- character(0)
  position <- integer(0)
  original <- character(0)
  sources <- list()
  guessed <- character(0)
  guessed_columns <- character(0)
  for (i in seq_along(cands)) {
    name <- names(cands)[[i]]
    cand <- cands[[i]]
    p <- placed[[i]]
    if (!is.na(p$guessed_wave)) {
      guessed <- c(guessed, paste0(name, " (", p$guessed_wave, ")"))
      guessed_columns <- c(guessed_columns, name)
    }
    for (k in seq_along(p$waves)) {
      column <- c(column, name)
      stem <- c(stem, .lasa_candidate_stem(cand, p$waves[[k]], provenance))
      wave <- c(wave, p$waves[[k]])
      position <- c(position, cand$position)
      original <- c(original, if (length(p$waves) == 1L) name else NA_character_)
      sources[[length(sources) + 1L]] <- p$sources[[k]]
    }
  }
  spec <- data.frame(
    column = column, stem = stem, wave = wave, position = position, original = original,
    stringsAsFactors = FALSE
  )

  clash <- duplicated(spec[c("stem", "wave")]) | duplicated(spec[c("stem", "wave")], fromLast = TRUE)
  if (check_clash && any(clash)) {
    pairs <- unique(spec[clash, c("stem", "wave")])
    details <- vapply(seq_len(nrow(pairs)), function(i) {
      cols <- spec$column[spec$stem == pairs$stem[[i]] & spec$wave == pairs$wave[[i]]]
      paste0(pairs$stem[[i]], " at wave ", pairs$wave[[i]], " (", paste(cols, collapse = ", "), ")")
    }, character(1))
    stop(
      "Several columns hold the same variable for the same wave: ",
      paste(details, collapse = "; "), ". Keep one of each before transforming.",
      call. = FALSE
    )
  }
  list(spec = spec, sources = sources, guessed = guessed, guessed_columns = guessed_columns)
}

## Warns about columns kept as they are although they look like LASA
## variables measured at several waves: names a merge suffixed (.x/.y), so
## their wave is unknown, and -- in data that aren't long yet -- columns
## read_lasa_sav() gave a wave-stripped name.
.lasa_warn_unplaced <- function(data, columns, long_mode, db_info) {
  suffixed <- character(0)
  stripped <- character(0)
  for (name in columns) {
    lower <- tolower(name)
    base <- sub("(\\.x|\\.y|\\.\\.\\.[0-9]+)$", "", lower)
    if (!identical(base, lower) && (.lasa_has(db_info$wide_index, base) ||
      (!long_mode && .lasa_has(db_info$time_varying, base)))) {
      suffixed <- c(suffixed, name)
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
  invisible(NULL)
}

## Adds (or refreshes) the "Wave" and "Time" columns of long data and puts
## them right after `id`; `drop` names columns they replace.
.lasa_place_wave_time <- function(columns, id, wave_codes, drop = character(0)) {
  wave <- wave_codes
  attr(wave, "label") <- .lasa_wave_column_label
  time <- .lasa_wave_table()$time[match(wave_codes, .lasa_wave_table()$wave)]
  attr(time, "label") <- .lasa_time_column_label

  rest <- columns[setdiff(names(columns), c(id, "Wave", "Time", drop))]
  c(columns[id], list(Wave = wave, Time = time), rest)
}

## format = "long". Returns list(data, added): the long data, and which of
## its rows were added for values of wide columns (rows `data` didn't have,
## always FALSE for data that weren't long yet). `quiet` suppresses the
## message for data without any wave-specific columns.
.lasa_to_long <- function(data, db_info, quiet = FALSE) {
  id <- .lasa_find_respnr(data)
  waves_table <- .lasa_wave_table()

  wave_column <- .lasa_find_wave(data)
  wave_name <- wave_column$name
  wave_codes <- if (!is.null(wave_name)) .lasa_normalize_wave_codes(data[[wave_name]]) else NULL
  # A Z file read with standardize = TRUE has a placeholder "Wave" = "Z":
  # still wide data.
  long_mode <- !is.null(wave_name) &&
    !(nrow(data) > 0L && all(!is.na(wave_codes) & wave_codes == "Z"))
  if (long_mode) .lasa_check_wave_codes(wave_codes, wave_name)
  time_names <- .lasa_time_columns(data, long_mode, wave_codes)

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

  skip <- c(id, wave_name, wave_column$placeholders, time_names)
  found <- .lasa_resolve_wide_columns(data, skip, long_mode, wave_codes, resp, db_info)
  wide <- found$spec
  .lasa_warn_unplaced(data, setdiff(names(data), c(skip, wide$column)), long_mode, db_info)
  if (length(found$guessed) > 0L) {
    message(
      "transform_lasa_data(): the label database documents these columns' names for ",
      "several waves (LASA gives every cohort's baseline the same \"b\" names), and nothing ",
      "in 'data' says which one they hold for some respondents, so their values were placed ",
      "at the wave shown: ", paste(found$guessed, collapse = ", "), ". To avoid guessing, ",
      "transform each LASA file to long format before combining files (read_lasa_sav(), ",
      "with format_as_long = TRUE for Z files)."
    )
  }

  if (nrow(wide) == 0L) {
    if (long_mode) {
      columns <- .lasa_place_wave_time(as.list(data), id, wave_codes, drop = setdiff(skip, id))
      out <- .lasa_build_frame(columns, data)
      out <- .lasa_set_wave_attr(out, unique(wave_codes), long = TRUE, template = data)
      return(list(data = out, added = rep(FALSE, nrow(data))))
    }
    if (!quiet) {
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
      added = rep(FALSE, nrow(data))
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
  if (!long_mode) {
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

  n_resp <- resp$n
  wide_waves <- waves_table$wave[waves_table$wave %in% wide$wave]

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
  grid_order <- order(grid_r, match(grid_w, waves_table$wave))
  grid_r <- grid_r[grid_order]
  grid_w <- grid_w[grid_order]
  grid_waves <- waves_table$wave[waves_table$wave %in% grid_w]
  grid_wpos <- match(grid_w, grid_waves)

  # The row of `data` each result row comes from (NA for added rows), and
  # for wide data the respondent's (only) row.
  if (long_mode) {
    data_row <- match(paste(grid_r, grid_w, sep = "\r"), paste(resp$r, wave_codes, sep = "\r"))
  } else {
    data_row <- grid_r
  }
  respondent_row <- .lasa_first_row(resp$r, n_resp)

  fallback_stems <- character(0)
  lost_missing <- character(0)
  long_columns <- list()
  wide_sources <- list()
  for (stem in stems) {
    spec_rows <- which(wide$stem == stem)
    spec <- wide[spec_rows, , drop = FALSE]
    by_wave <- stats::setNames(vector("list", length(grid_waves)), grid_waves)
    for (k in seq_along(spec_rows)) {
      by_wave[[spec$wave[[k]]]] <- .lasa_slice(data[[spec$column[[k]]]], found$sources[[spec_rows[[k]]]])
    }
    originals <- by_wave[spec$wave[order(match(spec$wave, grid_waves))]]
    stacked <- .lasa_stack_columns(unname(by_wave), n_resp)
    attrs <- .lasa_long_attributes(originals)
    long_attributes <- .lasa_fallback_attributes(attrs$attributes, stacked$fallback)
    if (stacked$fallback) {
      fallback_stems <- c(fallback_stems, stem)
    } else if (attrs$user_missing_lost) {
      lost_missing <- c(lost_missing, stem)
    }
    values <- .lasa_set_attributes(stacked$values, long_attributes)
    wide_sources[[stem]] <- list(originals = originals, spec = spec)
    long_columns[[stem]] <- .lasa_slice(values, (grid_wpos - 1L) * n_resp + grid_r)
  }

  # A row the wide columns added but hold no value for (e.g. a wave of
  # another cohort) is dropped, unless the respondent has no value at any
  # wave: then all of its rows stay, so no respondent disappears.
  existing <- if (long_mode) !is.na(data_row) else rep(FALSE, length(grid_r))
  filled <- Reduce(`|`, lapply(long_columns, function(x) !.lasa_is_na(x)), existing)
  filled <- filled | !(tabulate(grid_r[filled], nbins = n_resp) > 0L)[grid_r]
  kept <- which(filled)
  long_columns <- lapply(long_columns, .lasa_slice, kept)
  grid_r <- grid_r[kept]
  grid_w <- grid_w[kept]
  data_row <- data_row[kept]

  # Assemble the result in the order of `data`'s columns, each variable's
  # long column where its first wide column was.
  result <- list()
  result[[id]] <- .lasa_slice(data[[id]], respondent_row[grid_r])
  first_position <- tapply(wide$position, wide$stem, min)
  for (j in seq_along(data)) {
    name <- names(data)[[j]]
    if (name %in% skip) next
    stem_here <- names(first_position)[first_position == j]
    if (length(stem_here) > 0L) {
      for (s in stem_here) if (!s %in% names(result)) result[[s]] <- long_columns[[s]]
      next
    }
    if (name %in% wide$column) next

    x <- data[[j]]
    if (!long_mode) {
      result[[name]] <- .lasa_slice(x, data_row)
      next
    }
    rows <- data_row
    added <- is.na(rows)
    if (any(added) && .lasa_has(db_info$stable, tolower(name))) {
      # A documented stable variable holds for every wave: fill added rows
      # from the respondent's (single) value.
      key <- .lasa_value_key(x)
      single <- .lasa_distinct_values(resp$r, key, n_resp) == 1L
      source_row <- .lasa_first_row(resp$r, n_resp, keep = !is.na(key))
      fill <- added & single[grid_r]
      rows[fill] <- source_row[grid_r[fill]]
    }
    values <- .lasa_slice(x, rows)
    if (name %in% names(long_columns)) {
      combined <- .lasa_coalesce_long(values, long_columns[[name]], name, data[[id]][respondent_row[grid_r]])
      if (combined$fallback) fallback_stems <- c(fallback_stems, name)
      if (combined$user_missing_lost) lost_missing <- c(lost_missing, name)
      values <- combined$values
    }
    result[[name]] <- values
  }

  # What each long column built from wide columns needs to give them back,
  # recorded against its final type and attributes.
  for (stem in stems) {
    attr(result[[stem]], "LASA_wide_columns") <- .lasa_wide_store(
      wide_sources[[stem]]$originals, wide_sources[[stem]]$spec, stem, result[[stem]]
    )
  }

  if (length(fallback_stems) > 0L) {
    warning(
      "The wave-specific columns of ", paste(unique(fallback_stems), collapse = ", "),
      " have types that don't combine (e.g. a factor at one wave and numbers at another), ",
      "so their long column holds text.",
      call. = FALSE
    )
  }
  if (length(lost_missing) > 0L) {
    warning(
      "The SPSS user-missing codes (na_values/na_range) of ", paste(unique(lost_missing), collapse = ", "),
      " differ between waves in a way no single definition can represent, so their long ",
      "column has none: codes missing at one wave are regular values there. Converting ",
      "back to wide format restores each wave's own.",
      call. = FALSE
    )
  }

  result <- .lasa_place_wave_time(result, id, grid_w)
  out <- .lasa_build_frame(result, data)
  out <- .lasa_set_wave_attr(out, waves_table$wave[waves_table$wave %in% grid_w], long = TRUE, template = data)
  list(data = out, added = if (long_mode) is.na(data_row) else rep(FALSE, length(data_row)))
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
## (`originals`, named by wave) back exactly: its name and position, which
## waves had no value at all (their rows don't make it into long format),
## and -- only for waves where they differ from what the long column itself
## implies for that wave -- its type and attributes.
.lasa_wide_store <- function(originals, spec, stem, long) {
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
    names = stats::setNames(spec$original[match(waves, spec$wave)], waves),
    positions = stats::setNames(spec$position[match(waves, spec$wave)], waves),
    empty = waves[vapply(originals, function(x) all(.lasa_is_na(x)), logical(1))],
    changes = changes
  )
}

## Combines a long column already in long data with the values the same
## variable's wide columns contribute, row by row; both holding different
## values for the same row is an error. Returns list(values, fallback,
## user_missing_lost) as for the long columns built from wide columns.
.lasa_coalesce_long <- function(existing, pivoted, name, respondents) {
  n <- length(existing)
  stacked <- .lasa_stack_columns(list(existing, pivoted), n)
  values <- stacked$values
  key <- .lasa_value_key(values)
  existing_key <- key[seq_len(n)]
  pivoted_key <- key[n + seq_len(n)]
  conflict <- !is.na(existing_key) & !is.na(pivoted_key) & existing_key != pivoted_key
  if (any(conflict)) {
    stop(
      "Column '", name, "' and the wave-specific columns of the same variable hold different ",
      "values for ", sum(conflict), " row(s) (e.g. respondent ",
      .lasa_text_key(respondents[which(conflict)[[1L]]]), ").",
      call. = FALSE
    )
  }
  combined <- .lasa_long_attributes(list(existing = existing, pivoted = pivoted))
  attrs <- .lasa_fallback_attributes(combined$attributes, stacked$fallback)
  attrs$wave_label <- attr(pivoted, "wave_label", exact = TRUE) %||% attr(existing, "wave_label", exact = TRUE)
  attrs$labels_wave <- attr(pivoted, "labels_wave", exact = TRUE) %||% attr(existing, "labels_wave", exact = TRUE)
  values <- .lasa_set_attributes(values, attrs[!vapply(attrs, is.null, logical(1))])
  pick <- ifelse(is.na(existing_key), n + seq_len(n), seq_len(n))
  list(
    values = .lasa_slice(values, pick),
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

## Text values of a long column that fell back to text, read back as the
## kind `kind` of one wave's original column (numbers, TRUE/FALSE, dates),
## or NULL if they don't all read as such.
.lasa_parse_text <- function(text, kind) {
  given <- !is.na(text)
  parsed <- switch(kind,
    logical = as.logical(text),
    integer = ,
    double = ,
    labelled_integer = ,
    labelled_double = suppressWarnings(as.numeric(text)),
    Date = .lasa_bare(as.Date(text, optional = TRUE)),
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
  if (identical(kind_now, "character") && kind %in% c(numeric_kinds, "Date")) {
    # The long column fell back to text (see .lasa_stack_columns()).
    values <- .lasa_parse_text(values, kind)
    if (is.null(values)) return(NULL)
    kind_now <- if (identical(kind, "Date")) "Date" else "double"
  }
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

## The attributes `a` of a long column as a wide column built from it
## without a usable store entry gets them: without the store, and with
## "wave_label"/"labels_wave" narrowed to `wave` where they hold one entry
## per wave.
.lasa_generic_wide_attributes <- function(a, wave, single_wave) {
  a[["LASA_wide_columns"]] <- NULL
  wave_label <- a[["wave_label"]]
  if (!is.null(wave_label)) {
    per_wave <- !is.null(names(wave_label)) && all(names(wave_label) %in% .lasa_wave_table()$wave)
    a[["wave_label"]] <- if (per_wave) {
      if (wave %in% names(wave_label)) wave_label[[wave]] else NULL
    } else if (single_wave) {
      wave_label
    } else {
      NULL
    }
  }
  labels_wave <- a[["labels_wave"]]
  if (!is.null(labels_wave)) {
    a[["labels_wave"]] <- if (is.list(labels_wave)) {
      labels_wave[[wave]]
    } else if (single_wave) {
      labels_wave
    } else {
      NULL
    }
  }
  a
}

## A wide column built from long column values `v` without a usable store
## entry (see .lasa_generic_wide_attributes()).
.lasa_generic_wide_column <- function(v, wave, single_wave) {
  attributes(v) <- .lasa_generic_wide_attributes(attributes(v), wave, single_wave)
  v
}

## format = "wide", from long data (`long` always has a "Wave" column).
## `added` marks rows .lasa_to_long() added for values of wide columns
## (NULL if none): columns that aren't wave-specific were never measured
## there, so such rows don't count against their being stable.
.lasa_to_wide <- function(long, prefix, db_info, added = NULL) {
  id <- .lasa_find_respnr(long)
  waves_table <- .lasa_wave_table()
  wave_codes <- .lasa_normalize_wave_codes(long[["Wave"]])
  resp <- .lasa_respondents(long[[id]], id)
  n_resp <- resp$n
  present_waves <- waves_table$wave[waves_table$wave %in% wave_codes]
  single_wave <- length(present_waves) == 1L
  measured <- if (is.null(added)) rep(TRUE, nrow(long)) else !added

  # cell[r, w]: the row of respondent r at present wave w (NA if none).
  cell <- matrix(NA_integer_, nrow = n_resp, ncol = length(present_waves))
  cell[cbind(resp$r, match(wave_codes, present_waves))] <- seq_len(nrow(long))
  respondent_row <- .lasa_first_row(resp$r, n_resp)
  measured_row <- .lasa_first_row(resp$r, n_resp, keep = measured)
  measured_row[is.na(measured_row)] <- respondent_row[is.na(measured_row)]

  stable <- list()
  varying <- character(0)
  inconsistent_stable <- character(0)
  for (name in setdiff(names(long), c(id, "Wave", "Time"))) {
    x <- long[[name]]
    lower <- tolower(name)
    canonical_attr <- attr(x, "canonical_name", exact = TRUE)
    canonical_attr <- if (is.character(canonical_attr) && length(canonical_attr) == 1L) tolower(canonical_attr) else NA_character_

    documented_varying <- !is.null(attr(x, "LASA_wide_columns", exact = TRUE)) ||
      .lasa_has(db_info$time_varying, lower) || .lasa_has(db_info$time_varying, canonical_attr)
    if (documented_varying) {
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

  # The waves each long column had as wide columns, if it came from wide
  # data. A wave without rows in `long` is still given its (all missing)
  # wide column back when no respondent had a value there -- such a wave
  # leaves no rows in long format -- but not when waves with values are
  # gone too: then rows were filtered out on purpose.
  stores <- lapply(stats::setNames(varying, varying), function(name) {
    store <- attr(long[[name]], "LASA_wide_columns", exact = TRUE)
    if (is.list(store)) store else NULL
  })
  store_waves <- lapply(stores, function(store) {
    if (is.null(store)) return(character(0))
    waves <- intersect(names(store$names), waves_table$wave)
    gone <- setdiff(waves, present_waves)
    if (length(gone) > 0L && !all(gone %in% store$empty)) waves <- setdiff(waves, gone)
    waves
  })
  output_waves <- waves_table$wave[waves_table$wave %in% c(present_waves, unlist(store_waves))]

  wide_columns <- list()
  wide_names <- character(0)
  wide_stems <- character(0)
  wide_waves <- character(0)
  order_position <- numeric(0)
  order_wave <- integer(0)
  order_variable <- integer(0)
  for (v_index in seq_along(varying)) {
    name <- varying[[v_index]]
    x <- long[[name]]
    store <- stores[[name]]
    # The original wide names only apply while the long column keeps its
    # name, and its type only while the long column keeps its kind.
    original_names <- if (!is.null(store) && identical(store$long_name, name)) store$names else NULL
    store_usable <- !is.null(store) && identical(store$kind, .lasa_column_kind(x))
    column_waves <- waves_table$wave[waves_table$wave %in% c(present_waves, store_waves[[name]])]

    for (wave in column_waves) {
      w_index <- match(wave, present_waves)
      v <- .lasa_slice(x, if (is.na(w_index)) rep(NA_integer_, n_resp) else cell[, w_index])
      in_store <- wave %in% store_waves[[name]]
      if (!in_store && all(.lasa_is_na(v))) next

      column <- .lasa_generic_wide_column(v, wave, single_wave)
      if (store_usable && in_store) {
        column <- .lasa_restore_wide_column(column, store$changes[[wave]], store$kind)$column
      }

      time <- waves_table$time[match(wave, waves_table$wave)]
      if (identical(prefix, "Time") && is.na(time)) {
        stop(
          "Wave ", wave, " has no Time number yet; use prefix = \"Wave\" instead.",
          call. = FALSE
        )
      }
      time_name <- paste0("t", time, "_", name)
      original_name <- if (wave %in% names(original_names)) unname(original_names[[wave]]) else NA_character_
      new_name <- if (identical(prefix, "Time")) {
        time_name
      } else if (!is.na(original_name) && !identical(original_name, time_name)) {
        # The column's name in the wide data it came from -- unless that
        # was the Time-prefixed name prefix = "Time" made.
        original_name
      } else {
        paste0(waves_table$prefix[match(wave, waves_table$wave)], name)
      }

      wide_columns[[length(wide_columns) + 1L]] <- column
      wide_names <- c(wide_names, new_name)
      wide_stems <- c(wide_stems, name)
      wide_waves <- c(wide_waves, wave)
      order_position <- c(order_position, if (in_store) unname(store$positions[[wave]]) else NA_real_)
      order_wave <- c(order_wave, match(wave, waves_table$wave))
      order_variable <- c(order_variable, v_index)
    }
  }

  # Columns that came from a wide file keep their original order; the rest
  # follow, wave by wave.
  wide_order <- order(is.na(order_position), order_position, order_wave, order_variable)
  wide_columns <- stats::setNames(wide_columns[wide_order], wide_names[wide_order])
  wide_stems <- wide_stems[wide_order]
  wide_waves <- wide_waves[wide_order]

  result <- c(stats::setNames(list(.lasa_slice(long[[id]], respondent_row)), id), stable, wide_columns)
  duplicated_names <- unique(names(result)[duplicated(names(result))])
  if (length(duplicated_names) > 0L) {
    stop(
      "Wide format would have duplicated column names: ", paste(duplicated_names, collapse = ", "),
      ". Rename the long column(s) involved first.",
      call. = FALSE
    )
  }

  # Transforming the result back must find each wide column's wave and
  # variable. Where its name and the data alone wouldn't (a name the label
  # database doesn't document, a "b" name of several cohorts that nothing
  # places, a guess), the column says so itself: attributes "LASA_wave" and
  # "LASA_long_name".
  out <- .lasa_set_wave_attr(.lasa_build_frame(result, long), output_waves, long = FALSE, template = long)
  back <- .lasa_resolve_wide_columns(
    out, skip = id, long_mode = FALSE, wave_codes = NULL,
    resp = .lasa_respondents(out[[id]], id), db_info = db_info, check_clash = FALSE
  )
  for (k in seq_along(wide_columns)) {
    name <- names(wide_columns)[[k]]
    found <- back$spec[back$spec$column == name, , drop = FALSE]
    placed <- nrow(found) == 1L && identical(found$stem, wide_stems[[k]]) &&
      identical(found$wave, wide_waves[[k]]) && !name %in% back$guessed_columns
    if (!placed) {
      attr(result[[name]], "LASA_wave") <- wide_waves[[k]]
      attr(result[[name]], "LASA_long_name") <- wide_stems[[k]]
    }
  }
  .lasa_set_wave_attr(.lasa_build_frame(result, long), output_waves, long = FALSE, template = long)
}
