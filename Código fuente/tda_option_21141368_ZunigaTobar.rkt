#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")

#|
Función: option
Dominio: número (code) X string (message) X número (ChatbotCodeLink)
 X número (InitialFlowCodeLink) X strings* (0 o varias palabras claves)
Recorrido = option
Recursión: Ninguna
Descripción:
|#
(define option
  (lambda (code message chatbotCodeLink initialFlowCodeLink . keyword)
    (make-option code message chatbotCodeLink initialFlowCodeLink keyword)))

#|
Función: make-option
Dominio: número (code) X string (message) X número (ChatbotCodeLink)
 X número (InitialFlowCodeLink) X strings (palabras claves)
Recorrido: Lista
Recursión: Ninguna
Descripción: 
|#
(define (make-option code message chatbotCodeLink initialFlowCodeLink keyword)
  (list code message chatbotCodeLink initialFlowCodeLink keyword))

#|
Función: get-option-id
|#
(define get-option-id car)

(provide (all-defined-out))