(define (subsets s)
        (if (null? s) (list ())
          (let ((rest (subsets (cdr s)))
                (head (car s)))
            (append rest (map (lambda (ss) (cons head ss)) rest)))))

; tests
(subsets (list 1 2 3 4 5))
