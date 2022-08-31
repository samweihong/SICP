#lang sicp

(define (double f)
  (lambda (x) (f (f x))))

((double inc) 1)

(define (square x) (* x x))

((double square) 2)

(((double (double double)) inc) 5)
