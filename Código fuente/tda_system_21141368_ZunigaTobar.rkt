#lang racket

#|
Función: hacer-sistema
Dominio: string (nombre) x string (chatbot1)
Recorrido: lista con elementos para un conjunto de chatbots, además del tiempo actual
Descripción: Crea una lista que representa un conjunto de chatbots
|#
(define (hacer-sistema nombre chatbot1)
  (list nombre chatbot1 (current-seconds)))

(define (hacer-chatbot nombre sistema)
  ())

#|
Función: system-add-chatbot
Dominio: system x chatbot
Recorrido: system
Descripción:
|#
(define (system-add-chatbot nombre sistema)
  (if (existe nombre sistema)
      (display "Este chatbot ya existe")
      (hacer-chatbot nombre sistema)))

(define (existe chatbot lista)
  (map (lambda (string) (= string chatbot)) lista))

(provide (all-defined-out))