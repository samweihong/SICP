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

; Euclidean distance
(define (distance p1 p2)
  (define (square x) (* x x))
  (define (sum-of-squares x y)
    (+ (square x) (square y)))
  (sqrt (sum-of-squares (- (x-point p1) (x-point p2))
                        (- (y-point p1) (y-point p2)))))

; Define rectangle using two parallel sides
(define (make-rectangle side parallel-side)
  (cons side parallel-side))
(define (p1 rectangle) (start-segment (car rectangle)))
(define (p2 rectangle) (start-segment (cdr rectangle)))
(define (p3 rectangle) (end-segment (cdr rectangle)))
(define (p4 rectangle) (end-segment (car rectangle)))

(define (length rectangle)
  (distance (p1 rectangle) (p2 rectangle)))
(define (width rectangle)
  (distance (p2 rectangle) (p3 rectangle)))

(define (perimeter rectangle)
  (* 2 (+ (length rectangle) (width rectangle))))

(define (area rectangle)
  (* (length rectangle) (width rectangle)))

(define rectangle1
  (make-rectangle (make-segment (make-point -3 3) (make-point -3 -3))
                  (make-segment (make-point 3 3) (make-point 3 -3))))

(print-point (p1 rectangle1))
(print-point (p2 rectangle1))
(print-point (p3 rectangle1))
(print-point (p4 rectangle1))
(newline)
(perimeter rectangle1)
(area rectangle1)

(define rectangle2
  (make-rectangle (make-segment (make-point 4 -5) (make-point 14 -2))
                  (make-segment (make-point 0 0) (make-point 10 3))))

(print-point (p1 rectangle2))
(print-point (p2 rectangle2))
(print-point (p3 rectangle2))
(print-point (p4 rectangle2))
(newline)
(perimeter rectangle2)
(area rectangle2)
