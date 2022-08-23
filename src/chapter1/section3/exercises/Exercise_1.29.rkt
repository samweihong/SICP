#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (simpson-integral f a b n)
  (define (simpson-integral-with-h h)
    (define (next a)
      (+ a h h))

    (* (/ h 3.0)
       (+ (f a)
          (f b)
          (* 4 (sum f (+ a h) next b))
          (* 2 (sum f (next a) next (- b h))))))
  (simpson-integral-with-h (/ (- b a) n)))

(define (cube x)
  (* x x x))

(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)

(+ 1 (simpson-integral exp 0 1 10))
(+ 1 (simpson-integral exp 0 1 100))
(+ 1 (simpson-integral exp 0 1 10000))
