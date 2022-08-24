#lang sicp

(define (square n)
  (* n n))

(define (fermat-test n)
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m))
                      m))
          (else
           (remainder (* base (expmod base (- exp 1) m))
                      m))))
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)  
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 100000)
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