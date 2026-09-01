# CleanLASA introduction

## What this package is for

LASA (Longitudinal Aging Study Amsterdam) data is distributed as SPSS
(`.sav`) files. Each file covers one “file code” – a topic or set of
related questions – and one measurement “wave” – roughly, one round of
data collection. The same topic is usually asked again in later waves,
but with a wave-specific prefix on its variable names (e.g. `blphya01`
in wave B), and sometimes with slightly different numeric codes for the
same answer categories. Reading a `.sav` file with a generic tool like
[`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html)
gets you the raw numbers, but none of that context: you’d have to look
up LASA’s own documentation by hand to know what column `blphya01` even
is, and repeat that work for every wave.

`CleanLASA` does that lookup for you. It connects three things that
would otherwise all be separate, manual steps:

1.  **finding** the LASA topic, file code, and waves you need, and
    opening LASA’s own documentation for it;
2.  **importing** a LASA `.sav` file while automatically attaching the
    correct variable and value labels, for whichever specific file code
    and wave it is; and
3.  **checking** that the labelling worked as expected, and fixing it by
    hand for the rare case where it didn’t.

The main function for step 2 is
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md).
It works out the LASA wave and file code from the file name, looks up
the matching metadata in the package’s built-in label database, and
applies it. If you’ve already imported the data some other way,
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
does the same labelling on its own.

A typical session works through these steps roughly in order:

``` text
find topic/file code -> inspect LASA documentation -> import .sav file
        -> apply/reshape labels -> inspect matching audit -> analyse data
```

This vignette walks through all of it, one function at a time. The
example code isn’t actually run when this vignette is built, because it
needs real LASA data files and, for the documentation lookup, access to
the live LASA website – neither of which is guaranteed to be available
wherever the package happens to be installed.

## 1. Find topics, file codes, and waves

If you don’t already know the file code you need, start with
[`lasa_topics()`](https://highmeadows.github.io/CleanLASA/reference/lasa_topics.md).
It searches the package’s built-in index of LASA topics. Called with no
arguments, it returns the whole index; you can narrow it down by topic
name, theme, subtheme, or file code instead.

``` r

# Browse the complete LASA topic index
lasa_topics()

# Search by topic name; partial names and small typos are both fine
lasa_topics(topic = "physical act")

# Search a theme or subtheme
lasa_topics(theme = "cognitive")
lasa_topics(theme = "memory")

# Search by file code
lasa_topics("011")

# A 3-digit file code also matches processed/scaled variants that share
# the same final two digits -- this also returns the "245" row
lasa_topics("045")
```

Matching a topic name is forgiving on purpose: it ignores
capitalization, accepts a partial name (`"physical act"` matches
`"Physical activity"`), and by default also tolerates small typos
through fuzzy matching. If you ever want exact matching only, turn that
off with `fuzzy_match = FALSE`; `max_edit_distance` controls how many
characters’ worth of typo is still considered a match (default `2`).

``` r

# Exact matching only, no typo tolerance
lasa_topics(topic = "physical activity", fuzzy_match = FALSE)

# Allow slightly bigger typos than the default
lasa_topics(topic = "phisical activty", max_edit_distance = 3)
```

The result is a data frame with one row per topic/file-code combination,
with columns `theme`, `subtheme`, `topic`, `filecode`, `waves`, and
`has_varinfo` (whether LASA links a variable-information PDF for that
row – see the next section). A topic that doesn’t have a file code yet,
or a file code with no linked PDF, still shows up in the result rather
than being left out – you’ll just see `NA` for `filecode`, or `FALSE`
for `has_varinfo`.

This index is hand-maintained rather than scraped from LASA’s website
(see `data-raw/lasa_topic_database.R` in the package source), so it only
changes when the package itself is updated.

## 2. Open the matching LASA documentation

Once you know the topic or file code,
[`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md)
finds and opens LASA’s own documentation for it: either the official
variable-information PDF, or the topic’s page on the LASA website. Both
are looked up live, by briefly visiting the [LASA topic
overview](https://lasa-vu.nl/en/topic-table/) – no PDFs are bundled with
the package itself.

``` r

# By file code
lasa_var_info("046")
lasa_var_info("LASA046")   # common variations of a file code are recognized
lasa_var_info("LASA 046")
lasa_var_info("lasa_046")

# By topic name
lasa_var_info("Physical activity")
lasa_var_info("physical act")  # fuzzy matching handles typos here too

# Open the topic's LASA webpage instead of the PDF (also accepts
# "webpage"/"website"/"browser"/"online", case-insensitively)
lasa_var_info("046", target = "web")

# Retrieve the URL without opening the document
url <- lasa_var_info("046", open = FALSE)

# Force a fresh lookup instead of using the cached link
lasa_var_info("046", refresh = TRUE)
```

By default, in an interactive R session, the document opens straight
away in your system’s default web browser – not the RStudio Viewer,
which doesn’t reliably display hosted PDFs. Set `open = FALSE` if you
just want the URL back without opening anything.

Not every file code has a linked PDF. When that happens,
[`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md)
automatically falls back to the topic’s LASA webpage instead and prints
a message explaining why – so asking for the PDF never simply fails as
long as *some* documentation exists. This fallback only goes one way: if
you explicitly ask for the webpage (`target = "web"`) and none can be
found, that’s a normal error.

Like
[`lasa_topics()`](https://highmeadows.github.io/CleanLASA/reference/lasa_topics.md),
topic-name matching here tolerates typos through `fuzzy_match` (default
`TRUE`) and `max_edit_distance` (default `2`). The underlying link
lookup itself is cached, both for the rest of your R session and on disk
between sessions, so
[`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md)
doesn’t have to re-fetch LASA’s website every time; use `refresh = TRUE`
if you suspect a link has changed since it was cached.

## 3. Import and label a LASA SPSS file

[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
is the function you’ll use most. It reads the file with
[`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html),
figures out the LASA wave and file code from the file name, looks up the
matching metadata in
[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md),
and attaches variable and value labels.

``` r

# Regular LASA wave: LASA + wave + file code
physical_activity_b <- read_lasa_sav("LASAB046.sav")

# Information stored in a Z file
sex <- read_lasa_sav("LASAZ004.sav")

# Replenishment/migrant-cohort waves use LAS2B/LAS3B/LAS4B/LASMB
physical_activity_3b <- read_lasa_sav("LAS3B046.sav")
```

The file name is what tells
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
which wave and file code it’s looking at, so it needs to follow LASA’s
naming convention (case doesn’t matter): regular single-letter waves are
named `LASA[wave][filecode].sav`, and the replenishment waves `2B`,
`3B`, `4B`, and `MB` are named `LAS[wave][filecode].sav`. If your file
doesn’t follow this pattern, pass `filecode`/`wave` yourself (see
[section 6](#id_6-apply-lasa-labels-to-an-existing-data-frame)).

By default,
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
reads the file with `user_na = TRUE`, so SPSS’s user-defined
missing-value codes stay visible instead of silently becoming `NA`
before CleanLASA gets a chance to label them. You can pass any other
[`haven::read_sav()`](https://haven.tidyverse.org/reference/read_spss.html)
argument through `read_sav_args`:

``` r

data <- read_lasa_sav(
  "LASAB046.sav",
  read_sav_args = list(encoding = "UTF-8")
)
```

(Don’t put `file` or `user_na` inside `read_sav_args` – those are
controlled by `path` and `user_na` directly, not by this list.)

Once imported, the result carries a few extra pieces of information
about where it came from: which wave and file code it is, and the source
file name. It also carries the full matching audit, described in
[section 5](#id_5-audit-how-variables-were-matched).

## 4. Choose how labelled variables are represented

By default, a single
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)/[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
call does all of the following at once: categorical variables become R
factors (`to_factor`), count/continuous variables become plain numbers
(`to_numeric`), column names are standardized to one name shared across
every wave and a `"Wave"` column is added (`standardize`, which also
turns on `add_wavecode`), and the wording that’s consistent across every
wave becomes each variable’s active label. Every one of these can be
switched off individually if you’d rather keep the raw SPSS-style
representation for some or all of them.

To see what changes, here’s the same file read the plain way first, with
no CleanLASA processing at all:

``` r

data <- haven::read_sav("LASAB046.sav")
```

``` r

summary(data$blphya01)
#>   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#> -5.000   4.000   4.000   3.476   4.000   4.000

attr(data$blphya01, "labels")
#> Na, interview terminated      Na, short interview           Na, wrong skip
#>                       -5                       -4                       -3
#>                  Na, see                Na, asked     Respondent bedridden
#>                       -2                       -1                        1
#> Respondent in elec. whee Respondent in mech. whee             not 1 2 or 3
#>                        2                        3                        4
```

This is a plain SPSS-labelled numeric vector: the values are numbers,
and the labels are stored as an attribute rather than actually applied.
The rest of this section shows what each CleanLASA option changes about
this.

### Convert labelled categories to factors

`to_factor` defaults to `TRUE`, so this already happened in the quick
example above without any extra argument: documented value labels become
R factor levels.

``` r

data <- read_lasa_sav("LASAB046.sav")
summary(data$lphya01)
#> Na, interview terminated      Na, short interview           Na, wrong skip
#>                       13                      175                        0
#>                  Na, see                Na, asked     Respondent bedridden
#>                        0                        4                       20
#> Respondent in elec. whee Respondent in mech. whee             not 1 2 or 3
#>                        5                       20                     2870

attr(data$lphya01, "labels_wave")
#> Na, interview terminated      Na, short interview           Na, wrong skip
#>                       -5                       -4                       -3
#>                  Na, see                Na, asked     Respondent bedridden
#>                       -2                       -1                        1
#> Respondent in elec. whee Respondent in mech. whee             not 1 2 or 3
#>                        2                        3                        4
```

If a value shows up in the data but LASA’s documentation has no label
for it, that value is kept as its own factor level (shown as the number
itself) rather than silently turned into `NA` – so you’ll notice an
undocumented code instead of quietly losing data. Set
`to_factor = FALSE` to leave the variable as a plain numeric/character
vector instead.

### Variables that mean the same thing but were coded differently

A handful of variables were coded on genuinely different numeric scales
in different waves – for example a yes/no question where `0` meant “no”
in one wave but `1` meant “no” in another, or an income bracket that was
redefined. There’s no single set of value labels that correctly
describes every wave for a variable like this, so the label database
marks it `var_type == "text"` and doesn’t offer harmonized value labels
for it at all. `to_factor` handles this by converting the variable to
its wave-specific label *text* (a character vector, not a factor)
instead – so even though the underlying numeric codes disagree between
waves, the text itself (`"no"`/`"yes"`) still lines up, and the variable
can still be compared or combined across waves.

### Restore count/continuous variables to plain numeric

Not every variable is categorical – some are genuine counts or
continuous measures, and the label database knows the difference (a
variable whose codebook has no positive/categorical codes, only negative
“missing”-reason ones, is classified as numeric). `to_numeric` defaults
to `TRUE`, so this also already happened above: those variables come
back as ordinary numbers, with negative missing-reason codes converted
to `NA`.

``` r

data <- read_lasa_sav("LASAB046.sav")
summary(data$lphya01)
#>   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#> -5.000   4.000   4.000   3.476   4.000   4.000
```

`to_factor` and `to_numeric` work together, not against each other: in
the same call, categorical variables become factors and
numeric-classified variables become plain numbers.

### Standardize variable names and separate the wave code

LASA variable names usually carry a wave-specific prefix – the same
question might be `blphya01` in wave B but `clphya01` in wave C, even
though it’s really the same variable. The label database’s *canonical
name* strips that prefix off (`lphya01` for both), and
`.standardize_names` (part of `standardize`, described next) renames
your columns to it, so the same variable has the same name whichever
wave you’re working with.

`standardize` (default `TRUE`) is really three independent settings
turned on together:

- **`.standardize_names`** – rename every matched column to its
  canonical name, and rename the respondent-ID column (in any
  capitalization) to `"respnr"`. This also inserts a `"Wave"` column
  right after `respnr` (the same thing `add_wavecode` does on its own,
  described below).
- **`.standardize_var_labels`** – use the cross-wave-consistent wording
  as each variable’s active label, instead of that wave’s own wording.
- **`.standardize_val_labels`** – the same idea, but for value labels:
  use the harmonized codebook (where LASA’s documentation defines one)
  instead of the wave-specific one.

``` r

data <- read_lasa_sav("LASAB046.sav") # standardize = TRUE by default

names(data)[1:4]
#> "respnr"    "Wave"      "lphya01"   "lphya02"

unique(data$Wave)
#> "B"
```

If you’d rather keep the original, wave-specific column names but still
want to know which wave you’re looking at, `add_wavecode` adds the
`"Wave"` column on its own, without renaming anything else:

``` r

data <- read_lasa_sav(
  "LASAB046.sav",
  .standardize_names = FALSE,
  add_wavecode = TRUE
)

names(data)[1:4]
#> "respnr"    "Wave"      "blphya01"  "blphya02"

unique(data$Wave)
#> "B"
```

### Correct a known source-column name

Occasionally a source file has a typo or a nonstandard column name that
doesn’t match either the wave-specific or canonical name CleanLASA
expects, so it wouldn’t be matched at all on its own. If you already
know which documented variable it actually is, `name_corrections` tells
CleanLASA directly, as `canonical_name = "actual name in the datafile"`:

``` r

data <- read_lasa_sav(
  "LASAB046.sav",
  name_corrections = c(lphya08 = "BLPYA08")
)
```

This mapping is applied before CleanLASA’s own automatic matching
(exact, then case-insensitive, then fuzzy), so it always takes priority.

You often won’t need `name_corrections` at all: `fuzzy_matching`
(default `TRUE`) already catches most typos on its own. When a
documented variable can’t be found under its expected name, CleanLASA
tries a best-guess (edit-distance) match against whichever of your
data’s columns haven’t already been claimed by something else. A unique
close match is used, and recorded as `"fuzzy"` in the matching audit
(see the next section); if there are two equally-good candidates,
CleanLASA leaves it unmatched rather than guessing.

### Preserve the original coding for reference

Whatever `.standardize_var_labels`/`.standardize_val_labels` are set to,
CleanLASA never throws away a matched variable’s *original*,
wave-specific label and value labels – they’re always kept as the
`"wave_label"` and `"labels_wave"` attributes. This stays true even
after converting to a factor or plain number, so you can always check
what R did against the original SPSS coding:

``` r

attr(data$lphya01, "wave_label")
attr(data$lphya01, "labels_wave")
```

## 5. Audit how variables were matched

Every
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
or
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
call keeps a record of exactly how each variable was matched – or if it
wasn’t.
[`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md)
returns that record:

``` r

report <- lasa_label_report(data)
report
```

By default this returns the complete picture, in both directions:
variables that were matched successfully, documented variables that
LASA’s documentation says should be there but weren’t found in your data
(`direction = "documented_not_in_data"`), and columns in your data that
don’t correspond to anything documented
(`direction = "data_not_documented"`). The `method` column records how
each match was made – `exact`, `case-insensitive exact`,
`exact canonical`, `fuzzy`, `manual correction`, `not found`, or
`undocumented column`. Neither direction is ever treated as an error: an
unmatched variable is simply left as-is and reported here for you to
look at.

To skip straight to what might need your attention:

``` r

lasa_label_report(data, problems_only = TRUE)
```

Run this before you start analysing the data. It confirms the variables
you expected were actually matched (and if not, is often fixable with
`name_corrections`), and flags columns in your data that aren’t
documented for this file code/wave – which might just be analysis
variables you added yourself, or something the label database genuinely
doesn’t cover yet. Either way, those columns were never touched by the
labelling engine, so nothing is lost.

## 6. Apply LASA labels to an existing data frame

[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
is the same labelling engine
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
uses, made available on its own. Use it when you’ve already imported a
`.sav` file some other way, or need to re-apply labels after a
transformation removed them.

``` r

raw <- haven::read_sav("LASAC046.sav", user_na = TRUE)

data <- apply_lasa_labels(
  raw,
  filecode = "046",
  wave = "C"
) # to_factor/to_numeric/standardize all default to TRUE
```

If `data` already carries the file-code/wave information that
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
(or an earlier
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
call) attached to it, you can usually leave `filecode`/`wave` out
entirely – CleanLASA remembers:

``` r

data <- read_lasa_sav("LASAB046.sav")

# ...perform transformations that may remove column attributes...

data <- apply_lasa_labels(data)
```

[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
can also work out the wave from a single-valued `Wave` column, if one is
present (the same column `add_wavecode`/ `.standardize_names` add).
Still, for a data frame that didn’t originate from
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md),
it’s most reliable to just tell it `filecode` and `wave` directly.

## 7. Inspect the label database

[`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md)
returns the metadata database CleanLASA is currently using – the bundled
data shipped with the package, plus any manual corrections you’ve made
(see the next section). It’s a list with four parts:

- **`variables`** – one row per file-code/wave/variable combination: the
  variable’s name as it appears in that wave’s data, its canonical
  (shared-across-waves) name, its label for that specific wave, its
  cross-wave-consistent (“harmonized”) label, and its type (numeric,
  categorical, or text).
- **`value_labels`** – the value/code labels (what each numeric code
  means) exactly as documented for that one wave.
- **`value_labels_harmonized`** – the same variable’s value labels,
  standardized across every wave that documents it (there’s no `wave`
  column here – a row applies no matter which wave you’re looking at).
  Useful for combining data across waves that coded the same concept in
  slightly different words. A variable whose coding genuinely differs
  across waves (`var_type == "text"` in `variables`) has no rows here at
  all – see [the earlier
  section](#variables-that-mean-the-same-thing-but-were-coded-differently)
  on why.
- **`manual_overrides`** – your own hand-authored corrections, kept
  separately from the bundled data (see the next section).

``` r

db <- lasa_label_db()

# Which wave-B variables are currently known for file code 046?
subset(db$variables, filecode == "046" & wave == "B")

# Inspect the corresponding value-label rows
subset(db$value_labels, filecode == "046" & wave == "B")

# The cross-wave-standardized value labels for the same variable
subset(db$value_labels_harmonized, filecode == "046" & canonical_name == "lphya01")
```

The package ships with a bundled snapshot of this database,
hand-transcribed from LASA’s own variable-information documentation.
Coverage grows, and mistakes get fixed, with package updates. If you
record a manual correction (next section), CleanLASA writes a complete,
updated copy of the database to a folder on your own computer, and uses
that local copy in preference to the bundled one from then on – so your
corrections stick around across R sessions without you having to touch
the installed package itself.

## 8. Record a manual metadata correction

Sometimes LASA’s documentation is wrong, incomplete, or you just want a
clearer label for your own use.
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md)
is the escape hatch for that: it records a correction in a separate
override layer, so a later package update won’t quietly wipe it out –
the update only replaces the *bundled* data your correction sits on top
of.

By default, a supplied value label is merged into the existing set for
that variable, leaving everything else untouched:

``` r

manual_update_lasa_labels(
  filecode = "046",
  wave = "B",
  variable = "lphya01",
  val_labels = c(`-5` = "NA, wrong, skip")
)
```

Set `replace_val_labels = TRUE` to replace the *entire* value-label set
for that variable instead of merging into it:

``` r

manual_update_lasa_labels(
  filecode = "046",
  wave = "all",
  variable = "lphya01",
  val_labels = c(`-5` = "NA, wrong, skip"),
  replace_val_labels = TRUE
)
```

The same function replaces a variable’s *label* (as opposed to its value
labels) through `var_label`:

``` r

manual_update_lasa_labels(
  filecode = "046",
  wave = "B",
  variable = "lphya01",
  var_label = "New label"
)
```

`var_label` and `val_labels` can be combined in one call, and `wave`
accepts either `"all"` or a vector of specific waves, so a single call
can update several waves at once:

``` r

manual_update_lasa_labels(
  filecode = "046",
  wave = "all", # update every wave currently covered (B-K)
  variable = "lphya01",
  var_label = "New label",
  val_labels = c(`-5` = "NA, wrong, skip")
)

manual_update_lasa_labels(
  filecode = "046",
  wave = c("B", "C", "D"), # only update these three waves
  variable = "lphya01",
  var_label = "New label",
  val_labels = c(`-5` = "NA, wrong, skip")
)
```

Once recorded, a correction takes effect immediately: the next time you
call
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
or
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md)
on that file/variable, the corrected label is what gets applied.

### Undo a manual correction

[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md)
writes a *complete* local copy of the database, not just the one
correction – so once that local copy exists, it’s what CleanLASA
actually uses, for every file code, until you refresh it.
[`restore_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/restore_lasa_labels.md)
is the undo button: it can discard recorded corrections (either
everything, or just the `filecode`/`wave`/`variable` you name), and/or
rebuild that local copy from whatever the currently-installed package
version now ships, so a package update’s new or corrected coverage
actually reaches you instead of staying hidden behind an old local copy.

``` r

# Undo one correction:
restore_lasa_labels(filecode = "046", variable = "lphya01")

# Undo every correction ever recorded locally:
restore_lasa_labels()

# Full reset: undo every correction AND rebuild the local snapshot from
# the currently-installed package's bundled database:
restore_lasa_labels(rebuild = TRUE)
```

## 9. A complete analysis-oriented workflow

Putting it all together, most analyses only need a handful of calls:

``` r

library(CleanLASA)

# 1. Find the relevant LASA topic and file code
lasa_topics(topic = "physical activity")

# 2. Inspect the official variable-information document if needed
lasa_var_info("046")

# 3. Import the LASA file -- to_factor/to_numeric/standardize (names,
#    variable labels, value labels) all default to TRUE
data <- read_lasa_sav("LASAB046.sav")

# 4. Check only matching problems before analysis
problems <- lasa_label_report(data, problems_only = TRUE)
problems
```

If a file code isn’t covered by the active label database yet,
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
doesn’t guess or invent metadata for it – there’s no per-file fallback
function it quietly switches to. Either add a deliberate correction with
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md),
or wait for a package update that adds coverage, then import (or
re-apply labels to) the data again.

## Function summary

| Function | Main purpose |
|----|----|
| [`lasa_topics()`](https://highmeadows.github.io/CleanLASA/reference/lasa_topics.md) | Search LASA topics, themes/subthemes, file codes, and available waves |
| [`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md) | Resolve and open the LASA variable-information PDF or webpage for a file code or topic |
| [`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md) | Read a LASA `.sav` file, identify wave/file code, and apply database-backed labels |
| [`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md) | Apply the same LASA labelling engine to an existing data frame |
| [`lasa_label_report()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_report.md) | Inspect the full matching audit or only entries requiring attention |
| [`lasa_label_db()`](https://highmeadows.github.io/CleanLASA/reference/lasa_label_db.md) | Inspect the active bundled + user-local label metadata database |
| [`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md) | Add or correct metadata in a persistent manual override layer |
| [`restore_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/restore_lasa_labels.md) | Undo manual corrections (entirely, or scoped) and/or rebuild the local database cache from the bundled one |

Together, these functions make LASA’s own documentation part of your R
workflow: topics and source documents stay easy to find, imported
variables keep their documented meaning, every transformation stays
auditable, and the metadata layer can be refreshed without you having to
maintain separate labelling code for every file.
