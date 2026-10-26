# Transform LASA data between long and wide format

Reshapes LASA data between *wide* format – one row per respondent, with
a separate column for each variable at each wave (`boak`, `coak`,
`doak`, ...), the way LASA's Z files (e.g. `LASAZOA1.SAV`) store
information that spans waves – and *long* format: one row per respondent
per wave, one column per variable (`oak`), and a `"Wave"` column saying
which wave each row belongs to, the way
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
returns a single wave file. Works on a file read by
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
(`read_lasa_sav(format_as_long = TRUE)` calls it for you), on several
LASA files merged together, and on any data frame with a `respnr`
column.

## Usage

``` r
transform_lasa_data(data, format = "long", prefix = "Wave")
```

## Arguments

- data:

  A data frame or tibble with one respondent identifier column named
  `respnr` (in any capitalization), for example the result of
  [`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
  or several LASA files merged together. Long data also have a `"Wave"`
  column (in any capitalization) of LASA wave codes.

- format:

  `"long"` (the default) or `"wide"`: the format to transform `data`
  into.

- prefix:

  `"Wave"` (the default) or `"Time"`: what the names of wave-specific
  columns start with in wide format. Only used when `format = "wide"`;
  see Details.

## Value

`data` in the requested format, as a data frame (or a tibble if `data`
is one), keeping `data`'s provenance attributes. Its `"LASA_wave"`
attribute is updated to the data's single wave if there is only one,
removed from long data that span several waves, and `"Z"` for wide data
that span several waves (as for a Z file). Long data that span several
waves can't be relabelled with
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md),
which labels one file and wave at a time: label each file before
transforming it.

## Details

**Long format** has one row per respondent per wave, with a `"Wave"`
column (the LASA wave code, e.g. `"B"`, `"2B"`, `"MB"`) and a `"Time"`
column right after `respnr`. Each wave-specific variable becomes one
column named after its wave-stripped (canonical) name, so `boak`,
`coak`, ... become `oak`. A respondent gets a row for each wave at which
at least one of the wave-specific columns has a value for them –
anything but `NA` or blank text (which is how SPSS stores missing text),
so a missing-value code kept as a value (read with
`read_lasa_sav(keep_user_na = TRUE)`) counts too. Respondents of a later
cohort therefore only get rows for the waves before they joined LASA
where the data hold such a code for them, as LASA's Z files do ("no
observation birth cohorts 1938-1947"). A respondent without any value at
any wave keeps a row for every wave, so nobody disappears. Rows are
sorted by respondent (in order of first appearance) and wave, except in
long data without wide columns, which keep their order.

**Time** counts the waves since the respondent's baseline, the wave at
which their cohort joined LASA, which is Time 0. A cohort takes part in
every later wave except the other cohorts' baselines:

- first cohort: B = 0, C = 1, D = 2, E = 3, F = 4, G = 5, H = 6, I = 7,
  J = 8, K = 9, L = 10;

- second cohort: 2B = 0, F = 1, G = 2, H = 3, I = 4, J = 5, K = 6, L =
  7;

- third cohort and migrant cohort: 3B or MB = 0, I = 1, J = 2, K = 3, L
  = 4;

- fourth cohort: 4B = 0, L = 1.

Wave A, the LSN pilot study a few months before wave B, isn't part of
any cohort's waves: its rows keep `"Wave"` `"A"` and have no Time
(`NA`). Time counts waves, not years, and it isn't LASA's own wave
numbering, which `LASAZ008.SAV` uses (`t2_dat` is wave B there); for
time itself, use the interview dates or ages in `LASAZ008.SAV`.

A row's Time depends on the respondent's cohort, which the data show by:

- a value (other than `NA`, blank text, or a missing-value code) at the
  respondent's baseline or at a wave only their cohort takes part in (B
  to E for the first cohort);

- a single LASA file of such a wave, whose respondents all belong to its
  cohort, whatever their values (the data's `"LASA_file_code"` and
  `"LASA_wave"` attributes say which file; not a Z file, whose rows may
  hold codes for waves before a cohort joined): in long data all of
  whose rows are of that wave, any row, unless it holds nothing but
  values a guess put at its wave (see **Names of several waves**); in
  wide data (the file read with LASA's own names, `standardize = FALSE`
  in
  [`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
  or transformed to wide format), every respondent, as long as all
  columns are the file's (those its label report lists, and the names
  wide format gives columns of its wave) – once other data are joined
  on, every respondent with a value in one of the file's columns (one
  the join added has none), also when the file in wide data was joined
  onto long data, keeping its attributes (as `dplyr`'s joins do with it
  first);

