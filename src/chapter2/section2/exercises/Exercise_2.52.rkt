#lang sicp
(#%require sicp-pict)

; a.
(define wave (segments->painter (list (make-segment (make-vect .4 1) (make-vect .35 .85))
                                      (make-segment (make-vect .35 .85) (make-vect .4 .65))
                                      (make-segment (make-vect .4 .65) (make-vect .3 .65))
                                      (make-segment (make-vect .3 .65) (make-vect .15 .6))
                                      (make-segment (make-vect .15 .6) (make-vect 0 .85))
                                      (make-segment (make-vect 0 .65) (make-vect .15 .4))
                                      (make-segment (make-vect .15 .4) (make-vect .3 .6))
                                      (make-segment (make-vect .3 .6) (make-vect .35 .5))
                                      (make-segment (make-vect .35 .5) (make-vect .25 0))
                                      (make-segment (make-vect .4 0) (make-vect .5 .3))
                                      (make-segment (make-vect .5 .3) (make-vect .6 0))
                                      (make-segment (make-vect .75 0) (make-vect .6 .45))
                                      (make-segment (make-vect .6 .45) (make-vect 1 .15))
                                      (make-segment (make-vect 1 .35) (make-vect .75 .65))
                                      (make-segment (make-vect .75 .65) (make-vect .6 .65))
                                      (make-segment (make-vect .6 .65) (make-vect .65 .85))
                                      (make-segment (make-vect .65 .85) (make-vect .6 1))
                                      (make-segment (make-vect .4 .85) (make-vect .45 .85))
                                      (make-segment (make-vect .55 .85) (make-vect .6 .85))
                                      (make-segment (make-vect .45 .77) (make-vect .5 .7))
                                      (make-segment (make-vect .5 .7) (make-vect .55 .77))
                                      (make-segment (make-vect .55 .77) (make-vect .45 .77)))))
(paint wave)

; b.
(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1)))
            (corner (corner-split painter (- n 1))))
        (beside (below painter up)
                (below right corner)))))

(paint (corner-split wave 2))

; c.
(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-vert rotate180
                                  identity flip-horiz)))
    (combine4 (corner-split painter n))))

(paint (square-limit wave 3))
