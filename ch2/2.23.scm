(define (for-each proc l)
        (if (null? l) #t
          (begin (proc (car l)) (for-each proc (cdr l)))))

;tests
(for-each (lambda (x)
            (newline)
            (display x)) (list 1 2 3 4))
