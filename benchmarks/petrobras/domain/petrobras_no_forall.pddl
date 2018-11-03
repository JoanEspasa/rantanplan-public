;
; Petrobras problem
; ==========================================================
;
; http://ipc.icaps-conference.org/
; http://icaps12.poli.usp.br/icaps12/ickeps/petrobrasdomain
;

(define (domain petrobras)
    (:requirements :strips :typing :fluents :equality)
    
    (:types strip port waiting_area platform - location 
            ship cargo - object
    ) 

    (:predicates
        (at_ ?sh - object ?where - location)
        (can_refuel ?l - location)
        (docked ?sh - ship ?where - location)
        (loaded ?c - cargo ?sh - ship)
        (is_waiting_area ?l - location)
    )

    (:functions

     ; atributs dels vaixells
     ; --------------------
     (current_fuel ?sh - ship) - number
     (current_load ?sh - ship) - number
     (fuel_capacity ?sh - ship) - number
     (load_capacity ?sh - ship) - number

     (current_docking_capacity ?p - location) - number
     (total_docking_capacity ?p - location) - number

     ; atributs espacials
     ; --------------------
     (distance ?from - location ?to - location) - number

     ; atributs de la carga
     ; --------------------
     (weight ?c - cargo) - number

     ; objectiu
     ; --------------------
     (total_fuel_used) - number

    )

    ; --- sail : porta un ship de un location a un altre
    ; TODO: pre - te prou fuel per arribar a algun lloc per recargar
    ; TODO: pre - te prou fuel per arribar destinacio
    ; TODO: eff - decrease fuel segons carga

    (:action sail
            :parameters (?sh - ship ?from - location ?to - location)
            :precondition (and (at_ ?sh ?from)                           
                               (not (docked ?sh P1))
                               (not (docked ?sh P2))
                               (not (docked ?sh A1))
                               (not (docked ?sh A2))
                               (not (docked ?sh F1))
                               (not (docked ?sh F2))
                               (not (docked ?sh F3))
                               (not (docked ?sh F4))
                               (not (docked ?sh F5))
                               (not (docked ?sh F6))
                               (not (docked ?sh G1))
                               (not (docked ?sh G2))
                               (not (docked ?sh G3))
                               (not (docked ?sh G4))
                               (imply (= (current_load ?sh) 0)
                                   (>= (current_fuel ?sh) (/ (distance ?from ?to) 5)))
                               (imply (not (= (current_load ?sh) 0))
                                   (>= (current_fuel ?sh) (/ (distance ?from ?to) 3))))
                                
            :effect (and (at_ ?sh ?to)
                         (not (at_ ?sh ?from))
                         (when (= (current_load ?sh) 0) (and
                             (decrease (current_fuel ?sh) (/ (distance ?from ?to) 5))
                             (increase (total_fuel_used) (/ (distance ?from ?to) 5))))
                         (when (not (= (current_load ?sh) 0)) (and
                             (decrease (current_fuel ?sh) (/ (distance ?from ?to) 3))
                             (increase (total_fuel_used) (/ (distance ?from ?to) 3)))))
    )

    (:action dock
            :parameters (?sh - ship ?p - location)
            :precondition (and (> (current_docking_capacity ?p) 0)
                               (not (docked ?sh ?p))
                               (at_ ?sh ?p))
            :effect (and 
                        (decrease (current_docking_capacity ?p) 1)
                        (docked ?sh ?p))
    )

    (:action undock
            :parameters (?sh - ship ?p - location)
            :precondition (and (docked ?sh ?p)
                               (at_ ?sh ?p)) ; TODO: es redundant, a treure?
            :effect (and 
                        (increase (current_docking_capacity ?p) 1)
                        (not (docked ?sh ?p)))
    )

    ; param: port, baixell, carga
    ; pre  : la carga i el baixell son al mateix lloc
    ;        el baixell te espai suficient
    ;        el baixell esta docked 
    ; eff  : la carga al baixell
    ;        carga no al port
    ;        afegim la carga al baixell
    (:action load
            :parameters (?p - port ?sh - ship ?c - cargo)
            :precondition (and
                                (at_ ?c ?p)
                                (>= (load_capacity ?sh) (+ (current_load ?sh) (weight ?c)))
                                (docked ?sh ?p))

            :effect (and 
                        (not (at_ ?c ?p))
                        (loaded ?c ?sh)
                        (increase (current_load ?sh) (weight ?c)))
    )

    ; param: lloc, baixell, carga
    ; pre  : baixell docked a la plataforma
    ; eff  : deixa el paquet 
    ;         baixa la carga
    ;         paquet no al baixell
    ;         paquet al platform
    (:action unload
            :parameters (?c - cargo ?p - platform ?sh - ship)
            :precondition (and
                            (at_ ?sh ?p)
                            (loaded ?c ?sh)
                            (docked ?sh ?p))
            :effect (and
                        (decrease (current_load ?sh) (weight ?c))
                        (not (loaded ?c ?sh))
                        (at_ ?c ?p))
    )

    ; pre: el lloc pot recarregar
    ;      el nivell no esta a tope
    ; TODO: tindre em compte el fet d'emplenar fins al tope no gasta 1h 

    (:action refuel_at_port
            :parameters (?sh - ship ?l - port)
            :precondition (and
                              (can_refuel ?l)
                              (at_ ?sh ?l)
                              (docked  ?sh ?l)
                              (<= (+ (current_fuel ?sh) 200) (fuel_capacity ?sh))
                              )
            :effect (and 
                        (when (<= (+ (current_fuel ?sh) 200) (fuel_capacity ?sh))
                            (increase (current_fuel ?sh) 200))
                        (when (and (> (+ (current_fuel ?sh) 200) (fuel_capacity ?sh)))
                            (increase (current_fuel ?sh) (- (fuel_capacity ?sh) (current_fuel ?sh))))
                        )
            )
    
    (:action refuel_at_platform
            :parameters (?sh - ship ?l - platform)
            :precondition (and
                              (can_refuel ?l)
                              (at_ ?sh ?l)
                              (docked  ?sh ?l)
                              (<= (+ (current_fuel ?sh) 100) (fuel_capacity ?sh))
                              )
            :effect (and
                        (when (<= (+ (current_fuel ?sh) 100) (fuel_capacity ?sh))
                             (increase (current_fuel ?sh) 100))
                        (when (> (+ (current_fuel ?sh) 100) (fuel_capacity ?sh))
                            (increase (current_fuel ?sh) (- (fuel_capacity ?sh) (current_fuel ?sh))))
                        )
            )
)

