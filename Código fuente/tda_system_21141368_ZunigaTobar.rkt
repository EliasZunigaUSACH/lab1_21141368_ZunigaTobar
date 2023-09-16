#lang racket

#|
Función: es-string
Dominio: string
Recorrido: bool
Descripción: Verifica si la entrada pertenece a un string
Recursión: No
|#
(define (es-string string)
  (if (string? string)
      #t
      #f))

#|
Función: hacer-sistema
Dominio: string (nombre) x string (chatbot1)
Recorrido: lista con elementos para un conjunto de chatbots, además del tiempo actual
Descripción: Crea una lista que representa un conjunto de chatbots
|#
(define (hacer-sistema nombre chatbot1)
  (list nombre chatbot1 (current-seconds)))

(define (existe chatbot)
  (if (= (cdr (system)) nombre)
      #t
      #t))

(define (hacer-chatbot nombre)
  (list nombre))

#|
Función: system-add-chatbot
Dominio: system x chatbot
Recorrido: system
Descripción:
|#
(define (system-add-chatbot  nombre)
  (if (existe nombre)
      (display "Este chatbot ya existe")
      (hacer-chatbot nombre)))

(define get-posición (lambda (system) ))

(provide (all-defined-out))