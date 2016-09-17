;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname finalexam) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (val left right))


(define examplebt1 (make-node 10 (make-node 20 empty empty) empty))

; count-nodes: Btree -> Number
; Given a btree, calculate the number of nodes in that tree
(define (count-nodes bt)
  (cond
    [(empty? bt) 0]
    [else (+ 1 (count-nodes (node-left bt)) (count-nodes (node-right bt)))]))

(check-expect (count-nodes examplebt1) 2)

; vals-at-level: Num BTree -> [Listof Num]