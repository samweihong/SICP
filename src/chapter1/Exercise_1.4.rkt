#lang racket

(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))

#|
When b > 0, b = abs(b),
therefore the procedure should evaluate a + b.
When b <= 0, -b = abs(b),
therefore the procedure should evaluate a - b.
Thus, the operator is + when b > 0, and - otherwise.
|#

(a-plus-abs-b 50 20)
(a-plus-abs-b 50 -20)
