;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname assignment3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 1. date-between
;
; String -> String
; calculates the difference between d1 and d2 (in years, months, days)
; given "09/02/2013" "10/10/2015"
; expected "2 years and 38 days."

(define (time-between d1 d2)
  (days->span
   (- (date->days (if (> (date->days d1) (date->days d2)) d1 d2))
     (date->days (if (< (date->days d1) (date->days d2)) d1 d2)))))

(check-expect (time-between "09/02/2013" "10/10/2015")
              "2 years and 38 days.")

(check-expect (time-between "10/10/2015" "09/02/2013")
              "2 years and 38 days.")

; 2. extract-years
;
; String -> Number
; extracts the number of hours in the time representation time
; given: "09/02/2013" expected: 2013

(define (extract-years date)
  (string->number (substring date 6)))

 
(check-expect (extract-years "09/02/2013") 2013)

; 3. extract-months
;
; String -> Number
; extracts the number of months in the date representation time
; given: "05/12/2015" expected: 5

(define (extract-months date)
  (string->number (substring date 0 2)))

(check-expect (extract-months "05/12/2015") 5)

; 4. extract-days
;
; String -> Number
; extracts the number of days in the date representation time
; given: "05/12/2015" expected: 12

(define (extract-days date)
  (string->number (substring date 3 5)))

(check-expect (extract-days "05/12/2015") 12)

; 5. months->days
;
; Number -> Number
; converts a month number into the total number of days up to this month
; given: 1 expected: 0
; given: 2 expected: 31
; given: 3 expected: 31+28

(define (months->days m)
  (cond
    [(= m 1) 0]
    [(= m 2) 31]
    [(= m 3) (+ 31 28)] 
    [(= m 4) (+ 31 28 31)] 
    [(= m 5) (+ 31 28 31 30)] 
    [(= m 6) (+ 31 28 31 30 31)]
    [(= m 7) (+ 31 28 31 30 31 30)]
    [(= m 8) (+ 31 28 31 30 31 30 31)]
    [(= m 9) (+ 31 28 31 30 31 30 31 31)]
    [(= m 10) (+ 31 28 31 30 31 30 31 31 30)]
    [(= m 11) (+ 31 28 31 30 31 30 31 31 30 31)]
    [(= m 12) (+ 31 28 31 30 31 30 31 31 30 31 30)]))

(check-expect (months->days 1) 0)
(check-expect (months->days 2) 31)
(check-expect (months->days 3) 59)
(check-expect (months->days 4) 90)
(check-expect (months->days 5) 120)
(check-expect (months->days 6) 151)
(check-expect (months->days 7) 181)
(check-expect (months->days 8) 212)
(check-expect (months->days 9) 243)
(check-expect (months->days 10) 273)
(check-expect (months->days 11) 304)
(check-expect (months->days 12) 334)

; 6. years-months-days->days
;
; Number Number Number -> Number
; Converts a tuple of years, months, days to the total number of days
; interval

(define (years-months-days->days years months days)
  (+ (* years 365) (months->days months) days))

(check-expect (years-months-days->days 1 1 1) 366)

; 7. date->days
;
; String -> Number
; converts a date representation into an equivalent number of days

(define (date->days date)
  (years-months-days->days
   (extract-years date)
   (extract-months date)
   (extract-days date)))

(check-expect (date->days "01/01/01") 366)
(check-expect (date->days "09/01/2001") 730609)

; 8. days->span
;
; Number -> String
; converts a number of days into date span representation
; given: 3 expected: "0 years and 3 days."
; given: 366 expected: "1 years and 1 days."

(define (days->span n)
  (string-append (number->string (quotient n 365)) " years and "
                 (number->string (modulo n 365)) " days."))

(check-expect (days->span 3) "0 years and 3 days.")
(check-expect (days->span 366) "1 years and 1 days.")