#lang racket

#|
Función: make-system
Dominio: string (nombre) x Código del chatbot inicial (número) x chatbot
Recorrido: Lista
Recursión: Ninguna
Descripción: 
|#
(define (make-system nombre initialChatbotCodeLink chatbot)
  (list nombre (list null) initialChatbotCodeLink chatbot (current-seconds)))

#|
Función: exists-user
Dominio: string x lista
Recorrido: Booleano
Recursión: Ninguna
Descripción: 
|#
(define (exists-user nombre sistema)
  (if (null? (cdr (cdr (cdr (cdr sistema)))))
      #f
      (map (lambda (x) (= (car x) nombre)) (cdr (cdr (cdr (cdr sistema)))))))

(provide (all-defined-out))