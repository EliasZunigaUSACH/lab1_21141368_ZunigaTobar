#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")

#|
Función: history
Dominio: symbol
Recorrido: lista
Recursión: Ninguna
Descripción: Devuelve una lista inicialmente vacía para almacenar el hsitorial de chat de un usuario del sistema
|#
(define (history . chat) chat)

(provide (all-defined-out))