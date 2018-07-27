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


;; Exercise 2.24
;;
;; (1 (2 (3 4)))
;;
;; [ 1 | V ]
;;     [ 2 | V ]
;;         [ 3 | 4 ]
;;
;;           (1 (2 (3 4)))
;;                / \
;;               /   \
;;              1   (2 (3 4))
;;                     / \
;;                    /   \
;;                   2   (3 4)
;;                        / \
;;                       /   \
;;                      3     4


;; Exercise 2.25
;;

(define x (list 1 3 (list 5 7) 9))

(cdr (car (cdr (cdr x))))

(define x (list (list 7)))

(car (car x))

(define x (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr x))))))))))))


;; Exercise 2.26
;;

(define x (list 1 2 3))
(define y (list 4 5 6))

;; (append x y)
;; (1 2 3 4 5 6)
;;
;; (cons x y)
;; ((1 2 3) 4 5 6)
;;
;; (list x y)
;; ((1 2 3) (4 5 6))


;; Exercise 2.27
;;

(define x (list (list 1 2) (list 3 4)))

(reverse x)

(define (deep-reverse x)
  (cond ((null? x) x)
        ((not (pair? x)) x)
        (else (append (deep-reverse (cdr x)) (cons (deep-reverse (car x)) '())))))

(deep-reverse x)


;; Exercise 2.28
;;

(define (fringe x)
  (cond ((null? x) x)
        ((not (pair? x)) (list x))
        (else (append (fringe (car x)) (fringe (cdr x))))))

(fringe x)
(fringe (list x x))


;; Exercise 2.29
;;

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (mobile? mobile)
  (and (pair? mobile) (pair? (left-branch mobile))))

(define (branch? branch)
  (and (pair? branch) (not (pair? (branch-length branch)))))

(define (total-weight mobile)
  (cond ((not (pair? mobile)) mobile)
        ((not (mobile? mobile))
         (cond ((not (mobile? (branch-structure mobile))) (branch-structure mobile))
               (else (total-weight (branch-structure mobile)))))
        (else (+ (total-weight (left-branch mobile)) (total-weight (right-branch mobile))))))

(define mobile (make-mobile (make-branch 1 10) (make-branch 10 (make-mobile (make-branch 5 40) (make-branch 3 35)))))

(total-weight mobile)

(define (branch-torque branch)
  (* (branch-length branch) (total-weight (branch-structure branch))))

(define (balanced? mobile)
  (cond ((not (mobile? mobile))
         (cond ((not (mobile? (branch-structure mobile))) #t)
               (else (balanced? (branch-structure mobile)))))
        (else (and
                (balanced? (left-branch mobile))
                (balanced? (right-branch mobile))
                (= (branch-torque (left-branch mobile))
                   (branch-torque (right-branch mobile)))))))

(balanced? mobile)

(define mobile (make-mobile (make-branch 1 50) (make-branch 10 (make-mobile (make-branch 2 2.5) (make-branch 2 2.5)))))

(balanced? mobile)

;; The only changes required are to the right-branch and branch-structure accessors.

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-structure branch)
  (cdr branch))

(define mobile (make-mobile (make-branch 1 50) (make-branch 10 (make-mobile (make-branch 2 2.5) (make-branch 2 2.5)))))
(balanced? mobile)

;; Exercise 2.30

(define input (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(define expected (list 1 (list 4 (list 9 16) 25) (list 36 49)))

(define (square-tree tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(display expected)
(display (square-tree input))

(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (square sub-tree)))
         tree))

(display expected)
(display (square-tree input))
