#lang racket
(define h (make-hash))
(define students (make-hash))
(begin
  (hash-set! students "Steven Myers" "Computer Science")
  (hash-set! students "Caroline Chambliss" "Finance")
  (hash-set! students "Ron Burgundy" "Computer Science")
  (hash-set! students "Ryan Newton" "Computer Science")
  (hash-set! students "Alma Mater" "Finance")
  (hash-set! students "James Morrison" "Music")
  (hash-set! students "John Adams" "Political Science")
  (hash-set! students "James Bond" "Underwater Basket Weaving"))

(define salaries (make-hash))
(begin
  (hash-set! salaries "Computer Science" 71500)
  (hash-set! salaries "Finance" 57300)
  (hash-set! salaries "Music" 39274)
  (hash-set! salaries "Political Science" 38000)
  (hash-set! salaries "Underwater Basket Weaving" 16928))


#;(define (invert-students std)
  (local
    [(define majors (make-hash))
     (define stdls (hash->list std))
     (define (helper ls)
       (cond
         [(empty? ls) majors]
         [else
          (begin
            (if (hash-has-key? majors (... (first ls)))
                (hash-update! majors (... (first ls)) (lambda (x) (cons (... (first ls)) x)))
                (hash-set! majors (... (first ls)) (list (... (first ls)))))
            (helper (rest ls)))]))]
    (helper stdls)))


(define (invert-students std)
  (let [(majors (make-hash))]
    (begin
      (hash-for-each std
                     (lambda (k v)
                       (if (hash-has-key? majors v)
                           (hash-update! majors v (lambda (x) (cons k x)))
                           (hash-set! majors v (list k))))))
    majors))

(define (student-salaries std)
    (let [(std-sal (make-hash))]
    (begin
      (hash-for-each std
                     (lambda (k v)
                       (hash-set! std-sal k (hash-ref salaries v))))
    std-sal)))

(define (avg-salaries std)
  (let [(total 0)]
    (begin
      (hash-for-each std
                     (lambda (k v)
                       (set! total (+ v total))))
      (/ total (hash-count std)))))
      
  
  




                     
                         
    