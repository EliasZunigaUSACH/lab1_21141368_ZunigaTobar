#lang racket

#|
PARADIGMAS DE PROGRAMACIÓN LABORATORIO 1
Nombre: Elías Zúñiga Tobar
RUT: 21.141.368-9
Profesor Gonzalo Matrinez
|#

(require "tda_system_21141368_ZunigaTobar.rkt")
(require "tda_chatbot_21141368_ZunigaTobar.rkt")

#|
Función:
Dominio:
Recorrido:
Descripción
|#
(define (system string)
  (if (es-string string)
      (hacer-sistema string null)
      #f))

;(define system-add-chatbot )

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

;(define chatbot-add-flow )

;(define system-add-user )

;(define system-login )

;(define system-logout )

;(define system-talk-rec )

;(define system-talk )

;(define system-synthesis )

;(define system-simulate )

;Ejecución

(define s0 (system "New"))
s0

