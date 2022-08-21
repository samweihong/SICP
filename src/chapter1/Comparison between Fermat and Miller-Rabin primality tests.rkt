#lang sicp

; Test whether n is prime using Fermat test.
(define (fermat-test n)
  (define (square n)
    (* n n))
  ; Compute base^exp mod m
  (define (expmod base exp m)    
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m))
                      m))
          (else
           (remainder (* base (expmod base (- exp 1) m))
                      m))))
  (define (try a)
    (= (expmod a (- n 1) n) 1)) ; The test is passed if the result is 1.
  
  (try (+ 1 (random (- n 1))))) ; Test with a random a < n.

; Test whether n is prime using Miller-Rabin test.
(define (miller-rabin-test n)
  (define (square n)
    (* n n))
  ; Compute and return base^exp mod m, or 0 if it discovers a nontrivial square root of 1 mod n.
  (define (expmod base exp m)
    ; Return b^2 mod m, or 0 if it discovers a nontrivial square root of 1 mod n.
    (define (check-square-root b)
      (if (= (remainder (square b) m) 1)
          (if (or (= b 1) (= b (- n 1)))
              1
              0)
          (remainder (square b) m)))
    
    (cond ((= exp 0) 1)
          ((even? exp)
           (check-square-root (expmod base (/ exp 2) m)))
          (else
           (remainder (* base (expmod base (- exp 1) m))
                      m))))
  (define (try a)
    (= (expmod a (- n 1) n) 1)) ; The test is passed if the result is 1.
  
  (try (+ 1 (random (- n 1))))) ; Test with a random a < n.

; Test whether n is prime using Fermat and Miller-Rabin tests.
(define (prime? n times)
  (define (test-passed counter)
    (display "Passed (Tested ")
    (display counter)
    (display " times) "))
  (define (test-failed counter)
    (display "Failed (Tested ")
    (display counter)
    (display " times) "))
  (define (prime-iter test n counter)
    (cond ((> counter times) (test-passed counter))
          ((test n) (prime-iter test n (+ counter 1)))
          (else (test-failed counter))))
  
  (display "n: ")
  (display n)
  (display " *** Fermat test: ")
  (prime-iter fermat-test n 1)
  (display " Miller-Rabin test: ")
  (prime-iter miller-rabin-test n 1)
  (newline))

(display "Prime numbers:")
(newline)

(prime? 2 10)
(prime? 3 10)
(prime? 5 10)
(prime? 7 10)
(prime? 11 10)
(prime? 97 10)
(prime? 1000000007 10)
(newline)

(display "Non-prime numbers: ")
(newline)

(prime? 9 10)
(prime? 30 10)
(prime? 49 10)
(prime? 100 10)
(prime? 121 10)
(prime? 1000000019 10)
(newline)

(display "Carmichael numbers: ")
(newline)

(prime? 561 10)
(prime? 1105 10)
(prime? 1729 10)
(prime? 2465 10)
(prime? 2821 10)
(prime? 6601 10)
(prime? 1193221 10)
(newline)
