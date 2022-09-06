# Exercise 2.14

> Demonstrate that Lem is right.

```scheme
(define x (make-interval 10 20))
(define y (make-interval 4 7))

(print-interval (par1 x y))
(print-interval (par2 x y))
```

```
[1.4814814814814814, 10.0]
[2.857142857142857, 5.185185185185186]
```

Lem is right; the program yields different answers for the two ways of computing.

> Investigate the behavior of the system on a va­riety of arithmetic expressions.

```scheme
(print-interval (sub-interval (make-interval 20 40)
                              x))
```

```
[0, 30]
```

While $2x - x$ evaluates to $[0, 30]$, its equivalent algebraic expression, $x$, is actually $[10, 20]$.

> Make some intervals $A$ and $B$, and use them in computing the expressions $A/A$ and $A/B$. You will get the most insight by using intervals whose width is a small percentage of the center value. Examine the results of the computation in center-percent form.

```scheme
(define A (make-center-percent 100 3))
(define B (make-center-percent 100 3))
(define A/A (div-interval A A))
(define A/B (div-interval A B))

(print-interval A/A)
(center A/A)
(percent A/A)
(newline)

(print-interval A/B)
(center A/B)
(percent A/B)
```

```
[0.9417475728155339, 1.0618556701030928]
1.0018016214593133
5.994604855629938

[0.9417475728155339, 1.0618556701030928]
1.0018016214593133
5.994604855629938
```

$A/A$ evaluates to $[0.9417475728155339, 1.0618556701030928]$, though its algebraically equivalent expression is actually $1$. Also, the percentage tolerance of the quotient is about twice the sum of the tolerances of its dividend and divisor.
