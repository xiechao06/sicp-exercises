(define (enumerate-interval n m)
        (define (iter next)
          (if (>= next m)
            ()
            (cons next (iter (+ next 1)))))
        (iter n))


(define (unique-pairs n)
        (append-map (lambda (x) 
                   (map (lambda (y) (list y x)) (enumerate-interval 1 x))) 
                 (enumerate-interval 1 n)))


(define (unique-tripples n)
        (append-map (lambda (x) 
                      (map (lambda (pair) (append pair (list x))) (unique-pairs x))) 
                    (enumerate-interval 3 n)))

; tests
(unique-tripples 5)
