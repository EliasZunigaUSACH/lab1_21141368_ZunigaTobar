#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")

#|
Función: make-user
Dominio:
Recorrido:
Recursión:
Descripción:
|#
(define (make-user nombre sistema)
  (if (exists-user nombre sistema)
      (display "Este usuario ya existe")
      (list '(nombre 0))))

#||#
;(define (get-user-conectado sistema)
;  (if (system-logged sistema)
;      (get-user name)
;      (display "Ningun usuario está conectado")))

(define (a-user-conected sistema)
  (if ()))

#||#
(define (get-user-status name sistema)
  (map (get-status) (cdr (cdr (cdr sistema)))))

#||#
(define get-status cdar)

(provide (all-defined-out))