# Search the LASA topic table

Searches the package's bundled LASA topic database and returns topics,
file codes, and available waves. This table is hand-maintained (see
`data-raw/lasa_topic_database.R` in the package source) rather than
scraped, so it updates only when the package itself does. To get the
linked variable-information PDF for a topic or file code – resolved live
from the LASA website – use
[`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md).

## Usage

``` r
lasa_topics(
  topic = "all",
  theme = NULL,
  fuzzy_match = TRUE,
  max_edit_distance = 2L
)
```

## Arguments

- topic:

  A topic search term, or a LASA file code such as `"011"` or
  `"LASA011"`. Use `"all"` (the default) to return every topic,
  optionally within the selected `theme` or subtheme.

- theme:

  An optional theme or subtheme search term, such as `"cognitive"` or
  `"memory"`.

- fuzzy_match:

  Logical. If `TRUE`, allow fuzzy matching.

- max_edit_distance:

  Maximum edit distance used for fuzzy matching.

## Value

A data frame with one row per topic and file-code combination. It
contains `theme`, `subtheme`, `topic`, `filecode`, `waves`, and
`has_varinfo`, which indicates whether a variable-information PDF is
linked for that row; use
[`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md)
to get or open it.

## Details

Topic, theme, and subtheme matching is case-insensitive. Incomplete
names and small typographical errors are accepted when
`fuzzy_match = TRUE`. Supplying `theme` searches both the main LASA
themes and their subthemes.

