(define (domain driverlog)
  (:requirements :typing :fluents) 
  (:types           location locatable - object
		driver truck obj - locatable)

  (:predicates 
		(at ?obj - locatable ?loc - location)
		(in ?obj1 - obj ?obj - truck)
		(driving ?d - driver ?v - truck)
		(link ?x ?y - location) (path ?x ?y - location)
		(empty ?v - truck)
)
  (:functions (time_to_walk ?l1 ?l2 - location)
		(time_to_drive ?l1 ?l2 - location)
		(driven)
		(walked))


(:action load_truck 
  :parameters
   (?obj - obj
    ?truck - truck
    ?loc - location)
  :precondition
   (and (at ?truck ?loc) (at ?obj ?loc))
  :effect
   (and (not (at ?obj ?loc)) (in ?obj ?truck)))

(:action unload_truck
  :parameters
   (?obj - obj
    ?truck - truck
    ?loc - location)
  :precondition
   (and (at ?truck ?loc) (in ?obj ?truck))
  :effect
   (and (not (in ?obj ?truck)) (at ?obj ?loc)))

(:action board_truck 
  :parameters
   (?driver - driver
    ?truck - truck
    ?loc - location)
  :precondition
   (and (at ?truck ?loc) (at ?driver ?loc) (empty ?truck))
  :effect
   (and (not (at ?driver ?loc)) (driving ?driver ?truck) (not (empty ?truck))))

(:action disembark_truck
  :parameters
   (?driver - driver
    ?truck - truck
    ?loc - location)
  :precondition
   (and (at ?truck ?loc) (driving ?driver ?truck))
  :effect
   (and (not (driving ?driver ?truck)) (at ?driver ?loc) (empty ?truck)))

(:action drive_truck 
  :parameters
   (?truck - truck
    ?loc_from - location
    ?loc_to - location
    ?driver - driver)
  :precondition
   (and (at ?truck ?loc_from)
   (driving ?driver ?truck) (link ?loc_from ?loc_to))
  :effect
   (and (not (at ?truck ?loc_from)) (at ?truck ?loc_to)
		(increase (driven) (time_to_drive ?loc_from ?loc_to))))

(:action walk 
  :parameters
   (?driver - driver
    ?loc_from - location
    ?loc_to - location)
  :precondition
   (and (at ?driver ?loc_from) (path ?loc_from ?loc_to))
  :effect
   (and (not (at ?driver ?loc_from)) (at ?driver ?loc_to)
	(increase (walked) (time_to_walk ?loc_from ?loc_to))))
 
)
