#lang sicp

(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(sum-integers 1 10)
(sum-integers 2 5)

(define (cube x)
  (* x x x))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(sum-cubes 1 10)
(sum-cubes 2 5)

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

(* 8 (pi-sum 1 10))
(* 8 (pi-sum 1 100))
(* 8 (pi-sum 1 1000))
(* 8 (pi-sum 1 1000000))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-cubes2 a b)
  (define (inc n) (+ n 1))
  (sum cube a inc b))

(sum-cubes2 1 10)
(sum-cubes2 2 5)        

(define (sum-integers2 a b)
  (define (identity x) x)
  (sum identity a inc b))

(sum-integers2 1 10)
(sum-integers2 2 5)

(define (pi-sum2 a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(* 8 (pi-sum2 1 10))
(* 8 (pi-sum2 1 100))
(* 8 (pi-sum2 1 1000))
(* 8 (pi-sum2 1 1000000))


(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
(integral identity 0 2 0.01)
(integral identity 0 2 0.001)
