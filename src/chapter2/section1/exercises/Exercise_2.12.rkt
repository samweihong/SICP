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

(define (make-center-percent center percent)
  (let ((width (abs (/ (* percent center) 100.0))))
    (make-interval (- center width) (+ center width))))

(define (center interval)
  (/ (+ (lower-bound interval) (upper-bound interval)) 2))

(define (percent interval)
  (abs (* 100.0 (/ (- (upper-bound interval) (lower-bound interval))
                   (+ (lower-bound interval) (upper-bound interval))))))

(define interval1 (make-center-percent 6.8 10))
(print-interval interval1)
(center interval1)
(percent interval1)

(define interval2 (make-center-percent -4.7 5))
(print-interval interval2)
(center interval2)
(percent interval2)

(define interval3 (make-center-percent 1 200))
(print-interval interval3)
(center interval3)
(percent interval3)

(define interval4 (make-center-percent -2 500))
(print-interval interval4)
(center interval4)
(percent interval4)
