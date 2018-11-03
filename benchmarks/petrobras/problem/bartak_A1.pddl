(define 
 (problem original)
 (:domain petrobras)

 (:objects
  ship1 - ship
  ship2 - ship
  ship3 - ship

  P1 - port         ; rio
  P2 - port         ; santos
  A1 - waiting_area ; rio waiting
  A2 - waiting_area ; santos waiting

  F1 - platform
  F2 - platform
  F3 - platform
  F4 - platform
  F5 - platform
  F6 - platform
  G1 - platform
  G2 - platform
  G3 - platform
  G4 - platform

  cargo1 - cargo
 )

 (:init

  (= (total_fuel_used) 0)

  (is_waiting_area A1)
  (is_waiting_area A2)
  (at_ ship1 P1)
  (at_ ship2 P1)
  (at_ ship3 P2)

  (docked ship1 P1)
  (docked ship2 P1)
  (docked ship3 P2)

  (= (current_fuel ship1) 600)
  (= (current_fuel ship2) 600)
  (= (current_fuel ship3) 600)

  (= (current_load ship1) 0)
  (= (current_load ship2) 0)
  (= (current_load ship3) 0)

  (= (fuel_capacity ship1) 600)
  (= (load_capacity ship1) 100)
  (= (fuel_capacity ship2) 600)
  (= (load_capacity ship2) 100)
  (= (fuel_capacity ship3) 600)
  (= (load_capacity ship3) 100)

  (= (current_docking_capacity P1) 1)
  (= (current_docking_capacity P2) 1)
  (= (current_docking_capacity A1) 2)
  (= (current_docking_capacity A2) 2)
  (= (current_docking_capacity F1) 1)
  (= (current_docking_capacity F2) 1)
  (= (current_docking_capacity F3) 1)
  (= (current_docking_capacity F4) 1)
  (= (current_docking_capacity F5) 1)
  (= (current_docking_capacity F6) 1)
  (= (current_docking_capacity G1) 1)
  (= (current_docking_capacity G2) 1)
  (= (current_docking_capacity G3) 1)
  (= (current_docking_capacity G4) 1)
  (= (total_docking_capacity P1) 2)
  (= (total_docking_capacity P2) 2)
  (= (total_docking_capacity A1) 2)
  (= (total_docking_capacity A2) 2)
  (= (total_docking_capacity F1) 1)
  (= (total_docking_capacity F2) 1)
  (= (total_docking_capacity F3) 1)
  (= (total_docking_capacity F4) 1)
  (= (total_docking_capacity F5) 1)
  (= (total_docking_capacity F6) 1)
  (= (total_docking_capacity G1) 1)
  (= (total_docking_capacity G2) 1)
  (= (total_docking_capacity G3) 1)
  (= (total_docking_capacity G4) 1)

  (can_refuel P1)
  (can_refuel P2)
  (can_refuel F5)
  (can_refuel G3)

; ==== CARGOS ====
; ================

  (at_ cargo1 P1)

  (= (weight cargo1) 20)

; aux --------------------
  (= (distance P1 P1) 999)
  (= (distance P2 P2) 999)
  (= (distance F1 F1) 999)
  (= (distance F2 F2) 999)
  (= (distance F3 F3) 999)
  (= (distance F4 F4) 999)
  (= (distance F5 F5) 999)
  (= (distance F6 F6) 999)
  (= (distance G1 G1) 999)
  (= (distance G2 G2) 999)
  (= (distance G3 G3) 999)
  (= (distance G4 G4) 999)
  (= (distance A1 A1) 999)
  (= (distance A2 A2) 999)

; ==== DISTANCES ====
; ===================

  (= (distance P1 P2) 200)
  (= (distance P1 F1) 300)
  (= (distance P1 F2) 160)
  (= (distance P1 F3) 280)
  (= (distance P1 F4) 200)
  (= (distance P1 F5) 160)
  (= (distance P1 F6) 130)
  (= (distance P1 G1) 350)
  (= (distance P1 G2) 400)
  (= (distance P1 G3) 450)
  (= (distance P1 G4) 420)
  (= (distance P1 A1) 120)
  (= (distance P1 A2) 270)

  (= (distance P2 P1) 200)
  (= (distance P2 F1) 380)
  (= (distance P2 F2) 290)
  (= (distance P2 F3) 320)
  (= (distance P2 F4) 340)
  (= (distance P2 F5) 270)
  (= (distance P2 F6) 300)
  (= (distance P2 G1) 300)
  (= (distance P2 G2) 180)
  (= (distance P2 G3) 280)
  (= (distance P2 G4) 140)
  (= (distance P2 A1) 270)
  (= (distance P2 A2) 100)

  (= (distance F1 P1) 300)
  (= (distance F1 P2) 380)
  (= (distance F1 F2) 168)
  (= (distance F1 F3) 168)
  (= (distance F1 F4) 120)
  (= (distance F1 F5) 260)
  (= (distance F1 F6) 240)
  (= (distance F1 G1) 468)
  (= (distance F1 G2) 580)
  (= (distance F1 G3) 588)
  (= (distance F1 G4) 600)
  (= (distance F1 A1) 200)
  (= (distance F1 A2) 340)

  (= (distance F2 P1) 160)
  (= (distance F2 P2) 290)
  (= (distance F2 F1) 168)
  (= (distance F2 F3) 240)
  (= (distance F2 F4) 120)
  (= (distance F2 F5) 168)
  (= (distance F2 F6) 120)
  (= (distance F2 G1) 580)
  (= (distance F2 G2) 468)
  (= (distance F2 G3) 600)
  (= (distance F2 G4) 588)
  (= (distance F2 A1) 40)
  (= (distance F2 A2) 380)

  (= (distance F3 P1) 280)
  (= (distance F3 P2) 320)
  (= (distance F3 F1) 168)
  (= (distance F3 F2) 240)
  (= (distance F3 F4) 120)
  (= (distance F3 F5) 168)
  (= (distance F3 F6) 260)
  (= (distance F3 G1) 420)
  (= (distance F3 G2) 380)
  (= (distance F3 G3) 420)
  (= (distance F3 G4) 580)
  (= (distance F3 A1) 320)
  (= (distance F3 A2) 370)

  (= (distance F4 P1) 200)
  (= (distance F4 P2) 340)
  (= (distance F4 F1) 120)
  (= (distance F4 F2) 120)
  (= (distance F4 F3) 120)
  (= (distance F4 F5) 120)
  (= (distance F4 F6) 168)
  (= (distance F4 G1) 500)
  (= (distance F4 G2) 520)
  (= (distance F4 G3) 560)
  (= (distance F4 G4) 580)
  (= (distance F4 A1) 280)
  (= (distance F4 A2) 340)

  (= (distance F5 P1) 160)
  (= (distance F5 P2) 270)
  (= (distance F5 F1) 260)
  (= (distance F5 F2) 168)
  (= (distance F5 F3) 168)
  (= (distance F5 F4) 120)
  (= (distance F5 F6) 120)
  (= (distance F5 G1) 380)
  (= (distance F5 G2) 300)
  (= (distance F5 G3) 580)
  (= (distance F5 G4) 420)
  (= (distance F5 A1) 180)
  (= (distance F5 A2) 280)

  (= (distance F6 P1) 130)
  (= (distance F6 P2) 300)
  (= (distance F6 F1) 240)
  (= (distance F6 F2) 120)
  (= (distance F6 F3) 260)
  (= (distance F6 F4) 168)
  (= (distance F6 F5) 120)
  (= (distance F6 G1) 520)
  (= (distance F6 G2) 500)
  (= (distance F6 G3) 580)
  (= (distance F6 G4) 580)
  (= (distance F6 A1) 80)
  (= (distance F6 A2) 300)

  (= (distance G1 P1) 350)
  (= (distance G1 P2) 300)
  (= (distance G1 F1) 468)
  (= (distance G1 F2) 580)
  (= (distance G1 F3) 420)
  (= (distance G1 F4) 500)
  (= (distance G1 F5) 380)
  (= (distance G1 F6) 520)
  (= (distance G1 G2) 200)
  (= (distance G1 G3) 120)
  (= (distance G1 G4) 260)
  (= (distance G1 A1) 540)
  (= (distance G1 A2) 320)

  (= (distance G2 P1) 400)
  (= (distance G2 P2) 180)
  (= (distance G2 F1) 580)
  (= (distance G2 F2) 468)
  (= (distance G2 F3) 380)
  (= (distance G2 F4) 520)
  (= (distance G2 F5) 300)
  (= (distance G2 F6) 500)
  (= (distance G2 G1) 200)
  (= (distance G2 G3) 260)
  (= (distance G2 G4) 120)
  (= (distance G2 A1) 540)
  (= (distance G2 A2) 110)

  (= (distance G3 P1) 450)
  (= (distance G3 P2) 280)
  (= (distance G3 F1) 588)
  (= (distance G3 F2) 600)
  (= (distance G3 F3) 420)
  (= (distance G3 F4) 560)
  (= (distance G3 F5) 580)
  (= (distance G3 F6) 580)
  (= (distance G3 G1) 120)
  (= (distance G3 G2) 260)
  (= (distance G3 G4) 200)
  (= (distance G3 A1) 580)
  (= (distance G3 A2) 400)

  (= (distance G4 P1) 420)
  (= (distance G4 P2) 140)
  (= (distance G4 F1) 600)
  (= (distance G4 F2) 588)
  (= (distance G4 F3) 580)
  (= (distance G4 F4) 580)
  (= (distance G4 F5) 420)
  (= (distance G4 F6) 580)
  (= (distance G4 G1) 260)
  (= (distance G4 G2) 120)
  (= (distance G4 G3) 200)
  (= (distance G4 A1) 570)
  (= (distance G4 A2) 180)

  (= (distance A1 P1) 120)
  (= (distance A1 P2) 270)
  (= (distance A1 F1) 200)
  (= (distance A1 F2) 40)
  (= (distance A1 F3) 320)
  (= (distance A1 F4) 280)
  (= (distance A1 F5) 180)
  (= (distance A1 F6) 80)
  (= (distance A1 G1) 540)
  (= (distance A1 G2) 540)
  (= (distance A1 G3) 580)
  (= (distance A1 G4) 570)
  (= (distance A1 A2) 340)

  (= (distance A2 P1) 270)
  (= (distance A2 P2) 100)
  (= (distance A2 F1) 340)
  (= (distance A2 F2) 380)
  (= (distance A2 F3) 370)
  (= (distance A2 F4) 340)
  (= (distance A2 F5) 280)
  (= (distance A2 F6) 300)
  (= (distance A2 G1) 320)
  (= (distance A2 G2) 110)
  (= (distance A2 G3) 400)
  (= (distance A2 G4) 180)
  (= (distance A2 A1) 340)

 )

 (:goal
  (and
   (at_ cargo1 F1)  
  )
 )

 ;(:metric minimize (total_fuel_used))

)
