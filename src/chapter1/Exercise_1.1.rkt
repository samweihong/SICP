#lang racket
10        ; 10
(+ 5 3 4) ; 12, since 12 = 5 + 3 + 4
(- 9 1)   ; 8, since 8 = 9 - 1
(/ 6 2)   ; 3, since 3 = 6 / 2
(+ (* 2 4) (- 4 6)) ; 6, since 6 = 8 + (-2) = (2 * 4) + (4 - 6)
(define a 3)       
(define b (+ a 1))
; a = 3, b = 4 = 3 + 1
(+ a b (* a b)) ; 19, since 19 = 3 + 4 + 12 = 3 + 4 + (3 * 4)
(= a b)         ; #f, since 3 != 4
(if (and (> b a) (< b (* a b))) ; predicate is true, as (#t and #t) = ((4 > 3) and (4 < 12))
b                               ; 4, since 4 = b
a)
(cond ((= a 4) 6)   ; this predicate is false, since a != 4
((= b 4) (+ 6 7 a)) ; 16, since 16 = 6 + 7 + 3, since this predicate is true as b = 4
(else 25))
(+ 2 (if (> b a) b a)) ; 6, since 6 = 2 + 4 = 2 + b, since the predicate is true as b > a
(* (cond ((> a b) a) ; this predicate is false, since a < b
((< a b) b)          ; 16, since 16 = 4 * (3 + 1) = b * (a + 1), since a < b
(else -1))
(+ a 1))
