# Inspect the active LASA label database

Returns the label metadata database currently in effect: the bundled
snapshot shipped with the package, layered with any local updates from
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md).
Useful for checking which file codes/waves are covered before calling
[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md),
or for auditing a manual correction.

## Usage

``` r
lasa_label_db()
```

## Value

A list with `variables`, `value_labels`, `value_labels_harmonized`, and
`manual_overrides` (itself a list of `variables`/`value_labels`) – see
the package README for the full schema.

## See also

[`apply_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/apply_lasa_labels.md),
[`manual_update_lasa_labels()`](https://highmeadows.github.io/CleanLASA/reference/manual_update_lasa_labels.md)

## Examples

``` r
db <- lasa_label_db()
nrow(db$variables)
#> [1] 23780
subset(db$variables, filecode == "046" & wave == "B")
#>      filecode wave variable_name canonical_name
#> 9014      046    B      blphya01        lphya01
#> 9015      046    B      blphya02        lphya02
#> 9016      046    B      blphya03        lphya03
#> 9017      046    B      blphya04        lphya04
#> 9018      046    B      blphya05        lphya05
#> 9019      046    B      blphya06        lphya06
#> 9020      046    B      blphya07        lphya07
#> 9021      046    B      blphya08        lphya08
#> 9022      046    B      blphya09        lphya09
#> 9023      046    B      blphya10        lphya10
#> 9024      046    B      blphya11        lphya11
#> 9025      046    B      blphya12        lphya12
#> 9026      046    B      blphya13        lphya13
#> 9027      046    B      blphya14        lphya14
#> 9028      046    B      blphya15        lphya15
#> 9029      046    B      blphya16        lphya16
#> 9030      046    B      blphya17        lphya17
#> 9031      046    B      blphya18        lphya18
#> 9032      046    B      blphya19        lphya19
#> 9033      046    B      blphya20        lphya20
#> 9034      046    B      blphya21        lphya21
#> 9035      046    B      blphya22        lphya22
#> 9036      046    B      blphya23        lphya23
#> 9037      046    B      blphya24        lphya24
#> 9038      046    B      blphya25        lphya25
#> 9039      046    B      blphya26        lphya26
#> 9040      046    B      blphya27        lphya27
#> 9041      046    B      blphya28        lphya28
#> 9042      046    B      blphya29        lphya29
#> 9043      046    B      blphya30        lphya30
#> 9044      046    B      blphya31        lphya31
#> 9045      046    B      blphya32        lphya32
#> 9046      046    B      blphya33        lphya33
#> 9047      046    B      blphya34        lphya34
#> 9048      046    B      blphya35        lphya35
#> 9049      046    B      blphya36        lphya36
#> 9050      046    B      blphya37        lphya37
#> 9051      046    B      blphya38        lphya38
#> 9052      046    B      blphya39        lphya39
#> 9053      046    B      blphya40        lphya40
#> 9054      046    B      blphya41        lphya41
#> 9055      046    B      blphya42        lphya42
#> 9056      046    B      blphya43        lphya43
#> 9057      046    B      blphya44        lphya44
#> 9058      046    B      blphya45        lphya45
#> 9059      046    B      blphya46        lphya46
#>                                    variable_label
#> 9014   Physical condition respondent: observation
#> 9015                        Wheelchair go outside
#> 9016        Wheelchair go outside: last two weeks
#> 9017 Wheelchair go outside: #times last two weeks
#> 9018                  Wheelchair: time in minutes
#> 9019                              Walking outside
#> 9020               Walking outside:last two weeks
#> 9021       Walking outside: #times last two weeks
#> 9022                     Walking: time in minutes
#> 9023                                    Bicycling
#> 9024                    Bicycling: last two weeks
#> 9025            Bicycling: # times last two weeks
#> 9026                   Bicycling: time in minutes
#> 9027                          Have garden: yes/no
#> 9028                            Gardening: yes/no
#> 9029                   Gardening: # months a year
#> 9030                    Gardening: last two weeks
#> 9031                  Gardening: # last two weeks
#> 9032                   Gardening: time in minutes
#> 9033            Gardening: digging last two weeks
#> 9034               Sport 1: past two weeks yes/no
#> 9035                      Sport 1: past two weeks
#> 9036              Sport 1: # times past two weeks
#> 9037                     Sport 1: time in minutes
#> 9038                              Sport 2: yes/no
#> 9039                      Sport 2: past two weeks
#> 9040              Sport 2: # times past two weeks
#> 9041                    Sport 2 : time in minutes
#> 9042        Sport: sweating past two weeks yes/no
#> 9043        Sport: #times sweating past two weeks
#> 9044                      Light household: yes/no
#> 9045       Light household: past two weeks yes/no
#> 9046       Light household: # days past two weeks
#> 9047             Light household: time in minutes
#> 9048                      Heavy household: yes/no
#> 9049       Heavy household: past two weeks yes/no
#> 9050       Heavy household: # days past two weeks
#> 9051             Heavy household: time in minutes
#> 9052                Past two weeks normal: yes/no
#> 9053                             not normal: sick
#> 9054                        not normal: depressed
#> 9055                      not normal: bad weather
#> 9056                   not normal: family affairs
#> 9057                         not normal: vacation
#> 9058                     not normal: other reason
#> 9059              not normal: other reasons coded
#>                              harmonized_var_label    var_type
#> 9014   Physical condition respondent: observation        text
#> 9015                        Wheelchair go outside categorical
#> 9016        Wheelchair go outside: last two weeks categorical
#> 9017 Wheelchair go outside: #times last two weeks     numeric
#> 9018                  Wheelchair: time in minutes     numeric
#> 9019                              Walking outside categorical
#> 9020               Walking outside:last two weeks categorical
#> 9021       Walking outside: #times last two weeks     numeric
#> 9022                     Walking: time in minutes     numeric
#> 9023                                    Bicycling categorical
#> 9024                    Bicycling: last two weeks categorical
#> 9025            Bicycling: # times last two weeks     numeric
#> 9026                   Bicycling: time in minutes     numeric
#> 9027                          Have garden: yes/no categorical
#> 9028                            Gardening: yes/no categorical
#> 9029                   Gardening: # months a year     numeric
#> 9030                    Gardening: last two weeks categorical
#> 9031                  Gardening: # last two weeks     numeric
#> 9032                   Gardening: time in minutes     numeric
#> 9033            Gardening: digging last two weeks categorical
#> 9034               Sport 1: past two weeks yes/no categorical
#> 9035                      Sport 1: past two weeks        text
#> 9036              Sport 1: # times past two weeks     numeric
#> 9037                     Sport 1: time in minutes     numeric
#> 9038                              Sport 2: yes/no categorical
#> 9039                      Sport 2: past two weeks        text
#> 9040              Sport 2: # times past two weeks     numeric
#> 9041                    Sport 2 : time in minutes     numeric
#> 9042        Sport: sweating past two weeks yes/no categorical
#> 9043        Sport: #times sweating past two weeks     numeric
#> 9044                      Light household: yes/no categorical
#> 9045       Light household: past two weeks yes/no categorical
#> 9046       Light household: # days past two weeks     numeric
#> 9047             Light household: time in minutes     numeric
#> 9048                      Heavy household: yes/no categorical
#> 9049       Heavy household: past two weeks yes/no categorical
#> 9050       Heavy household: # days past two weeks     numeric
#> 9051             Heavy household: time in minutes     numeric
#> 9052                Past two weeks normal: yes/no categorical
#> 9053                             not normal: sick categorical
#> 9054                        not normal: depressed categorical
#> 9055                      not normal: bad weather categorical
#> 9056                   not normal: family affairs categorical
#> 9057                         not normal: vacation categorical
#> 9058                 not normal: cleaning/repairs categorical
#> 9059                     not normal: good weather        text
```
