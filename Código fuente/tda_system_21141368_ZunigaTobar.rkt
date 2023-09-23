#lang racket

#|
Función: System
Dominio: string (nombre) x 
Recorrido:
Descripción
|#

(define (system nombre InitialChatbotCodeLink chatbot)
  (list nombre InitialChatbotCodeLink chatbot))

#|
(define (system string)
  (if (string? string)
      (hacer-sistema string null)
      #f))
|#

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
Descripción: mediante map, verifica la existencia del nombre ingresado dentro de la lista de usuarios registrados
|#
(define (exists-usuario nombre miembros)
  (map (lambda (x) (= x nombre)) miembros))

#|
Función: system-add-user
Dominio: lista (system) x string (nombre de usuario)
Recorrido: lista (system)
Recursión: Ninguna
Descripción: Agrega un usuario que no existía en el sistema anteriormente
|#
(define (system-add-user sistema usuario)
  (if (exists-usuario usuario sistema)
      (display "Este usuario ya existe en este sistema")
      (users usuario)))

;(define system-login )

;(define system-logout )

(provide (all-defined-out))