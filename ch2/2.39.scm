(define (reverse-1 s)
        (fold-right (lambda (x y) (append y (list x))) () s))

(define (reverse-2 s)
        (fold-left (lambda (x y) (cons y x)) () s))

; tests
(reverse-1 (list 1 2 3 4))
(reverse-2 (list 1 2 3 4))
