# Validate arguments forwarded to a LASA label function

Internal helper used by
[`read_lasa_sav()`](https://highmeadows.github.io/CleanLASA/reference/read_lasa_sav.md)
to make forwarding through `...` explicit and predictable. All forwarded
arguments must be named. When the selected label function does not
declare `...`, every forwarded argument is checked against that
function's formal arguments before
[`do.call()`](https://rdrr.io/r/base/do.call.html) is used.

## Usage

``` r
.lasa_validate_forwarded_label_arguments(args, label_fun, label_fun_name)
```

## Arguments

- args:

  Named list of user-supplied arguments from `...`.

- label_fun:

  The selected file-specific label function.

- label_fun_name:

  Character scalar naming `label_fun`, used in messages.

## Value

Invisibly `NULL`; called for validation side effects.
