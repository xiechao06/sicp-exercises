(define (last-pair l)
  (define (iter anchor remain) 
    (if (null? remain) 
      (cons anchor ())
      (iter (car remain) (cdr remain))))
  (if (null? l) () (iter (car l) (cdr l))))

; test part
(last-pair (list))
(last-pair (list 1))
(last-pair (list 1 2 3 4))
