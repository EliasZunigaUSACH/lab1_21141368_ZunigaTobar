#lang racket

(require "tda_system_21141368_ZunigaTobar.rkt")

#|
Función: make-user
Dominio: string (nombre) X system
Recorrido: lista
Recursión: Niguna
Descripción: 
|#
;(define (make-user nombre sistema)
;  (if (exists-user nombre sistema)
;      #t
;      (list nombre )))

#|
Función: exists-user
Dominio: string x lista
Recorrido: Booleano
Recursión: Ninguna
Descripción: Verifica la existencia de un usuario en el sistema
|#
(define (exists-user nombre sistema)
  (if (null? (get-users sistema))
      #f
      (if (member (get-user-id nombre) (get-users-id sistema))
          #t
          #f)))

#|
Función: a-user-conected
Dominio: system
Recorrido: boolean
Recursión: Ninguna
Descripción: Verifica si usuario ha iniciado sesion en el sistema
|#
(define (a-user-conected sistema)
  (if (not (null? (get-user sistema)))
      #t
      #f))

#|
Función: get-user-id
Dominio: system
Recorrido: numero
Recursión: Ninguna
Descripción: Obtiene el id del usuario
|#
(define (get-user-id usuario)
  (car (reverse (string->list usuario))))

#|
Función: get-users-id
Dominio: system
Recorrido: lista de números
Recursión: Ninguna
Descripción: Obtiene una lista con las IDs de los usuarios registrados en el sistema
|#
(define (get-users-id sistema)
  (map get-user-id (cadr sistema)))

#|
Función: conect-user
Dominio: system X string (usuario)
Recorrido: system
Recursión: Ninguna
Descripción: Conecta el usuario de entrada para iniciar sesión
|#
(define (conect-user sistema usuario)
  (make-system (get-system sistema)
               (get-users sistema)
               usuario
               (get-system-initialChatbot sistema)
               (car (get-system-chatbots sistema))))

#|
Función: get-users (plural)
Dominio: lista (system)
Recorrido: lista (usuarios registrados)
Recursión: Ninguna
Descripción: Obtiene una lista de todos los usuarios registrados en el sistema
|#
(define get-users cadr)

#|
Función: get-user
Dominio: lista (system)
Recorrido: string (nombre de usuario conectado)
Recursión: Ninguna
Descripción: Obtiene el nombre del usuario que ha iniciado sesión en el sistema
|#
(define get-user caddr)

#|
Función: register
Dominio: string (usuario) X system
Recorrido: system
Recursión: Ninguna
Descripción: Registra el usuario ingresado al sistema
|#
(define (register usuario sistema)
  (if (null? (get-users sistema))
      (make-system
       (get-system sistema)
       (list usuario)
       null
       (get-system-initialChatbot sistema)
       (car (get-system-chatbots sistema)))
      (make-system
       (get-system sistema)
       (append (get-users sistema) (list usuario))
       null
       (get-system-initialChatbot sistema)
       (car (get-system-chatbots sistema)))))

(provide (all-defined-out))