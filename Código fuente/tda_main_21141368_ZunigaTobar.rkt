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
Descripción: Función constructora de una opción para flujo de un chatbot.
             Cada opción se enlaza a un chatbot y flujo especificados por sus respectivos códigos.
|#
(define option
  (lambda (code message chatbotCodeLink initialFlowCodeLink . keyword)
    (make-option code message chatbotCodeLink initialFlowCodeLink keyword)))

#|
Función: Flow
Dominio: numero (id) x name-msg (String) x opciones* (Puede recibir 0 o más opciones)
Recorrido: flow
Recursión: Ninguna
Descripción: Función constructora de un flujo de un chatbot.
|#
(define flow
  (lambda (id name-msg . opciones)
    (make-flow id name-msg (filter-doubles-by-ID opciones get-option-id))))

#|
Función: flow-add-option
Dominio: flow X option
Recorrido: flow
Recursión: Ninguna (No está permitido su uso)
Descripción: Función modificadora para añadir opciones a un flujo.
|#
(define (flow-add-option flujo opcion)
  (if (eq? (get-option-id opcion) (get-flow-options-ids flujo))
      flujo
      (append (cddr flujo) opcion)))

#|
Función: Chatbot
Dominio: ID (número) X nombre (String) X Mensaje de bienvenida (String) X StartFlowID (Número) X Flows
Recorrido: chatbot
Descripción: 
Recursión: Ninguna
|#
(define (chatbot id nombre mensajeBienvenida flujoInicial . flujos)
  (list id nombre mensajeBienvenida flujoInicial (filter-doubles-by-ID flujos get-flow-id)))

#|
Función: chatbot-add-flow
Dominio: chatbot X flow
Recorrido: flow
Recursión: Natural
|#
(define (chatbot-add-flow chatbot flujo)
  (if (flow-is-repeated chatbot flujo)
      chatbot
      (if (null? (cddddr chatbot))
          (cons chatbot (cons flujo null))
          (chatbot-add-flow (cdr chatbot) flujo))))

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
    (make-system nombre null null initialChatbotCodeLink (filter-doubles-by-ID chatbot get-chatbotID))))

#|
Función: system-add-chatbot
Dominio: system x chatbot
Recorrido: system
Descripción: 
|#
(define (system-add-chatbot sistema chatbot)
  (if (is-chatbot-repeated chatbot sistema)
      sistema
      (make-system (get-system sistema)
                   (get-users sistema)
                   (get-user sistema)
                   (get-system-initialChatbot sistema)
                   (append (caar (cdr (cdr (cdr (cdr sistema))))) (list chatbot)))))

#|
Función: system-add-user
Dominio: lista (system) x string (nombre de usuario)
Recorrido: 
Recursión: Ninguna
Descripción: 
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
Recursión: 
Descripción: Función que permite interactuar con un chatbot.
|#
;(define (system-talk-rec sistema mensaje)
;  (if (a-user-conected sistema)
;      ()
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

;(define system-synthesis )

;(define system-simulate )

;EJECUCIÓN

(define op1 (option  1 "1) Viajar" 2 1 "viajar" "turistear" "conocer"))

(define op2 (option  2 "2) Estudiar" 3 1 "estudiar" "aprender" "perfeccionarme"))

(define f10 (flow 1 "flujo1" op1 op2 op2 op2 op2 op1)) ;solo añade una ocurrencia de op2

(define f11 (flow-add-option f10 op1)) ;se intenta añadir opción duplicada

(define cb0 (chatbot 0 "Inicial" "Bienvenido\n¿Qué te gustaría hacer?" 1 f10 f10 f10 f10))  ;solo añade una ocurrencia de f10

(define s0 (system "Chatbots Paradigmas" 0 cb0 cb0 cb0))

(define s1 (system-add-chatbot s0 cb0)) ;igual a s0

(define s2 (system-add-user s1 "user1"))

(define s3 (system-add-user s2 "user2"))

(define s4 (system-add-user s3 "user2")) ;solo añade un ocurrencia de user2

(define s5 (system-add-user s4 "user3"))

(define s6 (system-login s5 "user8")) ;user8 no existe. No inicia sesión

(define s7 (system-login s6 "user1"))

(define s8 (system-login s7 "user2"))  ;no permite iniciar sesión a user2, pues user1 ya inició sesión

(define s9 (system-logout s8))

s0