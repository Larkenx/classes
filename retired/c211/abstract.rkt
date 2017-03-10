;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname abstract) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; A Tree is one of:
;;  - (make-leaf Number)
;;  - (make-node1 Number Tree)
;;  - (make-node2 Number Tree Tree)

(define-struct leaf (n))
(define-struct node1 (n t))
(define-struct node2 (n t1 t2))

(define sample-t (make-node2 1
                             (make-leaf 1)
                                        (make-node1 3 (make-leaf 5))))

(define (sum-tree t)
  (cond
    [(leaf? t) (leaf-n t)]
    [(node1? t) (+ (node1-n t) (sum-tree (node1-t t)))]
    [(node2? t) (+ (node2-n t) (sum-tree (node2-t1 t)) (sum-tree (node2-t2 t)))]))


(check-expect (sum-tree sample-t) 10)

(define (prod-tree t)
  (cond
    [(leaf? t) (leaf-n t)]
    [(node1? t) (* (node1-n t) (prod-tree (node1-t t)))]
    [(node2? t) (* (node2-n t) (prod-tree (node2-t1 t)) (prod-tree (node2-t2 t)))]))

(check-expect (prod-tree sample-t) 15)

(define (op-tree f t)
    (cond
    [(leaf? t) (leaf-n t)]
    [(node1? t) (f (node1-n t) (op-tree f (node1-t t)))]
    [(node2? t) (f (node2-n t) (op-tree f (node2-t1 t)) (op-tree f (node2-t2 t)))]))

(check-expect (op-tree + sample-t) (sum-tree sample-t))
(check-expect (op-tree * sample-t) (prod-tree sample-t))
  

(define (count-tree t)
  (cond
    [(leaf? t) 1]
    [(node1? t) (+ (count-tree (node1-t t)))]
    [(node2? t) (+ (count-tree (node2-t1 t)) (count-tree (node2-t2 t)))]))

(check-expect (count-tree sample-t) 2)

(define (process-tree )
  

