(define (adjoin-set x set)
        (let ((head (car set))) 
          (cond	((null? set) (cons x ()))
                ((= head x) (cons x (cdr set)))
                ((< head x) (cons head (adjoin-set x (cdr set))))
                (else (cons x set))))
        )

; tests
(adjoin-set 3 (list 1 2 4 5))
