#lang sicp

(define (* a b)
  (if (= b 1)
      a
      (+ a (* a (- b 1)))))

(define (fast-* a b)
  (define (double n)
    (+ n n))
  (define (halve n)
    (/ n 2))
  (define (even? n)
    (= (remainder n 2) 0))
  (cond ((= b 1) a)
        ((even? b) (fast-* (double a) (halve b)))
        (else (+ a (fast-* a (- b 1))))))

(* 2 5)
(* 71 17)
(* 334455 667788)

(fast-* 2 5)
(fast-* 71 17)
(fast-* 334455 667788)
