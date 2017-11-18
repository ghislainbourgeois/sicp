(RESTART 1)
;; Exercise 2.17

(define (last-pair x)
  (if (null? (cdr x))
      (car x)
      (last-pair (cdr x))))

(last-pair (list 23 72 149 34))


;; Exercise 2.18

(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))))

(define (reverse x)
  (if (null? (cdr x))
      x
      (append (reverse (cdr x)) (cons (car x) '()))))

(reverse (list 1 4 9 16 25))


;; Exercise 2.19

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination
                   coin-values))
             (cc (- amount
                    (first-denomination
                      coin-values))
                 coin-values)))))

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (no-more? coins) (null? coins))
(define (except-first-denomination coins) (cdr coins))
(define (first-denomination coins) (car coins))

(cc 100 us-coins)
(cc 100 (reverse us-coins))

;; The order does not matter because the procedure will go through all the
;; tree of possibilities. This implementation is equivalent to the
;; original implementation that supported any order already, but uses
;; lists instead of a procedure and a counter.


;; Exercise 2.20

(define (same-parity first . rest)
  (define (same? f? r)
    (if (null? r)
      '()
      (if (f? (car r))
        (cons (car r) (same? f? (cdr r)))
        (same? f? (cdr r)))))
  (if (even? first)
    (cons first (same? even? rest))
    (cons first (same? odd? rest))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)


;; Exercise 2.21

(define (square-list items)
  (if (null? items)
    '()
    (cons (square (car items)) (square-list (cdr items)))))

(define (square-list items)
  (map square items))

(square-list (list 1 2 3 4))


;; Exercise 2.22
;;
;; The answer is always appended at the end of the newer list
;; The second version always has a first element of nil


;; Exercise 2.23

(define (for-each f items)
  (define (apply-and-recurse)
    (f (car items))
    (for-each f (cdr items)))
  (if (null? items)
    #t
    (apply-and-recurse)))

(for-each (lambda (x) (newline)
            (display x))
          (list 57 321 88))
