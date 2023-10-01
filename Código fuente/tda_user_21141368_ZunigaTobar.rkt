#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")

#|
Función: make-user
Dominio: string (nombre) X system
Recorrido: lista
Recursión: Niguna
Descripción: 
|#
(define (make-user nombre sistema)
  (if (exists-user nombre sistema)
      #t
      (list nombre)))

#|
Función: exists-user
Dominio: string x lista
Recorrido: Booleano
Recursión: Ninguna
Descripción: 
|#
(define (exists-user nombre sistema)
  (if (null? (car (cdr sistema)))
      #f
;      (map (lambda (x) (= (car x) nombre)) (cdr (cdr (cdr (cdr sistema)))))))
;      (if (member nombre (cdr (car sistema)))
;          #t
;          #f)))
      (if (member nombre (car (cdr sistema)))
          #t
          #f)))

#|
Función: a-user-conected
Dominio: system
Recorrido: boolean
Recursión: Ninguna
Descripción: 
|#
(define (a-user-conected sistema)
;  (or (equal? (get-users-status sistema) 1)
;      #t
;      #f))
  (if (not (null? (get-user sistema)))
      #t
      #f))

#|
Función: get-users-status
Dominio: system
Recorrido: system
Recursión: Ninguna
Descripción:
|#
;(define (get-users-status sistema)
;  (map (get-status) (last sistema)))

#|
Función: get-status
Dominio: lista
Recorrido: número
Recursión: Ninguna
Descripción: 
|#
;(define get-status cdar)

#||#
(define (conect-user sistema usuario)
  (make-system (get-system sistema) (get-users sistema) usuario (get-system-initialChatbot sistema) (get-system-chatbots sistema)))

(define get-users cadr)

(define get-user caddr)

(define (register usuario sistema)
;  (reverse (append (remove last (reverse (cadr sistema))) (list usuario))))
  (if (null? (get-users sistema))
      (make-system (get-system sistema) (list usuario) null (get-system-initialChatbot sistema) (get-system-chatbots sistema))
      (make-system (get-system sistema) (append (get-users sistema) usuario) null (get-system-initialChatbot sistema) (get-system-chatbots sistema))))

(provide (all-defined-out))