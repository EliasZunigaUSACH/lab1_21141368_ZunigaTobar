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

;(define system-talk-rec )

;(define system-talk )

;(define system-synthesis )

;(define system-simulate )

;Ejecución

(define ch0 (chatbot 0 "Asistente" "Bienvenido querido usuario, ¿Qué desea hacer hoy?" 1))
ch0

(define s0 (system "newSystem" 1))
s0
