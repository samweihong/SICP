#lang sicp

(define (make-interval lower-bound upper-bound)
  (cons lower-bound upper-bound))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (print-interval interval)
  (display "[")
  (display (lower-bound interval))
  (display ", ")
  (display (upper-bound interval))
  (display "]")
  (newline))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(print-interval (sub-interval (make-interval 20 50)
                              (make-interval 10 100)))

(print-interval (sub-interval (make-interval -20 50)
                              (make-interval -10 100)))

(print-interval (sub-interval (make-interval -50 20)
                              (make-interval -100 10)))

(print-interval (sub-interval (make-interval -50 -20)
                              (make-interval -100 -10)))
