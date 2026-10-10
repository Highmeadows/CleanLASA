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
# (`.lasa_resolve_wide_columns()`):
#   1. the "LASA_wave"/"LASA_long_name" attributes transform_lasa_data()
#      attaches to the wide columns it creates whose name alone wouldn't
#      identify them;
#   2. lasa_label_db(): a documented wave-specific variable name (its
#      `variable_name` differs from its `canonical_name`), which also covers
#      LASA's irregular names (t2_dat, b_DM, b2oak, ...);
#   3. for wide data only (no "Wave" column, or a Z file's "Z"
#      placeholder): the naming pattern transform_lasa_data() uses for
#      wide columns (wave prefix + canonical name, or t<Time>_ + canonical
#      name), when the label database documents that canonical name for
#      that wave.
# Everything else is "stable" (one value per respondent).
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
#'   [read_lasa_sav()], or several LASA files merged together.
#' @param format `"long"` (the default) or `"wide"`: the format to transform
#'   `data` into.
#' @param prefix `"Wave"` (the default) or `"Time"`: what the names of
#'   wave-specific columns start with in wide format. Only used when
#'   `format = "wide"`; see Details.
#'
#' @details
#' **Long format** has one row per respondent per wave, with a `"Wave"`
#' column (the LASA wave code, e.g. `"B"`, `"2B"`, `"MB"`) and a `"Time"`
#' column right after `respnr`. `"Time"` numbers the waves in calendar
#' order: A (LSN) = 0, B = 1, C = 2, D = 3, E = 4, 2B = 5, F = 6, G = 7,
#' H = 8, 3B = 9, MB = 10, I = 11, J = 12, K = 13. Each wave-specific
#' variable becomes one column named after its wave-stripped (canonical)
#' name, so `boak`, `coak`, ... become `oak`. A respondent gets a row for
#' each wave at which at least one of the wave-specific columns has a
#' value for them -- anything but `NA`, so a missing-value code that is
#' kept as a value (e.g. "dropout") counts -- and respondents of a later
#' cohort therefore get no rows for the waves before they joined LASA. A
#' respondent without any value at any wave keeps a row for every wave,
#' so nobody disappears.
#'
#' **Stable variables** -- columns that hold for every wave, such as sex or
#' date of birth in `LASAZ004.SAV` -- keep one column and are repeated on
#' each of the respondent's rows.
#'
#' **Which columns are wave-specific** is decided per column: a column made
#' wide by `transform_lasa_data()` itself is recognized from attributes it
#' carries; any other column is wave-specific when [lasa_label_db()]
#' documents its name as a wave-specific variable -- which covers LASA's
#' irregular names too, such as `t2_dat` (`t_dat`, wave B), `b_dm`
#' (`dm`) or `b2oak` (`oak`, wave 2B) -- or, for data that aren't long
#' yet (no `"Wave"` column, or only the `"Z"` placeholder [read_lasa_sav()]
#' gives a Z file), when its name is a wave prefix followed by a variable
#' the label database documents for that wave (the names wide format uses,
#' see below). All other columns are treated as stable, including columns
#' the label database doesn't know.
#'
#' **Merged files.** `data` may be several LASA files merged together, in
#' any of three shapes:
#' * wide, e.g. `LASAB046.SAV`, `LASAC046.SAV`, `LASAB030.SAV`, ... read
#'   with `standardize = FALSE` and merged by `respnr`, or a Z file merged
#'   with `LASAZ004.SAV`;
#' * long, e.g. the same files read with the default `standardize = TRUE`,
#'   stacked with [rbind()] per file code and merged by `respnr` and
#'   `"Wave"`;
#' * a mix: long data that wide columns were merged into by `respnr`, for
#'   example a Z file's. `format = "long"` moves each wide column's values
#'   to its wave's row, adding a row where a respondent has a value at a
#'   wave the long data don't have a row for yet. On those added rows,
#'   stable variables the label database documents (such as `sex`) are
#'   filled in from the respondent's other rows, and other columns are
#'   left missing, since they weren't measured at that wave.
#'
#' **Wide format** has one row per respondent and drops the `"Wave"` and
#' `"Time"` columns. Each wave-specific variable gets one column per wave
#' at which it has any non-missing value, and a long column made from wide
#' columns gets all of those columns back, also ones without any value.
#' With `prefix = "Wave"`, a column's name is its wave's lowercase LASA
#' prefix followed by the variable name: `boak`, `coak`, `doak`, ... Waves
#' 2B, 3B, 4B, and MB get the prefixes `b2`, `b3`, `b4`, and `mb` (as
#' LASA's own `zoa2`/`zoa3` files do for 2B and 3B), so they don't collide
#' with wave B's columns. A column that came from a wide LASA file gets
#' its original name back (e.g. `t2_dat` rather than `bt_dat`). With
#' `prefix = "Time"`, names are `t`, the wave's `"Time"` number, and an
#' underscore followed by the variable name: `t1_oak`, `t2_oak`, ... A
#' column stays stable in wide format when it has a single value per
#' respondent and isn't a documented wave-specific variable; a documented
#' stable variable (such as `sex`) only needs to agree across the rows
#' where it isn't missing.
#'
#' **Labels** travel with the data. A long column gets the variable and
#' value labels its wave-specific columns share (or their harmonized,
#' cross-wave versions where they differ), and keeps each wave's own
#' `"wave_label"`/`"labels_wave"` as one entry per wave. Factor levels are
#' combined across waves. Converting back to wide restores each wide
#' column's original name, type, and attributes, as long as its values
#' still fit them.
#'
#' LASA's own wave files name the baseline of every cohort (B, 2B, 3B, MB)
#' with the same `b` prefix. When the data don't say which cohort a
#' `b`-prefixed column belongs to -- no `"Wave"` column, no
#' `"LASA_wave"` provenance attribute, and a name the label database
#' documents for several cohorts -- it is read as wave B.
#'
#' @return `data` in the requested format, as a data frame (or a tibble if
#'   `data` is one), keeping `data`'s provenance attributes. Its
#'   `"LASA_wave"` attribute is updated to the data's single wave if there
#'   is only one, removed from long data that span several waves, and
#'   `"Z"` for wide data that span several waves (as for a Z file).
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
    return(.lasa_to_long(data, db_info))
  }

  # Wide output always goes through long format first, so wide columns of
  # any origin (and any already-long rows they were merged into) are
  # combined before being spread out again under one naming convention.
  long <- .lasa_to_long(data, db_info, quiet = TRUE)
  if (!"Wave" %in% names(long)) {
    # No wave dimension at all (e.g. LASAZ004.SAV): already wide.
    return(long)
  }
  .lasa_to_wide(long, prefix, db_info)
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

