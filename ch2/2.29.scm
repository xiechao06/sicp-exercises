(define (make-mobile left right) (list left right))

(define (make-branch length structure) (list length structure))

(define left-branch car)

(define right-branch cadr)

(define branch-length car)

(define branch-structure cadr)


(define (total-weight m)
        (let* ((left (left-branch m))
              (right (right-branch m))
              (left-structure (branch-structure left))
              (right-structure (branch-structure right))
              (left-weight (if (number? left-structure)
                             left-structure
                             (total-weight left-structure)))
              (right-weight (if (number? right-structure)
                              right-structure
                              (total-weight right-structure))))
          (+ left-weight right-weight)))

; tests
(define m (make-mobile (make-branch 4 5) 
                       (make-branch 5 (make-mobile 
                                        (make-branch 1 3)
                                        (make-branch 3 9)))))
(total-weight m)




