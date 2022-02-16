#lang racket

; Cube-root procedure using Newton's method
(define (cube-root x)
  (cube-root-iter 1.0 0 x))

(define (cube-root-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
      guess
      (cube-root-iter (improve guess x)
                      guess
                      x)))

(define (good-enough? guess previous-guess)
  (< (abs (/ (- guess previous-guess) guess)) 1e-5))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(cube-root 27)
(cube-root 1024)
(cube-root 0.000000000555)
(cube-root 5555511111999994)
