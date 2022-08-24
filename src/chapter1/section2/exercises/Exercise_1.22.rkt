#lang sicp

(define (prime? n)
  (define (square n)
    (* n n))
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (= n (smallest-divisor n)))

(define (timed-prime-test n)  
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))
(define (report-prime n elapsed-time)
  (display n)  
  (display " *** ")
  (display elapsed-time)
  (newline)
  #t)

(define (search-for-primes start count)
  (define (search-iter n counter)
    (cond ((> counter 0)
           (if (timed-prime-test n)
               (search-iter (+ n 2) (- counter 1))
               (search-iter (+ n 2) counter)))))
  (search-iter (if (odd? start) start (+ start 1))
               count))

(display "Three smallest primes larger than 1000: \n")
(search-for-primes 1000 3)
(display "Three smallest primes larger than 10000: \n")
(search-for-primes 10000 3)
(display "Three smallest primes larger than 10^5: \n")
(search-for-primes 100000 3)
(display "Three smallest primes larger than 10^6: \n")
(search-for-primes 1000000 3)
(display "Three smallest primes larger than 10^7: \n")
(search-for-primes 10000000 3)
(display "Three smallest primes larger than 10^8: \n")
(search-for-primes 100000000 3)
(display "Three smallest primes larger than 10^9: \n")
(search-for-primes 1000000000 3)
(display "Three smallest primes larger than 10^10: \n")
(search-for-primes 10000000000 3)
(display "Three smallest primes larger than 10^11: \n")
(search-for-primes 100000000000 3)
(display "Three smallest primes larger than 10^12: \n")
(search-for-primes 1000000000000 3)
(display "Three smallest primes larger than 10^13: \n")
(search-for-primes 10000000000000 3)
(display "Three smallest primes larger than 10^14: \n")
(search-for-primes 100000000000000 3)
(display "Three smallest primes larger than 10^15: \n")
(search-for-primes 1000000000000000 3)