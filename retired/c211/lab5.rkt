;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; Exercise 1

; A ManyPosn is one of:
; - 0
; - (make-many Posn ManyPosn)

(define-struct many (posn many))

; A posn is:
; (make-posn Number Number)

; processes-manyposn: ManyPosn -> ...
; (processes-manyposn some-mposn) ...

(define (processes-manyposn some-mposn)
  (cond
    [(posn? some-mposn) ...]
    [(many? some-mposn) (... (processes-manyposn (many-many some-mposn)))]
    )
  )

;;; Exercise 2

(make-many (make-posn 10 20) 0)
(define test-many (make-many (make-posn 10 20) (make-many (make-posn 30 40) 0)))
(make-many (make-posn 0 10) (make-many (make-posn 40 10) 0))

;; Exercise 3
(define (many-positive? some-mposn)
  (cond
    [(equal? 0 some-mposn) true]
    [(many? some-mposn) (and (<= 0 (posn-x (many-posn some-mposn)))
                             (many-positive? (many-many some-mposn)))]
    )
  )


(check-expect (many-positive?
               (make-many (make-posn 0 10) (make-many (make-posn 40 10) 0))) true)

;;; Exercise 4
(require 2htdp/image)
(require 2htdp/universe)

(define canvas
  (empty-scene 200 200))

(define (draw-posns some-mposn)
  (cond
    [(equal? 0 some-mposn) canvas]
    [(many? some-mposn) (place-image (draw-posns (many-many some-mposn))
                          (circle 5 "solid" "blue")
                          (posn-x (many-posn some-mposn))
                          (posn-y (many-posn some-mposn)))]
    )
  )
                          
                          