`topic` also accepts a LASA file code (such as `"011"` or `"LASA011"`),
matched the same way `filecode` is in
[`lasa_var_info()`](https://highmeadows.github.io/CleanLASA/reference/lasa_var_info.md);
a file-code match takes precedence over topic-text search. A 3-digit
numeric file code also matches its processed/scaled variants – other
3-digit file codes sharing the same final two digits (e.g. `"045"` also
returns the `"245"` row) – since LASA commonly reuses a base code's last
two digits with a different leading digit to mark a computed/processed
variant of the same underlying topic.

A topic with no file code yet (e.g. a planned but not-yet-released
measure), or a file code with no linked variable-information PDF, is
still included in the result – `filecode` is `NA` and/or `has_varinfo`
is `FALSE` for that row, rather than the row being dropped.

To add a new topic or file code to this table, or to update which waves
an existing file code is available in (e.g. a newly released wave), edit
`data-raw/lasa_topic_database.R` directly and re-run it.

## Examples

``` r
lasa_topics()
#>            theme                          subtheme
#> 1    Biomaterial                              <NA>
#> 2    Biomaterial                              <NA>
#> 3    Biomaterial                              <NA>
#> 4    Biomaterial                              <NA>
#> 5    Biomaterial                              <NA>
#> 6    Biomaterial                              <NA>
#> 7    Biomaterial                              <NA>
#> 8    Biomaterial                              <NA>
#> 9    Biomaterial                              <NA>
#> 10   Biomaterial                              <NA>
#> 11   Biomaterial                              <NA>
#> 12   Biomaterial                              <NA>
#> 13   Biomaterial                              <NA>
#> 14   Biomaterial                              <NA>
#> 15   Biomaterial                              <NA>
#> 16   Biomaterial                              <NA>
#> 17   Biomaterial                              <NA>
#> 18   Biomaterial                              <NA>
#> 19   Biomaterial                              <NA>
#> 20   Biomaterial                              <NA>
#> 21   Biomaterial                              <NA>
#> 22   Biomaterial                              <NA>
#> 23   Biomaterial                              <NA>
#> 24   Biomaterial                              <NA>
#> 25   Biomaterial                              <NA>
#> 26          Care        Adaptations and facilities
#> 27          Care        Adaptations and facilities
#> 28          Care             Contact with services
#> 29          Care             Contact with services
#> 30          Care             Contact with services
#> 31          Care             Contact with services
#> 32          Care             Contact with services
#> 33          Care             Contact with services
#> 34          Care             Contact with services
#> 35          Care             Contact with services
#> 36          Care  End of life care and preferences
#> 37          Care  End of life care and preferences
#> 38          Care  End of life care and preferences
#> 39          Care  End of life care and preferences
#> 40          Care  End of life care and preferences
#> 41          Care  End of life care and preferences
#> 42          Care  End of life care and preferences
#> 43          Care  End of life care and preferences
#> 44          Care  End of life care and preferences
#> 45          Care  End of life care and preferences
#> 46          Care                  Needs assessment
#> 47          Care                  Needs assessment
#> 48          Care                  Needs assessment
#> 49          Care                  Needs assessment
#> 50          Care                  Needs assessment
#> 51          Care                  Needs assessment
#> 52          Care                  Needs assessment
#> 53          Care                    Providing care
#> 54          Care                    Providing care
#> 55          Care                       Use of care
#> 56          Care                       Use of care
#> 57          Care                       Use of care
#> 58          Care                       Use of care
#> 59          Care                       Use of care
#> 60          Care                       Use of care
#> 61          Care                       Use of care
#> 62          Care                       Use of care
#> 63          Care                       Use of care
#> 64          Care                       Use of care
#> 65          Care                       Use of care
#> 66          Care                       Use of care
#> 67          Care                       Use of care
#> 68          Care                       Use of care
#> 69          Care                       Use of care
#> 70          Care                       Use of care
#> 71          Care                       Use of care
#> 72          Care                       Use of care
#> 73          Care                              <NA>
#> 74          Care                              <NA>
#> 75          Care                              <NA>
#> 76          Care                              <NA>
#> 77          Care                              <NA>
#> 78          Care                              <NA>
#> 79          Care                              <NA>
#> 80     Cognitive                          Dementia
#> 81     Cognitive                          Dementia
#> 82     Cognitive                          Dementia
#> 83     Cognitive                          Dementia
#> 84     Cognitive             Executive functioning
#> 85     Cognitive             Executive functioning
#> 86     Cognitive             Executive functioning
#> 87     Cognitive             Executive functioning
#> 88     Cognitive        Intelligence and cognition
#> 89     Cognitive        Intelligence and cognition
#> 90     Cognitive        Intelligence and cognition
#> 91     Cognitive        Intelligence and cognition
#> 92     Cognitive        Intelligence and cognition
#> 93     Cognitive        Intelligence and cognition
#> 94     Cognitive        Intelligence and cognition
#> 95     Cognitive        Intelligence and cognition
#> 96     Cognitive        Intelligence and cognition
#> 97     Cognitive        Intelligence and cognition
#> 98     Cognitive        Intelligence and cognition
#> 99     Cognitive        Intelligence and cognition
#> 100    Cognitive        Intelligence and cognition
#> 101    Cognitive        Intelligence and cognition
#> 102    Cognitive        Intelligence and cognition
#> 103    Cognitive        Intelligence and cognition
#> 104    Cognitive                            Memory
#> 105    Cognitive                            Memory
#> 106    Cognitive                            Memory
#> 107    Cognitive                            Memory
#> 108    Cognitive                            Memory
#> 109    Cognitive                            Memory
#> 110    Cognitive                            Memory
#> 111    Cognitive                            Memory
#> 112 Demographics                 General variables
#> 113 Demographics                 General variables
#> 114 Demographics                 General variables
#> 115 Demographics                 General variables
#> 116 Demographics                 General variables
#> 117 Demographics                 General variables
#> 118 Demographics                 General variables
#> 119 Demographics                 General variables
#> 120 Demographics                 General variables
#> 121 Demographics                 General variables
#> 122 Demographics                 General variables
#> 123 Demographics                 General variables
#> 124 Demographics                 General variables
#> 125 Demographics                 General variables
#> 126 Demographics                         Geography
#> 127 Demographics                         Geography
#> 128 Demographics                         Geography
#> 129 Demographics               Living arrangements
#> 130 Demographics               Living arrangements
#> 131 Demographics               Living arrangements
#> 132 Demographics               Living arrangements
#> 133 Demographics               Living arrangements
#> 134 Demographics               Living arrangements
#> 135 Demographics                         Mortality
#> 136 Demographics                         Mortality
#> 137 Demographics                         Mortality
#> 138 Demographics                          Religion
#> 139 Demographics                          Religion
#> 140 Demographics                          Religion
#> 141 Demographics                          Religion
#> 142 Demographics             Socio-economic status
#> 143 Demographics             Socio-economic status
#> 144 Demographics             Socio-economic status
#> 145 Demographics             Socio-economic status
#> 146 Demographics             Socio-economic status
#> 147 Demographics             Socio-economic status
#> 148 Demographics             Socio-economic status
#> 149 Demographics             Socio-economic status
#> 150 Demographics             Socio-economic status
#> 151    Emotional                    (In)dependence
#> 152    Emotional                              ADHD
#> 153    Emotional                              ADHD
#> 154    Emotional                           Anxiety
#> 155    Emotional                           Anxiety
#> 156    Emotional                           Anxiety
#> 157    Emotional                           Anxiety
#> 158    Emotional                           Anxiety
#> 159    Emotional                        Depression
#> 160    Emotional                        Depression
#> 161    Emotional                        Depression
#> 162    Emotional                        Depression
#> 163    Emotional                        Depression
#> 164    Emotional                        Depression
#> 165    Emotional                        Depression
#> 166    Emotional                        Depression
#> 167    Emotional                Evaluation of life
#> 168    Emotional                Evaluation of life
#> 169    Emotional                Evaluation of life
#> 170    Emotional                Evaluation of life
#> 171    Emotional                Evaluation of life
#> 172    Emotional                Evaluation of life
#> 173    Emotional                Evaluation of life
#> 174    Emotional                Personality traits
#> 175    Emotional                Personality traits
#> 176    Emotional                Personality traits
#> 177    Emotional                Personality traits
#> 178    Emotional                Personality traits
#> 179    Emotional                Personality traits
#> 180    Emotional                Personality traits
#> 181    Emotional                Personality traits
#> 182    Emotional                Personality traits
#> 183    Emotional                Personality traits
#> 184    Emotional                Personality traits
#> 185    Emotional                Personality traits
#> 186    Emotional                Personality traits
#> 187    Emotional                Personality traits
#> 188    Emotional                     Religiousness
#> 189    Emotional                     Religiousness
#> 190    Emotional                     Religiousness
#> 191    Emotional                     Religiousness
#> 192    Emotional                     Religiousness
#> 193    Emotional                     Religiousness
#> 194    Emotional                     Religiousness
#> 195    Emotional                     Religiousness
#> 196    Emotional                     Religiousness
#> 197    Emotional                     Religiousness
#> 198    Emotional                     Religiousness
#> 199    Emotional                     Religiousness
#> 200    Emotional                     Religiousness
#> 201    Emotional                         Sexuality
#> 202    Emotional                         Sexuality
#> 203    Emotional                 Singing and music
#> 204    Emotional                             Sleep
#> 205    Emotional                             Sleep
#> 206    Emotional              Stress and stressors
#> 207    Emotional              Stress and stressors
#> 208    Emotional              Stress and stressors
#> 209    Emotional                    Subjective age
#> 210    Emotional                    Subjective age
#> 211    Emotional                    Subjective age
#> 212    Emotional                    Subjective age
#> 213    Emotional                          Worrying
#> 214    Emotional                          Worrying
#> 215     Physical                    Blood pressure
#> 216     Physical                  Body composition
#> 217     Physical                  Body composition
#> 218     Physical                  Body composition
#> 219     Physical                  Body composition
#> 220     Physical                  Body composition
#> 221     Physical                  Body composition
#> 222     Physical                  Body composition
#> 223     Physical                  Body composition
#> 224     Physical                  Body composition
#> 225     Physical                  Body composition
#> 226     Physical                  Body composition
#> 227     Physical                  Body composition
#> 228     Physical                  Chronic diseases
#> 229     Physical                  Chronic diseases
#> 230     Physical                  Chronic diseases
#> 231     Physical                  Chronic diseases
#> 232     Physical                  Chronic diseases
#> 233     Physical                  Chronic diseases
#> 234     Physical                  Chronic diseases
#> 235     Physical                  Chronic diseases
#> 236     Physical                  Chronic diseases
#> 237     Physical                  Chronic diseases
#> 238     Physical                  Chronic diseases
#> 239     Physical                  Chronic diseases
#> 240     Physical                  Chronic diseases
#> 241     Physical                  Chronic diseases
#> 242     Physical                  Chronic diseases
#> 243     Physical                  Chronic diseases
#> 244     Physical                  Chronic diseases
#> 245     Physical                  Chronic diseases
#> 246     Physical                  Chronic diseases
#> 247     Physical                  Chronic diseases
#> 248     Physical                  Chronic diseases
#> 249     Physical                  Chronic diseases
#> 250     Physical                  Chronic diseases
#> 251     Physical                  Chronic diseases
#> 252     Physical                           Falling
#> 253     Physical                           Falling
#> 254     Physical                           Falling
#> 255     Physical                           Falling
#> 256     Physical                           Falling
#> 257     Physical                           Falling
#> 258     Physical                           Falling
#> 259     Physical                           Falling
#> 260     Physical                           Falling
#> 261     Physical                           Falling
#> 262     Physical                           Falling
#> 263     Physical                           Falling
#> 264     Physical                         Fertility
#> 265     Physical                         Fertility
#> 266     Physical                         Fractures
#> 267     Physical                         Fractures
#> 268     Physical                         Fractures
#> 269     Physical                         Fractures
#> 270     Physical                         Fractures
#> 271     Physical                         Fractures
#> 272     Physical                           Frailty
#> 273     Physical                         Lifestyle
#> 274     Physical                         Lifestyle
#> 275     Physical                         Lifestyle
#> 276     Physical                         Lifestyle
#> 277     Physical                         Lifestyle
#> 278     Physical                         Lifestyle
#> 279     Physical                         Lifestyle
#> 280     Physical                         Lifestyle
#> 281     Physical                         Lifestyle
#> 282     Physical                         Lifestyle
#> 283     Physical                         Lifestyle
#> 284     Physical                         Lifestyle
#> 285     Physical                         Lifestyle
#> 286     Physical                         Lifestyle
#> 287     Physical                         Lifestyle
#> 288     Physical                         Lifestyle
#> 289     Physical                         Lifestyle
#> 290     Physical                         Lifestyle
#> 291     Physical           Medication/ supplements
#> 292     Physical           Medication/ supplements
#> 293     Physical           Medication/ supplements
#> 294     Physical           Medication/ supplements
#> 295     Physical                              Pain
#> 296     Physical                              Pain
#> 297     Physical                              Pain
#> 298     Physical                              Pain
#> 299     Physical               Perception: Hearing
#> 300     Physical               Perception: Hearing
#> 301     Physical               Perception: Hearing
#> 302     Physical               Perception: Hearing
#> 303     Physical               Perception: Hearing
#> 304     Physical               Perception: Hearing
#> 305     Physical                Perception: Vision
#> 306     Physical                Perception: Vision
#> 307     Physical                Perception: Vision
#> 308     Physical                Perception: Vision
#> 309     Physical                Perception: Vision
#> 310     Physical                Perception: Vision
#> 311     Physical                Perception: Vision
#> 312     Physical                 Perception: smell
#> 313     Physical                 Perception: smell
#> 314     Physical                 Perception: smell
#> 315     Physical              Physical functioning
#> 316     Physical              Physical functioning
#> 317     Physical              Physical functioning
#> 318     Physical              Physical functioning
#> 319     Physical              Physical functioning
#> 320     Physical              Physical functioning
#> 321     Physical              Physical functioning
#> 322     Physical              Physical functioning
#> 323     Physical              Physical functioning
#> 324     Physical              Physical functioning
#> 325     Physical              Physical functioning
#> 326     Physical              Physical functioning
#> 327     Physical                   Quality of life
#> 328     Physical                   Quality of life
#> 329     Physical                   Quality of life
#> 330     Physical                   Quality of life
#> 331     Physical                   Quality of life
#> 332     Physical                   Quality of life
#> 333     Physical                   Quality of life
#> 334     Physical                   Quality of life
#> 335     Physical                   Quality of life
#> 336     Physical                   Quality of life
#> 337     Physical                   Quality of life
#> 338     Physical                   Quality of life
#> 339     Physical                   Quality of life
#> 340     Physical                   Quality of life
#> 341       Social                       Affiliation
#> 342       Social                       Affiliation
#> 343       Social                       Affiliation
#> 344       Social                       Affiliation
#> 345       Social                           Housing
#> 346       Social                           Housing
#> 347       Social                           Housing
#> 348       Social                           Housing
#> 349       Social                           Housing
#> 350       Social                           Housing
#> 351       Social                           Housing
#> 352       Social                           Housing
#> 353       Social                           Housing
#> 354       Social                           Housing
#> 355       Social                           Housing
#> 356       Social                           Housing
#> 357       Social                           Housing
#> 358       Social                           Housing
#> 359       Social                        Loneliness
#> 360       Social                        Loneliness
#> 361       Social                        Loneliness
#> 362       Social                        Loneliness
#> 363       Social              Partner relationship
#> 364       Social Relationships between generations
#> 365       Social Relationships between generations
#> 366       Social Relationships between generations
#> 367       Social Relationships between generations
#> 368       Social Relationships between generations
#> 369       Social Relationships between generations
#> 370       Social Relationships between generations
#> 371       Social Relationships between generations
#> 372       Social                    Social network
#> 373       Social                    Social network
#> 374       Social                    Social network
#> 375       Social                      Social norms
#> 376       Social                      Social norms
#> 377       Social                      Social norms
#> 378       Social                      Social norms
#> 379       Social                      Social norms
#> 380       Social                      Social norms
#> 381       Social                      Social norms
#> 382       Social              Social participation
#> 383       Social              Social participation
#> 384       Social              Social participation
#> 385         Work                              <NA>
#> 386         Work                              <NA>
#> 387         Work                              <NA>
#> 388         Work                              <NA>
#> 389         Work                              <NA>
#>                                                                                                                                      topic
#> 1                                                                                                          Adiponectin, leptin and ghrelin
#> 2                                                                                                                  Apolipoprotein E (ApoE)
#> 3                                                                                     Blood collection and overview (routine) measurements
#> 4                                                                                                  Bone-related hormones and bone turnover
#> 5                                                                                     COLIA1 (Collagen type I α1 Sp1 polymorphism in LASA)
#> 6                                                                                               Cholesterol, triglycerides and fructosamin
#> 7                  Cortisol (total plasma cortisol, corticosteroid binding globuline, salivary cortisol) - Salivary cortisol (non)response
#> 8                 Cortisol (total plasma cortisol, corticosteroid binding globuline, salivary cortisol) - Salivary cortisol, moment of day
#> 9   Cortisol (total plasma cortisol, corticosteroid binding globuline, salivary cortisol) - Salivary cortisol, moment of day (constructed)
#> 10                         Cortisol (total plasma cortisol, corticosteroid binding globuline, salivary cortisol) - plasma / serum cortisol
#> 11                                                                                                                              Exome Chip
#> 12                                                                                                                               GWAS data
#> 13                                                 Genetic polymorphisms (VDR, GR, etc) - Glucocorticoid Receptor (GR) SNPs and haplotypes
#> 14                                                     Genetic polymorphisms (VDR, GR, etc) - Vitamin D Receptor (VDR) SNPs and haplotypes
#> 15                                                                                                    Hair cortisol (LASA ancillary study)
#> 16                                                                                                          Homocysteine, vitamin B12, MMA
#> 17                                                                                                                    Inflammation factors
#> 18                                                                                                   Plasma markers of Alzheimer's Disease
#> 19                                                                                               Plasma markers of endothelial dysfunction
#> 20                                                                                       Response blood sampling / DNA Date blood sampling
#> 21                                                                                          Routine measurements (Albumin and cholesterol)
#> 22                                                                      Serum 25-hydroxy-vitamin D (25(OH)D) and parathyroid hormone (PTH)
#> 23                                                                                                                            Sex hormones
#> 24                                                                                                                        Thyroid function
#> 25                                                                                                                        Vitamin K status
#> 26                                                                                                                Adaptations in the house
#> 27                                                                                                  Use of assistive devices or assistence
#> 28                                                                                                                       Care and contacts
#> 29                                                                                                 Contact with health and social services
#> 30                                                                                                        Health care in country of origin
#> 31                                                                                                                      Hospital admission
#> 32                                                                                                         Hospital admission - tel. proxy
#> 33                                                                                                    Hospital admission - tel. respondent
#> 34                                                                               Outpatient contact with medical specialists last 6 months
#> 35                                                 Outpatient contact with medical specialists last 6 months - specification of specialist
#> 36                                                                                                             Advance Care Planning (ACP)
#> 37                                                                                                                      Advance Directives
#> 38                                                                                                                      Advance Directives
#> 39                                                                                                    Advance Directives - tel. respondent
#> 40                                                                                                             Decisions in eol situations
#> 41                                                                        End-of-life care: interviews with proxies (LASA ancillary study)
#> 42                                                                                                Feelings and wishes about life and death
#> 43                                                                                                      General eol goals; Subj. life exp.
#> 44                                                                                                                             Last wishes
#> 45                                                                                    Opinions about euthanasia and end-of-life (eol) pill
#> 46                                                                      Needs assessment - Contact with WMO and application for facilities
#> 47                                                                       Needs assessment - Medical indication and facilities (tel. proxy)
#> 48                                                                  Needs assessment - Medical indication and facilities (tel. respondent)
#> 49                                                                                                   Needs assessment - Use WVG facilities
#> 50                                                                                      Needs assessment - Use WVG facilities (tel. proxy)
#> 51                                                                                 Needs assessment - Use WVG facilities (tel. respondent)
#> 52                                                                                              Needs assessment - medical care indication
#> 53                                                                                Family caregiving to older adults (LASA ancillary study)
#> 54                                                                                       Providing assistance with personal/household care
#> 55                                                                                                            Aggr. variables care network
#> 56                                                                                                                         Care evaluation
#> 57                                                                                                                           Need for care
#> 58                                                                       Perceived control in health care and scale (LASA ancillary study)
#> 59                                                                                                               Perceived control of care
#> 60                                                                                                                   Personal budget (PGB)
#> 61                                                                                                                  Satisfaction with care
#> 62                                                                                             Transitions in care (LASA ancillary study)*
#> 63                                                                                                                     Use of nursing care
#> 64                                                                                                        Use of nursing care - tel. proxy
#> 65                                                                                                   Use of nursing care - tel. respondent
#> 66                                                                                                          Use of personal/household care
#> 67                                                                                             Use of personal/household care - tel. proxy
#> 68                                                                                        Use of personal/household care - tel. respondent
#> 69                                                                                                  Use of respite care by R (for partner)
#> 70                                                                                                            Use of transport/admin. care
#> 71                                                                                               Use of transport/admin. care - tel. proxy
#> 72                                                                                          Use of transport/admin. care - tel. respondent
#> 73                                                                                                                    Attitudes about care
#> 74                                                                                                                    Attitudes about care
#> 75                                                                                                                    Attitudes about care
#> 76                                                                                                      Filial responsibility expectations
#> 77                                                                                             Filial responsibility expectations - scaled
#> 78                                                                                                                    Vignettes about help
#> 79                                                                                                                    Vignettes about help
#> 80                                                                                                                      Dementia algorithm
#> 81                                                                                                                        Dementia parents
#> 82                                                                                                      Dementia parents - tel. respondent
#> 83                                                                                                                        Dementia partner
#> 84                                                                                                      Executive functioning (Digit span)
#> 85                                                                                                      Executive functioning (Digit span)
#> 86                                                                                                      Executive functioning (Digit span)
#> 87                                                                                                                          Verbal fluency
#> 88                                                                                                       Crystallized intelligence (GIT ©)
#> 89                                                                                        Crystallized intelligence (GIT ©) - total scores
#> 90                                                                                                              Fluid intelligence (RAVEN)
#> 91                                                                                                              Fluid intelligence (RAVEN)
#> 92                                                                                    Fluid intelligence (RAVEN) - scaled Evaluation RAVEN
#> 93                                                                                                                             Head trauma
#> 94                                                                                                                Head trauma - tel. proxy
#> 95                                                                                                           Head trauma - tel. respondent
#> 96                                                                                                                         Health literacy
#> 97                                                                                 Informant Quest. of COgn. DEcline (IQCODE) - tel. proxy
#> 98                                                                            Informant Quest. of COgn. DEcline (IQCODE) - tel. respondent
#> 99                                                                                              Information processing speed (Coding task)
#> 100                                                                                                   Mini-Mental State Examination (MMSE)
#> 101                                                                                     Mini-Mental State Examination (MMSE) - MMSE scaled
#> 102                                                                       Mini-Mental State Examination (MMSE) - MMSE subtraction/spelling
#> 103                                                                                 Mini-Mental State Examination (MMSE) - tel. respondent
#> 104                                                                                                                 Episodic memory (15WT)
#> 105                                                                                                   Episodic memory (15WT) - constructed
#> 106                                                                                                                        Everyday memory
#> 107                                                                                                                      Memory complaints
#> 108                                                                                                    Memory complaints - tel. respondent
#> 109                                                                                                                         Memory partner
#> 110                                                                                                                             Metamemory
#> 111                                                                                                                    Metamemory - scaled
#> 112                                                                                             (Non-)response; more detailed non-response
#> 113                                                                                                                       Age at interview
#> 114                                                                                                                       Age at interview
#> 115                                                                                                                              Education
#> 116                                                                                                                              Education
#> 117                                                                                                                             Ethnicity*
#> 118                                                                                                                             Ethnicity*
#> 119                                                                                                                           Nationality*
#> 120                                                                                                                           Nationality*
#> 121                                                                                                                                    Sex
#> 122                                                                                                                                    Sex
#> 123                                                                                                                   Time of measurement*
#> 124                                                                                                                   Time of measurement*
#> 125                                                                                                                         Weight factors
#> 126                                                                                                         History of domestic addresses*
#> 127                                                                                                                           Urbanization
#> 128                                                                                                                           Urbanization
#> 129                                                                                                                  Household composition
#> 130                                                                                                                Housing characteristics
#> 131                                                                                                             Marital and partner status
#> 132                                                                                   Marital and partner status (Migrant Cohort baseline)
#> 133                                                                                                Marital and partner status - tel. proxy
#> 134                                                                                           Marital and partner status - tel. respondent
#> 135                                                                                                           Mortality and cause of death
#> 136                                                                                               Mortality and cause of death - Specified
#> 137                                                                                                                         Mortality data
#> 138                                                                                                                     Church affiliation
#> 139                                                                                                                     Church affiliation
#> 140                                                                                                                      Church attendance
#> 141                                                                                                                      Church attendance
#> 142                                                                                                                       Health insurance
#> 143                                                                                                                                 Income
#> 144                                                                                            Income - Income specification (wave B only)
#> 145                                                                                                                      Income and wealth
#> 146                                                                                                    Income and wealth - house ownership
#> 147                                                                                                             Income and wealth - income
#> 148                                                                                               Income and wealth - income specification
#> 149                                                                                                            Income decline / evaluation
#> 150                                                                                                                             Occupation
#> 151                                                                                                             Investment in independence
#> 152                                                                                                            ADHD (LASA ancillary study)
#> 153                                                                                              ADHD (LASA ancillary study) - constructed
#> 154                                                                                                                      Anxiety diagnoses
#> 155                                                                                                                       Anxiety symptoms
#> 156                                                                                                              Anxiety symptoms - scaled
#> 157                                                                                                            Posttraumatic stress (PTSD)
#> 158                                                                                                   Posttraumatic stress (PTSD) - scaled
#> 159                                                                                          Depression diagnoses and depression algorithm
#> 160                                                                                                                    Depressive symptoms
#> 161                                                                                                           Depressive symptoms - scaled
#> 162                                                                                                       Depressive symptoms - tel. proxy
#> 163                                                                                                  Depressive symptoms - tel. respondent
#> 164                                                                  Depressive symptoms and food-related behaviour (LASA ancillary study)
#> 165                                                                                                  Lifetime Psychiatric Disorder (LIDAS)
#> 166                                                               Mental health problems and food-related behaviour (LASA ancillary study)
#> 167                                                                                              Awareness of Age-Related Change (AARC-SF)
#> 168                                                                                                                           Generativity
#> 169                                                                                                              Important aspects of life
#> 170                                                                                                   Satisfaction with life and happiness
#> 171                                                                                Satisfaction with life and happiness - 'happiness-line'
#> 172                                                                                                                      Valuation of life
#> 173                                                                                                             Valuation of life - scaled
#> 174                                                                                                          General self-regulation (GSR)
#> 175                                                                                                 General self-regulation (GSR) - scaled
#> 176                                                                                                                                  Humor
#> 177                                                                                                                         Humor - scaled
#> 178                                                                                                                                Mastery
#> 179                                                                                                                       Mastery - scaled
#> 180                                                                                                                           Meta-emotion
#> 181                                                                                                                           Meta-emotion
#> 182                                                                                                        Neuroticism and soc. inadequacy
#> 183                                                                                               Neuroticism and soc. inadequacy - scaled
#> 184                                                                                                                Perceived self-efficacy
#> 185                                                                                                       Perceived self-efficacy - scaled
#> 186                                                                                                                            Self-esteem
#> 187                                                                                                                   Self-esteem - scaled
#> 188                                                                                               Gerotranscendence (Cosmic transcendence)
#> 189                                                                                      Gerotranscendence (Cosmic transcendence) - scaled
#> 190                                                                                                                  Orthodoxy (Main int.)
#> 191                                                                                                         Orthodoxy (Main int.) - scaled
#> 192                                                                                                           Orthodoxy (Self-adm. quest.)
#> 193                                                                                                  Orthodoxy (Self-adm. quest.) - scaled
#> 194                                                                                                                                Praying
#> 195                                                                                                                       Religious coping
#> 196                                                                                                                   Salience of religion
#> 197                                                                                                                   Salience of religion
#> 198                                                                                                          Salience of religion - scaled
#> 199                                                                                                      Salience of religion - tel. proxy
#> 200                                                                                                 Salience of religion - tel. respondent
#> 201                                                                                                                        Gender identity
#> 202                                                                                                                              Sexuality
#> 203                                                                                                               Singing and making music
#> 204                                                                                                                          Sleep quality
#> 205                                                                                                                 Sleep quality - scaled
#> 206                                                                                                                 (Negative) life events
#> 207                                                                                                                       Perceived stress
#> 208                                                                                                              Perceived stress - scaled
#> 209                                                                                                                              Age norms
#> 210                                                                                                                 Attitude toward ageing
#> 211                                                                                                               Perceived discrimination
#> 212                                                                                                  Subjective life expectancy/ subj. age
#> 213                                                                                                                               Worrying
#> 214                                                                                                                      Worrying - scaled
#> 215                                                                                                         Blood pressure/pulse - retests
#> 216                                                                                            Anthropometry - Ankle, Knee and Pulse width
#> 217                                                                                                       Anthropometry - Calf measurement
#> 218                                                                                                       Anthropometry - Calf measurement
#> 219                                                                                                      Anthropometry - Weight and height
#> 220                                                                                             Bio-electrical impedance (BIA) (subsample)
#> 221                                                                                                                           Birth weight
#> 222                                                                                   DXA (LASA ancillary study) - Hip / lumbar spine scan
#> 223                                                                                           DXA (LASA ancillary study) - Whole body scan
#> 224                                                                                                                   Perceived body shape
#> 225                                                                                                          Perceived body shape - scaled
#> 226                                                                                            Weight and height:history and weight change
#> 227                                                                          Weight and height:history and weight change - tel. respondent
#> 228                                                                                                            Allostatic Load (algorithm)
#> 229                                                                                             Aortic calcification (lateral radiographs)
#> 230                                                                                                                              Back pain
#> 231                                                                                                                              Bedridden
#> 232                                                                                                    Cardiovascular diseases (algorithm)
#> 233                                                                                                                   Decubitus (bedsores)
#> 234                                                                                                                   Decubitus (bedsores)
#> 235                                                                                                          Diabetes mellitus (algorithm)
#> 236                                                                                                          Diabetes mellitus (algorithm)
#> 237                                                                                                          Diabetes mellitus (algorithm)
#> 238                                                                                                                         GP information
#> 239                                                                                                                        Hyperthyroidism
#> 240                                                                                                                     Intrinsic Capacity
#> 241                                                                                                                     Metabolic syndrome
#> 242                                                                                     Osteoarthritis hip and knee (algorithm) - cohort 1
#> 243                                                                                     Osteoarthritis hip and knee (algorithm) - cohort 2
#> 244                                                                                     Osteoarthritis hip and knee (algorithm) - cohort 3
#> 245                                                                                                      Parkinson: early P. related signs
#> 246                                                                                                       Rheumatoid Arthritis (algorithm)
#> 247                                                                                                        Self-report of chronic diseases
#> 248                                                                               Self-report of chronic diseases - longitudinally cleaned
#> 249                                                                             Self-report of chronic diseases - nr. of diseases reported
#> 250                                                                                           Self-report of chronic diseases - tel. proxy
#> 251                                                                                      Self-report of chronic diseases - tel. respondent
#> 252                                                                                                                              Dizziness
#> 253                                                                                                                                  Falls
#> 254                                                                                                                     Falls - tel. proxy
#> 255                                                                                                                Falls - tel. respondent
#> 256                                                                             Falls: 1y prospective fall calendar (LASA ancillary study)
#> 257                                                                             Falls: 3y prospective fall calendar (LASA ancillary study)
#> 258                                                                                                  Falls: circumstances and consequences
#> 259                                                                                                 Falls: environmental conditions (home)
#> 260                                                                                     Falls: fear of falling (FES: Falls Efficacy Scale)
#> 261                                                                             Falls: prevention of fall accidents (LASA ancillary study)
#> 262                                                                                                                          Foot problems
#> 263                                                                                                                           Walking aids
#> 264                                                                                                                      Fertility (women)
#> 265                                                                                                                      Fertility (women)
#> 266                                                                                                                              Fractures
#> 267                                                                                                                 Fractures - tel. proxy
#> 268                                                                                                            Fractures - tel. respondent
#> 269                                                                                                            Fractures - total waves B-E
#> 270                                                                                                        Quantitative ultrasound of bone
#> 271                                                                                                                  Vertebral deformities
#> 272                                                                           Various definitions (e.g., frailty phenotype, frailty index)
#> 273                 Accelerometry (LASA ancillary studies) - subsample (St. 1) - subsample (St. 2) - subsample (St. 3) - subsample (St. 4)
#> 274                                                                                                                            Alcohol use
#> 275                                                                                                                   Alcohol use - scaled
#> 276                                                                                                             Coffee and tea consumption
#> 277                                                                                                                Daily Physical Activity
#> 278                                                                                                              Diet and food consumption
#> 279                                                                                                              Diet and food consumption
#> 280                                                                                                           Early life physical activity
#> 281                                                                                                    MicMac study (LASA ancillary study)
#> 282                                                                                                                            Oral health
#> 283                                                                                                                            Oral health
#> 284                                                                                                    Perceived physical activity (LIVAS)
#> 285                                                                                           Perceived physical activity (LIVAS) - scaled
#> 286                                                                                                                      Physical activity
#> 287                                                                                                                     Sedentary behavior
#> 288                                                                                            Sedentary behavior - longitudinally cleaned
#> 289                                                                                                            Sedentary behavior - scaled
#> 290                                                                                                                                Smoking
#> 291                                                                                                                    Food supplement use
#> 292                                                                                           Food supplement use - Vitamin D use included
#> 293                                                                                                     Medication and food supplement use
#> 294                                                                               Medication and food supplement use - types of medication
#> 295                                                                                                                      Dealing with pain
#> 296                                                                                                                           Pain drawing
#> 297                                                                                                                        Subjective pain
#> 298                                                                                                               Subjective pain - scaled
#> 299                                                                                                                  Hearing (self-report)
#> 300                                                                                                     Hearing (self-report) - tel. proxy
#> 301                                                                                                Hearing (self-report) - tel. respondent
#> 302                                                                                                   Hearing (self-report) - total scores
#> 303                                                                                                             Hearing: SNT questionnaire
#> 304                                                                                                        Hearing: SNT technical measures
#> 305                                                                                                                   Vision (self-report)
#> 306                                                                                                      Vision (self-report) - tel. proxy
#> 307                                                                                                 Vision (self-report) - tel. respondent
#> 308                                                                                                    Vision (self-report) - total scores
#> 309                                                                                                           Vision: contrast sensitivity
#> 310                                                                                                                     Visual acuity test
#> 311                                                                                    Visual acuity test - Vision-related quality of life
#> 312                                                                                                                     Olfactory function
#> 313                                                                                                                     Olfactory function
#> 314                                                                                                                     Olfactory function
#> 315                                                                                                               Funct. limitations (ADL)
#> 316                                                                                    Funct. limitations (ADL) - constructed (sum scores)
#> 317                                                           Funct. limitations (ADL) - limitations in joint mobility (medical interview)
#> 318                                                                                                  Funct. limitations (ADL) - tel. proxy
#> 319                                                                                             Funct. limitations (ADL) - tel. respondent
#> 320                                                                                                            Global Activity Limitations
#> 321                                                                                          Global Activity Limitations - tel. respondent
#> 322                                                                                                                          Grip strength
#> 323                                                                                                                   Partner relationship
#> 324                                                                                                                              Peak Flow
#> 325                                                                                                                   Physical performance
#> 326                                                                                                       Spirometry (post bronchodilator)
#> 327                                                                                                                                EuroQol
#> 328                                                                                                                       EuroQol - scaled
#> 329                                                                                                                            Qualeffo-41
#> 330                                                                                                            Qualeffo-41 - (non)response
#> 331                                                                                                          Qualeffo-41 - Qualeffo scores
#> 332                                                                                                                    SF-12 Health Survey
#> 333                                                                                                           SF-12 Health Survey - scaled
#> 334                                                                                                     SF-12 Health Survey - scaled (Am.)
#> 335                                                                                                                      Self-rated health
#> 336                                                                                                               Self-rated health - GHPQ
#> 337                                                                                                       Self-rated health - GHPQ: scaled
#> 338                                                                                                         Self-rated health - tel. proxy
#> 339                                                                                                    Self-rated health - tel. respondent
#> 340                                                                                                                    WHO Quality of Life
#> 341                                                                                                                   Need for affiliation
#> 342                                                                                                                   Need for affiliation
#> 343                                                                                                          Need for affiliation - scaled
#> 344                                                                                                          Need for affiliation - scaled
#> 345                                                                                                                        House ownership
#> 346                                                                                                   Housing characteristics - tel. proxy
#> 347                                                                                              Housing characteristics - tel. respondent
#> 348                                                                                                Housing characteristics and adaptations
#> 349                                                                                                           Neighborhood characteristics
#> 350                                                                                                           Neighborhood characteristics
#> 351                                                                                                           Neighborhood characteristics
#> 352                                                                                                                  Neighborhood problems
#> 353                                                                                                                      Pets in household
#> 354                                                                                                                             Relocation
#> 355                                                                                                                             Relocation
#> 356                                                                                                                Relocation - tel. proxy
#> 357                                                                                                           Relocation - tel. respondent
#> 358                                                                                                                      Residence in 1944
#> 359                                                                                                                 Existential loneliness
#> 360                                                                                                                             Loneliness
#> 361                                                                                                                    Loneliness - scaled
#> 362                                                                                                           Loneliness - tel. respondent
#> 363                                                                                                                   Relationship quality
#> 364                                                                                                                               Children
#> 365                                                                                                                               Children
#> 366                                                                                                     Filial responsibility expectations
#> 367                                                                                            Filial responsibility expectations - scaled
#> 368                                                                                                                          Grandchildren
#> 369                                                                                                                          Parental data
#> 370                                                                                                                   Vignettes about help
#> 371                                                                                                    Vignettes about help - total scores
#> 372                                                                                                                        Contact network
#> 373                                                                                                                       Personal network
#> 374                                                                                                        Personal network - network size
#> 375                                                                                                                              Donorship
#> 376                                                                                                                    Social desirability
#> 377                                                                                                           Social desirability - scaled
#> 378                                                                                                                        Social identity
#> 379                                                                                                               Social identity - scaled
#> 380                                                                                                            Ties with country of origin
#> 381                                                                                                                       Values and norms
#> 382                                                                                                                Environmental influence
#> 383                                                                                                                   Social participation
#> 384                                                                                                                   Social participation
#> 385                                                                                          General Population Job ExposureMatrix (GPJEM)
#> 386                                                                                                          Perception of work conditions
#> 387                                                                                                       Work (Employment) and Retirement
#> 388                                                                                    Work (Employment) and Retirement - tel. respondent*
#> 389                                                                                                    Work and Retirement characteristics
#>     filecode                                    waves has_varinfo
#> 1        879                                        G        TRUE
#> 2        870                                    B, 2B        TRUE
#> 3        850                          B, C, 2B, G, 3B        TRUE
#> 4        862                                        C        TRUE
#> 5        871                                        C        TRUE
#> 6        867                                        C        TRUE
#> 7        880                                        E        TRUE
#> 8        881                                        E        TRUE
#> 9        882                                        E        TRUE
#> 10       864                                        C        TRUE
#> 11      <NA>                                     C, G       FALSE
#> 12      <NA>                             C, 2B, G, 3B       FALSE
#> 13       873                                        C        TRUE
#> 14       872                                        C        TRUE
#> 15      <NA>                                     <NA>       FALSE
#> 16       866                                        C        TRUE
#> 17       861                                 B, C, 3B        TRUE
#> 18       868                                     C, G        TRUE
#> 19       878                                        G        TRUE
#> 20       851                          B, C, 2B, G, 3B        TRUE
#> 21       860                          B, C, 2B, G, 3B        TRUE
#> 22       862                             C, 2B, G, 3B        TRUE
#> 23       863                                        C        TRUE
#> 24       865                                        C        TRUE
#> 25       869                                       2B        TRUE
#> 26      <NA>                                     <NA>       FALSE
#> 27      <NA>                                     <NA>       FALSE
#> 28       109                                  I, J, K        TRUE
#> 29       044 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 30       068                                       MB        TRUE
#> 31       045 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 32       603                C, D, E, F, G, H, I, J, K        TRUE
#> 33       703                C, D, E, F, G, H, I, J, K        TRUE
#> 34       045 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 35       245 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 36       108                                     I, K        TRUE
#> 37       093                                        D        TRUE
#> 38       195                         F, G, H, I, J, K        TRUE
#> 39       709                                        D        TRUE
#> 40       148                                        G        TRUE
#> 41      <NA>                                     E, G       FALSE
#> 42       127                                  I, J, K        TRUE
#> 43       094                        G, H, 3B, I, J, K        TRUE
#> 44       146                                        F        TRUE
#> 45       122     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 46       178                            G, H, I, J, K        TRUE
#> 47       610                               E, F, J, K        TRUE
#> 48       710                            E, F, I, J, K        TRUE
#> 49       177                            G, H, I, J, K        TRUE
#> 50       611                            G, H, I, J, K        TRUE
#> 51       711                            G, H, I, J, K        TRUE
#> 52       189                      E, F, G, H, I, J, K        TRUE
#> 53      <NA>                                        E       FALSE
#> 54       142             2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 55       233                                        H        TRUE
#> 56       033 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 57       033                 F, G, H, 3B, MB, I, J, K        TRUE
#> 58      <NA>                                        H       FALSE
#> 59       033                       H, 3B, MB, I, J, K        TRUE
#> 60       033                                        H        TRUE
#> 61       033 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 62      <NA>                                     <NA>       FALSE
#> 63       033                       H, 3B, MB, I, J, K        TRUE
#> 64       603                               H, I, J, K        TRUE
#> 65       703                               H, I, J, K        TRUE
#> 66       033 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 67       603                C, D, E, F, G, H, I, J, K        TRUE
#> 68       703                C, D, E, F, G, H, I, J, K        TRUE
#> 69       139                                  I, J, K        TRUE
#> 70       033                               H, I, J, K        TRUE
#> 71       603                               H, I, J, K        TRUE
#> 72       703                               H, I, J, K        TRUE
#> 73       032                                        B        TRUE
#> 74       112          B, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 75       175                                     J, K        TRUE
#> 76       132                                  D, E, J        TRUE
#> 77       332                                  D, E, J        TRUE
#> 78       074                                        D        TRUE
#> 79       274                                        D        TRUE
#> 80      <NA>                  C, D, E, 2B, F, G, H, I       FALSE
#> 81       092                                    D, 2B        TRUE
#> 82       702                                        D        TRUE
#> 83       139                  E, F, G, H, 3B, I, J, K        TRUE
#> 84       020                                       3B        TRUE
#> 85       166                               H, I, J, K        TRUE
#> 86       220                                       3B        TRUE
#> 87       165                       H, 3B, MB, I, J, K        TRUE
#> 88       037                                  C, F, I       FALSE
#> 89       237                                  C, F, I       FALSE
#> 90       022                     B, C, D, E, 2B, F, G        TRUE
#> 91       024                                        B        TRUE
#> 92       222                     B, C, D, E, 2B, F, G        TRUE
#> 93       035                   D, E, F, G, H, I, J, K        TRUE
#> 94       602                   D, E, F, G, H, I, J, K        TRUE
#> 95       702                   D, E, F, G, H, I, J, K        TRUE
#> 96       196                                        K        TRUE
#> 97       607                C, D, E, F, G, H, I, J, K        TRUE
#> 98       707                                        C        TRUE
#> 99       155     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 100      021 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 101      221 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 102      421 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 103      707                C, D, E, F, G, H, I, J, K        TRUE
#> 104      156     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 105      356     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 106      023                                     B, F        TRUE
#> 107      021 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 108      707                   D, E, F, G, H, I, J, K        TRUE
#> 109      139                  E, F, G, H, 3B, I, J, K        TRUE
#> 110      124                                  B, C, D        TRUE
#> 111      324                                  B, C, D        TRUE
#> 112     z002     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 113    mb008                                       MB        TRUE
#> 114     z008     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 115    mb004                                       MB        TRUE
#> 116     z004                                B, 2B, 3B        TRUE
#> 117    mb004                                       MB        TRUE
#> 118     z004                                B, 2B, 3B        TRUE
#> 119    mb004                                       MB        TRUE
#> 120     z004                                B, 2B, 3B        TRUE
#> 121    mb004                                       MB        TRUE
#> 122     z004                                B, 2B, 3B        TRUE
#> 123    mb008                                       MB        TRUE
#> 124     z008     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 125     <NA>                                     <NA>       FALSE
#> 126     z052     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 127    mb095                                       MB        TRUE
#> 128     z095     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 129      011 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 130     <NA>                                     <NA>       FALSE
#> 131     z010     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 132    mb010                                       MB        TRUE
#> 133      601                C, D, E, F, G, H, I, J, K       FALSE
#> 134      701                C, D, E, F, G, H, I, J, K       FALSE
#> 135     z991     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 136     z992     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 137     z990     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 138      038                                       MB        TRUE
#> 139     z038                          C, D, E, 2B, 3B        TRUE
#> 140      038                                 MB, J, K        TRUE
#> 141     z038                 D, E, 2B, F, G, H, 3B, I        TRUE
#> 142      018                                        B        TRUE
#> 143      017 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 144      217                                        B        TRUE
#> 145      015     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 146      017 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 147      217                                        B        TRUE
#> 148      019 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 149      019 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 150      016 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 151      144                         F, G, H, I, J, K        TRUE
#> 152      179                                        G        TRUE
#> 153      379                                        G        TRUE
#> 154     <NA>                  B, D, E, 2B, G, H, I, J       FALSE
#> 155      026     B, C, D, E, F, G, H, 3B, MB, I, J, K        TRUE
#> 156      226     B, C, D, E, F, G, H, 3B, MB, I, J, K        TRUE
#> 157      091                                     D, E        TRUE
#> 158      291                                     D, E        TRUE
#> 159     <NA>                                     J, K       FALSE
#> 160      025 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 161      225 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 162      606                                  C, D, E        TRUE
#> 163      706                C, D, E, F, G, H, I, J, K        TRUE
#> 164     <NA>                                     <NA>       FALSE
#> 165      039                                        K        TRUE
#> 166     <NA>                                     <NA>       FALSE
#> 167      197                                        K        TRUE
#> 168      802                                     J, K        TRUE
#> 169      110     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 170      110     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 171      094                                        D        TRUE
#> 172      137                                     E, F        TRUE
#> 173      337                                     E, F        TRUE
#> 174      149                                     G, H        TRUE
#> 175      349                                     G, H        TRUE
#> 176      111                                     B, D        TRUE
#> 177      311                                     B, D        TRUE
#> 178      027 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 179      227 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 180      029                                        B        TRUE
#> 181      143                                       2B        TRUE
#> 182      123                       B, C, D, E, 2B, 3B        TRUE
#> 183      323                       B, C, D, E, 2B, 3B        TRUE
#> 184      028     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 185      228     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 186      027     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 187      227        C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 188      038                           C, D, E, 2B, F        TRUE
#> 189      238                           C, D, E, 2B, F        TRUE
#> 190      038        C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 191      138                                        E        TRUE
#> 192      238                                        C        TRUE
#> 193      338                                        E        TRUE
#> 194      038        C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 195      105                                   3B, MB        TRUE
#> 196      038                              C, D, E, 2B        TRUE
#> 197      110     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 198      238                              C, D, E, 2B        TRUE
#> 199      608                                        C        TRUE
#> 200      708                                        C        TRUE
#> 201      804                                     J, K        TRUE
#> 202      120                          B, E, 2B, F, 3B        TRUE
#> 203      103                                  H, I, J        TRUE
#> 204      117     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 205      317     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 206      272                C, D, E, F, G, H, I, J, K        TRUE
#> 207      104                                    H, 3B        TRUE
#> 208      304                                    H, 3B        TRUE
#> 209      070        B, C, D, 2B, F, G, H, 3B, I, J, K        TRUE
#> 210      071                                     B, K        TRUE
#> 211      169                                     J, K        TRUE
#> 212      094                   D, E, F, G, H, I, J, K        TRUE
#> 213      136                                        E        TRUE
#> 214      336                                        E        TRUE
#> 215      151 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 216      185                                        C        TRUE
#> 217      161                                  I, J, K        TRUE
#> 218      171                 B, D, E, 2B, F, G, H, 3B        TRUE
#> 219      161          B, C, D, E, 2B, F, G, H, 3B, MB        TRUE
#> 220      172                                        B        TRUE
#> 221      134                                E, 2B, 3B        TRUE
#> 222      o41                                     C, D       FALSE
#> 223      o42                                     C, D       FALSE
#> 224      145                             F, G, 3B, MB        TRUE
#> 225      345                                 F, G, 3B        TRUE
#> 226      160 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 227      714                                  I, J, K        TRUE
#> 228     <NA>                                        C       FALSE
#> 229     zo22                                     C, D       FALSE
#> 230      182                                  C, D, E        TRUE
#> 231      182                        C, D, F, G, H, 3B        TRUE
#> 232     zh01       B, C, D, E, 2B, F, G, H, 3B, MB, I       FALSE
#> 233      116                                        B        TRUE
#> 234      159                                        B        TRUE
#> 235     zdc1                   B, C, D, E, F, G, H, I        TRUE
#> 236     zdc2                           2B, F, G, H, I        TRUE
#> 237     zdc3                                    3B, I        TRUE
#> 238      g01                       B, C, E, 2B, H, 3B       FALSE
#> 239      182                                     C, D        TRUE
#> 240     <NA>                                     <NA>       FALSE
#> 241     ch02                                        C       FALSE
#> 242     zoa1                   B, C, D, E, F, G, H, I        TRUE
#> 243     zoa2                           2B, F, G, H, I        TRUE
#> 244     zoa3                                    3B, I        TRUE
#> 245      096                                   3B, MB        TRUE
#> 246     <NA>                                     <NA>       FALSE
#> 247      035 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 248      435                                     B, C        TRUE
#> 249      235 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 250      602                C, D, E, F, G, H, I, J, K        TRUE
#> 251      702                C, D, E, F, G, H, I, J, K        TRUE
#> 252      187           C, D, 2B, F, G, H, 3B, I, J, K        TRUE
#> 253      187                       C, D, 3B, MB, J, K        TRUE
#> 254      605                                     C, D        TRUE
#> 255      705                                     C, D        TRUE
#> 256     <NA>                                        G       FALSE
#> 257     <NA>                                        C       FALSE
#> 258      187                                  D, J, K        TRUE
#> 259      180                                     C, D        TRUE
#> 260      183                                     C, D        TRUE
#> 261     <NA>                                        D       FALSE
#> 262      185                               C, D, E, F        TRUE
#> 263      187                    D, E, 2B, F, G, H, 3B        TRUE
#> 264      119                                        B        TRUE
#> 265      181                            C, 2B, 3B, MB        TRUE
#> 266      186    C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 267      605                C, D, E, F, G, H, I, J, K        TRUE
#> 268      705                C, D, E, F, G, H, I, J, K        TRUE
#> 269     ZFF1                               B, C, D, E       FALSE
#> 270      o31                                     C, G       FALSE
#> 271     zo22                                     C, D       FALSE
#> 272     <NA>    B, C, D, E, 2B, F, G, H, 3B, MB, I, J       FALSE
#> 273     <NA>                                     <NA>       FALSE
#> 274      153 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 275      353 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 276      801                                     J, K        TRUE
#> 277      162                                        J        TRUE
#> 278      118                      B, C, D, H, I, J, K        TRUE
#> 279      184                                     C, D        TRUE
#> 280      246                                        C        TRUE
#> 281     <NA>                                        I       FALSE
#> 282      126                                  I, J, K        TRUE
#> 283     <NA>                                        F       FALSE
#> 284      114                        B, C, D, E, 2B, F        TRUE
#> 285      314                        B, C, D, E, 2B, F        TRUE
#> 286      046 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 287      101                    G, H, 3B, MB, I, J, K       FALSE
#> 288      501                    G, H, 3B, MB, I, J, K       FALSE
#> 289      301                    G, H, 3B, MB, I, J, K       FALSE
#> 290      154 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 291      174                                  I, J, K        TRUE
#> 292      374                                  I, J, K        TRUE
#> 293      152 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 294      352 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 295      188                                        E        TRUE
#> 296      188                                        E        TRUE
#> 297      115 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 298      315 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 299      031 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 300      604                C, D, E, F, G, H, I, J, K        TRUE
#> 301      704                C, D, E, F, G, H, I, J, K        TRUE
#> 302      231     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 303      194                               E, F, G, I        TRUE
#> 304      193                               E, F, G, I        TRUE
#> 305      031 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 306      604                C, D, E, F, G, H, I, J, K        TRUE
#> 307      704                C, D, E, F, G, H, I, J, K        TRUE
#> 308      231     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 309      157                        B, C, D, E, 2B, F        TRUE
#> 310      191                           E, F, G, H, 3B        TRUE
#> 311      192                               E, F, G, H        TRUE
#> 312      S00                                   3B, MB        TRUE
#> 313      S01                                   3B, MB        TRUE
#> 314      S02                                   3B, MB        TRUE
#> 315      030 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 316      230 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 317      183                                  C, D, E        TRUE
#> 318      603                C, D, E, F, G, H, I, J, K        TRUE
#> 319      703                C, D, E, F, G, H, I, J, K        TRUE
#> 320      033     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 321      703                C, D, E, F, G, H, I, J, K        TRUE
#> 322      161    C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 323      139                  E, F, G, H, 3B, I, J, K        TRUE
#> 324      158                         B, C, D, E, G, H        TRUE
#> 325      034 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 326      168                                       3B        TRUE
#> 327      135                        E, F, G, H, 3B, I        TRUE
#> 328      335                        E, F, G, H, 3B, I        TRUE
#> 329      o80                                        E        TRUE
#> 330      o81                                        E        TRUE
#> 331      o82                                        E        TRUE
#> 332      133               D, E, F, G, H, 3B, I, J, K        TRUE
#> 333      333               D, E, F, G, H, 3B, I, J, K        TRUE
#> 334      533               D, E, F, G, H, 3B, I, J, K        TRUE
#> 335      036 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 336      113              B, C, D, E, 2B, F, G, H, 3B        TRUE
#> 337      313              B, C, D, E, 2B, F, G, H, 3B        TRUE
#> 338      602                C, D, E, F, G, H, I, J, K        TRUE
#> 339      702                C, D, E, F, G, H, I, J, K        TRUE
#> 340      133                                  I, J, K        TRUE
#> 341      078                                     B, E        TRUE
#> 342      141                                    2B, G        TRUE
#> 343      278                                     B, E        TRUE
#> 344      341                                    2B, G        TRUE
#> 345      015     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 346      601                C, D, E, F, G, H, I, J, K        TRUE
#> 347      701                C, D, E, F, G, H, I, J, K        TRUE
#> 348      014 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 349      015     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 350      095                                        K       FALSE
#> 351     z095    B, C, D, E, 2B, F, G, H, 3B, MB, I, J        TRUE
#> 352      170                                     J, K       FALSE
#> 353      012     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 354      014     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 355      015     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 356      601                C, D, E, F, G, H, I, J, K        TRUE
#> 357      701                C, D, E, F, G, H, I, J, K        TRUE
#> 358      013                                        B        TRUE
#> 359      173                                        J        TRUE
#> 360      073 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 361      273 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 362      712                               H, I, J, K        TRUE
#> 363      139                  E, F, G, H, 3B, I, J, K        TRUE
#> 364      048                   C, E, 2B, F, 3B, MB, I        TRUE
#> 365      248                         E, 2B, F, 3B, MB        TRUE
#> 366      132                                  D, E, J        TRUE
#> 367      332                                  D, E, J        TRUE
#> 368      049                                        F        TRUE
#> 369      140                                   2B, 3B        TRUE
#> 370      074                                        D        TRUE
#> 371      274                                        D        TRUE
#> 372      167                                3B, MB, I        TRUE
#> 373      047     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 374      247     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 375      128                                     I, J        TRUE
#> 376      130                                     C, F        TRUE
#> 377      330                                     C, F        TRUE
#> 378      131                                     D, E        TRUE
#> 379      331                                     D, E        TRUE
#> 380      069                                       MB        TRUE
#> 381      122     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 382      121                                  B, C, D        TRUE
#> 383      070 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 384      125                     B, C, D, E, 2B, F, G        TRUE
#> 385      016 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 386      106                          3B, MB, I, J, K        TRUE
#> 387      016 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 388      713                                  I, J, K        TRUE
#> 389     <NA>                                     <NA>       FALSE
lasa_topics(topic = "Physical")
#> Matching LASA themes/subthemes: Physical (theme); Physical functioning (subtheme). Use `lasa_topics(theme = ...)` to search within one of them.
#>      theme             subtheme                                        topic
#> 1 Physical            Lifestyle                            Physical activity
#> 2 Physical Physical functioning                         Physical performance
#> 3 Physical            Lifestyle                      Daily Physical Activity
#> 4 Physical            Lifestyle          Perceived physical activity (LIVAS)
#> 5 Physical            Lifestyle                 Early life physical activity
#> 6 Physical            Lifestyle Perceived physical activity (LIVAS) - scaled
#>   filecode                                    waves has_varinfo
#> 1      046 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 2      034 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 3      162                                        J        TRUE
#> 4      114                        B, C, D, E, 2B, F        TRUE
#> 5      246                                        C        TRUE
#> 6      314                        B, C, D, E, 2B, F        TRUE
lasa_topics(topic = "physical act")
#>      theme  subtheme                                        topic filecode
#> 1 Physical Lifestyle                            Physical activity      046
#> 2 Physical Lifestyle                      Daily Physical Activity      162
#> 3 Physical Lifestyle          Perceived physical activity (LIVAS)      114
#> 4 Physical Lifestyle                 Early life physical activity      246
#> 5 Physical Lifestyle Perceived physical activity (LIVAS) - scaled      314
#>                                      waves has_varinfo
#> 1 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 2                                        J        TRUE
#> 3                        B, C, D, E, 2B, F        TRUE
#> 4                                        C        TRUE
#> 5                        B, C, D, E, 2B, F        TRUE
lasa_topics(theme = "cognitive")
#>        theme                   subtheme
#> 1  Cognitive                   Dementia
#> 2  Cognitive                   Dementia
#> 3  Cognitive                   Dementia
#> 4  Cognitive                   Dementia
#> 5  Cognitive      Executive functioning
#> 6  Cognitive      Executive functioning
#> 7  Cognitive      Executive functioning
#> 8  Cognitive      Executive functioning
#> 9  Cognitive Intelligence and cognition
#> 10 Cognitive Intelligence and cognition
#> 11 Cognitive Intelligence and cognition
#> 12 Cognitive Intelligence and cognition
#> 13 Cognitive Intelligence and cognition
#> 14 Cognitive Intelligence and cognition
#> 15 Cognitive Intelligence and cognition
#> 16 Cognitive Intelligence and cognition
#> 17 Cognitive Intelligence and cognition
#> 18 Cognitive Intelligence and cognition
#> 19 Cognitive Intelligence and cognition
#> 20 Cognitive Intelligence and cognition
#> 21 Cognitive Intelligence and cognition
#> 22 Cognitive Intelligence and cognition
#> 23 Cognitive Intelligence and cognition
#> 24 Cognitive Intelligence and cognition
#> 25 Cognitive                     Memory
#> 26 Cognitive                     Memory
#> 27 Cognitive                     Memory
#> 28 Cognitive                     Memory
#> 29 Cognitive                     Memory
#> 30 Cognitive                     Memory
#> 31 Cognitive                     Memory
#> 32 Cognitive                     Memory
#>                                                               topic filecode
#> 1                                                Dementia algorithm     <NA>
#> 2                                                  Dementia parents      092
#> 3                                Dementia parents - tel. respondent      702
#> 4                                                  Dementia partner      139
#> 5                                Executive functioning (Digit span)      020
#> 6                                Executive functioning (Digit span)      166
#> 7                                Executive functioning (Digit span)      220
#> 8                                                    Verbal fluency      165
#> 9                                 Crystallized intelligence (GIT ©)      037
#> 10                 Crystallized intelligence (GIT ©) - total scores      237
#> 11                                       Fluid intelligence (RAVEN)      022
#> 12                                       Fluid intelligence (RAVEN)      024
#> 13             Fluid intelligence (RAVEN) - scaled Evaluation RAVEN      222
#> 14                                                      Head trauma      035
#> 15                                         Head trauma - tel. proxy      602
#> 16                                    Head trauma - tel. respondent      702
#> 17                                                  Health literacy      196
#> 18          Informant Quest. of COgn. DEcline (IQCODE) - tel. proxy      607
#> 19     Informant Quest. of COgn. DEcline (IQCODE) - tel. respondent      707
#> 20                       Information processing speed (Coding task)      155
#> 21                             Mini-Mental State Examination (MMSE)      021
#> 22               Mini-Mental State Examination (MMSE) - MMSE scaled      221
#> 23 Mini-Mental State Examination (MMSE) - MMSE subtraction/spelling      421
#> 24           Mini-Mental State Examination (MMSE) - tel. respondent      707
#> 25                                           Episodic memory (15WT)      156
#> 26                             Episodic memory (15WT) - constructed      356
#> 27                                                  Everyday memory      023
#> 28                                                Memory complaints      021
#> 29                              Memory complaints - tel. respondent      707
#> 30                                                   Memory partner      139
#> 31                                                       Metamemory      124
#> 32                                              Metamemory - scaled      324
#>                                       waves has_varinfo
#> 1                   C, D, E, 2B, F, G, H, I       FALSE
#> 2                                     D, 2B        TRUE
#> 3                                         D        TRUE
#> 4                   E, F, G, H, 3B, I, J, K        TRUE
#> 5                                        3B        TRUE
#> 6                                H, I, J, K        TRUE
#> 7                                        3B        TRUE
#> 8                        H, 3B, MB, I, J, K        TRUE
#> 9                                   C, F, I       FALSE
#> 10                                  C, F, I       FALSE
#> 11                     B, C, D, E, 2B, F, G        TRUE
#> 12                                        B        TRUE
#> 13                     B, C, D, E, 2B, F, G        TRUE
#> 14                   D, E, F, G, H, I, J, K        TRUE
#> 15                   D, E, F, G, H, I, J, K        TRUE
#> 16                   D, E, F, G, H, I, J, K        TRUE
#> 17                                        K        TRUE
#> 18                C, D, E, F, G, H, I, J, K        TRUE
#> 19                                        C        TRUE
#> 20     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 21 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 22 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 23 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 24                C, D, E, F, G, H, I, J, K        TRUE
#> 25     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 26     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 27                                     B, F        TRUE
#> 28 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 29                   D, E, F, G, H, I, J, K        TRUE
#> 30                  E, F, G, H, 3B, I, J, K        TRUE
#> 31                                  B, C, D        TRUE
#> 32                                  B, C, D        TRUE
lasa_topics(theme = "memory")
#>       theme subtheme                                topic filecode
#> 1 Cognitive   Memory               Episodic memory (15WT)      156
#> 2 Cognitive   Memory Episodic memory (15WT) - constructed      356
#> 3 Cognitive   Memory                      Everyday memory      023
#> 4 Cognitive   Memory                    Memory complaints      021
#> 5 Cognitive   Memory  Memory complaints - tel. respondent      707
#> 6 Cognitive   Memory                       Memory partner      139
#> 7 Cognitive   Memory                           Metamemory      124
#> 8 Cognitive   Memory                  Metamemory - scaled      324
#>                                      waves has_varinfo
#> 1     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 2     B, C, D, E, 2B, F, G, H, 3B, I, J, K        TRUE
#> 3                                     B, F        TRUE
#> 4 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 5                   D, E, F, G, H, I, J, K        TRUE
#> 6                  E, F, G, H, 3B, I, J, K        TRUE
#> 7                                  B, C, D        TRUE
#> 8                                  B, C, D        TRUE
lasa_topics("011")   # search by file code
#>          theme            subtheme
#> 1 Demographics Living arrangements
#> 2         Care    Needs assessment
#> 3         Care    Needs assessment
#> 4    Emotional  Personality traits
#> 5    Emotional  Personality traits
#>                                                     topic filecode
#> 1                                   Household composition      011
#> 2      Needs assessment - Use WVG facilities (tel. proxy)      611
#> 3 Needs assessment - Use WVG facilities (tel. respondent)      711
#> 4                                                   Humor      111
#> 5                                          Humor - scaled      311
#>                                      waves has_varinfo
#> 1 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 2                            G, H, I, J, K        TRUE
#> 3                            G, H, I, J, K        TRUE
#> 4                                     B, D        TRUE
#> 5                                     B, D        TRUE
lasa_topics("045")   # also returns the "245" processed/scaled variant
#>      theme              subtheme
#> 1     Care Contact with services
#> 2     Care Contact with services
#> 3     Care Contact with services
#> 4 Physical      Body composition
#> 5 Physical      Body composition
#>                                                                                     topic
#> 1                                                                      Hospital admission
#> 2                               Outpatient contact with medical specialists last 6 months
#> 3 Outpatient contact with medical specialists last 6 months - specification of specialist
#> 4                                                                    Perceived body shape
#> 5                                                           Perceived body shape - scaled
#>   filecode                                    waves has_varinfo
#> 1      045 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 2      045 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 3      245 B, C, D, E, 2B, F, G, H, 3B, MB, I, J, K        TRUE
#> 4      145                             F, G, 3B, MB        TRUE
#> 5      345                                 F, G, 3B        TRUE
```
