#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")
(require "tda_option_21141368_ZunigaTobar.rkt")

#|
Función: make-flow
Dominio: numero (id) x name-msg (String) x opciones
Recorrido: Lista
Recursión: Ninguna
|#
(define (make-flow id name-msg opciones)
  (list id name-msg opciones))

#|
Función: get-flow-options-ids
|#
(define (get-flow-options-ids flujo)
  (map get-option-id (cddr flujo)))

(provide (all-defined-out))