#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; a.

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))

(define mobile1
  (make-mobile (make-branch 3 12)
               (make-branch 4 (make-mobile (make-branch 5 6)
                                           (make-branch 10 3)))))
mobile1

(define mobile2
  (make-mobile (make-branch 2 9)
               (make-branch 1 (make-mobile (make-branch 7 (make-mobile (make-branch 1 3)
                                                                       (make-branch 3 1)))
                                           (make-branch 2 (make-mobile (make-branch 2 10)
                                                                       (make-branch 5 4)))))))
mobile2

(define mobile3
  (make-mobile (make-branch 4
                            (make-mobile (make-branch 2 5)
                                         (make-branch 3 6)))
               (make-branch 11 4)))
mobile3

(define mobile4
  (make-mobile (make-branch 2
                            (make-mobile (make-branch 3 2)
                                         (make-branch 1 6)))
               (make-branch 1
                            (make-mobile (make-branch 4 5)
                                         (make-branch 2 10)))))
mobile4
(newline)

; b.

(define (total-weight mobile)
  (if (not (pair? mobile))
      mobile
      (+ (total-weight (branch-structure (left-branch mobile)))
         (total-weight (branch-structure (right-branch mobile))))))

(total-weight mobile1)
(total-weight mobile2)
(total-weight mobile3)
(total-weight mobile4)
(newline)

(total-weight mobile1)
(total-weight mobile2)
(total-weight mobile3)
(total-weight mobile4)
(newline)

; c.

(define (balanced? mobile)
  ; Returns whether the mobile is balanced and its weight in a pair.
  (define (balanced?-and-weight mobile)
    (if (not (pair? mobile))
        (cons true mobile)
        (let ((left (balanced?-and-weight (branch-structure (left-branch mobile))))
              (right (balanced?-and-weight (branch-structure (right-branch mobile)))))
          (cons (and (car left)
                     (car right)
                     (= (* (branch-length (left-branch mobile)) (cdr left))
                        (* (branch-length (right-branch mobile)) (cdr right))))
                (+ (cdr left) (cdr right))))))
  (car (balanced?-and-weight mobile)))

(balanced? mobile1)
(balanced? mobile2)
(balanced? mobile3)
(balanced? mobile4)
(newline)
