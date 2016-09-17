;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname assignment8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; Part 1
; -------
; Exercise 1
; avg-step: Number List -> Number

; Given the index a list, and a list of numbers,
; calculate the average of the elements at the index
; and before it until the index is zero.

; The list-ref function will be used to retrieve the element from the
; list; however, since the Exercise states that an index starts at
; one, we will subtract one from the index when using list-ref,
; where the index starts at 0. The if function brings the recursion
; to a stop and returns a zero when (sub1 index) = 0.

(define (avg-step index list)
  ((lambda (index list)
     (+ (if (= (sub1 index) 0) 0 (avg-step (sub1 index) list))
        (* (- (list-ref list (sub1 index)) 
              (if (= (sub1 index) 0) 0 (avg-step (sub1 index) list)))
           (/ 1 index)))) index list))

(check-expect (avg-step 3 (list 10 20 30)) 20) 

; avg: List -> Number
; avg inputs a list of numbers and outputs the average of all numbers
; in the list. We do this by just calling avg-step, but handing it an
; index which is the last element in the list or the length of the list.
; I used my count function in place of Racket's length function.

(define (avg list)
  (avg-step (count list) list))

(check-expect (avg (list 10 20 30 40 50)) 30)

; Exercise 2
; count: List -> Number
; Create a function that will count the number of items in a list.

(define (count list)
  (foldl (lambda (list-val prev) (+ prev 1)) 0 list)) 

(check-expect (count (list 1 2 5)) 3)
(check-expect (count (list "hi" "hello")) 2)

;;; Part 2
; ---------
; Exercise 161
; The book provides the following functions and design recipes:

; wage: Number -> Number
; computes the wage for h hours of work
(define (wage h)
  (* 12 h))

; wage*: List-of-Numbers -> List-of-Numbers
; computes the weekly wages for all given weekly hours
; Template:
; ---------
;(define (wage* alon)
;  (cond
;    [(empty? alon) ...]
;    [else (... (first alon) ... (wage* (rest alon)) ...)]))

