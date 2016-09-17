;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lecture2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (my-add a b) (+ a b))

(check-expect (my-add 1 1) 2)

(define (only-positive-numbers x)
  (if (>= x 0) x (error "Error: only accept positive numbers, any message here!")))




;; An enumeration lists every single piece of data that belongs to it
;; An intervel specifies a range of data in one statement.
;; An itemizations, mixes the clauses of the first two. 

;; The cond statement

;; (cond
;;   [ConditionExpression1 ResultExpression1]
;;   [ElseExpression Result]
;;)

(define (my-range x)
  (cond
    [(<= x 0) "x is less than 0"]
    [(<= x 5) "x is between 0 and 5"]
    [(>= x 5) "x is greater than 5"]))

;; The medal you win for a certain score, each score is an interval
(define (medal s)
  (cond
    [(<= 0 s 10) "bronze"]
    [(and (< 10 s) (<= s 20)) "silver"]
    [(< 20 s) "gold"]))

(define (reward medal)
  (cond
    [(string=? medal "gold") 100]
    [(string=? medal "silver") 75]
    [else 50]))

(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

(define (hours-str time) (substring time 0 2))
(define (minutes-str time) (substring time 3 5))