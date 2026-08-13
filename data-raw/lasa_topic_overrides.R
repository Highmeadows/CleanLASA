## Curated corrections to the LASA topic table.
##
## `lasa_topics()` builds its table dynamically from the live LASA site
## (see `.lasa_topic_index()` in R/lasa_topics.R), and that scraper handles
## the large majority of rows correctly on its own - including compound
## labels like "Self-report of chronic diseases - tel. proxy" that need to
## be split apart per file code. But a smaller number of rows need
## information that simply is not present in the compact topic-table text
## at all: it lives in a file code's own variable-information PDF, in its
## dedicated topic page's prose, or in Bram's own domain knowledge of the
## LASA data collection. No scraper can derive those from the table alone,
## so they are recorded here instead, each with a one-line source note.
##
## This override table is applied once, after the live table is built (or
## loaded from cache), inside `.lasa_apply_topic_overrides()`. It is
## intentionally NOT part of the live-scrape/refresh cycle: refreshing
## picks up new waves, new file codes, and corrected file codes on the
## live site, while this table corrects the *labels* for a specific,
## known set of rows regardless of when the surrounding scrape happened.
##
## To add a correction: add one row below with the file code, theme,
## subtheme, and (if the same file code appears more than once in that
## theme/subtheme - LASA does reuse file codes across topics) enough of
## the *current, auto-derived* topic text in `old_topic_contains` to
## identify the right one, plus the corrected topic and a source note.
## Then re-run this script to rebuild R/sysdata.rda.

lasa_topic_overrides <- data.frame(
  filecode = character(), theme = character(), subtheme = character(),
  old_topic_contains = character(), new_topic = character(),
  new_filecode_type = character(), source = character(),
  stringsAsFactors = FALSE
)

add_override <- function(filecode, theme, subtheme = NA_character_,
                         old_topic_contains = NA_character_, new_topic,
                         new_filecode_type = NA_character_, source) {
  lasa_topic_overrides <<- rbind(lasa_topic_overrides, data.frame(
    filecode = filecode, theme = theme, subtheme = subtheme,
    old_topic_contains = old_topic_contains, new_topic = new_topic,
    new_filecode_type = new_filecode_type, source = source,
    stringsAsFactors = FALSE
  ))
}

## ---- Biomaterial: Blood collection (line-break-separated topics) ----
add_override("850", "Biomaterial", new_topic =
               "Blood collection and overview (routine) measurements",
             source = "Bram: the site line-breaks this into two separate topics")
add_override("851", "Biomaterial", new_topic =
               "Response blood sampling / DNA Date blood sampling",
             source = "Bram: the site line-breaks this into two separate topics. The general line-break splitter recovers the segments but (like the dash splitter) prefixes modifiers with the base topic, which is wrong here since these are two independent topics, not a base + qualifier - hence the explicit override.")

## ---- Biomaterial: Cortisol (verified via LASA880_881_882_varinfo.pdf) ----
add_override("880", "Biomaterial", new_topic =
               "Cortisol (total plasma cortisol, corticosteroid binding globuline, salivary cortisol) - Salivary cortisol (non)response",
             source = "Verified via LASA880_881_882_varinfo.pdf and the Cortisol topic page")
add_override("881", "Biomaterial", new_topic =
               "Cortisol (total plasma cortisol, corticosteroid binding globuline, salivary cortisol) - Salivary cortisol, moment of day",
             source = "Verified via LASA880_881_882_varinfo.pdf")
add_override("882", "Biomaterial", new_topic =
               "Cortisol (total plasma cortisol, corticosteroid binding globuline, salivary cortisol) - Salivary cortisol, moment of day (constructed)",
             source = "Verified via LASA880_881_882_varinfo.pdf")
add_override("864", "Biomaterial", new_topic =
               "Cortisol (total plasma cortisol, corticosteroid binding globuline, salivary cortisol) - plasma / serum cortisol",
             source = "Bram confirmed 864 is the plasma/serum measurement")

