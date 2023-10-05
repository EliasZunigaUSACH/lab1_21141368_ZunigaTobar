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
;      (map (lambda (x) (= (car x) nombre)) (cdr (cdr (cdr (cdr sistema)))))))
;      (if (member nombre (cdr (car sistema)))
;          #t
;          #f)))
      (if (member nombre (get-users sistema))
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
;  (or (equal? (get-users-status sistema) 1)
;      #t
;      #f))
  (if (not (null? (get-user sistema)))
      #t
      #f))

#|
Función: get-users-status
Dominio: system
Recorrido: system
Recursión: Ninguna
Descripción:
|#
;(define (get-users-status sistema)
;  (map (get-status) (last sistema)))

#|
Función: get-status
Dominio: lista
Recorrido: número
Recursión: Ninguna
Descripción: 
|#
;(define get-status cdar)

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
;  (reverse (append (remove last (reverse (cadr sistema))) (list usuario))))
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