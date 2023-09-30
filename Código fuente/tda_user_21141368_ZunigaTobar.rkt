#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")

#|
Función: make-user
Dominio: string (nombre) X system
Recorrido: lista
Recursión: Niguna
Descripción: 
|#
;(define (make-user nombre sistema)
;  (if (exists-user nombre sistema)
;      #t
;      (list nombre 0)))

#|
Función: a-user-conected
Dominio: system
Recorrido: boolean
Recursión: Ninguna
Descripción: 
|#
(define (a-user-conected sistema)
  (or (equal? (get-users-status sistema) 1)
      #t
      #f))

#|
Función: get-users-status
Dominio: system
Recorrido: system
Recursión: Ninguna
Descripción:
|#
(define (get-users-status sistema)
  (map (get-status) (last sistema)))

#|
Función: get-status
Dominio: lista
Recorrido: número
Recursión: Ninguna
Descripción: 
|#
(define get-status cdar)

#||#
(define (conect-user sistema usuario)
  (append (remove usuario (last sistema)) (list (car usuario) 1)))

(provide (all-defined-out))