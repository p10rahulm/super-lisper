#lang racket
;Exercise 1.11.  A function f is defined by the rule that
;f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3.
;Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

(define (myrecursion n)
  (if (or (< (- n 3) 0))
      n
      (+ (myrecursion (- n 1)) (* 2 (myrecursion (- n 2))) (* 3 (myrecursion (- n 3))))))

(myrecursion 5)


      

