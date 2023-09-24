#lang racket

#|
Función: System
Dominio: string (nombre) x Código del chatbot inicial (número) x chatbot* (Puede recibir 0 chatbots
 o más)
Recorrido: System
Recursión: Ninguna
Descripción: 
|#
(define system
  (lambda (nombre initialChatbotCodeLink . chatbot)
    (make-system nombre initialChatbotCodeLink chatbot)))

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
Función: system-add-chatbot
Dominio: system x chatbot
Recorrido: system
Descripción: 
|#
(define (system-add-chatbot nombre sistema)
  (if (exists-chatbot nombre cdr sistema)
      (display "Este chatbot ya existe")
      (system sistema nombre)))

#|
Función: existe-chatbot
Dominio: nombre x lista
Recorrido: lista de booleanos
Descripción: Verifica la existencia del nombre en la lista de chatbots
|#
(define (exists-chatbot nombreChatbot lista)
  (map (lambda (x) (= x nombreChatbot)) lista))

#|
Función: existe-usuario
Dominio: string x lista
Recorrido: Booleano
Recursión: Ninguna
Descripción: 
|#
(define (exists-usuario nombre miembros)
  (map (lambda (x) (= x nombre)) miembros))

#|
Función: system-add-user
Dominio: lista (system) x string (nombre de usuario)
Recorrido: 
Recursión: Ninguna
Descripción: 
|#
(define (system-add-user sistema usuario)
  (if (exists-usuario usuario sistema)
      (display "Este usuario ya existe en este sistema")
      (1)))

#|
Función: users
Dominio: String (nombres)
Recorrido: 
Recusión: Ninguna
|#
(define (users . usuario) usuario)

;(define system-login )

;(define system-logout )

(provide (all-defined-out))