(define (wage* alon)
  (cond
    [(empty? alon) '()]
    [else (cons (wage (first alon)) (wage* (rest alon)))]))

; Tests for the given examples

(check-expect (wage* '()) '())
(check-expect (wage* (cons 28 '())) (list 336))
(check-expect (wage* (list 40 28)) (list 480 336))

; Changing the function such that everyone gets $14 an hour,
; the function is defined as 'wage2' to differ from the previous
; functions above.

(define (wage2 h)
  (* 14 h))

(define (wage2* alon)
  (cond
    [(empty? alon) '()]
    [else (cons (wage2 (first alon)) (wage2* (rest alon)))]))

(check-expect (wage2* (list 10)) (list 140))

; Here is the total program revision, so that wage can be changed via
; handing the wage* an argument which is handed to wage that becomes
; the dollars paid an hour (the wage).

; Number Number -> Number
; given dollars and hours, return hours multiplied by dollars
; to reflect the pay for the amount of work.

(define (wage3 dollars h)
  (* dollars h))

(check-expect (wage3 100 10) 1000)

; Number List -> List
; given the dollars and a list, this will calculate the pay for
; every amount of hours in the given list based on the dollars
; provided.
; Template:
;(define (wage3* dollars alon)
;  (cond
;    [(empty? alon) ...]
;    [else (... (first alon) ... (wage3* dollars (rest alon)) ...)]))

(define (wage3* dollars alon)
  (cond
    [(empty? alon) '()]
    [(< 100 (first alon))
     (error "FRAUD ALERT! No employee can work this many hours!")]
    [else (cons (wage3 dollars (first alon))
                (wage3* dollars (rest alon)))]
    )
  )

(check-expect (wage3* 20 (list 10)) (list 200))

; Exercise 162

; To check if an employee's hours are over 100 hours,
; I added another cond branch to the wage3* function
; to check the hours of an employee everytime and to raise an
; error if it is true.

; (check-expect
;  (wage3* 20 (list 101))
;  (error "FRAUD ALERT! No employee can work this many hours!"))

; Exercise 163

; Number -> Number
; Given a number which is in degrees Fahrenheit,
; covert it to degrees Celsius

(define (calculateFC temp)
  (* (/ 5 9) (- temp 32)))

(check-expect (calculateFC 32) 0)

; List-of-Number -> List-of-Number
; Given a list of numbers which are degrees Fahrenheit,
; return a list of numbers converted into degrees Celsius
; Template:
; ---------
; (define (convertFC list)
;   (cond
;     [(empty? list) '()]
;     [else ... (calculateFC (first list)) ... (convertFC (rest list))]
;     )
;   )

(define (convertFC list)
  (cond
    [(empty? list) '()]
    [else (cons (calculateFC (first list)) (convertFC (rest list)))]
    )
  )

(check-expect (convertFC (list 32 212)) (list 0 100))

; Exercise 224

; Function Nelon  -> Number
; determines the maxima or minima of a given list of numbers
; where the function input is a greater than or less than procedure

(define (find-global-extreme f l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (cond
       [(f (first l) (find-global-extreme f (rest l)))
        (first l)]
       [else
        (find-global-extreme f (rest l))])]))

; Nelon -> Number
; finds the smallest number in the given list
(define (inf-1 l)
  (find-global-extreme < l))


; Nelon -> Number
; finds the largest number in the given list
(define (sup-1 l)
  (find-global-extreme > l))

(define test-list1
  (list
   25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1))

(define test-list2
  (list
   1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25))

; (check-expect (inf-1 test-list1) 1)
; (check-expect (inf-1 test-list2) 1)
; (check-expect (sup-1 test-list1) 25)
; (check-expect (sup-1 test-list2) 25)

; These functions are very slow because the find-global-extreme function
; has to recurse twice for every element in the list. Just the recursive
; branches lead to 50 steps, not to mention the other cond branches that
; are checked every time.

; Nelon -> Number
; determines the smallest number in a list

(define (inf l)
  (foldl (lambda (prev list-val) (min prev list-val)) (first l) l))

(check-expect (inf (list 5 4 1 3)) 1)

; Nelon -> Number
; determines the largest number in a list

(define (sup l)
  (foldl (lambda (prev list-val) (max prev list-val)) (first l) l))

(check-expect (sup (list 5 4 10 3)) 10)

; Function Nelon -> Number
; Determines either the max or min of the given list
; depending on the given function.

(define (find-global-extreme-2 f l)
  (foldl (lambda (prev list-val) (f prev list-val)) (first l) l))

(define (inf-2 l)
  (find-global-extreme-2 min l))

(define (sup-2 l)
  (find-global-extreme-2 max l))

; (check-expect (inf-2 test-list1) 1)
; (check-expect (inf-2 test-list2) 1)
; (check-expect (sup-2 test-list1) 25)
; (check-expect (sup-2 test-list2) 25)

; These functions are faster because rather than recurse through all
; possible permuations of greater than/less than comparisons,
; the max/min function compare the value of the next in the list,
; then only carry the min/max of the two forward. This results in
; hundreds of less steps.

; Exercise 238

; Function Number -> [List-of Number]
; tabulates a function between n and 0 (inclusive) in a list
; Template:
; ---------
;(define (tabulate f n)
;  (cond
;    [(= n 0) ...]
;    [else ... (tabulate f (sub1 n))]))

(define (tabulate f n)
  (cond
    [(= n 0) (list (f 0))]
    [else
     (cons (f n)
           (tabulate f (sub1 n)))]))

; Function Number -> [List-of Number]
; tabulates the squares between n and 0 (inclusive) in a list
(define (tab-sqr n)
  (tabulate sqr n))

(check-expect (tab-sqr 10) (list 100 81 64 49 36 25 16 9 4 1 0))

; Function Number -> [List-of Number]
; tabulates the tanget between n and 0 (inclusive) in a list
(define (tab-tan n)
  (tabulate tan n))

(check-within (tab-tan 1) (list 1.557 0) .1)

;;; Part 3

; Exercise 3

;; A Tree is one of:
;;  - (make-leaf Number)
;;  - (make-node1 Number Tree)
;;  - (make-node2 Number Tree Tree)

(define-struct leaf (val))
(define-struct node1 (val t))
(define-struct node2 (val t1 t2))

(define test-tree
  (make-node2 10 (make-node1 10 (make-leaf 20)) (make-leaf 10)))
; sum-tree: Tree -> Number
; Given a Tree, add all elements of that tree together.
; Template:
; ---------
;(define (sum-tree tree)
;  (cond
;    [(leaf? tree) ...]
;    [(node1? tree) ... (sum-tree (node1-t tree)) ...]
;    [(node2? tree) ...
;     (sum-tree (node2-t1 tree)) ...
;     (sum-tree (node2-t2 tree))]
;    )
;  )

(define (sum-tree tree)
  (cond
    [(leaf? tree) (leaf-val tree)]
    [(node1? tree) (+ (node1-val tree) (sum-tree (node1-t tree)))]
    [(node2? tree) (+ (node2-val tree)
                      (sum-tree (node2-t1 tree))
                      (sum-tree (node2-t2 tree)))]))

(check-expect (sum-tree test-tree) 50)

; prod-tree: Tree -> Number
; Given a Tree, multiply all elements of that tree together.
; Template:
; ---------
;(define (prod-tree tree)
;  (cond
;    [(leaf? tree) ...]
;    [(node1? tree) ... (prod-tree (node1-t tree)) ...]
;    [(node2? tree) ...
;     (prod-tree (node2-t1 tree)) ...
;     (prod-tree (node2-t2 tree))]
;    )
;  )

(define (prod-tree tree)
  (cond
    [(leaf? tree) (leaf-val tree)]
    [(node1? tree) (* (node1-val tree) (prod-tree (node1-t tree)))]
    [(node2? tree) (* (node2-val tree)
                      (prod-tree (node2-t1 tree))
                      (prod-tree (node2-t2 tree)))]))

(check-expect (prod-tree test-tree) 20000)

; Exercise 4
; op-tree: Function Tree -> Number
; Applies a given function to all elements of a tree
; Template:
; ---------
;(define (op-tree f tree)
;  (cond
;    [(leaf? tree) ...]
;    [(node1? tree) ... (op-tree f (node1-t tree)) ...]
;    [(node2? tree) ...
;     (op-tree f (node2-t1 tree)) ...
;     (op-tree f (node2-t2 tree))]
;    )
;  )

(define (op-tree f tree)
  (cond
    [(leaf? tree) (leaf-val tree)]
    [(node1? tree) (f (node1-val tree) (op-tree f (node1-t tree)))]
    [(node2? tree) (f (node2-val tree)
                      (op-tree f (node2-t1 tree))
                      (op-tree f (node2-t2 tree)))]))

(define (sum-tree2 tree)
  (op-tree + tree))

(check-expect (sum-tree2 test-tree) 50)

(define (prod-tree2 tree)
  (op-tree * tree))

(check-expect (prod-tree2 test-tree) 20000)

; Exercise 5

; count-tree: Tree -> Number
; given a tree, return how many leaves there are in that tree
; Template:
; ----------
;(define (count-tree tree)
;  (cond
;    [(leaf? tree) ...]
;    [(node1? tree) ... (count-tree (node1-t tree))]
;    [(node2? tree) ... (count-tree (node2-t1 tree))
;                       (count-tree (node2-t2 tree))]
;    )
;  )

;; A Tree is one of:
;;  - (make-leaf Number)
;;  - (make-node1 Number Tree)
;;  - (make-node2 Number Tree Tree)

(define (count-tree tree)
  (cond
    [(leaf? tree) 1]
    [(node1? tree) (+ (count-tree (node1-t tree)))]
    [(node2? tree) (+ (count-tree (node2-t1 tree))
                      (count-tree (node2-t2 tree)))]
    )
  )

(check-expect (count-tree test-tree) 2)

; Exercise 6/8

; process-tree: Function Any/c Any/c Any/c Tree -> Any/c
; This function differs greatly from op-tree.

; This is an abstraction of count-tree, sum-tree, and prod-tree.
; Process-tree is given a function and the then-expression of
; each value to be operated on by the given function for each
; branch respective to its predicate. This is so that the
; 'value' field of the structures leaf, node1, and node2
; can be set to any data type! However, the given function
; must consume the data types given for the cond branches
; or it will not work. For example, the given function cannot be
; + and the following cond branches strings.

; We must, however, be able to access the values of the
; leaves and nodes via their accessor functions.
; To do this, the then-expr cond arguments given
; must be *procedures* and they must be given their target.
; If we simply do a process tree without like so:

;(define (sum-tree-example tree)
;  (process-tree + (leaf-val tree) (node1-val tree) (node2-val tree)
;                tree))

; Then the result will be an error because the (leaf-val tree)
; will attempt to calculate its argument at run-time intead of
; when handed an updated tree in recursion. To escape this effect,
; we add an if function that checks whether or not our cond1, cond2,
; cond3 arguments are procedures. If so, then it calls that procedure
; on the given tree.

; (leaf's then-expr is cond1, node1's then-expr is cond2,
; node2's then-expr's are cond3, cond4)
; 
; Template:
; ---------
;(define (process-tree f cond1 cond2 cond3 tree)
;  (cond
;    [(leaf? tree) ...]
;    [(node1? tree) ...
;      (process-tree f cond1 cond2 cond3 (node1-t tree))]
;    [(node2? tree) ...
;     (process-tree f cond1 cond2 cond3 (node2-t1 tree))
;     (process-tree f cond1 cond2 cond3 (node2-t2 tree))]
;    )
;  )

(define (process-tree f cond1 cond2 cond3 tree)
  (cond
    [(leaf? tree) (if (procedure? cond1) (cond1 tree) cond1)]
    [(node1? tree)
     (f (if (procedure? cond2) (cond2 tree) cond2)
        (process-tree f cond1 cond2 cond3 (node1-t tree)))]
    [(node2? tree)
     (f (if (procedure? cond3) (cond3 tree) cond3)
        (process-tree f cond1 cond2 cond3 (node2-t1 tree))
        (process-tree f cond1 cond2 cond3 (node2-t2 tree)))]))

(check-expect
 (process-tree
   string-append " leaf" " node1" " node2"
  (make-node2 10 (make-node1 21 (make-leaf 10)) (make-leaf 10)))
 " node2 node1 leaf leaf")

; Now we will rewrite count, sum, and prod in terms of process-tree

; count-tree: Tree -> Number
; counts the leaves in a tree
(define (count-tree2 tree)
  (process-tree + 1 0 0 tree))

(check-expect (count-tree2 test-tree) 2)

; sum-tree: Tree -> Number
; sums all the values of the elements in a tree
(define (sum-tree3 a-tree)
  (process-tree
   +
   leaf-val
   node1-val 
   node2-val a-tree))

(check-expect (sum-tree3 test-tree) 50)

; prod-tree: Tree -> Number
; multiplies all the values of the elements in a tree
(define (prod-tree3 a-tree)
  (process-tree
   *
   leaf-val
   node1-val 
   node2-val a-tree))

(check-expect (prod-tree3 test-tree) 20000)

; Exercise 7
; Now that process-tree has been generalized to work with any input for
; the then-expr cond branches and any function, we can now change the
; definition of a tree.

; A Tree is one of:
; - (make-leaf X)
; - (make-node1 X Tree)
; - (make-node2 X Tree Tree)
; where X is any data-type