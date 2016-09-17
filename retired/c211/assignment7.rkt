;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname assignment7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 1
; A frequency is a:
; (make-frequency String Number)
; where the string is a word, and the number is the occurrence of
; the string

(define-struct frequency (word number))

; Exercise 2
;
; A ListofStrings is one of:
; - empty
; - (cons String ListofStrings)
;
; A ListofFrequency is one of:
; - empty
; - (cons (make-frequency word number) ListofFrequency)

; Exercise 3
; count-word: ListofFrequency String -> ListofFrequency
; Template:
; (define (count-word LoF word)
; (cond
; [(empty? LoF) ...]
; [(equal? word LoF) ...]))
;
(define (count-word LoF word)
  (cond
    [(empty? LoF) (cons (make-frequency word 1) LoF)]
    [(equal? word (frequency-word (first LoF)))
     (cons
      (make-frequency word (+ (frequency-number (first LoF)) 1))
      (rest LoF))]
    [else (cons (first LoF) (count-word (rest LoF) word))]
    ) 
  )

(check-expect (count-word
               (list
                (make-frequency "hello" 1)
                (make-frequency "hi" 2))
               "hey")
              (list
               (make-frequency "hello" 1)
               (make-frequency "hi" 2)
               (make-frequency "hey" 1)))

(check-expect (count-word
               (list
                (make-frequency "hello" 1)
                (make-frequency "hi" 2))
               "hi")
              (list
               (make-frequency "hello" 1)
               (make-frequency "hi" 3)))

; Exercise 4
; count-all-words: ListofStrings -> ListofFrequency
; Given a list of strings, create a list of frequency that uses the
; count-word function to calculate the number of times a string occurs
; in the given ListofStrings. Each branch of the cond should return a
; ListofFrequency.
; Template:
; (define (count-all-words LoS)
;   (cond
;     [(empty? LoS) ...]
;     [(cons? LoS) ... (count-all-words ...)]
; ))

(define (count-all-words LoS)
  (cond
    [(empty? LoS) empty]
    [(cons? LoS) (count-word (count-all-words (rest LoS))
                             (first LoS))]
    )
  )

(check-expect (count-all-words (list "hi" "hi"))
              (list (make-frequency "hi" 2)))

; Exercise 5
(require 2htdp/batch-io)

; Create a list of words containing all words in Hamlet.txt
(define hamlet-words
  (read-words "hamlet.txt"))

; Compute the frequency of all words in Hamlet.txt
;;; The function below is commented out so that it will not carry out
;;; the process.
; (count-all-words hamlet-words)

