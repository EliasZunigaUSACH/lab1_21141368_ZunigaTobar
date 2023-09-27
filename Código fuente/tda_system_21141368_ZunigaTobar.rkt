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
Función: exists-chatbot
Dominio: nombre x lista
Recorrido: lista de booleanos
Descripción: Verifica la existencia del nombre en la lista de chatbots
|#
(define (exists-chatbot nombreChatbot lista)
  (map (lambda (x) (= x nombreChatbot)) lista))

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
  (append sistema usuario))

#|
Función: members
|#
(define (members . users) users)

(provide (all-defined-out))