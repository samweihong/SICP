#lang sicp

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(define (++ a b)
  (if (= a 0)
      b
      (++ (dec a) (inc b))))

(+ 4 5)
(++ 4 5)
