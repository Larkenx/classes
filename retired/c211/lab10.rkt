;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lab10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; An XExpr (X-expression) is one of:
; - Symbol
; - String
; - Number
; - (cons Symbol (cons [Listof Attribute] [Listof XExpr]))

; An Attribute is a:
; (list Symbol String)

; Interpretation: '(a "b") represents the attribute
; a = "b" in a piece of XML data

; x-expression-has-content-attribute: XExpr -> Boolean
; Given an Xexpression, tell whether or not it contains a content
; attribute.

; A *content* attribute is:
; (list 'content String)
; where 'content is a symbol and a string is any string.

(cons 'document (cons empty ; attribute of document is empty
                      (cons ; begin [Listof XExpr]
                       (cons 'title
                             (list '; symbol for next xexpr
                             (list 'size "really-big") ; end 'title attribute
                             (cons 'font
                                  

(define (x-expression-has-content-attribute expr)
  (cond
    [