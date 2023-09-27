#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")

#|
Función: get-chatbotID
Dominio: chatbot
Recorrido: ID (Número)
Descripción: 
Recursión: Ninguna
|#
(define (get-chatbotID chatbot)
  (car chatbot))

;(define (chatbot-repeated chatbot sistema)
;  (or (equal? (get-flow-options-ids) (get-chatbotID chatbot))
;      (display "Este chatbot ya existe")
;      #f))

(provide (all-defined-out))