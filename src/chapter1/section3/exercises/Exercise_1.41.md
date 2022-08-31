# Exercise 1.41

> What value is returned by
>
> ```scheme
> (((double (double double)) inc) 5)
> ```

21.

The procedure can be evaluated as follows:

```scheme
(((double (double double)) inc) 5)
(((double (lambda (x) (double (double x)))) inc) 5)
(((lambda (x) (double (double (double (double x))))) inc) 5)
((double (double (double (double inc)))) 5)
((double (double (double (double (lambda (x) (+ x 1)))))) 5)
((double (double (double (lambda (x) (+ x 2))))) 5)
((double (double (lambda (x) (+ x 4)))) 5)
((double (lambda (x) (+ x 8))) 5)
((lambda (x) (+ x 16)) 5)
(+ 5 16)
21
```
