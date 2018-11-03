(define 
 (problem original)
 (:domain petrobras)

 (:objects
  ship1 - ship

  P1 - port         ; rio
  P2 - port         ; santos

  F1 - platform
  cargo1 - cargo
 )

 (:init

  (= (total_fuel_used) 0)

  (= (at_ ship1) P1)

  (= (docked ship1) undefined)

  (= (current_fuel ship1) 600)
  (= (current_load ship1) 0)
  (= (fuel_capacity ship1) 600)
  (= (load_capacity ship1) 100)
  (can_refuel P1)
  (can_refuel P2)

  (= (at_ cargo1)  P1)
  (= (loaded cargo1) undefined)
  (= (weight cargo1) 20)

; aux --------------------
;  (= (distance P1 P1) 999)
;  (= (distance P2 P2) 999)
;  (= (distance F1 F1) 999)

  (= (current_docking_capacity P1) 1)
  (= (current_docking_capacity P2) 1)
  (= (current_docking_capacity F1) 1)
  (= (total_docking_capacity P1) 2)
  (= (total_docking_capacity P2) 2)
  (= (total_docking_capacity F1) 1)

  (= (distance P1 P2) 200)
  (= (distance P1 F1) 100)

  (= (distance P2 P1) 200)
  (= (distance P2 F1) 100)

  (= (distance F1 P1) 100)
  (= (distance F1 P2) 100)
 )

 (:goal
  (and
     (= (at_ ship1) P2)
     (> (current_load ship1) 0)
  )
 )

 (:metric minimize (total_fuel_used))

)