## ---- Biomaterial: DXA (verified via DXA topic page, Table 1) ----
add_override("o41", "Biomaterial", new_topic = "DXA (LASA ancillary study) - Hip / lumbar spine scan",
             source = "Verified via DXA topic page (Table 1)")
add_override("o42", "Biomaterial", new_topic = "DXA (LASA ancillary study) - Whole body scan",
             source = "Verified via DXA topic page (Table 1)")

## ---- Biomaterial: Genetic polymorphisms (verified via topic page) ----
add_override("872", "Biomaterial", new_topic =
               "Genetic polymorphisms (VDR, GR, etc) - Vitamin D Receptor (VDR) SNPs and haplotypes",
             source = "Verified via Genetic polymorphisms topic page")
add_override("873", "Biomaterial", new_topic =
               "Genetic polymorphisms (VDR, GR, etc) - Glucocorticoid Receptor (GR) SNPs and haplotypes",
             source = "Verified via Genetic polymorphisms topic page")

## ---- Biomaterial: single-file rows collapse to the base topic ----
add_override("861", "Biomaterial", new_topic = "Inflammation factors",
             source = "Bram: only one filecode for this row, so drop the sub-topic list")
add_override("870", "Biomaterial", new_topic = "Apolipoprotein E (ApoE)",
             source = "Same rule as Inflammation factors (861): one filecode, sub-topic list dropped")
add_override("868", "Biomaterial", new_topic = "Plasma markers of Alzheimer's Disease",
             source = "Bram: this and 878 are two different topics, not one combined description")
add_override("878", "Biomaterial", new_topic = "Plasma markers of endothelial dysfunction",
             source = "Bram: this and 868 are two different topics, not one combined description")

## ---- Care: Needs assessment (Bram's specific per-code wording) ----
add_override("189", "Care", "Needs assessment", new_topic = "Needs assessment - medical care indication",
             source = "Bram")
add_override("177", "Care", "Needs assessment", new_topic = "Needs assessment - Use WVG facilities",
             source = "Bram")
add_override("178", "Care", "Needs assessment", new_topic =
               "Needs assessment - Contact with WMO and application for facilities", source = "Bram")
add_override("610", "Care", "Needs assessment", new_topic =
               "Needs assessment - Medical indication and facilities (tel. proxy)", source = "Bram")
add_override("710", "Care", "Needs assessment", new_topic =
               "Needs assessment - Medical indication and facilities (tel. respondent)", source = "Bram")
add_override("611", "Care", "Needs assessment", new_topic =
               "Needs assessment - Use WVG facilities (tel. proxy)", source = "Bram")
add_override("711", "Care", "Needs assessment", new_topic =
               "Needs assessment - Use WVG facilities (tel. respondent)", source = "Bram")

## ---- Physical: Functional limitations (ADL) / Partner relationship ----
## This row links four separate topic pages in one cell (semicolon-joined),
## the first of which has its own further compound label - too irregular
## for the general multi-link/dash algorithm to resolve safely.
add_override("030", "Physical", "Physical functioning", new_topic = "Funct. limitations (ADL)",
             source = "Verified via Functional limitations topic page")
add_override("230", "Physical", "Physical functioning", new_topic =
               "Funct. limitations (ADL) - constructed (sum scores)",
             source = "Verified via topic page ('Sum scores: LASA230...')")
add_override("603", "Physical", "Physical functioning", new_topic = "Funct. limitations (ADL) - tel. proxy",
             source = "Verified via topic page")
add_override("703", "Physical", "Physical functioning", old_topic_contains = "Funct. limitations",
             new_topic = "Funct. limitations (ADL) - tel. respondent", source = "Verified via topic page")
add_override("183", "Physical", "Physical functioning", new_topic =
               "Funct. limitations (ADL) - limitations in joint mobility (medical interview)",
             source = "Verified via topic page ('mlimshelf-mlimrun in LASAC183...')")
