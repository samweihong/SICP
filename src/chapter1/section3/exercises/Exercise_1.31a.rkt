#lang sicp

; Recursive product
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (product identity 2 inc n))

(factorial 5)
(factorial 10)

(define (product-pi n)
  (define (term a)
    (/ (* 4.0 a a)
       (- (* 4.0 a a) 1)))
  (/ (product term 1 inc n) 2))

(* 4 (product-pi 10))
(* 4 (product-pi 100))
(* 4 (product-pi 1000))
(* 4 (product-pi 1000000))
