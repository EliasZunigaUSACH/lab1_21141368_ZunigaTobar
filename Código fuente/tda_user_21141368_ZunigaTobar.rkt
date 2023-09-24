#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")

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
(define (get-user-conectado name sistema))

(provide (all-defined-out))