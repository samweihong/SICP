#lang sicp

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(define (repeated f n)
  (define (compose f g)
    (lambda (x) (f (g x))))
  (if (= n 0)
      identity
      (compose (repeated f (- n 1)) f)))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

((smooth abs) 0)
((smooth (smooth abs)) 0)

((n-fold-smooth abs 1) 0)
((n-fold-smooth abs 2) 0)
((n-fold-smooth abs 3) 0)
((n-fold-smooth abs 4) 0)
((n-fold-smooth abs 5) 0)
