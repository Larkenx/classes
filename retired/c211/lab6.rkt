;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname lab6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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

(define (search-files2 file_list word)
  (filter (lambda (x) (file-has-word? x word)) file_list))

(check-expect (search-files2 filelist "Ogden")
              (cons
               "thefly.txt"
               (cons
                "thegerm.txt"
                (cons "theoctopus.txt"
                      (cons "theostrich.txt"
                            (cons "thetermite.txt" '()))))))


