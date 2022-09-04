#lang sicp

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (+ a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

((zero inc) 10)
((one inc) 10)
((two inc) 10)

(define three (+ one two))
((three inc) 10)

(define five (+ two three))
((five inc) 10)

(define seven (+ two five))
((seven inc) 10)
