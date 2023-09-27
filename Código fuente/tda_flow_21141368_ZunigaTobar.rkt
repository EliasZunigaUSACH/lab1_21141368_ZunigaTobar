#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")
(require "tda_option_21141368_ZunigaTobar.rkt")

#|
Función: make-flow
Dominio: numero (id) x name-msg (String) x opciones
Recorrido: Lista
Recursión: Ninguna
Descripción: 
|#
(define (make-flow id name-msg opciones)
  (list id name-msg opciones))

#|
Función: get-flow-options-ids
Dominio: flow
Recorrido: números (id de las opciones)
Recursión: Ninguna
Descripción: 
|#
(define (get-flow-options-ids chatbot)
  (map get-option-id (caddr chatbot)))

#|
Función: get-flow-id
Dominio: flow
Recorrido: número (id)
Recursión: Ninguna
Descripción: 
|#
(define get-flow-id car)

#|
Función: flow-is-repeated
Dominio: chabot X flow
Recorrido: Booleano
Recursión: Ninguna
Descripción:
|#
(define (flow-is-repeated chatbot flujo)
  (or (equal? (get-flow-options-ids chatbot) (get-flow-id flujo))
      (display "Este flujo ya está agregado en este chatbot")
      #f))

(provide (all-defined-out))