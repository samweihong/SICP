#lang sicp

; Iterative sum
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (sum-integers a b)
  (sum identity a inc b))

(sum-integers 1 10)
(sum-integers 2 5)

(define (sum-cubes a b)
  (define (cube x)
    (* x x x))
  (sum cube a inc b))

(sum-cubes 1 10)
(sum-cubes 2 5)
