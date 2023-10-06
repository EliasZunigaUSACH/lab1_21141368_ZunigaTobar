#lang racket

#|
Función: make-system
Dominio: string (nombre) x Código del chatbot inicial (número) x chatbot
Recorrido: Lista
Recursión: Ninguna
Descripción: 
|#
(define (make-system nombre miembros usuario initialChatbotCodeLink chatbot)
  (list nombre miembros usuario initialChatbotCodeLink chatbot (current-seconds)))

#|
Función: get-system
Dominio: system
Recorrido: string (nombre del sistema)
Recursión: Ninguna
Descripción: Obtiene el nombre del sistema
|#
(define get-system car)

#|
Función: get-system-initialChatbot
Dominio: system
Recorrido: número (initialChatbotID)
Recursión: Ninguna
Descripción: Obtiene el id del chatbot inicial
|#
(define get-system-initialChatbot cadddr)

#|
Función: get-system-chatbots
Dominio: system
Recorrido: lista (lista de chatbots)
Recursión: Ninguna
Descripción: Obtiene la lista de todos los chatbots agregados al sistema
|#
(define get-system-chatbots cddddr)

(define (filter-doubles-by-ID lista comando)
  (if (null? lista)
      null
      (if (null? (cdr lista))
          (cons (car lista) null)
          (if (member (comando (car lista)) (map comando (cdr lista)))
              (cons (car lista) (filter-doubles-by-ID (remw (car lista) (cdr lista)) comando))
              (cons (car lista) (filter-doubles-by-ID (cdr lista) comando))))))

(provide (all-defined-out))