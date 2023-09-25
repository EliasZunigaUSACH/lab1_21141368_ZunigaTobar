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
Función: system-add-user
Dominio: lista (system) x string (nombre de usuario)
Recorrido: 
Recursión: Ninguna
Descripción: 
|#
(define (system-add-user usuario sistema)
  (if (exists-user usuario sistema)
      (display "Este usuario ya existe en este sistema")
      (add-user usuario sistema)))

#|
Función: add-user
|#
(define (add-user usuario sistema)
  (append sistema usuario))

#|
Función: system-logout
Domminio: system
Recorrido: system
Recursión: Ninguna
Descripción: 
|#
;(define (system-logout sistema)
;  (if (not )))

(provide (all-defined-out))