## Everything transform_lasa_data() needs from lasa_label_db(), computed
## once per call. All names lowercase.
##   wide_rows      documented wave-specific names (variable_name differs
##                  from canonical_name): vn, cn, fc (normalized file code),
##                  wave; `wide_index` splits its row numbers by vn.
##   documented     every documented name, wave-specific or canonical.
##   canonical      every canonical name.
##   canonical_wave "<canonical>\r<wave>" for every documented pair.
##   time_varying   canonical names of wave-specific variables.
##   stable         canonical names only ever documented as Z/MB-file
##                  variables without a wave prefix (sex, byear, aedu, ...).
.lasa_transform_db_info <- function() {
  db <- .lasa_load_label_db()
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

  list(
    wide_rows = wide_rows,
    wide_index = split(seq_len(nrow(wide_rows)), wide_rows$vn),
    documented = unique(c(vn, cn, override_names)),
    canonical = unique(cn),
    canonical_wave = unique(paste(cn, wave, sep = "\r")),
    time_varying = time_varying,
    stable = setdiff(unique(cn[z_stable]), time_varying)
  )
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

## Wave codes as uppercase text, whatever the "Wave" column's type.
.lasa_normalize_wave_codes <- function(x) {
  if (is.factor(x)) x <- as.character(x)
  x <- as.character(unclass(x))
  attributes(x) <- NULL
  toupper(trimws(x))
}

## Checks the wave codes of long data, which must all be real LASA waves.
.lasa_check_wave_codes <- function(codes) {
  if (anyNA(codes) || any(!nzchar(codes))) {
    stop("The 'Wave' column has missing values; every row of long data needs a wave.", call. = FALSE)
  }
  known <- .lasa_wave_table()$wave
  if ("Z" %in% codes) {
    stop(
      "The 'Wave' column mixes \"Z\" (a Z file's placeholder) with real waves. ",
      "Transform the Z file to long format first, then combine it with the other data.",
      call. = FALSE
    )
  }
  unknown <- setdiff(unique(codes), known)
  if (length(unknown) > 0L) {
    stop(
      "Unknown LASA wave code(s) in the 'Wave' column: ", paste(unknown, collapse = ", "),
      ". Expected one of ", paste(known, collapse = ", "), ".",
      call. = FALSE
    )
  }
  invisible(codes)
}

## A comparable text key per element (NA stays NA), used to test whether
## values are equal regardless of type: factor level text, exact doubles.
.lasa_value_key <- function(x) {
  if (is.factor(x)) return(as.character(x))
  v <- unclass(x)
  attributes(v) <- NULL
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

## Number of distinct non-missing values each respondent 1..n has in `key`.
.lasa_distinct_values <- function(r, key, n) {
  ok <- !is.na(key)
  pairs <- !duplicated(paste(r[ok], key[ok], sep = "\r"))
  tabulate(r[ok][pairs], nbins = n)
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
  bare <- function(x) {
    x <- unclass(x)
    attributes(x) <- NULL
    x
  }

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
      if (is.factor(x) || is.object(x)) as.character(x) else as.character(bare(x))
    })),
    logical = as.logical(unlist(lapply(columns, bare))),
    integer = as.integer(unlist(lapply(columns, bare))),
    double = as.double(unlist(lapply(columns, bare))),
    labelled_integer = ,
    labelled_double = ,
    labelled_character = {
      base <- switch(kind,
        labelled_integer = as.integer,
        labelled_double = as.double,
        labelled_character = as.character
      )
      labelled <- columns[startsWith(kinds, "labelled_")]
      spss <- Filter(function(x) inherits(x, "haven_labelled_spss"), labelled)
      class_template <- if (length(spss) > 0L) spss[[1L]] else labelled[[1L]]
      structure(base(unlist(lapply(columns, bare))), class = class(class_template))
    },
    Date = structure(as.double(unlist(lapply(columns, bare))), class = "Date"),
    POSIXct = .POSIXct(as.double(unlist(lapply(columns, bare))), tz = attr(first, "tzone", exact = TRUE)),
    other = {
      same_class <- length(unique(lapply(columns[informative], class))) == 1L
      same_structure <- length(unique(lapply(columns[informative], function(x) {
        attributes(x)[intersect(names(attributes(x)), c("class", "units", "tzone"))]
      }))) == 1L
      if (same_class && same_structure) {
        out <- unlist(lapply(columns, bare))
        structure_attrs <- attributes(first)[intersect(names(attributes(first)), c("class", "units", "tzone"))]
        attributes(out) <- structure_attrs
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
  code_key <- .lasa_value_key(codes)
  pairs <- !duplicated(paste(code_key, texts, sep = "\r"))
  if (anyDuplicated(code_key[pairs]) > 0L) return(harmonized)
  keep <- !duplicated(code_key)
  stats::setNames(codes[keep], texts[keep])
}

## The attributes (other than structural ones) of a long column built from
## the wide `columns` (a list named by wave): what all waves share, the
## harmonized version where they differ, and "wave_label"/"labels_wave"
## as one entry per wave.
.lasa_long_attributes <- function(columns) {
  per_wave <- lapply(columns, function(x) {
    a <- attributes(x)
    a[setdiff(names(a), c(.lasa_structural_attrs, .lasa_transform_attrs))]
  })
  first_of <- function(name) {
    for (a in per_wave) if (!is.null(a[[name]])) return(a[[name]])
    NULL
  }

  out <- list()
  for (nm in unique(unlist(lapply(per_wave, names)))) {
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
      na_values = sort(unique(unlist(values))),
      values[[1L]]
    )
    if (!is.null(merged)) out[[nm]] <- merged
  }
  out
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

## Returns a function(name, x) telling whether column `x`, named `name`, is
## a wave-specific (wide) column: list(stem, wave) if so (`stem` being its
## long-format name), NULL if not. `file_code`/`data_wave` are the data's
## "LASA_file_code"/"LASA_wave" provenance (or NULL); in long data
## (`long_mode`), `wave_codes` holds each row's wave.
.lasa_column_resolver <- function(db_info, file_code, data_wave, long_mode, wave_codes = NULL) {
  waves_table <- .lasa_wave_table()
  is_scalar_text <- function(x) is.character(x) && length(x) == 1L && !is.na(x) && nzchar(x)
  file_code <- if (is_scalar_text(file_code)) .lasa_normalize_filecode(file_code) else NULL
  data_wave <- if (is_scalar_text(data_wave)) toupper(data_wave) else NULL

  ## Picks one wave from several documented for the same name (LASA names
  ## the baseline of every cohort with the same "b" prefix).
  choose_wave <- function(waves, x) {
    if (long_mode) {
      observed <- unique(wave_codes[!.lasa_is_na(x)])
      if (length(observed) == 1L && observed %in% waves) return(observed)
    }
    if (!is.null(data_wave) && data_wave %in% waves) return(data_wave)
    waves[order(match(waves, waves_table$wave))][[1L]]
  }

  ## Wave prefix (or t<Time>_) followed by a canonical name documented for
  ## that wave: the names .lasa_to_wide() gives columns without an
  ## original LASA name.
  match_pattern <- function(name) {
    time_match <- regmatches(name, regexec("^t([0-9]+)_(.+)$", name))[[1L]]
    if (length(time_match) == 3L) {
      wave <- waves_table$wave[which(waves_table$time == as.integer(time_match[[2L]]))]
      if (length(wave) == 1L && paste(time_match[[3L]], wave, sep = "\r") %in% db_info$canonical_wave) {
        return(list(stem = time_match[[3L]], wave = wave))
      }
    }
    for (i in order(-nchar(waves_table$prefix))) {
      p <- waves_table$prefix[[i]]
      if (!startsWith(name, p)) next
      stem <- substring(name, nchar(p) + 1L)
      if (nzchar(stem) && paste(stem, waves_table$wave[[i]], sep = "\r") %in% db_info$canonical_wave) {
        return(list(stem = stem, wave = waves_table$wave[[i]]))
      }
    }
    NULL
  }

  function(name, x) {
    # 1. A wide column transform_lasa_data() made itself.
    own_wave <- attr(x, "LASA_wave", exact = TRUE)
    own_name <- attr(x, "LASA_long_name", exact = TRUE)
    if (is_scalar_text(own_wave) && toupper(own_wave) %in% waves_table$wave && is_scalar_text(own_name)) {
      return(list(stem = own_name, wave = toupper(own_wave)))
    }

    lower <- tolower(name)
    canonical_attr <- attr(x, "canonical_name", exact = TRUE)
    canonical_attr <- if (is_scalar_text(canonical_attr)) tolower(canonical_attr) else NA_character_

    # In long data, a canonical name is a long column -- even where it
    # happens to equal another wave's prefixed name (e.g. "immse01").
    if (long_mode && (lower %in% db_info$canonical || identical(canonical_attr, lower))) return(NULL)

    # 2. A documented wave-specific name.
    rows <- db_info$wide_index[[lower]]
    if (!is.null(rows)) {
      candidates <- db_info$wide_rows[rows, , drop = FALSE]
      if (!is.na(canonical_attr) && any(candidates$cn == canonical_attr)) {
        candidates <- candidates[candidates$cn == canonical_attr, , drop = FALSE]
      }
      if (!is.null(file_code) && any(candidates$fc == file_code)) {
        candidates <- candidates[candidates$fc == file_code, , drop = FALSE]
      }
      wave <- choose_wave(unique(candidates$wave), x)
      return(list(stem = candidates$cn[candidates$wave == wave][[1L]], wave = wave))
    }
    if (lower %in% db_info$documented) return(NULL)

    # 3. transform_lasa_data()'s own wide naming, in wide data only.
    if (!long_mode) return(match_pattern(lower))
    NULL
  }
}

## Decides which columns of `data` are wave-specific (wide) columns.
## Returns a data frame with one row per wide column: `column`, `stem` (its
## long-format name), `wave`, and `position` (its index in `data`).
.lasa_resolve_wide_columns <- function(data, skip, long_mode, wave_codes, db_info) {
  resolve <- .lasa_column_resolver(
    db_info,
    file_code = attr(data, "LASA_file_code", exact = TRUE),
    data_wave = attr(data, "LASA_wave", exact = TRUE),
    long_mode = long_mode,
    wave_codes = wave_codes
  )

  found <- list()
  for (j in seq_along(data)) {
    name <- names(data)[[j]]
    if (name %in% skip) next
    hit <- resolve(name, data[[j]])
    if (is.null(hit)) next
    found[[length(found) + 1L]] <- data.frame(
      column = name, stem = hit$stem, wave = hit$wave, position = j,
      stringsAsFactors = FALSE
    )
  }

  if (length(found) == 0L) {
    return(data.frame(
      column = character(0), stem = character(0), wave = character(0),
      position = integer(0), stringsAsFactors = FALSE
    ))
  }
  out <- do.call(rbind, found)

  clash <- duplicated(out[c("stem", "wave")]) | duplicated(out[c("stem", "wave")], fromLast = TRUE)
  if (any(clash)) {
    pairs <- unique(out[clash, c("stem", "wave")])
    details <- vapply(seq_len(nrow(pairs)), function(i) {
      cols <- out$column[out$stem == pairs$stem[[i]] & out$wave == pairs$wave[[i]]]
      paste0(pairs$stem[[i]], " at wave ", pairs$wave[[i]], " (", paste(cols, collapse = ", "), ")")
    }, character(1))
    stop(
      "Several columns hold the same variable for the same wave: ",
      paste(details, collapse = "; "), ". Keep one of each before transforming.",
      call. = FALSE
    )
  }
  out
}

## Adds (or refreshes) the "Wave" and "Time" columns of long data and puts
## them right after `id`.
.lasa_place_wave_time <- function(columns, id, wave_codes) {
  wave <- wave_codes
  attr(wave, "label") <- .lasa_wave_column_label
  time <- .lasa_wave_table()$time[match(wave_codes, .lasa_wave_table()$wave)]
  attr(time, "label") <- .lasa_time_column_label

  rest <- columns[setdiff(names(columns), c(id, "Wave", "Time"))]
  c(columns[id], list(Wave = wave, Time = time), rest)
}

## format = "long". `quiet` suppresses the message for data without any
## wave-specific columns.
.lasa_to_long <- function(data, db_info, quiet = FALSE) {
  id <- .lasa_find_respnr(data)
  waves_table <- .lasa_wave_table()

  has_wave <- "Wave" %in% names(data)
  wave_codes <- if (has_wave) .lasa_normalize_wave_codes(data[["Wave"]]) else NULL
  # A Z file read with standardize = TRUE has a placeholder "Wave" = "Z":
  # still wide data.
  long_mode <- has_wave && !(nrow(data) > 0L && all(!is.na(wave_codes) & wave_codes == "Z"))
  if (long_mode) .lasa_check_wave_codes(wave_codes)
  if (!long_mode && "Time" %in% names(data)) {
    stop(
      "'data' has no wave dimension yet but already has a 'Time' column; long format ",
      "constructs its own 'Time' column, so rename or drop it first.",
      call. = FALSE
    )
  }

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
      "The respondent identifier column '", id, "' has duplicated values; wide data need ",
      "one row per respondent.",
      call. = FALSE
    )
  }

  skip <- c(id, "Wave", "Time")
  wide <- .lasa_resolve_wide_columns(data, skip, long_mode, wave_codes, db_info)

  if (nrow(wide) == 0L) {
    if (long_mode) {
      columns <- .lasa_place_wave_time(as.list(data), id, wave_codes)
      out <- .lasa_build_frame(columns, data)
      return(.lasa_set_wave_attr(out, unique(wave_codes), long = TRUE, template = data))
    }
    if (!quiet) {
      message(
        "transform_lasa_data(): no wave-specific columns found in 'data', so it has no ",
        "wave dimension; returned with one row per respondent."
      )
    }
    columns <- as.list(data)
    columns[["Wave"]] <- NULL
    out <- .lasa_build_frame(columns, data)
    return(.lasa_set_wave_attr(out, character(0), long = TRUE, template = data))
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
        paste(wide$column[wide$stem %in% clashing], collapse = ", "),
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

  ## The value of wide column `x` for each respondent: in wide data its own
  ## row; in long data the row of the column's own wave if that has a
  ## value, otherwise the respondent's (single) value on any row.
  respondent_values <- function(x, column, wave) {
    if (!long_mode) return(x)
    key <- .lasa_value_key(x)
    conflicts <- which(.lasa_distinct_values(resp$r, key, n_resp) > 1L)
    if (length(conflicts) > 0L) {
      stop(
        "Column '", column, "' holds wave ", wave, " values, but has different values ",
        "on different rows of ", length(conflicts), " respondent(s) (e.g. ", id, " ",
        .lasa_value_key(data[[id]][respondent_row[[conflicts[[1L]]]]]), "); a wave-specific ",
        "column can hold only one value per respondent.",
        call. = FALSE
      )
    }
    rows <- .lasa_first_row(resp$r, n_resp, keep = !is.na(key) & wave_codes == wave)
    any_row <- .lasa_first_row(resp$r, n_resp, keep = !is.na(key))
    rows[is.na(rows)] <- any_row[is.na(rows)]
    .lasa_slice(x, rows)
  }

  fallback_stems <- character(0)
  long_columns <- list()
  for (stem in stems) {
    spec <- wide[wide$stem == stem, , drop = FALSE]
    by_wave <- stats::setNames(vector("list", length(grid_waves)), grid_waves)
    for (k in seq_len(nrow(spec))) {
      by_wave[[spec$wave[[k]]]] <- respondent_values(data[[spec$column[[k]]]], spec$column[[k]], spec$wave[[k]])
    }
    originals <- by_wave[spec$wave[order(match(spec$wave, grid_waves))]]
    stacked <- .lasa_stack_columns(unname(by_wave), n_resp)
    if (stacked$fallback) fallback_stems <- c(fallback_stems, stem)
    values <- .lasa_set_attributes(stacked$values, .lasa_long_attributes(originals))
    attr(values, "LASA_wide_columns") <- .lasa_wide_store(originals, spec, stem, values)
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
    if (length(stem_here) == 1L) {
      if (!stem_here %in% names(result)) result[[stem_here]] <- long_columns[[stem_here]]
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
    if (any(added) && (tolower(name) %in% db_info$stable)) {
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
      values <- .lasa_coalesce_long(values, long_columns[[name]], name, data[[id]][respondent_row[grid_r]])
    }
    result[[name]] <- values
  }

  if (length(fallback_stems) > 0L) {
    warning(
      "The wave-specific columns of ", paste(fallback_stems, collapse = ", "),
      " have types that don't combine (e.g. a factor at one wave and numbers at another), ",
      "so their long column holds text.",
      call. = FALSE
    )
  }

  result <- .lasa_place_wave_time(result, id, grid_w)
  out <- .lasa_build_frame(result, data)
  .lasa_set_wave_attr(out, waves_table$wave[waves_table$wave %in% grid_w], long = TRUE, template = data)
}

## A vector's values without any attributes.
.lasa_bare <- function(x) {
  x <- unclass(x)
  attributes(x) <- NULL
  x
}

## The attributes that make up a vector's type (class, factor levels, ...),
## in a fixed order.
.lasa_structure_of <- function(x) {
  a <- attributes(x)
  a[intersect(c("class", "levels", "tzone", "units"), names(a))]
}

## The attributes that describe a vector's content (labels, ...): all but
## the structural ones and those transform_lasa_data() manages.
.lasa_content_attributes <- function(x) {
  a <- attributes(x)
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

  changes <- list()
  for (wave in waves) {
    x <- originals[[wave]]
    baseline <- .lasa_content_attributes(.lasa_generic_wide_column(long, wave, single_wave = FALSE))
    content <- .lasa_content_attributes(x)
    change <- list()
    differs <- vapply(names(content), function(nm) !identical(content[[nm]], baseline[[nm]]), logical(1))
    if (any(differs)) change$set <- content[differs]
    dropped <- setdiff(names(baseline), names(content))
    if (length(dropped) > 0L) change$drop <- dropped
    if (!identical(.lasa_structure_of(x), long_structure)) change$structure <- .lasa_structure_of(x)
    if (!identical(typeof(.lasa_bare(x)), long_type)) change$type <- typeof(.lasa_bare(x))
    if (!identical(.lasa_column_kind(x), long_kind)) change$kind <- .lasa_column_kind(x)
    if (length(change) > 0L) changes[[wave]] <- change
  }

  list(
    long_name = stem,
    kind = long_kind,
    names = stats::setNames(spec$column[match(waves, spec$wave)], waves),
    positions = stats::setNames(spec$position[match(waves, spec$wave)], waves),
    empty = waves[vapply(originals, function(x) all(.lasa_is_na(x)), logical(1))],
    changes = changes
  )
}

## Combines a long column already in long data with the values the same
## variable's wide columns contribute, row by row; both holding different
## values for the same row is an error.
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
      .lasa_value_key(respondents[which(conflict)[[1L]]]), ").",
      call. = FALSE
    )
  }
  attrs <- .lasa_long_attributes(list(existing = existing, pivoted = pivoted))
  attrs$wave_label <- attr(pivoted, "wave_label", exact = TRUE) %||% attr(existing, "wave_label", exact = TRUE)
  attrs$labels_wave <- attr(pivoted, "labels_wave", exact = TRUE) %||% attr(existing, "labels_wave", exact = TRUE)
  values <- .lasa_set_attributes(values, attrs[!vapply(attrs, is.null, logical(1))])
  attr(values, "LASA_wide_columns") <- attr(pivoted, "LASA_wide_columns", exact = TRUE)
  pick <- ifelse(is.na(existing_key), n + seq_len(n), seq_len(n))
  .lasa_slice(values, pick)
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

