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

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (make-center-percent center percent)
  (let ((width (abs (/ (* percent center) 100.0))))
    (make-interval (- center width) (+ center width))))

(define (center interval)
  (/ (+ (lower-bound interval) (upper-bound interval)) 2))

(define (percent interval)
  (abs (* 100.0 (/ (- (upper-bound interval) (lower-bound interval))
                   (+ (lower-bound interval) (upper-bound interval))))))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define x (make-interval 10 20))
(define y (make-interval 4 7))

(print-interval (par1 x y))
(print-interval (par2 x y))
(newline)

(print-interval (sub-interval (make-interval 20 40)
                              x))
(newline)

(define A (make-center-percent 100 3))
(define B (make-center-percent 100 3))
(define A/A (div-interval A A))
(define A/B (div-interval A B))

(print-interval A/A)
(center A/A)
(percent A/A)
(newline)

(print-interval A/B)
(center A/B)
(percent A/B)
