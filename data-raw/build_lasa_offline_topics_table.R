## Builds the offline filecode<->varinfo-PDF manifest used as a fallback by
## `.lasa_resolve_varinfo_url()` (R/lasa_varinfo_resolve.R) when the live
## LASA topic table (lasa-vu.nl) cannot be reached, and as the grouping
## input for `data-raw/build_lasa_label_db.R`'s bootstrap of `lasa_label_db`.
##
## Source: `data-raw/lasa_topics_table.csv`, a maintained, independently
## updatable snapshot of the filecode/theme/subtheme/wave/varinfo-file
## table (moved here from the package's former `codebook/` folder, which
## held disposable bootstrap PDFs only). Refresh that CSV by hand (or from
## a fresh live scrape) when LASA adds/renames file codes, then re-run this
## script to rebuild R/sysdata.rda.
##
## IMPORTANT: `usethis::use_data(internal = TRUE)` replaces the *entire*
## R/sysdata.rda with exactly the objects named in its call -- this script
## therefore loads the existing sysdata objects first (built by
## `lasa_topic_overrides.R`) so re-running it doesn't silently drop them.
## The reverse is equally true: re-running `lasa_topic_overrides.R` alone
## would drop `lasa_offline_topics_table` unless that script is kept in
## sync the same way. Whichever of these two scripts you edit, re-run both
## (in either order) before committing R/sysdata.rda.

.sysdata_env <- new.env()
if (file.exists("R/sysdata.rda")) {
  load("R/sysdata.rda", envir = .sysdata_env)
}

lasa_offline_topics_table <- read.csv(
  "data-raw/lasa_topics_table.csv",
  stringsAsFactors = FALSE
)
.sysdata_env$lasa_offline_topics_table <- lasa_offline_topics_table

for (nm in ls(.sysdata_env)) assign(nm, get(nm, envir = .sysdata_env))

usethis::use_data(
  lasa_offline_topics_table, lasa_topic_overrides, lasa_topic_code_aliases, lasa_topic_wave_splits,
  internal = TRUE, overwrite = TRUE
)

rm(.sysdata_env)
