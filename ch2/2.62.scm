(define (union-set s1 s2)
  (cond	((null? s1) s2)
        ((null? s2) s1)
        (else (let ((head1 (car s1))
              (head2 (car s2))
              (rest1 (cdr s1))
              (rest2 (cdr s2)))
          (cond	((= head1 head2) (cons head1 (union-set rest1 rest2)))
                ((< head1 head2) (cons head1 (union-set rest1 s2)))
                (else (cons head2 (union-set s1 rest2))))
          ))))

; tests
(union-set (list 1 3 5 100) ())
(union-set (list 1 3 5 100) (list 2 4 6 100))
