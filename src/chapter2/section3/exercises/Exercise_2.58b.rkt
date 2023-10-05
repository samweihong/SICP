#lang sicp

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (sum? x)
  (and (pair? x)
       (not (null? (cdr x)))
       (or (eq? (cadr x) '+)
           (sum? (cddr x)))))

(define (addend s)
  (if (eq? (cadr s) '+)
      (car s)
      (list (car s) (cadr s) (addend (cddr s)))))

(define (augend s)
  (if (eq? (cadr s) '+)
      (let ((remaining-operands (cddr s)))
        (if (null? (cdr remaining-operands))
            (car remaining-operands)
            remaining-operands))
      (augend (cddr s))))

(define (product? x)
  (define (product?-iter x has-*)
    (and (pair? x)
         (if (null? (cdr x))
             has-*
             (and (not (eq? (cadr x) '+))
                  (product?-iter (cddr x)
                                 (or has-* (eq? (cadr x) '*)))))))
  (product?-iter x #f))

(define (multiplier p)
  (if (eq? (cadr p) '*)
      (car p)
      (list (car p) (cadr p) (multiplier (cddr p)))))

(define (multiplicand p)
  (if (eq? (cadr p) '*)
      (let ((remaining-operands (cddr p)))
        (if (null? (cdr remaining-operands))
            (car remaining-operands)
            remaining-operands))
      (multiplicand (cddr p))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        (else
         (error "unknown expression type -- DERIV" exp))))

(deriv '(x + 3) 'x)

(deriv '(x * y) 'x)

(deriv '(x * 3 + 4 + 2 * x) 'x)

(deriv '(x * y * (x + 3)) 'x)

(deriv '(x + 3 * (x + y + 2)) 'x)
