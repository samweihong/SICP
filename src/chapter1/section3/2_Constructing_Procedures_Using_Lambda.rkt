#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

(* 8 (pi-sum 1 100))
(* 8 (pi-sum 1 1000))

(define (integral f a b dx)
  (* (sum f
          (+ a (/ dx 2))
          (lambda (x) (+ x dx))
          b)
     dx))

(integral identity 0 1 0.01)
(integral identity 0 1 0.001)

; Using `let` to create local variables

(define square
  (lambda (x) (* x x)))

(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y))
            (- 1 y)))

(f 1 2)
(f 10 5)

(define (f2 x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(f2 1 2)
(f2 10 5)

(define (f3 x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))

(f3 1 2)
(f3 10 5)
