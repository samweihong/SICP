#lang sicp

; The test fails for small and large numbers.
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
;(sqrt 8888855555333334)

; Alternative strategy for implementing good-enough?
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

(new-sqrt 64)
(new-sqrt 0.00000025)
(new-sqrt 8888855555333334)
