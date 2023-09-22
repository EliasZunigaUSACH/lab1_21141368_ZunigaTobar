#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")

#|
Función: Chatbot
Dominio: ID (número) X nombre (String) X Mensaje de bienvenida (String) X StartFlowID (Número) X Flows
Recorrido: chatbot
Descripción: 
Recursión: Ninguna
|#
(define (chatbot . args) args)

#|
Función: get-chatbotID
Dominio: ID (Número)
Recorrido: ID (Número)
Descripción:
Recursividad: Ninguna
|#
(define (get-chatbotID id)
  (cadr chatbot))

;(define chatbot-add-flow )

(provide (all-defined-out))