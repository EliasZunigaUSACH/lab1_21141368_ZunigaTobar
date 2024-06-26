#lang racket

#|
PARADIGMAS DE PROGRAMACIÓN LABORATORIO 1
Nombre: Elías Zúñiga Tobar
RUT: 21.141.368-9
Profesor Gonzalo Matrinez
|#

(require "tda_system_21141368_ZunigaTobar.rkt")
(require "tda_option_21141368_ZunigaTobar.rkt")
(require "tda_chatbot_21141368_ZunigaTobar.rkt")

#|
Función: make-flow
Dominio: numero (id) x name-msg (String) x opciones
Recorrido: Lista
Recursión: Ninguna
Descripción: Se crea una lista con los elementos ingresados, esta lista representará un flujo
|#
(define (make-flow id name-msg opciones)
  (list id name-msg opciones))

#|
Función: get-flow-options-ids
Dominio: flow
Recorrido: números (id de las opciones)
Recursión: Ninguna
Descripción: Se obtiene todas las IDs de las opciones dentro de un flujo
|#
(define (get-flow-options-ids flujo)
  (map get-option-id (get-flow-options flujo)))

#|
Función: get-flow-id
Dominio: flow
Recorrido: número (id)
Recursión: Ninguna
Descripción: Obtiene la id de un flujo
|#
(define get-flow-id car)

#|
Función: get-flow-options
Dominio: flow
Recorrido: lista de opciones)
Recursión: Ninguna
Descripción: Obtiene las opciones de un flujo
|#
(define get-flow-options caddr)

#|
Función: flow-is-repeated
Dominio: chabot X flow
Recorrido: Booleano
Recursión: Ninguna
Descripción: Verifica si el flujo ingresado yá existe dentro del chatbot ingresado
|#
(define (flow-is-repeated chatbot flujo)
  (if (member (get-flow-id flujo) (map get-flow-options-ids (get-chatbot-flows chatbot)))
      #t
      #f))

#|
Función: chAddFlw-tail
Dominio: lista de flujos X flujo X acumulador de listas (acc)
Recorrido: lista de flujos acumulados (acc)
Recursión: Cola
Descripcion: Mediante una coparacion de uno en uno, se verifica
             si el flujo de entrada ya existe dentro del chatbot
|#
(define (chAddFlw-tail chatbotFlows flujo acc)
  (if (null? chatbotFlows)
      (cons acc (list flujo))
      (if (= (get-flow-id (car chatbotFlows)) (get-flow-id flujo))
          acc
          (chAddFlw-tail (cdr chatbotFlows) flujo (append acc (car chatbotFlows))))))

(provide (all-defined-out))