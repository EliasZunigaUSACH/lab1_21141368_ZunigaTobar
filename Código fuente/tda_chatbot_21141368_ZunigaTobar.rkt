#lang racket

#|
PARADIGMAS DE PROGRAMACIÓN LABORATORIO 1
Nombre: Elías Zúñiga Tobar
RUT: 21.141.368-9
Profesor Gonzalo Matrinez
|#

(require "tda_system_21141368_ZunigaTobar.rkt")

#|
Función: make-chatbot
Dominio: ID (número) X nombre (String) X Mensaje de bienvenida (String) X StartFlowID (Número) X Flows
Recorrido: lista
Recursión: Ninguna
Descripción: Se crea el un chatbot
|#
(define (make-chatbot id nombre mensajeBienvenida flujoInicial flujos)
  (list id nombre mensajeBienvenida flujoInicial flujos))

#|
Función: get-chatbotID
Dominio: chatbot
Recorrido: ID (Número)
Recursión: Ninguna
Descripción: Obtiene la ID de un chatbot
|#
(define get-chatbotID car)

#|
Función: get-chatbot-flows
Dominio: chatbot
Recorrido: lista de flujos
Recursión: Niguna
Descripción: Obtiene los flujos de un chatbot
|#
(define get-chatbot-flows cddddr)

#|
Función: is-chatbot-repeated
Dominio: chatbot X system
Recorrido: Boolean
Recursión: Ninguna
Descripción: Verifica si el chatbot de entrada ya existe dentro del sistema
|#
(define (is-chatbot-repeated chatbot sistema)
  (if (member (get-chatbotID chatbot) (get-chatbots-ids (car (cddddr sistema))))
      #t
      #f))

#|
Función: get-chatbots-ids
Dominio: system
Recorrido: lista de números (IDs)
Recursión: Ninguna
Descripción: Obtiene una lista de IDs de todos los chatbots del sistema
|#
(define (get-chatbots-ids sistema)
  (map get-chatbotID sistema))

(provide (all-defined-out))