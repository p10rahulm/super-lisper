#lang racket


;We begin by considering the factorial function, defined by
;
;
;There are many ways to compute factorials. One way is to make use of the observation that n! is equal to n times (n - 1)! for any positive integer n:
;
;
;Thus, we can compute n! by computing (n - 1)! and multiplying the result by n. If we add the stipulation that 1! is equal to 1, this observation translates directly into a procedure:

(define (factorial1 n)
  (if (= n 1)
      1
      (* n (factorial1 (- n 1)))))


;We can use the substitution model of section 1.1.5 to watch this procedure in action computing 6!, as shown in figure 1.3.
;
;Now let's take a different perspective on computing factorials. We could describe a rule for computing n! by specifying that we first multiply 1 by 2, then multiply the result by 3, then by 4, and so on until we reach n. More formally, we maintain a running product, together with a counter that counts from 1 up to n. We can describe the computation by saying that the counter and the product simultaneously change from one step to the next according to the rule
;
;product   counter · product
;
;counter   counter + 1
;
;and stipulating that n! is the value of the product when the counter exceeds n.

(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

