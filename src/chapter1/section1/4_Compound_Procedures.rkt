#lang racket

(define (square x) (* x x))

(square 12)         ; 12^2 = 144
(square (+ 2 5))    ; 7^2 = 49
(square (square 3)) ; (3^2)^2 = 81

(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4) ; 3^2 + 4^2 = 5^2

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))
(f 5) ; 6^2 + 10^2 = 136
