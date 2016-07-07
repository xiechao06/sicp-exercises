(define (enumerate-interval n m)
        (define (iter next)
          (if (>= next m) ()
            (cons next (iter (+ next 1)))))
        (iter n))

(define (flatmap proc s)
        (fold-right append () (map proc s)))


(define (unique-pairs n)
        (flatmap (lambda (x) (map (lambda (y) (list y x)) (enumerate-interval 1 x))) (enumerate-interval 2 n)))

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (prime-sum-pairs n) 
  (map (lambda (pair) (let ((first (car pair))  (second (cadr pair))) 
                        (list first second (+ first second))))
       (filter (lambda (pair) (prime? (+ (car pair) (cadr pair)))) (unique-pairs n))))
; tests
(enumerate-interval 1 5)
(unique-pairs 5)
(prime-sum-pairs 5)
