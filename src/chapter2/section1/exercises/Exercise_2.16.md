# Exercise 2.16

> Explain, in general, why equivalent algebraic expressions may lead to differ­ent answers.

This issue is known as the dependency problem in interval arithmetic, where the repeated occurrence of the same variables is recognised as independent intervals.

As demonstrated in `Exercise_2.14.rkt`, the program may take different values for the variables $2x$ and $x$, even though they refer to the same $x$. Thus, the resulting interval over-expands unnecessarily.

```scheme
(define x (make-interval 10 20))
(print-interval (sub-interval (make-interval 20 40)
                              x))
```

```
[0, 30]
```

In contrast, if the program always takes the same values for the $2x$ and $x$ variables, the result equals the equivalent algebraic expression, $x$.

Lower bound: $2\left(10\right)-10=10$ \
Upper bound: $2\left(20\right)-20=20$ \
Resulting interval: $[10,20] = x$

> Can you devise an interval-arithmetic package that does not have this shortcoming, or is this task impossible?

I view this task as impossible. In order to achieve an exact result, the expression should be written such that each variable appears only once.

However, it is difficult or even impossible to rewrite certain expressions. For instance, fractions like $\dfrac{A+B}{A+C}$ and higher degree polynomials like $A^{3}+A^{2}+A+1$.