; Exercise 6
; sort-highest-frequencies: ListOfFrequency -> ListOfFrequency
; This function will consume a list of frequency and return a list of
; frequency that contains the frequencies of the previous list that
; occur more than 100 times.
; Template:
; (define (sort-highest-frequencies LoF)
;   (cond
;     [empty? LoF] ...]
;     [... (first LoF) ... (cons (first LoF)
;                          (sort-highest-frequencies (rest LoF))]
;     [else ... (sort-highest-frequencies (rest LoF))]

(define (sort-highest-frequencies LoF)
  (cond
    [(empty? LoF) empty]
    [(> (frequency-number (first LoF)) 100)
     (cons (first LoF)
           (sort-highest-frequencies (rest LoF)))] 
    [else (sort-highest-frequencies (rest LoF))]
    )
  )

(check-expect (sort-highest-frequencies
               (list (make-frequency "Hello" 102)))
              (list (make-frequency "Hello" 102)))
(check-expect (sort-highest-frequencies
               (list (make-frequency "Hello" 102)
                     (make-frequency "Hi" 92)
                     (make-frequency "Five" 123)
                     (make-frequency "2" 100)))
              (list (make-frequency "Hello" 102)
                    (make-frequency "Five" 123)))

; A list of words containing the text of Macbeth
(define macbeth-words
  (read-words "macbeth.txt"))

; (sort-highest-frequencies (count-all-words macbeth-words))

;;; Below is the result of the above function (words that appear
; over 100 times in Macbeth.)
;(list (make-frequency "to" 367)
;(make-frequency "and" 427)
;(make-frequency "in" 190)
;(make-frequency "of" 395)
;(make-frequency "the" 620)
;(make-frequency "his" 127)
;(make-frequency "this" 108)
;(make-frequency "our" 116)
;(make-frequency "with" 141)
;(make-frequency "be" 133)
;(make-frequency "that"158)
;(make-frequency "And" 169)
;(make-frequency "your" 122)
;(make-frequency "a" 255)
;(make-frequency "not" 142)
;(make-frequency "I" 326)
;(make-frequency "my" 170)
;(make-frequency "is" 185)
;(make-frequency "haue" 114)
;(make-frequency "The" 131)
;(make-frequency "Macb." 137)
;(make-frequency "you" 193)
;(make-frequency "it" 128))

; Book Exercises
; The following definitions were given in the text.

(define-struct child [father mother name date eyes])
(define-struct no-parent [])

; A Child is a:
; (make-child Child Child String N String)

; A FT (family tree) is one of: 
; – (make-no-parent)
; – (make-child FT FT String N String)

(define MTFT (make-no-parent))

; A FT (family tree) is one of: 
; – MTFT
; – (make-child FT FT String N String)

;;; Exercise 296
; (count-persons): FT -> Integer
; This function will consume a family tree and return the number of
; child structures within the tree
; Template:
;
;(define (count-persons family)
;  (cond
;    [(no-parent? family) ...]
;    [(child? family) ... (count-persons (child-father family))
;                         (count-persons (child-mother family))]
;    )
;  )

(define (count-persons family)
  (cond
    [(no-parent? family) 0]
    [(child? family) (+ 1
                        (count-persons (child-father family))
                        (count-persons (child-mother family)))]
    )
  )

(define Bernie (make-child MTFT MTFT "Bern" 1920 "Brown"))
(define Annie (make-child MTFT MTFT "Ann" 1921 "Green"))
(define Bill (make-child Bernie Annie "Bill" 1940 "Blue"))
(define Jackie (make-child MTFT MTFT "Jackie" 1945 "Yellow"))
(define Janice (make-child Bill Jackie "Janice" 1970 "Green"))

(check-expect (count-persons Janice) 5)

;;; Exercise 297
; (average-age): FT Number -> Number
; Given the current year and a family tree, calculate the average age
; of all the child structures.
; Template:
; ---------
; (define (average-age family year)
;  (cond
;    [(no-parent? family year) ...]
;    [(child? family) ... (child-age family)
;                            (average-age (child-father family))
;                         (average-age (child-mother family))]
;    )
;  )

(define (average-age family year)
  (cond
    [(no-parent? family) 0]
    [(child? family) (/
                      (+ (- year (child-date family))
                         (average-age (child-father family) year)
                         (average-age (child-mother family) year))
                      (count-persons family))]
    ))

(check-expect (average-age Bill 2000) 73)

;;; Exercise 298
; (eye-colors) FT -> List
; Consumes a family tree node and returns a list containing
; all of the eye colors within the family tree.
; Template:
; --------
; (define (eye-colors family)
;  (cond
;    [(no-parent? family) ...]
;    [(child? family) ... (child-eyes family)
;                            (eye-colors (child-father family))
;                         (eye-colors (child-mother family))]
;    )
;  )

(define (eye-colors family)
  (cond
    [(no-parent? family) empty]
    [(child? family) (append (list (child-eyes family))
                             (eye-colors (child-mother family))
                             (eye-colors (child-father family)))]
    )
  )

(check-expect (eye-colors Janice)
              (list "Green" "Yellow" "Blue" "Green" "Brown"))

;;; Exercise 299
; (blue-eyed-ancestor?): FT -> Boolean
; Given a family tree, tell if an ancestor of a child has blue eyes.
(define (blue-eyed-ancestor? family)
  (cond
    [(empty? (eye-colors (child-mother family))) #false]
    [(empty? (eye-colors (child-father family))) #false]
    [(equal? "Blue" (first (eye-colors (child-mother family)))) #true]
    [(equal? "Blue" (first (eye-colors (child-father family)))) #true]
    [else (or
           (blue-eyed-ancestor? (child-mother family))
           (blue-eyed-ancestor? (child-father family)))]
    )
  )

(check-expect (blue-eyed-ancestor? Bernie) #false)
(check-expect (blue-eyed-ancestor? Janice) #true)