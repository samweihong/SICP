#lang racket

; Recursive process
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

; Iterative process
(define (f2 n)
  (define (f-iter fn-1 fn-2 fn-3 counter)
    (if (> counter n)
        fn-1
        (f-iter (+ fn-1
                   (* 2 fn-2)
                   (* 3 fn-3))
                fn-1
                fn-2
                (+ counter 1))))
  (if (< n 3)
      n
      (f-iter 2 1 0 3)))

(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 10)
(f 20)
(f 30)

(f2 0)
(f2 1)
(f2 2)
(f2 3)
(f2 4)
(f2 5)
(f2 10)
(f2 20)
(f2 30)
(f2 100)
