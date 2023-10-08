#lang racket

#|
PARADIGMAS DE PROGRAMACIÓN LABORATORIO 1
Nombre: Elías Zúñiga Tobar
RUT: 21.141.368-9
Profesor Gonzalo Matrinez
|#

(require "tda_system_21141368_ZunigaTobar.rkt")
(require "tda_option_21141368_ZunigaTobar.rkt")

#|
Función: make-flow
Dominio: numero (id) x name-msg (String) x opciones
Recorrido: Lista
Recursión: Ninguna
Descripción: Se crea una lista con los elementos ingrersados, esta lista representará un flujo
|#
(define (make-flow id name-msg opciones)
  (list id name-msg opciones))

#|
Función: get-flow-options-ids
Dominio: flow
Recorrido: números (id de las opciones)
Recursión: Ninguna
Descripción: Se obtiene todas las IDs de las opciones dentro de un flujo de un chatbot
|#
(define (get-flow-options-ids chatbot)
  (map get-option-id (caddr chatbot)))

#|
Función: get-flow-id
Dominio: flow
Recorrido: número (id)
Recursión: Ninguna
Descripción: Obtiene la id de un flujo
|#
(define get-flow-id car)

#|
Función: flow-is-repeated
Dominio: chabot X flow
Recorrido: Booleano
Recursión: Ninguna
Descripción: Verifica si el flujo ingresado yá existe dentro de la opción ingresada
|#
(define (flow-is-repeated chatbot flujo)
  (or (equal? (get-flow-options-ids chatbot) (get-flow-id flujo))
      #t
      #f))

(provide (all-defined-out))