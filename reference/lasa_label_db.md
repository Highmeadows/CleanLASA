# Inspect the active LASA label database

Returns the label metadata database currently in effect: the bundled
snapshot shipped with the package, layered with any local updates from
[`update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/update_lasa_labels.md)
or
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md).
Useful for checking which file codes/waves are covered before calling
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md),
or for auditing a manual correction.

## Usage

``` r
lasa_label_db()
```

## Value

A list with `documents`, `variables`, `value_labels`, and
`manual_overrides` (itself a list of `variables`/`value_labels`) – see
the package README for the full schema.

## See also

[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md),
[`update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/update_lasa_labels.md),
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md)

## Examples

``` r
db <- lasa_label_db()
nrow(db$variables)
#> [1] 14620
subset(db$variables, filecode == "046" & wave == "B")
#>      filecode wave variable_name canonical_name
#> 5248      046    B      blphya01        lphya01
#> 5259      046    B      blphya02        lphya02
#> 5270      046    B      blphya03        lphya03
#> 5281      046    B      blphya04        lphya04
#> 5292      046    B      blphya05        lphya05
#> 5303      046    B      blphya06        lphya06
#> 5314      046    B      blphya07        lphya07
#> 5325      046    B      blphya08        lphya08
#> 5336      046    B      blphya09        lphya09
#> 5347      046    B      blphya10        lphya10
#> 5358      046    B      blphya11        lphya11
#> 5369      046    B      blphya12        lphya12
#> 5380      046    B      blphya13        lphya13
#> 5391      046    B      blphya14        lphya14
#> 5400      046    B      blphya15        lphya15
#> 5411      046    B      blphya16        lphya16
#> 5420      046    B      blphya17        lphya17
#> 5431      046    B      blphya18        lphya18
#> 5442      046    B      blphya19        lphya19
#> 5453      046    B      blphya20        lphya20
#> 5466      046    B      blphya21        lphya21
#> 5477      046    B      blphya22        lphya22
#> 5488      046    B      blphya23        lphya23
#> 5499      046    B      blphya24        lphya24
#> 5510      046    B      blphya25        lphya25
#> 5521      046    B      blphya26        lphya26
#> 5532      046    B      blphya27        lphya27
#> 5543      046    B      blphya28        lphya28
#> 5554      046    B      blphya29        lphya29
#> 5561      046    B      blphya30        lphya30
#> 5571      046    B      blphya31        lphya31
#> 5582      046    B      blphya32        lphya32
#> 5593      046    B      blphya33        lphya33
#> 5604      046    B      blphya34        lphya34
#> 5615      046    B      blphya35        lphya35
#> 5626      046    B      blphya36        lphya36
#> 5637      046    B      blphya37        lphya37
#> 5648      046    B      blphya38        lphya38
#> 5659      046    B      blphya39        lphya39
#> 5670      046    B      blphya40        lphya40
#> 5681      046    B      blphya41        lphya41
#> 5692      046    B      blphya42        lphya42
#> 5703      046    B      blphya43        lphya43
#> 5714      046    B      blphya44        lphya44
#> 5732      046    B      blphya46        lphya46
#>                                    variable_label     document_id source_page
#> 5248   Physical condition respondent: observation LASA046_varinfo           1
#> 5259                        Wheelchair go outside LASA046_varinfo           1
#> 5270        Wheelchair go outside: last two weeks LASA046_varinfo           1
#> 5281 Wheelchair go outside: #times last two weeks LASA046_varinfo           1
#> 5292                  Wheelchair: time in minutes LASA046_varinfo           1
#> 5303                              Walking outside LASA046_varinfo           1
#> 5314               Walking outside:last two weeks LASA046_varinfo           1
#> 5325       Walking outside: #times last two weeks LASA046_varinfo           1
#> 5336                     Walking: time in minutes LASA046_varinfo           1
#> 5347                           Bicycling periode) LASA046_varinfo           1
#> 5358                    Bicycling: last two weeks LASA046_varinfo           2
#> 5369            Bicycling: # times last two weeks LASA046_varinfo           2
#> 5380                   Bicycling: time in minutes LASA046_varinfo           2
#> 5391                                         <NA> LASA046_varinfo           2
#> 5400                       Gardening: yes/no year LASA046_varinfo           2
#> 5411                                         <NA> LASA046_varinfo           2
#> 5420                    Gardening: last two weeks LASA046_varinfo           2
#> 5431                  Gardening: # last two weeks LASA046_varinfo           2
#> 5442         Gardening: time in minutes two weeks LASA046_varinfo           2
#> 5453                                         <NA> LASA046_varinfo           2
#> 5466               Sport 1: past two weeks yes/no LASA046_varinfo           3
#> 5477                                         <NA> LASA046_varinfo           3
#> 5488              Sport 1: # times past two weeks LASA046_varinfo           3
#> 5499            Sport 1: time in minutes periode) LASA046_varinfo           3
#> 5510                              Sport 2: yes/no LASA046_varinfo           4
#> 5521                                         <NA> LASA046_varinfo           4
#> 5532              Sport 2: # times past two weeks LASA046_varinfo           4
#> 5543                    Sport 2 : time in minutes LASA046_varinfo           4
#> 5554                                         <NA> LASA046_varinfo           4
#> 5561                                     periode) LASA046_varinfo           4
#> 5571                      Light household: yes/no LASA046_varinfo           5
#> 5582       Light household: past two weeks yes/no LASA046_varinfo           5
#> 5593       Light household: # days past two weeks LASA046_varinfo           5
#> 5604             Light household: time in minutes LASA046_varinfo           5
#> 5615                      Heavy household: yes/no LASA046_varinfo           5
#> 5626       Heavy household: past two weeks yes/no LASA046_varinfo           5
#> 5637       Heavy household: # days past two weeks LASA046_varinfo           5
#> 5648             Heavy household: time in minutes LASA046_varinfo           5
#> 5659       Past two weeks normal: yes/no periode) LASA046_varinfo           5
#> 5670                             not normal: sick LASA046_varinfo           6
#> 5681                        not normal: depressed LASA046_varinfo           6
#> 5692                      not normal: bad weather LASA046_varinfo           6
#> 5703                   not normal: family affairs LASA046_varinfo           6
#> 5714                         not normal: vacation LASA046_varinfo           6
#> 5732                                     periode) LASA046_varinfo           6
#>      source_row                    source_condition parse_note    var_type
#> 5248          1                                <NA>       <NA> categorical
#> 5259          2                                <NA>       <NA> categorical
#> 5270          3                                <NA>       <NA> categorical
#> 5281          4                                <NA>       <NA>     numeric
#> 5292          5                                <NA>       <NA>     numeric
#> 5303          6                                <NA>       <NA> categorical
#> 5314          7                                <NA>       <NA> categorical
#> 5325          8                                <NA>       <NA>     numeric
#> 5336          9                                <NA>       <NA>     numeric
#> 5347         10                                <NA>       <NA> categorical
#> 5358         11                                <NA>       <NA> categorical
#> 5369         12                                <NA>       <NA>     numeric
#> 5380         13                                <NA>       <NA>     numeric
#> 5391         14                   Not in wave I, J:       <NA> categorical
#> 5400         15                   Not in wave I, J:       <NA> categorical
#> 5411         16                   Not in wave I, J:       <NA>     numeric
#> 5420         17                   Not in wave I, J:       <NA> categorical
#> 5431         18                   Not in wave I, J:       <NA>     numeric
#> 5442         19                   Not in wave I, J:       <NA>     numeric
#> 5453         20                   Not in wave I, J:       <NA> categorical
#> 5466         22          Only in waves H, 3B, I, J:       <NA> categorical
#> 5477         23 Only in waves B, C, D, E, 2B, F, G:       <NA> categorical
#> 5488         25          Only in waves H, 3B, I, J:       <NA>     numeric
#> 5499         26          Only in waves H, 3B, I, J:       <NA>     numeric
#> 5510         27          Only in waves H, 3B, I, J:       <NA> categorical
#> 5521         28 Only in waves B, C, D, E, 2B, F, G:       <NA> categorical
#> 5532         30          Only in waves H, 3B, I, J:       <NA>     numeric
#> 5543         31          Only in waves H, 3B, I, J:       <NA>     numeric
#> 5554         32 Only in waves B, C, D, E, 2B, F, G:       <NA> categorical
#> 5561         33 Only in waves B, C, D, E, 2B, F, G:       <NA>     numeric
#> 5571         37                    Only in wave 3B:       <NA> categorical
#> 5582         38                    Only in wave 3B:       <NA> categorical
#> 5593         39                    Only in wave 3B:       <NA>     numeric
#> 5604         40                    Only in wave 3B:       <NA>     numeric
#> 5615         41                    Only in wave 3B:       <NA> categorical
#> 5626         42                    Only in wave 3B:       <NA> categorical
#> 5637         43                    Only in wave 3B:       <NA>     numeric
#> 5648         44                    Only in wave 3B:       <NA>     numeric
#> 5659         45                    Only in wave 3B:       <NA> categorical
#> 5670         46                    Only in wave 3B:       <NA> categorical
#> 5681         47                    Only in wave 3B:       <NA> categorical
#> 5692         48                    Only in wave 3B:       <NA> categorical
#> 5703         49                    Only in wave 3B:       <NA> categorical
#> 5714         50                    Only in wave 3B:       <NA> categorical
#> 5732         53       Only in waves B, C, D, E, 2B:       <NA> categorical
```
