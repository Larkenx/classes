;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)
; Exercise 1
; A ListofStrings contains:
; 1) empty
; 2) (list string string ...)
; A list of strings contains strings
; Template:
; (processes-los los)
; (cond
;  [(empty? los) ...]
;  [(string? (car los)) ...]
;  [(list? los) (process (cdr los))]))

; Exercise 2
(define (has-word? los s)
  (cond
    [(empty? los) #false]
    [(equal? (car los) s) #true]
    [(cons? los) (has-word? (cdr los) s)]
    )
  )

(check-expect (has-word? (list "a" "b" "c") "a") #true)
(check-expect (has-word? (list "a" "b" "c" empty) "d") #false)

; Exercise 3
(define filelist (list "thefly.txt" "thegerm.txt" "theoctopus.txt" "theostrich.txt"
                       "thetermite.txt"))

; Exercise 4
; file-has-word?: String String -> boolean
(define (file-has-word? filename word)
  (has-word? (read-words filename) word))

(check-expect (file-has-word? "thefly.txt" "Ogden") #true)
(check-expect (file-has-word? "thefly.txt" "penguin") #false)

; Exercise 5
; search-files: LoS String -> LoS
(define (search-files files word)
  (cond
    [(empty? files) empty]
    [(file-has-word? (car files) word) (cons
                                        (car files)
                                        (search-files (cdr files) word))]
    [else (search-files (cdr files) word)]
    )
  )

(check-expect (search-files filelist "Ogden")
              (cons
               "thefly.txt"
               (cons
                "thegerm.txt"
                (cons "theoctopus.txt"
                      (cons "theostrich.txt"
                            (cons "thetermite.txt" '()))))))

; Exercise 6
(search-files filelist "one")


(require 2htdp/image)
(require 2htdp/universe)
; Exercise 7
; A ripple is a:
; (cons x (cons y (cons r)))

; A WorldofRipples is one of
; - empty
; (cons Ripple WorldofRipples)

(define (ripple-image r)
  (circle r "outline" "blue"))

(define (make-ripple ripple)
  (place-image
 (ripple-image (car (cdr (cdr ripple))))
 (car ripple)
 (car (cdr ripple))
 (empty-scene 200 200)))

(define tiny-ripple
  (list 100 100 1))

(make-ripple tiny-ripple)

(big-bang tiny-ripple (to-draw make-ripple))

