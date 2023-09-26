#lang racket

#|
PARADIGMAS DE PROGRAMACIÓN LABORATORIO 1
Nombre: Elías Zúñiga Tobar
RUT: 21.141.368-9
Profesor Gonzalo Matrinez
|#

(require "tda_system_21141368_ZunigaTobar.rkt")
(require "tda_chatbot_21141368_ZunigaTobar.rkt")
(require "tda_flow_21141368_ZunigaTobar.rkt")
(require "tda_option_21141368_ZunigaTobar.rkt")
(require "tda_user_21141368_ZunigaTobar.rkt")
(require "tda_chatHistory_21141368_ZunigaTobar.rkt")

#|
Función: option
Dominio: número (code) X string (message) X número (ChatbotCodeLink)
 X número (InitialFlowCodeLink) X strings* (0 o varias palabras claves)
Recorrido = option
Recursión: Ninguna
Descripción:
|#
(define option
  (lambda (code message chatbotCodeLink initialFlowCodeLink . keyword)
    (make-option code message chatbotCodeLink initialFlowCodeLink keyword)))

#|
Función: Flow
Dominio: numero (id) x name-msg (String) x opciones* (Puede recibir 0 o más opciones)
Recorrido: flow
Recursión: Ninguna
Descripción:
|#
(define flow
  (lambda (flow id name-msg . opciones)
    (make-flow id name-msg opciones)))

#|
Función: flow-add-option
Dominio: flow X option
Recorrido: flow
Recursión: Ninguna
Descripción:
|#
(define (flow-add-option opcion flujo)
  (if (equal? (get-option-id opcion) (get-flow-options-ids flujo))
      0
      (append flujo opcion)))

#|
Función: Chatbot
Dominio: ID (número) X nombre (String) X Mensaje de bienvenida (String) X StartFlowID (Número) X Flows
Recorrido: chatbot
Descripción: 
Recursión: Ninguna
|#
(define (chatbot id nombre mensajeBienvenida flujoInicial Flujos)
  (list id nombre mensajeBienvenida flujoInicial Flujos))

#|
Función: chatbot-add-flow
Dominio: chatbot X flow
Recorrido: flow
Recursión: Natural
|#
(define (chatbot-add-flow chatbot flow)
  (if (its-repeated chatbot flow)
      (display "Este flujo ya está añadido")
      (append flow (cdr (cdr (cdr (cdr chatbot)))))))

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
Función: system-login
Dominio: system x string (Nombre de usuario)
Recorrido:
Recursión: Ninguna
Descripción: 
|#
(define (system-login sistema usuario)
  (if (and (exists-user usuario sistema) (not (a-user-conected sistema)))
      (go system)
      (display "Este usuario no existe")))

#|
Función: system-logout
Domminio: system
Recorrido: system
Recursión: Ninguna
Descripción: 
|#
;(define (system-logout sistema)
;  (if (not )))


;(define system-talk-rec )

;(define system-talk )

;(define system-synthesis )

;(define system-simulate )

;EJECUCIÓN

(define ch0 (chatbot 0 "Asistente" "Bienvenido querido usuario, ¿Qué desea hacer hoy?" 1))
ch0

(define s0 (system "newSystem" 1))
s0
