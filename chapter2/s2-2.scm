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
(newline)

(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (square sub-tree)))
         tree))

(display expected)
(display (square-tree input))
(newline)

;; Exercise 2.31

(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map f sub-tree)
             (f sub-tree)))
       tree))

(define (square-tree tree) (tree-map square tree))

(display expected)
(display (square-tree input))
(newline)


;; Exercise 2.32
;;
;; The following solution works because it takes the subsets of the current set
;; without the first element and adds the first element to all the subsets. It
;; then appends the original subsets to this new set of subsets.


(define (subsets s)
  (if (null? s)
      (list `())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (item)
                            (append (list (car s)) item)) rest)))))

(display (subsets (list 1 2 3)))
(newline)


;; Exercise 2.33

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (append (list (p x)) y)) nil sequence))

(display (map square (list 1 2 3)))
(newline)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(display (append (list 1 2) (list 3 4)))
(newline)

(define (inc x y)
  (+ 1 y))

(define (length sequence)
  (accumulate inc 0 sequence))

(display (length (list 1 2 3)))
(newline)

;; Exercise 2.34

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                      (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

(define coefficients (list 1 2 3))
(define x 4)

;; 3 * 4^2 + 2 * 4 + 1
;; 3 * 16 + 2 * 4 + 1
;; 48 + 8 + 1
;; 48 + 8 + 1
;; 57

(display 57)
(display (horner-eval x coefficients))
(newline)

(display 79)
(display (horner-eval 2 (list 1 3 0 5 0 1)))
(newline)

;; Exercise 2.35

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (i) 1) (enumerate-tree t))))

(display 7)
(display (count-leaves input))
(newline)

;; Exercise 2.36

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(display (list 22 26 30))
(display (accumulate-n + 0 s))
(newline)

;; Exercise 2.37

(define vector (list 2 1 3))
(define matrix (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product v row)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

(define m (list (list -2 0 -1) (list 4 -4 1) (list 2 3 5)))
(define n (list (list 6 7 -1) (list -3 8 -4) (list 4 2 5)))

(define expected (list (list -16 -16 -3) (list 40 -2 17) (list 23 48 11)))

(display expected)
(display (matrix-*-matrix m n))
(newline)

;; Exercise 2.38

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define fold-right accumulate)

(display (fold-right / 1 (list 1 2 3)))
(display (fold-left / 1 (list 1 2 3)))
(display (fold-right list '() (list 1 2 3)))
(display (fold-left list '() (list 1 2 3)))
(display (fold-right + 0 (list 1 2 3)))
(display (fold-left + 0 (list 1 2 3)))
(display (fold-right * 1 (list 1 2 3)))
(display (fold-left * 1 (list 1 2 3)))
(newline)

;; The operation needs to be commutative

;; Exercise 2.39

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(display (reverse (list 1 2 3)))
(newline)

(define (reverse sequence)
  (fold-left (lambda (x y) (append (list y) x)) nil sequence))

(display (reverse (list 1 2 3)))
(newline)
