; Petrobras problem
; ==========================================================
(define (domain petrobras)
    (:requirements :strips :typing :fluents :equality)
    
    (:types strip port waiting_area platform - location 
            ship cargo - object
    ) 

    (:predicates
        (at_ ?sh - object ?where - location)
        (docked ?sh - ship ?where - location)

        (loaded ?c - cargo ?sh - ship)
        (has_cargo ?sh - ship)

        (has_free_dock ?l - location)
        (is_waiting_area ?l - location)
    )

    (:action sail
            :parameters (?sh - ship ?from - location ?to - location)
            :precondition (and (at_ ?sh ?from)                           
                               (forall (?x - location)
                                   (not (docked ?sh ?x))))
            :effect (and 
                         (at_ ?sh ?to)
                         (not (at_ ?sh ?from)))
    )

    (:action dock
            :parameters (?sh - ship ?p - location)
            :precondition (and 
                               (has_free_dock ?p)
                               (not (docked ?sh ?p))
                               (at_ ?sh ?p))
            :effect (and 
                        (not (has_free_dock ?p))
                        (docked ?sh ?p))
    )

    (:action undock
            :parameters (?sh - ship ?p - location)
            :precondition (and
                             (docked ?sh ?p)
                             (at_ ?sh ?p))
            :effect (and 
                        (has_free_dock ?p)
                        (not (docked ?sh ?p)))
    )

    (:action load
            :parameters (?p - location ?sh - ship ?c - cargo)
            :precondition (and
                                (not (has_cargo ?sh))
                                (at_ ?c ?p)
                                (docked ?sh ?p))

            :effect (and 
                        (not (at_ ?c ?p))
                        (loaded ?c ?sh)
                        (has_cargo ?sh))
    )

    (:action unload
            :parameters (?c - cargo ?p - location ?sh - ship)
            :precondition (and
                            (at_ ?sh ?p)
                            (loaded ?c ?sh)
                            (docked ?sh ?p))
            :effect (and
                        (not (has_cargo ?sh))
                        (not (loaded ?c ?sh))
                        (at_ ?c ?p))
    )
)
