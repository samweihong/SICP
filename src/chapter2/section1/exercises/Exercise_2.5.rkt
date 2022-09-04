#lang sicp

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

; Returns the largest n such that x ≡ 0 (mod divisor^n).
(define (extract-power x divisor)
  (if (= (remainder x divisor) 0)
      (+ 1 (extract-power (/ x divisor) divisor))
      0))

(define (car x)
  (extract-power x 2))

(define (cdr x)
  (extract-power x 3))

(define pair1 (cons 7 15))
(car pair1)
(cdr pair1)

(define pair2 (cons 10 30))
(car pair2)
(cdr pair2)
