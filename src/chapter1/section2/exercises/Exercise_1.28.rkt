#lang sicp

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

; Test whether n is prime using Miller-Rabin test `times` times.
(define (prime? n times)
  (define (prime-iter n times)
    (cond ((= times 0) true)
          ((miller-rabin-test n) (prime-iter n (- times 1)))
          (else false)))    
  
  (display "n: ")
  (display n)
  (display " ")
  (prime-iter n times))

(display "Prime numbers:")
(newline)

(prime? 2 5)
(prime? 3 5)
(prime? 5 5)
(prime? 7 5)
(prime? 11 5)
(prime? 97 5)
(newline)

(display "Non-prime numbers: ")
(newline)

(prime? 9 5)
(prime? 30 5)
(prime? 49 5)
(prime? 100 5)
(prime? 121 5)

; Carmichael numbers
(prime? 561 5)
(prime? 1105 5)
(prime? 1729 5)
(prime? 2465 5)
(prime? 2821 5)
(prime? 6601 5)
