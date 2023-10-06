#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")

#|
Función: get-chatbotID
Dominio: chatbot
Recorrido: ID (Número)
Descripción: 
Recursión: Ninguna
|#
(define get-chatbotID car)

#|
Función: is-chatbot-repeated
Dominio: chatbot X system
Recorrido: Boolean
Recursión: Ninguna
Descripción: Verifica si el chatbot de entrada ya existe en el sistema
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