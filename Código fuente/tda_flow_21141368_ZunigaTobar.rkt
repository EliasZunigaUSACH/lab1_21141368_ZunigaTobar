#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")
(require "tda_option_21141368_ZunigaTobar.rkt")

#|
Función: Flow
Dominio: numero (id) x name-msg (String) x opciones* (Puede recibir 0 o más opciones)
Recorrido: flow
Recursión: Ninguna
Descripción:
|#
(define flow
  (lambda (flow id name-msg . opciones)
    (make-flow id name-msg opciones)))

#|
Función: make-flow
Dominio: numero (id) x name-msg (String) x opciones
Recorrido: Lista
Recursión: Ninguna
|#
(define (make-flow id name-msg opciones)
  (list id name-msg opciones))

#|
Función: flow-add-option
Dominio: flow X option
Recorrido: flow
Recursión: Ninguna
Descripción:
|#
(define (flow-add-option opcion flujo)
  (if (equal? (get-option-id opcion) (get-flow-options-ids flujo))
      0
      (append flujo opcion)))

#|
Función: get-flow-options-ids
|#
(define (get-flow-options-ids flujo)
  (map get-option-id (cddr flujo)))

#|
Función: get-option-id
|#
(define get-option-id car)

(provide (all-defined-out))