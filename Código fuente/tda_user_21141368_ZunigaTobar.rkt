#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")

#|
Función: users
Dominio: 
Recorrido: 
Recusión: Ninguna
|#
(define (users . user) user)

#|
Función: make-usuairo
Dominio:
Recorrido:
Recursión:
Descripción:
|#
(define (make-usuario nombre sistema)
  (if (exists-usuario nombre sistema)
      (display "Este usuario ya existe")
      (users nombre)))

#||#
;(define (get-user-conectado ))

(provide (all-defined-out))