## The values of wide column `v` (sliced from its long column) in the type
## the original wide column had -- `kind`/`type` as recorded by
## .lasa_wide_store(), `structure` its class/levels/... -- or NULL when
## they no longer fit it (e.g. a factor level that wave never had).
.lasa_restore_values <- function(v, kind, type, structure) {
  kind_now <- .lasa_column_kind(v)
  numeric_kinds <- c("logical", "integer", "double", "labelled_integer", "labelled_double")
  text_kinds <- c("character", "labelled_character")
  empty <- all(.lasa_is_na(v))
  compatible <- empty || switch(kind,
    factor = kind_now %in% c("factor", "character"),
    logical = ,
    integer = ,
    double = ,
    labelled_integer = ,
    labelled_double = kind_now %in% numeric_kinds,
    character = ,
    labelled_character = kind_now %in% text_kinds,
    Date = kind_now == "Date",
    POSIXct = kind_now == "POSIXct",
    other = kind_now == "other" && identical(class(v), structure$class),
    FALSE
  )
  if (!isTRUE(compatible)) return(NULL)

  if (empty) {
    return(.lasa_as_type(rep(NA, length(v)), if (identical(kind, "factor")) "integer" else type))
  }
  if (identical(kind, "factor")) {
    text <- as.character(v)
    if (!all(is.na(text) | text %in% structure$levels)) return(NULL)
    return(match(text, structure$levels))
  }
  values <- .lasa_bare(v)
  if (typeof(values) == type) return(values)
  whole <- all(is.na(values) | (is.finite(values) & values == round(values) &
    abs(values) <= .Machine$integer.max))
  if (identical(type, "integer") && is.numeric(values) && whole) return(as.integer(values))
  if (identical(type, "double") && (is.integer(values) || is.logical(values))) return(as.double(values))
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

  structure <- change$structure %||% .lasa_structure_of(v)
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

## A wide column built from a long column without a usable store entry:
## the long column's attributes, with "wave_label"/"labels_wave" narrowed
## to `wave` where they hold one entry per wave.
.lasa_generic_wide_column <- function(v, wave, single_wave) {
  attr(v, "LASA_wide_columns") <- NULL
  wave_label <- attr(v, "wave_label", exact = TRUE)
  if (!is.null(wave_label)) {
    per_wave <- !is.null(names(wave_label)) && all(names(wave_label) %in% .lasa_wave_table()$wave)
    attr(v, "wave_label") <- if (per_wave) {
      if (wave %in% names(wave_label)) wave_label[[wave]] else NULL
    } else if (single_wave) {
      wave_label
    } else {
      NULL
    }
  }
  labels_wave <- attr(v, "labels_wave", exact = TRUE)
  if (!is.null(labels_wave)) {
    attr(v, "labels_wave") <- if (is.list(labels_wave)) {
      labels_wave[[wave]]
    } else if (single_wave) {
      labels_wave
    } else {
      NULL
    }
  }
  v
}

## format = "wide", from long data (`long` always has a "Wave" column).
.lasa_to_wide <- function(long, prefix, db_info) {
  id <- .lasa_find_respnr(long)
  waves_table <- .lasa_wave_table()
  wave_codes <- .lasa_normalize_wave_codes(long[["Wave"]])
  resp <- .lasa_respondents(long[[id]], id)
  n_resp <- resp$n
  present_waves <- waves_table$wave[waves_table$wave %in% wave_codes]
  single_wave <- length(present_waves) == 1L

  # cell[r, w]: the row of respondent r at present wave w (NA if none).
  cell <- matrix(NA_integer_, nrow = n_resp, ncol = length(present_waves))
  cell[cbind(resp$r, match(wave_codes, present_waves))] <- seq_len(nrow(long))
  respondent_row <- .lasa_first_row(resp$r, n_resp)

  stable <- list()
  varying <- character(0)
  inconsistent_stable <- character(0)
  for (name in setdiff(names(long), c(id, "Wave", "Time"))) {
    x <- long[[name]]
    lower <- tolower(name)
    canonical_attr <- attr(x, "canonical_name", exact = TRUE)
    canonical_attr <- if (is.character(canonical_attr) && length(canonical_attr) == 1L) tolower(canonical_attr) else NA_character_
    key <- .lasa_value_key(x)

    documented_varying <- !is.null(attr(x, "LASA_wide_columns", exact = TRUE)) ||
      lower %in% db_info$time_varying || (!is.na(canonical_attr) && canonical_attr %in% db_info$time_varying)
    if (documented_varying) {
      varying <- c(varying, name)
      next
    }

    if (lower %in% db_info$stable || (!is.na(canonical_attr) && canonical_attr %in% db_info$stable)) {
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
    # included) per respondent.
    first_key <- key[respondent_row[resp$r]]
    same <- (is.na(key) & is.na(first_key)) | (!is.na(key) & !is.na(first_key) & key == first_key)
    if (all(same)) {
      stable[[name]] <- .lasa_slice(x, respondent_row)
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

  # Whether a wide column's name alone (with the result's provenance)
  # identifies its wave and variable; if not, it is tagged with
  # "LASA_wave"/"LASA_long_name" so transforming back finds them.
  resolve <- .lasa_column_resolver(
    db_info,
    file_code = attr(long, "LASA_file_code", exact = TRUE),
    data_wave = if (length(output_waves) == 1L) output_waves else "Z",
    long_mode = FALSE
  )

  wide_columns <- list()
  wide_names <- character(0)
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

      found <- resolve(new_name, column)
      if (is.null(found) || !identical(found$stem, name) || !identical(found$wave, wave)) {
        attr(column, "LASA_wave") <- wave
        attr(column, "LASA_long_name") <- name
      }

      wide_columns[[length(wide_columns) + 1L]] <- column
      wide_names <- c(wide_names, new_name)
      order_position <- c(order_position, if (in_store) unname(store$positions[[wave]]) else NA_real_)
      order_wave <- c(order_wave, match(wave, waves_table$wave))
      order_variable <- c(order_variable, v_index)
    }
  }

  # Columns that came from a wide file keep their original order; the rest
  # follow, wave by wave.
  wide_order <- order(is.na(order_position), order_position, order_wave, order_variable)
  wide_columns <- stats::setNames(wide_columns[wide_order], wide_names[wide_order])

  result <- c(stats::setNames(list(.lasa_slice(long[[id]], respondent_row)), id), stable, wide_columns)
  duplicated_names <- unique(names(result)[duplicated(names(result))])
  if (length(duplicated_names) > 0L) {
    stop(
      "Wide format would have duplicated column names: ", paste(duplicated_names, collapse = ", "),
      ". Rename the long column(s) involved first.",
      call. = FALSE
    )
  }

  out <- .lasa_build_frame(result, long)
  .lasa_set_wave_attr(out, output_waves, long = FALSE, template = long)
}
