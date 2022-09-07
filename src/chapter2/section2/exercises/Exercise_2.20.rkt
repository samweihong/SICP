#lang sicp

(define (same-parity first-item . other-items)
  (let ((parity (if (odd? first-item) odd? even?)))
    (define (extract-item items)
      (cond ((null? items) nil)
            ((parity (car items)) (cons (car items) (extract-item (cdr items))))
            (else (extract-item (cdr items)))))
    (cons first-item (extract-item other-items))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)

(define (same-parity-iter first-item . other-items)
  (let ((parity (if (odd? first-item) odd? even?)))
    (define (extract-item-iter items)
      (define (iter items result)
        (if (null? items)
            result
            (iter (cdr items) (if (parity (car items))
                                  (append result (list (car items)))
                                  result))))
      (iter items nil))
    (cons first-item (extract-item-iter other-items))))

(same-parity-iter 1 2 3 4 5 6 7)
(same-parity-iter 2 3 4 5 6 7)