- LASA's `cohort` column, as `LASAZ002.SAV` and Time-prefixed wide data
  (see **Wide format**) have it: `"cohort 1 (1992)"` – also written
  `"Cohort 1"` or `"cohort 1 (1992/1993)"` – or its code 1 is the first
  cohort, whose baseline is B; cohort 2's is 2B, cohort 3's 3B, cohort
  4's 4B, and the `"migrant cohort"`'s MB;

- a `"Time"` column already in long data;

- the respondent number: LASA numbers its respondents with five digits,
  the first of which is 1, 2, or 3 in the first cohort, 4, 5, or 6 in
  the second cohort, and 7, 8, or 9 in the third. A 1 also numbers the
  LSN pilot study's respondents, so it only says the first cohort of a
  respondent the data show at a wave other than A, by a value there
  (rows that hold nothing but missing-value codes don't count). The
  fourth and the migrant cohort's numbers aren't known yet: if they have
  five digits too, they say one of the first three cohorts until the
  rest of the data show their own (their baseline file, say, or a
  `cohort` column). A number of any other form (the longer numbers the
  fourth cohort may have, or the small numbers of the examples below)
  says nothing. Where the rest of the data show another cohort than a
  respondent's number, they decide, with a warning in long and
  Time-prefixed wide format, which show the cohort – also over a
  `"Time"` column that follows the number, as
  [`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
  and long format give it where the data don't show the cohort: at waves
  several cohorts share, and on rows holding nothing but missing-value
  codes (a Time at wave B is the first cohort's). Such a Time gives way
  also where a file of a wave of one cohort gave it, which stacked files
  no longer show.

A missing-value code is what
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
turns into `NA` unless `keep_user_na = TRUE`: an SPSS user-missing
value; in a variable the label database documents, any negative code,
documented or not, except in a variable whose values can be negative at
that wave (such as the speech-reception thresholds `msrttn`), where only
its documented codes are; and in any column, a negative code with a
value label – also as the text or factor level read_lasa_sav() gives it
(its label, or its own number). Values show the cohort in the
wave-specific variables the label database documents (and long columns
`transform_lasa_data()` made from wide columns); in long data without
any, in the columns whose values differ between a respondent's rows (a
variable computed per wave, say; an `NA` counts as a value of its own),
or else in all columns but the documented stable variables; and in long
data without such columns, every row shows its wave. The waves from F
on, which cohorts share, don't show the cohort: the rows of a respondent
seen only at those waves get no Time, with a message, unless their
respondent number or another of the sources above shows it (or every
cohort the data leave open gives their wave the same Time). Data showing
waves of several cohorts for one respondent give that respondent no
Time, with a warning.

A `"Time"` column already in long data – also the `Time.x`/`Time.y`
columns [`merge()`](https://rdrr.io/r/base/merge.html) makes of two, and
the further copies merging more data sets gives (`Time.x.x`, or several
of the same name) – must give each row a Time that the respondent's
cohort, as far as the rest of the data show it, gives its wave, and
copies must agree with each other, except that a copy following the
respondent number gives way to one that doesn't (that of a file of a
wave several cohorts share read on its own, next to that of data that
showed another cohort, say); it is replaced by the recomputed one.

A `cohort` column (in any capitalization) is LASA's when its values,
factor levels, or value labels name cohorts the way above, or when it
holds nothing but their codes (and missing values): LASA's codes 1 to 4,
and 5 for the migrant cohort, as Time-prefixed wide data code it, as
numbers, or as text or factor levels (`"4"`, the way
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
reads a code the label database doesn't document) – unless value labels
say they are something else (birth cohorts, say; labels of negative
missing-value codes aside). In a column whose value labels name cohorts,
a code without a value label names its cohort too, as does one labelled
with its own number (the level `"4"` in a `.sav` file). Any other
`cohort` column is an ordinary column. LASA's cohort column must give
each respondent one cohort, which the waves the data show must fit;
values that name no cohort (a missing-value code) say nothing. In long
format, it stays as it is; coded as Time-prefixed wide data have it (as
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
reads `LASAZ002.SAV`'s), it gets back the labels
[`merge()`](https://rdrr.io/r/base/merge.html) and row subsetting drop.
Several columns named `cohort` – the `cohort.x`/`cohort.y` columns of
data sets with a `cohort` column merged by `respnr` (`LASAZ002.SAV`,
Time-prefixed wide data), the further copies merging more of them gives
(`cohort.x.x`, or several of the same name), and columns whose names
differ in capitalization only (`LASAZ002.SAV`'s `COHORT` as
[`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html)
reads it, next to Time-prefixed wide data's `cohort`) – are combined
into one `cohort`, coded as Time-prefixed wide data have it, and must
agree. A copy that names no cohort is another data set's own column, and
stays as it is; a column named `cohort` that names none, next to one
that does, is an error.

**Stable variables** – columns that hold for every wave, such as sex or
year of birth (`byear`) in `LASAZ004.SAV` – keep one column and are
repeated on each of the respondent's rows: in long data, a stable
variable the label database documents is filled in on the respondent's
rows where it is missing (rows other files' columns added, or rows of
other waves merged in by `respnr` and `"Wave"`) from their other rows,
as long as those agree. A file without wave-specific columns, such as
`LASAZ004.SAV` or the migrant cohort's `LASMB004.SAV`, has no wave
dimension: it stays one row per respondent, without `"Wave"` and
`"Time"` columns, with a message.

**Which columns are wave-specific** is decided per column: a column made
wide by `transform_lasa_data()` itself is recognized by its name, or by
attributes it carries where its name doesn't say enough (see **Wide
format**); any other column is wave-specific when
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)
documents its name as a wave-specific variable – which covers LASA's
irregular names too, such as `t2_dat` (`t_dat`, wave B), `b_dm` (`dm`),
`b2oak` (`oak`, wave 2B), or `totalalpha`, which LASA's wave H file uses
without a wave prefix, and a column
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
matched to such a name by fuzzy matching or `name_corrections` – or, for
data that aren't long yet (no `"Wave"` column, or one holding nothing
but the `"Z"` placeholder
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
gives a Z file and the missing values merging with that file gives –
only missing values, too, in data with one row per respondent), when its
name is a wave prefix followed by a variable the label database
documents for that wave (the names wide format uses, see below), by any
wave-specific variable it documents if the wave is 4B or L, which it
doesn't document yet (`lhhnch`), or by a variable LASA's wave files name
without a wave prefix if the wave isn't A (`kseh_reden`). All other
columns are treated as stable, including columns the label database
doesn't know. A warning names columns kept stable that look like
wave-specific variables: names a merge suffixed with `.x`/`.y`, and, in
wide data, variables read with their wave stripped from their name.

