(define make-interval cons)
(define (upper-bound i) (max (car i) (cdr i)))
(define (lower-bound i) (min (car i) (cdr i)))

(define (sub-interval a b)
  (let ((upper-bound-diff (- (upper-bound a) (upper-bound b)))
        (lower-bound-diff (- (lower-bound a) (lower-bound b))))
   (make-interval 
     (min upper-bound-diff lower-bound-diff)
     (max upper-bound-diff lower-bound-diff))))

; test part
(display (sub-interval (make-interval -1 1) (make-interval 10 5)))
