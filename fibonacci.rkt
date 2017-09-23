#lang racket

;Another common pattern of computation is called tree recursion. As an example, consider computing the sequence of Fibonacci numbers, in which each number is the sum of the preceding two:
;
;
;In general, the Fibonacci numbers can be defined by the rule
;
;
;We can immediately translate this definition into a recursive procedure for computing Fibonacci numbers:

(define x 4)
(define (fib1 n)
  (cond ((= n 0) 1)
        ((= n 1) 1)
        (else (+ (fib1 (- n 1))
                  (fib1 (- n 2))))))

(fib1 (- x 1))


;Consider the pattern of this computation. To compute (fib 5), we compute (fib 4) and (fib 3). To compute (fib 4), we compute (fib 3) and (fib 2). In general, the evolved process looks like a tree, as shown in figure 1.5. Notice that the branches split into two at each level (except at the bottom); this reflects the fact that the fib procedure calls itself twice each time it is invoked.
;
;This procedure is instructive as a prototypical tree recursion, but it is a terrible way to compute Fibonacci numbers because it does so much redundant computation. Notice in figure 1.5 that the entire computation of (fib 3) -- almost half the work -- is duplicated. In fact, it is not hard to show that the number of times the procedure will compute (fib 1) or (fib 0) (the number of leaves in the above tree, in general) is precisely Fib(n + 1). To get an idea of how bad this is, one can show that the value of Fib(n) grows exponentially with n. More precisely (see exercise 1.13), Fib(n) is the closest integer to n /5, where
;
;
;is the golden ratio, which satisfies the equation
;
;
;Thus, the process uses a number of steps that grows exponentially with the input. On the other hand, the space required grows only linearly with the input, because we need keep track only of which nodes are above us in the tree at any point in the computation. In general, the number of steps required by a tree-recursive process will be proportional to the number of nodes in the tree, while the space required will be proportional to the maximum depth of the tree.
;
;We can also formulate an iterative process for computing the Fibonacci numbers. The idea is to use a pair of integers a and b, initialized to Fib(1) = 1 and Fib(0) = 0, and to repeatedly apply the simultaneous transformations
;
;
;It is not hard to show that, after applying this transformation n times, a and b will be equal, respectively, to Fib(n + 1) and Fib(n). Thus, we can compute Fibonacci numbers iteratively using the procedure

(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter additional initial counter)
  (if (= counter 0)
      initial
      (fib-iter (+ additional initial) additional (- counter 1))))

(fib x)

   