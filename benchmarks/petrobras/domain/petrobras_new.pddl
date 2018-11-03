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
        (can_refuel ?l - location)
        (is_waiting_area ?l - location)
    )

    (:functions

     ; atributs dels vaixells
     ; --------------------
     (current_fuel ?sh - ship) - number
     (current_load ?sh - ship) - number
     (fuel_capacity ?sh - ship) - number
     (load_capacity ?sh - ship) - number
     (docked ?sh - ship) - location

     (current_docking_capacity ?p - location) - number
     (total_docking_capacity ?p - location) - number

     ; atributs espacials
     ; --------------------
     (at_ ?sh - object) - location
     (distance ?from - location ?to - location) - number
     (consumption_full  ?from - location ?to - location) - number
     (consumption_empty ?from - location ?to - location) - number

     ; atributs de la carga
     ; --------------------
     (weight ?c - cargo) - number
     (loaded ?c - cargo) - ship

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
            :precondition (and (= (at_ ?sh) ?from) 
                               (= (docked ?sh) nowhere)
                               (imply (= (current_load ?sh) 0)
                                   (>= (current_fuel ?sh) (consumption_empty ?from ?to)))
                               (imply (not (= (current_load ?sh) 0))
                                   (>= (current_fuel ?sh) (consumption_full ?from ?to))))
                                
            :effect (and (assign (at_ ?sh) ?to)
                         (when (= (current_load ?sh) 0) (and
                             (decrease (current_fuel ?sh) (consumption_empty ?from ?to))
                             (increase (total_fuel_used) (consumption_empty ?from ?to))))
                         (when (not (= (current_load ?sh) 0)) (and
                             (decrease (current_fuel ?sh) (consumption_full ?from ?to))
                             (increase (total_fuel_used) (consumption_full ?from ?to)))))
    )

    (:action dock
            :parameters (?sh - ship ?p - location)
            :precondition (and (> (current_docking_capacity ?p) 0)
                               (not (= (docked ?sh) ?p))
                               (= (at_ ?sh) ?p))
            :effect (and 
                        (decrease (current_docking_capacity ?p) 1)
                        (assign (docked ?sh) ?p))
    )

    (:action undock
            :parameters (?sh - ship ?p - location)
            :precondition (and (= (docked ?sh) ?p)
                               (= (at_ ?sh) ?p))
            :effect (and 
                        (increase (current_docking_capacity ?p) 1)
                        (assign (docked ?sh) nowhere)))
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
                                (= (at_ ?c) ?p)
                                (>= (load_capacity ?sh) (+ (current_load ?sh) (weight ?c)))
                                (= (docked ?sh) ?p))

            :effect (and 
                        (not (= (at_ ?c) ?p))
                        (= (loaded ?c) ?sh)
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
                            (= (at_ ?sh) ?p)
                            (= (loaded ?c) ?sh)
                            (= (docked ?sh) ?p))
            :effect (and
                        (decrease (current_load ?sh) (weight ?c))
                        (= (loaded ?c) noship)
                        (= (at_ ?c) ?p))
    )

    ; pre: el lloc pot recarregar
    ;      el nivell no esta a tope
    ; TODO: tindre em compte el fet d'emplenar fins al tope no gasta 1h 

    (:action refuel_at_port
            :parameters (?sh - ship ?l - port)
            :precondition (and
                              (can_refuel ?l)
                              (= (at_ ?sh) ?l)
                              (= (docked  ?sh) ?l)
                              (<= (+ (current_fuel ?sh) 200) (fuel_capacity ?sh))
                              )
            :effect (and 
                        (when (<= (+ (current_fuel ?sh) 200) (fuel_capacity ?sh))
                            (increase (current_fuel ?sh) 200))
                        (when (> (+ (current_fuel ?sh) 200) (fuel_capacity ?sh))
                            (increase (current_fuel ?sh) (- (fuel_capacity ?sh) (current_fuel ?sh))))
                        )
            )
    
    (:action refuel_at_platform
            :parameters (?sh - ship ?l - platform)
            :precondition (and
                              (can_refuel ?l)
                              (= (at_ ?sh) ?l)
                              (= (docked  ?sh) ?l)
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

