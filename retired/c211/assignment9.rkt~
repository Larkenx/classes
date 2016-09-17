;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname assignment9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 315

; The file name 'read!' occurs 2 times in the tree system. The first
; 'read!' file is found at /TS/read! and the second 'read!' file is
; at /TS/Libs/Docs/read!. The total size of all files in the tree system
; is 207. The total size of all files including directories is 211.
; Finally, there are 3 levels of directories.

; Exercise 316

; The following data definition is given in the text:
; A Dir.v1 (short for directory) is one of: 
; – '()
; – (cons File.v1 Dir.v1)
; – (cons Dir.v1 Dir.v1)

; A File.v1 is a Symbol.

; For Figure 81, all files within the tree system are a File.v1, which
; is represented by a symbol.
; Any directory within Figure 81 is a Dir.v1.

; Figure 81
(define /TS/Text (cons 'part1 (cons 'part2 (cons 'part3 '()))))
(define /TS/Libs/Code (cons 'hang (cons 'draw '())))
(define /TS/Libs/Docs (cons 'read! '()))
(define /TS/Libs (cons /TS/Libs/Code /TS/Libs/Docs))
(define /TS (cons 'read! (cons /TS/Text (cons /TS/Libs '()))))

; Exercise 317

; how-many: Dir.v1 -> Number
; Given a Dir.v1, tell how many files it contains.
; Template:
; --------
;(define (how-many dir)
;  (cond
;    [(empty? dir) ...]
;    [(symbol? (first dir)) ... (how-many (rest dir))]
;    [else ...
;     (how-many (first dir))
;     (how-many (rest dir))]))

(define (how-many dir)
  (cond
    [(empty? dir) 0]
    [(symbol? (first dir)) (+ 1 (how-many (rest dir)))]
    [else (+
           (how-many (first dir))
           (how-many (rest dir)))])) 

(check-expect (how-many /TS) 7)

; Exercise 318

; The following data definitions are borrowed from the text:

(define-struct dir [name content])

; A Dir.v2 is a structure: 
;   (make-dir Symbol LOFD)

; A LOFD (short for list of files and directories) is one of:
; – '()
; – (cons File.v2 LOFD)
; – (cons Dir.v2 LOFD)

; A File.v2 is a Symbol.

; Figure 81 Data Representation:

(define Docs
  (make-dir
   'Docs
   (cons 'read! '())))

(define Code
  (make-dir
   'Code
   (cons 'hang (cons 'draw '()))))

(define Libs
  (make-dir
   'Libs
   (cons Code (cons Docs '()))))

(define Text
  (make-dir
   'Text
   (cons 'part1
         (cons 'part2
               (cons 'part3 '())))))
(define TS
  (make-dir
   'TS
   (cons 'read! (cons Text (cons Libs '())))))

; Exercise 319
; how-many: Dir.v2 -> Number
; Given a Dir.v2, return the number of files in the directory tree
; This function shall require mutually recursive functions - one which
; processes LOFD's and one which processes directories.

; Templates:
; ---------

;(define (process-LOFD LOFD)
;  (cond
;    [(empty? LOFD) ...]
;    [(symbol? (first LOFD)) ... (process-LOFD (rest LOFD)))]
;    [(dir? (first LOFD)) (... (how-many.v2 (first LOFD))
;                              (process-LOFD (rest LOFD)))]
;    )
;  )

;(define (how-many.v2 dir)
;  (if (dir? dir)
;     (... (process-LOFD (dir-content dir))
;     (...)))

(define (process-LOFD LOFD)
  (cond
    [(empty? LOFD) 0]
    [(symbol? (first LOFD)) (+ 1 (process-LOFD (rest LOFD)))]
    [(dir? (first LOFD)) (+ (how-many.v2 (first LOFD))
                            (process-LOFD (rest LOFD)))]
    )
  )

(define (how-many.v2 dir)
  (if (dir? dir)
      (process-LOFD (dir-content dir))
      (error "Not a directory!")))

(check-expect (how-many.v2 TS) 7)

; Exercise 1

; The following data definitions are given in the assignment:

(define-struct section (title text subsections))

;; A Section is a structure:
;; (make-section String ListOfStrings ListOfSections)
;; where the title field is the name of the section,
;; the text field is the words in the section.
;; and the subsections field is the contents of the section.

;; A List-of-Sections (LoS) is one of:
;;   - empty
;;   - (cons Section LoS)

(define Genesis (make-section
                 "Genesis"
                 (list "In" "the" "beginning...")
                 empty))

(define Exodus (make-section
                "Exodus"
                (list "I" "am" "that" "I" "am")
                empty))

(define Leviticus (make-section
                   "Leviticus"
                   (list "Speak" "unto" "the" "children")
                   empty))

(define Numbers (make-section
                 "Numbers"
                 (list "God" "said" "let" "there" "be" "numbers")
                 empty))

(define Deuteronomy (make-section
                     "Deuteronomy"
                     (list "unto" "him" "ye" "shall" "hearken")
                     empty))

(define Pentateuch (make-section
               "Pentateuch"
               (list "Here" "is" "the" "Pentateuch")
               (list Genesis Exodus Leviticus Numbers Deuteronomy))
  )

; Exercise 2
; process-section: Section -> ...
; Given a section, perform an action that grabs the information out
; of the structure.
; Template for process-section:
; --------
;(define (process-section s)
;  (cond
;    [(... (section-title s)) (...]
;    [(... (section-text s) (...] 
;    [else (process-los (section-subsections s))]))

; process-los: [Listof Section] -> ...
; Given a list of sections, process each individual section in the list
; Template for process-los:
; --------
;(define (process-los l)
;  (cond
;    [(empty? l) (...]
;    [(cons? l) (... (process-section (first l))
;                    (... (process-los (rest l)))]))

; search-sections: Section String -> [Listof String]
; Given a section and a word, return a list of the *names* AKA the
; (sections-title some-subsection) of the sections which contain the
; given word in their respective (sections-text some-subsection).

(define (process-los list w)
  (cond
    [(empty? list) empty]
    [else (append (search-sections (first list) w)
              (process-los (rest list) w))]
  ))

(define (search-sections s w)
   (filter (lambda (x) (not (empty? x)))
   (cond
    [(ormap (lambda (x) (equal? w x)) (section-text s))
       (cons (section-title s) (process-los (section-subsections s) w))]
    [else (process-los (section-subsections s) w)])))

(check-expect (search-sections Pentateuch "am") (list "Exodus"))