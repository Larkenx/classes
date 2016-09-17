;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lab15) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; A ByTwo is one of:
;; - empty
;; - (make-two Number NUmber ByTwo)
(define-struct two (first second rest))

; Length 3
(define btexample1
  (make-two 10 10 (make-two 20 20 (make-two 10 20 empty))))

(define btexample2
  (make-two 20 2 empty))

(define (bylength bt)
  (cond
    [(empty? bt) 0]
    [else (+ 1 (bylength (two-rest bt)))]))

(check-expect (bylength btexample1) 3)

(define (bysum bt)
  (cond
    [(empty? bt) 0]
    [else (+ (two-first bt) (two-second bt) (bysum (two-rest bt)))]))

(check-expect (bysum btexample1) 90)

(define (byproduct bt)
  (cond
    [(empty? bt) 1]
    [else (* (two-first bt) (two-second bt) (byproduct (two-rest bt)))]))

(check-expect (byproduct btexample2) 40)

; ----- Begin Accumulator Versions --------

(define (bylength/acc bt acc)
  (cond
    [(empty? bt) acc]
    [else (bylength/acc (two-rest bt) (add1 acc))]))

(define (bylength2 bt)
  (bylength/acc bt 0))

(check-expect (bylength2 btexample1) 3)

(define (bysum/acc bt acc)
  (cond
    [(empty? bt) acc]
    [else (bysum/acc (two-rest bt) (+ (two-first bt) (two-second bt) acc))]))

(define (bysum2 bt)
  (bysum/acc bt 0))

(check-expect (bysum2 btexample1) 90)

(define (byproduct/acc bt acc) 
  (cond
    [(empty? bt) acc]
    [else (byproduct/acc (two-rest bt) (* acc (two-first bt) (two-second bt)))]))

(define (byproduct2 bt)
  (byproduct/acc bt 1))

(check-expect (byproduct2 btexample2) 40)

; -------- Abstraction/Local/Lambda

; Exercise 5

; process-bytwo: ByTwo Procedure -> ...
(define (process-bytwo bt proc)
  (cond
    [(empty? bt) (if (equal? proc +) 0 1)]
    [else (proc (two-first bt) (two-second bt) (byproduct (two-rest bt)))]))

(define (abstract-bysum bt)
  (local [(define (process-bytwo bt proc)
  (cond
    [(empty? bt) (if (equal? proc +) 0 1)]
    [else (proc (two-first bt) (two-second bt) (byproduct (two-rest bt)))]))]
    (process-bytwo bt +)))

(define (abstract-byproduct bt)
  (local [(define (process-bytwo bt proc)
  (cond
    [(empty? bt) (if (equal? proc +) 0 1)]
    [else (proc (two-first bt) (two-second bt) (byproduct (two-rest bt)))]))]
    (process-bytwo bt *)))


    


