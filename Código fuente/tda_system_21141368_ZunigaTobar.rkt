#lang racket

#|
PARADIGMAS DE PROGRAMACIÓN LABORATORIO 1
Nombre: Elías Zúñiga Tobar
RUT: 21.141.368-9
Profesor Gonzalo Matrinez
|#

#|
Función: make-system
Dominio: string (nombre) x Código del chatbot inicial (número) x chatbot
Recorrido: Lista
Recursión: Ninguna
Descripción: Se crea una lista con los elementos ingresados más los segundos recurrentes,
             esta lista representará un sistema
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

#|
Función: filter-doubles-by-ID
Dominio: lista X comando (función)
Recorrido: lista
Recursión: Natural
Descripción: Devuelve una lista sin elementos duplicados
|#
(define filter-doubles-by-ID
  (lambda (lista comando)
    (if (null? lista)
        null
        (if (null? (cdr lista))
            (cons (car lista) null)
            (if (member (comando (car lista)) (map comando (cdr lista)))
                (cons (car lista) (filter-doubles-by-ID (filter (lambda (lst) (not (eq? (comando lst) (comando (car lista))))) (cdr lista)) comando))
                (cons (car lista) (filter-doubles-by-ID (cdr lista) comando)))))))

(provide (all-defined-out))