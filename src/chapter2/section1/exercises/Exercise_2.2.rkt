#lang sicp

(define (make-point x-point y-point)
  (cons x-point y-point))

(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment start-segment end-segment)
  (cons start-segment end-segment))

(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment segment)
  (define (average x y) (/ (+ x y) 2))
  (make-point (average (x-point (start-segment segment)) (x-point (end-segment segment)))
              (average (y-point (start-segment segment)) (y-point (end-segment segment)))))

(print-point (midpoint-segment (make-segment (make-point 0 10)
                                             (make-point 20 0))))

(print-point (midpoint-segment (make-segment (make-point -10 4)
                                             (make-point -4 10))))
