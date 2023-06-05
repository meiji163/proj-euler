#lang racket
(require racket/stream)

(define *MAX* 80)

(define (sieves s)
  (if (stream-empty? s)
      empty-stream
      (let ((fst (stream-first s)))
        (stream-cons fst
                     (sieves
                      (stream-filter
                       (lambda (q) (not (zero? (modulo q fst))))
                       (stream-rest s)))))))

(define primes (stream->list
  (sieves (in-range 2 *MAX*))))
(define counts (for/vector ((i (in-range *MAX*))) 0))

;; iter count ways form sums of primes in non-decreasing order
(define (iter-count minp n)
  (vector-set! counts
               n
               (add1 (vector-ref counts n)))
  (for/list ((p primes))
    (when (and (<= minp p) (< (+ n p) *MAX*))
      (iter-count p (+ n p)))))

 (void (iter-count 2 0))

 (for/list ((c (vector->list counts))
            (i (in-range *MAX*))
            #:when (>= c 5000)
            #:final (>= c 5000))
   (list i c))                          ; => (71 5007)
