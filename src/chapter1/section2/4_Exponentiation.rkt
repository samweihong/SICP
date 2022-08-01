#lang sicp

; Recursive process
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

; Iterative process
(define (expt2 b n)
  (define (expt-iter counter product)
    (if (= counter 0)
        product
        (expt-iter (- counter 1)
                   (* b product))))
  (expt-iter n 1))

(define (fast-expt b n)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (square n)
    (* n n))
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(expt 3 5)
(expt2 3 5)
(fast-expt 3 5)

(expt 2 1000)
(expt2 2 1000)
(fast-expt 2 1000)
