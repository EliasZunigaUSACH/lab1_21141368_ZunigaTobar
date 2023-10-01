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
  (if (equal? (get-chatbots-ids (cdr (cdr (cdr (cdr (cdr sistema)))))) (get-chatbotID chatbot))
      #t
      #f))

(define (get-chatbots-ids sistema)
  (map get-chatbotID sistema))

(provide (all-defined-out))