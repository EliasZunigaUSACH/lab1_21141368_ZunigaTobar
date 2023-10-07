#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")

#|
Función: make-option
Dominio: número (code) X string (message) X número (ChatbotCodeLink)
 X número (InitialFlowCodeLink) X strings (palabras claves)
Recorrido: Lista
Recursión: Ninguna
Descripción: Se crea una opción con su ID, un mensaje de bienvenida, la ID del chatbot vinculado,
             la ID del flow vinculado
|#
(define (make-option code message chatbotCodeLink initialFlowCodeLink keyword)
  (list code message chatbotCodeLink initialFlowCodeLink keyword))

#|
Función: get-option-id
Dominio: lista
Recorrido: número (ID)
Recursión: Ninguna
Descripción: Se obtiene la id de una opción
|#
(define get-option-id car)

(provide (all-defined-out))