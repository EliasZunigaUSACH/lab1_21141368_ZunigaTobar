#lang racket

#|
Función: make-system
Dominio: string (nombre) x Código del chatbot inicial (número) x chatbot
Recorrido: Lista
Recursión: Ninguna
Descripción: 
|#
(define (make-system nombre miembros usuario initialChatbotCodeLink chatbot)
  (list nombre miembros usuario initialChatbotCodeLink (current-seconds) chatbot))

#||#
(define get-system car)

(define get-system-initialChatbot cadddr)

(define (get-system-chatbots sistema)
  (cdddr (cdr sistema)))

(provide (all-defined-out))