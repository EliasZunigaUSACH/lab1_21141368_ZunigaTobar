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

;(define (already ))

(provide (all-defined-out))