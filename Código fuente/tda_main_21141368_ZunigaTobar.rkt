#lang racket

#|
PARADIGMAS DE PROGRAMACIÓN LABORATORIO 1
Nombre: Elías Zúñiga Tobar
RUT: 21.141.368-9
Profesor Gonzalo Matrinez
|#

#|
Este archivo estarán las funciones obligatorias para el laboratorio 1.
|#

(require "tda_system_21141368_ZunigaTobar.rkt")
(require "tda_chatbot_21141368_ZunigaTobar.rkt")
(require "tda_flow_21141368_ZunigaTobar.rkt")
(require "tda_option_21141368_ZunigaTobar.rkt")
(require "tda_user_21141368_ZunigaTobar.rkt")
(require "tda_chatHistory_21141368_ZunigaTobar.rkt")

#|
Función: option - Constructor
Dominio: número (code) X string (message) X número (ChatbotCodeLink)
 X número (InitialFlowCodeLink) X strings* (0 o varias palabras claves)
Recorrido = option
Recursión: Ninguna
Descripción: Función constructora de una opción para flujo de un chatbot.
             Cada opción se enlaza a un chatbot y flujo especificados por sus respectivos códigos.
|#
(define option
  (lambda (code message chatbotCodeLink initialFlowCodeLink . keyword)
    (make-option code message chatbotCodeLink initialFlowCodeLink keyword)))

#|
Función: Flow - Constructor
Dominio: numero (id) x name-msg (String) x opciones* (Puede recibir 0 o más opciones)
Recorrido: flow
Recursión: Ninguna
Descripción: Función constructora de un flujo de un chatbot.
|#
(define flow
  (lambda (id name-msg . opciones)
    (make-flow id name-msg (filter-doubles-by-ID opciones get-option-id))))

#|
Función: flow-add-option - Modificador
Dominio: flow X option
Recorrido: flow
Recursión: Ninguna (No está permitido su uso)
Descripción: Función modificadora para añadir opciones a un flujo.
|#
(define (flow-add-option flujo opcion)
  (if (member (get-option-id opcion) (get-flow-options-ids flujo))
      flujo
      (make-flow (car flujo)
                 (cadr flujo)
                 (append (get-flow-options flujo) (list opcion)))))

#|
Función: Chatbot - Constructor
Dominio: ID (número) X nombre (String) X Mensaje de bienvenida (String) X StartFlowID (Número) X Flows
Recorrido: chatbot
Descripción: Función constructora de un chatbot
Recursión: Ninguna
|#
(define (chatbot id nombre mensajeBienvenida flujoInicial . flujos)
  (make-chatbot id nombre mensajeBienvenida flujoInicial (filter-doubles-by-ID flujos get-flow-id)))

#|
Función: chatbot-add-flow - Modificador
Dominio: chatbot X flow
Recorrido: flow
Recursión: Cola (Esta función actúa como envoltorio)
Descripcion: Función modificadora para añadir flujos a un chatbot.
|#
(define chatbot-add-flow
  (lambda (chatbot flujo)
    (make-chatbot (car chatbot)
                  (cadr chatbot)
                  (caddr chatbot)
                  (cadddr chatbot)
                  (chAddFlw-tail (car (get-chatbot-flows chatbot)) flujo null))))
  
#| 
Función: System - Constructor
Dominio: string (nombre) x Código del chatbot inicial (número) x chatbot* (Puede recibir 0 chatbots
 o más)
Recorrido: System
Recursión: Ninguna
Descripción: Función constructora de un sistema de chatbots.
             Deja registro de la fecha de creación por make-system.
|#
(define system
  (lambda (nombre initialChatbotCodeLink . chatbot)
    (make-system nombre null null initialChatbotCodeLink (filter-doubles-by-ID chatbot get-chatbotID))))

#|
Función: system-add-chatbot - Modificador
Dominio: system x chatbot
Recorrido: system
Descripción: Función modificadora para añadir chatbots a un sistema.
|#
(define (system-add-chatbot sistema chatbot)
  (if (is-chatbot-repeated chatbot sistema)
      sistema
      (make-system (get-system sistema)
                   (get-users sistema)
                   (get-user sistema)
                   (get-system-initialChatbot sistema)
                   (append (car (get-system-chatbots sistema)) (list chatbot)))))

#|
Función: system-add-user - Modificador
Dominio: lista (system) x string (nombre de usuario)
Recorrido: system
Recursión: Ninguna
Descripción: Función modificadora para añadir usuarios a un sistema.
|#
(define (system-add-user sistema usuario)
  (if (exists-user usuario sistema)
      sistema
      (register usuario sistema)))

#|
Función: system-login
Dominio: system x string (Nombre de usuario)
Recorrido: system
Recursión: Ninguna
Descripción: Función que permite iniciar una sesión en el sistema.
|#
(define (system-login sistema usuario)
  (if (null? (get-users sistema))
             sistema
             (if (a-user-conected sistema)
                 sistema
                 (if (exists-user usuario sistema)
                     (conect-user sistema usuario)
                     sistema))))

#|
Función: system-logout
Domminio: system
Recorrido: system
Recursión: Ninguna
Descripción: Función que permite cerrar una sesión abierta.
|#
(define (system-logout sistema)
  (if (a-user-conected sistema)
      (make-system
       (get-system sistema)
       (get-users sistema)
       null
       (get-system-initialChatbot sistema)
       (car (get-system-chatbots sistema)))
      sistema))

#|
Función: system-talk-rec
Domminio: system X string (mensaje)
Recorrido: system
Recursión: Ninguna (Función no implementada aún)
Descripción: Función que permite interactuar con un chatbot.
|#
;(define (system-talk-rec sistema mensaje)
;  (if (a-user-conected sistema)
;      (define (system-talk-rec-tail sistema mensaje)
;        (if (member (string-downcase (mensaje)) ()))
;          ()
;          ())
;      sistema))

#|
Función: system-talk-norec
Domminio: system X string (mensaje)
Recorrido: system
Recursión: Ninguna (Uso no permitido)
Descripción: Función que permite interactuar con un chatbot.
             Mismo propósito de la función anterior pero con una implementación declarativa.
|#
;(define (system-talk-norec sistema mensaje))

#|
Función: system-synthesis
Domminio: system X string (mensaje)
Recorrido: string (formateado para poder visualizarlo con display)
Recursión: Ninguna (Uso no permitido)
Descripción: Función que ofrece una síntesis del chatbot para un usuario particular
             a partir de chatHistory contenido dentro del sistema
|#
;(define (system-synthesis sistema mensaje))

#|
Función: system-simulate
Domminio: system X número (max iteraciones) X número (semilla)
Recorrido: system
Recursión: Ninguna (Función no implementada aún)
Descripción: Permite simular un diálogo entre dos chatbots del sistema.
|#
;(define (system-simulate iteraciones seed))

(provide (all-defined-out))