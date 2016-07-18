(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set)))

(define (union-set s1 s2)
       (if (null? s2) s1
         (union-set (adjoin-set (car s2) s1) (cdr s2))))

; tests
(element-of-set? 1 (list 1 2 3))
(union-set (list 1 2 3) (list 3 4 5))
