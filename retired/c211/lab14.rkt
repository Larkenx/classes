;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lab14) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; A DecisionTree is one of:
;; - Answer
;; - (make-choice String DecisionTree DecisionTree)
(define-struct choice (question yes no))

;; An Answer is a Boolean
;;    interpretation: #true means the patient has the condition

;; A CaseHistory is a [Listof Boolean]

;; A Patient is (make-patient CaseHistory Answer)
(define-struct patient (ch diagnosis))

; Exercise 1
(define Galileo (make-patient (list #t #t #t #f) #true))
(define a-tree (make-choice "Skin is yellow?" #t #f))

; Exercise 2

; diagnose: DecisionTree CaseHistory -> Answer

(define (diagnose a-tree case-history)
  (cond
    [(not (choice? a-tree)) a-tree]
    [(equal? #t (first case-history)) (diagnose (choice-yes a-tree)
                                                (rest case-history))]
    [(equal? #f (first case-history)) (diagnose (choice-no a-tree)
                                                (rest case-history))]))

(check-expect (diagnose
               (make-choice "Skin is yellow?"
                            (make-choice "Side hurts?" "Meningitis" #f)
                            #f) (list #t #t))
              "Meningitis")

; Exercise 3
; simplify: DecisionTree -> DecisionTree
(define (simplify a-tree)
  (cond
    [(boolean? a-tree) a-tree]
    [(equal? (choice-yes a-tree) (choice-no a-tree))
     (simplify (choice-yes a-tree))]
    [else (make-choice (choice-question a-tree)
                       (simplify (choice-yes a-tree))
                       (simplify (choice-no a-tree)))]))

(define test-tree
  (make-choice "Coughing?"
               (make-choice "Coughing Blood?" #t #t)
               (make-choice "Headache?" #t #f)))

(check-expect (simplify test-tree)
              (make-choice "Coughing?" #true
                           (make-choice "Headache?" #true #false)))

; Exercise 4 
; build-decision-tree: [Listof Patient] -> DecisionTree
(define (build-decision-tree lop)
    (cond
      [(empty? lop) #f]
      [else (local [(define yes-group (if (not (empty? lop)) (map (lambda (x) (make-patient (rest (patient-ch x)) (patient-diagnosis x)))
                                                           (filter (lambda (x) (equal? #t (first (patient-ch x)))) lop)) '()))        
                    (define no-group (if (not (empty? lop)) (map (lambda (x) (make-patient (rest (patient-ch x)) (patient-diagnosis x)))
                                                          (filter (lambda (x) (equal? #f (first (patient-ch x)))) lop)) '()))]
              (make-choice ""
                           (build-decision-tree yes-group)
                           (build-decision-tree no-group)))])) 

(define Jack (make-patient '(#t #t #f #t) #t))
(define Jane (make-patient '(#t #f #f #t) #t))
(define Joe (make-patient '(#f #f #f #t) #t))

(build-decision-tree (list Jack Jane Joe))