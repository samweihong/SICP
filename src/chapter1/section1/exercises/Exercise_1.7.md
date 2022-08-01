# Exercise 1.7

```scheme
(sqrt 0.00000025)
```
Since the number is very small,
the tolerance is relatively larger than its square root.
This leads to inaccurate result.

```scheme
(sqrt 8888855555333334)
```
Since the number is very large,
the computer evaluates its square root with limited decimal places.
Therefore, it eventually reaches a point where the guess cannot be further improved.
In other words, the guess is never good enough such that the `good-enough?` procedure always returns false.
Thus, the procedure stucks in an infinite loop and no result is returned.

```scheme
(define (new-good-enough? guess previous-guess)
  (< (abs (/ (- guess previous-guess) guess))
     1e-5))

(define (new-sqrt-iter guess previous-guess x)
  (if (new-good-enough? guess previous-guess)
      guess
      (new-sqrt-iter (improve guess x)
                     guess
                     x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 0 x))
```
With the new `good-enough?` test,
the condition to halt the procedure is now

$$\begin{aligned}
|\textnormal{guess}-\textnormal{previous-guess}| &< |1e-5 * \textnormal{guess}|
\\
\textnormal{improvement} &< \textnormal{tolerance}
\end{aligned}$$

When the improvement is too small, the procedure halts and returns the value. \
Also, the tolerance increases as the number increases,
which ensures accuracy for very small number and
procedure termination for very large numbers.
