(define (fringe-1 t)
        (if (null? t) () (let ((head (car t)))
           (if (list? head)
             (append (fringe-1 head) (fringe-1 (cdr t)))
             (cons head (fringe-1 (cdr t)))))))

;tests
(define x (list (list 1 2) (list 3 4)))
(fringe-1 x)
(fringe-1 (list x x))
