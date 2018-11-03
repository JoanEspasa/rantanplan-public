;
; Petrobras problem
; ==========================================================
;
; http://ipc.icaps-conference.org/
; http://icaps12.poli.usp.br/icaps12/ickeps/petrobrasdomain
;

(define (domain petrobras)
    (:requirements :strips :typing :equality)
    
    (:types strip port waiting_area platform - location 
            ship cargo - objects
    ) 

    (:predicates
        (can_refuel ?l - location)
        (is_waiting_area ?l - location)
    )

    (:functions

     (at_ ?sh - objects) - location
     (docked ?sh - ship) - location
     (loaded ?c - cargo) - ship

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
            :precondition (and 
                               (= (at_ ?sh) ?from)                           
                               (not (= (docked ?sh) ?from))
                               (imply (= (current_load ?sh) 0)
                                   (>= (current_fuel ?sh) (/ (distance ?from ?to) 5)))
                               (imply (not (= (current_load ?sh) 0))
                                   (>= (current_fuel ?sh) (/ (distance ?from ?to) 3))))
                                
            :effect (and (assign (at_ ?sh) ?to)
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
                               (not (= (docked ?sh) ?p))
                               (= (at_ ?sh) ?p))
            :effect (and 
                        (decrease (current_docking_capacity ?p) 1)
                        (assign (docked ?sh) ?p))
    )

    (:action undock
            :parameters (?sh - ship ?p - location)
            :precondition (and (= (docked ?sh) ?p))
            :effect (and 
                        (increase (current_docking_capacity ?p) 1)
                        (assign (docked ?sh) undefined))
    )

    (:action load
            :parameters (?p - port ?sh - ship ?c - cargo)
            :precondition (and (>= (load_capacity ?sh) (+ (current_load ?sh) (weight ?c)))
                                (= (docked ?sh) ?p))

            :effect (and 
                        (assign (at_ ?c) undefined)
                        (assign (loaded ?c) ?sh)
                        (increase (current_load ?sh) (weight ?c)))
    )

    (:action unload
            :parameters (?c - cargo ?p - platform ?sh - ship)
            :precondition (and (= (loaded ?c) ?sh)
                            (= (docked ?sh) ?p))
            :effect (and
                        (decrease (current_load ?sh) (weight ?c))
                        (assign (loaded ?c) undefined)
                        (assign (at_ ?c) ?p))
    )

    (:action refuel_at_port
            :parameters (?sh - ship ?l - port)
            :precondition (and
                              (can_refuel ?l)
                              (= (docked  ?sh) ?l)
                              (<= (+ (current_fuel ?sh) 200) (fuel_capacity ?sh)))
            :effect (and 
                        (when (<= (+ (current_fuel ?sh) 200) (fuel_capacity ?sh))
                            (increase (current_fuel ?sh) 200))
                        (when (> (+ (current_fuel ?sh) 200) (fuel_capacity ?sh))
                            (assign (current_fuel ?sh) (fuel_capacity ?sh)))
                        )
            )
    
    (:action refuel_at_platform
            :parameters (?sh - ship ?l - platform)
            :precondition (and
                              (can_refuel ?l)
                              (= (docked  ?sh) ?l)
                              (<= (+ (current_fuel ?sh) 100) (fuel_capacity ?sh)))
            :effect (and
                        (when (<= (+ (current_fuel ?sh) 100) (fuel_capacity ?sh))
                             (increase (current_fuel ?sh) 100))
                        (when (> (+ (current_fuel ?sh) 100) (fuel_capacity ?sh))
                            (assign (current_fuel ?sh) (fuel_capacity ?sh)))
                        )
            )
)

