;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname backupdnajoin) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (DNAjoin sx sy)
  (if (or (empty? sx) (empty? sy))
      '()
   (append
    (build-sx-half sx sy)
    (DNAlongest-common-seq sx sy)
    (build-sy-half sx sy)))) 