In long data, a column named after a variable (its long-format name) is
that variable's long column, whose values stay at their rows' waves. So
is a column of a wave-specific name whose values are all on rows of
waves that name stands for: the waves the label database documents it
at, and the wave of the LASA file the data are (as far as the data's
label report lists the column) – also where the label database doesn't
document the name at that wave, as for the files of waves 4B and L,
which it doesn't document yet – and, for a name LASA's wave files use
without a wave prefix (`drinking`), those undocumented waves, any wave
once its values differ between a respondent's rows, and, in the data of
that name's LASA file (as far as the data's label report lists the
column; stacked files keep the first one's), the waves
[`lasa_topics()`](https://highmeadows.github.io/CleanLASA/reference/lasa_topics.md)
lists the file at that the label database doesn't document of it yet
(wave K for file 045's `seh_reden`), unless the file's wave-prefixed
columns are wide there (a wide file joined onto other long data). In the
data of a LASA file of wave L, a column the file's label report lists
named `l` followed by a wave-specific variable (`lhhnch`) is that
variable's long column too, so wave L's files become long as other
waves' do. Wave I's `immse01` to `immse23` are also the long names of
the migrant cohort's `bimmse01` to `bimmse23`: such a column is the
migrant cohort's long column when its values are on rows of wave MB (or
its `canonical_name` attribute says so), and wave I's column otherwise.

**Names of several waves.** LASA's wave files name the baseline of every
cohort (B, 2B, 3B, MB, and 4B) with the same `b` prefix, so a name such
as `blphya01` may belong to any of them, and a few other names stand for
several waves too (`bqvalu16` for waves 3B and J, `xcancer1` for waves B
and C). Each respondent's value in such a column goes to the wave the
data show for that respondent: in long data, a value already on a row of
one of those waves stays there; otherwise, the respondent's cohort, as
far as the data (or else the respondent number) show it (the first
cohort has no wave 3B, so its respondents' `bqvalu16` is wave J's), and
then the file the column came from (the data's `"LASA_file_code"` and
`"LASA_wave"` attributes, as far as the data's label report lists the
column, since a merge keeps at most the first file's attributes). If
nothing says, the value goes, with a message naming the column, to the
first of these waves the respondent's cohort may take part in: the wave
the column's other respondents were placed at by their cohort, the wave
of the data's `"LASA_wave"` attribute, and the column's waves in
calendar order (and for a name LASA's wave files use without a wave
prefix, `drinking`, if the respondent's cohort takes part in none of
those: waves 4B and L, which the label database doesn't document yet).
Such a guess doesn't count as showing the respondent's cohort, so it
gives none of their rows a Time unless something else, such as their
respondent number, shows the cohort (which may leave several of the
column's waves open: the third cohort takes part in both of
`bqvalu16`'s) – also when the result is transformed again: the long
column remembers which of its values were placed by a guess, and wide
format gives those values one column, also when the guesses put them at
several waves, under a name that doesn't say the wave (its original
name, or else LASA's own, such as `blphya01`), so transforming that back
guesses again, with the message. The long column keeps that memory in
its attributes, which [`rbind()`](https://rdrr.io/r/base/cbind.html),
[`merge()`](https://rdrr.io/r/base/merge.html),
[`dplyr::bind_rows()`](https://dplyr.tidyverse.org/reference/bind_rows.html),
subsetting or sorting the rows of a data frame (rather than a tibble),
and writing the data to a `.sav` file can drop: after that, those values
count as showing the cohort of the wave they were put at. To avoid
guesses, transform each LASA file to long format before combining files
(with `format_as_long = TRUE` in
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)).

One name stands for two variables at one wave: `bmmsesc1` is file 221's
`mmsesc` and file 421's `mmsesc1` at wave MB. The data's file (or the
column's `canonical_name` attribute) says which; otherwise it is taken
as the variable the name stands for at its other waves (`mmsesc1`), with
a message.

**Merged files.** `data` may be several LASA files merged together, in
any of three shapes:

- long (the most reliable): files read with `format_as_long = TRUE`,
  which gives each file's rows their Time while the file still shows
  their cohort (in a baseline file, also rows holding nothing but
  missing-value codes), stacked per file code with
  [`dplyr::bind_rows()`](https://dplyr.tidyverse.org/reference/bind_rows.html)
  (or [`rbind()`](https://rdrr.io/r/base/cbind.html), if the files have
  the same columns) and merged by `respnr` and `"Wave"` (with
  `all = TRUE`, to keep the rows of respondents missing from some
  files); the `Time.x` and `Time.y` columns that merge makes become one
  `"Time"` again, now also for the rows of files that didn't show the
  respondent's cohort on their own. Stacking and merging drop the
  columns' labels (or keep one file's for all rows), which
  `transform_lasa_data()` gives back (see **Labels**). A file without
  wave-specific columns (`LASAZ004.SAV`, `LASMB004.SAV`) read with
  `format_as_long = TRUE` has no `"Wave"` column: merge it by `respnr`
  alone;

- wide, e.g. `LASAB046.SAV`, `LASAC046.SAV`, `LASAB030.SAV`, ... read
  with `standardize = FALSE` and merged by `respnr` (with `all = TRUE`),
  or a Z file merged with `LASAZ004.SAV`.
  [`merge()`](https://rdrr.io/r/base/merge.html) drops the files'
  attributes (`dplyr`'s joins keep the first data set's), so the values
  in `b` columns of a respondent the data show nowhere else (one who
  dropped out after wave B, say) go to the baseline their respondent
  number says, or else are placed by a guess (see **Names of several
  waves**), which gives them no Time. So merge the baseline files of the
  migrant and the fourth cohort (`LASMB046.SAV`, `LAS4B046.SAV`), whose
  respondent numbers aren't known yet, in long format. Don't stack wide
  files of different cohorts that share column names (e.g.
  `LAS2B046.SAV` below `LASAB046.SAV`, or `LASAZDC2.SAV` below
  `LASAZDC1.SAV`): stack them in long format;

- a mix: long data that wide columns were merged into by `respnr`, for
  example a Z file's – without the placeholder `"Wave"` column
  [`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
  gives a Z file, or the two `"Wave"` columns end up as `Wave.x` and
  `Wave.y`, which is an error. `format = "long"` moves each wide
  column's values to its wave's row, adding a row where a respondent has
  a value at a wave the long data don't have a row for yet. On those
  added rows, stable variables the label database documents (such as
  `sex`) are filled in from the respondent's other rows, and other
  columns are left missing, since they weren't measured at that wave.
  Merged with `all = TRUE` (or
  [`dplyr::full_join()`](https://dplyr.tidyverse.org/reference/mutate-joins.html)),
  the respondents the long data lack get a row without a wave, holding
  the wide data's values: those of wide columns go to their waves,
  adding the rows they need (a row at every wave of the wide columns if
  there are none), and the others hold for every wave, as in wide data,
  so they fill each of the respondent's rows (a value in a `"Time"`
  column, or in a column of a wave-specific variable the label database
  documents, needs a wave, so it is an error). Where no wide columns
  were merged in, such respondents have no row in long format (with a
  message), but one in wide format.

**Wide format** has one row per respondent and drops the `"Wave"` and
`"Time"` columns. Each wave-specific variable gets one column per wave
at which it has any value, and a long column made from wide columns gets
all of those columns back, also ones without any value. With
`prefix = "Wave"`, a column's name is its wave's lowercase LASA prefix
followed by the variable name: `boak`, `coak`, `doak`, ... Waves 2B, 3B,
4B, and MB get the prefixes `b2`, `b3`, `b4`, and `mb` (as LASA's own
`zoa2`/`zoa3` files do for 2B and 3B), so they don't collide with wave
B's columns. Where LASA's own name for the variable at that wave stands
for nothing else, the column gets that name instead (`m15wrth` is
`bm15twtrh` at wave B and `c15wtrth` at wave C; `totalalpha`, wave H's
name without a wave prefix, stays `totalalpha`). A column that came from
a wide LASA file gets its original name back (e.g. `t2_dat` rather than
`bt_dat`), unless its values went to several waves or the name doesn't
say its wave by itself: the `b_dm` column of `LASAZDC2.SAV`, which holds
the second cohort's baseline, becomes `b2dm`.

With `prefix = "Time"`, names are `t`, the `"Time"`, and an underscore
followed by the variable name: `t0_oak` holds each respondent's value at
their own baseline, `t1_oak` at their cohort's next wave (wave C for the
first cohort, F for the second), and so on, so the cohorts share
columns. A `cohort` column after `respnr` gives each respondent's
cohort, which transforming the data back to long format uses. It is
LASA's cohort variable the way
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
reads `LASAZ002.SAV`'s – a factor of its value labels
(`"cohort 1 (1992)"`, `"cohort 2 (2002)"`, `"cohort 3 (2012)"`), with
its labels – so the result merges with that file by `respnr` and
`cohort`, read with `to_factor = TRUE` (the default); read with
`to_factor = FALSE`, merge it by `respnr` alone (the `cohort.x` and
`cohort.y` columns that gives are combined, see above). The fourth
cohort, whose code 4 the label database doesn't document yet, gets the
level `"4"`, as
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
reads that code, and the migrant cohort, which `LASAZ002.SAV` doesn't
have, the level `"migrant cohort"` after it. These levels come where the
data have respondents of these cohorts – `"4"` also with only the
migrant cohort's – so that each cohort keeps its code (1 to 5) when the
factor becomes numbers (in a `.sav` file, say). The column replaces a
`cohort` column `data` have, which must then be LASA's: any other column
named `cohort` (in any capitalization) is an error, so rename it first.
Wave A, which has no Time, keeps its own column (`aoak`). Every other
value needs a Time: values at a wave without one for their respondent
are an error, except missing-value codes, which are left out with a
message. A respondent whose rows have a Time while the data leave their
cohort open (rows of waves I to L only, which the third and the migrant
cohort give the same Time, of a respondent whose number doesn't say the
cohort, or says one the data rule out) gets a missing `cohort`, with a
warning: their columns can't be transformed back, also not by their
respondent number. A column holding several cohorts' waves (`t0_oak`: B,
2B, ...) gets those waves' types, value labels and user-missing codes,
combined the way long format combines waves, with a warning where their
user-missing codes don't combine, and their
`"wave_label"`/`"labels_wave"` as one entry per wave. Original names
aren't kept with `prefix = "Time"`, also not when such data are made
wide again with `prefix = "Wave"`.

A column stays stable in wide format when it has a single value per
respondent and isn't a documented wave-specific variable; a documented
stable variable (such as `sex`) only needs to agree across the rows
where it isn't missing. A wide column whose name still doesn't say which
wave and variable it holds (a name the label database doesn't document,
or a wave B name the later cohorts' baselines share, such as `blphya01`,
and, in a result with wave 4B, whose files use the baselines' `b` names,
any baseline's `b` name) carries the attributes `"LASA_wave"` and
`"LASA_long_name"`, which transforming it back uses, also without the
result's other columns. Base R's
[`merge()`](https://rdrr.io/r/base/merge.html) and row subsetting drop
those attributes from factor and numeric columns (haven's labelled
columns keep them); the column is then placed like a column of LASA's
own files, see **Names of several waves**.

**Labels** travel with the data. A long column keeps each wave's own
`"wave_label"`/`"labels_wave"` as one entry per wave. Its variable label
is the one its waves share, or else their harmonized (cross-wave) label,
or else the first wave's. Its value labels are those of all waves
combined; if a code is labelled differently at different waves, it gets
the harmonized value labels, or none. SPSS user-missing codes
(`"na_values"`, `"na_range"`) are combined as long as that marks exactly
the same values missing on every wave's rows; otherwise the long column
gets none, with a warning. Factor levels are combined across waves;
wave-specific columns whose types don't combine (e.g. a factor at one
wave and numbers at another) become text, without value labels or
user-missing codes, with a warning. Time spans (`difftime`) get a unit
every wave's values convert to exactly, the first wave's if possible;
date-times that become text are written in UTC
(`"2021-10-31 00:30:00+0000"`), so they read back as the same moment.
Converting back to wide restores each wide column's original type (also
from text), attributes, and user-missing codes, as long as its values
still fit them.

In long data, the column of a wave-specific variable the label database
documents that has lost its labels –
[`rbind()`](https://rdrr.io/r/base/cbind.html),
[`dplyr::bind_rows()`](https://dplyr.tidyverse.org/reference/bind_rows.html)
and [`merge()`](https://rdrr.io/r/base/merge.html) drop them from factor
and numeric columns, and [`rbind()`](https://rdrr.io/r/base/cbind.html)
keeps one file's for all rows of labelled columns – gets back the labels
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
gives the variable at each wave it has values at, from the label
database: `"wave_label"`/`"labels_wave"` with an entry per wave,
`"canonical_name"`, the harmonized label and value labels where the
database has them, and as `"label"` and `"labels"` the harmonized ones,
or else the waves' shared (or first) wording and all their value labels.
The data then get a `"variable.labels"` attribute too, if they had none.
So does a long column made of wide columns that have all lost their
labels (wide files merged with
[`merge()`](https://rdrr.io/r/base/merge.html)); wide format gives those
columns back as they were. Labels of a column's own (not ones the
database gives the variable, such as a user's own wording) are kept as
they are, and a column with `"wave_label"` entries for some of its waves
only gets the other waves', as long as those it has are the database's.
A wave at which the database documents the variable with different
labels in several files (`partner` at wave MB) gets none.

## See also

[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
(`format_as_long`),
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md),
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)

## Examples

``` r
# A Z-file-shaped data frame: knee osteoarthritis (oak) of two
# respondents of the first cohort (waves B, C, and F) and one of the
# second (waves 2B and F), plus a stable variable (sex).
wide <- data.frame(
  respnr = c(101, 102, 201),
  sex = c(1, 2, 2),
  boak = c(0, 2, NA),
  coak = c(1, 8, NA),
  b2oak = c(NA, NA, 1),
  foak = c(2, NA, 0)
)

# format = "long" is the default. Time counts the waves since each
# respondent's own baseline: wave F is Time 4 for the first cohort, but
# Time 1 for the second.
long <- transform_lasa_data(wide)
long
#>   respnr Wave Time sex oak
#> 1    101    B    0   1   0
#> 2    101    C    1   1   1
#> 3    101    F    4   1   2
#> 4    102    B    0   2   2
#> 5    102    C    1   2   8
#> 6    201   2B    0   2   1
#> 7    201    F    1   2   0

# And back again, with wave letters or Time numbers as prefixes:
transform_lasa_data(long, format = "wide")
#>   respnr sex boak coak b2oak foak
#> 1    101   1    0    1    NA    2
#> 2    102   2    2    8    NA   NA
#> 3    201   2   NA   NA     1    0
transform_lasa_data(long, format = "wide", prefix = "Time")
#>   respnr          cohort sex t0_oak t1_oak t4_oak
#> 1    101 cohort 1 (1992)   1      0      1      2
#> 2    102 cohort 1 (1992)   2      2      8     NA
#> 3    201 cohort 2 (2002)   2      1      0     NA

if (FALSE) { # \dontrun{
# Read a Z file straight into long format:
oa <- read_lasa_sav("LASAZOA1.SAV", format_as_long = TRUE)
} # }
```
