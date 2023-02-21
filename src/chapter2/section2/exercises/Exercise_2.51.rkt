#lang sicp
(#%require sicp-pict)

(define (below painter1 painter2)
  (let ((split-point (make-vect 0 0.5)))
    (let ((paint-top
           (transform-painter painter2
                              split-point
                              (make-vect 1 0.5)
                              (make-vect 0 1)))
          (paint-bottom
           (transform-painter painter1
                              (make-vect 0 0)
                              (make-vect 1 0)
                              split-point)))
      (lambda (frame)
        (paint-top frame)
        (paint-bottom frame)))))

(paint (below einstein (below einstein einstein)))

(define (below2 painter1 painter2)
  (rotate90 (beside (rotate270 painter1)
                    (rotate270 painter2))))

(paint (below2 einstein (below2 einstein einstein)))
