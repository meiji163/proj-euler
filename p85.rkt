#lang racket

;; rect-count is sum_i sum_j i*j 
(define (rect-count n m)
  (/ (* m (add1 m) n (add1 n)) 4))

(define (solve)
  (define best 10000)
  (define ans 0)
  (for ([n (in-range 10 80)])
    (for ([m (in-range n 80)])
      (let ([d (abs (- 2000000 (rect-count n m)))])
      (if (< d best)
          (set!-values (best ans) (values d (* m n)))
          '()))))
  ans)

(display (solve))
