(define (enumerate-interval n m)
        (define (iter next)
          (if (>= next m) ()
            (cons next (iter (+ next 1)))))
        (iter n))

(define empty-board ())
(define (same-row? p1 p2) (= (car p1) (car p2)))
(define (same-col? p1 p2) (= (cadr p1) (cadr p2)))
(define (same-diagonal? p1 p2)
        (= (abs (- (car p1) (car p2)))
           (abs (- (cadr p1) (cadr p2)))))

(define (safe? positions)
        (let ((head (car positions))
              (tail (cdr positions)))
          (not (fold-right (lambda (x y) (or x y)) #f 
                           (map (lambda (p) 
                                  (or (same-col? head p) 
                                      (same-row? head p) 
                                      (same-diagonal? head p))) 
                                tail)))))

(define (adjoin-position r c rest-of-queens)
        (cons (list r c) rest-of-queens))


(define (queens board-size)
  (define (queen-cols k)
    (if (< k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? positions))
        (append-map
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                     new-row k rest-of-queens))
                 (enumerate-interval 0 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols (- board-size 1)))

; tests
(queens 1)
(same-col? '(1 0) '(0 0))
(safe? '((1 0) (0 0)))
(safe? '((1 2) (2 1) (0 0)))
(queens 2)
(queens 4)

