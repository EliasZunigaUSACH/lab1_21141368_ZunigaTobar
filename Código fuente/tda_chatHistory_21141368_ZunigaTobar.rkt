#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")

#|
Función:
|#
(define (chatHistory . chats) chats)

#||#
(define (get-chat chat user)
  (if (exists-chat chat user)))

;(define (exists-chat chat historial)
;  (map ))

(provide (all-defined-out))