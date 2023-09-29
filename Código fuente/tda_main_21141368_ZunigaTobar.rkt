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
  (lambda (id name-msg . opciones)
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
      (display "Esta opción ya está agregada en este flujo\n")
      (append (cdr flujo) opcion)))

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
(define (chatbot-add-flow chatbot flujo)
  (if (flow-is-repeated chatbot flujo)
      (display "Este flujo ya está añadido en este chatbot\n")
      (if (null? chatbot)
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
    (make-system nombre initialChatbotCodeLink chatbot)))

#|
Función: system-add-chatbot
Dominio: system x chatbot
Recorrido: system
Descripción: 
|#
(define (system-add-chatbot sistema chatbot)
  (if (chatbot-repeated chatbot sistema)
      (display "Este chatbot ya existe\n")
      (cons (cdr (cdr (car sistema))) (cons chatbot null))))

#|
Función: system-add-user
Dominio: lista (system) x string (nombre de usuario)
Recorrido: 
Recursión: Ninguna
Descripción: 
|#
(define (system-add-user sistema usuario)
  (if (null? (cdr sistema))
      (add-user usuario sistema)
      (if (exists-user usuario sistema)
          (display "Este usuario ya existe en este sistema\n")
          (add-user usuario sistema))))

#|
Función: system-login
Dominio: system x string (Nombre de usuario)
Recorrido:
Recursión: Ninguna
Descripción: 
|#
(define (system-login sistema usuario)
  (if (null? (cdddr sistema))
      (display "No hay ningun usuario registrado en el sistema\n")
      (if (a-user-conected sistema)
          (display "Un usuario ya ha iniciado sesión\n")
          (if (exists-user usuario sistema)
              (cons sistema (cons usuario null))
              (display "Este usuario no existe\n")))))

#|
Función: system-logout
Domminio: system
Recorrido: system
Recursión: Ninguna
Descripción: 
|#
;(define (system-logout sistema)
;  (if (a-user-conected sistema)
;      ()
;      (display "No hay un usuario conectado")))


;(define system-talk-rec )

;(define system-talk )

;(define system-synthesis )

;(define system-simulate )

;EJECUCIÓN

(define op1 (option  1 "1) Viajar" 2 1 "viajar" "turistear" "conocer"))

(define op2 (option  2 "2) Estudiar" 3 1 "estudiar" "aprender" "perfeccionarme"))

(define f1 (flow 1 "flujo1" op1))

(define ch0 (chatbot 0 "Asistente" "Bienvenido querido usuario, ¿Qué desea hacer hoy?" 1 f1))

(define ch1 (chatbot 1 "lel" "merequetenge" 1 f1))

(define s0 (system "newSystem" 0 ch0))

(define s1 (system-add-chatbot s0 ch1))

;(define s2 (system-add-user s1 "user1"))

;(define s3 (system-login s2 "user1"))