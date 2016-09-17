;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Untitled) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A run-length-encoding is a struct which holds a number and how many
; times that given number appears consecutively in a row.
(define-struct rle (val count))
(make-rle 2 2)

; [Listof rle] -> [Listof Number]
; Inputs a list of rle and returns a lon consisting of all
; the rle's in the list.
(define (decompress-numbers list)
   (foldr append '()
          (map (lambda (x) (make-list (rle-count x) (rle-val x))) list)))

(check-expect (decompress-numbers
               (list (make-rle 2 2) (make-rle 3 3) (make-rle 1 3)))
              (list 2 2 3 3 3 1 1 1))

; Number [Listof X]
; Takes a number n, then drops the first n elements of the list
; and returns the rest of that list.
(define (drop n list)
  (cond
    [(or (empty? list) (zero? n)) list]
    [else (drop (sub1 n) (rest list))]))

; X [Listof X] -> Number
; Counts how many times the val appears consecutively in the list
(define (count-occurences val list)
  (cond
    [(or (empty? list) (not (equal? val (first list)))) 0]
    [else (+ 1 (count-occurences val (rest list)))]))

; [Listof Number] -> [Listof rle]
; Compresses a list of numbers into a rle
(define (compress-numbers lon)
  (cond
    [(empty? lon) '()]
    [else (local [(define get-rle-count (count-occurences (first lon) lon))]
            (cons (make-rle (first lon) get-rle-count)
                (compress-numbers (drop get-rle-count lon))))]))
