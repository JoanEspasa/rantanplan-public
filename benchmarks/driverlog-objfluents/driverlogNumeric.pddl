(define (domain driverlog)
  (:requirements :typing :fluents) 

  (:types location locatable - object
		  driver truck obj - locatable)

  (:predicates 
		(link ?x ?y - location)
        (path ?x ?y - location)
		(empty ?v - truck)
)
  (:functions
		(at ?obj - locatable) - location
		(in ?obj - obj) - truck
		(driving ?d - driver) - truck
        (time_to_walk ?l1 ?l2 - location) - number
		(time_to_drive ?l1 ?l2 - location) - number
        )


(:action load_truck 
  :parameters
   (?obj - obj
    ?truck - truck
    ?loc - location)
  :precondition
   (and
    (= (at ?truck) ?loc)
    (= (at ?obj) ?loc))
  :effect
   (and
    (assign (at ?obj) undefined)
    (assign (in ?obj) ?truck)))

(:action unload_truck
  :parameters
   (?obj - obj
    ?truck - truck
    ?loc - location)
  :precondition
   (and
    (= (at ?truck) ?loc)
    (= (in ?obj) ?truck))
  :effect
   (and
    (assign (in ?obj) undefined)
    (assign (at ?obj) ?loc)))

(:action board_truck
  :parameters
   (?driver - driver
    ?truck - truck
    ?loc - location)
  :precondition
   (and
    (= (at ?truck) ?loc)
    (= (at ?driver) ?loc)
    (empty ?truck))
  :effect
   (and
    (assign (at ?driver) undefined)
    (assign (driving ?driver) ?truck)
    (not (empty ?truck))))

(:action disembark_truck
  :parameters
   (?driver - driver
    ?truck - truck
    ?loc - location)
  :precondition
   (and
    (= (at ?truck) ?loc)
    (= (driving ?driver) ?truck))
  :effect
   (and
    (assign (driving ?driver) undefined)
    (assign (at ?driver) ?loc)
    (empty ?truck)))

(:action drive_truck
  :parameters
   (?truck - truck
    ?loc_from - location
    ?loc_to - location
    ?driver - driver)
  :precondition
   (and
    (= (at ?truck) ?loc_from)
    (= (driving ?driver) ?truck)
    (link ?loc_from ?loc_to))
  :effect
   (and 
    (assign (at ?truck) ?loc_to)))

(:action walk
  :parameters
   (?driver - driver
    ?loc_from - location
    ?loc_to - location)
  :precondition
   (and 
    (= (at ?driver) ?loc_from)
    (path ?loc_from ?loc_to))
  :effect
   (and 
    (assign (at ?driver) ?loc_to)))
)
