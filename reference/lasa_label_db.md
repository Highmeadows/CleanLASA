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
#> [1] 18963
subset(db$variables, filecode == "046" & wave == "B")
#>      filecode wave variable_name canonical_name
#> 8953      046    B      blphya01        lphya01
#> 8954      046    B      blphya02        lphya02
#> 8955      046    B      blphya03        lphya03
#> 8956      046    B      blphya04        lphya04
#> 8957      046    B      blphya05        lphya05
#> 8958      046    B      blphya06        lphya06
#> 8959      046    B      blphya07        lphya07
#> 8960      046    B      blphya08        lphya08
#> 8961      046    B      blphya09        lphya09
#> 8962      046    B      blphya10        lphya10
#> 8963      046    B      blphya11        lphya11
#> 8964      046    B      blphya12        lphya12
#> 8965      046    B      blphya13        lphya13
#> 8966      046    B      blphya14        lphya14
#> 8967      046    B      blphya15        lphya15
#> 8968      046    B      blphya16        lphya16
#> 8969      046    B      blphya17        lphya17
#> 8970      046    B      blphya18        lphya18
#> 8971      046    B      blphya19        lphya19
#> 8972      046    B      blphya20        lphya20
#> 8973      046    B      blphya21        lphya21
#> 8974      046    B      blphya22        lphya22
#> 8975      046    B      blphya23        lphya23
#> 8976      046    B      blphya24        lphya24
#> 8977      046    B      blphya25        lphya25
#> 8978      046    B      blphya26        lphya26
#> 8979      046    B      blphya27        lphya27
#> 8980      046    B      blphya28        lphya28
#> 8981      046    B      blphya29        lphya29
#> 8982      046    B      blphya30        lphya30
#> 8983      046    B      blphya31        lphya31
#> 8984      046    B      blphya32        lphya32
#> 8985      046    B      blphya33        lphya33
#> 8986      046    B      blphya34        lphya34
#> 8987      046    B      blphya35        lphya35
#> 8988      046    B      blphya36        lphya36
#> 8989      046    B      blphya37        lphya37
#> 8990      046    B      blphya38        lphya38
#> 8991      046    B      blphya39        lphya39
#> 8992      046    B      blphya40        lphya40
#> 8993      046    B      blphya41        lphya41
#> 8994      046    B      blphya42        lphya42
#> 8995      046    B      blphya43        lphya43
#> 8996      046    B      blphya44        lphya44
#> 8997      046    B      blphya45        lphya45
#> 8998      046    B      blphya46        lphya46
#>                                    variable_label
#> 8953   Physical condition respondent: observation
#> 8954                        Wheelchair go outside
#> 8955        Wheelchair go outside: last two weeks
#> 8956 Wheelchair go outside: #times last two weeks
#> 8957                  Wheelchair: time in minutes
#> 8958                              Walking outside
#> 8959               Walking outside:last two weeks
#> 8960       Walking outside: #times last two weeks
#> 8961                     Walking: time in minutes
#> 8962                                    Bicycling
#> 8963                    Bicycling: last two weeks
#> 8964            Bicycling: # times last two weeks
#> 8965                   Bicycling: time in minutes
#> 8966                          Have garden: yes/no
#> 8967                            Gardening: yes/no
#> 8968                   Gardening: # months a year
#> 8969                    Gardening: last two weeks
#> 8970                  Gardening: # last two weeks
#> 8971                   Gardening: time in minutes
#> 8972            Gardening: digging last two weeks
#> 8973               Sport 1: past two weeks yes/no
#> 8974                      Sport 1: past two weeks
#> 8975              Sport 1: # times past two weeks
#> 8976                     Sport 1: time in minutes
#> 8977                              Sport 2: yes/no
#> 8978                      Sport 2: past two weeks
#> 8979              Sport 2: # times past two weeks
#> 8980                    Sport 2 : time in minutes
#> 8981        Sport: sweating past two weeks yes/no
#> 8982        Sport: #times sweating past two weeks
#> 8983                      Light household: yes/no
#> 8984       Light household: past two weeks yes/no
#> 8985       Light household: # days past two weeks
#> 8986             Light household: time in minutes
#> 8987                      Heavy household: yes/no
#> 8988       Heavy household: past two weeks yes/no
#> 8989       Heavy household: # days past two weeks
#> 8990             Heavy household: time in minutes
#> 8991                Past two weeks normal: yes/no
#> 8992                             not normal: sick
#> 8993                        not normal: depressed
#> 8994                      not normal: bad weather
#> 8995                   not normal: family affairs
#> 8996                         not normal: vacation
#> 8997                     not normal: other reason
#> 8998              not normal: other reasons coded
#>                              harmonized_var_label    var_type
#> 8953   Physical condition respondent: observation categorical
#> 8954                        Wheelchair go outside categorical
#> 8955        Wheelchair go outside: last two weeks categorical
#> 8956 Wheelchair go outside: #times last two weeks     numeric
#> 8957                  Wheelchair: time in minutes     numeric
#> 8958                              Walking outside categorical
#> 8959               Walking outside:last two weeks categorical
#> 8960       Walking outside: #times last two weeks     numeric
#> 8961                     Walking: time in minutes     numeric
#> 8962                                    Bicycling categorical
#> 8963                    Bicycling: last two weeks categorical
#> 8964            Bicycling: # times last two weeks     numeric
#> 8965                   Bicycling: time in minutes     numeric
#> 8966                          Have garden: yes/no categorical
#> 8967                            Gardening: yes/no categorical
#> 8968                   Gardening: # months a year     numeric
#> 8969                    Gardening: last two weeks categorical
#> 8970                  Gardening: # last two weeks     numeric
#> 8971                   Gardening: time in minutes     numeric
#> 8972            Gardening: digging last two weeks categorical
#> 8973               Sport 1: past two weeks yes/no categorical
#> 8974                      Sport 1: past two weeks categorical
#> 8975              Sport 1: # times past two weeks     numeric
#> 8976                     Sport 1: time in minutes     numeric
#> 8977                              Sport 2: yes/no categorical
#> 8978                      Sport 2: past two weeks categorical
#> 8979              Sport 2: # times past two weeks     numeric
#> 8980                    Sport 2 : time in minutes     numeric
#> 8981        Sport: sweating past two weeks yes/no categorical
#> 8982        Sport: #times sweating past two weeks     numeric
#> 8983                      Light household: yes/no categorical
#> 8984       Light household: past two weeks yes/no categorical
#> 8985       Light household: # days past two weeks     numeric
#> 8986             Light household: time in minutes     numeric
#> 8987                      Heavy household: yes/no categorical
#> 8988       Heavy household: past two weeks yes/no categorical
#> 8989       Heavy household: # days past two weeks     numeric
#> 8990             Heavy household: time in minutes     numeric
#> 8991                Past two weeks normal: yes/no categorical
#> 8992                             not normal: sick categorical
#> 8993                        not normal: depressed categorical
#> 8994                      not normal: bad weather categorical
#> 8995                   not normal: family affairs categorical
#> 8996                         not normal: vacation categorical
#> 8997                 not normal: cleaning/repairs categorical
#> 8998                     not normal: good weather categorical
```
