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
Función:
Dominio:
Recorrido:
Descripción
|#
(define (system string)
  (if (string? string)
      (hacer-sistema string null)
      #f))

;(define option )

;(define flow )

;(define flow-add-option )

#|
Función: Chatbot
Dominio: 
Recorrido: 
Descripción: 
|#
;(define chatbot )

;(define system-add-user )

;(define system-login )

;(define system-logout )

;(define system-talk-rec )

;(define system-talk )

;(define system-synthesis )

;(define system-simulate )

;Ejecución

(define s0 (system "newSystem"))
s0

