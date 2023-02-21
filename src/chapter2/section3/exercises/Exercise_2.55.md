# Exercise 2.55

> Eva Lu Ator types to the interpreter the expression
>
> ```scheme
>  (car ''abracadabra)
> ```
>
> To her surprise, the interpreter prints back `quote`. Explain.

Since `'abracadabra` is equivalent to `(quote abracadabra)`, `''abracadabra` evaluates to `'(quote abracadabra)'`, which is a list containing the symbols `quote` and `abracadabra`. Hence, the procedure `car` returns the first value: `quote`.
