#lang sicp

(define (square n)
  (* n n))

; Test whether a^n is congruent to a modulo n for every a < n,
; and display the 'a' that doesn't satisfy the condition.
(define (test-number n)
  ; Compute base^exp modulo m.
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m))
                      m))
          (else
           (remainder (* base (expmod base (- exp 1) m))
                      m))))
  ; Compute the result of a^n mod n, and pass it to test-and-display.
  (define (compute-modulus a n)
    (test-and-display a n (expmod a n n)))
  ; Test whether `result` is equal to `a`, display both of them otherwise.
  (define (test-and-display a n result)
    (cond ((not (= result a))
           (display "a: ")
           (display a)
           (display " *** a^n mod n: ")
           (display result)
           (newline))))
  ; Test all a < n.
  (define (test-iter a n)    
    (cond ((< a n)
           (compute-modulus a n)
           (test-iter (+ a 1) n))))

  (display "n: ")
  (display n)
  (newline)
  (test-iter 1 n)
  (newline))

(test-number 3)
(test-number 5)
(test-number 10)
(test-number 12)
(test-number 15)

; Carmichael numbers
(test-number 561)  ; 561 = 3 × 11 × 17
(test-number 1105) ; 1105 = 5 × 13 × 17
(test-number 1729) ; 1729 = 7 × 13 × 19
(test-number 2465) ; 2465 = 5 × 17 × 29
(test-number 2821) ; 2821 = 7 × 13 × 31
(test-number 6601) ; 6601 = 7 × 23 × 41
