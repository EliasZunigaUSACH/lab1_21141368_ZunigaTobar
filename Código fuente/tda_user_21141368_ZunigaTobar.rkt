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
      (display "Este usuario ya existe")
      (list '(nombre 0))))

#|
Función: a-user-conected
Dominio: system
Recorrido: boolean
Recursión: Ninguna
Descripción: 
|#
(define (a-user-conected sistema)
  (or (equal? (get-users-status sistema) 1)
      (display "Un usuario ya ha iniciado sesión")
      #f))

#|
Función: get-users-status
Dominio: system
Recorrido: system
Recursión: Ninguna
Descripción:
|#
(define (get-users-status sistema)
  (map (get-status) (cdr (cdr (cdr sistema)))))

#|
Función: get-status
Dominio: lista
Recorrido: número
Recursión: Ninguna
Descripción: 
|#
(define get-status cdar)

(provide (all-defined-out))