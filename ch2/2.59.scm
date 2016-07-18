(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set)))

(define (union-set s1 s2)
        (define (iter result rest) 
          (if (null? rest) result
            (iter (adjoin-set (car rest) result) (cdr rest))))
        (iter s2 s1))

; tests
(element-of-set? 1 (list 1 2 3))
(union-set (list 1 2 3) (list 3 4 5))
