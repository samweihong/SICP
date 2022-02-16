#lang racket

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.00000025)
#|
Since the number is very small,
the tolerance is relatively larger than its square root.
This leads to inaccurate result.
|#

;(sqrt 8888855555333334)
#|
Since the number is very large,
the computer evaluates its square root with limited decimal places.
Therefore, it eventually reaches a point where the guess cannot be further improved.
In other words, the guess is never good enough such that the good-enough? procedure always returns false.
Thus, the procedure stucks in an infinite loop and no result is returned.
|#

(define (new-good-enough? guess previous-guess)
  (< (abs (/ (- guess previous-guess) guess)) 1e-5))

(define (new-sqrt-iter guess previous-guess x)
  (if (new-good-enough? guess previous-guess)
      guess
      (new-sqrt-iter (improve guess x)
                     guess
                     x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 0 x))

(new-sqrt 64)
(new-sqrt 0.00000025)
(new-sqrt 8888855555333334)
#|
With the new good-enough? test,
the condition to halt the procedure is now:
improvement = (guess - previous-guess) < (1e-5 * guess) = tolerance
When the improvement is too small, the procedure halts and returns the value.

Also, the tolerance increases as the number increases,
which ensures accuracy for very small number and
procedure termination for very large numbers.
|#
