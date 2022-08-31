#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0)
      identity
      (compose (repeated f (- n 1)) f)))

(define (square x) (* x x))

((repeated square 2) 5)
((repeated inc 100) 10)

(define (repeated-iter f n)
  (define (iter i result)
    (if (= i n)
        result
        (iter (+ i 1) (compose f result))))
  (iter 0 identity))

((repeated-iter square 2) 5)
((repeated-iter inc 100) 10)

(define (double f)
  (lambda (x) (f (f x))))

(define (fast-repeated f n)
  (cond ((= n 0) identity)
        ((even? n) (double (fast-repeated f (/ n 2))))
        (else (compose f (fast-repeated f (- n 1))))))

((fast-repeated square 2) 5)
((fast-repeated inc 100) 10)

(define (fast-repeated-iter f n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (double b) (/ n 2)))
          (else (iter (compose a b) b (- n 1)))))
  (iter identity f n))

((fast-repeated-iter square 2) 5)
((fast-repeated-iter inc 100) 10)
