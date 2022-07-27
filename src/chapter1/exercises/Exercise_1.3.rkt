#lang sicp

(define (sum-of-squares x y)
  (+ (* x x)
     (* y y)))

; Return the sum of the squares of two larger numbers.
(define (sum x y z)
  (if (> x y)
      (if (> y z)
          (sum-of-squares x y)    ; z is minimum
          (sum-of-squares x z))   ; y is minimum
      (if (> x z)
          (sum-of-squares x y)    ; z is minimum
          (sum-of-squares y z)))) ; x is minimum

(sum 32 64 100)
(sum 32 100 64)
(sum 64 32 100)
(sum 64 100 32)
(sum 100 32 64)
(sum 100 64 32)