add_override("139", "Physical", "Physical functioning", new_topic = "Partner relationship",
             source = "139 is its own topic (Partner relationship), not a Functional-limitations sub-file - verified via Partner relationship topic page")

## ---- Demographics: Income (Bram's specific wording) ----
add_override("017", "Demographics", "Socio-economic status",
             old_topic_contains = "Income; - Income specification",
             new_topic = "Income", source = "Verified via Income and wealth / SES topic pages")
add_override("217", "Demographics", "Socio-economic status",
             old_topic_contains = "Income; - Income specification",
             new_topic = "Income - Income specification (wave B only)",
             source = "Verified via SES topic page ('Income specification: LASAB217')")

## ---- Demographics: Marital and partner status (Migrant Cohort file) ----
add_override("mb010", "Demographics", "Living arrangements", new_topic =
               "Marital and partner status (Migrant Cohort baseline)",
             source = "Verified via project's own LASAz010_varinfo.pdf (LASMB010 section)")

## ---- Emotional: Orthodoxy vs. Salience of religion share filecode 238 ----
add_override("238", "Emotional", "Religiousness",
             old_topic_contains = "Orthodoxy (Main int.) - scaled Orthodoxy (Self-adm. quest.)",
             new_topic = "Orthodoxy (Self-adm. quest.)", source = "Bram")
add_override("338", "Emotional", "Religiousness", new_topic = "Orthodoxy (Self-adm. quest.) - scaled",
             source = "Bram")
add_override("038", "Emotional", "Religiousness", old_topic_contains = "Salience of religion",
             new_topic = "Salience of religion",
             source = "Bram: Salience of religion cross-references other topics' filecodes")
add_override("238", "Emotional", "Religiousness", old_topic_contains = "Salience of religion",
             new_topic = "Salience of religion - scaled", source = "Bram")

## ---- Emotional: (Negative) life events is 'main' despite the 2xx prefix ----
add_override("272", "Emotional", "Stress and stressors", new_topic = "(Negative) life events",
             new_filecode_type = "main",
             source = "Bram: exception to the numbering convention - this is a main file")

## ---- Physical: Anthropometry sub-measures relabelled/swapped ----
add_override("171", "Physical", "Body composition", new_topic = "Anthropometry - Calf measurement",
             source = "Bram corrected this from 'Weight and height' to 'Calf measurement'")
add_override("185", "Physical", "Body composition",
             new_topic = "Anthropometry - Ankle, Knee and Pulse width",
             source = "Bram corrected this from 'Calf measurement' to 'Ankle, Knee and Pulse width'")
## Filecode 161 itself is repurposed by wave (Weight and height for B-MB,
## then Calf measurement for I-K) - handled separately as a wave-split,
## see `.lasa_apply_wave_splits()` below, not as a simple relabel.

## ---- Physical: Fractures ----
add_override("ZFF1", "Physical", "Fractures", new_topic = "Fractures - total waves B-E",
             source = "Bram confirmed this simpler label")
add_override("186", "Physical", "Fractures", new_topic = "Fractures",
             source = "Verified via Fractures topic page")
add_override("605", "Physical", "Fractures", new_topic = "Fractures - tel. proxy",
             source = "Verified via Fractures topic page")
add_override("705", "Physical", "Fractures", new_topic = "Fractures - tel. respondent",
             source = "Verified via Fractures topic page")

## ---- Physical: Diet and food consumption (four topics share one row) ----
add_override("118", "Physical", "Lifestyle", new_topic = "Diet and food consumption",
             source = "Row links four topics sharing two filecodes; simplified to the base topic - LOW CONFIDENCE, not independently verified")
add_override("184", "Physical", "Lifestyle", new_topic = "Diet and food consumption",
             source = "See filecode 118 - LOW CONFIDENCE, not independently verified")

## ---- Physical: Osteoarthritis (cohort-specific algorithm files) ----
add_override("zoa1", "Physical", "Chronic diseases",
             new_topic = "Osteoarthritis hip and knee (algorithm) - cohort 1", source = "Bram")
