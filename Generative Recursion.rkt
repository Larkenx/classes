;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Generative Recursion|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;CSCI C-211 Lab 10


;;Generative Recursion (Non-strucural Recursion)

;;While take/drop recur on the list by breaking it up according to its
;;structure, they can be used as helper functions which break a list
;;up according to some arbitrary rule


;;make-list
(define (create-list n)
  (cond
    ((equal? n 0) empty)
    (else (cons (random 100) (create-list (sub1 n))))))

;;take
;;List-of-Any Number -> List-of-Any
;;takes the first 'n' elements from the list
;;and returns them as their own list
(define (take l n)
  (cond
    ((equal? n 0) empty)
    (else (cons (first l)
                (take (rest l) (sub1 n))))))

;;drop
;;List-of-Any Number -> List-of-Any
;;Returns the given list minus the first n elements
(define (drop l n)
  (cond
    ((equal? n 0) l)
    (else (drop (rest l) (sub1 n)))))



;;my-sort
;;List-of-X [X X -> Boolean] -> List-of-X
;;Sorts a given list accroding to the function 'key'

;;Algorithm: Takes a list, divides in half according to its length,sorts
;;the two sub-list halves, and merges them together using the function 'merge'
;;Lists of length 1 or less can be considered sorted already

(define (my-sort l key)
  (cond
    ((empty? l) empty)
    ((equal? 1 (length l)) l)
    (else  
     (merge (my-sort (take l (floor(/ (length l) 2))) key)
            (my-sort (drop l (floor (/ (length l) 2))) key)
            key))))

(check-expect (my-sort (list 5 4 3 2 1) <= ) (list 1 2 3 4 5))


;;Merge
;;List-of-X List-of-X [X X -> Boolean] -> List-of-X
;;Merges two already sorted list together by traversing
;;the elements one at a time
(define (merge a b key)
  (cond
    ((empty? a) b)
    ((empty? b) a)
    (else (if (key (first a) (first b))
              (cons (first a) (merge (rest a) b key))
              (cons (first b) (merge a (rest b) key))))))


(check-expect (merge (list 1 5 10) (list 2 4 8) <=)
              (list 1 2 4 5 8 10))

(define l (create-list 1000000))
(define q (my-sort l <=))


;;(list 1 3 4  5 6) bundle into chucks of 3 (list (list 1 3) (list 4 5 6))


;;(list 5 4 3 2) -> (list (list 5 4) (list 3 2))


(define (sorted? l pred)
  (cond
    ((<= (length l) 1) #t)
    (else (and (pred (car l) (cadr l)) (sorted? (rest l) pred)))))