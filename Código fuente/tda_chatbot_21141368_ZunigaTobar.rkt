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

(define (chatbot-repeated chatbot sistema)
  (or (equal? (get-chatbots-ids (cdddr sistema)) (get-chatbotID chatbot))
      #t
      #f))

(define (get-chatbots-ids sistema)
  (map get-chatbotID sistema))

(provide (all-defined-out))