add_override("zoa2", "Physical", "Chronic diseases",
             new_topic = "Osteoarthritis hip and knee (algorithm) - cohort 2", source = "Bram")
add_override("zoa3", "Physical", "Chronic diseases",
             new_topic = "Osteoarthritis hip and knee (algorithm) - cohort 3", source = "Bram")

## ---- Physical: Hearing SNT (Bram's specific wording) ----
add_override("193", "Physical", "Perception: Hearing", new_topic = "Hearing: SNT technical measures",
             source = "Bram")
add_override("194", "Physical", "Perception: Hearing", new_topic = "Hearing: SNT questionnaire",
             source = "Bram")

## ---- Social: Need for affiliation / Housing / Loneliness / Vignettes ----
add_override("014", "Social", "Housing", old_topic_contains = "Housing characteristics; Adaptations in the house",
             new_topic = "Housing characteristics and adaptations", source = "Bram")
add_override("601", "Social", "Housing", old_topic_contains = "Housing characteristics; Adaptations in the house",
             new_topic = "Housing characteristics - tel. proxy", source = "Bram")
add_override("701", "Social", "Housing", old_topic_contains = "Housing characteristics; Adaptations in the house",
             new_topic = "Housing characteristics - tel. respondent", source = "Bram")
add_override("015", "Social", "Housing", old_topic_contains = "Housing characteristics; Adaptations in the house",
             new_topic = "House ownership", source = "Bram")

add_override("073", "Social", "Loneliness", new_topic = "Loneliness", source = "Bram")
add_override("273", "Social", "Loneliness", new_topic = "Loneliness - scaled", source = "Bram")
add_override("712", "Social", "Loneliness", new_topic = "Loneliness - tel. respondent", source = "Bram")
add_override("173", "Social", "Loneliness", new_topic = "Existential loneliness", source = "Bram")

add_override("074", "Social", "Relationships between generations", new_topic = "Vignettes about help",
             source = "Bram")
add_override("274", "Social", "Relationships between generations", new_topic =
               "Vignettes about help - total scores", source = "Bram")

## ---- Housing / Neighborhood: '015z' is a scraping artifact, not a real
## filecode - handled as an alias merge, not a simple relabel, see
## `.lasa_apply_code_aliases()` below.

## ==================================================================
## Alias merges: a malformed filecode found under one theme/subtheme
## should be merged into a *different, already-correct* filecode's row
## (its waves added there), rather than kept as its own row. Unlike the
## relabels above, these change which row a set of waves belongs to.
## ==================================================================
lasa_topic_code_aliases <- data.frame(
  alias_filecode = c("015z"),
  alias_theme = c("Social"),
  alias_subtheme = c("Housing"),
  canonical_filecode = c("015"),
  canonical_old_topic_contains = c("Neighborhood characteristics"),
  source = c("Bram: '015z' for wave K does not exist - reading/retrieval error, should be 015"),
  stringsAsFactors = FALSE
)

## ==================================================================
## Wave splits: a single filecode is reused for a *different* topic at
## different waves (not merely a different theme/subtheme - the LASA
## table shows it as one row). Each entry replaces the matched row with
## two rows: the given waves get `topic_for_matched_waves`, everything
## else keeps the row's existing topic.
## ==================================================================
lasa_topic_wave_splits <- data.frame(
  filecode = c("161"),
  theme = c("Physical"),
  subtheme = c("Body composition"),
  waves_for_first = c("I, J, K"),
  topic_for_first = c("Anthropometry - Calf measurement"),
  topic_for_rest = c("Anthropometry - Weight and height"),
  source = c("Bram: filecode 161 covers Weight and height for waves B-MB, then is repurposed for Calf measurement at waves I-K"),
  stringsAsFactors = FALSE
)

usethis::use_data(
  lasa_topic_overrides, lasa_topic_code_aliases, lasa_topic_wave_splits,
  internal = TRUE, overwrite = TRUE
)
