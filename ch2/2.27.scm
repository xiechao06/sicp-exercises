(define (deep-reverse l)
        (define (iter remain result) 
          (if (null? remain)
            result
            (iter (cdr remain) (cons (let ((head (car remain)))
                                       (if (list? head)
                                         (iter head ())
                                         head)) result))))
        (iter l ()))


;tests
(deep-reverse (list))
(deep-reverse (list (list 1 2) (list 3 4)))
(deep-reverse (list 1 2))
