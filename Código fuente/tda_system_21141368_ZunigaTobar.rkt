#lang racket

#|
Función: make-system
Dominio: string (nombre) x Código del chatbot inicial (número) x chatbot
Recorrido: Lista
Recursión: Ninguna
Descripción: 
|#
(define (make-system nombre initialChatbotCodeLink chatbot)
  (list nombre initialChatbotCodeLink chatbot))

#|
Función: exists-user
Dominio: string x lista
Recorrido: Booleano
Recursión: Ninguna
Descripción: 
|#
(define (exists-user nombre sistema)
  (map (lambda (x) (= x nombre)) (cdr (cdr (cdr (car sistema))))))

#|
Función: add-user
|#
(define (add-user usuario sistema)
  (cons sistema (cons usuario null)))

(provide (all-defined-out))