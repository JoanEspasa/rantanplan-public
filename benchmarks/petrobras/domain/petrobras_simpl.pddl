; Petrobras problem
; ==========================================================
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
     (current_fuel ?sh - ship)
     (current_load ?sh - ship)
     (fuel_capacity ?sh - ship)
     (load_capacity ?sh - ship)

     (current_docking_capacity ?p - location)
     (total_docking_capacity ?p - location)

     (distance ?from - location ?to - location)

     (weight ?c - cargo)

     (total_fuel_used)
    )

    (:action sail_empty
            :parameters (?sh - ship ?from - location ?to - location)
            :precondition (and (at_ ?sh ?from)                           
                               (forall (?x - location)
                                   (not (docked ?sh ?x)))
                               (= (current_load ?sh) 0)
                               (>= (current_fuel ?sh) (distance ?from ?to)))
                               ;(>= (current_fuel ?sh) (/ (distance ?from ?to) 5)))
                                
            :effect (and 
                         (at_ ?sh ?to)
                         (not (at_ ?sh ?from))
                         ;(decrease (current_fuel ?sh) (/ (distance ?from ?to) 5))
                          (decrease (current_fuel ?sh) (distance ?from ?to))
                         ;(increase (total_fuel_used) (/ (distance ?from ?to) 5)))
                         ;(increase (total_fuel_used) (distance ?from ?to)))
                         )
    )

    (:action sail_full
            :parameters (?sh - ship ?from - location ?to - location)
            :precondition (and (at_ ?sh ?from)                           
                               (forall (?x - location)
                                   (not (docked ?sh ?x)))
                               (not (= (current_load ?sh) 0))
                               ;(>= (current_fuel ?sh) (/ (distance ?from ?to) 3)))
                               (>= (current_fuel ?sh) (distance ?from ?to)))
                                
            :effect (and 
                         (at_ ?sh ?to)
                         (not (at_ ?sh ?from))
                         ;(decrease (current_fuel ?sh) (/ (distance ?from ?to) 3))
                         (decrease (current_fuel ?sh) (distance ?from ?to))
                         ;(increase (total_fuel_used) (/ (distance ?from ?to) 3)))
                         ;(increase (total_fuel_used) (distance ?from ?to)))
                         )
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

    (:action refuel_at_port
            :parameters (?sh - ship ?l - port)
            :precondition (and
                              (can_refuel ?l)
                              (at_ ?sh ?l)
                              (docked  ?sh ?l)
                              (<= (+ (current_fuel ?sh) 200) (fuel_capacity ?sh))
                              )
            :effect (and 
                            (increase (current_fuel ?sh) 200))
    )

    (:action refuel_at_port_full
            :parameters (?sh - ship ?l - port)
            :precondition (and
                              (can_refuel ?l)
                              (at_ ?sh ?l)
                              (docked  ?sh ?l)
                              (> (+ (current_fuel ?sh) 200) (fuel_capacity ?sh)))
            :effect (and 
                             (assign (current_fuel ?sh) (fuel_capacity ?sh)))
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
                             (increase (current_fuel ?sh) 100))
    )

    (:action refuel_at_platform_full
            :parameters (?sh - ship ?l - platform)
            :precondition (and
                              (can_refuel ?l)
                              (at_ ?sh ?l)
                              (docked  ?sh ?l)
                              (> (+ (current_fuel ?sh) 100) (fuel_capacity ?sh)))
            :effect (and
                             (assign (current_fuel ?sh) (fuel_capacity ?sh)))
    )
)
