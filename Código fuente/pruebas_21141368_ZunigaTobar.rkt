#lang racket

(require "tda_main_21141368_ZunigaTobar.rkt")

;Script de pruebas

;Chabot0
(define op1 (option  1 "1) Viajar" 1 1 "viajar" "turistear" "conocer"))
(define op2 (option  2 "2) Estudiar" 2 1 "estudiar" "aprender" "perfeccionarme"))
(define f10 (flow 1 "Flujo Principal Chatbot 1\nBienvenido\n¿Qué te gustaría hacer?" op1 op2 op2 op2 op2 op1)) ;solo añade una ocurrencia de op2 y op1
(define f11 (flow-add-option f10 op1)) ;se intenta añadir opción duplicada            
(define cb0 (chatbot 0 "Inicial" "Bienvenido\n¿Qué te gustaría hacer?" 1 f10 f10 f10 f10))  ;solo añade una ocurrencia de f10

;op1
;op2
;f10
;f11
;cb0

;Chatbot1
(define op3 (option 1 "1) New York, USA" 1 2 "USA" "Estados Unidos" "New York"))
(define op4 (option 2 "2) París, Francia" 1 1 "Paris" "Eiffel"))
(define op5 (option 3 "3) Torres del Paine, Chile" 1 1 "Chile" "Torres" "Paine" "Torres Paine" "Torres del Paine"))
(define op6 (option 4 "4) Volver" 0 1 "Regresar" "Salir" "Volver"))

;op3
;op4
;op5
;op6

;Opciones segundo flujo Chatbot1
(define op7 (option 1 "1) Central Park" 1 2 "Central" "Park" "Central Park"))
(define op8 (option 2 "2) Museos" 1 2 "Museo"))
(define op9 (option 3 "3) Ningún otro atractivo" 1 3 "Museo"))
(define op10 (option 4 "4) Cambiar destino" 1 1 "Cambiar" "Volver" "Salir")) 
(define op11 (option 1 "1) Solo" 1 3 "Solo")) 
(define op12 (option 2 "2) En pareja" 1 3 "Pareja"))
(define op13 (option 3 "3) En familia" 1 3 "Familia"))
(define op14 (option 4 "4) Agregar más atractivos" 1 2 "Volver" "Atractivos"))
(define op15 (option 5 "5) En realidad quiero otro destino" 1 1 "Cambiar destino"))
(define f20 (flow 1 "Flujo 1 Chatbot1\n¿Dónde te Gustaría ir?" op3 op4 op5 op6))
(define f21 (flow 2 "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?" op7 op8 op9 op10))
(define f22 (flow 3 "Flujo 3 Chatbot1\n¿Vas solo o acompañado?" op11 op12 op13 op14 op15))
(define cb1 (chatbot 1 "Agencia Viajes"  "Bienvenido\n¿Dónde quieres viajar?" 1 f20 f21 f22))

;op7
;op8
;op9
;op10
;op11
;op12
;op13
;op14
;op15
;f20
;f21
;f22
;cb1

; Chatbot2
(define op16 (option 1 "1) Carrera Técnica" 2 1 "Técnica"))
(define op17 (option 2 "2) Postgrado" 2 1 "Doctorado" "Magister" "Postgrado"))
(define op18 (option 3 "3) Volver" 0 1 "Volver" "Salir" "Regresar"))
(define f30 (flow 1 "Flujo 1 Chatbot2\n¿Qué te gustaría estudiar?" op16 op17 op18))
(define cb2 (chatbot 2 "Orientador Académico"  "Bienvenido\n¿Qué te gustaría estudiar?" 1 f30))

;op16
;op17
;op18
;f30
;cb2

; nuevas opciones para chatbot0
(define op19 (option 3 "3) Comprar" 3 1 "comprar" "venta" "negocios"))
(define op20 (option 4 "4) Cocinar" 4 1 "cocinar" "comida"))
(define op21 (option 5 "5) Leer" 5 1 "leer" "lectura"))
(define f12 (flow-add-option f11 op19))
(define f13 (flow-add-option f12 op20))
(define f14 (flow-add-option f13 op21))

;op19
;op20
;op21

; nuevo chatbot (3)
(define op22 (option 1 "1) Videojuegos" 3 2 "juegos" "videojuegos"))
(define op23 (option 2 "2) Ropa" 3 2 "ropa" "prendas" "zapatos" "pantalones" "poleras"))
(define op24 (option 3 "3) Volver" 0 1 "volver" "salir" "regresar"))
(define f40 (flow 1 "Flujo 1 Chatbot3\n¿Qué te gustaría comprar?" op22 op23 op24))
(define cb3 (chatbot 3 "Agencia de compras" "Bienvenido\n¿Qué te gustaría comprar" 1 f40))

;op22
;op23
;op24
;f40
;cb3

; nuevo chatbot (4)
(define op25 (option 1 "1) Fideos" 4 1 "fideos" "espagueti" "pasta"))
(define op26 (option 2 "2) Arroz" 4 2 "arroz"))
(define op27 (option 3 "3) Volver" 0 1 "volver" "salir" "regresar"))
(define f50 (flow 1 "Flujo 1 Chatbot4\n¿Qué te gustaría cocinar?" op25 op26 op27))
(define cb4 (chatbot 4 "" 1 f50))

;op25
;op26
;op27
;f50
;cb4

; nuevo chatbot (5)
(define op28 (option 1 "1) Libro" 5 1 "libro"))
(define op29 (option 2 "2) Artículo" 5 2 "internet" "artículo"))
(define op30 (option 3 "3) Volver" 0 1 "Volver" "Salir" "Regresar"))
(define f60 (flow 1 "Flujo 1 Chatbot5\n¿Qué te gustaría leer?" op28 op29 op30))
(define cb5 (chatbot 5 "" 1 f60))

;op27
;op28
;op29
;f60
;cb5

; Sistema
(define s0 (system "Chatbots Paradigmas" 0 cb0 cb0 cb0 cb1 cb2))
(define s1 (system-add-chatbot s0 cb0)) ;igual a s0
(define s2 (system-add-user s1 "user1"))
(define s3 (system-add-user s2 "user2"))
(define s4 (system-add-user s3 "user2"))
(define s5 (system-add-user s4 "user3"))
(define s6 (system-login s5 "user8"))
(define s7 (system-login s6 "user1"))
(define s8 (system-login s7 "user2"))
(define s9 (system-logout s8))
(define s10 (system-login s9 "user2"))
(define s11 (system-logout s10))
(define s12 (system-add-user s11 "user4"))
(define s13 (system-login s12 "user4"))
(define s14 (system-logout s13))
(define s15 (system-add-user s14 "user5"))
(define s16 (system-login s15 "user6"))
(define s17 (system-logout s16))
(define s18 (system-add-user s17 "user6"))
(define s19 (system-add-chatbot s18 cb3))
(define s20 (system-add-chatbot s19 cb4))
(define s21 (system-add-chatbot s20 cb5))
(define s22 (system-login s21 "user6"))
(define s23 (system-logout s22))

;s0
;s1
;s2
;s3
;s4
;s5
;s6
;s7
;s8
;s9
;s10