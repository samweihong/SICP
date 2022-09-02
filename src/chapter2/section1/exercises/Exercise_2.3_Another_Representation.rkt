#lang sicp

(define (make-point x-point y-point)
  (cons x-point y-point))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(define (operation-on-points op p1 p2)
  (make-point (op (x-point p1) (x-point p2))
              (op (y-point p1) (y-point p2))))

; Euclidean distance
(define (distance p1 p2)
  (define (square x) (* x x))
  (define (sum-of-squares x y)
    (+ (square x) (square y)))
  (sqrt (sum-of-squares (- (x-point p1) (x-point p2))
                        (- (y-point p1) (y-point p2)))))

; Define rectangle using three points that form a right angle.
(define (make-rectangle p1 p2 p3)
  (cons p1 (cons p2 p3)))
(define (p1 rectangle) (car rectangle))
(define (p2 rectangle) (car (cdr rectangle)))
(define (p3 rectangle) (cdr (cdr rectangle)))
(define (p4 rectangle)
  (operation-on-points +
                       (p3 rectangle)
                       (operation-on-points -
                                            (p1 rectangle)
                                            (p2 rectangle))))

(define (length rectangle)
  (distance (p1 rectangle) (p2 rectangle)))
(define (width rectangle)
  (distance (p2 rectangle) (p3 rectangle)))

(define (perimeter rectangle)
  (* 2 (+ (length rectangle) (width rectangle))))

(define (area rectangle)
  (* (length rectangle) (width rectangle)))

(define rectangle1
  (make-rectangle (make-point -3 3)
                  (make-point 3 3)
                  (make-point 3 -3)))

(print-point (p1 rectangle1))
(print-point (p2 rectangle1))
(print-point (p3 rectangle1))
(print-point (p4 rectangle1))
(newline)
(perimeter rectangle1)
(area rectangle1)

(define rectangle2
  (make-rectangle (make-point 4 -5)
                  (make-point 0 0)
                  (make-point 10 3)))

(print-point (p1 rectangle2))
(print-point (p2 rectangle2))
(print-point (p3 rectangle2))
(print-point (p4 rectangle2))
(newline)
(perimeter rectangle2)
(area rectangle2)
